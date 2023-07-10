Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30858EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 12:41:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.38367.1688992890463055063
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jul 2023 05:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F48C113E;
	Mon, 10 Jul 2023 05:42:12 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 93B493F67D;
	Mon, 10 Jul 2023 05:41:29 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] libxkbui: remove obsolete recipe
Date: Mon, 10 Jul 2023 13:41:27 +0100
Message-Id: <20230710124127.3177352-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710124127.3177352-1-ross.burton@arm.com>
References: <20230710124127.3177352-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jul 2023 12:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103726

From: Ross Burton <ross.burton@arm.com>

The only known consumer of this library was the xorgcfg utility, which
was disabled by default in xorg-server 1.4 (Sep. 2007) and removed in
xorg-server 1.6 (Feb. 2009).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-oe.bb            |  1 -
 meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb  | 12 ------------
 2 files changed, 13 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 20c9b9d412..0a88f37acf 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -595,7 +595,6 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D"\
     font-misc-misc \
     xorg-fonts-100dpi \
     libxaw6 \
-    libxkbui \
     libxpresent \
     xcb-util-cursor \
     xserver-common \
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb b/meta-o=
e/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb
deleted file mode 100644
index e7c9b64e83..0000000000
--- a/meta-oe/recipes-graphics/xorg-lib/libxkbui_1.0.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require recipes-graphics/xorg-lib/xorg-lib-common.inc
-SUMMARY =3D "X11 keyboard UI presentation library"
-LICENSE =3D "SGI-1"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4641deddaa80fe7ca88e944e1fd94=
a94"
-DEPENDS +=3D "virtual/libx11 libxt libxkbfile"
-PE =3D "1"
-PR =3D "r10"
-
-XORG_EXT =3D "tar.bz2"
-
-SRC_URI[md5sum] =3D "1143e456f7429e18e88f2eadb2f2b6b1"
-SRC_URI[sha256sum] =3D "20c23101d63234ee5f6d696dfa069b29c6c58e39eff433bc=
d7705b50b3ffa214"
--=20
2.34.1


