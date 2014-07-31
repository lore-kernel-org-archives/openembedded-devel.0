Return-Path: <B40869@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(dns-bn1lp0143.outbound.protection.outlook.com [207.46.163.143])
	by mail.openembedded.org (Postfix) with ESMTP id E911B7098C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 10:48:14 +0000 (UTC)
Received: from BN3PR0301CA0032.namprd03.prod.outlook.com (25.160.180.170) by
	CY1PR0301MB0762.namprd03.prod.outlook.com (25.160.159.156) with
	Microsoft
	SMTP Server (TLS) id 15.0.995.14; Thu, 31 Jul 2014 10:48:14 +0000
Received: from BY2FFO11FD034.protection.gbl (2a01:111:f400:7c0c::144) by
	BN3PR0301CA0032.outlook.office365.com (2a01:111:e400:4000::42) with
	Microsoft SMTP Server (TLS) id 15.0.995.14 via Frontend Transport;
	Thu, 31 Jul 2014 10:48:13 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD034.mail.protection.outlook.com (10.1.14.219) with Microsoft
	SMTP Server (TLS) id 15.0.990.10 via Frontend Transport;
	Thu, 31 Jul 2014 10:48:12 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s6VAm9K4007027; Thu, 31 Jul 2014 03:48:11 -0700
From: YangHaibo <b40869@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Jul 2014 18:41:07 +0800
Message-ID: <1406803267-2669-1-git-send-email-b40869@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(377424004)(19580395003)(85852003)(44976005)(88136002)(575784001)(15202345003)(31966008)(92726001)(15395725005)(97736001)(83322001)(6806004)(86362001)(83072002)(99396002)(19580405001)(93916002)(87936001)(62966002)(102836001)(16601075003)(50986999)(36756003)(21056001)(4396001)(105606002)(50226001)(48376002)(87286001)(77156001)(104016003)(110136001)(20776003)(95666004)(47776003)(64706001)(80022001)(15975445006)(81342001)(33646002)(79102001)(76482001)(2351001)(107046002)(104166001)(26826002)(50466002)(85306003)(89996001)(229853001)(81542001)(46102001)(92566001)(106466001)(74502001)(77982001)(68736004)(84676001)(74662001);
	DIR:OUT; SFP:; SCL:1; SRVR:CY1PR0301MB0762;
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
Subject: [meta-webserver][PATCH v2] fcgi: integrate fcgi-2.4.0 and add OML license file
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
X-List-Received-Date: Thu, 31 Jul 2014 10:48:15 -0000
Content-Type: text/plain

---
 meta-oe/licenses/OML                               | 28 ++++++++++++++++++++++
 meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb     | 16 +++++++++++++
 .../fcgi/files/Fix_EOF_not_declared_issue.patch    | 17 +++++++++++++
 3 files changed, 61 insertions(+)
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
index 0000000..b4cf080
--- /dev/null
+++ b/meta-webserver/recipes-fcgi/fcgi/files/Fix_EOF_not_declared_issue.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Pending
+
+Fix EOF not declared issue, following is the error log.
+fcgio.cpp:70:72: error: 'EOF' was not declared in this scope
+              if (FCGX_PutStr(pbase(), plen, this->fcgx) != plen) return EOF;
+
+Signed-off-by: Yang Haibo <b40869@freescale.com>
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


