Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556A6CD6E4A
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 07:32:09 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2258.1780126326694358616
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2026 00:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=a65RQD/b;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout08.t-online.de (Postfix) with SMTP id 866B7E39C
	for <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 09:32:04 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.169.166]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wTEAq-3a1tLt0; Sat, 30 May 2026 09:32:00 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libcamera: add workaround to fix build with gcc 16
Date: Sat, 30 May 2026 09:31:55 +0200
Message-ID: <20260530073155.1588404-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1780126320-337FDF83-D639FC6B/0/0 CLEAN NORMAL
X-TOI-MSGID: 9777ed06-fdd0-4a58-b1df-6c1310dc7ddf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1780126324; i=f_l_k@t-online.de;
	bh=PjzIVOAIeS2VewKsf2BIv2/buycoBbWFtvCWFI+YU5M=;
	h=From:To:Subject:Date;
	b=a65RQD/bIuh/LRRmDlJzXgz6A+QPaD3B099KrGKUEEizXwsorJDO5HLwEPo1HOanL
	 et2xSwJHYB5wl64NvNYQMSfMDAO9pNqq12KvbCeXtcb6gJhRTsTLJV+uoGxrVPmUPT
	 PoBa6HKODUYEM6Hur9zsfZPDJlXPT18NL8FYFwN2/fAhNvwslEvHXuvKbFhuYQjoo2
	 BR9H01T5fuQVTacr39mF782eD+r6yvrx+lakNdPiiQNpDVvs0qvrax8RqNUKHVQRBV
	 vS51EZrSyVvxT500cHs2ckbNZcxGJLVnV+6/zpe7eAPnc+hIest+TmmFqRJAxEm1Bo
	 5VVPK7CR7KV2w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 07:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127294

libcamera fails if using gcc16 with -Werror=3Darray-bounds=3D

Ignore this issue for now until it is properly fixed

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
index 74cb910417..9be439fdf1 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
@@ -100,3 +100,5 @@ FILES:${PN}-pycamera =3D "${PYTHON_SITEPACKAGES_DIR}/=
libcamera"
 GLIBC_64BIT_TIME_FLAGS =3D ""
=20
 INSANE_SKIP +=3D "32bit-time"
+
+CXXFLAGS +=3D "-Wno-error=3Darray-bounds=3D"
--=20
2.54.0


