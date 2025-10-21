Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74754CCD19F
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 06:35:42 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.5208.1761028541828655394
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 23:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GVIHaD+J;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-290ac2ef203so50925385ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 23:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761028541; x=1761633341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6CGy3VW2ASkkJiPlOLNxrZwK1eadQwpwcJmHRa30SE=;
        b=GVIHaD+JTLonbGNexQnQILuiaDUMYk3xASqhsHJfpCj71GiNSuTBFvemLonraQpvOu
         /kXa0vpQsoz0jedFoA9j4wXBZOkPq/4Ah0bnDHXWcANPpP4NYncjuecEIvCixgiwJ1Gg
         aTdbv5srtKjRq1DE8TzHkD/ZwnDe7t3aDjpVY+wxuSqjh8dHK5Qs0fbt4SLlB0L5utgF
         XK8fsyNma9m7L4FZMC/QOjCkPlaZmyo9u8fUaG8BuIOYaTBnWGz2KWEY3pbegcJgOtoc
         fV9PC9xREZSVMUGQN2Ipf2NoAKLNPTzILViSrJn2XRwTaw3BaFglAuRW08kp9lYJNhav
         4/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761028541; x=1761633341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6CGy3VW2ASkkJiPlOLNxrZwK1eadQwpwcJmHRa30SE=;
        b=KSIv3lc3sgjDvpJE38St/qvJfPq3Ld9stzw73jzQYuWUSNFNRJm+o7x4CXr+PR+FC5
         Ti3z9OSZVhatwNUC5ZDZq3Dp1pc3We/AnJsmqINdAdeiEntXuIoSXRkldpZfF/rfgRMY
         eaZQVD1gOTyv3INzl1nsZy0Z3UfsEpa5sUr8kogKi6ai+Oysu0z3pNTA96DVRjwp30F2
         OB6LfhsaWZRRHkfz6LwQAgfEfGqfERgNhr35nDhHjvAy2aSUUOltSCmiY1In9h2zPpiU
         GlHgQofv1yab26HAaKEL/BDldfB1z8UHQJthjUDZ14xan507j3ejzkW8224I6ykMizRw
         Yl/A==
X-Gm-Message-State: AOJu0YyeKCctX9/XBbII78YGWb9HcybKKDrh6vNZh6roX9fDyQEGhc34
	mhNXaVMM2XP6p9vSy92FgEA4mUi2G+owu81jDwAYukQbh6UzEToFKh+gwUKT6g==
X-Gm-Gg: ASbGncsa0oUsgBiNWtLMVoaFvV3bGI5KnTX4iE51ndtkxNjaya0LRYOvoYHstMF0T7K
	ouRinOqGGmDdVlaEUe7Usjayd0xTxYAhGfiOTV2qUgGGCNxrIQ8uNRU5Hvqobwydn2LkvELgXH5
	tPB7LV9HJ1dP/hVK13PGyjcnf6iO4pqR/u/9bFwfqObNOpwc9Or9CLVyVAy19hDOLNnbEejfxVl
	sZSsKS4AGsxKTEzNAqQHzwGt0XP5TMn7Fqjy5ZYHwkpZoGN+eAXsTUxCV59+0t5NGlDKr9h1UHP
	SK0Y++ZEmTlEMP+dSxt6D1365/fvTZZtBlj+T7bNiwle62lBrO8E4WP9KuPlhZNzYKekwTiKhMc
	Y7a+kwgKDOVoN0VFxTrsQnjYlexZnU5GWQJDKLKw8scceuAKxFYArXjpcFVqntFMUD+DCy7tqs9
	vEUKsJiAgUsLLf0Q==
X-Google-Smtp-Source: AGHT+IEpOCEayzJZhhXluHgh+M085aL3hc3RI77e5qUW4BoJLapJRR4OeD74pmW/zvLrdk/gMEi8gg==
X-Received: by 2002:a17:902:ce12:b0:271:479d:3de2 with SMTP id d9443c01a7336-290c9ca2a4bmr179926425ad.13.1761028540975;
        Mon, 20 Oct 2025 23:35:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471da2f9sm99609595ad.62.2025.10.20.23.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 23:35:40 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 2/5] libiec61850: ignore CVE-2023-27772
Date: Tue, 21 Oct 2025 19:34:04 +1300
Message-ID: <20251021063407.232340-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021063407.232340-1-ankur.tyagi85@gmail.com>
References: <20251021063407.232340-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 06:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120828

Details https://nvd.nist.gov/vuln/detail/CVE-2023-27772

$ git tag --contains 79a8eaf | grep 1.5.3
v1.5.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-connectivity/libiec61850/libiec61850_1.5.3.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
index 0e1f50164a..fa9e84a29e 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
@@ -36,3 +36,5 @@ FILES:${PN} += " \
     ${PYTHON_SITEPACKAGES_DIR}/iec61850.py \
     ${PYTHON_SITEPACKAGES_DIR}/_iec61850.so \
 "
+
+CVE_STATUS[CVE-2023-27772] = "fixed-version: The vulnerability has been addressed and the fix is included in current version (1.5.3)"

