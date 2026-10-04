Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD3DCA5FCE
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 06:44:43 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19058.1791095455735314824
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Oct 2026 23:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EAD3O2LL;
 spf=pass (domain: gmail.com, ip: 74.125.225.99, mailfrom: mehmet.fide@gmail.com)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b059eae96so639061f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Oct 2026 23:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791095454; x=1791700254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+zXnLRsGfmHYtWHMDlJD5UXn8i13sztD8aJCTjv9Ug=;
        b=EAD3O2LLP+JpoNEdAm47H2+Mv+gvn7Cfr/dQ9dcMC1P+dEJ0dg3jU9jE38pMPuK3FI
         drfQGYZFVjDboTFsunEQTZcsYvemccFQnuQK0P7Mlfz++vUDwWRTVYV14YdIJRKPI0zL
         0hAIlhIpX+iSBdC1MZWivrbbICBOSW+ZHjxvDTgAjCAHAo2maE2ggUHA8/EwqczezugX
         ZqOvOtTKAEknthN54g7QggHIRwHDO8fZ651ytMGu4j00x2KJ7mgc0xXEij5lVsuz9fL5
         8qxzG2RgUimksDS+ce9LTPAQxsGHV03dpx6XPQ24bZkzX7M5AkeVYkOONMeLVqcXozCe
         t8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791095454; x=1791700254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+zXnLRsGfmHYtWHMDlJD5UXn8i13sztD8aJCTjv9Ug=;
        b=PhDSbwpki5kIxTNBbMD3UitEYrFq0M7IwoKEOWJ7JRHvpBSJkKHXihW9bOAT4Cl+wC
         Yiz5zOryAH36mwq2s753NB8duOr/8YY5ejILpp+12O6f9HTQlWink1aoCqr6p460KQit
         GK51nBUl/tSIn6WLs+/UCYnACZXKCZ5avstQtBq+AK56a9+EHlfHHEKB2eM4eo2BKWhF
         avWQJJTeDnbPIM3lV5xiPhUNfKYsCrJ18Gk/Pmq+GDdIrwcwEj0JdJ+tAnohV5Ma74nc
         p+10+2JOntSEkPSNtiuML941Bwpr54+NTTBW7tksp6ajiHYvxnjjpeixA0kfURPNqgxY
         ogLA==
X-Gm-Message-State: AFq9FYJ6PZAPXVbf0KGejXkRq/fEENubu6WVu59zqaG6Ybgsfhj6pFn7
	3P3u751RHOxQ7qTLkpzTCh6N156XKgRFAEvtucDKXrAVpDv3kJHddq2ABvt+ZA==
X-Gm-Gg: AYBFou0TugBqlHJcP86oXyk/6HniCEUBTzuA1mjwhc+41ohi3omYSjIir7W0iUbulWr
	7HD6uSx4nxmmNjQpgx+r//e6VaT29D4SB6F9KftJg+4rlEAyFuG9/QDwaVf0UoLTHpogMPLZz7w
	YcG8s5+R2EgGcyuaeKJWXRK/bwDw4Sc47XxAzsJ5wARFu5Je5ZkP7WwEIDb/495T03ddM2A5Cll
	7Rl4QW6Zo+a9bzKmwNNyxaE2i4zaxLNfHf2EGKbb+5B4fv0MmNilFtgLf4+IARbLMWfl7e781L/
	LILc1CHYcVqSFEEgF5PWE0D+YjmemDzbu0cnEjFfdC6rUY8dqKxZS/hlotm/HwK5TtdCPjRidL0
	fCOUCul2ixecGVtkLRq0WfbcQ8noKnJmL3tag/rZIhLbjFtyCV8zl/Dj7HKBmiIJ7Yl0WOHskkM
	rEnEsNdsEg1BpJcx2rLldC1w8jTMw2iauaZRK+qXkeZ2eVH9F+SdroiaLnlqQi82J4yQdBolaPx
	N5F
X-Received: by 2002:a05:600c:3501:b0:49d:2562:d670 with SMTP id 5b1f17b1804b1-4a02757ab71mr128250865e9.14.1791095002467;
        Sat, 03 Oct 2026 23:23:22 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fad53sm19054649f8f.19.2026.10.03.23.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:23:21 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@oss.qualcomm.com>,
	mehmet.fide@screeningeagle.com
Subject: [meta-oe][scarthgap][PATCH] spidev-test: clean the build dir before configure
Date: Sun,  4 Oct 2026 08:23:20 +0200
Message-ID: <20261004062320.3487191-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Oct 2026 06:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130618

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The recipe builds out of tree with O=${B}, and the kernel's tools/build
writes fixdep .cmd files into ${B} that list the compiler's own headers
by absolute path, version included. When the toolchain changes (gcc
13.4 -> 13.5 here) do_compile reruns in the same ${B}, make cannot find
the old prerequisite and stops:

  make[1]: *** No rule to make target '.../recipe-sysroot-native/usr/lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/13.4.0/include/stddef.h', needed by '.../spidev_test.o'.  Stop.

Empty ${B} before configure, as bpftool does.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit bd52d9b47960059767da18c01adac11b9693889f)
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 meta-oe/recipes-kernel/spidev-test/spidev-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
index 7b87dd28df..4c59d861b9 100644
--- a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
+++ b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
@@ -11,6 +11,7 @@ do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
 EXTRA_OEMAKE = "-C ${S}/tools/spi O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
 
 do_configure[depends] += "virtual/kernel:do_shared_workdir"
+do_configure[cleandirs] = "${B}"
 
 do_compile() {
     oe_runmake
-- 
2.55.0


