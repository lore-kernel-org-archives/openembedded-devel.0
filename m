Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BAFC10DCE
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 22:32:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.25691.1702074752802189721
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Dec 2023 14:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0552D139F;
	Fri,  8 Dec 2023 14:33:18 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0A3113F6C4;
	Fri,  8 Dec 2023 14:32:31 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 09/10] libgsf: remove obsolete DEPENDS
Date: Fri,  8 Dec 2023 22:32:23 +0000
Message-Id: <20231208223224.1348651-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208223224.1348651-1-ross.burton@arm.com>
References: <20231208223224.1348651-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 22:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107318

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb b/meta-gno=
me/recipes-gnome/libgsf/libgsf_1.14.51.bb
index a54991574e..5ee73f5638 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D61464cfe342798=
eeced82efe9ae55f63"
=20
 SECTION =3D "libs"
=20
-DEPENDS=3D "libxml2 bzip2 glib-2.0 zlib gnome-common-native"
+DEPENDS=3D "libxml2 bzip2 glib-2.0 zlib"
=20
 GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gobject-introspection gettext gtk-doc
--=20
2.34.1


