Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45CBCE7A8A
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 22:26:25 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.49910.1695594379601961477
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Sep 2023 15:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout10.t-online.de (Postfix) with SMTP id 0F094157EF
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 00:26:18 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.34.4]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qkXYJ-4Cm8bh0; Mon, 25 Sep 2023 00:26:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] udisks2: Upgrade 2.9.4 -> 2.10.1
Date: Mon, 25 Sep 2023 00:26:09 +0200
Message-ID: <20230924222609.31377-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695594371-98FE2CF5-4FA0F688/0/0 CLEAN NORMAL
X-TOI-MSGID: e801d623-c021-4a34-8f15-a2f5e0fd4d2e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 22:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105118

- add a patch to fix reproducibility issues

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...1-Makefile.am-Dont-include-buildpath.patch | 47 +++++++++++++++++++
 .../{udisks2_2.9.4.bb =3D> udisks2_2.10.1.bb}   |  8 +++-
 2 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/0001-Makefile.=
am-Dont-include-buildpath.patch
 rename meta-oe/recipes-support/udisks/{udisks2_2.9.4.bb =3D> udisks2_2.1=
0.1.bb} (86%)

diff --git a/meta-oe/recipes-support/udisks/udisks2/0001-Makefile.am-Dont=
-include-buildpath.patch b/meta-oe/recipes-support/udisks/udisks2/0001-Ma=
kefile.am-Dont-include-buildpath.patch
new file mode 100644
index 000000000..727c5a32f
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks2/0001-Makefile.am-Dont-includ=
e-buildpath.patch
@@ -0,0 +1,47 @@
+From b1b58f122a3e05b5689358fdd3203ba110cca567 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sun, 24 Sep 2023 22:20:42 +0200
+Subject: [PATCH] Reproducibility fix
+
+This fixes:
+WARNING: udisks2-2.10.1-r0 do_package_qa: QA Issue: File /usr/lib/udisks=
2/modules/libudisks2_btrfs.so in package udisks2 contains reference to TM=
PDIR
+File /usr/lib/udisks2/modules/libudisks2_lvm2.so in package udisks2 cont=
ains reference to TMPDIR
+File /usr/libexec/udisks2/udisksd in package udisks2 contains reference =
to TMPDIR [buildpaths]
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ modules/lvm2/Makefile.am | 2 +-
+ src/Makefile.am          | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/modules/lvm2/Makefile.am b/modules/lvm2/Makefile.am
+index 67b8aa6b3..e4ae462e7 100644
+--- a/modules/lvm2/Makefile.am
++++ b/modules/lvm2/Makefile.am
+@@ -16,7 +16,7 @@ CPPFLAGS =3D                                          =
                           \
+ 	-DLVM_HELPER_DIR=3D\""$(prefix)/lib/udisks2/"\"                       =
   \
+ 	-D_POSIX_PTHREAD_SEMANTICS -D_REENTRANT                               =
 \
+ 	-DUDISKS_COMPILATION                                                  =
 \
+-	-DBUILD_DIR=3D\"$(abs_top_builddir)/\"                                =
   \
++	-DBUILD_DIR=3D\"/usr/src/\"                                           =
   \
+ 	$(POLKIT_GOBJECT_1_CFLAGS)                                            =
 \
+ 	$(GLIB_CFLAGS)                                                        =
 \
+ 	$(GIO_CFLAGS)                                                         =
 \
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 5a174d1ab..0da3a497b 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -20,7 +20,7 @@ CPPFLAGS =3D                                          =
                           \
+ 	-DUDISKS_MODULE_DIR=3D\"$(libdir)/udisks2/modules\"                   =
   \
+ 	-D_POSIX_PTHREAD_SEMANTICS -D_REENTRANT                               =
 \
+ 	-DUDISKS_COMPILATION                                                  =
 \
+-	-DBUILD_DIR=3D\"$(abs_top_builddir)/\"                                =
   \
++	-DBUILD_DIR=3D\"/usr/src/\"                                           =
   \
+ 	$(POLKIT_GOBJECT_1_CFLAGS)                                            =
 \
+ 	$(GUDEV_CFLAGS)                                                       =
 \
+ 	$(GLIB_CFLAGS)                                                        =
 \
+--=20
+2.42.0
+
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb b/meta-oe/re=
cipes-support/udisks/udisks2_2.10.1.bb
similarity index 86%
rename from meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
rename to meta-oe/recipes-support/udisks/udisks2_2.10.1.bb
index 203006371..cb1cbe670 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.10.1.bb
@@ -17,8 +17,11 @@ DEPENDS +=3D "${@bb.utils.filter('DISTRO_FEATURES', 's=
ystemd', d)}"
=20
 RDEPENDS:${PN} =3D "acl"
=20
-SRC_URI =3D "git://github.com/storaged-project/udisks.git;branch=3D2.9.x=
-branch;protocol=3Dhttps"
-SRCREV =3D "001c486e6d099ed33e2de4f5c73c03e3ee180f81"
+SRC_URI =3D " \
+	git://github.com/storaged-project/udisks.git;branch=3D2.10.x-branch;pro=
tocol=3Dhttps \
+	file://0001-Makefile.am-Dont-include-buildpath.patch \
+"
+SRCREV =3D "18c9faf089e306ad6f3f51f5cb887a6b9aa08350"
 S =3D "${WORKDIR}/git"
=20
 CVE_PRODUCT =3D "udisks"
@@ -45,6 +48,7 @@ FILES:${PN} +=3D " \
     ${datadir}/dbus-1/ \
     ${datadir}/polkit-1 \
     ${datadir}/bash-completion \
+    ${datadir}/zsh \
     ${libdir}/polkit-1/extensions/*.so \
     ${nonarch_base_libdir}/udev/* \
     ${exec_prefix}${nonarch_base_libdir}/udisks2/* \
--=20
2.42.0


