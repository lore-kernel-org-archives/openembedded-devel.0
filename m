Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319D5C2A06C
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 09:13:02 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40227.1767517978029089157
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jan 2026 01:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DnusNjZ1;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso105801095e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 01:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767517976; x=1768122776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2uE3yb2gRVL1nL8D1/cMZC6WKt1+xRenF5w68IZA0Oo=;
        b=DnusNjZ1B+j9jzsALRKWvgN8GEEAPc00zmSxCYrubW9Psg+9jKDJqu7LjYnQd97xuK
         eUwOdDAE7FvT8z/VqyMGNgzKoaiobAebpuRgKrW19sSrzSg+8usOBOajoT6/OyyzumB9
         4iatcBTR/hQJ++lluWPras08tqOc5eWoTht1Tv4zM1s2bUjnDHohqP/IsJC3nN2J8nqv
         FUxCkzthJt3kf8bllH2Chftvb72bVaggWm0g9s5Oj3bp0x+0bC5PdHIkrQvIAnXNbc7b
         h4PvlHme3Ox2cqiNP8R6RQZd1RxLInaLGpRS5zbNEyH64Ch+yYKOy5sbvgrtY6/IzFd3
         BgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767517976; x=1768122776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2uE3yb2gRVL1nL8D1/cMZC6WKt1+xRenF5w68IZA0Oo=;
        b=cjnIEwrHnBBkYL3PukgPm1WrkIz/6VmO/S4KY/AP78A33KvNlyRCVPdHzUEnEHiBht
         69GEiAqxknHZD3L5fQuDmm5ZdfMO3q8Vd7U/pLUZaRsI/MeaUf8RF6Y/dvObcIdkV6O1
         0hU57Nk/EvEp/NbF6ZU6hFrJJLzHj66ebqLCjGzvIFNf9CeHtsYLu79ss+eYK9kQT6OT
         Bcq6p9rIcpK70bGLNLF3SPIqg5Ic039OruE+Fv8Kii58Z4crNOfQaDlAepJBfXxLsmHN
         8sJNLC/PGO5yEl7D04LuZX/A25yzaDqKITDvxRS2At0YWPpU1G05EiY/vJZmnZqcEncJ
         imbw==
X-Gm-Message-State: AOJu0YwqDWYpL7IPzInZiuxMGnqapt5Ev9ZBt9VBc8aOBihqM9/kxMIa
	xEAswSlfhgto9OQeFZ11LEhIjCnlVmdG2MdnmwklPTKIN52N9I37S8e9xqh3vw==
X-Gm-Gg: AY/fxX6AlDdmzuQEOWWYi9blmkjZiWGfP03lgjvyxVfesekLHCuDUjjnEjJic64ht/E
	Il6cVN7BeNWynecZ2w6ka4a5GM4oBSBgyUd2W2Pph8o/1fruwvdvZ5XVIgeJRVsmH6M7WAY/EsD
	OnvXoeR1SJpE8sApe3SS79MjCyh6u6qBorjK8gnMIwYlW3sCCy+C1XC8cMyYtHkZGMNAjtBqSeY
	dXA9DbMXJj70gqr98WofZxOSDDd5Co6v5Y+Ci4demH4Dy1tcEthJBmLcI0tEWmk/x0HPMw9x9DZ
	G0GEsE4ReNom2oIMRJt99ocATy/SknwQ/Ph2pEz4eJ9A1R4/B1ixHdKIev7q/U7CB0UZSH/3eQA
	CHNTKQwfWo2EyzASBhsx74X5GZT9x6Yr+1r6DK/H0CfMSTjLoTmLY+0iQCxQp901plA+y+R0i/X
	BaiVE8kqeh
X-Google-Smtp-Source: AGHT+IE0PpTr9EA7PXiNAGBtKQtGcPyC//xBwdh8yp4gkMxadP5MyX0noeqF+uCCkui4dutWvrv0tQ==
X-Received: by 2002:a05:600c:5493:b0:46e:7247:cbc0 with SMTP id 5b1f17b1804b1-47d19595fa9mr506580865e9.18.1767517976319;
        Sun, 04 Jan 2026 01:12:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d13e2bdsm84483275e9.3.2026.01.04.01.12.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 01:12:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/5] spitools: upgrade 1.0.1 -> 1.0.2
Date: Sun,  4 Jan 2026 10:12:50 +0100
Message-ID: <20260104091251.2696384-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104091251.2696384-1-skandigraun@gmail.com>
References: <20260104091251.2696384-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 09:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123112

This is a bugfix release, with some ioctl handling fixes.

Changelog:
- Adjust the handling of SPI_IOC_RD_LSB_FIRST ioctl call
- Parameter for SPI_IOC_WR_LSB_FIRST ioctl is {0, 1}.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/spitools/spitools_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
index e1b9302a98..9dfb23cc7c 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_git.bb
@@ -5,8 +5,8 @@ LICENSE="GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
 BPV = "1.0.0"
-PV = "1.0.1"
-SRCREV = "87da3bfc03f3088e2e880b6b48195bb225fafeac"
+PV = "1.0.2"
+SRCREV = "1748e092425a4a0ff693aa347062a57fc1ffdd00"
 
 S = "${WORKDIR}/git"
 

