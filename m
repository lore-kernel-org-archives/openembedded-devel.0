Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TfrGM-0004WO-Na
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 13:06:11 +0100
Received: from localhost ([127.0.0.1]:60360 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1Tfr2R-000783-9E; Tue, 04 Dec 2012 11:51:47 +0000
Received: from [195.171.99.130] (port=9691 helo=archhp.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1Tfr2R-00077t-4D; Tue, 04 Dec 2012 11:51:47 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 11:53:38 +0000
Message-Id: <1354622018-17958-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.0.1
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-webserver][PATCH] hiawatha: add new patch to fix xslt implementation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 12:06:11 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 .../recipes-httpd/hiawatha/files/xslt-fix.patch    | 71 ++++++++++++++++++++++
 .../recipes-httpd/hiawatha/hiawatha_8.6.bb         |  3 +-
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch

diff --git a/meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch b/meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch
new file mode 100644
index 0000000..41bf4cc
--- /dev/null
+++ b/meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch
@@ -0,0 +1,71 @@
+Upstream Status: Backport
+Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
+---
+ src/xslt.c | 19 +++++++------------
+ 1 file changed, 7 insertions(+), 12 deletions(-)
+
+diff --git a/src/xslt.c b/src/xslt.c
+index 9d8d31a..58ca52d 100644
+--- a/src/xslt.c
++++ b/src/xslt.c
+@@ -23,6 +23,7 @@
+ #include <libxslt/transform.h>
+ #include <libxslt/xsltutils.h>
+ #include "libstr.h"
++#include "liblist.h"
+ #include "send.h"
+ #include "log.h"
+ #ifdef ENABLE_TOMAHAWK
+@@ -343,10 +344,10 @@ bool can_transform_with_xslt(t_session *session) {
+ static int apply_xslt_sheet(t_session *session, xmlDocPtr data_xml) {
+ 	xmlDocPtr style_xml, result_xml;
+ 	xsltStylesheetPtr xslt;
+-	xmlOutputBufferPtr output;
++	xmlChar *raw_xml;
+ 	char value[VALUE_SIZE + 1];
+ 	const char **params;
+-	int result = 200;
++	int result = 200, raw_size;
+ 
+ 	/* Read XML data
+ 	 */
+@@ -396,14 +397,8 @@ static int apply_xslt_sheet(t_session *session, xmlDocPtr data_xml) {
+ 		xsltFreeStylesheet(xslt);
+ 		return 500;
+ 	}
+-	if ((output = xmlAllocOutputBuffer(NULL)) == NULL) {
+-		xmlFreeDoc(result_xml);
+-		xsltFreeStylesheet(xslt);
+-		return 500;
+-	}
+-    if (xsltSaveResultTo(output, result_xml, xslt) == -1) {
++	if (xsltSaveResultToString(&raw_xml, &raw_size, result_xml, xslt) == -1) {
+ 		log_file_error(session, session->file_on_disk, "transformation error");
+-		xmlOutputBufferClose(output);
+ 		xmlFreeDoc(result_xml);
+ 		xsltFreeStylesheet(xslt);
+ 		return 500;
+@@ -414,17 +409,17 @@ static int apply_xslt_sheet(t_session *session, xmlDocPtr data_xml) {
+ 	value[VALUE_SIZE] = '\0';
+ 	if (send_buffer(session, hs_conlen, 16) == -1) {
+ 		result = -1;
+-	} else if (snprintf(value, VALUE_SIZE, "%d\r\n\r\n", output->buffer->use) == -1) {
++	} else if (snprintf(value, VALUE_SIZE, "%d\r\n\r\n", raw_size) == -1) {
+ 		result = -1;
+ 	} else if (send_buffer(session, value, strlen(value)) == -1) {
+ 		result = -1;
+-	} else if (send_buffer(session, (char*)output->buffer->content, output->buffer->use) == -1) {
++	} else if (send_buffer(session, (char*)raw_xml, raw_size) == -1) {
+ 		result = -1;
+ 	}
+ 
+ 	/* Free buffers
+ 	 */
+-	xmlOutputBufferClose(output);
++	xmlFree(raw_xml);
+ 	xmlFreeDoc(result_xml);
+ 	xsltFreeStylesheet(xslt);
+ 
+-- 
+1.8.0.1
+
diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
index 7dcbe9e..0a5b303 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
@@ -9,7 +9,8 @@ PR = "r1"
 SECTION = "net"
 
 SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
-           file://hiawatha-init"
+           file://hiawatha-init \
+           file://xslt-fix.patch "
 
 SRC_URI[md5sum] = "372ea9e8329ed36e4fb781fdc1a6734c"
 SRC_URI[sha256sum] = "1a7fa98ce66beb54fc8490cc787461d719a98cb0e4a81caedfa18ac8b5ba3b3b"
-- 
1.8.0.1



