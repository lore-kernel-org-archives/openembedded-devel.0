Return-Path: <B40869@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0211.outbound.protection.outlook.com [207.46.163.211])
	by mail.openembedded.org (Postfix) with ESMTP id 163E060196
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Aug 2014 07:39:11 +0000 (UTC)
Received: from BN3PR0301CA0055.namprd03.prod.outlook.com (25.160.152.151) by
	CY1PR0301MB0764.namprd03.prod.outlook.com (25.160.160.12) with
	Microsoft SMTP
	Server (TLS) id 15.0.995.14; Tue, 5 Aug 2014 07:39:05 +0000
Received: from BN1BFFO11FD022.protection.gbl (2a01:111:f400:7c10::1:184) by
	BN3PR0301CA0055.outlook.office365.com (2a01:111:e400:401e::23) with
	Microsoft
	SMTP Server (TLS) id 15.0.995.14 via Frontend Transport; Tue, 5 Aug 2014
	07:39:05 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD022.mail.protection.outlook.com (10.58.144.85) with
	Microsoft SMTP Server (TLS) id 15.0.990.10 via Frontend Transport;
	Tue, 5 Aug 2014 07:39:04 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s757d2oc010192;
	Tue, 5 Aug 2014 00:39:03 -0700
From: YangHaibo <b40869@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Aug 2014 15:31:33 +0800
Message-ID: <1407223893-7560-1-git-send-email-b40869@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(377424004)(199002)(189002)(86362001)(77156001)(104016003)(110136001)(15975445006)(15395725005)(46102001)(575784001)(93916002)(47776003)(64706001)(20776003)(21056001)(15202345003)(50466002)(69596002)(106466001)(76482001)(68736004)(33646002)(104166001)(36756003)(77982001)(6806004)(105606002)(81156004)(48376002)(2351001)(107046002)(50226001)(229853001)(4396001)(84676001)(79102001)(16601075003)(95666004)(102836001)(62966002)(26826002)(92566001)(19580395003)(92726001)(99396002)(87286001)(81342001)(89996001)(87936001)(97736001)(50986999)(88136002)(19580405001)(81542001)(85306004)(74662001)(31966008)(74502001)(80022001)(83072002)(85852003)(83322001)(44976005);
	DIR:OUT; SFP:; SCL:1; SRVR:CY1PR0301MB0764;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 02945962BD
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=B40869@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: YangHaibo <b40869@freescale.com>
Subject: [meta-oe][meta-webserver][PATCH v4] integrate fcgi-2.4.0 and add OML license file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Aug 2014 07:39:12 -0000
Content-Type: text/plain

Signed-off-by: YangHaibo <b40869@freescale.com>
---
 meta-oe/licenses/OML                               | 28 ++++++++++++++++++++++
 .../fcgi/fcgi/Fix_EOF_not_declared_issue.patch     | 17 +++++++++++++
 .../fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch     | 18 ++++++++++++++
 meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb     | 15 ++++++++++++
 4 files changed, 78 insertions(+)
 create mode 100644 meta-oe/licenses/OML
 create mode 100644 meta-webserver/recipes-fcgi/fcgi/fcgi/Fix_EOF_not_declared_issue.patch
 create mode 100644 meta-webserver/recipes-fcgi/fcgi/fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch
 create mode 100644 meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb

