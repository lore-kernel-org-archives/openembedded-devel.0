Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web10.201.1589219174494219474
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2020 10:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com header.s=first header.b=PAaF7uyN;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from zen.localdomain (unknown [85.184.140.241])
	by first.geanix.com (Postfix) with ESMTPSA id CDB4A1F8071B;
	Mon, 11 May 2020 17:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1589219167; bh=Ml7VqmzztZvXk8mOKcsE2vJ51R+MdijP49WPIsc0v6w=;
	h=From:To:Cc:Subject:Date;
	b=PAaF7uyNrVUC9b4+75EZe4flP2vs8IBC+ZGORPw+lZRiYbxcOd4OtLUIyAsLX3VIv
	 s5MUljxJ+WdZOoMRUexJorBiieC/RlmzuAGu8JjtjSFq0c6rB0IXz90A3QeXu2XkpQ
	 vqe5hoqoCtZs9SFGc5jFWxUVQ6DAjvSwQOs6m7rIIqyH6C2C692XuWoBTwPELBGwNP
	 WkQ0uMDZsu7YpcGJpJbAWZeGtokopbgVQ0KOOtBq/wO1MIVYgWD1+BWsoKqZU3wM2u
	 3iHp6CN2ytjkxmPifqH2qhmgwkl0cV7PSuJR2nKN/u9cGBWXHfQ9w+HsV02DO6VTiJ
	 szfM0eyiSQKSA==
From: "Sean Nyekjaer" <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [[oe] [meta-oe] [PATCH]] gpsd: Upgrade 3.19 -> 3.20
Date: Mon, 11 May 2020 19:45:05 +0200
Message-Id: <20200511174505.2128564-1-sean@geanix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Status: No, score=-0.4 required=4.0 tests=ALL_TRUSTED,BAYES_50,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on fdf6823a942a
Content-Transfer-Encoding: quoted-printable

Revert "SConstruct: Add test for sizeof(time_t), result in SIZEOF_TIME_T.=
"
Do not cross-compile a small for it to be executed on the host.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 ...t-Add-test-for-sizeof-time_t-result-.patch | 108 ++++++++++++++++++
 .../0001-gps_shm_close-Free-privdata.patch    |  37 ------
 .../gpsd/{gpsd_3.19.bb =3D> gpsd_3.20.bb}       |   6 +-
 3 files changed, 111 insertions(+), 40 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-Revert-SCon=
