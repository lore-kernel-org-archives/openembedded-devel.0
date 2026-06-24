Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326D5CDB481
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 13:31:07 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7139.1782307858851365596
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 06:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Qa0ATTR0;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout03.t-online.de (Postfix) with SMTP id 3AA7EE43A
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 15:30:56 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.171.242]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wcNgn-3u4XMg0; Wed, 24 Jun 2026 15:30:49 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/2] packagegroup-meta-multimedia: add libdvdread to RDEPENDS
Date: Wed, 24 Jun 2026 15:30:44 +0200
Message-ID: <20260624133044.1093352-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624133044.1093352-1-f_l_k@t-online.de>
References: <20260624133044.1093352-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1782307849-DAFFAA3F-504F33F6/0/0 CLEAN NORMAL
X-TOI-MSGID: 2949ff09-f752-47e0-bbd2-f17e84b35c50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782307856; i=f_l_k@t-online.de;
	bh=Swu7i61G22sbPgTH64nF+pVqSUyGu41nWcSKKeJ9+wU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Qa0ATTR0VpmawIba5vMJwrJOO4bX4gDKGzIiiEFJvqy2wtooX+vpKjWNMSUjaw9u/
	 cglBsCbZj7osMdOsvMkF6OPM3aKvwxITbSsaddyxufC6Wl8zcBicel3DDJ4Xr6jlcu
	 DnCfi/gle76zZvBhEtQ6KDl5Vj6Fki1Q1fctyNN4fND9FXnUm/kCdAyDcilGnu/nbO
	 ltb6qaP0hLvh5YALJwBNYLmXu4eu09I7teCXJgAaf6VSRYoWYK3/Xhx9IHCRYxYJdB
	 A7aldIP8mPTBGit0h1cBIix/BEf3S1Gs+EWW0vfjzVd58DRdEEpbmJsp2BkZKmT791
	 pvfAiSEvktFuA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 13:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127715

libdvdread has recently been moved to meta-multimedia and the 'libdvdred'=
 runtime
dependency was removed from packagegroup-meta-oe
Add the runtime dependency to packagegroup-meta-multimedia so that is inc=
luded in
world builds again.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../packagegroups/packagegroup-meta-multimedia.bb                | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegrou=
p-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/p=
ackagegroup-meta-multimedia.bb
index 4da9de3ff9..4e4f58f14a 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-=
multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-=
multimedia.bb
@@ -43,6 +43,7 @@ RDEPENDS:packagegroup-meta-multimedia =3D "\
     pipewire \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", bb.util=
s.contains("DISTRO_FEATURES", "x11", "projucer", "", d), "", d)} \
     libcamera \
+    libdvdread \
     vorbis-tools \
     libopenmpt \
     mimic \
--=20
2.54.0


