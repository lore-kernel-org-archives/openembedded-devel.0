Return-Path: <johannes.pointner@br-automation.com>
Received: from mail2.br-automation.com (mail.automotion.info [213.33.116.60])
	by mail.openembedded.org (Postfix) with ESMTP id BFDBF787E5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 07:35:25 +0000 (UTC)
X-AuditID: c0a80110-303e09e000000ea0-0e-5a9506a9ea1a
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id 42.F0.03744.9A6059A5;
	Tue, 27 Feb 2018 08:20:09 +0100 (CET)
MIME-Version: 1.0
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Feb 2018 08:18:43 +0100
Message-Id: <20180227071844.23571-3-johannes.pointner@br-automation.com>
In-Reply-To: <20180227071844.23571-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.16.2
References: <20180227071844.23571-1-johannes.pointner@br-automation.com>
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 27/02/2018 08:20:05,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 27/02/2018 08:20:10,
	Serialize complete at 27/02/2018 08:20:10,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 27.02.2018 08:20:08
X-TNEFEvaluated: 1
X-Disclaimed: 64411
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPLMWRmVeSWpSXmKPExsVyYAWjje5KtqlRBvMeS1pcPLyU2YHR49zG
	FYwBjFFcNimpOZllqUX6dglcGV82P2MuWGpZcfPAZKYGxrn6XYycHBICJhKdR/YxdTFycQgJ
	bGKUeDTjPTNIgldAUOLkzCcsIDabgK3EkQlfwWwRAV2Jjx/mMoLYzALWEu+XL2AFsYUFXCW2
	vTkAZrMIqEq8vLeSrYuRA2iOh8SacykgYU4BT4m7M36xQrRqSyxb+JoZ4gZ5iYVnr4LZQkDl
	8zc1sIHcIyHQwSyxbeU0VogiIYnTi88yg8yUEBCWONXmO4FRYBaSS2chGbuAkWkVo3huYmaO
	kV5SkW5iaUl+bmJJZn6eXnJ+7iZGSLAJ7GDc/Ub7EKMAB6MSD28Ow9QoIdbEsuLK3EOMEhzM
	SiK8KxdPjhLiTUmsrEotyo8vKs1JLT7EKM3BoiTOm5NkHCUkkJ5YkpqdmlqQWgSTZeLglGpg
	XLJ5dsSdz6nzfucuzF/wN0bEZ/W1BgnlEsFNBapGGf0e5hEPr7JG3369NUKl5+StxrAlIhli
	IW+W7zTz/GgpFe+6q8pN41/X7G0/N+upRiRcOHL3wkQb2633/n0/dM4vaJ+k4DlBlbcemZNq
	zGQ7+ZZ85dy5sGL2Vftts/gteVpLslseWyw4r8RSnJFoqMVcVJwIACrp4BwyAgAA
Subject: [meta-networking][PATCH 2/3] libldb: update to version 1.3.1
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
X-List-Received-Date: Tue, 27 Feb 2018 07:35:26 -0000
Content-Transfer-Encoding: quoted-printable

Version >=3D 1.2.3 needed to build samba 4.7.5.

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 ...ions-for-packages.patch =3D> options-1.3.1.patch} | 38 +++++++++++++++-=
------
 .../libldb/{libldb=5F1.2.2.bb =3D> libldb=5F1.3.1.bb}    |  6 ++--
 2 files changed, 30 insertions(+), 14 deletions(-)
 rename meta-networking/recipes-support/libldb/libldb/{ldb-Add-configure-op=
tions-for-packages.patch =3D> options-1.3.1.patch} (83%)
 rename meta-networking/recipes-support/libldb/{libldb=5F1.2.2.bb =3D> libl=
db=5F1.3.1.bb} (91%)

