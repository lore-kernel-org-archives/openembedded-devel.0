Return-Path: <B40869@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0209.outbound.protection.outlook.com [207.46.163.209])
	by mail.openembedded.org (Postfix) with ESMTP id 71BEC708E2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 10:21:50 +0000 (UTC)
Received: from BN3PR0301CA0035.namprd03.prod.outlook.com (25.160.180.173) by
	BY2PR0301MB0757.namprd03.prod.outlook.com (25.160.63.26) with Microsoft
	SMTP Server (TLS) id 15.0.995.14; Thu, 31 Jul 2014 10:21:37 +0000
Received: from BL2FFO11FD026.protection.gbl (2a01:111:f400:7c09::150) by
	BN3PR0301CA0035.outlook.office365.com (2a01:111:e400:4000::45) with
	Microsoft SMTP Server (TLS) id 15.0.995.14 via Frontend Transport;
	Thu, 31 Jul 2014 10:21:36 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD026.mail.protection.outlook.com (10.173.161.105) with
	Microsoft SMTP Server (TLS) id 15.0.990.10 via Frontend Transport;
	Thu, 31 Jul 2014 10:21:36 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s6VALYST017129; Thu, 31 Jul 2014 03:21:35 -0700
From: YangHaibo <b40869@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Jul 2014 18:14:33 +0800
Message-ID: <1406801673-15255-1-git-send-email-b40869@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(377424004)(88136002)(86362001)(46102001)(21056001)(15395725005)(107046002)(93916002)(50226001)(68736004)(77156001)(16601075003)(4396001)(97736001)(74662001)(102836001)(15202345003)(575784001)(79102001)(229853001)(105606002)(104016003)(31966008)(15975445006)(77982001)(36756003)(87936001)(104166001)(48376002)(76482001)(26826002)(50466002)(84676001)(92726001)(83072002)(99396002)(85306003)(62966002)(92566001)(95666004)(85852003)(33646002)(106466001)(20776003)(81342001)(80022001)(2351001)(110136001)(81542001)(44976005)(87286001)(74502001)(64706001)(6806004)(83322001)(47776003)(50986999)(89996001)(19580395003)(19580405001);
	DIR:OUT; SFP:; SCL:1; SRVR:BY2PR0301MB0757;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 0289B6431E
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40869@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: YangHaibo <b40869@freescale.com>
Subject: [meta-oe][PATCH] meta-oe: Add OML lincence and recipe for fastcgi
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
X-List-Received-Date: Thu, 31 Jul 2014 10:21:51 -0000
Content-Type: text/plain

Fastcgi version: 2.4.0

Upstream-Status: Submitted [openembedded-devel@lists.openembedded.org]

Signed-off-by: Yang Haibo <b40869@freescale.com>
---
 meta-oe/licenses/OML                               | 28 ++++++++++++++++++++++
 meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb     | 16 +++++++++++++
 .../fcgi/files/Fix_EOF_not_declared_issue.patch    | 15 ++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 meta-oe/licenses/OML
 create mode 100644 meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb
 create mode 100644 meta-webserver/recipes-fcgi/fcgi/files/Fix_EOF_not_declared_issue.patch

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
diff --git a/meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb b/meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb
new file mode 100644
index 0000000..ceb5909
--- /dev/null
+++ b/meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "FastCGI is a protocol for interfacing interactive programs with a web server."
+HOMEPAGE = "http://www.fastcgi.com"
+LICENSE = "OML"
+LIC_FILES_CHKSUM = "file://LICENSE.TERMS;md5=e3aacac3a647af6e7e31f181cda0a06a"
+
+SRC_URI = "http://fossies.org/linux/www/fcgi-2.4.0.tar.gz \
+           file://Fix_EOF_not_declared_issue.patch \
+"
+SRC_URI[md5sum] = "d15060a813b91383a9f3c66faf84867e"
+SRC_URI[sha256sum] = "66fc45c6b36a21bf2fbbb68e90f780cc21a9da1fffbae75e76d2b4402d3f05b9"
+
+S = "${WORKDIR}/${BPN}-${PV}/"
+
+inherit autotools
+
+PARALLEL_MAKE = ""
diff --git a/meta-webserver/recipes-fcgi/fcgi/files/Fix_EOF_not_declared_issue.patch b/meta-webserver/recipes-fcgi/fcgi/files/Fix_EOF_not_declared_issue.patch
new file mode 100644
index 0000000..f382142
--- /dev/null
+++ b/meta-webserver/recipes-fcgi/fcgi/files/Fix_EOF_not_declared_issue.patch
@@ -0,0 +1,15 @@
+Fix EOF not declared issue
+
+Error like:
+fcgio.cpp:70:72: error: 'EOF' was not declared in this scope
+              if (FCGX_PutStr(pbase(), plen, this->fcgx) != plen) return EOF;
+--- fcgi-ori/libfcgi/fcgio.cpp	2014-07-28 18:01:00.000000000 +0800
++++ fcgi-2.4.0/libfcgi/fcgio.cpp	2014-07-28 18:01:22.000000000 +0800
+@@ -22,6 +22,7 @@
+ #define DLLAPI  __declspec(dllexport)
+ #endif
+ 
++#include <stdio.h>
+ #include <limits.h>
+ #include "fcgio.h"
+ 
-- 
1.9.2


