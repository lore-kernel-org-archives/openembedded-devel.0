Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68775C83F07
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 07:16:46 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.54185.1751872598351368760
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 00:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GEdLlMua;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b321bd36a41so2256238a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 00:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751872597; x=1752477397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mts1/mRKx2HSaZWOKBgBf7ZmYQDhP1wI6ojIq/7BKdY=;
        b=GEdLlMuaDYq7HFV64UvNMmD8LFGFzsk4nx2kq1O5qI81swEWZU8+rGVN8B5irelX3C
         Yt68iL1rq6yEg2dPWW9zTs0N7VtAiyoosXQkCGDU6A5wOqmLhOcKV3qe/6CZWu75sEc4
         +/hgGemn8MoWGZFon3bYuYL4liixYLvXFjo1fVFDo8PUYEZbVr6nP5KR26Ohvk9+/iWy
         U0q+h+niJsEm3ovgPM2wN/PSCzoGZuJ2XSXbv9Zy9LGjWrUxlQk5RAazsroYIL3YPo4E
         qPOmC1Ki/jqkhtt7ZH5nv7SC64k6dA4NIDK+7ceOwVWu0ivkod3MDS/Ec5A3yLKulRIf
         k6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751872597; x=1752477397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mts1/mRKx2HSaZWOKBgBf7ZmYQDhP1wI6ojIq/7BKdY=;
        b=A+rz8/CtCOIZb0OYEyyjBQK1M1kKQ+78tPxn/4baI4GwJVYLuxnlzWW1yrPSJS6Bpf
         jky+fhKzZm8Zx6p/N/yp6UJn/0Q6nn3W2E5BsNV1Z7jGERSSFQ+ygCwHq2bDagDJ68XN
         ljtlme2OK+Owu8u2llQE3NiMF0fwYPPgqR9UCV7aMxQhxU+y0R+XqcygYaHALMl7hRXn
         iU2DvLN43yKDd6NXt1fSO9ZfAOLXcnpo5CP/2Li56TFK0qoL7m9F85K6afKzS1lNea5e
         ueSHkwhKhoh2AqOThdKP+m5qs9phT/8Gcdy89hOPMCTLLAgPpTyVrUBTKUchdCDYvF2y
         6Uig==
X-Gm-Message-State: AOJu0YykJ3d+TrxkPvexaS45Gt/EGwKPI3icUZpRWSJ5rV/qkxTRbHu1
	GWXpeR5X7JNDnQgXvQbiOwq6Wi6r5rE+7Jey5swthAF3ILiCLSW2Aah0b+bRbhCN
X-Gm-Gg: ASbGncsGu+/Zk+U8WEmYt5kyZByeAKma3N27v9ELnl1VOkBtHogs4X9sVpwDh8yEOr+
	DP6v6+bNo9lQX9WKA/dvBpwdTKG46uFNJA9xH0CXJUUcSg1DEXYVHprLXsltMOrW67rN2iy91hY
	/pVgNNdmWdJ2SqKZQI36rXxt+eyi/UUEuviTxrPDsE0aATrNuXBqK6pXXbEbvMWX+bKH4grqG8V
	Qg6r/LbdtOGWvv/zv1KjYxh2tz/t1MqeRvLkTsIHCYK+5Q485bYjhN4kgh3n61kfyLAVfxWszeA
	bmSj30sjJeaLXrQ1aBvhSAfcwIuz6jRhkRz3goWplNbb7SSnwG3mlsKCECAQmZG3
X-Google-Smtp-Source: AGHT+IHV3K02YwlsbyyJrs2TqOZG4YmKjQKJQ3Qx0y2s6gBi1MLuJIy6fq3GECQnqJtQl7QSvy76Zg==
X-Received: by 2002:a05:6a20:43a1:b0:21f:86de:354 with SMTP id adf61e73a8af0-2260b08d9d8mr16722704637.26.1751872597294;
        Mon, 07 Jul 2025 00:16:37 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::857e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee5f4931sm8044699a12.36.2025.07.07.00.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:16:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pstack: Do not define redundant S
Date: Mon,  7 Jul 2025 00:16:34 -0700
Message-ID: <20250707071634.2565094-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 07:16:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118244

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/pstack/pstack.inc     | 1 -
 meta-oe/recipes-devtools/pstack/pstack_2.10.bb | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/pstack/pstack.inc b/meta-oe/recipes-devtools/pstack/pstack.inc
index ef5ba03e59..ee0518c9cc 100644
--- a/meta-oe/recipes-devtools/pstack/pstack.inc
+++ b/meta-oe/recipes-devtools/pstack/pstack.inc
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=671019a96ba80415b696240ed2ca5e80"
 
 inherit cmake
 
-S = "${UNPACKDIR}/${BPN}-${PV}"
 DEPENDS += "zlib xz libunwind elfutils"
 
 RDEPENDS:${PN} += "elfutils"
diff --git a/meta-oe/recipes-devtools/pstack/pstack_2.10.bb b/meta-oe/recipes-devtools/pstack/pstack_2.10.bb
index cebc13d36c..bed49b62ba 100644
--- a/meta-oe/recipes-devtools/pstack/pstack_2.10.bb
+++ b/meta-oe/recipes-devtools/pstack/pstack_2.10.bb
@@ -5,15 +5,13 @@ HOMEPAGE = "https://github.com/peadar/pstack"
 SECTION = "devel/pstack"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ea061f8731d5e6a5761dfad951ef5f5f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=671019a96ba80415b696240ed2ca5e80"
 
 DEPENDS = "tcl virtual/libx11 libxt zip-native"
 
 SRC_URI = "git://github.com/peadar/pstack;branch=master;tag=v${PV};protocol=https"
 SRCREV = "a310df637d74917a1d3570c540bf3aef899d7e63"
 
-S = "${WORKDIR}/${BPN}${PV}"
-
 PACKAGES =+ "${PN}-lib"
 
 SOLIBS = ".so"

