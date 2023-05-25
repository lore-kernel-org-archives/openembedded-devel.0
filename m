Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A341C7EE37
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 12:14:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10024.1685016852820715130
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 05:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5BC21042;
	Thu, 25 May 2023 05:14:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 15B753F762;
	Thu, 25 May 2023 05:14:11 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 13/14] xfce4-whiskermenu-plugin: don't forcibly recommend a menu editor
Date: Thu, 25 May 2023 13:13:56 +0100
Message-Id: <20230525121357.245812-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525121357.245812-1-ross.burton@arm.com>
References: <20230525121357.245812-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 12:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102856

From: Ross Burton <ross.burton@arm.com>

A menu plugin doesn't need to recommend a specific menu editor.

This also means that the whiskermenu plugin can be built without
gobject-introspection being present, which means menulibre is unbuildable=
.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../whiskermenu/xfce4-whiskermenu-plugin_2.7.1.bb               | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermen=
u-plugin_2.7.1.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whi=
skermenu-plugin_2.7.1.bb
index 6621099cbd..3dfc76f246 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugi=
n_2.7.1.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugi=
n_2.7.1.bb
@@ -6,5 +6,3 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
 inherit xfce-panel-plugin cmake
=20
 SRC_URI[sha256sum] =3D "04ae0c1764a0d5ec70f18a760d998a2109bb6724f048554d=
7d6999d9072ca63e"
-
-RRECOMMENDS:${PN} +=3D "menulibre"
--=20
2.34.1


