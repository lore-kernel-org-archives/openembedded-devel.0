Return-Path: <rcalhoun@shotspotter.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com (unknown
	[207.46.163.183])
	by mail.openembedded.org (Postfix) with ESMTP id 12EF160167
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 20:32:17 +0000 (UTC)
Received: from CO1PR04MB556.namprd04.prod.outlook.com (10.141.73.23) by
	CO1PR04MB553.namprd04.prod.outlook.com (10.141.73.12) with Microsoft
	SMTP Server (TLS) id 15.0.944.11; Tue, 20 May 2014 20:16:37 +0000
Received: from CO1PR04MB556.namprd04.prod.outlook.com ([169.254.8.38]) by
	CO1PR04MB556.namprd04.prod.outlook.com ([169.254.8.38]) with mapi id
	15.00.0944.000; Tue, 20 May 2014 20:16:37 +0000
From: Robert Calhoun <rcalhoun@shotspotter.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 2/2] fixup trailing-whitespace following
	warning from create-pull-request
Thread-Index: AQHPdGhmMIbhzZl3ikuRRdd/HY+CQg==
Date: Tue, 20 May 2014 20:16:36 +0000
Message-ID: <CFA1300A.2834B6%rcalhoun@shotspotter.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.4.1.140326
x-originating-ip: [50.43.173.41]
x-forefront-prvs: 02176E2458
x-forefront-antispam-report: SFV:NSPM;
	SFS:(6009001)(428001)(189002)(199002)(92726001)(83322001)(20776003)(92566001)(31966008)(81342001)(66066001)(77982001)(74662001)(21056001)(76482001)(83072002)(85852003)(64706001)(79102001)(2656002)(80022001)(19580395003)(99396002)(99286001)(4396001)(87936001)(54356999)(50986999)(83506001)(46102001)(74502001)(101416001)(575784001)(86362001)(36756003)(81542001);
	DIR:OUT; SFP:; SCL:1; SRVR:CO1PR04MB553;
	H:CO1PR04MB556.namprd04.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (: shotspotter.com does not designate permitted sender
	hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=rcalhoun@shotspotter.com; 
MIME-Version: 1.0
X-OriginatorOrg: shotspotter.com
Subject: [meta-oe][PATCH 2/2] fixup trailing-whitespace following warning from create-pull-request
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
X-List-Received-Date: Tue, 20 May 2014 20:32:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1367F57DAA308A46AE34AB13499D73CA@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

---
...0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch | 5
++---
.../0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch       | 3 +--
.../gpsd/gpsd-3.10/0004-SConstruct-remove-rpath.patch              | 7
+++----
meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb                       | 2 --
meta-oe/recipes-navigation/gpsd/supported-chipsets.inc             | 1 -
5 files changed, 6 insertions(+), 12 deletions(-)

diff --git=20
a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0001-SConstruct-prefix-includep
y-with-sysroot-and-drop-sy.patch
b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0001-SConstruct-prefix-includep
y-with-sysroot-and-drop-sy.patch
index e557703..1328cf4 100644
---=20
a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0001-SConstruct-prefix-includep
y-with-sysroot-and-drop-sy.patch
+++=20
b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0001-SConstruct-prefix-includep
y-with-sysroot-and-drop-sy.patch
@@ -62,10 +62,9 @@ index 14e2f59..47c5753 100644
         python_env.AddPostAction(python_extensions_install, '$STRIP
$TARGET')
+    env.AddPostAction(python_extensions_install, '$CHRPATH -r "%s"
"$TARGET"' \
+                     % (python_lib_dir, ))
-=20
+
     python_modules_install =3D python_env.Install( DESTDIR +
python_module_dir,
                                                 python_modules)

---=20
+--
1.7.8.5
-
diff --git=20
a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0002-SConstruct-respect-sysroot
-also-in-SPLINTOPTS.patch
b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0002-SConstruct-respect-sysroot
-also-in-SPLINTOPTS.patch
index 06dd6e7..a6a9376 100644
---=20
a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0002-SConstruct-respect-sysroot
-also-in-SPLINTOPTS.patch
+++=20
b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0002-SConstruct-respect-sysroot
-also-in-SPLINTOPTS.patch
@@ -25,6 +25,5 @@ index 14e2f59..47c5753 100644
 # splint does not know about multi-arch, work around that
 ma_status, ma =3D _getstatusoutput('dpkg-architecture -qDEB_HOST_MULTIARCH=
')
 if ma_status =3D=3D 0:
---=20
+--
1.7.5.4
-
diff --git=20
a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0004-SConstruct-remove-rpath.pa
tch=20
b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0004-SConstruct-remove-rpath.pa
tch
index 83b98bb..a3e8bdb 100644
---=20
a/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0004-SConstruct-remove-rpath.pa
tch
+++=20
b/meta-oe/recipes-navigation/gpsd/gpsd-3.10/0004-SConstruct-remove-rpath.pa
tch
@@ -24,7 +24,7 @@ index a1bddb9..3e7c607 100644
--- a/SConstruct
+++ b/SConstruct
@@ -1205,8 +1205,11 @@ if qt_env:
-=20
+
 # We don't use installdir here in order to avoid having DESTDIR affect
the rpath
 if env["shared"] and env["chrpath"]:
-    env.AddPostAction(binaryinstall, '$CHRPATH -r "%s" "$TARGET"' \
@@ -34,9 +34,8 @@ index a1bddb9..3e7c607 100644
+                          % (installdir('libdir', False), ))
+    else:
+        env.AddPostAction(binaryinstall, '$CHRPATH -d "$TARGET"')
-=20
+
 if not env['debug'] and not env['profiling'] and env['strip']:
     env.AddPostAction(binaryinstall, '$STRIP $TARGET')
---=20
+--
1.7.5.4
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
index 715b5a7..55e59d3 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
@@ -11,5 +11,3 @@ PR =3D "r1"

SRC_URI[md5sum] =3D "fc5b03aae38b9b5b6880b31924d0ace3"
SRC_URI[sha256sum] =3D
"706fc2c1cf3dfbf87c941f543381bccc9c4dc9f8240eec407dcbf2f70b854320"
-
-
diff --git a/meta-oe/recipes-navigation/gpsd/supported-chipsets.inc
b/meta-oe/recipes-navigation/gpsd/supported-chipsets.inc
index dee898b..90eaa49 100644
--- a/meta-oe/recipes-navigation/gpsd/supported-chipsets.inc
+++ b/meta-oe/recipes-navigation/gpsd/supported-chipsets.inc
@@ -25,4 +25,3 @@ PACKAGECONFIG +=3D "tnt"
PACKAGECONFIG +=3D "tripmate"
PACKAGECONFIG +=3D "tsip"
PACKAGECONFIG +=3D "ublox"
-
--=20
1.9.1




