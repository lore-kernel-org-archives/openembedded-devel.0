Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B6CC7EE29
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 16:34:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.31164.1684514089492339568
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 09:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1993D2F4;
	Fri, 19 May 2023 09:35:34 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B8DE43F793;
	Fri, 19 May 2023 09:34:48 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 10/13] python3-kivy: depend on gobject-introspection-data DISTRO_FEATURE
Date: Fri, 19 May 2023 17:34:37 +0100
Message-Id: <20230519163440.2733149-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519163440.2733149-1-ross.burton@arm.com>
References: <20230519163440.2733149-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 16:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102684

From: Ross Burton <ross.burton@arm.com>

Any user of python-gstreamer (and so, pygobject) needs to support
gobject-introspection.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb b=
/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
index 684bca03e1..ca1fc5f96d 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
@@ -43,7 +43,7 @@ export KIVY_GRAPHICS
 KIVY_CROSS_SYSROOT=3D"${RECIPE_SYSROOT}"
 export KIVY_CROSS_SYSROOT
=20
-REQUIRED_DISTRO_FEATURES +=3D "x11 opengl"
+REQUIRED_DISTRO_FEATURES +=3D "x11 opengl gobject-introspection-data"
=20
 DEPENDS +=3D " \
     gstreamer1.0 \
--=20
2.34.1


