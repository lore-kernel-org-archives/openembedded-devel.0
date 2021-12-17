Return-Path: <jk@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E96C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 02:28:52 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web10.1448.1639708131806696831
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 18:28:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: codeconstruct.com.au,
 ip: 203.29.241.158, mailfrom: jk@codeconstruct.com.au)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id D8D452027B; Fri, 17 Dec 2021 10:28:48 +0800 (AWST)
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v2 2/2] mctp: install dbus service
 configuration
Date: Fri, 17 Dec 2021 10:28:10 +0800
Message-Id: 
 <08acf2875c8ec675e52dddefacc8b5c64b08d5fb.1639707922.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: 
 <cce00d3bd3f4f35b181b678181a7e769e010e8b9.1639707922.git.jk@codeconstruct.com.au>
References: 
 <cce00d3bd3f4f35b181b678181a7e769e010e8b9.1639707922.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Dec 2021 02:28:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94418

mctpd ships with an example dbus service configuration, so install in
the dbus system configuration dir.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v2:
 - Fix FILES ordering
---
 meta-networking/recipes-support/mctp/mctp_git.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-networking/recipes-support/mctp/mctp_git.bb b/meta-netw=
orking/recipes-support/mctp/mctp_git.bb
index eabc6fa16..350c2722b 100644
--- a/meta-networking/recipes-support/mctp/mctp_git.bb
+++ b/meta-networking/recipes-support/mctp/mctp_git.bb
@@ -29,5 +29,13 @@ do_install:append () {
         install -d ${D}${systemd_system_unitdir}
         install -m 0644 ${S}/conf/mctpd.service \
                 ${D}${systemd_system_unitdir}/mctpd.service
+        install -d ${D}${datadir}/dbus-1/system.d
+        install -m 0644 ${S}/conf/mctpd-dbus.conf \
+                ${D}${datadir}/dbus-1/system.d/mctpd.conf
     fi
 }
+
+FILES:${PN} +=3D " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
+            '${datadir}/dbus-1/system.d/mctpd.conf', '', d)} \
+"
--=20
2.33.0


