Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F81CCA46F
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:19 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.20999.1759223957585715592
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a07LBQSu;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-42480cb42e9so26707305ab.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223956; x=1759828756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sc6Bzn8MQZ8l9uFAcFLsYcnIDxwiw1dBYH5c8ixFbXM=;
        b=a07LBQSu3htE8uPyw0ts0TEYHlurZApHm6OOnLTSLj/Hjs/vSbIsJzLTGMg1rPdGqd
         vaRK1wsAKJZegkZUSmoe1GsMX1IFdkwjMxRGHtIMP1XFupM99uiKQO95x/LL/vWhxCXQ
         RNV8kNwz0Uki2nmqBv9qYV52ZgMzQDUsMJIfickk/0RZCDSOnpYE2n7gEC7OhchVmUke
         9hw19Szb7KZwl6pvysctHbs2IrDxJxLGrNHorJw7hZyXCXKSwdcW5D6hNpNSfJuthT13
         v7Jml/z0E36bUvV+n5Nwt6bzoLlnyIIEcJTPeeyZOd0G2hhbYnEOo64CoDl1Q2LrVTvE
         rNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223956; x=1759828756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sc6Bzn8MQZ8l9uFAcFLsYcnIDxwiw1dBYH5c8ixFbXM=;
        b=cXxp/vglsLNyGRL0fcx9JScUhHzMvngZSedMBq8p8ZuFrrf7ivkKEjf3LFVenTCBLM
         sovHdA8vTq8EBmNeZZGnAP7SWM+GTeF4ug/Owx2DmhayqRj3KsD61WxJEdLymDx+0UIu
         PC84bHAYXZQHXFGZdpqRTdxbiayyuFXPUbQxP0gmRlvEvb1Whlh0Lh+p5kfidJGnyzIJ
         2xl3mUHpWzPvRxZctYwD+8+reLQPdkWO864EwEKA5tlJYI9hU5EO8MCQ4yAFORVm8gJ1
         yXFw5v3CI6VSxygGJ5Rdf8Uj7BtlFyv87ux2i/AMsHP10yS1+TpTkoyI/KDCy93DDUiS
         Mcew==
X-Gm-Message-State: AOJu0YyBE1FM9TkO951KpQDF9N8GjhZuZW/z2sQ+o75VxKR3ASNIel+X
	u5gHzcAFbXcv2K/wS/SSzNuj+GVLIXoY90JAb06/gsZ730zvee7y9/7MxoUEc/5u
X-Gm-Gg: ASbGnctfyfjWoS70Exycgs5JdokW/0sMYOgnE6sQb059viK3k63iv/NkP6JRDrz1RiV
	KyebwvIo8QSNQdiLhQvhAMt5r59TUV01t72mds7wlrB2+y8/CgUR25aTnoF3tnPMngLkYiSJRry
	l1/UPiTMpzxQBDlMtFEnS67nS/O4qYtj6hAVVzPOygxAA/TzubkAYJ8xE/61DoYDobVHKAnTA+N
	PVfhatdTF/caiEzY6ufFMAvivivLyHFwZgPn5iHEDOn/OnPp+gI5mWOPHqtEwDk63ViFZDMJbKW
	VWZHzLQ6dRn+QfR8I8MXjL2sNjD80CRj88bXvFKH3Y7Jpq0/C8/Ac7n35T2VLbI9zhZuYA7FxFT
	8PFC9emixOhy0Uuz3BsE4gQxlnZlNCkYqSb9Gr9ihhLg35P6Weld72D6f4iGsNvDALnRxamJVZo
	myGTh7uYVg/w==
X-Google-Smtp-Source: AGHT+IGNxgp7VO/f5DKKPSSotU8pcHxMI3F3zjjS2c9c6cHr1Gs/60D8CLqrP0Bux0t64tvmuHUbbA==
X-Received: by 2002:a05:6e02:164a:b0:429:6c5a:61f3 with SMTP id e9e14a558f8ab-4296c5a6457mr138263555ab.8.1759223956594;
        Tue, 30 Sep 2025 02:19:16 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:16 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: jacobpanov <jacobpanov@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 11/22] kernel-selftest: Fix PTP selftest compilation for kernel 6.7+
Date: Tue, 30 Sep 2025 22:18:30 +1300
Message-ID: <20250930091841.1693131-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120063

From: jacobpanov <jacobpanov@gmail.com>

The PTP selftest fails to compile with kernel versions 6.7+ due to
missing header definitions for PTP_MASK_CLEAR_ALL and PTP_MASK_EN_SINGLE.
These definitions were introduced in kernel v6.7 with commit c5a445b.

This fix adds kernel headers to CFLAGS during compilation to ensure
the required definitions are available.

Error before fix:
testptp.c:613:31: error: 'PTP_MASK_CLEAR_ALL' undeclared
testptp.c:615:38: error: 'PTP_MASK_EN_SINGLE' undeclared

Fixes: #878
Signed-off-by: Jacob Panov <jacobpanov@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f30afbe04c2e09b002e820dc0f0537ab292940b4)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 606df285ef..fed3fa81ad 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -97,6 +97,12 @@ either install it and add it to HOSTTOOLS, or add clang-native from meta-clang t
     sed -i -e '/mrecord-mcount/d' ${S}/Makefile
     sed -i -e '/Wno-alloc-size-larger-than/d' ${S}/Makefile
     sed -i -e '/Wno-alloc-size-larger-than/d' ${S}/scripts/Makefile.*
+    
+    # Add kernel headers to CFLAGS to fix PTP selftest compilation
+    # Required for PTP_MASK_CLEAR_ALL and PTP_MASK_EN_SINGLE definitions
+    # introduced in kernel v6.7 (commit c5a445b)
+    export CFLAGS="${CFLAGS} -I${STAGING_KERNEL_BUILDDIR}/usr/include"
+    
     oe_runmake -C ${S}/tools/testing/selftests TARGETS="${TEST_LIST}"
 }
 

