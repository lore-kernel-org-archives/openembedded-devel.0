Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E16C7EE31
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 12:14:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10022.1685016850751583089
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 05:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88EF815BF;
	Thu, 25 May 2023 05:14:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E9DE23F762;
	Thu, 25 May 2023 05:14:09 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 10/14] catfish: requires gobject-introspection-data DISTRO_FEATURE
Date: Thu, 25 May 2023 13:13:53 +0100
Message-Id: <20230525121357.245812-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525121357.245812-1-ross.burton@arm.com>
References: <20230525121357.245812-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 12:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102853

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb b/meta-xfce=
/recipes-apps/catfish/catfish_4.16.3.bb
index 8fe879b816..249c8e1bd8 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb
@@ -3,7 +3,9 @@ SECTION =3D "x11/application"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4325afd396febcb659c36b4953313=
5d4"
=20
-inherit xfce-app python_setuptools_build_meta gtk-icon-cache mime-xdg
+inherit xfce-app python_setuptools_build_meta gtk-icon-cache mime-xdg fe=
atures_check
+
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
 DEPENDS +=3D "python3-distutils-extra-native"
=20
--=20
2.34.1