diff --git a/meta-oe/licenses/OML b/meta-oe/licenses/OML
new file mode 100644
index 0000000..7e6bdfd
--- /dev/null
+++ b/meta-oe/licenses/OML
@@ -0,0 +1,28 @@
+This FastCGI application library source and object code (the
+"Software") and its documentation (the "Documentation") are
+copyrighted by Open Market, Inc ("Open Market").  The following terms
+apply to all files associated with the Software and Documentation
+unless explicitly disclaimed in individual files.
+
+Open Market permits you to use, copy, modify, distribute, and license
+this Software and the Documentation for any purpose, provided that
+existing copyright notices are retained in all copies and that this
+notice is included verbatim in any distributions.  No written
+agreement, license, or royalty fee is required for any of the
+authorized uses.  Modifications to this Software and Documentation may
+be copyrighted by their authors and need not follow the licensing
+terms described here.  If modifications to this Software and
+Documentation have new licensing terms, the new terms must be clearly
+indicated on the first page of each file where they apply.
+
+OPEN MARKET MAKES NO EXPRESS OR IMPLIED WARRANTY WITH RESPECT TO THE
+SOFTWARE OR THE DOCUMENTATION, INCLUDING WITHOUT LIMITATION ANY
+WARRANTY OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  IN
+NO EVENT SHALL OPEN MARKET BE LIABLE TO YOU OR ANY THIRD PARTY FOR ANY
+DAMAGES ARISING FROM OR RELATING TO THIS SOFTWARE OR THE
+DOCUMENTATION, INCLUDING, WITHOUT LIMITATION, ANY INDIRECT, SPECIAL OR
+CONSEQUENTIAL DAMAGES OR SIMILAR DAMAGES, INCLUDING LOST PROFITS OR
+LOST DATA, EVEN IF OPEN MARKET HAS BEEN ADVISED OF THE POSSIBILITY OF
+SUCH DAMAGES.  THE SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS".
+OPEN MARKET HAS NO LIABILITY IN CONTRACT, TORT, NEGLIGENCE OR
+OTHERWISE ARISING OUT OF THIS SOFTWARE OR THE DOCUMENTATION.
diff --git a/meta-webserver/recipes-fcgi/fcgi/fcgi/Fix_EOF_not_declared_issue.patch b/meta-webserver/recipes-fcgi/fcgi/fcgi/Fix_EOF_not_declared_issue.patch
new file mode 100644
index 0000000..51ddeaa
--- /dev/null
+++ b/meta-webserver/recipes-fcgi/fcgi/fcgi/Fix_EOF_not_declared_issue.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Pending
+
+Fix EOF not declared issue, following is the error log.
+fcgio.cpp:70:72: error: 'EOF' was not declared in this scope
+              if (FCGX_PutStr(pbase(), plen, this->fcgx) != plen) return EOF;
+
+Signed-off-by: Yang Haibo <b40869@freescale.com>
+--- fcgi-ori/libfcgi/fcgio.cpp 2014-07-28 18:01:00.000000000 +0800
++++ fcgi-2.4.0/libfcgi/fcgio.cpp       2014-07-28 18:01:22.000000000 +0800
+@@ -22,6 +22,7 @@
+ #define DLLAPI  __declspec(dllexport)
+ #endif
+
++#include <stdio.h>
+ #include <limits.h>
+ #include "fcgio.h"
+
diff --git a/meta-webserver/recipes-fcgi/fcgi/fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch b/meta-webserver/recipes-fcgi/fcgi/fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch
new file mode 100644
index 0000000..eca694a
--- /dev/null
+++ b/meta-webserver/recipes-fcgi/fcgi/fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch
@@ -0,0 +1,18 @@
+Upstream-Status: Pending
+
+use automake options "foreign" to set the strictness as appropriate
+
+Signed-off-by: Yang Haibo <b40869@freescale.com>
+--- fcgi-ori/configure.in	2014-08-05 14:58:35.000000000 +0800
++++ fcgi-2.4.0/configure.in	2014-08-05 14:59:08.000000000 +0800
+@@ -4,8 +4,8 @@
+ dnl     generate the file "configure", which is run during the build
+ dnl     to configure the system for the local environment.
+ 
+-AC_INIT
+-AM_INIT_AUTOMAKE(fcgi, 2.4.0)
++AC_INIT([fcgi], [2.4.0])
++AM_INIT_AUTOMAKE([foreign])
+ 
+ AM_CONFIG_HEADER(fcgi_config.h)
+ 
diff --git a/meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb b/meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb
new file mode 100644
index 0000000..ed718ae
--- /dev/null
+++ b/meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "FastCGI is a protocol for interfacing interactive programs with a web server."
+HOMEPAGE = "http://www.fastcgi.com"
+LICENSE = "OML"
+LIC_FILES_CHKSUM = "file://LICENSE.TERMS;md5=e3aacac3a647af6e7e31f181cda0a06a"
+
+SRC_URI = "http://fossies.org/linux/www/${BP}.tar.gz \
+           file://Fix_EOF_not_declared_issue.patch \
+           file://add_foreign_to_AM_INIT_AUTOMAKE.patch \
+"
+SRC_URI[md5sum] = "d15060a813b91383a9f3c66faf84867e"
+SRC_URI[sha256sum] = "66fc45c6b36a21bf2fbbb68e90f780cc21a9da1fffbae75e76d2b4402d3f05b9"
+
+inherit autotools
+
+PARALLEL_MAKE = ""
-- 
1.9.2


