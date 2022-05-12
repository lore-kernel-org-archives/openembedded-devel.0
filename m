Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4ED9C41535
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.1835.1652344926772535616
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=kvWtZVJS;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.42,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f42.google.com with SMTP id j25so5195196wrc.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AwKEQD6tZDPLYSWKwGspQGq7qPqAP8riPQNC6g4bFTU=;
        b=kvWtZVJSv14ET9sc9pNgVvTpY7fziWhdpQvB8NVbJqB3F+qep0fKCtPiY/Do/MX3NW
         ni2/iaVP/utf4nR9wpDgZSeR21/CFA8sPlQTk5GYfjlaZapyrAPAIL3o8geQxil1oT+k
         z6h66ncjFd4xahbcR5I+zUFAGHHpWmdq1UPv/nhN/N1XkeH/5AXKUkaE84OKpECjYiGm
         y8rwsm4m1Caek099bwtxbbKeXugc3EXV4JGFN2PGrFLc35FrVF9pdS+hB5CI0iOmiXWs
         ZYZFax0WOECg2AgHPOeMWmnGsAAe3eCdBG5oHEZOOvQT3fAxiaVociPTXYmePWzewIhO
         VKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AwKEQD6tZDPLYSWKwGspQGq7qPqAP8riPQNC6g4bFTU=;
        b=s8VpxtqCb71gwfi3E1UqKMTZqCoZReF2PxHYI2CLu1XlFxnrsY+IVjwAuDxXrsYbvw
         rRrNELIB7WdyZ2dbeBMq2rucQcCwyDDDqv1ggf/mWS0C1ZFdk7MPxn/Qz8NAYzJf8uR8
         5QFzpoGwFfM6bJUx+4jhIklCsbB9WCYLB5OJYy+nYbaXscNS9jiMthiPVjmJ/VAFQQ9m
         JND9I6ds+N2ekdqiRyJ6Tzde774IASWc++ES9F//Fk825G0HD2x0vzOwDVT9JtqATdOS
         cz3d28g82TIW0Cv6nnonWtOnQ1splBrpgPN0NHHG+pwmigQbixaO6LQJ2Juu9Z95iP1Y
         KPYA==
X-Gm-Message-State: AOAM530JClIDXqYbDnWpP5htCzBc7bEJ2Exe5ypp1MpiIXtGzkZj5ztH
	uKZ2+1+1psdcjwBLW0e8vps+Dw==
X-Google-Smtp-Source: 
 ABdhPJy45ZQRSuRhu+wkIJt/RGDxcjkU3hX6PxR1v1WKQ8G07aFSuEo8V1gVz0F7hAb+IpYJ01hNCA==
X-Received: by 2002:a5d:5989:0:b0:20c:582c:d19e with SMTP id
 n9-20020a5d5989000000b0020c582cd19emr25699268wri.531.1652344925030;
        Thu, 12 May 2022 01:42:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:42:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 07/16] python3-eth-keys: new package
Date: Thu, 12 May 2022 10:41:43 +0200
Message-Id: <20220512084152.1388464-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220512084152.1388464-1-brgl@bgdev.pl>
References: <20220512084152.1388464-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 08:42:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97055

Add a recipe for eth-keys: common API for Ethereum key operations.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb         |  1 +
 .../recipes-devtools/python/python3-eth-keys_0.4.0.bb | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-keys_0.4.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 11de569a9..41bb24b32 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -111,6 +111,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-engineio \
     python3-et-xmlfile \
     python3-eth-hash \
+    python3-eth-keys \
     python3-eth-typing \
     python3-eth-utils \
     python3-evdev \
diff --git a/meta-python/recipes-devtools/python/python3-eth-keys_0.4.0.bb b/meta-python/recipes-devtools/python/python3-eth-keys_0.4.0.bb
new file mode 100644
index 000000000..b0b1aad76
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eth-keys_0.4.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A common API for Ethereum key operations with pluggable backends."
+HOMEPAGE = "https://github.com/ethereum/eth-keys"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2beaef1b1764f4d6b46084c885b4bcad"
+
+SRC_URI[sha256sum] = "7d18887483bc9b8a3fdd8e32ddcb30044b9f08fcb24a380d93b6eee3a5bb3216"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-eth-utils"
-- 
2.34.1


