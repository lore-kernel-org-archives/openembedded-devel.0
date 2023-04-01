Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33869C761A6
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 03:09:05 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.13891.1680318542201752841
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Mar 2023 20:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout08.t-online.de (Postfix) with SMTP id B6F741D944
	for <openembedded-devel@lists.openembedded.org>; Sat,  1 Apr 2023 05:08:58 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.236.62]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1piRbq-0axhar0; Sat, 1 Apr 2023 05:08:54 +0200
From: Markus Volk <f_L_K@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_L_K@t-online.de>
Subject: [meta-multimedia][PATCH] nv-codec-headers: add clean target to Makefile
Date: Sat,  1 Apr 2023 05:08:43 +0200
Message-Id: <20230401030843.9510-1-f_L_K@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1680318534-67FFCC3F-3598F859/0/0 CLEAN NORMAL
X-TOI-MSGID: 706fe0c7-1940-4e5b-aad0-e42dd041c579
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Apr 2023 03:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101865

next try to fix an error on rebuilds:
   | NOTE: make clean
   | ERROR: oe_runmake failed
   | WARNING: exit code 1 from a shell command.
   | make: *** No rule to make target 'clean'.  Stop.

Signed-off-by: Markus Volk <f_L_K@t-online.de>
---
 .../0001-Makefile-add-clean-target.patch      | 25 +++++++++++++++++++
 .../nv-codec-headers_12.0.16.0.bb             |  5 +++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/nv-codec-headers/n=
v-codec-headers/0001-Makefile-add-clean-target.patch

diff --git a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec=
-headers/0001-Makefile-add-clean-target.patch b/meta-multimedia/recipes-m=
ultimedia/nv-codec-headers/nv-codec-headers/0001-Makefile-add-clean-targe=
t.patch
new file mode 100644
index 000000000..7ae749bed
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-header=
s/0001-Makefile-add-clean-target.patch
@@ -0,0 +1,25 @@
+From 3b74181d626f7dedb47377450ca7c43457a66cda Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_L_K@t-online.de>
+Date: Sat, 1 Apr 2023 04:42:32 +0200
+Subject: [PATCH] Makefile: add clean target
+
+---
+ Makefile | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index a51c2c9..fbe2aec 100644
+--- a/Makefile
++++ b/Makefile
+@@ -19,5 +19,7 @@ install: all
+ uninstall:
+ 	rm -rf '$(DESTDIR)$(PREFIX)/include/ffnvcodec' '$(DESTDIR)$(PREFIX)/$(=
LIBDIR)/pkgconfig/ffnvcodec.pc'
+=20
+-.PHONY: all install uninstall
++clean: uninstall
++
++.PHONY: all clean install uninstall
+=20
+--=20
+2.34.1
+
diff --git a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec=
-headers_12.0.16.0.bb b/meta-multimedia/recipes-multimedia/nv-codec-heade=
rs/nv-codec-headers_12.0.16.0.bb
index 411c40616..5ef7ead81 100644
--- a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-header=
s_12.0.16.0.bb
+++ b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-header=
s_12.0.16.0.bb
@@ -3,7 +3,10 @@ HOMEPAGE =3D "https://git.videolan.org/git/ffmpeg/nv-cod=
ec-headers.git"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${S}/include/ffnvcodec/dynlink_cuda.h;begin=
line=3D1;endline=3D26;md5=3Dbb54a418154445b0aa99e15f640eacf4"
=20
-SRC_URI =3D "git://git.videolan.org/git/ffmpeg/nv-codec-headers.git;bran=
ch=3Dmaster;protocol=3Dhttps"
+SRC_URI =3D " \
+    git://git.videolan.org/git/ffmpeg/nv-codec-headers.git;branch=3Dmast=
er;protocol=3Dhttps \
+    file://0001-Makefile-add-clean-target.patch \
+"
 SRCREV =3D "c5e4af74850a616c42d39ed45b9b8568b71bf8bf"
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


