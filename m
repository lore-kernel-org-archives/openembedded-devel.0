Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34325.1794851708792310683
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=H2XHTx2+;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so7090303eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851708; x=1795456508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oy2aGRlkiAb3b6tUg+jVbooYke3MkN1NSZrUqsbcg0g=;
        b=H2XHTx2+drnucgTa+fklPjXftfrfxyjl5cGoxypjThKF96GVUnz181lA6dadhnR1kT
         D5q69aF6U1jiUL4V4eQ93VIaqEEdOWVa+hoDWAIawsG/GOGG6djydYDcg+vvnoYgMUax
         uEyy7JhaY+mXj6ZBaeM9ME0cSetthIzYfsTSU9/l/6ZOsioEEKR30hiw2pLxcbi/cXjF
         2Tq1PzbiJKeb+IwJK+A5wUR4VZrScTvIqrmxoreTlDz2Qk3QckgggNrw1Nh2R6GUXKHL
         +SHJb97scLa4XgORVs/8VJvApODxkX34e6xdz/RvIS51MlWpczdr18DpHpmS9j/k1xCf
         fc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851708; x=1795456508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oy2aGRlkiAb3b6tUg+jVbooYke3MkN1NSZrUqsbcg0g=;
        b=oTMq+Z6rp3X4v++S8nQ7SErBlza+UD2UWPgGw78L3wFbzlJhQ2cYPCwVHCFwX4HdGx
         sTK4qg06qkQdDrvltlXszoPT8ZG0QdGCS0OCGhd89+UqlcmgjCLmy63O12WtozrAVEXQ
         NuNS3Om06HrcpE8fPVXG6m6mmiKr4xWxfCoVE0GoXINtwLzCqcNOSwpHDIxzvtPN6VrZ
         fsoFL+pIiMpuIMvIlkELnpf7ZbuxOY/Ww/XPF91WYxD25GyiOoncjOqPlxjCvQOZNQTX
         pTHVV+0LJ4cn6kV7O9C0XytumpDjfPJOSPSdIejga8IpLKN/HpxC9xcmf9FtPZDx3pNc
         NpCQ==
X-Gm-Message-State: APuU4Z/X54DPkdjrE1GqL99qB2ghORauNZr3wneRCnQeQfzd8RG+DOuG
	vdwpbi3HA77/O+NFs9MTvJShDaJJ59MetHt/R9ZJDXyKPA4ttk09qZZdBmMApLF/
X-Gm-Gg: AZFdTZdLNfAuawXVpDCF7LMAbZP4RxBEque0lYFfj06X1/xPvvUJy0HpmzvPiDox14N
	sLw1iBu3S4krgoMrxuTF9E6Ra3uXq9rS0i3BQjILJUdW05wTvygnqAzSHAGPcfljZkBdoK9ABVG
	FUNxl6xSmO4Xh6huck581O3ipPO+f1ItE3Wj5wDepq3gVklVZ/mk+aPxWwLDGMITVlgb14R/SRQ
	lKdHPOib30VwHI++Gber6/6xcgYLKV+Azi9vpQJ252ogM68w9Oe+fgsG7VtUd4E1EmGZHGhzNBY
	GmsaFIpGosORNyfmKD+QAcUxIP0mvwvTqTIUtZt30/2z9HLNw5gfmMXmkSZ9QUUSoBz5/RNmQMZ
	zOkEXbRP5IW0pXX46DrImjnvozuHtN6SXIAZ+JKE6xKj/AM8nxyewSmoikfTGsDmaQnjes+Dv9A
	UudMcdlnK23zLfs2wGSMaolrVZ21ldeqT+q8A4yloZtR7lblhIu22u8OGdtUmCgeP9KpY2vNSJh
	NOfIJibgY1hPIXPt9rq4WKCxE+u/kATmncoLI8HKdKSQIMW7saclkv6yQV7cIb9sq4IU+4lCXIC
	dne05+LEZtuXfj8JYpmFWwQ3BuE676e9KI+Tc0GAp0uw0bPRW3n5i/TUEd/DtuBVwzF1zd1sAkB
	eBz9z8fezT02NSBK+x+lAQtCDiuZlGNZ4BCs0/yG+jEpDZU1cMGBfbdDayzbWQsPXtxKth+tKjN
	J+5PF4xOCSmbfQsxGAxNVtKE66mbw3qtROULRm9grpQ2zsnmxgDFRhY0403Fq5lqQG1ugQ6zO62
	DP3p91vA8f3X7Z/YD32kLysEZN9qptbQCsFBkbGnc1GuFi+vXycTwZ47ea6siZULcUA830BNwlF
	7vlD
X-Received: by 2002:a05:7301:1a0b:b0:36c:9e26:88b6 with SMTP id 5a478bee46e88-37965ca86fcmr10994769eec.9.1794851707938;
        Mon, 16 Nov 2026 09:55:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 046/105] python3-jdatetime: upgrade 6.1.0 -> 6.1.1
Date: Mon, 16 Nov 2026 09:52:58 -0800
Message-ID: <20261116175359.342679-46-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132502
Content-Type: text/plain; charset="utf-8"

The new fold tests look up America/New_York and Asia/Tehran through
zoneinfo; add python3-tzdata to the ptest RDEPENDS.

Changes:
- Fixed: preserve datetime fold in datetime conversions.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-jdatetime_6.1.0.bb => python3-jdatetime_6.1.1.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jdatetime_6.1.0.bb => python3-jdatetime_6.1.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_6.1.0.bb b/meta-python/recipes-devtools/python/python3-jdatetime_6.1.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-jdatetime_6.1.0.bb
rename to meta-python/recipes-devtools/python/python3-jdatetime_6.1.1.bb
index 5a7fcd7931..87f4a9cc8c 100644
--- a/meta-python/recipes-devtools/python/python3-jdatetime_6.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_6.1.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c80be45b33471b4a23cf53d06a8172be"
 
 # The PyPI package omits some files for testing like tests/__init__.py
 # so use the GitHub source instead.
-SRCREV = "480b637d024555e1523b4652bd2b6c5b5fac33d4"
+SRCREV = "417d87bfc229987ce86b61992ae6d211a35c8f70"
 SRC_URI = " \
     git://github.com/slashmili/jdatetime;branch=main;protocol=https;tag=v${PV} \
     file://run-ptest \
@@ -25,6 +25,7 @@ RDEPENDS:${PN}-ptest += " \
     python3-core \
     python3-pickle \
     python3-unittest \
+    python3-tzdata \
     python3-zoneinfo \
     python3-unittest-automake-output \
 "
