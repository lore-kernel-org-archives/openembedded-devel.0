Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C2FE77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 17:29:20 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.1867.1735925359664253986
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jan 2025 09:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HCY7DyWa;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa67333f7d2so1788670266b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Jan 2025 09:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1735925358; x=1736530158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oOOL+0E68maNHZAB/CaUbRy7spA/KO/ws+oH2RYf7k=;
        b=HCY7DyWa3kYmAY/Ae3aoWJ2YC3vrfQOv+iwXug8wqYzBA2Ikhy6jL917ddQvVlb+te
         HzscEX+G5fIh+OBLnMs2RlxuxogV7qzdX9sHZYCDzpwlfkgyCjlrt2ITy+7QBrEnLSMT
         JuHQKdbi5m4pkE7Rf1AMZWhIqVPm5VfXnO7m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735925358; x=1736530158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oOOL+0E68maNHZAB/CaUbRy7spA/KO/ws+oH2RYf7k=;
        b=BhyZw4noy/dMkzfEs7c/ME9snY+xxRFgaJ2ySpllGt0unumf7G9DemesuvbMqTgOhF
         Iy690lh/lZlbs/fH2J8fy1kx09KG88IeTlGsxsemg3PMIBm4CU2dcyd5MRvO+0191DKd
         8kVzNmXCAB/kfkqKNAVFfEP524ydta4vhwZvuQSbKkCHfUENSakRkU3nMiNwRHjcnwr8
         +vTivWIRTyHF+8Z6vL1KE6y6KE2xER0mMmrTSc1VqsbxYwwqUMjxIymE2DFzXgfmd50j
         ZSDpDS75WMxeWANoIsgtA6lF2XD1fMWVpgrvVsQmU8Y7LAANbTGP6taz35oBqHjFoa9R
         +qHA==
X-Gm-Message-State: AOJu0YwfV8Z2qF7wlJp3VWz2zZ2MXAHeYNKFUdJ+TNoO5T3bnWP5dnhy
	Awogt+T60s2kvMoXN3xK0wUERKVlqF4M2gaIwNUVA3tRKi0lZur8kUlO6LffhwG7s7NX/MgGOTZ
	W
X-Gm-Gg: ASbGncuxiKP2mz9zVMf5Oe6cPv9/ixxIRNOQ1Kxyo3OG5Gf1UBpNGM6H1cXiuDVm41n
	w6ZY4RAdNYqEbIgr8y9TOoiQyNSHPSjQdcpqwKtUllK45+qqb1tgY17tI/RK2tSvKg+EhexOmhD
	tHckeUh3e1Brtwq5qX65JA4JO8Xa5jvevR6kYTd/d7NFTxaVXZjjzmhm4Du8p+xlJVixOFh3xhs
	drtsnxXVvufnOl+AVE3lq7zUiI9Jl+kv2ObWNPQcPZie0Tbx0aCVnw62oRRSvjPkatHnYc=
X-Google-Smtp-Source: AGHT+IHoY6o53BDn5GaNwZCC3vVp6Rnd8V5wj+w/3xc4XSHx8zINzTOSAb00O2GLUe92cN5o/OtIEw==
X-Received: by 2002:a17:907:7f24:b0:aa5:44a8:9ae7 with SMTP id a640c23a62f3a-aac334f1984mr3224660366b.47.1735925357709;
        Fri, 03 Jan 2025 09:29:17 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f015ab9sm1902571666b.155.2025.01.03.09.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 09:29:17 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-bitstring: Upgrade 4.2.3 -> 4.3.0
Date: Fri,  3 Jan 2025 19:29:13 +0200
Message-Id: <20250103172913.3888678-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250103172913.3888678-1-leon.anavi@konsulko.com>
References: <20250103172913.3888678-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jan 2025 17:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114627

Upgrade to version 4.3.0:

- Upgraded bitarray dependency to >= 3.0.0.
- Explicit support for Python 3.13.
- Added i and I struct codes for 32-bit ints.
- Removed the 'experimental feature' label from the new exotic
  floating point types.
- Fix for negative index LSB0 slicing issue.

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-bitstring_4.2.3.bb => python3-bitstring_4.3.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitstring_4.2.3.bb => python3-bitstring_4.3.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.2.3.bb b/meta-python/recipes-devtools/python/python3-bitstring_4.3.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-bitstring_4.2.3.bb
rename to meta-python/recipes-devtools/python/python3-bitstring_4.3.0.bb
index 4d86ce7df8..79591fde7d 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.3.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Simple construction, analysis and modification of binary data."
 HOMEPAGE = "https://github.com/scott-griffiths/bitstring"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=661f450e2c0aef39b4b15597333444a7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=963a24c175e658fbf16a764135121ffa"
 
-SRC_URI[sha256sum] = "e0c447af3fda0d114f77b88c2d199f02f97ee7e957e6d719f40f41cf15fbb897"
+SRC_URI[sha256sum] = "81800bc4e00b6508716adbae648e741256355c8dfd19541f76482fb89bee0313"
 
 PYPI_PACKAGE = "bitstring"
 
@@ -14,6 +14,7 @@ RDEPENDS:${PN} = "\
     python3-io \
     python3-mmap \
     python3-numbers \
+    python3-bitarray \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