diff --git a/meta-networking/recipes-support/libldb/libldb/ldb-Add-configur=
e-options-for-packages.patch b/meta-networking/recipes-support/libldb/libld=
b/options-1.3.1.patch
similarity index 83%
rename from meta-networking/recipes-support/libldb/libldb/ldb-Add-configure=
-options-for-packages.patch
rename to meta-networking/recipes-support/libldb/libldb/options-1.3.1.patch
index 93bd4578e..ffe253b63 100644
--- a/meta-networking/recipes-support/libldb/libldb/ldb-Add-configure-optio=
ns-for-packages.patch
+++ b/meta-networking/recipes-support/libldb/libldb/options-1.3.1.patch
@@ -1,7 +1,7 @@
-From 49dde22e798fd7f39fd59250036c0ae1fe2b9152 Mon Sep 17 00:00:00 2001
+From a4da3ab4d76013aaa731d43d52ccca1ebd37c395 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 21 Sep 2016 10:06:39 +0800
-Subject: [PATCH] ldb: Add configure options for packages
+Subject: [PATCH 1/1] ldb: Add configure options for packages
=20
 Add configure options for the following packages:
  - acl
@@ -16,9 +16,9 @@ Upstream-Status: Inappropriate [oe deterministic build sp=
ecific]
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 ---
  lib/replace/system/wscript=5Fconfigure |  6 ++-
- lib/replace/wscript                  | 85 ++++++++++++++++++++++++++++---=
-----
+ lib/replace/wscript                  | 94 +++++++++++++++++++++++++++----=
-----
  wscript                              |  7 +++
- 3 files changed, 80 insertions(+), 18 deletions(-)
+ 3 files changed, 83 insertions(+), 24 deletions(-)
=20
 diff --git a/lib/replace/system/wscript=5Fconfigure b/lib/replace/system/w=
script=5Fconfigure
 index 2035474..10f9ae7 100644
@@ -37,7 +37,7 @@ index 2035474..10f9ae7 100644
 =20
  # solaris varients of getXXent=5Fr
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 145300d..8218fa5 100644
+index 2f94d49..68b2d3a 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -23,6 +23,41 @@ def set=5Foptions(opt):
@@ -124,18 +124,23 @@ index 145300d..8218fa5 100644
      conf.CHECK=5FHEADERS('nss=5Fcommon.h nsswitch.h ns=5Fapi.h')
      conf.CHECK=5FHEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs=
.h')
      conf.CHECK=5FHEADERS('utmp.h utmpx.h lastlog.h')
-@@ -248,17 +298,18 @@ def configure(conf):
+@@ -266,22 +316,20 @@ def configure(conf):
 =20
      conf.CHECK=5FFUNCS('prctl dirname basename')
 =20
+-    strlcpy=5Fin=5Fbsd =3D False
+-
 -    # libbsd on some platforms provides strlcpy and strlcat
 -    if not conf.CHECK=5FFUNCS('strlcpy strlcat'):
