Return-Path: <jk@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D396CC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 08:32:19 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web10.7635.1639643538174111954
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 00:32:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: codeconstruct.com.au,
 ip: 203.29.241.158, mailfrom: jk@codeconstruct.com.au)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id A76FE2027B; Thu, 16 Dec 2021 16:32:15 +0800 (AWST)
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] mctp: install dbus service configuration
Date: Thu, 16 Dec 2021 16:31:15 +0800
Message-Id: <20211216083115.417282-2-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211216083115.417282-1-jk@codeconstruct.com.au>
References: <20211216083115.417282-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 08:32:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94382

mctpd ships with an example dbus service configuration, so install in
the dbus system configuration dir.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 meta-networking/recipes-support/mctp/mctp_git.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-networking/recipes-support/mctp/mctp_git.bb b/meta-netw=
orking/recipes-support/mctp/mctp_git.bb
index 6cc5b1480..9c440b6d4 100644
--- a/meta-networking/recipes-support/mctp/mctp_git.bb
+++ b/meta-networking/recipes-support/mctp/mctp_git.bb
@@ -24,10 +24,18 @@ PACKAGECONFIG ??=3D " \
 PACKAGECONFIG[systemd] =3D ",,systemd,libsystemd"
 SYSTEMD_SERVICE:${PN} =3D "mctpd.service"
=20
+FILES:${PN} +=3D " \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
+                '${datadir}/dbus-1/system.d/mctpd.conf', '', d)} \
+"
+
 do_install:append () {
     if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false',=
 d)}; then
         install -d ${D}${systemd_system_unitdir}
         install -m 0644 ${S}/conf/mctpd.service \
                 ${D}${systemd_system_unitdir}/mctpd.service
+        install -d ${D}${datadir}/dbus-1/system.d
+        install -m 0644 ${S}/conf/mctpd-dbus.conf \
+                ${D}${datadir}/dbus-1/system.d/mctpd.conf
     fi
 }
--=20
2.33.0


