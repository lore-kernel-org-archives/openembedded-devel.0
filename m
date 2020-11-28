Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.36770.1606592850691950974
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fyoQ7sou;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id e8so7395785pfh.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2020 11:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bF/vrUGOmXtEDX35CpqzUtqoCGhEiuKC9vhE5F4p580=;
        b=fyoQ7souEferwAwt9x7vd28T8wjyfvV8eQl1EKFICuj7J0qgnOgwKD6ZhL/9+5Z7Gf
         x/uPwchwIz3wybgZS2qPniOVwleFW3mf6TNKVjcNXu/0u7lSM6PlhSzjfvM/AgnRaXkP
         4dOL+O2eh5OgIiHlEVK1Li7+XLOjyg5utzCjyxsHjUAC0UGXA6wzJDicWS/xIkqChtSM
         Giz5ir9261mRABEkhRybD6o8ZuLlSZs/m0QaOaBa8oEcul9HLWmcTik/VvgXq8er7h66
         qalRvxT+Ys1IUOhjDhwwOFaGfeegs2hCkYmZoK2X3rZmBS4upptxZPencZRpC8NZ1dU+
         Bgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bF/vrUGOmXtEDX35CpqzUtqoCGhEiuKC9vhE5F4p580=;
        b=WFLOJx5d9ffkVZTjK4ZrVRRnrWEjcnw4YaIlPaTs25XJ/q06D09rpWgTOoQmWJ5o0S
         MpWRShaUoXml+2BYcQXi/+u5QtTYWtxb3jTOSAIJtCmQGZiCvKDYNcm08R/vednQiJxH
         3vXpWbjusMWz1tGSjGFiGvOo1mPlLk+XilYd6NPOYwseF3ywhPCAZLZ5wWl4j+Rw7uyD
         wH8KDNHc7ggSP6+FADO6x4Er1GZFhATLKMb+zwenFOdKmaFc5oz8OlaS3thzTUaK9Hc4
         ubscGFyKssMR0bMaIZAYKutn+KB8Q1yQrxcnyxJndRlfnb4p8GIP9CO+RHXOwJUGM23i
         Vk1Q==
X-Gm-Message-State: AOAM530/WKhgoNtsUWHkPmleRw8/a62OcIGxire8sIBbdAwZdpyUfkcw
	1vzlg+PULTn35WHy/QvhEPRXIsgIJ2PoNg==
X-Google-Smtp-Source: ABdhPJzZjlKucwSbH2IeafJ5xMeOLLx/pYCoBSqoL+2QkZQMqL6teQjBP1GQS3IGRlA3JMeHF1BwZQ==
X-Received: by 2002:a17:90a:ead4:: with SMTP id ev20mr2267433pjb.111.1606592849707;
        Sat, 28 Nov 2020 11:47:29 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id d2sm16084702pji.7.2020.11.28.11.47.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:47:29 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 12/16] python3-importlib-metadata: drop (moved to oe-core)
Date: Sat, 28 Nov 2020 11:46:52 -0800
Message-Id: <3b6393f53bca063d62b25506af84f6645abcc6e5.1606592636.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
References: <cover.1606592636.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../python/python3-importlib-metadata_2.0.0.bb | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
deleted file mode 100644
index 325a41c22e..0000000000
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Read metadata from Python packages"
-HOMEPAGE = "https://pypi.org/project/importlib-metadata/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
-
-inherit pypi setuptools3
-
-SRC_URI = "https://files.pythonhosted.org/packages/56/1f/74c3e29389d34feea2d62ba3de1169efea2566eb22e9546d379756860525/importlib_metadata-2.0.0.tar.gz"
-S = "${WORKDIR}/importlib_metadata-${PV}"
-SRC_URI[md5sum] = "3dd91821c930a3c3633e99a7025aa9c2"
-SRC_URI[sha256sum] = "77a540690e24b0305878c37ffd421785a6f7e53c8b5720d211b211de8d0e95da"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
-RDEPENDS_${PN}_append_class-target = " python3-misc"
-RDEPENDS_${PN}_append_class-nativesdk = " python3-misc"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

