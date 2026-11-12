Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8436.1794467645444705927
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 23:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ci8Shhqs;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed39646f04so15103135ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 23:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467645; x=1795072445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2h/7Xw7QWiKqNawLALhqEGQOuq9Yggf5eN9lcwkDIwU=;
        b=Ci8ShhqsnbrQ5uYwAkqsa0i09JtUaFrb1cz4Z2cPnTCbRcqckLPX2fn34DLHIJwSTp
         P1MBvsynuDGsxcJrAzdsnQ8z7ltq3a1jKiCIMUZUdwDRRGwlNfT6Xfr6ZijnToBcJaQv
         BWpZMjexVIbnjw4DIw+cv5u8qp4mu33/SxtifM1xnFvhZAT3Hh3gftGHwmh7EVGeSvMi
         SJ+8PLemJ8R3D1GYrffxO2gvTkUK5YN8VOx4cSw7SrIVriac7SvZ3kRCjxH4IKscbM1+
         3yCXfVaxVe+YgBvoz2YCS6SwijfgOc68N/aSZMsRx4GnBcF6EO2bAvJQGZ+Hv5B2czzl
         twmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467645; x=1795072445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2h/7Xw7QWiKqNawLALhqEGQOuq9Yggf5eN9lcwkDIwU=;
        b=x62ZWxIpLDQaAE+N05LD3hcHiP4YoG5ZC01Gyj8AfBw4oGsBpP/Hj2k5NwCk3VVV0h
         x5huh4DA++poX8693kTNG+oqvq3dMAxJ0hkeb8NsYpiNH3jiyjhVLk3PxZoDlzTQGDjr
         TSUsOgZwwbAWlL2fKVXwGx9BQ6cTA2RmwhxulsqrJIHNXyRkPnY7fu2TGeWm//cxXilU
         gvQplh1TWRJWANWrUKi2MxMBckx/IFUlXRvtgKM5jZYmgBQW4/sEmEh7bs+qPb2ANIj/
         YhmRw1PLu1/3sYZpQH97CoFJHf8uyidWyuvqc32BXPbM4OtUyRghDJBbwOpLDvNg1dLd
         cHzA==
X-Gm-Message-State: APuU4Z+X7KMMtzAnKkksXf/nPGe02J55LVZsfpxAnafsTkthF3rqQJDW
	FX44zEzzW3hUm+WB9BjUXzQntlu6JFLEqlKTZ8SbXWRJGqxmPflRoX/qYuMQEQ==
X-Gm-Gg: AYBFou1+YvzIOvytp0z9beOf77zdEoLQaR7TCaMTBHwd/BIGiRSJqwfQ4ZxJRw0Fp8s
	9hjnhfofbKq4cGZo1L8UiyRv42vgtR+KmJ9DU/nmMS0vTzBrmJejpcMjl8gM28XcTsqwBh59guf
	+YJfqz12R6HpRRkv59ClgaH3z5M5YF9HmvzkqQIUEOx25akJGR3NMnghyC2mUrg4K0eCTymY963
	Qw4LuZpx1Bb6AloDRn89WA47X5F88iEEu2pLFInfI9HsO3K80HTXR0J1KciDeRjsuND5p5cUo20
	O4Rzy9oeGGkfVVMsHgz0lPkOkWEsbetd7FSlZcejbLjeam+BaBHPpa3pAlIwGNvxLbbjt8ET2ZZ
	igmlfwXsiW8mna1J8miWeVMeXw3Ijme33n4Th5dS31KQCSVAerCCVZpozNoRtG6fF7qxfg6tiHn
	0VStrnVwSvI7WH0elbhT2wrPTApzT1Z6koawBAQpp36+rxeOmel0Uc/hg6yMifa7WNszVzF3Q4y
	UCvJGk3F0F4LdSNR2ilp5qq8NS+oY0KC6Qu5n8emqNB2/MOwREV5I9Cu3fOAEtHJ6xoUvQvzjhx
	NjAVW9WXZLFKzh1/4QZgLSEvuHkgjS4APss/hkKanxXtJB2J8qF0cbazqRG5Tg==
X-Received: by 2002:a17:903:1109:b0:2e9:5714:6072 with SMTP id d9443c01a7336-2edd7a8ebb5mr48657835ad.44.1794467644714;
        Wed, 11 Nov 2026 23:14:04 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7e062sm29018355ad.35.2026.11.11.23.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:14:04 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/6] brotli: set CVE_PRODUCT to "google:brotli"
Date: Thu, 12 Nov 2026 20:13:46 +1300
Message-ID: <20261112071348.4144113-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112071348.4144113-1-ankur.tyagi85@gmail.com>
References: <20261112071348.4144113-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 07:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132203
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

cve-check class is setting default CVE_PRODUCT to 'brotli' which ignores
the CVEs from NVD Database.

Reference:
CVE-2026-111497
https://nvd.nist.gov/vuln/detail/cve-2026-111497

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/brotli/brotli_1.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
index dca16cb79b..14d7fe96e5 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
@@ -20,3 +20,5 @@ do_install:append () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "google:brotli"
