Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21A5C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 02:23:55 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.1882.1721096626518644577
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 19:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout10.t-online.de (Postfix) with SMTP id 7442714C80
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 04:23:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.173.141]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sTXqq-0wpMht0; Tue, 16 Jul 2024 04:23:36 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] lvm2: install all systemd service files
Date: Tue, 16 Jul 2024 04:24:37 +0200
Message-ID: <20240716022437.419492-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1721096616-153EF352-28E90202/0/0 CLEAN NORMAL
X-TOI-MSGID: f846cde6-7e29-41d9-8850-addcc7349411
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 02:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111366

This fixes an install-vs-shipped issue
NOTE: Executing Tasks
ERROR: lvm2-2.03.25-r0 do_package: QA Issue: lvm2: Files/directories were=
 installed but not shipped in any package:
  /usr/lib/systemd/system/lvm-devices-import.path
  /usr/lib/systemd/system/lvm-devices-import.service
Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
lvm2: 2 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/lvm2/lvm2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.bb b/meta-oe/recipes-suppo=
rt/lvm2/lvm2.bb
index 868f5a249..f1a1aae2c 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2.bb
@@ -68,7 +68,7 @@ FILES:libdevmapper =3D " \
=20
 FILES:${PN} +=3D " \
     ${libdir}/device-mapper/*.so \
-    ${systemd_system_unitdir}/lvm2-pvscan@.service \
+    ${systemd_system_unitdir} \
     ${PYTHON_SITEPACKAGES_DIR}/lvmdbusd \
     ${datadir}/dbus-1/system-services/com.redhat.lvmdbus1.service \
 "
--=20
2.45.1


