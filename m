Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5702.1794974919098990970
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:08:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SCTVlkA/;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so1560291eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794974918; x=1795579718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bq/cgv9cVQTnGYCIFbPbhibf76m9VuqGygNLR+Nrb2Y=;
        b=SCTVlkA/5guJ8Cv02KEZh1UA7CBATgeTBmlLZCWzC9OFfTgUIB7gTDq0f5Y0qPIKgz
         2P5azv0uwcJ05wZSNGiZaFBc+DQRkqCCcCEQsB3LtA+wALoG/KBMcPUCOMCxtcc5Qv+X
         Vd9FXUi/AAQWbTwA95b4Yg+8/NjBja8txu6cYsatKMHLf6TAwXJatBKW7wMNzWICWdHV
         xUg0epjgUQ7e4BmuThIEPhHM+Xn8HKwFzumIXwccQB4SJxSw9pNyzDnGplA+gritO8qA
         KmvDE+g5tL2pGlLaDio0pLYEBA15I7qaYhObOHYRbTIglM97bWhge1CoKUab8GEsT0+c
         ZSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974918; x=1795579718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bq/cgv9cVQTnGYCIFbPbhibf76m9VuqGygNLR+Nrb2Y=;
        b=sfGgh58NOr/dKhaLp/yZu+0hbdeZRbVHiDhn506gZjwmJx8uCWL5MHXvik3YahxiGU
         CUniuBCdB+tK8TquZtjbkASyLoNvIBXWSqgD8Fqb4HdzKnUxXCYDFH+uVjBHwp2eNjtU
         a+MYmvEooWjaci4XC498D2bVElSe5H3QaN4vItZWUHfqiE87xxvoIzg8zN+mruJAyb4/
         G4MCpuD5bNcjavjt11tfWDQfkntQAOKvMp7dkLYJYel9TkKJybP9mmZRJghRqSueTtmZ
         4dIlmTwhTcLSqckNeP4buS8KUJ3VQF+bkm5GG3TM14hejNGrDY/KvGTyaok6VGpzeGiK
         5kKw==
X-Gm-Message-State: APuU4Z+wiPBfHfE6naUf+MerU8w6wbL2kELKIqV8nBr0XEsvzktzohYm
	DvZqbHmFUExS+JzZf5fjV1CzHg3ZESc//+RCcgAK5XQbVVlf37sTNIKa9yvDEVoP
X-Gm-Gg: AZFdTZdB51Lqhf3SiOZLk0VcZS/a2wGp8C2GasKykEO91X9a2vNv4JY4PCaOMFRw3Fl
	Y47wESkIlZCBWKTAePdGJThnXf6BBv+HNZvXjXRPSC/7IQbkIbojOYZ/wQBWVruYjWNDHCnET86
	LVlUZIq5YOjaij6TxRbjuWYR/S5t7t6Ff8qo50MsdsFy4Gs+P6PYw+wtakKjtoRoVmDMZMYAuZF
	pRF542rXCGE76uZO2qOZ4/naRaidIskwB7Vw1HoX+FzdWlky9do73zDQC2EGZZGrtShgbKZEW+0
	m+il3GF+bz5lBd/AI718sZowifM/BLOMscYC4kwlMM3Hyl/cz7tfXegX/9/62V03Zg66h7DWxBT
	HY25Qzrt3ZKJBtOGDkMbpixxQ1Q8d7Hw6EGhTwU/FsR3Q10yNGa/cIfTSwFOd7LX+cgahaJsdj2
	d/tjRfz2pgx5S+LVGUTibLw2xfwwIeMYzZWv7BPzpvLoIZRD+0VbbrvOzhOVg5qSDlbcq2ZZf1f
	3FfeimqOg8iDLFxmIDHSlEYX+LYXJZoZPlDy2SN1PANSX1OtDxtpvugJJZF5HKtcKRebVNIMPnn
	wX2/LviNL07rlPDNN5vwq0WcplYUm9o4671N2x4B8hQacIwPM7LjQ0oa5CZCcRJhGae6/LFXK0u
	1uhBd4ROTmAsv0stdKh1tjIP4lhX8GvRUhdgRaIMYnjxom0VOYkLIucoRruDj7rdpTb4+u5LcoH
	nFgOQaUvamoXS8Ee40DlRGyVcp/RwOGZ5kRr6atvLY2nVBwJ7JZnExP40uUa1ykMxjxXHrmRuT5
	TVy/f//xBCZ6yO72cUGOs5pdowT9AjNucIZLq8aXjBvoIX0deqp5Z0CkHFiE9t0Nqa9G7pWcM7d
	OcyE
X-Received: by 2002:a05:7301:4d07:b0:369:21a:dcca with SMTP id 5a478bee46e88-3827f5972d9mr1355032eec.10.1794974918240;
        Tue, 17 Nov 2026 20:08:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a73e0aa6sm2695251eec.19.2026.11.17.20.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:08:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/8] ccid: Remove unused patch
Date: Tue, 17 Nov 2026 20:08:24 -0800
Message-ID: <20261118040831.2284885-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118040831.2284885-1-khem.raj@oss.qualcomm.com>
References: <20261118040831.2284885-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132617
Content-Type: text/plain; charset="utf-8"

0001-Add-build-rule-for-README.patch is not referenced in SRC_URI; the
recipe has no local patches anymore.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../ccid/0001-Add-build-rule-for-README.patch | 24 -------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch

diff --git a/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch b/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch
deleted file mode 100644
index e39e7ddd3d..0000000000
--- a/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From c82680a21c7411ba63e5815786eeb471720faa29 Mon Sep 17 00:00:00 2001
-From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
-Date: Wed, 6 Nov 2019 20:10:09 +0800
-Subject: [PATCH] Add build rule for README.
-
-fix do_configure error:
-Makefile.am: required file `./README' not found
-
-Upstream-Status: Pending
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
-
----
- Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index e77c4c4..fd77ecd 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -27,3 +27,4 @@ libtool: $(LIBTOOL_DEPS)
- ChangeLog:
- 	git log --stat --decorate=short > $@
- 
-+README: README.md
