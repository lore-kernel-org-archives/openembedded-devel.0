Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E05C5518B
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:46 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13601.1785620745687112903
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VmHRGjLy;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d0407aedd6so22907645ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620745; x=1786225545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bzNNuZWVhqtlU9/piGU9KlI3hi0uWKRP3pTkDaQpuus=;
        b=VmHRGjLyVJdANLPFizBUamJLkFt0bf2EefBUZ2n77TIvyEZllrTL47tidBi273/7kN
         51XFbWRFMl0C5gqnBpi1IphaLHFfN7LxYb7AIWy7/IIYG7aFWvgMJUmpE6wwMH37AfT0
         bfbTiZRoq/DwjnFIV9rJgjhHgeRNN91RB8+ajHVyoafQePQVyIQY/wFDmXf+WSrT6UG/
         lNg3qkEh7gVLQdU+6uMTxEy905RVvWEc1cInFC1Q2hyEGmLAi+Y+BwS6iXTG2Gz9xovD
         VKOA7Xa3DzRAKljLoadSFaTDdXUARP+iKRf3qsbWPNYvSNIrOp4dnoe2ZvS5CiX1Tbyj
         Vjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620745; x=1786225545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bzNNuZWVhqtlU9/piGU9KlI3hi0uWKRP3pTkDaQpuus=;
        b=lvd51HVjg97zTgTK68zQwfq0qDZi5dhiifbPQYyFEOVoR248lxv2Lo7tNnhiZhYZip
         qLqdgptSEs74JW7PQCUZz67i1HCoAnUppPdSfFR3H4ssr2nVhkGrxuCH3X5LNhwI0Zwt
         Pamfeg3RRNpXkc3MoaC6i8ho3bnn86+ld03RAptj0b7HeikFhNbXpSBPt/IoBvbRCq+M
         LlJuBVD6TqzOFn1DbhQrK1ObTxw7GxvwWhOUyV7/+Ee9EM/27blHcsJRcj8Lk6TdX9gB
         ZILuOQ86/4RzasTO4WTTMxeCDZxh0IPlhA0mH79x5b98Topm4AGhIvZfQpQK29SmPVHe
         s3KA==
X-Gm-Message-State: AOJu0YxXdxHlk3l1WdheGhiw47Ka+IE20XgKy2wD7oayZ78tCjHjgPoY
	3DUn3WV5PlwYxVV7+73M03OLI30B43tRuRGqF7t5cevkDN/Z4uK2enbmyDhb3stz
X-Gm-Gg: AR+sD10G8gqHVCoDevsq8lB0ps66TFCzC6Mxgu1N4JCb98xYHbUB6Sg731peMNvBkt5
	atjZzyvVZSo/RUSGkAZRGet5Tjf4kZjhN/62BBJpItuRP2ZVBOt6H87GWfGg6pY2E8WdYMGRxx6
	UA113+K08t52bYYKUx/J73aQ45e51bKJiGumzgKjaH6pPFLPrZ9A2alq8qqQuTJtwOnoU/mwJ9q
	slHJ56CiljcJ1Ptm0iu8tJjJ2upmddOywDEHGldHAcXrfUCGfitV7rHEj407DP59UvDR3JxOZql
	sAt0PEHLm9+K8cfXkMNPzKNrpje1mAxT0EzRUE6/ZxiKrLBryTz5QQywuIbyx8Dza/o3rwaNAMM
	Qz8J4YM5CiD/6r5XYSAkDej8Ev3Dtf9CDcMd5+lP8RYexe9+DMrS/r1japIQgWFXZnk67TPCbcc
	KpkAwxsAqwfsJ/oaRQG+qxLtv1ergryrjyUNdGbu7SpbtznKCfpzY73V2JhL3JGyqRTgGupKkQU
	sNTOoU0ox1ca+ENvK8DH29UWUWz/seWcobtd0oFCjMpNYinluh6e6xkqAl0wU2yRycVnK6TP9+A
	6vio2UH8+aLs7Nq80/jLfMwnjJwfrOF5dbzEC1DNsKmD0GkXiVvEPYpPnf3kaO00N/N5082gx5S
	/rQ==
X-Received: by 2002:a17:902:ec92:b0:2ce:ed59:7044 with SMTP id d9443c01a7336-2d05246fd86mr41673925ad.30.1785620744964;
        Sat, 01 Aug 2026 14:45:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 17/31] libdvdread: upgrade 7.0.1 -> 7.1.1
Date: Sat,  1 Aug 2026 14:45:12 -0700
Message-ID: <20260801214526.788343-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128634

Upstream changes (git log 7.0.1..7.1.1):
 * Large DVD-Audio feature addition: Audio Still Video Set (ASVS) IFO
   structures/reads, still-frame structures in ATS, ifoOpen for ASVS and
   SAMG, simultaneous CSS and CPPM decryption, stream-type logic, and
   audio_sv.vob menu exposure in DVDOpenFile.
 * DVD-VR: add and integrate IFO structures and reads.
 * Prevent library log messages from writing to stdout; add symbol
   visibility attributes for OS/2.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libdvdread/{libdvdread_7.0.1.bb => libdvdread_7.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libdvdread/{libdvdread_7.0.1.bb => libdvdread_7.1.1.bb} (85%)

diff --git a/meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb b/meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.1.1.bb
similarity index 85%
rename from meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
rename to meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.1.1.bb
index 0be61c2174..f57515f732 100644
--- a/meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/libdvdread/libdvdread_7.1.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=64e753fa7d1ca31632bc383da3b57c27"
 
 SRC_URI = "https://download.videolan.org/pub/videolan/libdvdread/${PV}/libdvdread-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2e3e04a305c15c3963aa03ae1b9a83c1d239880003fcf3dde986d3943355d407"
+SRC_URI[sha256sum] = "a0d47876548bec806774bbf8dbf20bb19ba139464383156b32eb8e59915b90a9"
 
 inherit meson lib_package binconfig pkgconfig manpages
 

