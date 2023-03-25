Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66F0C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:30 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.17418.1679731407193407412
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 4AD441E822
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:25 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrp-0RoPhg0; Sat, 25 Mar 2023 09:03:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 24/32] libgtop: update 2.40.0 -> 2.41.1
Date: Sat, 25 Mar 2023 09:02:48 +0100
Message-Id: <20230325080256.923752-24-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731393-8656CC08-A8158217/0/0 CLEAN NORMAL
X-TOI-MSGID: 49763fc4-8b33-488b-96f8-efd21800b37e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101744

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libgtop/0001-Pass-correct-parameter.patch | 29 ------------
 ...-fix-compile-error-for-cross-compile.patch | 37 ---------------
 ...ude-libc-net-headers-unconditionally.patch | 46 -------------------
 .../{libgtop_2.40.0.bb =3D> libgtop_2.41.1.bb}  |  6 +--
 4 files changed, 1 insertion(+), 117 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop/0001-Pass-co=
rrect-parameter.patch
 delete mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop/0001-fix-com=
pile-error-for-cross-compile.patch
 delete mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop/0001-netload=
-Include-libc-net-headers-unconditionally.patch
 rename meta-gnome/recipes-gnome/libgtop/{libgtop_2.40.0.bb =3D> libgtop_=
2.41.1.bb} (60%)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop/0001-Pass-correct-p=
arameter.patch b/meta-gnome/recipes-gnome/libgtop/libgtop/0001-Pass-corre=
ct-parameter.patch
deleted file mode 100644
index 5ea8eed51..000000000
--- a/meta-gnome/recipes-gnome/libgtop/libgtop/0001-Pass-correct-paramete=
r.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From e969ac59335d3fb1cd228f8e7c4f6c2dda4fa536 Mon Sep 17 00:00:00 2001
-From: Avinash Sonawane <rootkea@gmail.com>
-Date: Mon, 20 Dec 2021 13:33:42 +0530
-Subject: [PATCH] Pass correct parameter
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libgtop/-/merg=
e_requests/35]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/daemon/main.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/daemon/main.c b/src/daemon/main.c
-index b51addf..eaee3b3 100644
---- a/src/daemon/main.c
-+++ b/src/daemon/main.c
-@@ -222,8 +222,9 @@ handle_parent_connection (int s)
- 		       0, NULL);
- 	    break;
-     case GLIBTOP_CMND_PROC_IO:
-+        memcpy (&pid, parameter, sizeof (pid_t));
- 	    glibtop_get_proc_io_l
--		(server, &resp->u.data.proc_io, parameter);
-+		(server, &resp->u.data.proc_io, pid);
- 	    do_output (s, resp, _offset_data (proc_io),
- 		       0, NULL);
- 	    break;
---=20
-2.37.2
-
diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop/0001-fix-compile-er=
ror-for-cross-compile.patch b/meta-gnome/recipes-gnome/libgtop/libgtop/00=
01-fix-compile-error-for-cross-compile.patch
deleted file mode 100644
index 1bd6e101b..000000000
--- a/meta-gnome/recipes-gnome/libgtop/libgtop/0001-fix-compile-error-for=
-cross-compile.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From e865a93000913b4597607289356114cd159f4e28 Mon Sep 17 00:00:00 2001
-From: Your Name <you@example.com>
-Date: Fri, 21 May 2021 03:02:29 +0000
-Subject: [PATCH] fix compile error for cross compile
-
-On some distros, such as fedora32, cross compile failed with following
-error since host library is used. undefined reference to
-`stat64@GLIBC_2.33'
-
-According doc of ld, set searchdir begins with "=3D", but not hardcoded
-locations.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libgtop/-/mer=
ge_requests/26]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 472f44b..ed6a4d7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -270,8 +270,8 @@ AC_ARG_ENABLE(fatal-warnings,
-                         [Define to enable fatal warnings]))
-=20
- dnl These definitions are expanded in make.
--LIBGTOP_LIBS=3D'-L$(libdir)'
--LIBGTOP_INCS=3D'-I$(includedir)/libgtop-2.0'
-+LIBGTOP_LIBS=3D'-L=3D$(libdir)'
-+LIBGTOP_INCS=3D'-I=3D$(includedir)/libgtop-2.0'
-=20
- if test x$libgtop_have_sysinfo =3D xyes ; then
-   LIBGTOP_INCS=3D"$LIBGTOP_INCS -DHAVE_LIBGTOP_SYSINFO"
---=20
-2.26.2
-
diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop/0001-netload-Includ=
e-libc-net-headers-unconditionally.patch b/meta-gnome/recipes-gnome/libgt=
op/libgtop/0001-netload-Include-libc-net-headers-unconditionally.patch
deleted file mode 100644
index c4f7da4bf..000000000
--- a/meta-gnome/recipes-gnome/libgtop/libgtop/0001-netload-Include-libc-=
net-headers-unconditionally.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 3c6f70e50cb586ac4add4dea627c316242691040 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Jul 2017 09:17:29 -0700
-Subject: [PATCH] netload: Include libc net headers unconditionally
-
-This fixes compile with musl, and this conditional
-is not needed now a days if we are still using glibc < 1.0
-we have other bigger problems
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sysdeps/linux/netload.c | 11 -----------
- 1 file changed, 11 deletions(-)
-
-diff --git a/sysdeps/linux/netload.c b/sysdeps/linux/netload.c
-index c275db2..446bddd 100644
---- a/sysdeps/linux/netload.c
-+++ b/sysdeps/linux/netload.c
-@@ -34,8 +34,6 @@
- #include <sys/socket.h>
- #include <sys/ioctl.h>
-=20
--#if !defined (_LIBC) && defined (__GNU_LIBRARY__) && __GNU_LIBRARY__ > =
1
--/* GNU LibC */
- #include <net/if.h>
- #include <netinet/ip_icmp.h>
- #include <netinet/in.h>
-@@ -43,15 +41,6 @@
- #include <netinet/tcp.h>
- #include <netinet/udp.h>
- #include <net/if.h>
--#else /* Libc 5 */
--#include <linux/if.h>
--#include <linux/in.h>
--#include <linux/ip.h>
--#include <linux/icmp.h>
--#include <linux/tcp.h>
--#include <linux/udp.h>
--#endif
--
-=20
- #ifdef HAVE_IFADDRS_H
- /* needed for IPV6 support */
---=20
-2.13.2
-
diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb b/meta-gn=
ome/recipes-gnome/libgtop/libgtop_2.41.1.bb
similarity index 60%
rename from meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
rename to meta-gnome/recipes-gnome/libgtop/libgtop_2.41.1.bb
index fa95e0bee..9a50b5e82 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.1.bb
@@ -6,10 +6,6 @@ inherit gnomebase lib_package gtk-doc gobject-introspect=
ion gettext upstream-ver
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-SRC_URI +=3D "file://0001-fix-compile-error-for-cross-compile.patch \
-            file://0001-Pass-correct-parameter.patch \
-            "
-
-SRC_URI[archive.sha256sum] =3D "78f3274c0c79c434c03655c1b35edf7b95ec0421=
430897fb1345a98a265ed2d4"
+SRC_URI[archive.sha256sum] =3D "43ea9ad13f7caf98303e64172b191be9b96bab34=
0b019deeec72251ee140fe3b"
=20
 DEPENDS =3D "glib-2.0 libxau"
--=20
2.34.1


