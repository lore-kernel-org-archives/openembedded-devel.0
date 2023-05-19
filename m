Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA179C7EE2E
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 16:34:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.31160.1684514086011092840
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 09:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8863B1FB;
	Fri, 19 May 2023 09:35:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3C0173F793;
	Fri, 19 May 2023 09:34:45 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 05/13] networkmanager: enable Vala iff gobject-introspection is available
Date: Fri, 19 May 2023 17:34:32 +0100
Message-Id: <20230519163440.2733149-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519163440.2733149-1-ross.burton@arm.com>
References: <20230519163440.2733149-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 16:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102679

From: Ross Burton <ross.burton@arm.com>

If vala is enabled but gobject-introspection isn't:

  meson.build:816:4: ERROR: Assert failed: vala api require GObject
  introspection. Use -Dvapi=3Dfalse to disable it

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../networkmanager/networkmanager_1.42.6.bb                    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.42.6.bb b/meta-networking/recipes-connectivity/networkmanager/ne=
tworkmanager_1.42.6.bb
index 31687a30b9..ec386a4fb1 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.42.6.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.42.6.bb
@@ -70,11 +70,12 @@ do_compile:prepend() {
     export GI_TYPELIB_PATH=3D"${B}}/src/libnm-client-impl${GI_TYPELIB_PA=
TH:+:$GI_TYPELIB_PATH}"
 }
=20
-PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nmcli vala \
+PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nmcli \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.uti=
ls.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d=
)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit', =
'', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data'=
, 'vala', '', d)} \
 "
=20
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
--=20
2.34.1


