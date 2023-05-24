Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9234DC7EE2E
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 17:14:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.295.1684948484434144379
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 10:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2943A15BF;
	Wed, 24 May 2023 10:15:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9EA393F6C4;
	Wed, 24 May 2023 10:14:43 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/6] firewalld: add features_check on gobject-introspection-data
Date: Wed, 24 May 2023 18:14:35 +0100
Message-Id: <20230524171438.122588-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230524171438.122588-1-ross.burton@arm.com>
References: <20230524171438.122588-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 17:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102787

From: Ross Burton <ross.burton@arm.com>

This project uses gobject-introspection, so depend on the DISTRO_FEATURE.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-connectivity/firewalld/firewalld_1.2.0.bb         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-connectiv=
ity/firewalld/firewalld_1.2.0.bb b/meta-networking/dynamic-layers/meta-py=
thon/recipes-connectivity/firewalld/firewalld_1.2.0.bb
index 987cc640e1..8efbd39f74 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-connectivity/fir=
ewalld/firewalld_1.2.0.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/fir=
ewalld/firewalld_1.2.0.bb
@@ -15,7 +15,9 @@ SRC_URI[sha256sum] =3D "28fd90e88bda0dfd460f370f3534748=
11b2e295d7eb27f0d7d18ffa3d7
 # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gset=
tings.m4
 DEPENDS =3D "intltool-native glib-2.0-native nftables"
=20
-inherit gettext autotools-brokensep bash-completion pkgconfig python3nat=
ive python3-dir gsettings systemd update-rc.d ptest
+inherit gettext autotools-brokensep bash-completion pkgconfig python3nat=
ive python3-dir gsettings systemd update-rc.d ptest features_check
+
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
 PACKAGECONFIG[systemd] =3D "--with-systemd-unitdir=3D${systemd_system_un=
itdir},--disable-systemd"
--=20
2.34.1


