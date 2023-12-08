Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E6FC10F09
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 22:32:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25290.1702074752154038007
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Dec 2023 14:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52137106F;
	Fri,  8 Dec 2023 14:33:17 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 607CB3F6C4;
	Fri,  8 Dec 2023 14:32:31 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 08/10] gtksourceview3: remove obsolete DEPENDS
Date: Fri,  8 Dec 2023 22:32:22 +0000
Message-Id: <20231208223224.1348651-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208223224.1348651-1-ross.burton@arm.com>
References: <20231208223224.1348651-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 22:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107317

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb       | 2 +-
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb  | 2 +-
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb | 1 -
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.1=
1.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
index 75f199b10f..e504186b82 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "http://projects.gnome.org/gtksourceview/"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
=20
-DEPENDS =3D "gtk+3 libxml2 intltool-native gnome-common-native glib-2.0-=
native"
+DEPENDS =3D "gtk+3 libxml2 glib-2.0-native"
=20
 PNAME =3D "gtksourceview"
=20
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.=
bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
index 6acd00324b..353f02f1ba 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "http://projects.gnome.org/gtksourceview/"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
=20
-DEPENDS =3D "gtk+3 libxml2 intltool-native gnome-common-native glib-2.0-=
native"
+DEPENDS =3D "gtk+3 libxml2 glib-2.0-native"
=20
 PNAME =3D "gtksourceview"
=20
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0=
.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb
index f43fe2cf53..a336b19096 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fc=
d118f065f900982c24"
 DEPENDS =3D " \
     fribidi \
     glib-2.0-native \
-    gnome-common-native \
     fontconfig \
     gtk4 \
     libxml2 \
--=20
2.34.1


