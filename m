Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8149AC46CA3
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 22:32:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25287.1702074749401363183
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Dec 2023 14:32:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EC17106F;
	Fri,  8 Dec 2023 14:33:14 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A3DD33F6C4;
	Fri,  8 Dec 2023 14:32:28 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 04/10] librest: remove spurious build dependencies
Date: Fri,  8 Dec 2023 22:32:18 +0000
Message-Id: <20231208223224.1348651-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208223224.1348651-1-ross.burton@arm.com>
References: <20231208223224.1348651-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 22:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107313

From: Ross Burton <ross.burton@arm.com>

These are not dependencies of librest 0.8.1. I imagine they ended up in
this recipe when the latest version was downgraded back to 0.8.1 and the
dependencies not reviewed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-gnome/rest/librest_0.8.1.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb b/meta-gnome/=
recipes-gnome/rest/librest_0.8.1.bb
index 51dc44cc4d..3a56486c0c 100644
--- a/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
+++ b/meta-gnome/recipes-gnome/rest/librest_0.8.1.bb
@@ -4,13 +4,10 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
=20
 DEPENDS =3D " \
-    gi-docgen \
-    gi-docgen-native \
     glib-2.0 \
     glib-2.0-native \
-    json-glib \
     libsoup-2.4 \
-    libxml2-native \
+    libxml2 \
 "
=20
 GNOMEBASEBUILDCLASS =3D "autotools"
--=20
2.34.1


