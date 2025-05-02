Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D33C3ABA3
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 03:55:16 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.11886.1746158112590648936
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 May 2025 20:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ecSd4GTR;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-227cf12df27so15651325ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 May 2025 20:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746158112; x=1746762912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8/N4u41SZy4dJIcghYmzBarJW5ucS1nizijbT/t7B0Q=;
        b=ecSd4GTRLf5Iyc8dGvRpv7ZwX/PaGUlfG4Fg+xdwQPVAdTVucYbiA5neN7KGQhNeHF
         ESJEOR0VdYKlU5gV71qo+q+Z1iJ17w1HEhegxoDML9SntCjtLdRyF1NyMV2z+SUiiq3G
         gCD4hUV+SDH5HZ0qA23uckug00MY85fTPVpv7fujcZu30vWSmH5+/71h7xwcUsaCsRWM
         3Wl7UqumGqMYdNFqhCWYBHrjb/F5PxG3FlHhRsV6m7iNVxhX4x9mNPrYYXAMxPU+BCiz
         rmxOYfrrL4Xyl1pR/lRRwe5mLA4G2mII2xY6i7jGs+lvMW1SrNKItwouM4rlxaBQQAI6
         o8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746158112; x=1746762912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/N4u41SZy4dJIcghYmzBarJW5ucS1nizijbT/t7B0Q=;
        b=w5tftVgTZiui0356q945JWEzKGBbH+bsmCNNr5orE9YSdTgXR48jl0hDW2Ly9wZVib
         uy60o4TXK9e9b+ZWAYzOczNvEk0bGcDuY+9p+y+M8NrV5Mvk+zH6m2qfkOmnUmMXX6b6
         qo3H7inPctb49SCxTxVQGCKAKQvc6mPj8pqv1L2/IPnYvjrW0uxshGbVtpqAR/kDBbAy
         2R2M7JkhA+dZ9VYlUcP1K5fqPmw98FNcq+BNEdDMdn1ydHEtIOHrvItchGiNTd7iGO+h
         6nI+RzYXghF9BcAAjXfqjriRvSwSmMq8RwVFSG19x4eaB+rQLM/nO4ZJDkithuhJZF3/
         PgvA==
X-Gm-Message-State: AOJu0YxgjRPVfUWfcCkd+IPmhjASeXUmpaSGZoFlmEGwwrzL+dXeCpbG
	tZOMwD93sh3lnW6nk8gejJrAcqpab2cLBA48Dj8ur38XJ+LWRbn7o+LoDDm3
X-Gm-Gg: ASbGncsJITKgF1n+pNLgZx1XzUjj0pIB16WEVZC8Pcs/hXum2Dkje2l/A9hvxeJyu9b
	Of4bh5hLet+XuCL+I8UMGb679OwF8Omj5j2ippxzPP9dIVDZc6HWkG3qDj2ianQQCCm2blDEZkQ
	pWQdNf7/2hHLBvAXRZYiu8tOpatIlS6AR7CSIsaozGcmMQkjVt9KH53AXIoghaVg+wpQ8LqRMp9
	LY3hz/RdGdpc2ZPfzcmk/Lnl2gy5xCb8YvnQvf57kNR7BCA9m1HUauaWyDCL0078wH7j/z3S/qu
	JcnbH1uodNVUdGg5zy6JOvB8bitrqIRt
X-Google-Smtp-Source: AGHT+IGviZRs6sGm/zWEVsxAdechl9LV/7Uk1x4FguLetcOAUyaTGC0TsnfTU15Tc8s2vYJ9YN6FxA==
X-Received: by 2002:a17:902:d4c3:b0:224:3994:8a8c with SMTP id d9443c01a7336-22e0842956cmr70889605ad.8.1746158111607;
        Thu, 01 May 2025 20:55:11 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::fb82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34829e51sm4514563a91.49.2025.05.01.20.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 20:55:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] vboxguestdrivers: Fix build with C23/GCC15
Date: Thu,  1 May 2025 20:55:08 -0700
Message-ID: <20250502035508.3097649-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 May 2025 03:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117276

bool is a keyword in C23 onwards

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...x-bool-reserved-word-error-in-gcc-15.patch | 28 +++++++++++++++++++
 .../vboxguestdrivers_7.1.8.bb                 |  5 ++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-fix-bool-reserved-word-error-in-gcc-15.patch

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-fix-bool-reserved-word-error-in-gcc-15.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-fix-bool-reserved-word-error-in-gcc-15.patch
new file mode 100644
index 0000000000..ec75d5a423
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-fix-bool-reserved-word-error-in-gcc-15.patch
@@ -0,0 +1,28 @@
+From 76c443dfd209ddbed3ed4102596a568670d4c59f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 May 2025 20:16:11 -0700
+Subject: [PATCH] fix bool reserved word error in gcc 15
+
+gcc-15 switched to -std=c23 by default. https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+Upstream-Status: Submitted [https://www.virtualbox.org/pipermail/vbox-dev/2025-May/010316.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ vboxsf/include/iprt/types.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/vboxsf/include/iprt/types.h b/vboxsf/include/iprt/types.h
+index 3bcc4146..33b46ef6 100644
+--- a/vboxsf/include/iprt/types.h
++++ b/vboxsf/include/iprt/types.h
+@@ -282,7 +282,9 @@ typedef _Bool bool;
+ #   endif
+ #  else
+ #   undef bool /* see above netbsd explanation */
+-typedef _Bool bool;
++#   if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
++     typedef _Bool bool;
++#   endif
+ #  endif
+ # else
+ #  if RT_MSC_PREREQ(RT_MSC_VER_VC120)
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.8.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.8.bb
index 1560c8094f..c894a61617 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.8.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.8.bb
@@ -13,13 +13,14 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
+    file://0001-fix-bool-reserved-word-error-in-gcc-15.patch \
 "
 
 SRC_URI[sha256sum] = "3f7132c55ac6c5f50585bfaa115d29e30b47ccf535cb0a12ff50214ddae2f63d"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"
-S:task-patch = "${WORKDIR}/${VBOX_NAME}"
+S:task-patch = "${WORKDIR}/${BP}"
 
 export VBOX_KBUILD_TARGET_ARCH = "${ARCH}"
 export VBOX_KBUILD_TARGET_ARCH:x86-64 = "amd64"
@@ -29,7 +30,7 @@ EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_VERBOSE=1
 # otherwise 5.2.22 builds just vboxguest
 MAKE_TARGETS = "all"
 
-addtask export_sources after do_patch before do_configure
+addtask export_sources before do_patch after do_unpack
 do_export_sources[depends] += "virtual/kernel:do_shared_workdir"
 
 do_export_sources() {

