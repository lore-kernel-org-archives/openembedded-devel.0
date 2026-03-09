Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B84F3C244
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 12:16:35 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12797.1773058585045469830
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 05:16:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout08.t-online.de (Postfix) with SMTP id B7FE7F1D8
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Mar 2026 13:16:22 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.45.136]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vzZX4-4cfD4z0; Mon, 9 Mar 2026 13:16:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gdm: conflict with dbus-broker
Date: Mon,  9 Mar 2026 13:16:08 +0100
Message-ID: <20260309121609.6867-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1773058582-D2FF16FB-B1AE638D/0/0 CLEAN NORMAL
X-TOI-MSGID: 533bc8fc-f3ce-4cb4-bc24-66835b38bd6e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 12:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124997

gdm requires dbus-run-session and fails to run
org.freedeskktop.systemd1 if using dbus-broker

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gdm/gdm_49.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_49.2.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_49.2.bb
index e1f3c488a8..94e256e4f2 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_49.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_49.2.bb
@@ -79,3 +79,6 @@ FILES:${PN} +=3D " \
 "
=20
 RDEPENDS:${PN} +=3D "${PN}-base"
+# gdm relies on dbus-run-session provided by dbus
+RCONFLICTS:${PN} +=3D "dbus-broker"
+RDEPENDS:${PN} +=3D "dbus"
--=20
2.53.0


