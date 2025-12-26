Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7EAE8FDA7
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 14:11:07 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.153211.1766758264754917006
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Dec 2025 06:11:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout01.t-online.de (Postfix) with SMTP id 98C041C63C
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 15:11:02 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.188]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vZ8Wu-0odTNJ0; Fri, 26 Dec 2025 15:10:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] rtkit: update 0.13 -> 0.14
Date: Fri, 26 Dec 2025 15:10:47 +0100
Message-ID: <20251226141047.2629160-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1766758256-8AFD0333-7C0280EF/0/0 CLEAN NORMAL
X-TOI-MSGID: 891bb218-dba1-4b3e-8263-9ef6ec947280
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 14:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122937

- add HOMEPAGE
- update SRC_URI

Release notes

    Fix a bug that caused all RT privileges to sometimes be dropped on re=
sume from suspend (#13 (closed))
    Drop autotools build system
    Add an rtkit_make_realtime_simple() with no arguments
    Drop default log level to reduce log spam
    Rename priority parameter of MakeThreadHighPriority to nice_level (do=
es not change API)
    Implement org.freedesktop.DBus.Properties.GetAll
    Add a sysusers config
    Correctly specify client license as MIT
    A number of documentation and build cleanups

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/rtkit/{rtkit_0.13.bb =3D> rtkit_0.14.bb}   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/rtkit/{rtkit_0.13.bb =3D> rtkit_0.14.bb} =
(75%)

diff --git a/meta-oe/recipes-support/rtkit/rtkit_0.13.bb b/meta-oe/recipe=
s-support/rtkit/rtkit_0.14.bb
similarity index 75%
rename from meta-oe/recipes-support/rtkit/rtkit_0.13.bb
rename to meta-oe/recipes-support/rtkit/rtkit_0.14.bb
index b68820dfd6..e63c786c95 100644
--- a/meta-oe/recipes-support/rtkit/rtkit_0.13.bb
+++ b/meta-oe/recipes-support/rtkit/rtkit_0.14.bb
@@ -1,10 +1,11 @@
 DESCRIPTION =3D "REALTIMEKIT Realtime Policy and Watchdog Daemon"
+HOMEPAGE =3D "https://gitlab.freedesktop.org/pipewire/rtkit"
 LICENSE =3D "GPL-3.0-only & BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da8e768468b658b3ed44971b53d4a6=
716"
=20
-SRC_URI =3D "git://github.com/heftig/rtkit.git;protocol=3Dhttps;branch=3D=
master"
+SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/rtkit.git;protocol=3D=
https;branch=3Dmaster"
=20
-SRCREV =3D "b9169402fe5e82d20efb754509eb0b191f214599"
+SRCREV =3D "c52db0a9849908613ab8775b519834671b7bec8b"
=20
 inherit meson pkgconfig features_check useradd
=20
--=20
2.52.0


