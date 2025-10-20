Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E151CCD1A7
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 18:00:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.4137.1760983225646490445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 11:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ksAbcNz1;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-471075c0a18so49161195e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 11:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983224; x=1761588024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LMgfrGDLUUsxUMW3p7mi2oSS072H2sY0d3borO85Jlw=;
        b=ksAbcNz1oug4FMp/TpzOpb1Zc+R3+6VIfiTMUWnEHV1H+l205iITVLuW/xGz721bvL
         Thiu3+xpZ8bWgaV8ilSTYpF8HU4a0s7OSFQM21BKdhGDkEavykEWbpSM5hyuSWmGLf0d
         hm1brNNpyeAxaBJ7DKfsuIqUqv+z6ut9rSCD8dIFs23D+cYVcsS3uk8eVOZ77vCwYJHM
         XT7NOvg284ejSAJTvHgc12GRtCA9OWtQ/3CK43wIXNTXRuvGCNKU+ygC1NfsiMrpOljq
         LAaFLh5Wfk2eru7LxHJb09Mmmb8tb+4K82s6cpkL7zolyBq1STwsKs8ctjPFZsIHy5H6
         zNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983224; x=1761588024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMgfrGDLUUsxUMW3p7mi2oSS072H2sY0d3borO85Jlw=;
        b=oMFGo3gIpDfLUxWXQFKlPmDHfaBKrAG06sQwolQGhRsOZRxOAh0D7rOb0zXucFdOzz
         bh7ywCY0faFEc9j+42gX0RRH5UKNTPmyARp/GY1Mpqdo6MzKs3lYS+7pix70jzJXGuHw
         H6DG2nOBYWRuu+IQ7TzZgAhTTOQK/Qid/bhswyO9t1lluQoGx8kT/CVx2+KIgsNFWPov
         sL1YT49qqfgbbKwjzm1xJ0CwMFKPaWhqJU5ubulpcDEIZI9epPuZZwvTqIiOvdjEvw4L
         gQUhq9u87VfJXa8hdQ5/31ZmwGHv+IkaJcce1eYUN5A6mFsuUVGDA031lQX28ZGdV4Rl
         09zg==
X-Gm-Message-State: AOJu0YzmmiVAqyynscisZAurtHoabXszuoRpy2/8F/JRlm1lCryS89AD
	SATPSto2FjlFDadqIl7mYxGJH+fFSie25g0IBMf8nXfYfLQYsOIJKZnPlB/HfQ==
X-Gm-Gg: ASbGncspxwzBmMECBCo+L6KjlrhgmCZuEWRoYlMvU4CMVAvGB7fo25THgCZS1vWX5c3
	EohVjoYqgnlsmX96vubgac6apEk9DauU1iS2YdAUZHmW9CRC5/TGKRDb33l3xzUejzrW4t8zRc7
	g9Nvpz/D4wV+rheCsKoTJu9wOgnYv/wNuzfPnDyFVZjAeokL2AoPo64nffog27Kx7bSXIbJ2DWO
	7FpcRnv7NX0cSb6oMpEyKT7SHIZ+vb7zapFRx7ZfoaxbZGv5tTY1lw/Gul3IzGft8YggKzJ+Vav
	qqKRO+LryROLiRXvYNXDhgQZ1M4QCTdrap4GrHTVOLpXPd/6zfXB8zVKIemNO5MuZPb2vcb7hJ5
	NO7J1MWm8l2J5SCLNpctRLjOHEjglaYIsclbtIRYLvYwCHdiy4aKFPO3G8Zvz1PSEGBeiCDvwog
	==
X-Google-Smtp-Source: AGHT+IE9XBsRaQv8E+A4g1+O2bpvMYbTqOdd0PxOe2G2T+ikCWQLdVWYWVFzfG82XgcziGDf/9zkLQ==
X-Received: by 2002:a05:600c:8519:b0:46e:42aa:75b5 with SMTP id 5b1f17b1804b1-471178706a7mr101406135e9.4.1760983223919;
        Mon, 20 Oct 2025 11:00:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00cdf6csm16342024f8f.43.2025.10.20.11.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 11:00:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Sana Kazi via lists.openembedded.org" <Sana.Kazi=bmwtechworks.in@lists.openembedded.org>,
	Sana Kazi <Sana.Kazi@bmwtechworks.in>
Subject: [meta-oe][PATCH 1/2] cryptsetup: Update the license field
Date: Mon, 20 Oct 2025 20:00:21 +0200
Message-ID: <20251020180022.3398560-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 18:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120818

From: "Sana Kazi via lists.openembedded.org" <Sana.Kazi=bmwtechworks.in@lists.openembedded.org>

The below reference clearly states that GPL-2.0-with-OpenSSL-exception
is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
Therefore, update the correct license.

Reference:
https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7

Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
index b5be30cbb2..c297de053d 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
@@ -6,7 +6,7 @@ and can hence offer more features than plain dm-crypt. On the other \
 hand, the header is visible and vulnerable to damage."
 HOMEPAGE = "https://gitlab.com/cryptsetup/cryptsetup"
 SECTION = "console"
-LICENSE = "GPL-2.0-with-OpenSSL-exception"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
 
 DEPENDS = " \