struct-Add-test-for-sizeof-time_t-result-.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-gps_shm_clo=
se-Free-privdata.patch
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.19.bb =3D> gpsd_3.20.bb} =
(95%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0001-Revert-SConstruct-=
Add-test-for-sizeof-time_t-result-.patch b/meta-oe/recipes-navigation/gps=
d/gpsd/0001-Revert-SConstruct-Add-test-for-sizeof-time_t-result-.patch
new file mode 100644
index 000000000..b021d0b72
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/0001-Revert-SConstruct-Add-tes=
t-for-sizeof-time_t-result-.patch
@@ -0,0 +1,108 @@
+Subject: [PATCH] Revert "SConstruct: Add test for sizeof(time_t), result=
 in
+ SIZEOF_TIME_T."
+
+This reverts commit b32ff1a86c44fa738dabaf63de1b5462e0071ad3.
+
+Upstream-Status: Inappropriate [cross-compile specific]
+
+---
+ SConstruct             | 54 ++++--------------------------------------
+ android/gpsd_config.in |  1 -
+ 2 files changed, 5 insertions(+), 50 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index 33e0ff326..e3c62fa3c 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -597,42 +597,6 @@ def CheckHeaderDefines(context, file, define):
+     return ret
+=20
+=20
+-def CheckSizeOf(context, type):
+-    """Check sizeof 'type'"""
+-    context.Message('Checking size of ' + type + '... ')
+-
+-    program =3D """
+-#include <stdlib.h>
+-#include <stdio.h>
+-
+-/*
+- * The CheckSizeOf function does not have a way for the caller to
+- * specify header files to be included to provide the type being
+- * checked.  As a workaround until that is remedied, include the
+- * header required for time_t, which is the sole current use of this
+- * function.
+- */
+-#include <time.h>
+-
+-int main() {
+-    printf("%d", (int)sizeof(""" + type + """));
+-    return 0;
+-}
+-"""
+-
+-    # compile it
+-    ret =3D context.TryCompile(program, '.c')
+-    if 0 =3D=3D ret:
+-        announce('ERROR: TryCompile failed\n')
+-        # fall back to sizeof(time_t) is 8
+-        return '8'
+-
+-    # run it
+-    ret =3D context.TryRun(program, '.c')
+-    context.Result(ret[0])
+-    return ret[1]
+-
+-
+ def CheckCompilerDefines(context, define):
+     context.Message('Checking if compiler supplies %s... ' % (define,))
+     ret =3D context.TryLink("""
+@@ -703,15 +667,13 @@ env.Prepend(LIBPATH=3D[os.path.realpath(os.curdir)=
])
+=20
+ # CheckXsltproc works, but result is incorrectly saved as "no"
+ config =3D Configure(env, custom_tests=3D{
+-    'CheckC11': CheckC11,
+-    'CheckCompilerDefines': CheckCompilerDefines,
+-    'CheckCompilerOption': CheckCompilerOption,
+-    'CheckHeaderDefines': CheckHeaderDefines,
+     'CheckPKG': CheckPKG,
+-    'CheckSizeOf': CheckSizeOf,
+     'CheckXsltproc': CheckXsltproc,
+-    'GetPythonValue': GetPythonValue,
+-    })
++    'CheckCompilerOption': CheckCompilerOption,
++    'CheckCompilerDefines': CheckCompilerDefines,
++    'CheckC11': CheckC11,
++    'CheckHeaderDefines': CheckHeaderDefines,
++    'GetPythonValue': GetPythonValue})
+=20
+ # Use print, rather than announce, so we see it in -s mode.
+ print("This system is: %s" % sys.platform)
+@@ -1043,12 +1005,6 @@ else:
+             confdefs.append("/* #undef HAVE_%s_H */\n"
+                             % hdr.replace("/", "_").upper())
+=20
+-    sizeof_time_t =3D config.CheckSizeOf("time_t")
+-    confdefs.append("#define SIZEOF_TIME_T %s\n" % sizeof_time_t)
+-    announce("sizeof(time_t) is %s" % sizeof_time_t)
+-    if 4 >=3D int(sizeof_time_t):
+-        announce("WARNING: time_t is too small.  It will fail in 2038")
+-
+     # check function after libraries, because some function require lib=
raries
+     # for example clock_gettime() require librt on Linux glibc < 2.17
+     for f in ("cfmakeraw", "clock_gettime", "daemon", "fcntl", "fork",
+diff --git a/android/gpsd_config.in b/android/gpsd_config.in
+index 758251986..d240f6d34 100644
+--- a/android/gpsd_config.in
++++ b/android/gpsd_config.in
+@@ -19,7 +19,6 @@
+ #define HAVE_ARPA_INET_H 1
+ #define HAVE_SYSLOG_H 1
+ #define HAVE_DAEMON 1
+-#define SIZEOF_TIME_T 8
+ #define HAVE_CLOCK_GETTIME 1
+ #define HAVE_STRPTIME 1
+ #define HAVE_GMTIME_R 1
+--=20
+2.26.2
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0001-gps_shm_close-Free=
-privdata.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0001-gps_shm_close=
-Free-privdata.patch
deleted file mode 100644
index 9b3801580..000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd/0001-gps_shm_close-Free-privda=
ta.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 2a4b3bcde0d73a3a4a6644d5f944ac9d16023ba9 Mon Sep 17 00:00:00 2001
-From: Adrian Bunk <bunk@stusta.de>
-Date: Mon, 21 Oct 2019 13:53:25 +0300
-Subject: gps_shm_close: Free privdata
-
-Previously every open/close cycle leaked privdata.
-
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
-Signed-off-by: Gary E. Miller <gem@rellim.com>
-
-Upstream-Status: Backport
----
- libgps_shm.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/libgps_shm.c b/libgps_shm.c
-index d93972bba..12bb3760b 100644
---- a/libgps_shm.c
-+++ b/libgps_shm.c
-@@ -163,8 +163,12 @@ int gps_shm_read(struct gps_data_t *gpsdata)
-=20
- void gps_shm_close(struct gps_data_t *gpsdata)
- {
--    if (PRIVATE(gpsdata) && PRIVATE(gpsdata)->shmseg !=3D NULL)
--	(void)shmdt((const void *)PRIVATE(gpsdata)->shmseg);
-+    if (PRIVATE(gpsdata)) {
-+        if (PRIVATE(gpsdata)->shmseg !=3D NULL)
-+	    (void)shmdt((const void *)PRIVATE(gpsdata)->shmseg);
-+        free(PRIVATE(gpsdata));
-+        gpsdata->privdata =3D NULL;
-+    }
- }
-=20
- int gps_shm_mainloop(struct gps_data_t *gpsdata, int timeout,
---=20
-2.20.1
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb b/meta-oe/recip=
es-navigation/gpsd/gpsd_3.20.bb
similarity index 95%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
index f74ebda5f..0914f7ec2 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
@@ -7,10 +7,10 @@ PROVIDES =3D "virtual/gpsd"
=20
 SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.pat=
ch \
-    file://0001-gps_shm_close-Free-privdata.patch \
+    file://0001-Revert-SConstruct-Add-test-for-sizeof-time_t-result-.pat=
ch \
 "
-SRC_URI[md5sum] =3D "b3bf88706794eb8e5f2c2543bf7ba87b"
-SRC_URI[sha256sum] =3D "27dd24d45b2ac69baab7933da2bf6ae5fb0be90130f67e75=
3c110a3477155f39"
+SRC_URI[md5sum] =3D "cf7fdec7ce7221d20bee1a7246362b05"
+SRC_URI[sha256sum] =3D "172a7805068eacb815a3c5225436fcb0be46e7e49a5001a9=
4034eac43df85e50"
=20
 inherit scons update-rc.d python3-dir python3native systemd update-alter=
natives
=20
--=20
2.26.2

