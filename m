Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257DBCEBF96
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 00:27:36 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.349.1763425655255963457
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 16:27:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bohWdFqN;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-297d4ac44fbso43755695ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 16:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763425654; x=1764030454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=up0s1DwiIAdcKQgyhH77INWUwhtX4j7FgmTxkyj+Zss=;
        b=bohWdFqNNS1J4YrwzhOb8EMsWQsq259BQsyKrqpNGU/id8IsvfRXQ+z8dR2aZRUOt2
         DeJY8LqZuV9mkkXdIMu2zHVYxUX5cELo+E2QCydhBOYSIwF7Snd4D9KO2bgA+EtNbZsw
         a4Mexyoj982mzO3NpuEWHZ6BPcaRQPeWjAlffxjY6du4Uhg46DXkMRN1Uxjfq0lylXSf
         aIx3C1FmhNGAZu76LHu5ZAvWotvx+0G0Fx3MUi8WRtFTKGNdHQo6YbxtZgcT4DFormBW
         XGwHhzxT4RZY0urUq+6YXIufwGvUyi42iIig082+epgWvvfMNxbdGjSl5gAGqjD/jwMi
         ZFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763425654; x=1764030454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=up0s1DwiIAdcKQgyhH77INWUwhtX4j7FgmTxkyj+Zss=;
        b=XDM7CRfE2nFU17e0Asda2z+MVAimPCoWyF4MpMGiLw2Ew0sly4etUytw42xlmU69W3
         coXa3MGjx2y8khh0mofTh9NGc7C/8H5JSsyr66gnNTCoiw7BChT3GiUpX1vWQ0b7E2ej
         ymcmq1uD8069LQvm01fuLhfj2WVF2n2Xof7jPSV2H3j35sLv9HyZkpuJoVSBrwku8DrW
         P/JK5rfv5RmOimicLdb2ENfhrRfp5LzHWQmAe5MUTquCX7VRJHvSnHccWR4y+QVOzeRF
         WiaTCD2BcbsyqU/GcldQFLFeJJraI6SQheJ3V4WfzbzBo7bQ83ntIWGATWfJb44HAhEI
         ZLHQ==
X-Gm-Message-State: AOJu0Yy5O2Tc0Oc06BO1gpqqcMj5l0vhP6yHwAug7Sxx49gwkiu2Ogfx
	rmZK9988Eivh346nCKG088C1b+dm5mpVKO7VKlVT8KtBdqRoYvY37UmTrTXybg==
X-Gm-Gg: ASbGnctnfFl2o96dKlMa+IvZgy6r/jNFX/lVZKWoQFcZpDxEB3u8k2btKhI8fMKGYXv
	Vh0Nsc6Pl9cdDuflx+LQxTGIe5egiI7L9Hv9+cFwzFJFMOT0RSCkT4e9kMlEzaDM2MxyEfG0Umn
	/5gX7v/x4+CuckgLV6Rg+LpGSNgRxAmTg8M//Lek5hFHpINAPu0agsalcLVYKt6J+fqpCl4k1RI
	fYfTuPVVEzNQGwrVnGHjsl4w9MmmJC5jcfYmNbVtrLblaY6Ie6ln3LIPo4BpPZi9ial4w5Rnwju
	Xq2zQ/jmPwXm2/qcAJOX3j4Z6c//ReGCWVzN1gNLfkLB/A5kkKc0VfC5hZbJFDid/nUSp4gpXnY
	l76bWTMs995lFJttu+qmMA9xUuZiPOya4rDimXcmc105gz+Goh03+b6CxFl4+VgeOUnWtAW/5Zu
	JC8ZI49HVE9N/WE2oBLaoqrgBhEl/wJ8s48w==
X-Google-Smtp-Source: AGHT+IG420H/iJJ9Fc6a6Ix8pdJrxTLK59YD3d7jNtTopFQCmYcCzByzM3Tp3Ms6dhYMRIT67lZudA==
X-Received: by 2002:a17:903:292:b0:295:5898:ff5c with SMTP id d9443c01a7336-299f55841b6mr13645765ad.16.1763425654464;
        Mon, 17 Nov 2025 16:27:34 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm153866565ad.36.2025.11.17.16.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:27:34 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/6] librdkafka: upgrade 2.11.0 -> 2.11.1
Date: Tue, 18 Nov 2025 13:27:20 +1300
Message-ID: <20251118002723.829508-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118002723.829508-1-ankur.tyagi85@gmail.com>
References: <20251118002723.829508-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 00:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121789

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/confluentinc/librdkafka/releases/tag/v2.11.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../librdkafka/{librdkafka_2.11.0.bb => librdkafka_2.11.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/librdkafka/{librdkafka_2.11.0.bb => librdkafka_2.11.1.bb} (92%)

diff --git a/meta-oe/recipes-support/librdkafka/librdkafka_2.11.0.bb b/meta-oe/recipes-support/librdkafka/librdkafka_2.11.1.bb
similarity index 92%
rename from meta-oe/recipes-support/librdkafka/librdkafka_2.11.0.bb
rename to meta-oe/recipes-support/librdkafka/librdkafka_2.11.1.bb
index b1f5196f93..23ae2fbb29 100644
--- a/meta-oe/recipes-support/librdkafka/librdkafka_2.11.0.bb
+++ b/meta-oe/recipes-support/librdkafka/librdkafka_2.11.1.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=40b04809b5d6f648f20f45143cbcb1ad"
 
 SRC_URI = "git://github.com/edenhill/librdkafka;protocol=https;branch=master"
-SRCREV = "c56a3e68483ae33622901988ab9c4085f0785c3c"
+SRCREV = "69b1865efdc0118cd017760d038d34e52fb3f0d0"
 
 DEPENDS = "zlib openssl zstd curl"
 

