Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACF0F588F2
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 15:49:27 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22984.1776700163541247497
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 08:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CTgkUr9i;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso10831895e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 08:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776700162; x=1777304962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYS6f/2aKcFDqrtofpuEPZO3X5FZrpoKACIbL+mH1fI=;
        b=CTgkUr9iRgg/rGH+Luus3X+YEugTMhZk2PL30kTeqJukavQRsebvxkrJShLo6EhWWb
         PGg6UaM7wQjcGBuY1BMTty90mzvk6g8JIIQv8MxN69JsAwi2ilKpliosPnRCHj1t//Bu
         jvCea2cOjuqB3nqLQ6cKGf0OqLjbfJ1FrkdSLW89MpnYIrX1AJcThaKkwQyp5tSFraCf
         FYhN5AtfZG0boEAlAttWprsUX4+8M3hwTCmMvv3RLiqwE5t4aHCHmY9enRYcr2akwyC4
         wBjzPKaYJE4B37BU3t2jLztDZ+u8pi76MnrqGF6yQc19HkvXfpiONdXloxmjLAhsZ6+D
         0vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700162; x=1777304962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oYS6f/2aKcFDqrtofpuEPZO3X5FZrpoKACIbL+mH1fI=;
        b=eHIeIv/bunyeFjyCkrq58M5y+koJfgLM3leup5gO4TDtRgsyffbpltLpke1xOu53Hf
         gh2cNqjg9TN2UIrB2aiTsOaQz7ZJro4Wfap13QxWMLK/JY6+VTr/UTVFDXbwEcBFY+sZ
         XAGzlGmcZwX3wKGa5twbqhSuYIjq9qF+papy/jgwf5mcxxdC8FHcLmkxq6yxuDsu1SAS
         X1ZejnMdKmlAKaS+nYX+GdhF3ZwyDRgq2eXt0dm6U39ObuD+Mt1VOCWjftalPTMuU/xp
         Q2NOJPX4gJa+71YWk8cDOkr0QIX8bX5Llf5mMCRue2me5vcwQagUN6a6eK+LujShniJd
         MUng==
X-Gm-Message-State: AOJu0YwVQaI+QL44JTxiSPPlnY6/hkxshIi7UYrglKpfUxKXZ03qF2Nu
	wo4flDmpRpYUun/yPAuZX5q2PLClLBJB7GHIcKracRtaeVJ+gXRn8YmAPavzCQ==
X-Gm-Gg: AeBDieveKIWlilHi1/N8NFthXReetFoTCaYXT2kWYnLdaRMBQTAvLMPFDVn5hBYsQfV
	XytjWtTicb+SM5LCNvn8+AdVxTgHLHEPphVZGJ3FzYrW1l7yVuRG92XaATygz5sGupXzn+eBaMt
	NdBO1o4kaxSWSukGACnFeP3vfxuvsEDMh/n7TTJ8n8y2M1+6i0Wnt93/AYsJncaGtwlc4bEAJRz
	sGuptPCmOKzOOYgRsQ67jqKdpQzEVVZP73Q2lKL6sdE3DciGCox8tVZZYW/HGtzIa+0+enburtS
	tXJvS/8sfcIAwE117A86xAwz5G1Of+j7ZViniMrLr0CJ3YfHoD1lR9XHOxOX1wnB0YSewFmy2aU
	e7aZPK6z9BGRuG/8ovhNd9cZBJgWKBJ/1EuGvrNhwKyQsW0T6pPOaUy5WQLmldxwNphSSgvYsp7
	mHqu5oHCYfHklJ0Sw4FzVBfBGpHX5UfB8=
X-Received: by 2002:a05:600c:83cf:b0:488:aa3d:fab1 with SMTP id 5b1f17b1804b1-488fb76877fmr208610965e9.17.1776700161767;
        Mon, 20 Apr 2026 08:49:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm85279255e9.9.2026.04.20.08.49.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:49:21 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 07/12] libsodium: fix SRC_URI
Date: Mon, 20 Apr 2026 17:49:10 +0200
Message-ID: <20260420154915.952359-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420154915.952359-1-skandigraun@gmail.com>
References: <20260420154915.952359-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 15:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126510

The tarball was moved to a subfolder on the source server.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb
index 1b22e8d7bc..48e8ad875e 100644
--- a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb
+++ b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/jedisct1/libsodium/issues"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47203c753972e855179dfffe15188bee"
 
-SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://download.libsodium.org/libsodium/releases/old/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "3ca9ebc13b6b4735acae0a6a4c4f9a95"
 SRC_URI[sha256sum] = "6f504490b342a4f8a4c4a02fc9b866cbef8622d5df4e5452b46be121e46636c1"
 

