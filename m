Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379B9CD37B8
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:35:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6295.1762976147591202838
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YKGJxI7S;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b312a086eso21662f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976146; x=1763580946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Es64pQwlWgkVNbXY1Pu+XQJbYZnlTFfFPEVNW/RjRY=;
        b=YKGJxI7SPGedllGRP1QPGYfS2Kv1r/5pbNZT1p1nj+vrCn/eaGUuqjyKF2su3OSCjM
         LnTCsAHPDsMHNM8hgUbAXySXUjghnlnRlRNRJ/L9rsArOLJ3lIG4Ewk4afBRACv/aqu3
         xJwTvOXRQkclCmxsfiEodPFsCXNQmlHu5Xr8cGbrzQSPifzV6cpVkjDa5d93av5UQtOw
         K4zoLXvGsi77v/ze9PS5xSomoIqJZhRkaKUt17kORUBofG8yt2TmQSOlfjGZatIdMItx
         hP/AAjDqjTJTsRMtncdw7Im3DicZOR5EELKKt7ykQfCw0U1fYirwT52GQ3YXR+WJaFWi
         20hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976146; x=1763580946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Es64pQwlWgkVNbXY1Pu+XQJbYZnlTFfFPEVNW/RjRY=;
        b=Ni//UJXAGAjuxW3Nm8NDPLIUTQShBEKdzEPikvV12Db/KEdHEqC/uJsP3U8Ygl+S+k
         fUA1u0d3K0XePeN0EYUQ47EBpaVHD62MuKZ20vJFcjMaTqIExXvH20J1hgdTyNaWKxrr
         3+lwB2lvtGfaOR2imR7ZW7liZiLfB3nBkCadV6KNhXpMy6iQpECCj8favGm8IGQK4omS
         cY2U1u5ZBoQWBanRPqC17/JKxealmEfFZqTOnp1VCNZxjxF7uzRbsaEe8M9IFQ70Y8r3
         5SJZwsZyU3qkPLUHNeOuO4n1K4qOkMrY591ahgGqy/nTfjcBDp/Drghb/mqsuv9sBhBR
         27tw==
X-Gm-Message-State: AOJu0Yz8iM6txZ3AdVHlCrFKWIyuxP4S0t7V7QgEeILFLJSGGCKGkvYN
	qfGxtc84gJwftJJ8vMe5Aw/AKlFDZanG9q+qwLFv9sbez1igjYRQW1wGrwWwrZF5
X-Gm-Gg: ASbGnctRtybM6glBznkFFFg1ASNaEhPrFImB+wUhwC/oi6e85YyJu0GMITJl4oIIU53
	+ABZR67/geRgoHP65g3jVXL1AFcNwBba9aSORrBGmyesP2W7UlxX3BwTwQVC/xCwqjI1r+8po/4
	Pgo20ky2L2r9SNv6V0qkQCefSj20NPc6oSaRwaL9HrIvUjCAVR90gMf7jzjkNcG1nckG5OGPyn5
	miOIaqy0/n7sqU8KUJ0YVkfElhI4ID8iifYijzHsF0kom0E7Dprhc5eaxRALH+vYL7giii7J2hW
	qxIpZTYGMPiUThHwwPd0ihWeIG2JejKKx95VXeeOXq0hq/SjbhGaK9DEbjwrev6EpmaDCxxwBom
	Ljlr3qAJ+taa46bQLHtBnBA3U4GoujrnMKMbV6No8MNtox2bb0ApGBKbEZaHYuWvgK6XhaPDBog
	==
X-Google-Smtp-Source: AGHT+IHXS2qJOA9sVeHS1txMfGM57L+YhUWBqLZKuOZU5N3/1yt+VchsNFZR4x8ctqTLdVeZxdHHBQ==
X-Received: by 2002:a05:6000:3106:b0:42b:2ac7:7942 with SMTP id ffacd0b85a97d-42b4bb909f3mr4071182f8f.5.1762976145831;
        Wed, 12 Nov 2025 11:35:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 05/21] transmission: update SRC_URI branch
Date: Wed, 12 Nov 2025 20:35:25 +0100
Message-ID: <20251112193542.1589821-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121566

Master branch was renamed to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/transmission/transmission_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/transmission/transmission_git.bb b/meta-oe/recipes-connectivity/transmission/transmission_git.bb
index 735db1441e..2f259ed873 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_git.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_git.bb
@@ -8,7 +8,7 @@ DEPENDS = "curl libevent gnutls openssl libtool intltool-native glib-2.0-native"
 RDEPENDS:${PN}-web = "${PN}"
 
 SRC_URI = " \
-	gitsm://github.com/transmission/transmission;branch=master;protocol=https \
+	gitsm://github.com/transmission/transmission;branch=main;protocol=https \
 	file://transmission-daemon \
 "
 

