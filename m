Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441E8C369DC
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 12:17:09 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.46709.1745842624425148227
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 05:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NV69DF4f;
 spf=pass (domain: konsulko.com, ip: 209.85.208.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so7643963a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1745842622; x=1746447422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ANBMylG3YcykYjw+KwPuMCTzirJFaBAFgNdWZm5OYuM=;
        b=NV69DF4fKI6QJgmbG2C3VxQTiL+0Ee8sklopsn5xjwZiSKuEpVccpGpM3FocbZUz+W
         pq/4W5HaggpPKdHsL32P6VShVv+Hsz+U0kyxta37PRAGkhZilB7Lnv54VQnFEUcATor0
         QSgb/MJWTO6rCzqD8xfbNfb5aqRTMkirwYFEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745842622; x=1746447422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANBMylG3YcykYjw+KwPuMCTzirJFaBAFgNdWZm5OYuM=;
        b=xE212ZHzcW94sLVSdEpqvbN0A719jTXOTrw17b9OpidVAQLGfAe3JlxBWYCkZP3WNF
         ZMOu+poCg4akahjBsLDE8WnuST6Ci7yayKBQvxpZp961a/zj/6NKcLzrKjGjuFaM9Q0Z
         HNT0QqZl6BXZEP7IdY/mpaRCEYR4AYLtqkGkbs2mCaUr6oCpyyCRuvInyL9CLg1Y533H
         ylxcFV+NcjFXl5KFzx7uTL9UYRYly/EZVVNjfpuCSHeWLjb3Zeq6cdZwoFn2BR3Ycykt
         iVqdQn6YqVG9MN3uIy5RHI2T3yuvddf+BtKpNSvsoYokshJpU9oN0se9tFfxrmdBPsWb
         y1rA==
X-Gm-Message-State: AOJu0YzTejgZoghZa1H1rRnsywBKIQYaL0g8nKD6IMOHInPXWLcYFo8l
	0mbxbpeKzxARjgcZhaJ0WlxQdyKm9jRh4WbU60dMn13WIbKe4LXUaVcGrilqp3hCTjYzeEdWhGH
	n
X-Gm-Gg: ASbGncvGRJoT/k9TyfVfPNVHF2eYUOe4Nt3+HnNEw6QNSphKVXMq/jiW0QYAFNMuzXl
	jhb8D6MVULRiaTDhDiJWCKZYfehxV8VnAmDNOVRO/UGGR/F/h+QNnnjzHDYEQUH1aN3wtMRNKIA
	hxPTLpj0TAQPitxS1fwpxBlW9uJThjQUrso/hnTBznPEv9IGjjvrtZYWc89PQTpRa+DTmPn8l0A
	SxSm4eus3mdE3J5f6t3AKrzI6+Xkhm+rNitKeSm4n3EmhOkqLY0V0O/8G6oondHgoLW+pPn+xiX
	w/Gr+3BiXnxbckn59Nhdz+f/s4gjfjh4ZH/s8aYX4rWTPRIAFamK4K0=
X-Google-Smtp-Source: AGHT+IGVJ1mS8NTGBD4HQZC3yrZtg7NDmYBzIQUmX1ShbP/lBs6li8HhtwauZsMFsLJRbtesYzzlYw==
X-Received: by 2002:a17:907:9483:b0:acb:b5a4:ba35 with SMTP id a640c23a62f3a-ace848c047bmr927553166b.2.1745842622369;
        Mon, 28 Apr 2025 05:17:02 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed705fbsm620584666b.149.2025.04.28.05.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 05:16:59 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-elementpath: Upgrade 4.8.0 -> 5.0.0
Date: Mon, 28 Apr 2025 15:16:57 +0300
Message-Id: <20250428121658.2368361-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 12:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117192

Upgrade to release 5.0.0:

- Replace SafeXMLParser with SafeExpatParser
- Drop compatibility with Python 3.8
- Restruct node trees with XPathNodeTree backbone
- Unicode categories fallback with a warning
- Rewriting decoder module
- Add extras subpackage for experiment XDM and XPath on Path objects

Fixes:

WARNING: python3-elementpath-5.0.0-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-elementpath_4.8.0.bb => python3-elementpath_5.0.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_4.8.0.bb => python3-elementpath_5.0.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_4.8.0.bb b/meta-python/recipes-devtools/python/python3-elementpath_5.0.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-elementpath_4.8.0.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_5.0.0.bb
index 912a7a00d1..e13faad4e3 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_5.0.0.bb
@@ -3,10 +3,11 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "5822a2560d99e2633d95f78694c7ff9646adaa187db520da200a8e9479dc46ae"
+SRC_URI[sha256sum] = "932ff1087120eaddf38bc82c6345d547cd29b32c293718cbdd36485c704df861"
 
 PYPI_PACKAGE = "elementpath"
-inherit pypi setuptools3
+
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
     python3-xml \
-- 
2.39.5


