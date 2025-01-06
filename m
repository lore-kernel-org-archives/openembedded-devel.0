Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6C0E7719A
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 15:23:33 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.61884.1736177006848693643
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 07:23:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Y9tdX9+A;
 spf=pass (domain: konsulko.com, ip: 209.85.208.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d84179ef26so1230136a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 07:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736177005; x=1736781805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOztFpBKiYrnOSDn+LT8ZayjBkbsi69eiuG4Bvyw1o0=;
        b=Y9tdX9+Acm7fzrQS8pZ7hkDUSPLDZx33Blw023+WkoLrgy/8H//4QQrZncRpLML2u2
         yWDdAn6nnI2e0hj5smp2RsRbwxBGc3GG8abv+0YRnbblOT8ojvYLqwqT4iYKcJn+gYql
         GURFSaGtz+n1JymPQJmfRWeOF73CtU/yIuvQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736177005; x=1736781805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOztFpBKiYrnOSDn+LT8ZayjBkbsi69eiuG4Bvyw1o0=;
        b=mmr8IWEuIRxGVrNencoPVyfVXcUjbaPzNw3Id/9RnMn5nwJmaXhiG/Bl5FWZ1BKfOy
         AbO1AHl2Z0PdwIT1NBnGffXnR4uR2m9uOfMNFE7th3X1RG0Z5WEId0hag322dOhbE+Eb
         QiyN6sQ7NIgSU1yqPtKWVXOVilxrkGBYTrL7GThi2K6z2sXBO+w5GUYd+WG81TshQrNg
         00Jjxsch8WVQGEaEEbT/irMGeYEj3kNU49BW45OP4pDjtENgOuCaMKuyKIJgqQct1J2N
         dyj59BCKi6wzs6ZwGmq5Mig7M+OdiSFu24vXYknWHJ5AY+2PCYcW88MnpMufaEx2kLgp
         KYJA==
X-Gm-Message-State: AOJu0YyEggfRdKJ7FRWa6gxKXNldXb98aJAjwI6P6flRCVM+pwj+6yER
	DyJcTi+BE2FOB1cLJ4hTRjUfJ4Q3IrEbJPHtVQpe16EKOrcMZHZc4FmJhWSwjnEO4ruTgB+3Zvo
	4
X-Gm-Gg: ASbGncv8KYp3/5YPXUkPVCNOBWHVJwnSKhMsZ7+cwjEijdvlG0W6EcdTVcX+RE1mIX0
	9HVLgIbaaK8mS2F1Fk2803bWBBC4NxvDikUJzErf81u7JMt1eGPl4IGSbc56/Q8KmJCVGaTK229
	UHcVfsSwCvldODINbTxl3jREC8VCtbWfk8oqa0/hgasiCGfLQmHAZsbyxaX8jGFNH+wgyfDVWO2
	XBcQTfiAPev2mlXum1uLSBSQNjCk1uBOQSMHhDoMyIUp9NHv9YM2/TiqPDkzJ2Q387kLCE=
X-Google-Smtp-Source: AGHT+IE3G97DRX3FA+y/MBrEyqy5yCgzmfkjteBcpU5VWfrYPJUt6qFMb0ss9JHbtDYC3VsjkyNWJA==
X-Received: by 2002:a05:6402:2790:b0:5d3:ba42:e9d5 with SMTP id 4fb4d7f45d1cf-5d81dd8fef8mr49107425a12.9.1736177004941;
        Mon, 06 Jan 2025 07:23:24 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed4e1sm23893179a12.70.2025.01.06.07.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:23:23 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-uswid: Upgrade 0.5.0 -> 0.5.1
Date: Mon,  6 Jan 2025 17:23:18 +0200
Message-Id: <20250106152319.728893-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250106152319.728893-1-leon.anavi@konsulko.com>
References: <20250106152319.728893-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 15:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114663

Upgrade to release 0.5.1:

- Add --find to recursively find SBOM files
- Add --fixup to repair any loaded SBOM files
- Add support for component CPE values
- Add support for component types, e.g. library, application or
  firmware
- Add support for loading CycloneDX files
- Add support for loading fallback files
- Add support for loading SPDX files
- Add support for substituted values like @VCS_VERSION@
- Add support for SWID activationStatus
- Add support for verifying different SBOM different formats

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-uswid_0.5.0.bb => python3-uswid_0.5.1.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-uswid_0.5.0.bb => python3-uswid_0.5.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-uswid_0.5.0.bb b/meta-python/recipes-devtools/python/python3-uswid_0.5.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-uswid_0.5.0.bb
rename to meta-python/recipes-devtools/python/python3-uswid_0.5.1.bb
index 1381d7e880..32eeeca585 100644
--- a/meta-python/recipes-devtools/python/python3-uswid_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-uswid_0.5.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause-Patent"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f3636dfe71e94cc72918423cec0d1971"
 
-SRC_URI[sha256sum] = "bdcd7ee5afac1da60ee688c357aa12f5f8d74bc28012446b10e2b4a9cf52fc6d"
+SRC_URI[sha256sum] = "92b48a8f6601687c1cc556878571abf9ddb0bdbaf244713b7ff838c48fcb68b3"
 
 inherit setuptools3 python3native pypi
 
@@ -14,6 +14,7 @@ RDEPENDS:${PN} += " \
     python3-json \
     python3-lxml \
     python3-netclient \
+    python3-pefile \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


