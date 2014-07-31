Return-Path: <B40869@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0241.outbound.protection.outlook.com [207.46.163.241])
	by mail.openembedded.org (Postfix) with ESMTP id E355A709B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 10:49:13 +0000 (UTC)
Received: from BN1PR0301MB0756.namprd03.prod.outlook.com (25.160.78.150) by
	BN1PR0301MB0755.namprd03.prod.outlook.com (25.160.78.15) with Microsoft
	SMTP Server (TLS) id 15.0.995.14; Thu, 31 Jul 2014 10:49:12 +0000
Received: from BN1PR0301MB0756.namprd03.prod.outlook.com ([25.160.78.150]) by
	BN1PR0301MB0756.namprd03.prod.outlook.com ([25.160.78.150]) with
	mapi id 15.00.0995.014; Thu, 31 Jul 2014 10:49:12 +0000
From: "B40869@freescale.com" <B40869@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] meta-oe: Add OML lincence and recipe for fastcgi
Thread-Index: AQHPrKk37c4d4KdEZ0a1Jqg/7PO+QJu6AJ6M
Date: Thu, 31 Jul 2014 10:49:11 +0000
Message-ID: <1406804276758.51849@freescale.com>
References: <1406801673-15255-1-git-send-email-b40869@freescale.com>
In-Reply-To: <1406801673-15255-1-git-send-email-b40869@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.158.211]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(6009001)(377454003)(189002)(199002)(377424004)(107046002)(110136001)(85306003)(85852003)(66066001)(106356001)(2351001)(76482001)(95666004)(99286002)(105586002)(15975445006)(77096002)(19580395003)(83072002)(107886001)(21056001)(101416001)(106116001)(54356999)(50986999)(76176999)(83322001)(46102001)(15395725005)(92726001)(74662001)(74502001)(87936001)(20776003)(79102001)(36756003)(77982001)(80022001)(81542001)(86362001)(15202345003)(31966008)(16601075003)(92566001)(4396001)(19580405001)(81342001)(575784001)(2656002)(64706001);
	DIR:OUT; SFP:; SCL:1; SRVR:BN1PR0301MB0755;
	H:BN1PR0301MB0756.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-oe][PATCH] meta-oe: Add OML lincence and recipe for fastcgi
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
X-List-Received-Date: Thu, 31 Jul 2014 10:49:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Send a new patch: =0A=
[meta-webserver][PATCH v2] fcgi: integrate fcgi-2.4.0 and add OML license f=
ile=0A=
________________________________________=0A=
From: YangHaibo <b40869@freescale.com>=0A=
Sent: Thursday, July 31, 2014 6:14 PM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Cc: Yang Haibo-B40869=0A=
Subject: [meta-oe][PATCH] meta-oe: Add OML lincence and recipe for fastcgi=
=0A=
=0A=
Fastcgi version: 2.4.0=0A=
=0A=
Upstream-Status: Submitted [openembedded-devel@lists.openembedded.org]=0A=
=0A=
Signed-off-by: Yang Haibo <b40869@freescale.com>=0A=
---=0A=
 meta-oe/licenses/OML                               | 28 ++++++++++++++++++=
++++=0A=
 meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb     | 16 +++++++++++++=0A=
 .../fcgi/files/Fix_EOF_not_declared_issue.patch    | 15 ++++++++++++=0A=
 3 files changed, 59 insertions(+)=0A=
 create mode 100644 meta-oe/licenses/OML=0A=
 create mode 100644 meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb=0A=
 create mode 100644 meta-webserver/recipes-fcgi/fcgi/files/Fix_EOF_not_decl=
