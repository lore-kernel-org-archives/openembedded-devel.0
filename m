Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207C8CD13DD
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:37 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27193.1762704029016914304
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bwzcdqvm;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b312a086eso485026f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704027; x=1763308827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLjLzBYBRmMGL8nwv+1gxn+YxNE/9zKdnV3HLNm6Uw0=;
        b=BwzcdqvmA90q9OWeU0eYn5uQjRzclLNfvp6blnsodAFachKJptCQhqPutwfj0FYYNQ
         gMHSSsbc3HMcKvSGMJkXLmH67Y5dAV7P3AMxuLXG/RcML2O0Pn6m/uQ1HKX9eG7AO9qR
         stg1WILuGsV61HKmBZKlWW+OGibIx1yak2yFr8imKZD6GzWhYYlV8Mm+rKYIMutlyqzQ
         Jr48er/ntWQ8GtZjmfxaecN81UqFk29M3OIzAMNmGYOR2G5ejRlC+V3Zx4NB0fOtpx19
         NZFiMesAKsUAyEWaE3fa5dBdtFDka7ugYdHUHxNYr60vBoz/zyaQYvJEdHWo/FIseTFD
         OsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704027; x=1763308827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lLjLzBYBRmMGL8nwv+1gxn+YxNE/9zKdnV3HLNm6Uw0=;
        b=E44Y5wJqGzzVlf8lqt2RqaaiEu2U1JrwW0C/PaN6bZ9xoV6u4hVOPcqePHpzPLODXS
         Fb+/CU7LjlkesuZOGOEpvtUAXxPrgZPfQ2F/w6ER8gmt3f8CFPZH1+EPlP7ynmsPM59Z
         uIeyOlzvzBqN/8Kh9SpMUbaroj2tUYJWPPU9vkcQFCjk9Gbh4dZstrftuxRYckhBt5e4
         0e0Y4Xmft96YG9A+FTTkwdW21TY4Oo5/0iZpKRSaYSPYF4YwO88gbl+BePx1l1F58g07
         OYn0zKNh8L4Kh42Cy/Jv4R16azPPt+iGqxsXQWRziNgGw1Osp1Nxb8AoRr635AslbCQN
         PQdw==
X-Gm-Message-State: AOJu0YzFMIuTEZGzQaGMKeGlqk8CmgJ+w8cHVOqjamIEfsK90LcNdWev
	WHqeAt4jzgPER6qt/sIvN2abEhuScCg10SalPYi54hLLMQGCIfx3g7wp+JrfbZNh
X-Gm-Gg: ASbGncukZ4STw/LaAL4bW7z9b/U7rs/ZDHs82vhLSZiYApxmPVAB/5EBvRl2wh9SVLN
	/RM3g1lQ5daS1FwrXbPgKrSwyPgddrqAR4x2pYREWsJGfr8fJzw85PIxtqMFFl9bx7tkkfq0sBS
	ONIwY1CrVXD2ZjqpbOfNQY3wgJ1TUuRRpMIpH0O5hDu0AggtKgJOn0rUSPPJHNoB/6E3qOqMIkU
	RrvJeNd4/OiwNWW59/eRHMOsR7kMNVui4jognVnqfLqdqAeFSQrdl+3MKOshh+W7/unY7sleEI9
	2K9g9DbPrIYeejCJ5kob30NgWadM/BJolH08BqY7fuQ3CPi9BdYWjxV4au9+/GHSAoe52MIPJHg
	jW2kD8U4G8PpFLPwcfVAeJLuNPD4GLIqWZ0ztROPE+mvOKCE74FgYd5jzOc2nYKscPXJ7CxAqaQ
	Exu35dGBXEqf9oWpI953U=
X-Google-Smtp-Source: AGHT+IFFPXbh+6sX5VlQgmdy2TEIbBWEKbKSA7/YJdQ9z/fqneC40xhMDUK0ntgDMv5mBwU8btDeiw==
X-Received: by 2002:a5d:5f83:0:b0:429:b9bc:e826 with SMTP id ffacd0b85a97d-42b2dc4a666mr4621032f8f.53.1762704027292;
        Sun, 09 Nov 2025 08:00:27 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 07/27] xf86-video-armsoc: fix SRC_URI
Date: Sun,  9 Nov 2025 16:59:59 +0100
Message-ID: <20251109160020.2522353-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121423

The previously used repo was moved to freedesktop's gitlab instance,
causing fetching failures.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
index 8b4526fc5e..bedce27cb4 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
 DEPENDS += "virtual/libx11 libdrm xorgproto"
 
 SRCREV = "8bbdb2ae3bb8ef649999a8da33ddbe11a04763b8"
-SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-armsoc;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/xorg/driver/xf86-video-armsoc.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 

