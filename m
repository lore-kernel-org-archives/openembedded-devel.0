Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C93C7EE32
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 16:34:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.31159.1684514085415095663
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 09:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7F452F4;
	Fri, 19 May 2023 09:35:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 82A8B3F793;
	Fri, 19 May 2023 09:34:44 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 04/13] vte9: add missing dependency on glib-2.0-native
Date: Fri, 19 May 2023 17:34:31 +0100
Message-Id: <20230519163440.2733149-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519163440.2733149-1-ross.burton@arm.com>
References: <20230519163440.2733149-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 16:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102678

From: Ross Burton <ross.burton@arm.com>

This can be satisfied via transitive dependencies, but make it an
explicit DEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-gnome/vte9/vte9.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/vte9/vte9.inc b/meta-oe/recipes-gnome/=
vte9/vte9.inc
index 49b9740129..2a165391b6 100644
--- a/meta-oe/recipes-gnome/vte9/vte9.inc
+++ b/meta-oe/recipes-gnome/vte9/vte9.inc
@@ -1,7 +1,7 @@
 SUMMARY =3D "Virtual terminal emulator GTK+ widget library"
 BUGTRACKER =3D "https://bugzilla.gnome.org/buglist.cgi?product=3Dvte"
 LICENSE =3D "LGPL-2.0-only"
-DEPENDS =3D " glib-2.0 gtk+ intltool-native gnome-common-native ncurses"
+DEPENDS =3D "glib-2.0-native glib-2.0 gtk+ intltool-native gnome-common-=
native ncurses"
 RDEPENDS:libvte =3D "vte-termcap"
=20
 # help gnomebase get the SRC_URI correct
--=20
2.34.1


