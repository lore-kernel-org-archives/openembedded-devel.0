Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65236C369A2
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 01:03:14 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.1915.1744419794013316311
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Apr 2025 18:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h2X0W/dW;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso2959835a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 18:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744419793; x=1745024593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mu1H/WlZKFYY94J8ARcXj18ddxeVJjU2Oa7oInUwmUs=;
        b=h2X0W/dWVkfNvwWyrOftEChabip1O5gzOjBBAOJ9bhh7AtRnUt3d6ogV2iC5mvajRA
         1485/kb5Xco1SrDD74OycqpnZYn3rSWUkpnPqTjS1ZJotpLkIj+cb6T8fa/PADLiygqo
         3Kko7JkOZLr76gDOgMBh1nlPN2FglIg3HEuqAQITA0OkcQxKPbtshINYD+rY3b6u0qPn
         rflgssqbEhO+mEkwfb5NrahNa5hm6Xco8vlO7UsdtqdeQ30SlTERiT95wA0tYl4g7uDT
         SmAtqcENsatxSfMQ4TiAJEGsEm8o6QMNasaseHP4Q6AFXUxMbU5dfGdS4vV/xgeufjIL
         +QSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744419793; x=1745024593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mu1H/WlZKFYY94J8ARcXj18ddxeVJjU2Oa7oInUwmUs=;
        b=ZHK9d4hqFUbAvUhT0T8kvyaoVsOBNvU4yYCYtU2qPrLq1PhhR/pHW70r3kRnvVTdgO
         9N6U4+lx5KcG5MyBOl8xZ6N+Z2Pc00TXMw70nLI08BzIgKPeAzKMZZTLcGGIHj8cSOja
         L0vagne0aDYoqhASy4FIzEIZ1B1Cq1nW4yRCTGfyQ9EnGfPcRI0muFNbcxYuftJjLiSM
         XLB1tBMlspOGA0Fp0j64u68qTrg7fRPUM/wFzSprm7j5i5yMjbRuFSrDo9TexQCW6V/6
         kEzQ6kjJmJ9/TaXMz4VF3f6c6pZAaKvpHwZoDJO+g1f1OpEf/qHf960cNS8jCJmQHWSL
         LspQ==
X-Gm-Message-State: AOJu0YyRT4A5KAB8esyZBQnHRUyKCQeCxotCVNNFyvdC6RQhJsZxmL59
	kETEkcmmZJWDb32BmRRAbFGkVKsbfNFgmYZW5oeZ3Gd3OdC5R492YEa3vBki
X-Gm-Gg: ASbGncuH2KGVR228XqpAWcA4Lg/LIEbAvQTz2zGCyDbvFTUuZlRQQxiDNmTDXAyMTor
	ClF3I2zrDeLTWsMQuOH0SXwc/GSqhgmVDzoyjuBP9uDizVbvp5rt3+8iYHs+TE1yeHeyDFmJ0Fj
	bZiCaKTClXlf7x3OCUSb6r4H/8mpqH6s5lCqF1rDGz6FoaD8fXOcptK31XVgZywLzY6DGwMS1K7
	3jmKYGRSkLG01Bjvb8BkUnm56Ww+5eRyHsntHsGHOC2P/rjoxfw2N93yaxRlnvC8Y15GbXGda4y
	+UXyUe33+GsQgYROZ+tQqOUGBvaR79Zo
X-Google-Smtp-Source: AGHT+IHntkUdjq5rMGpWcbn2FVrkAw/3hTL5stgyxfqLsSIIvI5bTqEDPAVWomTUEmwbWDEWZE4QAw==
X-Received: by 2002:a17:90b:2e44:b0:2ee:b8ac:73b0 with SMTP id 98e67ed59e1d1-308236343famr6525787a91.2.1744419793081;
        Fri, 11 Apr 2025 18:03:13 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::7ceb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c9929csm57010645ad.112.2025.04.11.18.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 18:03:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] kernel-selftest: Convert to use a dedicated UNPACKDIR
Date: Fri, 11 Apr 2025 18:03:09 -0700
Message-ID: <20250412010310.1167351-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412010310.1167351-1-raj.khem@gmail.com>
References: <20250412010310.1167351-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 01:03:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116802

Avoid following warning by using a dedicated unpack directory for sources.

WARNING: kernel-selftest-1.0-r0 do_unpack: kernel-selftest: the directory ${WORKDIR}/${BP} (/home/kraj200/yoe/build/tmp/work/qemux86_64-yoe-linux/kernel-self test/1.0/kernel-selftest-1.0) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-kernel/kernel-selftest/kernel-selftest.bb    | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 606df285ef..3a058cd286 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -2,10 +2,13 @@ SUMMARY = "Kernel selftest for Linux"
 DESCRIPTION = "Kernel selftest for Linux"
 LICENSE = "GPL-2.0-only"
 
-LIC_FILES_CHKSUM = "file://${UNPACKDIR}/COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS = "rsync-native llvm-native"
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 # for musl libc
 SRC_URI:append:libc-musl = "\
                       file://userfaultfd.patch \
@@ -108,10 +111,6 @@ do_install() {
     chown root:root  -R ${D}/usr/kernel-selftest
 }
 
-do_configure() {
-    install -D -m 0644 ${UNPACKDIR}/COPYING ${S}/COPYING
-}
-
 do_patch[prefuncs] += "copy_kselftest_source_from_kernel remove_unrelated"
 python copy_kselftest_source_from_kernel() {
     sources = (d.getVar("KERNEL_SELFTEST_SRC") or "").split()

