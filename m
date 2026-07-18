Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A20FC4451C
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:25:19 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2277.1784363114973749399
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=J9Oxtrrk;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd96.aul.t-online.de (fwd96.aul.t-online.de [10.223.144.122])
	by mailout09.t-online.de (Postfix) with SMTP id 5932037D3A
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Jul 2026 10:25:12 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.169.237]) by fwd96.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wl0MB-05Y0BN0; Sat, 18 Jul 2026 10:25:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] crossguid: remove crossguid-config.cmake file
Date: Sat, 18 Jul 2026 10:25:03 +0200
Message-ID: <20260718082503.4018534-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1784363111-4BFFC957-55137C7E/0/0 CLEAN NORMAL
X-TOI-MSGID: 238c3f28-1e24-4745-9786-f46c167ba5e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1784363112; i=f_l_k@t-online.de;
	bh=sCKOGLnUapzOwsrdoWRHFbZnE7KtgijlZgQzeM8cVnI=;
	h=From:To:Subject:Date;
	b=J9Oxtrrk/Z8NnCfYMSghfJU/6avbJkFgPyQnvBgQH9kGerPQiY+ztTVvTLVQhLlkh
	 5pcVXWfpG+xkSUY9TUsMNahBwKbuyaaZXicSdFv1aujjfIbp3YbP/B/Q2leYU6QDAU
	 Ri9veDukpgsFP8kS/nSBX56umSHu9Is897VakwmdskTZj3z0Id8JKw+L0sF1DZoI0M
	 KJoHLmjJFVq23OI2zulCgRVmSz5EaM5j4Jt7QqCG4nHVXoyf9So+cXm7cYjBW6niEV
	 NXznhagzVpgmbRKEXrFNOaUjPcktsUJlgpZNe1FBC0XtWpFQ2A5PFIym2HdsnIF1Wh
	 P51yxzOT8qZEw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Jul 2026 08:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128252

crossguid adds an automatically generated cmake configuration file named =
=E2=80=9Ccrossguid-config.cmake=E2=80=9D,
which generally works for kodi but causes a reproducibility issue because=
 it contains the full path
to ${STAGING_LIBDIR}/libuuid.so.

It was fixed using a `sed` command that changed the line to `/usr/lib/lib=
uuid.so`.

This does not work if `HOST !=3D TARGET`, since in that case a link is cr=
eated to native libuuid.

Completely removing =E2=80=9Ccrossguid-config.cmake=E2=80=9D resolves thi=
s issue, since Kodi then uses pkgconfig to locate crossguid.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb=
 b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
index 48673cddcd..730195ff3d 100644
--- a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
+++ b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
@@ -12,11 +12,10 @@ SRC_URI =3D "git://github.com/graeme-hill/crossguid;p=
rotocol=3Dhttps;branch=3Dmaster \
            file://run-ptest \
            file://0001-include-missing-cstdint.patch"
=20
-
 inherit cmake ptest
=20
 do_install:append() {
-    sed -i -e 's|${STAGING_DIR_HOST}||g' ${D}${datadir}/crossguid/cmake/=
crossguid-config.cmake
+    rm -rf ${D}${datadir}/crossguid/cmake
 }
=20
 do_install_ptest() {
--=20
2.55.0


