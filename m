Return-Path: <ann.thornton@nxp.com>
X-Greylist: delayed 422 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Sep 2016 15:05:02 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0063.outbound.protection.outlook.com [104.47.2.63])
	by mail.openembedded.org (Postfix) with ESMTP id E89A46E660
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 15:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=MNAAlgsUlEddVFX2Y+MgX1x9NqfQ8swXDg7TnfxQTl0=;
	b=MnZ45JbKwf5krtUjgSN10mVhnqmBkxr1syOIMBhwr5C/q1dlugwnoLHp5MsFSt50DQRG6lf9NoAF54wSkJfLBYizNdFSwJAKvbCGYWU+Q42HqElpwbn3jBHDkwDWRQwyTvVeMhAdvCgRTIlbDLYPBjI5l+c4l6n5gSr+6K+5rR0=
Received: from AM5PR0401MB2564.eurprd04.prod.outlook.com (10.169.245.15) by
	AM5PR0401MB2561.eurprd04.prod.outlook.com (10.169.245.12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.629.6; Fri, 16 Sep 2016 14:32:19 +0000
Received: from AM5PR0401MB2564.eurprd04.prod.outlook.com ([10.169.245.15]) by
	AM5PR0401MB2564.eurprd04.prod.outlook.com ([10.169.245.15]) with
	mapi id 15.01.0629.006; Fri, 16 Sep 2016 14:32:19 +0000
From: Ann Thornton <ann.thornton@nxp.com>
To: Ann Thornton <ann.thornton@nxp.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][meta-oe][PATCH] glcompbench: Fix issues causing failures in
	GCC6
