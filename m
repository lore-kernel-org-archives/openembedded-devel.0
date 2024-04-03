Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAEBCD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 21:25:59 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.23872.1712179557353041565
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Apr 2024 14:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dNh2AbkJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ecbe6dc8c6so238236b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Apr 2024 14:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712179556; x=1712784356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWAOZg0y6zj3/nP+8Yhf2BGu/gG0x8Frg7ldwquwPoU=;
        b=dNh2AbkJ+7IeI1gd2JWw8I4ZmgAFkoDGxIB7RMB8wVs+2CcK8ETg6cGd5iA90rofEF
         lvmSNRUzCKQqqzX7AQ7Iu6twsQbJ4ga1FrnAWmPRB4mVL/qjCAn+xW2iK5sx+lbsbDTc
         +F5EZXXGR0Pc9mEIDE9AgRvOC66Wk9fjbR23gm5bhXLoNP5Sng7XP6HkGSxZe6v6bSB3
         5Ibl4OCqxrM8BrYs9NOnYDPzy7kZk7chJNSAxzS/J3CFRjpMH7TuoIl9mT/w9ihVRqT7
         j0IlIAbvFovvzK83wSglyNZKi4x+71w5BOukEbzmwzrOtgp8Qb5mYrQ3n5wGCSKwnUej
         7a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712179556; x=1712784356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWAOZg0y6zj3/nP+8Yhf2BGu/gG0x8Frg7ldwquwPoU=;
        b=qfF7LPGZpUfza5WM1CW5WbstKg2rgzGKRtHb5wcNE6dvetl+gpC61K+cMGKa/v5ln+
         BjKDlkIGMy6dsHIJmqmWvj3z/VDjmWiaGsB3jwIiPUKQNLyE3LGLNWJ4n9y0J0yYjQ8W
         n3A+BvPMjC8ohG8mLNikCtB6W+6riKn/486b1AWiIqtA56boNjuN+lmaWZTCiIfmMUvI
         7v0xt6P3vyfWZ46Fi8r+bb1H4dkD18d/qF4fzoIKubq9LiA713bZiw2RWlv0u1yNuAr3
         CeXdpI9+SM7JNtqW6cZzvP39Po8HPYkOUP1lDe/3X6CPSARzOIlSzG2iHXj0EXX7RTi2
         IJsA==
X-Gm-Message-State: AOJu0YyHVBgE0ifZkIM1I4pEmpNAJ6ZZ23sAnf32fA7RSyk2yLxvE0K+
	FHw83/+apR+UOUSWZZ72aI0DuByUoZ1xiREaqwTYc5rWr7H0Iy4vAJs7CLln
X-Google-Smtp-Source: AGHT+IH0RB4Mnfv6W0/ZXT9Jby7pFGVCdrXaXiQ4HKRO7vCsApBSxpLwQGX3J2f6Rq/SMBHXRIiXVw==
X-Received: by 2002:a17:903:120a:b0:1e0:8b0d:fb89 with SMTP id l10-20020a170903120a00b001e08b0dfb89mr517172plh.9.1712179556465;
        Wed, 03 Apr 2024 14:25:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::dfbb])
        by smtp.gmail.com with ESMTPSA id p2-20020a1709027ec200b001e0af9928casm14074563plb.55.2024.04.03.14.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 14:25:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] highway,libjxl: Remove -mfp16-format=ieee when using clang compiler
Date: Wed,  3 Apr 2024 14:25:53 -0700
Message-ID: <20240403212553.3543144-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403212553.3543144-1-raj.khem@gmail.com>
References: <20240403212553.3543144-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Apr 2024 21:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109794

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/highway/highway_1.1.0.bb  | 2 ++
 meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/highway/highway_1.1.0.bb b/meta-oe/recipes-extended/highway/highway_1.1.0.bb
index ec9d8f742d..11d9e7cddf 100644
--- a/meta-oe/recipes-extended/highway/highway_1.1.0.bb
+++ b/meta-oe/recipes-extended/highway/highway_1.1.0.bb
@@ -13,3 +13,5 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = "-DBUILD_TESTING=0 -DCMAKE_BUILD_TYPE=Release"
 CXXFLAGS:append:arm = " -mfp16-format=ieee"
+# Option not supported with clang and its default format for __fp16 anyway with clang
+CXXFLAGS:remove:toolchain-clang = "-mfp16-format=ieee"
diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
index 0c4f79fdb4..142b283614 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.10.2.bb
@@ -39,4 +39,5 @@ PACKAGECONFIG[mime] = "-DJPEGXL_ENABLE_PLUGIN_MIME=ON,-DJPEGXL_ENABLE_PLUGIN_MIM
 FILES:${PN} += "${libdir}/gdk-pixbuf-2.0 ${datadir}"
 
 CXXFLAGS:append:arm = " -mfp16-format=ieee"
-
+# Option not supported with clang and its default format for __fp16 anyway with clang
+CXXFLAGS:remove:toolchain-clang = "-mfp16-format=ieee"
-- 
2.44.0


