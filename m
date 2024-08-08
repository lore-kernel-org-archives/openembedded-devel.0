Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83582C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 12:23:17 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.58568.1723119789960395106
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 05:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=IBqsvffM;
 spf=pass (domain: konsulko.com, ip: 209.85.167.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f024f468bso978320e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 05:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723119788; x=1723724588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7mbu9v9UwRwvXip8qz6ls8ihvgQE4hDm8Wpoz3EHOg=;
        b=IBqsvffM5FWiF11h0NeuNHmxJr14AqLKzjwK6w+gDl8FWeWo1Q+RGYVAUZYH8r3IuN
         VuscDM7R8K6e1+yAo1+XYCiaByK1iTBxsV9s8ol0uj5cut0/J9ixKAKnd7TXZGPpFbDT
         NVuZmPVsJQhjnu0z4b0ogkrV7b1gmY2dfd0YE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723119788; x=1723724588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7mbu9v9UwRwvXip8qz6ls8ihvgQE4hDm8Wpoz3EHOg=;
        b=c6THePhwOcQoYCLn99S+XHKCEA443gxthsE/TKC34g2Vvl4MYz5A+SP90Krcw9muNZ
         YH1r+kV3ETJJghScKlAQpoVzbfh9Pi52bNQgHB7MC13mbfbEoMiuAr5BDXaL5jaLLh8Z
         OiShR/VF+BZmcX15YiEPtf/U++NzUToRgXu3/shnVzfynTtLH46z7JU/2RPeYodxxIPx
         BHmj/x9NU51Eg7ozgh0fx73M4H94onp55xyKNBtgJNFaQ822nXbfpe8yz0t3Q8S3gTIr
         Dy/JMIq0Gvt7PLo2YpVpVSDr4P1ClrLCl/kXLVuw4d6meVqAd39S4//mtxsbiVOG5xdX
         bw9Q==
X-Gm-Message-State: AOJu0Yy6nBB/vDEKAUo0Aj2LVMqsGp2ds6+M+0/K9LJ9C7NdfL/2g38O
	nITWW2KK+hL+Ez2AMux3Rp2n/K1+VVC09gYXOKlS06b/XZ5p0CyljVvY3p0/Up4MkWVZ5Y/3LPz
	G
X-Google-Smtp-Source: AGHT+IH0AWcZiZBxaGaqctMn0P6ig+zpzUfuJQjJuHUMsvsKhnpN7oviwdD0sN/fVseUgM1SQum1rA==
X-Received: by 2002:a05:6512:1593:b0:52e:a008:8f55 with SMTP id 2adb3069b0e04-530e5891b62mr1206420e87.41.1723119787789;
        Thu, 08 Aug 2024 05:23:07 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9ec886esm736135366b.203.2024.08.08.05.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 05:23:07 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-pymongo: Upgrade 4.7.3 -> 4.8.0
Date: Thu,  8 Aug 2024 15:23:01 +0300
Message-Id: <20240808122301.2271346-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240808122301.2271346-1-leon.anavi@konsulko.com>
References: <20240808122301.2271346-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 12:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111659

Upgrade to release 4.8.0:

- The handshake metadata for "os.name" on Windows has been
  simplified to "Windows" to improve import time.
- The repr of bson.binary.Binary is now redacted when the subtype
  is SENSITIVE_SUBTYPE(8).
- Secure Software Development Life Cycle automation for release
  process.
- GitHub Releases now include a Software Bill of Materials, and
  signature files corresponding to the distribution files released
  on PyPI.
- Fixed a bug in change streams where both startAtOperationTime and
  resumeToken could be added to a retry attempt, which caused the
  retry to fail.
- Fallback to stdlib ssl module when pyopenssl import fails with
  AttributeError.
- Improved performance of MongoClient operations, especially when
  many operations are being run concurrently.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-pymongo_4.7.3.bb => python3-pymongo_4.8.0.bb} | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.7.3.bb => python3-pymongo_4.8.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.7.3.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.8.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.7.3.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.8.0.bb
index baaf3847a..fcce456d8 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.8.0.bb
@@ -8,14 +8,18 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "6354a66b228f2cd399be7429685fb68e07f19110a3679782ecb4fdb68da03831"
+SRC_URI[sha256sum] = "454f2295875744dc70f1881e4b2eb99cdad008a33574bc8aaf120530f66c0cde"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta python_hatchling
 
 PACKAGES =+ "python3-bson"
 
 FILES:python3-bson = "${PYTHON_SITEPACKAGES_DIR}/bson/*"
 
+DEPENDS += " \
+     python3-hatch-requirements-txt-native \
+"
+
 RDEPENDS:python3-bson += " \
      python3-datetime \
      python3-json \
@@ -27,4 +31,6 @@ RDEPENDS:python3-bson += " \
 RDEPENDS:${PN} += " \
     python3-bson \
     python3-pprint \
+    python3-difflib \
+    python3-logging \
 "
-- 
2.39.2


