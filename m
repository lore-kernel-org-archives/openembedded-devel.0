Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD64FFEE4DD
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 09:18:28 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.116117.1772270308544529357
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 01:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xnf/Onir;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-358ed696623so1185284a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 01:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772270308; x=1772875108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JPRM5Xv2RaDgZw1cOX+39roizujr5N9S7DEjLwnis/M=;
        b=Xnf/Onir3v8qJMX8577aSzfI2HtcwpPdlRdCE+LtE2Mak+PmFcUSlFURQlGA0UEUrl
         EXrGF/a4ZE1rFwiSWl5T3xJYM+rsIz9GyBDCJLbxYwDF6xaBToAWVqkjwqEVem+gqqxC
         I+uPI1hrBHs3HdlLbS2C1GPwDIgDduxIu0wrht2j9qhFrhYHUENxupq00UJ14i4j8CMF
         gkaKr+LRX7hNHSs1LRjjHjBGEbBWdwvqcTfq8Q9nFjU6KbOBN4p1mUwndJdvdlg3GUB1
         Zoy08tGBY/CwaXiQo6TaD3kx+yAJvy8huHY0AaWnQHrWyyaCvnnhc2R/hojIBguC2dxQ
         sVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772270308; x=1772875108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPRM5Xv2RaDgZw1cOX+39roizujr5N9S7DEjLwnis/M=;
        b=MOwKUI8r3qEy91H5TxyivxVNFNQ3AuOwW9fmJjlYmgWodfYKQTWnSxOFDr9OhFlIWD
         bCuRZnHlwiDIHnSaIxT0cKevbm1VAXRO6MuxU7uvZA7UAczWi2yDGwwm9IcwOMjQrpx3
         ioX1atWkYN+iSOY6FuZUX2uT8cyFYUpR7Hr7kmCxG/+hBtm8d4J5SutEKzvq7d+92Pgb
         QM5Zn/xahQ/Xk5ZfCw0qSknWvqbP8vtJeISEPsPKSY3awgkqGxc5ikPhbonp17WE8d5K
         QWEao16jrXUMk81WN1zpxrjmlX2Dn1mNWSY0+/nYOUdsGeVaEKG5AD/rQ36bIlkHmkQT
         fa/Q==
X-Gm-Message-State: AOJu0YxMxDQkwC6nVfzZpw6Lnd2JieilE2T1v6gNb2ppKN4xN6//9dRT
	KVd6v/RHa/GCruFqePUNLYJbHgMCVky9d6Ho7oiQtsG+qzId0OaiN8eCydBqlA==
X-Gm-Gg: ATEYQzx1eFyGXVTNgYEdG/HNIYTGnuBsxgfgCuehglkDsBphq9LGrANASIe+lEyYnnt
	Pj3Dv41U0ijbb9oWELRrq3qTMeaNhXFjp6diYmoeNKCy7uehcJ3MC1hvKGAluFyJjL4jmqNu84m
	suxmz/9M6a/lkXD0SynkVXUp9sxXhnS+5Qut9wMEF3KdjNBCZswXfEGGRFXZcS3ljG2HUmCn/Dt
	1BdDDneOS2HUfra0HdgKzj+y+1wfVlmKLgxJF8LivuTTpTet9OuWrxq5wSib1nWc1DiCxcmiEQ4
	l1PszlrE2d7FJYsRbsWXaHyZIzcFWD09agj7p2+vBTaLOcrTjMaCInII4gqh5Rrf3AI/WP7m0we
	oIDx4D+nbVzAaWyXf6pjHRRXRxr8zRYaGFPRs9PA/5bZ+87ZEKTvU3F+IuSkieB8mXU8ZVm2GA8
	Gf+ty+SR/yhZJHxr9C3VBP+KWykthpQ9Xq3g==
X-Received: by 2002:a17:90b:4e83:b0:356:3ba2:1233 with SMTP id 98e67ed59e1d1-35965c92752mr4637697a91.22.1772270307710;
        Sat, 28 Feb 2026 01:18:27 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593dcc9c37sm7330255a91.8.2026.02.28.01.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 01:18:27 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH] valkey: upgrade 8.1.4 -> 8.1.6
Date: Sat, 28 Feb 2026 22:18:17 +1300
Message-ID: <20260228091817.804774-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124777

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Includes fix for CVE-2026-21863, CVE-2025-67733 and various bug fixes.

Also include tag in the SRC_URI.

https://github.com/valkey-io/valkey/releases/tag/8.1.5
https://github.com/valkey-io/valkey/releases/tag/8.1.6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../valkey/{valkey_8.1.4.bb => valkey_8.1.6.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/valkey/{valkey_8.1.4.bb => valkey_8.1.6.bb} (97%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_8.1.4.bb b/meta-oe/recipes-extended/valkey/valkey_8.1.6.bb
similarity index 97%
rename from meta-oe/recipes-extended/valkey/valkey_8.1.4.bb
rename to meta-oe/recipes-extended/valkey/valkey_8.1.6.bb
index 9947a9299c..1eaead2a22 100644
--- a/meta-oe/recipes-extended/valkey/valkey_8.1.4.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_8.1.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08b9159809d809e8aaa340a8387e693e"
 DEPENDS = "readline lua ncurses"
 
 SRC_URI = " \
-	git://github.com/valkey-io/valkey.git;branch=8.1;protocol=https \
+	git://github.com/valkey-io/valkey.git;branch=8.1;protocol=https;tag=${PV} \
         file://valkey.conf \
 	file://init-valkey-server \
 	file://valkey.service \
@@ -17,7 +17,7 @@ SRC_URI = " \
 	file://0001-src-Do-not-reset-FINAL_LIBS.patch \
 	file://GNU_SOURCE-7.patch \
 "
-SRCREV = "5f4bae3ea10174a7c872cc099c953b0e91afa93a"
+SRCREV = "19b07dfcbb75b14a1ed1b0a48cb8a0efcc81d563"
 
 RPROVIDES:${PN} = "virtual-redis"
 

