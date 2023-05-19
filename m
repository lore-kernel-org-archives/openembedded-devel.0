Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C6EC7EE2F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 16:34:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.31162.1684514088114320214
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 09:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7FD52F4;
	Fri, 19 May 2023 09:35:32 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5331A3F793;
	Fri, 19 May 2023 09:34:47 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 08/13] gnome-common: add autoconf-archive RDEPENDS
Date: Fri, 19 May 2023 17:34:35 +0100
Message-Id: <20230519163440.2733149-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519163440.2733149-1-ross.burton@arm.com>
References: <20230519163440.2733149-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 16:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102682

From: Ross Burton <ross.burton@arm.com>

If we're using autoconf-archive, add it to the RDEPENDS too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb b/=
meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
index 86a941f4a8..ceebe5ebd3 100644
--- a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
+++ b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
@@ -16,7 +16,7 @@ DEPENDS =3D ""
=20
 # Default to enable autoconf-archive to avoid conflicts
 PACKAGECONFIG ??=3D "autoconf-archive"
-PACKAGECONFIG[autoconf-archive] =3D "--with-autoconf-archive, --without-=
autoconf-archive, autoconf-archive"
+PACKAGECONFIG[autoconf-archive] =3D "--with-autoconf-archive, --without-=
autoconf-archive, autoconf-archive,autoconf-archive"
=20
 FILES:${PN} +=3D "${datadir}/aclocal"
 FILES:${PN}-dev =3D ""
--=20
2.34.1


