Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4ACF46C4E
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 15:13:18 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57251.1775488388830099139
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 08:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XLIT8tkr;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a041eae5so16638315e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 08:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775488387; x=1776093187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYb21+TYU2eHab6JPhFpnWSXPrKaivs32Ed3oBXFUBo=;
        b=XLIT8tkrXbKjB3aTOsIWuqFpKBKCMArCkpNJKSK1w+hhuj75nri0wcKyr33zkcTljP
         2yZUHXpyzziANyNS1lqZPYwuw/Vtkh/bKLB3YlpPuagjEZIlSHKcsMaklL5IgFpE9aLy
         F4jNr1ZGGP2Dk0atsAKQNXxXmXHDnKBrlAs3dsp7ZFKISIYWdfBnVYPnVCyCDIkbZAgv
         5/tTpTLfpPOAFsB04vaKb+RYgxG0GrTbUxyT34Ct7d4/wl6PxgOhd3gUuw+Wh796XoDV
         moHWRye+MlLuBMU/56+gGbxr3SbX7UFcI944Bz1RLAebIe7Ak1ERVStrT+MrWrghHOC1
         eRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775488387; x=1776093187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FYb21+TYU2eHab6JPhFpnWSXPrKaivs32Ed3oBXFUBo=;
        b=AMYkSH1caYA2/mtg+DEgI11I+mX7GB6pmysYxLybnOMtl3JtI7dXqX+Z4AssBhtlK6
         6IAApLrlfOUet+syu7YIB+TTpW8zsaA1V3I75O7B5XH/UwSXaTL/UVFZC/DYu9lpO8R1
         eJJRaYaGSTvpSz47D7aJq4gSUYhuZOD06fnYFZxJDSnbbQAWthT0kRxNF1tSAVcw7LiB
         ivaEeNavsH1Kvk5vGNN8ThkqniUe9RnflVcujLS0OjUEzlbESr8Y4H6ULgzGnHfft6E0
         P6DUOV1TJD6zcYz4MIWJ6Og/Ju7f/BIkZZh0x6lNqbd32EmFqDSW6TvGz6Ed43S/iMem
         bCaA==
X-Gm-Message-State: AOJu0YyIJzS/PLp2avTuucsnzT1Vh8ok7OoeCt6k2ABCSDGz3ZwlZH4/
	eTufm1eR2lpsNLLKxcvvoBFiRGd+jO2jZ47s2uPtmw7LyjOYPPvv6zpUKbSY2A==
X-Gm-Gg: AeBDieu4FYOPdHqLHCo+16EUAXE1XU/k+PMw5WPAgLimYTKsgooGTFUTn85T/0AzUOc
	/J8DGcNrJm/oFJMIAvUAgZH+T7YqpJauWW5CivyT1lUaMFj+KDPFnAt1sy4pTSklZaS/brOV4cq
	F2f1Cqji9pVKmkydCyTEFXDQgoio6lB4Mm6tZ0g31yc5DwszIQasz0abYYcpKKaBhnVcm6h0vJy
	tE3+CSAn1GoC/qmuc8LyUwG9RTVNU8tbOYLPLC5gN7nQLh0C2ZFA98KvwDuGFpzn2KzK/AIA7WS
	7l/D6NxH5R875vuLlxUbMntazWeGlRP1/vurA7AnGpGhB3G61rJ84ZRAyvXZWuF8qAZucMhomL8
	cHPMhruthOAj99AWPMUTV1rSyfRez6vIjQcyQqqzTaD975M+T07rA4QfZ0UyDeip+AhmgKWJwzN
	BF9GbDgl9bUVcG/TYcq5z76iUcPtTo9qM=
X-Received: by 2002:a05:600c:a418:b0:488:ae4e:51a5 with SMTP id 5b1f17b1804b1-488ae4e5464mr52887695e9.15.1775488387063;
        Mon, 06 Apr 2026 08:13:07 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b6ff70bcsm92848765e9.14.2026.04.06.08.13.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 08:13:06 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/4] strongswan: mark CVE-2026-25075 as patched
Date: Mon,  6 Apr 2026 17:13:03 +0200
Message-ID: <20260406151303.3640343-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406151303.3640343-1-skandigraun@gmail.com>
References: <20260406151303.3640343-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 15:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126050

The CVE is fixed in the current version already, however
NVD tracks it without version - suppress the report explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/strongswan/strongswan_6.0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.5.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.5.bb
index c3909acff2..405080070c 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.5.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.5.bb
@@ -189,3 +189,5 @@ SYSTEMD_SERVICE:${PN} = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'swanctl', '${BPN}.service', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'charon', '${BPN}-starter.service', '', d)} \
 "
+
+CVE_STATUS[CVE-2026-25075] = "fixed-version: fixed in 6.0.5"

