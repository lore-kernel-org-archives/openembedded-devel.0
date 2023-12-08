Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA53C10F1D
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 22:32:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.25686.1702074748677397187
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Dec 2023 14:32:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45EE311FB;
	Fri,  8 Dec 2023 14:33:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4BEBB3F6C4;
	Fri,  8 Dec 2023 14:32:27 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 02/10] gspell: inherit gtk-doc
Date: Fri,  8 Dec 2023 22:32:16 +0000
Message-Id: <20231208223224.1348651-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208223224.1348651-1-ross.burton@arm.com>
References: <20231208223224.1348651-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 22:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107311

From: Ross Burton <ross.burton@arm.com>

This recipe has gtk-doc API documentation.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb b/meta-gnom=
e/recipes-gnome/gspell/gspell_1.12.2.bb
index 67e64915b4..7ad55da089 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8c2e1ec1540fb3=
e0beb68361344cba7e"
 DEPENDS =3D "gtk+3 iso-codes enchant2"
=20
 GNOMEBASEBUILDCLASS =3D "autotools"
-inherit gnomebase gettext gobject-introspection vala
+inherit gnomebase gettext gobject-introspection vala gtk-doc
=20
 SRC_URI[archive.sha256sum] =3D "b4e993bd827e4ceb6a770b1b5e8950fce3be9c8b=
2b0cbeb22fdf992808dd2139"
--=20
2.34.1


