Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1DEC77B7A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 16:35:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.31167.1684514090915418780
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 09:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 773CF1FB;
	Fri, 19 May 2023 09:35:35 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2AED93F793;
	Fri, 19 May 2023 09:34:50 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 12/13] system-config-printer: clean up DEPENDS
Date: Fri, 19 May 2023 17:34:39 +0100
Message-Id: <20230519163440.2733149-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519163440.2733149-1-ross.burton@arm.com>
References: <20230519163440.2733149-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 16:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102686

From: Ross Burton <ross.burton@arm.com>

Remove intltool-native as it is not used, and add autoconf-archive-native=
.

Also explicitly disable systemd when not selected to be sure it doesn't
automatically enable.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../system-config-printer/system-config-printer_1.5.18.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-printing/=
system-config-printer/system-config-printer_1.5.18.bb b/meta-networking/d=
ynamic-layers/meta-python/recipes-printing/system-config-printer/system-c=
onfig-printer_1.5.18.bb
index e70edef271..883d582371 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-=
config-printer/system-config-printer_1.5.18.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-=
config-printer/system-config-printer_1.5.18.bb
@@ -11,10 +11,10 @@ inherit autotools gettext pkgconfig python3native fea=
tures_check
=20
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
-DEPENDS =3D "cups glib-2.0 libusb xmlto-native intltool-native desktop-f=
ile-utils-native"
+DEPENDS =3D "cups glib-2.0 libusb xmlto-native desktop-file-utils-native=
 autoconf-archive-native"
=20
 PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}=
"
-PACKAGECONFIG[systemd] =3D ",,systemd"
+PACKAGECONFIG[systemd] =3D ",--without-systemdsystemunitdir,systemd"
=20
 do_configure:prepend() {
     # This file is not provided if fetching from git but required for co=
nfigure
--=20
2.34.1