Thread-Index: AQHSCIurhidZ1r/Y7EqmuKB1WSot8qB8PLSA
Date: Fri, 16 Sep 2016 14:32:19 +0000
Message-ID: <AM5PR0401MB25648D08D10DF334D6A2D61186F30@AM5PR0401MB2564.eurprd04.prod.outlook.com>
References: <1473199737-16623-1-git-send-email-ann.thornton@nxp.com>
In-Reply-To: <1473199737-16623-1-git-send-email-ann.thornton@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ann.thornton@nxp.com; 
x-originating-ip: [192.88.168.1]
x-ms-office365-filtering-correlation-id: 530e5796-4f34-4481-57d0-08d3de3e43e4
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2561;
	6:THTjNX02akcvuvp2zA1BZM8cCte7t5StL3QAVSrcPDPUQutdGBWDyBZdjsYirSbfKCVgzC//eUtFbMLCoYXB94t52XwxNtHVD0QmM97DbxUiJMZPjYwqcakk/VA3mwyktU4322k6r8qi283+pmx6S1ApRDHDTENnzKCXJDSLSi4HUmRddJADNTXaz990ly+e9Qqjg6f+7wFnsTBpLLDlUpmGGpNZ7wmTxsBdFsA+kAuNf+9tO8h5upOCtXe6njR+lCNUXRyW5VSftBexZTmZqk2EjNrREQ6WdZP9USS853CTx5jG83lNuZzREJsM9ZW/tKG7wYXJvufSw0GMsXki2g==;
	5:imrPtEKjxiLztrC/9KJl7nZBK2Kof35YqEz95D+VvPTYfl1ikElfcvAZNKqAoSMw8MdxttMIQlksjQToSL7ti1Q3dq7b+qh7GD0K9NGxegySrQvQ51+ZOQtpOHv5qR+2aFbEkdLlVPNkDo782ag3+Q==;
	24:bci3wn2ADDY33hsdCD3Ro/PIItKN/ylxSEqvZ3zcJhVywkxrG6J3HYoNzIpooW2dwT266re3mYTRVMV/oQ7yOxMSJChmk2O/CYPbJ3E/7+E=;
	7:SvjWQuVVkb/TdXYqcIX8/C1rKIl5wlFpwDD2aGydq5Vn45tytQQgotmOjN+WA1/cVkDw69hnZmzBineJvabccaJtKnnTSHz9mI7tSewDDeZ+qqKTmfIDvNjeBx2VcLHW9+O9bx62iFojRXQlP9W9isR5bIbljETnP6MmdNl1HT0ayMsiuwcOF8OAthXHUEl40lPFTTcUg94R+f3SgTWTrNABc9FhcwM6ctoXkBPROff3jvA73HZaG9dWH8ZtC+df
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM5PR0401MB2561;
x-microsoft-antispam-prvs: <AM5PR0401MB256136289C05A75DA21E811B86F30@AM5PR0401MB2561.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249)(24339691489775); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:AM5PR0401MB2561; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0401MB2561; 
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(57704003)(13464003)(189002)(199003)(377454003)(122556002)(10400500002)(76576001)(3280700002)(15975445007)(8936002)(87936001)(5002640100001)(68736007)(7696004)(9686002)(3660700001)(105586002)(74316002)(50986999)(586003)(101416001)(5660300001)(81156014)(77096005)(6116002)(54356999)(189998001)(8676002)(3846002)(102836003)(19580405001)(86362001)(106356001)(305945005)(2906002)(19580395003)(11100500001)(107886002)(2950100001)(450100001)(81166006)(92566002)(76176999)(33656002)(7736002)(106116001)(5001770100001)(97736004)(2900100001)(7846002)(2501003)(66066001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2561;
	H:AM5PR0401MB2564.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2016 14:32:19.5706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2561
Subject: Re: [meta-oe][PATCH] glcompbench: Fix issues causing failures in GCC6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2016 15:05:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Just checking to see if this is in the process.  Or do I need to do somethi=
ng different with this?

Thanks!
Ann Thornton

-----Original Message-----
From: Ann Thornton [mailto:ann.thornton@nxp.com]=20
Sent: Tuesday, September 06, 2016 5:09 PM
To: openembedded-devel@lists.openembedded.org
Cc: Ann Thornton <ann.thornton@nxp.com>
Subject: [oe][meta-oe][PATCH] glcompbench: Fix issues causing failures in G=
CC6

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
---
 .../glcompbench/Fix-configure-for-sqrt-check.patch | 14 +++++++++++++
 .../glcompbench/Fix_auto_ptr_deprecated.patch      | 24 ++++++++++++++++++=
++++
 .../glcompbench/glcompbench/Fix_space_issues.patch | 22 ++++++++++++++++++=
++
 .../glcompbench/glcompbench_2012.08.bb             |  8 ++++----
 4 files changed, 64 insertions(+), 4 deletions(-)  create mode 100755 meta=
-oe/recipes-graphics/glcompbench/glcompbench/Fix-configure-for-sqrt-check.p=
atch
 create mode 100755 meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_au=
to_ptr_deprecated.patch
 create mode 100755 meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_sp=
ace_issues.patch
 mode change 100644 =3D> 100755 meta-oe/recipes-graphics/glcompbench/glcomp=
bench_2012.08.bb

diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix-configure=
-for-sqrt-check.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/Fi=
x-configure-for-sqrt-check.patch
new file mode 100755
index 0000000..4831c40
--- /dev/null
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix-configure-for
+++ -sqrt-check.patch
@@ -0,0 +1,14 @@
+Index: git/wscript
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/wscript	2016-07-29 13:15:44.954249796 -0500
++++ git/wscript	2016-07-29 15:52:06.196768865 -0500
+@@ -56,7 +56,7 @@
+         ctx.check_cxx(lib =3D lib, uselib_store =3D uselib)
+=20
+     # Check required functions
+-    req_funcs =3D [('gettimeofday', 'sys/time.h', []) ,('sqrt', 'math.h',=
 ['m']),
++    req_funcs =3D [('gettimeofday', 'sys/time.h', []),
+                  ('strtol', 'stdlib.h', []), ('strtoul', 'stdlib.h', [])]
+     for func, header, uselib in req_funcs:
+         ctx.check_cxx(function_name =3D func, header_name =3D header,=20
+ uselib =3D uselib, mandatory =3D True)
+
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_auto_ptr_=
deprecated.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_aut=
o_ptr_deprecated.patch
new file mode 100755
index 0000000..930c7cb
--- /dev/null
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_auto_ptr_depr
+++ ecated.patch
@@ -0,0 +1,24 @@
+diff -aur glcompbench-2012.08/src/libmatrix/shader-source.cc Fixed/src/lib=
matrix/shader-source.cc
+--- glcompbench-2012.08/src/libmatrix/shader-source.cc	2012-08-22 13:41:36=
.000000000 -0500
++++ Fixed/src/libmatrix/shader-source.cc	2016-08-24 14:23:49.576023317 -05=
00
+@@ -34,7 +34,7 @@
+ bool
+ ShaderSource::load_file(const std::string& filename, std::string& str) =20
+{
+-    std::auto_ptr<std::istream> is_ptr(Util::get_resource(filename));
++    std::unique_ptr<std::istream>=20
++ is_ptr(Util::get_resource(filename));
+     std::istream& inputFile(*is_ptr);
+=20
+     if (!inputFile)
+diff -aur glcompbench-2012.08/src/texture.cc Fixed/src/texture.cc
+--- glcompbench-2012.08/src/texture.cc	2012-08-22 13:41:36.000000000 -0500
++++ Fixed/src/texture.cc	2016-08-24 14:23:28.223917438 -0500
+@@ -52,7 +52,7 @@
+=20
+         Log::debug("Reading PNG file %s\n", filename.c_str());
+=20
+-        const std::auto_ptr<std::istream> is_ptr(Util::get_resource(filen=
ame));
++        const std::unique_ptr<std::istream>=20
++ is_ptr(Util::get_resource(filename));
+         if (!(*is_ptr)) {
+             Log::error("Cannot open file %s!\n", filename.c_str());
+             return false;
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_space_iss=
ues.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_space_issu=
es.patch
new file mode 100755
index 0000000..516baad
--- /dev/null
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_space_issues.
+++ patch
@@ -0,0 +1,22 @@
+diff -aur glcompbench-2012.08/src/composite-canvas.cc Fixed/src/composite-=
canvas.cc
+--- glcompbench-2012.08/src/composite-canvas.cc	2012-08-22 13:41:36.000000=
000 -0500
++++ Fixed/src/composite-canvas.cc	2016-08-24 14:05:28.970565709 -0500
+@@ -41,7 +41,7 @@
+ #include "log.h"
+ #include "profiler.h"
+=20
+-const std::string glcompbench_version_string("glcompbench=20
+"GLCOMPBENCH_VERSION);
++const std::string glcompbench_version_string("glcompbench "=20
++GLCOMPBENCH_VERSION);
+=20
+ /*******************
+  * Private methods *
+@@ -495,7 +495,7 @@
+     // When we complete an iteration, reset the count and tell the caller=
.
+=20
+     if (stats.total >=3D current_test_duration_) {
+-        Log::info("FPS: %"PRIu64"\n", (uint64_t)(1000 * stats.nsamples / =
stats.total));
++        Log::info("FPS: %" PRIu64 "\n", (uint64_t)(1000 *=20
++ stats.nsamples / stats.total));
+=20
+         for (Profiler::Point p =3D 0; p < profiler.get_num_points(); p +=
=3D 2) {
+             profiler.get_stats(p, p + 1, stats);
+
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb b/=
meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
old mode 100644
new mode 100755
index 0c5d7b5..35fb4ad
--- a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
@@ -6,7 +6,10 @@ DEPENDS =3D "virtual/libgl virtual/egl virtual/libgles1 vi=
rtual/libgles2 \
            virtual/libx11 libxcomposite pixman libxrender libpng12"
=20
 SRC_URI =3D "https://launchpad.net/glcompbench/trunk/${PV}/+download/${BPN=
}-${PV}.tar.gz \
-           file://glbench-compile-fix.patch"
+           file://glbench-compile-fix.patch \
+           file://Fix-configure-for-sqrt-check.patch \
+           file://Fix_space_issues.patch \
+           file://Fix_auto_ptr_deprecated.patch"
=20
 SRC_URI[md5sum] =3D "c939d9156fe940960098f38707fea827"
 SRC_URI[sha256sum] =3D "b04b738cec06c6786ceafa86e4735fd8b971c078265754854e=
f356b0379542ee"
@@ -14,6 +17,3 @@ SRC_URI[sha256sum] =3D "b04b738cec06c6786ceafa86e4735fd8b=
971c078265754854ef356b037
 inherit pkgconfig waf distro_features_check  # depends on virtual/libx11  =
REQUIRED_DISTRO_FEATURES =3D "x11"
-
-# http://errors.yoctoproject.org/Errors/Details/68631/
-PNBLACKLIST[glcompbench] ?=3D "BROKEN: fails to build with gcc-6"
--
1.9.1


