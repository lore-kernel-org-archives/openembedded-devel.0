Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E3EC19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 04:48:11 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.5015.1659502083104297248
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 21:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hJcGXTgM;
 spf=pass (domain: mvista.com, ip: 209.85.215.176,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f176.google.com with SMTP id bh13so14135278pgb.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 21:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=75gWHPIrv22KkdHZOON0tJOR0EehW7SnLwC+wUc4Txo=;
        b=hJcGXTgMHgQeV2uqMqoHrLvBvT0DE22917zM1Ho8KnYyqD+AM5IKAqbV7+Y1bM5D9r
         QyXtKznRJN3PAvlIr9+p3BTTDKBD2k7CohpsGraR/TCgCkNvpUxiWBJ0E+3yPQb36fn7
         Sc7sUsOu8Yd7YIpg+nNyTx59a9iMwIBaulZoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=75gWHPIrv22KkdHZOON0tJOR0EehW7SnLwC+wUc4Txo=;
        b=ziNIR6psCgMlvp7eB8uDn1zVaYUE6f8z9rke/3N06GvlkrNnt0m/Adwj9+KfHOeyeM
         W+sxCfUcSoWZAK5zsHDJFZ35MwuEeOvs+qyLNr3t4HZcsGm6Pa70LVrkD8+aMs2dD5CR
         ROEQ5cJpjgYc+aL09L4/K/FD8H7xr/7A2K9dk5byp5tqY02Y5czxhiANU4DHQV2bL9Bj
         YwBiIAfu+ucmOvCudXAGa44cTYnYq8Uf+pIUoIr+63A8eRw2p0lqmC6KSjHvUH6tHSJy
         fawyGLJDwerYN4ObkAaJ+uzmOwQirxA/DOYu+7jMAYWoOZ1n73nm1xZ8Uwy8dzuovSAn
         cIuQ==
X-Gm-Message-State: AJIora/jkUkDXekI5TixTH1THo7xpo7j4VZ0d33t494OUiHDIn1jY816
	hBKT5v/0XjJoT4CHVkqb17s5JP3y79uv5gRC
X-Google-Smtp-Source: 
 AGRyM1sjw1Iia+cQ8Ky5DFvVsDDSVPdHegVqlyPh7MmFDcpOqqccG1lBo1ITXTN55MPbslO/yyUkrA==
X-Received: by 2002:a65:6cc8:0:b0:3fe:2b89:cc00 with SMTP id
 g8-20020a656cc8000000b003fe2b89cc00mr19919089pgw.599.1659502082119;
        Tue, 02 Aug 2022 21:48:02 -0700 (PDT)
Received: from MVIN00024 ([103.250.136.182])
        by smtp.gmail.com with ESMTPSA id
 x9-20020a170902a38900b0016d72804664sm619416pla.205.2022.08.02.21.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 21:48:01 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Wed, 03 Aug 2022 10:17:43 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [master][PATCH] qemu: CVE-2022-35414 can perform an uninitialized
 read on the  translate_fail path, leading to an io_readx or io_writex crash
Date: Wed,  3 Aug 2022 10:17:41 +0530
Message-Id: <20220803044741.52364-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Aug 2022 04:48:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98104

Upstream-Status: Backport [https://github.com/qemu/qemu/commit/418ade7849ce7641c0f7333718caf5091a02fd4c]
CVE: CVE-2022-35414
Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2022-35414.patch            | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c9e48f4a5a..0db6701735 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -27,6 +27,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-tests-meson.build-use-relative-path-to-refer-to-file.patch \
            file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
+           file://CVE-2022-35414.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch b/meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch
new file mode 100644
index 0000000000..fe79a749ae
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch
@@ -0,0 +1,53 @@
+From a10c33942dc8cb31b3762b9dd4adde4c490eed9c Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 3 Aug 2022 10:11:11 +0530
+Subject: [PATCH] CVE-2022-35414
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/418ade7849ce7641c0f7333718caf5091a02fd4c]
+CVE: CVE-2022-35414
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ softmmu/physmem.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/softmmu/physmem.c b/softmmu/physmem.c
+index 4e1b27a20..ad8a90dec 100644
+--- a/softmmu/physmem.c
++++ b/softmmu/physmem.c
+@@ -669,7 +669,7 @@ void tcg_iommu_init_notifier_list(CPUState *cpu)
+ 
+ /* Called from RCU critical section */
+ MemoryRegionSection *
+-address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
++address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr orig_addr,
+                                   hwaddr *xlat, hwaddr *plen,
+                                   MemTxAttrs attrs, int *prot)
+ {
+@@ -678,6 +678,7 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
+     IOMMUMemoryRegionClass *imrc;
+     IOMMUTLBEntry iotlb;
+     int iommu_idx;
++    hwaddr addr = orig_addr;
+     AddressSpaceDispatch *d =
+         qatomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
+ 
+@@ -722,6 +723,16 @@ address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
+     return section;
+ 
+ translate_fail:
++    /*
++     * We should be given a page-aligned address -- certainly
++     * tlb_set_page_with_attrs() does so.  The page offset of xlat
++     * is used to index sections[], and PHYS_SECTION_UNASSIGNED = 0.
++     * The page portion of xlat will be logged by memory_region_access_valid()
++     * when this memory access is rejected, so use the original untranslated
++     * physical address.
++     */
++    assert((orig_addr & ~TARGET_PAGE_MASK) == 0);
++    *xlat = orig_addr;
+     return &d->map.sections[PHYS_SECTION_UNASSIGNED];
+ }
+ 
+-- 
+2.25.1
+
-- 
2.25.1


