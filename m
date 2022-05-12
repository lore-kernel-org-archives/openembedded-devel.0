Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B91C4167B
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.1830.1652344925701048531
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=cN0GONHg;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.42,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f42.google.com with SMTP id m1so6199643wrb.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ERCZ46hNJ2Qv8amlcLGPoW6UeiO5kXNz9i2G2sGxL18=;
        b=cN0GONHguSLeuP5Ad0UDJCNFEy4Uy2lSog3nCZpsfXoLKB7FBr4totpnT84SnfE14d
         eXxsdpTQ706rM5ioRLKHZXxRxZnGEl+uY+SKQMKC56OFydxJCTpScgShxLhGQ95/gx5/
         TY3YNdVGNgZv8ZzS9/sbYRFelT8PBWSo4NHMWIOXYcUrG0V1p9+BJVGJFZCD1BOPC+PH
         VQEhI9quUrvbWTHEZPdT+nx+Y8DQtfhOV4wmEiEoPLIY7QJmcxmeQQgPM1dBR30sByzm
         Ri2UMXBlQ63rPQNkBh9TNpujtIPPHatnxtyFJiWRZwiC5Y6dbNR17OrEEuHmuc11FU7D
         uFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ERCZ46hNJ2Qv8amlcLGPoW6UeiO5kXNz9i2G2sGxL18=;
        b=T9ryLDqYa7kX02Y61DXIgXRNYBlKbZZ7SKBZoUfjtzgHv53mge/E9dofjoRIQEtwAb
         ESipgAIP632WPuRaHlvLsqHRqdxJM19SQsQ23KDNgJIDysIwyGGQNa+GD0Y/K64Xsp3W
         f3a9BvEHM5Ax9b2ZF0xYyBz8Mf7Qot7QNbGJytRElXo4pOAuw9cO6DWHMg6iInNiKHah
         fJbYjfhFD4EnBrqe/G7oauOFGrVI2eUFNCTW5rc9aewQXNm4/ZfNBykdU57OnqBhJJmZ
         WTCRfaF4XRjqGvkUl+vwkrg05kRIf9hozzUiMk0e2L+W2INmUF2cK2z4S1Xxub7S9ay6
         5z+Q==
X-Gm-Message-State: AOAM531yN1CMTMa6fL84gmkLm+CQEqkqSzfpLbBy+6GEXEnV4Rf7WGFC
	piU04NsV2hhFP3Df8qgp7S0fyQ==
X-Google-Smtp-Source: 
 ABdhPJy1HHSGVe5Mask1uuCNvyu2kbLudFduO3SFLWgEYBvN4JKtA5nr5Uo9NBZ+Fh7YkRu+2FdE3g==
X-Received: by 2002:adf:dd4f:0:b0:20a:ce22:909 with SMTP id
 u15-20020adfdd4f000000b0020ace220909mr25223852wrm.374.1652344924268;
        Thu, 12 May 2022 01:42:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:42:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 06/16] python3-eth-utils: new package
Date: Thu, 12 May 2022 10:41:42 +0200
Message-Id: <20220512084152.1388464-7-brgl@bgdev.pl>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97054

Add a recipe for eth-utils: utility functions for codebases
which interact with ethereum.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 ...-setup-don-t-use-setuptools-markdown.patch | 37 +++++++++++++++++++
 .../python/python3-eth-utils_2.0.0.bb         | 16 ++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-utils/0001-setup-don-t-use-setuptools-markdown.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-utils_2.0.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index d8cc9c0a5..11de569a9 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -112,6 +112,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-et-xmlfile \
     python3-eth-hash \
     python3-eth-typing \
+    python3-eth-utils \
     python3-evdev \
     python3-execnet \
     python3-fann2 \
diff --git a/meta-python/recipes-devtools/python/python3-eth-utils/0001-setup-don-t-use-setuptools-markdown.patch b/meta-python/recipes-devtools/python/python3-eth-utils/0001-setup-don-t-use-setuptools-markdown.patch
new file mode 100644
index 000000000..3c3c5270a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eth-utils/0001-setup-don-t-use-setuptools-markdown.patch
@@ -0,0 +1,37 @@
+From bc86d603e632ce61de4ae7a5d4bcef080cbdb160 Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <brgl@bgdev.pl>
+Date: Wed, 11 May 2022 13:45:06 +0200
+Subject: [PATCH] setup: don't use setuptools-markdown
+
+This project is deprecated and irrelevant for the functionality of
+eth-utils. We don't support it in meta-python so just drop it from
+the dependencies.
+
+Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
+---
+ setup.py | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 5717d5b..cb62132 100644
+--- a/setup.py
++++ b/setup.py
+@@ -37,7 +37,6 @@ setup(
+     # *IMPORTANT*: Don't manually change the version here. Use the 'bumpversion' utility.
+     version='1.1.2',
+     description="""Common utility functions for ethereum codebases.""",
+-    long_description_markdown_filename='README.md',
+     author='Piper Merriam',
+     author_email='pipermerriam@gmail.com',
+     url='https://github.com/ethereum/eth_utils',
+@@ -48,7 +47,6 @@ setup(
+         "toolz>0.8.2,<1;implementation_name=='pypy'",
+         "cytoolz>=0.8.2,<1.0.0;implementation_name=='cpython'",
+     ],
+-    setup_requires=['setuptools-markdown'],
+     extras_require=extras_require,
+     py_modules=['eth_utils'],
+     license="MIT",
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_2.0.0.bb b/meta-python/recipes-devtools/python/python3-eth-utils_2.0.0.bb
new file mode 100644
index 000000000..ff7caf5bf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_2.0.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Common utility functions for codebases which interact with ethereum."
+HOMEPAGE = "https://github.com/ethereum/eth-utils"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
+
+SRC_URI[sha256sum] = "32f50edb14c5be0c4f0e8c2e6117286ccc5dfda21d170f358add554a048398e3"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-eth-hash \
+    python3-eth-typing \
+    python3-setuptools \
+    python3-toolz \
+"
-- 
2.34.1


