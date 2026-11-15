Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3822.1794729028205527709
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YPw+udH7;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so4584760eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729028; x=1795333828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfQnrhrE/0T2upITt33YF8I+uoB0VSrsuQUt2DF4TQM=;
        b=YPw+udH71RP9GtQNONdKikOKNf65uy2NWJdq3pDTbIXU7J/R5yb3BEqyye6njov7Wy
         VoeOMnmDA2sqKdL20fwEY5CFPN6e8JHUXM0VasbLED/Mj3QYX1IaaRfK8yZ4253GlR0K
         pGgi4zItqhnq9c63DoqBitQq3O/Ol4j1RCoELrMnt79K7M6ysqjpauJmOhM6/eBvJEAb
         Hh6AhYzr5tLd8xDUIo9nZuR60ilwu+sQTx7zwLBJTuZq5piaEptcqj7vUC7zkESt1yjo
         b8AMmlykkYs71VZCykoDT5NBSsgRboULPWFUPxCihXRGZM4J6orHYvh5rHLTAdGOx2lU
         HiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729028; x=1795333828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sfQnrhrE/0T2upITt33YF8I+uoB0VSrsuQUt2DF4TQM=;
        b=sGY3zq+i94UTf8nMG1iiP7wtXdPi89Ob2djnuB2b1CAhDWd+gjbO1tYUXgl8TBG33u
         aaVU/Lw9puJl8VmKK0JeLPj0w7eEO+tyy99nudpVhU23H3waAv4J3sRQNxKN/AkBTh7p
         7IAFIe5DDIX35+HRCRqqFXq6GnsQ7BwynBNMAU315mBOgz7zseKgYgu+6zrm3J0xV9UM
         SzcVHNyzy/0x54oPnxrPx2+VM9GUs8EGsy2OJIKTb0fLojkkoAXFQbWIj1+eDr6tolv3
         si8Nk1bXt5ErCrlDuH8YFjb/xvkAnLXf0vhKTRyRZHiOOC2Wh/jpGke4BM4elhDNx/FW
         KrNg==
X-Gm-Message-State: APuU4Z9uqXmTG2UvLtJePXhfRSZ55VlfzbJ0vgor5PLo9AD+jfBAEMfn
	m4/UqCxtuA5DStWyPfEKWeoVLTX+fPDqxEu7ubs6oGM+4xRvo0R5F3iBHXacv9X8
X-Gm-Gg: AYBFou0mV9cWaAmpxkNxFwmudJctJj8rhemzYvws4TN0+3gvh0nG457BeRjzwfadtH+
	mybZoipOD2wUJO3XgMcXdYH+6GtTlQb0Es9RRL+04QzXhsWYa+ESSfRcs9Yp/E0TxZUK+9DRvI0
	x4ADRk5eBAKDM9ueg5jvXlBUvzK50nQWCetEp9gkNiKtdlhFhCxHCejxU83DAlZq9gl6QXZ8I8S
	YnonshTfcBr7oymKWO114Lwyb126E9TgMj152v+D+y8hspaENnLR6i5STz44lQzOeu4hnHLfUUX
	8xfxsqP3QroRR7bhNm/St3rjUdhQZVqryVjtRWBBTlsIRS//nmQOyEHsMcyY5I41bmWcuwYNh+9
	D0ty6S3VTtBNXDxv1X1SKjObWBUPXCvVrhRMzMsYHliV2QGd32SuuFwsvhSaLxx1epHwlfNbAQs
	9YKThfLriASo1JRGuRbzh9+D9eQ2em/+8bBOm5hp8dBpcSUWEqeEoGtE2LyXanrOOSd+yQE89if
	SQodljJGQC7qK5TadEKR+56GOD69dxs5uaX2PfFL9V+asXz84YKlkd8uQRRZ/EvVGzcFf2xVMXJ
	vsloiEqjaLFR620AYzwP80CTsmjFhLDASDGh9hVSJEG8hpaR8doVzUS4KA5sgBeZwOenXTp0BK7
	39K+QYGkoPn4xVSOX7upZpb+uW6m2HuKzt0up3G9x/CSSSH/OuHAkaEbsQuBJ7flaW3Ugpco0S3
	bPtbjFb/Er8izN0dKCZbQ7rjRuID7LhS7DMzcJlujaNGGO6k62J5+dnRN37G87OH5YGQbFe5eVL
	OwLdJKx1fa55R45RwcOAQ2IpqQph9MEhoeZM98p/w7/kzElHC/sJCED2PuPIK5laIGFT5XbyH7h
	aAwh
X-Received: by 2002:a05:7300:e9cf:10b0:36a:75aa:33bc with SMTP id 5a478bee46e88-37966a5a7d2mr8182665eec.24.1794729027507;
        Sat, 14 Nov 2026 23:50:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 41/96] pcsc-lite: upgrade 2.5.1 -> 2.5.3
Date: Sat, 14 Nov 2026 23:48:19 -0800
Message-ID: <20261115074918.2932593-41-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132311
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../pcsc-lite/{pcsc-lite_2.5.1.bb => pcsc-lite_2.5.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_2.5.1.bb => pcsc-lite_2.5.3.bb} (97%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.3.bb
similarity index 97%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.3.bb
index 8fa9f1041e..b4494ef6bb 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9637dc508442c2f458df6444fca97e09"
 DEPENDS = "autoconf-archive-native flex-native"
 
 SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.xz"
-SRC_URI[sha256sum] = "bfcfe38a20afc49849c6bf55325e38f449fc4b26d3923fdc32b969ae41a8741b"
+SRC_URI[sha256sum] = "fe2bb733ecf95e52768907eb00da9f9f3daf180960283e514a05dcc090afa3bd"
 
 inherit meson systemd pkgconfig perlnative useradd
 
