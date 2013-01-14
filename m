Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TukX2-00075D-WC
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 14:57:07 +0100
From: ml@communistcode.co.uk
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Jan 2013 13:41:29 +0000
Message-Id: <1358170889-23714-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.1
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH] hiawatha: update to 8.7
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
X-List-Received-Date: Mon, 14 Jan 2013 13:57:07 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 .../recipes-httpd/hiawatha/files/xslt-fix.patch    | 71 ----------------------
 .../recipes-httpd/hiawatha/hiawatha_8.7.bb         | 56 +++++++++++++++++
 2 files changed, 56 insertions(+), 71 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch
 create mode 100644 meta-webserver/recipes-httpd/hiawatha/hiawatha_8.7.bb

diff --git a/meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch b/meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch
deleted file mode 100644
index 41bf4cc..0000000
--- a/meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-Upstream Status: Backport
-Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
----
- src/xslt.c | 19 +++++++------------
- 1 file changed, 7 insertions(+), 12 deletions(-)
-
-diff --git a/src/xslt.c b/src/xslt.c
-index 9d8d31a..58ca52d 100644
---- a/src/xslt.c
-+++ b/src/xslt.c
-@@ -23,6 +23,7 @@
- #include <libxslt/transform.h>
- #include <libxslt/xsltutils.h>
- #include "libstr.h"
-+#include "liblist.h"
- #include "send.h"
- #include "log.h"
- #ifdef ENABLE_TOMAHAWK
-@@ -343,10 +344,10 @@ bool can_transform_with_xslt(t_session *session) {
- static int apply_xslt_sheet(t_session *session, xmlDocPtr data_xml) {
- 	xmlDocPtr style_xml, result_xml;
- 	xsltStylesheetPtr xslt;
--	xmlOutputBufferPtr output;
-+	xmlChar *raw_xml;
- 	char value[VALUE_SIZE + 1];
- 	const char **params;
--	int result = 200;
-+	int result = 200, raw_size;
- 
- 	/* Read XML data
- 	 */
-@@ -396,14 +397,8 @@ static int apply_xslt_sheet(t_session *session, xmlDocPtr data_xml) {
- 		xsltFreeStylesheet(xslt);
- 		return 500;
- 	}
--	if ((output = xmlAllocOutputBuffer(NULL)) == NULL) {
--		xmlFreeDoc(result_xml);
--		xsltFreeStylesheet(xslt);
--		return 500;
--	}
--    if (xsltSaveResultTo(output, result_xml, xslt) == -1) {
-+	if (xsltSaveResultToString(&raw_xml, &raw_size, result_xml, xslt) == -1) {
- 		log_file_error(session, session->file_on_disk, "transformation error");
--		xmlOutputBufferClose(output);
- 		xmlFreeDoc(result_xml);
- 		xsltFreeStylesheet(xslt);
- 		return 500;
-@@ -414,17 +409,17 @@ static int apply_xslt_sheet(t_session *session, xmlDocPtr data_xml) {
- 	value[VALUE_SIZE] = '\0';
- 	if (send_buffer(session, hs_conlen, 16) == -1) {
- 		result = -1;
--	} else if (snprintf(value, VALUE_SIZE, "%d\r\n\r\n", output->buffer->use) == -1) {
-+	} else if (snprintf(value, VALUE_SIZE, "%d\r\n\r\n", raw_size) == -1) {
- 		result = -1;
- 	} else if (send_buffer(session, value, strlen(value)) == -1) {
- 		result = -1;
--	} else if (send_buffer(session, (char*)output->buffer->content, output->buffer->use) == -1) {
-+	} else if (send_buffer(session, (char*)raw_xml, raw_size) == -1) {
- 		result = -1;
- 	}
- 
- 	/* Free buffers
- 	 */
--	xmlOutputBufferClose(output);
-+	xmlFree(raw_xml);
- 	xmlFreeDoc(result_xml);
- 	xsltFreeStylesheet(xslt);
- 
--- 
-1.8.0.1
-
diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.7.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.7.bb
new file mode 100644
index 0000000..a5c79ca
--- /dev/null
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.7.bb
@@ -0,0 +1,56 @@
+DESCRIPTION = "Lightweight secure web server"
+HOMEPAGE = "http://www.hiawatha-webserver.org"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
+DEPENDS = "libxml2 libxslt"
+
+SECTION = "net"
+
+SRC_URI = "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
+           file://hiawatha-init "
+
+SRC_URI[md5sum] = "712b1822ef525153dc4347417252768d"
+SRC_URI[sha256sum] = "c35e1e975962e1105d7914f74901e304ba90681985c94236c113eaca502b5e34"
+
+inherit cmake update-rc.d
+
+INITSCRIPT_NAME = "hiawatha"
+INITSCRIPT_PARAMS = "defaults 70"
+
+EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
+                  -DENABLE_CACHE=OFF \
+                  -DENABLE_DEBUG=OFF \
+                  -DENABLE_SSL=OFF \
+                  -DENABLE_TOOLKIT=OFF \
+                  -DENABLE_CHROOT=OFF \
+                  -DENABLE_XSLT=ON \
+                  -DENABLE_TOMAHAWK=OFF \
+                  -DCMAKE_INSTALL_MANDIR=${mandir} \
+                  -DCMAKE_INSTALL_BINDIR=${bindir} \
+                  -DCMAKE_INSTALL_SBINDIR=${sbindir} \
+                  -DCMAKE_INSTALL_SYSCONFDIR=${sysconfdir} \
+                  -DCMAKE_INSTALL_LIBDIR=${libdir} \
+                  -DLOG_DIR=/var/log/hiawatha \
+                  -DPID_DIR=/var/run \
+                  -DWEBROOT_DIR=/var/www/hiawatha \
+                  -DWORK_DIR=/var/lib/hiawatha "
+
+do_install_append() {
+    # Copy over init script and sed in the correct sbin path
+    sed -i 's,sed_sbin_path,${sbindir},' ${WORKDIR}/hiawatha-init
+    mkdir -p ${D}${sysconfdir}/init.d
+    mkdir -p ${D}/var/log/hiawatha
+    install -m 0755 ${WORKDIR}/hiawatha-init ${D}${sysconfdir}/init.d/hiawatha
+
+    # configure php-fcgi to have a working configuration
+    # by default if php is installed
+    echo "Server = ${bindir}/php-cgi ; 2 ; 127.0.0.1:2005 ; nobody:nobody ; ${sysconfdir}/php/hiawatha-php5/php.ini" >> ${D}${sysconfdir}/hiawatha/php-fcgi.conf
+}
+
+CONFFILES_${PN} = " \
+    ${sysconfdir}/hiawatha/cgi-wrapper.conf \
+    ${sysconfdir}/hiawatha/hiawatha.conf \
+    ${sysconfdir}/hiawatha/index.xslt \
+    ${sysconfdir}/hiawatha/mimetype.conf \
+    ${sysconfdir}/hiawatha/php-fcgi.conf \
+    "
-- 
1.8.1



