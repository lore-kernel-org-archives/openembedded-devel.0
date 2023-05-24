Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A62AFC7EE32
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 17:14:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.311.1684948485810545079
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 10:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 874BF113E;
	Wed, 24 May 2023 10:15:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 000FD3F6C4;
	Wed, 24 May 2023 10:14:44 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 5/6] networkd-dispatcher: add features_check on gobject-introspection-data
Date: Wed, 24 May 2023 18:14:37 +0100
Message-Id: <20230524171438.122588-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230524171438.122588-1-ross.burton@arm.com>
References: <20230524171438.122588-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 17:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102789

From: Ross Burton <ross.burton@arm.com>

This project uses gobject-introspection, so depend on the DISTRO_FEATURE.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../networkd-dispatcher/networkd-dispatcher_2.1.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd=
-dispatcher_2.1.bb b/meta-networking/recipes-daemons/networkd-dispatcher/=
networkd-dispatcher_2.1.bb
index e929534c3f..a83dad350f 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispat=
cher_2.1.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispat=
cher_2.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D84dcc94da3ad=
b52b53ae4fa38fe49e5d"
 inherit features_check systemd
=20
 RDEPENDS:${PN} =3D "python3-pygobject python3-dbus"
-REQUIRED_DISTRO_FEATURES =3D "systemd"
+REQUIRED_DISTRO_FEATURES =3D "systemd gobject-introspection-data"
=20
 SRCREV =3D "30e278e50749a60a930ceaa0971207c6436b8a0c"
 SRC_URI =3D "git://gitlab.com/craftyguy/networkd-dispatcher;protocol=3Dh=
ttps;nobranch=3D1"
--=20
2.34.1


