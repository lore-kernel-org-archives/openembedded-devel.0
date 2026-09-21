Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CEAC982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 22:31:44 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8584.1790029900983761300
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 15:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=prF0/Mft;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: joaohf@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db479a55b6so5906045ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 15:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790029900; x=1790634700; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZHn850ow7CZrGOuLmYZtOscprfAStVrcV7+yKCmYzIs=;
        b=prF0/MfteasaC9Dnn4K30C/eVn8YBMhbflBOfgoWJELRPaKzm1AKjv/WqZttA1KB3R
         PNm25H4KkV/0XrfYTkE+LxC37UJWzhH/GgyHlWE4GzfwAxxzqN99YSkqGIxRDzZAh5G4
         y0s3FNNVhXEx/PZrMAqNmM1VdP5Q9dEE/12FvstFbBU1kR5rVEmYqClzHd6lmyUI8QBA
         A/uDmetYcez6prgtfftfhpgQJyURCSQ4x4rWqkLFTYJrlYp39eR0diuw3WjdkIonxZ5X
         uDkZWXv6tLOwB11BG3iz2OfGThQjhA1VLUeTto8chMZa190ppL6bOSrA/pyhwAVZAiWK
         MaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029900; x=1790634700;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZHn850ow7CZrGOuLmYZtOscprfAStVrcV7+yKCmYzIs=;
        b=2rvssFSqaHqxQLMTC3cvz3xrkMRuEgJMsQR17fqD6JF+QilBMIuf0lwrp772LNqJji
         Gb1BEXGVSjzwkpCz7VYPfYnDHecp7qKCGQ92RbhB7jp0jF6TH6tQ1KTmEk1Nr3NOd2Jb
         SqYK0MCqHbvBEbv8D6NEjmQUMRdBtSsn1p1E8CWT+5kXPUsxMEPBP+dYpMdJB/Pd5qCV
         m58Kk+DE7bIj3zD3Qa2I6DLZAjodh/NKiAQ54ChKuv7Eoy1uJ/nVmdwUvShizvbl9Ny7
         B7GEa3zdk41DvuqUmaPo0cQ08r32Ks1LQ2iWRBHFo5/xm5wEM+rGKliSxRPRTXKP6lrh
         cR/Q==
X-Gm-Message-State: AFuF++mr20Ei4add3UiY/oWbkYALWhTjlAtem21Xjpep+7v60M1Xz3Rb
	eFz3X45l9Fi6GygvlFbuPnShEbB0w717jgfhy0suqXvTMZ5I9kHP6hRPxrx9vQ==
X-Gm-Gg: AYBFou3Zttd61DPD1FGF8ahCy+r3W7zMwS3Bs7QnKsatOy7yhxPM4p9Mm+MnLz0J/Ls
	LUieWZjZ9ZqHhswVsVmKvDydGna6rCMA1H10U+/+gWkrKTdtCpd95dliEjyBupCRygKLwiEvhtl
	ObPAkXLKZ1GGtf4IusJEl1MTkMX1uSBkCC/2lHaVAQOyXV8+401VGdtJ4ViKXeQcXHCG14sC4s3
	puqQicbrrrRguhsji2WOttfdnu+2vSP1btkcQ/0zAgPOlK+gPiKIs1/5Ic6xK4wFMgPbsqrnwlo
	FjNIButGDiBwjizcmgIIPVvlgG6bhGuXYWbhRZkvqLhvckUFrR66zvSyjiP85CNARvzsydaPYbj
	La1UokB2HeVmnLxlrRmXkIt7O/x70vbgHCAqOJF3eh8kOoC0G3aZYr7M9v+elYVa4KdmNFdvDex
	9es30pdRsNsSoEXz/wJ133UT+S+YvC14MAwG5Yz7inFG6FY1k3im9ysy1pGq6gfGRTlQczCSdrb
	wy4
X-Received: by 2002:a17:90b:3b4f:b0:39e:3728:3b11 with SMTP id 98e67ed59e1d1-39e598adb96mr21771664a91.3.1790029900105;
        Mon, 21 Sep 2026 15:31:40 -0700 (PDT)
Received: from porco.local ([179.228.7.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61271695sm85109eec.8.2026.09.21.15.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 15:31:39 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>,
	Ross Burton <Ross.Burton@arm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] boardid: remove default tasks and PV
Date: Mon, 21 Sep 2026 19:31:12 -0300
Message-ID: <20260921223112.125955-1-joaohf@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 22:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130169

Also pass tag= to SRC_URI in order to validate SRCREV.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
CC: Ross Burton <Ross.Burton@arm.com>
CC: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/boardid/boardid_1.15.0.bb | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta-oe/recipes-extended/boardid/boardid_1.15.0.bb b/meta-oe/recipes-extended/boardid/boardid_1.15.0.bb
index 8e88ec9371..71cffdf1c4 100644
--- a/meta-oe/recipes-extended/boardid/boardid_1.15.0.bb
+++ b/meta-oe/recipes-extended/boardid/boardid_1.15.0.bb
@@ -9,19 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENSES/Apache-2.0.txt;md5=c846ebb396f8b174b10ded477
                     file://LICENSES/CC0-1.0.txt;md5=65d3616852dbf7b1a6d4b53b00626032 \
                     file://LICENSES/CC-BY-4.0.txt;md5=9b33bbd06fb58995fb0e299cd38d1838"
 
-SRC_URI = "git://github.com/nerves-project/boardid/;protocol=https;branch=main"
+SRC_URI = "git://github.com/nerves-project/boardid/;protocol=https;branch=main;tag=v${PV}"
 
-PV = "1.15.0"
 SRCREV = "2ccf22a8be22d7597e16fb225c1173876674f7a4"
 
-do_configure () {
-	:
-}
-
-do_compile () {
-	oe_runmake
-}
-
 do_install () {
         install -d ${D}${bindir}
         install -m 0755 ${S}/boardid ${D}${bindir}

