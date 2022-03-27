Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F3FC433FE
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 01:14:42 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.1463.1648343677291542963
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 18:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QuES964K;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id bx5so10872799pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 18:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d+p08e+OW3SHKSiLxjGN5quoQQbLh2mWQfcOH2lzVtQ=;
        b=QuES964KPy8widhA0t1c2KB0TkErzEwD49mCjxUryd/Vms8PxRL0E5xqTIgFvE6IOG
         XeRuyL4mPJhRl//z0hVq70bu2ZkNZFvuX0dNBmd7u3Rp71iX1Sw5F2EzvVOn2ogbrn7N
         ab4ZSOMR0O2pI54jo0F84ooPa5yAaYYJIYwCGfEcnq/we1ysVxKf+QosKSOXRD2+vJcK
         OOeSpKevv5GgjPf0Gd+0qvURl6d7J0OY0s2SiM4mBu6CNMQ3jviPJzJhV3siBotU8GW0
         p8W2/Os+FieOCLk++Td7qDF6JNuiXRurLfSIS3Wl2w5DfjEElETo/CSJdm2OQtNWTBDB
         HM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d+p08e+OW3SHKSiLxjGN5quoQQbLh2mWQfcOH2lzVtQ=;
        b=ZD357xncLaYfNs41WDzwIcM1BdCGdvKFH7lWL6MG98nx5/ocv0UyOiLVRCNGZ3F7JM
         r9isxxqeJS31W6K1RGUsw2GSsA8Q93tpMSLcslhopnbzHyBwo5x9zGehZxm4HrYNk58c
         yp5JxxrFIreLMWEmzR+2BffTaKq+PdxvAy9A0t63RSiROtuwpo1iqwjJMXK6CL3v/Wbm
         4dDKqfw6Hdt1myOx/IAoYPQ18xf5A/m+0Ss8ATbZ/5vLcKMXfIvDBw7tOXdB0Zdybykh
         +N+vG/R0nB2hsLUdVyDgOM//MnpUJ1w2wnXUsvtRcW1ENXBl6v6poWqRaV3xukabIgVe
         idRA==
X-Gm-Message-State: AOAM530VtBHCVtGwYyNub3Uerl3tgOc7bspS+823cMLjh4LA0u5rl8CA
	2AvW2N22Gsi9ZBt/FuWEN2tWH5AUuuM=
X-Google-Smtp-Source: 
 ABdhPJzVLxxE6q8BbxyRD1Xj8jqx+Lk9CZHJxxBDHH1Fvj0XQcmbmoiIs6PmbbCVR4AvnKZo4VkTpQ==
X-Received: by 2002:a17:903:2288:b0:154:50ba:2e31 with SMTP id
 b8-20020a170903228800b0015450ba2e31mr19169812plh.132.1648343676588;
        Sat, 26 Mar 2022 18:14:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 b1-20020a17090aa58100b001bcb7bad374sm16525147pjq.17.2022.03.26.18.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 18:14:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/6] gsl: Disable on musl/ppc
Date: Sat, 26 Mar 2022 18:14:28 -0700
Message-Id: <20220327011432.555592-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220327011432.555592-1-raj.khem@gmail.com>
References: <20220327011432.555592-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Mar 2022 01:14:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96217

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 meta-oe/recipes-support/gsl/gsl.inc                        | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 6e001ce1f3..08d9e91704 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -951,6 +951,7 @@ RDEPENDS:packagegroup-meta-oe-support:remove:riscv32 = "gperftools uim"
 RDEPENDS:packagegroup-meta-oe-support:remove:powerpc = "ssiapi tbb"
 RDEPENDS:packagegroup-meta-oe-support:remove:powerpc64le = "ssiapi"
 RDEPENDS:packagegroup-meta-oe-support:remove:libc-musl = "pcp"
+RDEPENDS:packagegroup-meta-oe-support:remove:libc-musl:powerpc = "gsl"
 
 RDEPENDS:packagegroup-meta-oe-test ="\
     bats \
diff --git a/meta-oe/recipes-support/gsl/gsl.inc b/meta-oe/recipes-support/gsl/gsl.inc
index 0dd197efa4..d0fa9344eb 100644
--- a/meta-oe/recipes-support/gsl/gsl.inc
+++ b/meta-oe/recipes-support/gsl/gsl.inc
@@ -7,3 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 inherit autotools pkgconfig binconfig
 
 LEAD_SONAME = "libgsl.so"
+
+# Uses fpu_control.h which is glibc only header see ieee-utils/fp-gnuppc.c
+COMPATIBLE_HOST:libc-musl:powerpc = "null"
-- 
2.35.1