ared_issue.patch=0A=
=0A=
diff --git a/meta-oe/licenses/OML b/meta-oe/licenses/OML=0A=
new file mode 100644=0A=
index 0000000..7e6bdfd=0A=
--- /dev/null=0A=
+++ b/meta-oe/licenses/OML=0A=
@@ -0,0 +1,28 @@=0A=
+This FastCGI application library source and object code (the=0A=
+"Software") and its documentation (the "Documentation") are=0A=
+copyrighted by Open Market, Inc ("Open Market").  The following terms=0A=
+apply to all files associated with the Software and Documentation=0A=
+unless explicitly disclaimed in individual files.=0A=
+=0A=
+Open Market permits you to use, copy, modify, distribute, and license=0A=
+this Software and the Documentation for any purpose, provided that=0A=
+existing copyright notices are retained in all copies and that this=0A=
+notice is included verbatim in any distributions.  No written=0A=
+agreement, license, or royalty fee is required for any of the=0A=
+authorized uses.  Modifications to this Software and Documentation may=0A=
+be copyrighted by their authors and need not follow the licensing=0A=
+terms described here.  If modifications to this Software and=0A=
+Documentation have new licensing terms, the new terms must be clearly=0A=
+indicated on the first page of each file where they apply.=0A=
+=0A=
+OPEN MARKET MAKES NO EXPRESS OR IMPLIED WARRANTY WITH RESPECT TO THE=0A=
+SOFTWARE OR THE DOCUMENTATION, INCLUDING WITHOUT LIMITATION ANY=0A=
+WARRANTY OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  IN=0A=
+NO EVENT SHALL OPEN MARKET BE LIABLE TO YOU OR ANY THIRD PARTY FOR ANY=0A=
+DAMAGES ARISING FROM OR RELATING TO THIS SOFTWARE OR THE=0A=
+DOCUMENTATION, INCLUDING, WITHOUT LIMITATION, ANY INDIRECT, SPECIAL OR=0A=
+CONSEQUENTIAL DAMAGES OR SIMILAR DAMAGES, INCLUDING LOST PROFITS OR=0A=
+LOST DATA, EVEN IF OPEN MARKET HAS BEEN ADVISED OF THE POSSIBILITY OF=0A=
+SUCH DAMAGES.  THE SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS".=0A=
+OPEN MARKET HAS NO LIABILITY IN CONTRACT, TORT, NEGLIGENCE OR=0A=
+OTHERWISE ARISING OUT OF THIS SOFTWARE OR THE DOCUMENTATION.=0A=
diff --git a/meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb b/meta-webserve=
r/recipes-fcgi/fcgi/fcgi_2.4.0.bb=0A=
new file mode 100644=0A=
index 0000000..ceb5909=0A=
--- /dev/null=0A=
+++ b/meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb=0A=
@@ -0,0 +1,16 @@=0A=
+DESCRIPTION =3D "FastCGI is a protocol for interfacing interactive program=
s with a web server."=0A=
+HOMEPAGE =3D "http://www.fastcgi.com"=0A=
+LICENSE =3D "OML"=0A=
+LIC_FILES_CHKSUM =3D "file://LICENSE.TERMS;md5=3De3aacac3a647af6e7e31f181c=
da0a06a"=0A=
+=0A=
+SRC_URI =3D "http://fossies.org/linux/www/fcgi-2.4.0.tar.gz \=0A=
+           file://Fix_EOF_not_declared_issue.patch \=0A=
+"=0A=
+SRC_URI[md5sum] =3D "d15060a813b91383a9f3c66faf84867e"=0A=
+SRC_URI[sha256sum] =3D "66fc45c6b36a21bf2fbbb68e90f780cc21a9da1fffbae75e76=
d2b4402d3f05b9"=0A=
+=0A=
+S =3D "${WORKDIR}/${BPN}-${PV}/"=0A=
+=0A=
+inherit autotools=0A=
+=0A=
+PARALLEL_MAKE =3D ""=0A=
diff --git a/meta-webserver/recipes-fcgi/fcgi/files/Fix_EOF_not_declared_is=
sue.patch b/meta-webserver/recipes-fcgi/fcgi/files/Fix_EOF_not_declared_iss=
ue.patch=0A=
new file mode 100644=0A=
index 0000000..f382142=0A=
--- /dev/null=0A=
+++ b/meta-webserver/recipes-fcgi/fcgi/files/Fix_EOF_not_declared_issue.pat=
ch=0A=
@@ -0,0 +1,15 @@=0A=
+Fix EOF not declared issue=0A=
+=0A=
+Error like:=0A=
+fcgio.cpp:70:72: error: 'EOF' was not declared in this scope=0A=
+              if (FCGX_PutStr(pbase(), plen, this->fcgx) !=3D plen) return=
 EOF;=0A=
+--- fcgi-ori/libfcgi/fcgio.cpp 2014-07-28 18:01:00.000000000 +0800=0A=
++++ fcgi-2.4.0/libfcgi/fcgio.cpp       2014-07-28 18:01:22.000000000 +0800=
=0A=
+@@ -22,6 +22,7 @@=0A=
+ #define DLLAPI  __declspec(dllexport)=0A=
+ #endif=0A=
+=0A=
++#include <stdio.h>=0A=
+ #include <limits.h>=0A=
+ #include "fcgio.h"=0A=
+=0A=
--=0A=
1.9.2=0A=
=0A=

