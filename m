Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C86DC55182
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 23:55:31 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6259.1785801324716050872
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 16:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=asjQJE3v;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so54911645ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 16:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785801324; x=1786406124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=748HUDFQhtxRYSoIg0P6/bN7wnxbaseUhvEM21by3Ss=;
        b=asjQJE3vsev0DHc9kiz7gAG0nBAt0DDebhp0EYhsGmESrxtnSLnGJt0/S/FrRlC6Aj
         pygMgH5VGZfT0Dw1hutADzc+nrytNcW41wmu1e9buayOCXPZJbMCHTurtwr9UM9AElZv
         Xs284i8m5FCfvKs5YJySCUmCYVdYuTEhKQ53IAHfbiHbqTOpCMTOJiPBmeQpFWUSxLZv
         wJggwk83wtAVsh8W183SUoa3juO7Hg+h7ZUNoAkqHLg00Vqaz+TbWA2pNfI0L0PyvL+w
         iD9+mun73DijXTzWx9po0MZiVu5xN6dJ58U1NJVt3FXKMmMil+1vPuMZZC4cV8Xls8JO
         YHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785801324; x=1786406124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=748HUDFQhtxRYSoIg0P6/bN7wnxbaseUhvEM21by3Ss=;
        b=A8VfpVo+3pa/CvjrRE+jS19i6Ly+dmm38Z4LyQ7CsG1JmVLL+FVoNvfhJkNNrsNgXa
         Poi6WmfJbyCdf518OpkNTR5Btu4rKwcrClQdFykPYw0s2SULkXS7zAcbZHL9KCPUGr+k
         58F9jHy18biwqRtDpiL6ge9sv+RjEpNp25OERP2b/VrS+6LM70eoLdiL8K/mnileZkl2
         A5jNP3K8UcRHDruFl8laxvMEEnRT0422w0pZIMOxzMVtZgdcVy8590K9GXixPBPOEjJu
         RSLj0+JAS0dVzdweLa4d2ecvz2c5pK2O1+x6XLWLPogs0XRHvc91c6b3zxVs4O8OVbU3
         57JA==
X-Gm-Message-State: AOJu0YxBptCxX/Cnecw/ZNimUTcbt4rs3FdizW4JtiK7WHsqOV/Wua69
	qdGrJzgzcw1MR8y9bPBC2XTfvIdTbF4MwVGDTnepKmsz8Zj7v8pjTGV64BOgNUfB
X-Gm-Gg: AR+sD10QAci0tRodQ1ebA2GHQtpHFUxeWbuTBh3VXgN11LXaDR4mRaA/QtQBG++2VJJ
	5Xtz3byx0q5MPBc8TuHPwpy9K1hxZmaeFTkN525rMUFtPnmKfZj4dnx82m0hauAAHMxXpuXd/lj
	L5kzCfGhWrjxDyPX5dhlc2VrlcSmagV3O48dP+BWM/663rCh6z0DISCyLI2EBJmxlNIydL2ZLBo
	4mJAd9YolIKQOp7cxX7kNBZXSJGoCzWgnB3K0ZZzAQD3sH7NjzSLBC//eXtR+/Ko6PugstSkSjM
	EAsYmVM8Hfgd7l1/F0P0Oje0z3qpV1ixC7ALjkA/IVL7pNqxORLRaB6yEGM9AQPTA4RhLACXLPH
	wOcj6AF7wWN/fofbIRiefkh99NeUS2bpCLz8dwXTnUjOVKcb0Qi0OIbRhbtcOohVjOYUCSfMmpZ
	vGbm1/C/9jMbXY9TmRix6BkuHYWnyDZtmrtQgPGonVc950/tQlhe5whYNq5wh2/Axc9CX7uSmcU
	moA9TXJ1kpFr6bZ01TLaSsL4s4THlX2XRopSjDI3Zg+awUnm8V5gSmLu4HmQdnfo5HBJRHL9dFT
	/5NJASd/kdgDPFWEtMc5++S6QMNbhXZUlP+BC3l1TO7c0xzQKF6gu79FvcSvvkgEthUy8wfM0Bm
	cO1z9Q2iraWAH
X-Received: by 2002:a05:6a21:1645:b0:3c0:b4f8:bbfb with SMTP id adf61e73a8af0-3c92a5e15cfmr11242899637.22.1785801323910;
        Mon, 03 Aug 2026 16:55:23 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm69105780eec.28.2026.08.03.16.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 16:55:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] kernel-selftest: Drop obsolete dependency on linux-kernel-base
Date: Mon,  3 Aug 2026 16:55:19 -0700
Message-ID: <20260803235521.1358903-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 23:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128698

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 06919c8bba..15522f8b8b 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -45,7 +45,7 @@ PACKAGECONFIG[mm] = ",,libcap liburing numactl, libgcc bash"
 do_patch[depends] += "virtual/kernel:do_shared_workdir"
 do_compile[depends] += "virtual/kernel:do_install"

-inherit linux-kernel-base module-base kernel-arch ptest siteinfo
+inherit module-base kernel-arch ptest siteinfo

 DEBUG_PREFIX_MAP:remove = "-fcanon-prefix-map"

@@ -169,12 +169,12 @@ either install it and add it to HOSTTOOLS, or add clang-native from meta-clang t
     sed -i -e '/mrecord-mcount/d' ${S}/Makefile
     sed -i -e '/Wno-alloc-size-larger-than/d' ${S}/Makefile
     sed -i -e '/Wno-alloc-size-larger-than/d' ${S}/scripts/Makefile.*
-
+
     # Add kernel headers to CFLAGS to fix PTP selftest compilation
     # Required for PTP_MASK_CLEAR_ALL and PTP_MASK_EN_SINGLE definitions
     # introduced in kernel v6.7 (commit c5a445b)
     export CFLAGS="${CFLAGS} -I${STAGING_KERNEL_BUILDDIR}/usr/include"
-
+
     oe_runmake -C ${S}/tools/testing/selftests TARGETS="${TEST_LIST}"
 }


