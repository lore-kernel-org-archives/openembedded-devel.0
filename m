Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB321CDB46D
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 16:34:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21373.1697042037649833282
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 09:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E33C1515;
	Wed, 11 Oct 2023 09:34:38 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD69A3F7A6;
	Wed, 11 Oct 2023 09:33:56 -0700 (PDT)
From: Luca Fancellu <luca.fancellu@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego.Sueiro@arm.com,
	Rahul.Singh@arm.com
Subject: [meta-oe][PATCH 2/3] linuxptp: install default configuration file in sysconfdir
Date: Wed, 11 Oct 2023 17:33:45 +0100
Message-Id: <20231011163346.1856498-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011163346.1856498-1-luca.fancellu@arm.com>
References: <20231011163346.1856498-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 16:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105428

Install a default configuration files to be used in
${sysconfdir}/linuxptp, the default.cfg file from linuxptp
is used.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb b/meta=
-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
index 0b559df8c3c1..3c7efbdeca72 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
@@ -30,6 +30,11 @@ do_install() {
     install -d ${D}${docdir}/${PN}
     cp -R --no-dereference --preserve=3Dmode,links ${S}/configs \
         ${D}${docdir}/${PN}
+
+    # Install default configuration files
+    install -d ${D}/${sysconfdir}/linuxptp/
+    install -m 644 ${S}/configs/default.cfg \
+        ${D}${sysconfdir}/linuxptp/ptp4l.conf
 }
=20
 PACKAGES =3D+ "${PN}-configs"
--=20
2.34.1


