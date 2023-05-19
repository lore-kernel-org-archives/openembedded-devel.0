Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4517C7EE2D
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 16:34:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.31017.1684514086706605076
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 09:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 419032F4;
	Fri, 19 May 2023 09:35:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E07163F793;
	Fri, 19 May 2023 09:34:45 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 06/13] glade: add autoconf-archive-native DEPENDS
Date: Fri, 19 May 2023 17:34:33 +0100
Message-Id: <20230519163440.2733149-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519163440.2733149-1-ross.burton@arm.com>
References: <20230519163440.2733149-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 16:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102680

From: Ross Burton <ross.burton@arm.com>

This can be satisfied via transitive dependencies, but make it an
explicit DEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/glade/glade_3.22.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb b/meta-oe/rec=
ipes-devtools/glade/glade_3.22.2.bb
index 6c1112038c..28b1279390 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Daabe87591cb8ae=
0f3c68be6977bb5522 \
                     file://COPYING.LGPL;md5=3D252890d9eee26aab7b432e8b8a=
616475"
 DEPENDS =3D "gtk+3 glib-2.0 libxml2 intltool-native \
            gnome-common-native \
+           autoconf-archive-native \
 "
=20
 inherit features_check autotools pkgconfig gnomebase gobject-introspecti=
on mime-xdg
--=20
2.34.1


