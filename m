Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C58C7EE30
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 16:34:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.31018.1684514087480565852
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 09:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF9831FB;
	Fri, 19 May 2023 09:35:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 99F103F793;
	Fri, 19 May 2023 09:34:46 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 07/13] libgxim: add autoconf-archive-native DEPENDS
Date: Fri, 19 May 2023 17:34:34 +0100
Message-Id: <20230519163440.2733149-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519163440.2733149-1-ross.burton@arm.com>
References: <20230519163440.2733149-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 16:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102681

From: Ross Burton <ross.burton@arm.com>

This can be satisfied via transitive dependencies, but make it an
explicit DEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-oe/=
recipes-extended/libgxim/libgxim_0.5.0.bb
index 2d93936f37..3912e0a8d7 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
+++ b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM =3D "\
 file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a1"
=20
 EXTRA_OECONF =3D "--enable-debug --disable-static --disable-rebuilds --e=
nable-compile-warnings=3Dminimum"
-DEPENDS +=3D "gtk+ glib-2.0 glib-2.0-native ruby-native intltool-native =
gnome-common-native"
+DEPENDS +=3D "gtk+ glib-2.0 glib-2.0-native ruby-native intltool-native =
gnome-common-native autoconf-archive-native"
=20
 inherit features_check autotools pkgconfig gettext
=20
--=20
2.34.1


