Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89B8C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:21:23 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3445.1788427275303828269
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sWhMNKdy;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso21348065e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788427273; x=1789032073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GY0bnB0lz4mKug5ct2q1q47mht6TNnNFLROx0kQlMk8=;
        b=sWhMNKdyGAo9bWmgwkqp/3BbhfKa/MABHrhajVj0AvrTT9kBEezsoUVyjB8ZNI3pRu
         5PabaZPqgLQs6mU8neQ9o0cNQyJmtJGhJT22De2/dGK2Zdy1Zg/mNscFQapG2tbPaefp
         bQBBF1Vz+dMKH/KZixfwVSbDELxcqhhdVGwVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427273; x=1789032073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GY0bnB0lz4mKug5ct2q1q47mht6TNnNFLROx0kQlMk8=;
        b=PZ7GSLMOrUdjV/me4vc1KG2/mC5/szbScz0i89fFXB1zo/vUJ2WCyO8H1MO5pTN5RJ
         vHKvJUVjWp7PbxiPQUQ+rceiAIjoQ6FmjOjU5u13d0bA/iAqRY9/YIW8wqTuZ/55szQ1
         JwgnH/LkeLXTJPnCJ3G46pu2W655nbflixTrWtB+T8xW22xX0/FUZrG6R9cGAPs2Blzb
         UR7rsrf7JF/tkFMpDjvSU5ZMsPLCVOXBFQywWDskofAgCgX0pktp7akWL8fUERRfL/AI
         BmL1+MjGaf+xQI9Pm0tbFrSpfWux/K4hEBClpH201zfRUbuqsMMyjttZsVLvYknWlTzr
         /x4g==
X-Gm-Message-State: AFuF++nS+4t7vRjZaJYsB0o1RC3bAW310T6A8uIn6F980IreQvU3nHwO
	u55ILy3PcK5HAd7V33ztubmeBCyz32t72bLhp7TjnFwkcy6kMI+z+rfx6YUOUzlywePSld4fShE
	vCkrR
X-Gm-Gg: AYBFou3cyBhowBSbCtq8qJiQcCRS3peBKPmyxWBbtdGAiZVjKbqdQZqg5j3CDCkTuK6
	oUwNhTxZncU5RT5Tvv/wYgxDILpd1gagF5MatrEsF123mZfbBJA4QVbQH508fvrfLzBwAK4P3+5
	pXU+vAP1oiYFNNyOojxTXwipCSpheUr8yz81K+wav+dUmNTKvubnO7v9zT3gbAvUbU3uWf0Y3Sy
	byCLJe3A4owkw97QsgIHsJe4tm5qjS8tTn/RB8FyLbhYqZOQt+1cyRPyPv0QpJdkdgmRgUvygJf
	cNgx/oN6PBPMAeNzm1si36yQOJ1eerOeX2NLyWl8eONh1iCurBnWFP5IC3eTES0giy7KUBJJXr0
	sIO2E2OYAE5vGaH1v+jodgsNF1n2+qm560/NQGLAidPCNw08JIwaBEr784DK+gjXWnEOtxGLH76
	zu4QSb9PgZ5o0xPY+5OT8DstltSJnwNJfH8Jt5YNwFuRXSpZismsUZcBNTI3RWySavl0jL8WwMs
	dBoztLAy36cxGQcF9Ofdg6pQfWPl571RofqgTz338Fxl15U46Y2ipiemm2tcPZ0b27ovMMIi4sv
	GW8XK1f8cJ3xCLVZcNdj3qVj
X-Received: by 2002:a05:600c:1395:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49ce5812c52mr160379165e9.10.1788427273308;
        Thu, 03 Sep 2026 02:21:13 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d2019sm55305085e9.2.2026.09.03.02.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:21:12 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-charset-normalizer: Upgrade 3.4.9 -> 3.5.1
Date: Thu,  3 Sep 2026 12:21:08 +0300
Message-ID: <20260903092109.1641069-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903092109.1641069-1-leon.anavi@konsulko.com>
References: <20260903092109.1641069-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129715

Upgrade to release 3.5.1:

- Raised upper bound of setuptools to v84 (#794)
- Cache performance access optimization for our CharInfo struct
  (prebuilt only).
- No longer decoding large content when the noise detector output
  give a high entropy. Only impacted large content input >1M bytes.

Deploy sample data files to fix tests.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...0001-pyproject.toml-relax-setuptools-upper-bound.patch | 2 +-
 ...lizer_3.4.9.bb => python3-charset-normalizer_3.5.1.bb} | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.4.9.bb => python3-charset-normalizer_3.5.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-relax-setuptools-upper-bound.patch b/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-relax-setuptools-upper-bound.patch
index 508debc340..f73a6ef803 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-relax-setuptools-upper-bound.patch
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-relax-setuptools-upper-bound.patch
@@ -19,6 +19,6 @@ index 1111111..2222222 100644
 +++ b/pyproject.toml
 @@ -1,3 +1,3 @@
  [build-system]
--requires = ["setuptools>=68,<83.1"]
+-requires = ["setuptools>=68,<84.1"]
 +requires = ["setuptools>=68"]
  build-backend = "backend"
diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.9.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.9.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.1.bb
index 6df52a23d4..b5e20f449c 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.9.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48178f3fc1374ad7e830412f812bde05"
 
 SRC_URI += "file://0001-pyproject.toml-relax-setuptools-upper-bound.patch"
-SRC_URI[sha256sum] = "673611bbd43f0810bec0b0f028ddeaaa501190339cac411f347ac76917c3ae7b"
+SRC_URI[sha256sum] = "6117b84ea48435e5356dc737f5121485c30920ba43375fa7b434fd753df0eac3"
 
 DEPENDS += "python3-setuptools-scm-native python3-mypy-native"
 
@@ -21,4 +21,10 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest:append:libc-glibc  = " glibc-charmap-gb18030 glibc-charmaps"
+
+do_install_ptest:append() {
+    install -d ${D}${PTEST_PATH}/data
+    install -m 0644 ${S}/data/* ${D}${PTEST_PATH}/data/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