--        conf.CHECK=5FFUNCS=5FIN('strlcpy strlcat', 'bsd', headers=3D'bsd/=
string.h',
--                checklibc=3DTrue)
+-        if conf.CHECK=5FFUNCS=5FIN('strlcpy strlcat', 'bsd', headers=3D'b=
sd/string.h',
+-                               checklibc=3DTrue):
+-            strlcpy=5Fin=5Fbsd =3D True
 -    if not conf.CHECK=5FFUNCS('getpeereid'):
 -        conf.CHECK=5FFUNCS=5FIN('getpeereid', 'bsd', headers=3D'sys/types=
.h bsd/unistd.h')
 -    if not conf.CHECK=5FFUNCS=5FIN('setproctitle', 'setproctitle', header=
s=3D'setproctitle.h'):
 -        conf.CHECK=5FFUNCS=5FIN('setproctitle', 'bsd', headers=3D'sys/typ=
es.h bsd/unistd.h')
+-    if not conf.CHECK=5FFUNCS('setproctitle=5Finit'):
+-        conf.CHECK=5FFUNCS=5FIN('setproctitle=5Finit', 'bsd', headers=3D'=
sys/types.h bsd/unistd.h')
 -
 -    if not conf.CHECK=5FFUNCS('closefrom'):
 -        conf.CHECK=5FFUNCS=5FIN('closefrom', 'bsd', headers=3D'bsd/unistd=
.h')
@@ -148,17 +153,28 @@ index 145300d..8218fa5 100644
 +            conf.CHECK=5FFUNCS=5FIN('getpeereid', 'bsd', headers=3D'sys/t=
ypes.h bsd/unistd.h')
 +        if not conf.CHECK=5FFUNCS=5FIN('setproctitle', 'setproctitle', he=
aders=3D'setproctitle.h'):
 +            conf.CHECK=5FFUNCS=5FIN('setproctitle', 'bsd', headers=3D'sys=
/types.h bsd/unistd.h')
++        if not conf.CHECK=5FFUNCS('setproctitle=5Finit'):
++            conf.CHECK=5FFUNCS=5FIN('setproctitle=5Finit', 'bsd', headers=
=3D'sys/types.h bsd/unistd.h')
 +
 +        if not conf.CHECK=5FFUNCS('closefrom'):
 +            conf.CHECK=5FFUNCS=5FIN('closefrom', 'bsd', headers=3D'bsd/un=
istd.h')
 =20
      conf.CHECK=5FCODE('''
                  struct ucred cred;
+@@ -632,7 +680,7 @@ removeea setea
+     # look for a method of finding the list of network interfaces
+     for method in ['HAVE=5FIFACE=5FGETIFADDRS', 'HAVE=5FIFACE=5FAIX', 'HA=
VE=5FIFACE=5FIFCONF', 'HAVE=5FIFACE=5FIFREQ']:
+         bsd=5Ffor=5Fstrlcpy =3D ''
+-        if strlcpy=5Fin=5Fbsd:
++        if Options.options.enable=5Flibbsd:
+             bsd=5Ffor=5Fstrlcpy =3D ' bsd'
+         if conf.CHECK=5FCODE('''
+                            #define %s 1
 diff --git a/wscript b/wscript
-index 2af8571..059408b 100755
+index 8ae5be3..a178cc4 100644
 --- a/wscript
 +++ b/wscript
-@@ -29,6 +29,13 @@ def set=5Foptions(opt):
+@@ -31,6 +31,13 @@ def set=5Foptions(opt):
      opt.RECURSE('lib/replace')
      opt.tool=5Foptions('python') # options for disabling pyc or pyo compi=
lation
 =20
@@ -173,5 +189,5 @@ index 2af8571..059408b 100755
      conf.RECURSE('lib/tdb')
      conf.RECURSE('lib/tevent')
 --=20
-2.8.3
+2.16.2
=20
diff --git a/meta-networking/recipes-support/libldb/libldb=5F1.2.2.bb b/met=
a-networking/recipes-support/libldb/libldb=5F1.3.1.bb
similarity index 91%
rename from meta-networking/recipes-support/libldb/libldb=5F1.2.2.bb
rename to meta-networking/recipes-support/libldb/libldb=5F1.3.1.bb
index cb9ea9283..7e14cde35 100644
--- a/meta-networking/recipes-support/libldb/libldb=5F1.2.2.bb
+++ b/meta-networking/recipes-support/libldb/libldb=5F1.3.1.bb
@@ -8,7 +8,7 @@ RDEPENDS=5Fpyldb +=3D "python"
=20
 SRC=5FURI =3D "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://do-not-import-target-module-while-cross-compile.patch \
-           file://ldb-Add-configure-options-for-packages.patch \
+           file://options-1.3.1.patch \
           "
=20
 PACKAGECONFIG ??=3D "\
@@ -29,8 +29,8 @@ LIC=5FFILES=5FCHKSUM =3D "file://pyldb.h;endline=3D24;md5=
=3Ddfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=3D261;endline=3D262;md5=
=3D137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=3D19;md5=3Da7d4fc5d1f75=
676b49df491575a86a42"
=20
-SRC=5FURI[md5sum] =3D "91284a12423def99a6592e393e3b7fbb"
-SRC=5FURI[sha256sum] =3D "0cedeadb75de401c9735127f654dbc1a391c4327a2b83be5=
4078be286fed1113"
+SRC=5FURI[md5sum] =3D "e5233f202bca27f6ce8474fb8ae65983"
+SRC=5FURI[sha256sum] =3D "b19f2c9f55ae0f46aa5ebaea0bf1a47ec1ac135e1d78af0f=
6318cf50bf62cbd2"
=20
 inherit waf-samba
=20
--=20
2.16.2



