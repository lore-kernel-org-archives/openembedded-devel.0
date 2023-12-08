Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7E4C169C2
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 22:32:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.25687.1702074748755573911
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Dec 2023 14:32:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBD2C139F;
	Fri,  8 Dec 2023 14:33:13 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F1C7C3F6C4;
	Fri,  8 Dec 2023 14:32:27 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 03/10] gspell: update DEPENDS, switch iso-codes for icu
Date: Fri,  8 Dec 2023 22:32:17 +0000
Message-Id: <20231208223224.1348651-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208223224.1348651-1-ross.burton@arm.com>
References: <20231208223224.1348651-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 22:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107312

From: Ross Burton <ross.burton@arm.com>

gspell was changed in 2020 to use icu instead of iso-codes[1].

Signed-off-by: Ross Burton <ross.burton@arm.com>

[1] https://gitlab.gnome.org/GNOME/gspell/-/commit/d5a8b72e194a6542ac4f7c=
850fe126c3c80d3a05
---
 meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb b/meta-gnom=
e/recipes-gnome/gspell/gspell_1.12.2.bb
index 7ad55da089..2668fc009f 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.12.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://wiki.gnome.org/Projects/gspell"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8c2e1ec1540fb3e0beb68361344cb=
a7e"
=20
-DEPENDS =3D "gtk+3 iso-codes enchant2"
+DEPENDS =3D "gtk+3 icu enchant2"
=20
 GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gettext gobject-introspection vala gtk-doc
--=20
2.34.1


