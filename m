Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2433DC7EE2F
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 12:14:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10159.1685016853586614722
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 05:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6026915BF;
	Thu, 25 May 2023 05:14:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BFA213F762;
	Thu, 25 May 2023 05:14:12 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 14/14] packagegroup-xfce-extended: only build catfish and panel-profies if G-I enabled
Date: Thu, 25 May 2023 13:13:57 +0100
Message-Id: <20230525121357.245812-14-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525121357.245812-1-ross.burton@arm.com>
References: <20230525121357.245812-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 12:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102857

From: Ross Burton <ross.burton@arm.com>

These recipes need gobject-introspection-data to be enabled.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-xfce/packagegroups/packagegroup-xfce-extended.bb  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-exten=
ded.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.=
bb
index 4da2964e8a..711059c8c4 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -63,6 +63,6 @@ RRECOMMENDS:${PN} =3D " \
     xfce4-taskmanager \
     gigolo \
     mousepad \
-    catfish \
-    xfce4-panel-profiles \
+    ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "catfish", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "xfce4-panel-profiles", "", d)} \
 "
--=20
2.34.1


