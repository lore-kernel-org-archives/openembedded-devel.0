Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.36768.1606592849227087082
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fP2uUX2E;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id f17so7025534pge.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EOuMV1Zv4sdyj7J4m6+1ZwRZchsL0nCct8+RAlmps4c=;
        b=fP2uUX2EqMJRwkFPU5yvXlLXUXVt7S3s42JdZgfo8Fu3eHrYdNW7d8tD1crLXQf9Fd
         ek2Uh3OuRfzS0Oh7bKuvz1dbBw1ExrZuP8YnIZ5tO+2eLVR4bxDcpf98YgUnDbWg1JmI
         R5A8/VOEcoRLzTOslw4FcPOwNQdQc8ontmOfoOZVItgMDKC9LDFPzWC3LTWbwTKaIn67
         MGz7fHNsa1rPcwAgmWEtXC1/7G5KpHtbtftB/RfbHPnb9BxdhLUBLKSKRPz6N9FwH7fJ
         ApfPQZxPCS8uHE03kfZtvuNJYb1B9VvreCL45/tnGyc29sEUrzIFEazsBUQ3rV+UKrr5
         ISmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EOuMV1Zv4sdyj7J4m6+1ZwRZchsL0nCct8+RAlmps4c=;
        b=pqZoREgN2F+Zg6JSDwwciHTjZSoLipAVIASELg1MYtopx0rSaC3Ettv8JPzsJ7dP74
         3wMjDUG1oh+XrY/m1s3Hi5G3PbfbSwlgjfbbCh2MPNFKMKbWngQWQxj230szGFagMozw
         9bZz8c2QMpPlcZcZgxPqarbv22DoAtpObVPiriTDuOXphr4Tsr3vElvoD8UCDdiLlF++
         4g0PP6wyOdmJ9AFMYIc47RodCkxuADrEjd9JuFQDilv8b96gNFZCC98t1bjK7atFmTgT
         DjoX774oK6jRfm4HNwcMpHJqthLvV4L5+8vztc6ytrOHIQsbvgEXxK9ozsU1Xh3jyRoo
         SQGg==
X-Gm-Message-State: AOAM53219HUSOa93DNRZUOVKDVqkq0bVdrPAuB/2W34E5UoUczL4pveM
	kY5eTiCv25Gkv4iG0DZ5OVR9kO9md00q+A==
X-Google-Smtp-Source: ABdhPJxosHig2HdzeJS+YE85M+YiOrQZ6KJbd9uXP2uauOsIdxDeJ7Bv53ktlCmPdDzi50o7176p6A==
X-Received: by 2002:a17:90a:a393:: with SMTP id x19mr17520160pjp.8.1606592848573;
        Sat, 28 Nov 2020 11:47:28 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:28 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 11/16] python3-zipp: drop (moved to oe-core)
Date: Sat, 28 Nov 2020 11:46:51 -0800
Message-Id: <572b266df2481b53b3cc562999ef3ac26cdea457.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
References: <cover.1606592636.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-zipp_3.4.0.bb              | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb b/meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
deleted file mode 100644
index 97523e8e7c..0000000000
--- a/meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Backport of pathlib-compatible object wrapper for zip files"
-HOMEPAGE = "https://github.com/jaraco/zipp"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
-
-SRC_URI[md5sum] = "ae81f228995578b840d76d1b7d87fede"
-SRC_URI[sha256sum] = "ed5eee1974372595f9e416cc7bbeeb12335201d8081ca8a0743c954d4446e5cb"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-
-inherit pypi setuptools3
-
-DEPENDS += "${PYTHON_PN}-toml-native"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-compression \
-                   ${PYTHON_PN}-math \
-                   ${PYTHON_PN}-more-itertools"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

