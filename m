Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B44AEB64DC
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 12:41:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.38540.1688992889730788464
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jul 2023 05:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96088D75;
	Mon, 10 Jul 2023 05:42:11 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E72CC3F67D;
	Mon, 10 Jul 2023 05:41:28 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] xsetmode: remove obsolete utility
Date: Mon, 10 Jul 2023 13:41:26 +0100
Message-Id: <20230710124127.3177352-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710124127.3177352-1-ross.burton@arm.com>
References: <20230710124127.3177352-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jul 2023 12:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103725

From: Ross Burton <ross.burton@arm.com>

This hasn't seen any upstream activity since 2017, as users should be
using xinput --set-mode instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-oe.bb         |  1 -
 .../recipes-graphics/xorg-app/xsetmode_1.0.0.bb   | 15 ---------------
 2 files changed, 16 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-app/xsetmode_1.0.0.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index c555ade629..20c9b9d412 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -569,7 +569,6 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D"\
     xclock \
     xfontsel \
     xkbprint \
-    xsetmode \
     xlsatoms \
     xlsclients \
     xlsfonts \
diff --git a/meta-oe/recipes-graphics/xorg-app/xsetmode_1.0.0.bb b/meta-o=
e/recipes-graphics/xorg-app/xsetmode_1.0.0.bb
deleted file mode 100644
index b757329d94..0000000000
--- a/meta-oe/recipes-graphics/xorg-app/xsetmode_1.0.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require recipes-graphics/xorg-app/xorg-app-common.inc
-
-SUMMARY =3D "X.Org X11 X client utilities"
-HOMEPAGE =3D "http://cgit.freedesktop.org/xorg/app/xsetmode/"
-DESCRIPTION =3D "xsetmode sets the mode of an XInput device to either ab=
solute \
-or relative."
-SECTION =3D "x11/app"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9b37e00e7793b667cbc64f9df7b6d=
733"
-
-DEPENDS +=3D "libxi"
-BBCLASSEXTEND =3D "native"
-
-SRC_URI[md5sum] =3D "d074e79d380b031d2f60e4cd56538c93"
-SRC_URI[sha256sum] =3D "988b47cd922991c6e6adbce15dc386ac75690b61744b526c=
3af5a4eaa9afa0aa"
--=20
2.34.1


