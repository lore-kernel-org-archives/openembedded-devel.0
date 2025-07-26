Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43741C87FCE
	for <webhook@archiver.kernel.org>; Sat, 26 Jul 2025 00:08:59 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.32389.1753488537797400850
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jul 2025 17:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I/KP4v03;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23aeac7d77aso25752095ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 17:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753488537; x=1754093337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Svn3jJcJ78xAzGhw+nu7J9lV8EFXuQ8jM4mXZDrvESc=;
        b=I/KP4v03rqv7wG3HcJeth/dsOO1GRfvrw3CcaCbh2L++x2wuXFHy+UbKF/RhH1qOYR
         b3LgfdIwLPsrEkNp8II9PK5OXS61vHxEA5ZMAmVJZysPU+GOAABnwE0V2uavAk+4NEpg
         jiJv2l1vgVb/Z72qEz+SiSDWSCqg2iVLTanFvl/OF5pBPQAIGQpU6hwaWCuwr2Rkb662
         kA7BulSuyUwUpDcgTbvETOf1oVrbD4iXdEkIpfR0aQUEOyxaKMzR+OnFSgY1B0B7iMSe
         mMNJABEEnFmpZmYWZYdKScAB/87Oc6DhRn421MqiJiCsUTLlRp788vv3hMUi6mNJ2yll
         ShLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753488537; x=1754093337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Svn3jJcJ78xAzGhw+nu7J9lV8EFXuQ8jM4mXZDrvESc=;
        b=dBB49vPOFwWkUsCkjJkvbGPhDdw54553mikHT7CBGmcMEw81RRFEpGiLu4pLeduvU3
         bUOMt/J0/dBgDzRMmhR5X+ZgslUE6+mxVKJg9JdiXePptv7M91Aqf+QfQiks6YMncFl1
         W74A8+9mzbi200x4zde6hsNJOLEmQu5x4jVBSzn9mCKz3Gz8V3Jp1l3mt8l+i9vSEKd9
         o5m7Oa4G1pDg4TVX2h4ugsVR2NiV38JGwDnyv/Qt9gEF5IFdK4QxUl+JdUwzx8bmKjX7
         GdYYVF3Xd4qQuV3/zEnuIYWXBGAlzhe1+uQnV50eA8KWJ3yhDaI36XJflQ3oTiUTwS95
         fXoA==
X-Gm-Message-State: AOJu0Yz9eEtH1oLY+fhloY3+F4wZy9gYsa0kX5MtLJkiJmSfuSB1JiSq
	sz759k47fLi+7+26bRD5FmpxNmQHM3k59mGAlAiMoPE8NjL5AnJv7n37IOXYX+N3yjo=
X-Gm-Gg: ASbGnctFvCdkEeZUhDzao0+c1L9ZZ7aZXuR7oFu4Yi9EvNm+LwLp91tpJvB4uWE/jC+
	XmdYAadh7Iz55/hAtK2JelvpvqVW5jtLRrWNCULCmdKFA4brMgO7COckn3qaitdbsOEW45eJCf4
	bZGtr7UYkXmdGkLehP9n/stzsSTAq8WP1vOJnf0lfWSAoXTJN+VMtgJJ+6dzcpTOEK2RIMMHV/G
	N8jhZGLiQW3DoyWhKUqi5xoK1hcq14wcLJqTNLdxYwhCmi8IeeiE8DfkGmWmHJGNuslKiQ6Url2
	Nv6ExonUCZFugLSVEBrWd3fw8NoNk21a8c6vRNni4XGAGD9GNJTvkncrTrgrv4OKrtnyike0jeE
	rd0lGgMwXJS9iQA==
X-Google-Smtp-Source: AGHT+IHRXmH/OO9uC0vtXpH6vgWdJvWFkJBu0cxr0pmZ345fN1TpBYW/siX0oA2DTnp68Yl6rzvURw==
X-Received: by 2002:a17:903:2f87:b0:234:8ef1:aa7b with SMTP id d9443c01a7336-23fb3085301mr54828815ad.20.1753488536760;
        Fri, 25 Jul 2025 17:08:56 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe57753bsm5504185ad.208.2025.07.25.17.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 17:08:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] msr-tools: Delete recipe
Date: Fri, 25 Jul 2025 17:08:53 -0700
Message-ID: <20250726000854.2481612-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Jul 2025 00:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118736

This project is abandoned and does not exist on
https://01.org/ anymore, a mirror is found on
github.com/intel but its marked archived and unmaintained

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  4 ++--
 .../msr-tools/msr-tools_1.3.bb                | 20 -------------------
 2 files changed, 2 insertions(+), 22 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 2df3292a85..e58e2c73a8 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -294,8 +294,8 @@ RDEPENDS:packagegroup-meta-oe-devtools = "\
     yajl \
     yasm \
 "
-RDEPENDS:packagegroup-meta-oe-devtools:append:x86 = " cpuid msr-tools pahole"
-RDEPENDS:packagegroup-meta-oe-devtools:append:x86-64 = " cpuid msr-tools pahole pcimem"
+RDEPENDS:packagegroup-meta-oe-devtools:append:x86 = " cpuid pahole"
+RDEPENDS:packagegroup-meta-oe-devtools:append:x86-64 = " cpuid pahole pcimem"
 RDEPENDS:packagegroup-meta-oe-devtools:append:riscv64 = " pcimem"
 RDEPENDS:packagegroup-meta-oe-devtools:append:arm = " pcimem"
 RDEPENDS:packagegroup-meta-oe-devtools:append:aarch64 = " pahole pcimem"
diff --git a/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb b/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
deleted file mode 100644
index 2183170ba6..0000000000
--- a/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "utilies to read and write Intel model-specific registers"
-HOMEPAGE = "https://01.org/msr-tools"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=11;md5=678a3928c856042424c734f4a7586e65"
-SECTION = "devel"
-
-SRC_URI = "https://01.org/sites/default/files/downloads/msr-tools/msr-tools-${PV}.zip"
-SRC_URI[sha256sum] = "f9457b5340f5f274da4239a461f0db6b514142b40461559d9c6150f05aab1d1e"
-
-S = "${UNPACKDIR}/msr-tools-master"
-
-COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
-
-EXTRA_OEMAKE = "-e MAKEFLAGS="
-
-do_install() {
-    install -d ${D}${sbindir}
-    install -m 0755 rdmsr ${D}${sbindir}
-    install -m 0755 wrmsr ${D}${sbindir}
-}

