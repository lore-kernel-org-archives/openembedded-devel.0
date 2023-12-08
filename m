Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95299C46CC5
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 22:32:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.25688.1702074750124604949
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Dec 2023 14:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5083B11FB;
	Fri,  8 Dec 2023 14:33:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 569363F6C4;
	Fri,  8 Dec 2023 14:32:29 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 05/10] librest: inherit gtk-doc
Date: Fri,  8 Dec 2023 22:32:19 +0000
Message-Id: <20231208223224.1348651-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208223224.1348651-1-ross.burton@arm.com>
References: <20231208223224.1348651-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 22:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107314

From: Ross Burton <ross.burton@arm.com>

This recipe has gtk-doc API documentation.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-gnome/rest/librest_0.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb b/meta-gnome/=
recipes-gnome/rest/librest_0.8.1.bb
index 3a56486c0c..63372afa5d 100644
--- a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
+++ b/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
@@ -11,7 +11,7 @@ DEPENDS =3D " \
 "
=20
 GNOMEBASEBUILDCLASS =3D "autotools"
-inherit gnomebase gobject-introspection vala pkgconfig
+inherit gnomebase gobject-introspection vala pkgconfig gtk-doc
=20
 GNOMEBN =3D "rest"
=20
--=20
2.34.1


