Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2FCEB64DD
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 06:12:41 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.2516.1689228760521998895
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 23:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jV0vd/ui;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-668730696a4so170462b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 23:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689228760; x=1691820760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9eIxGwV2swH1Q5icxqUUF229kl+GDhD5WZZF6TiHHM=;
        b=jV0vd/uin0mu11lqQdGd9SDweDgfjYVfiYtkaXrdasYeTaUdAJNnahx7kO9atMfd02
         9ZuBUUJ6BFEFPEHecCGqiTyg/hN+vCPokqnQeMUiBsKxZBuenYdZBv4KidXoQ8ydzbeI
         d4Qw8/MjYn2qXRQFOqR6FkfUNNIs/uOst+/0ORxLQPSIz9WuEeYWc2Tr1exLah2B4L9w
         1HvtG60X8uVPO1juMU77ZN0ZhlCJfvfdx+/VqGUEExugRXFfPM+X6RJTeP3DSEsfK8eu
         gASJmmtxzmtxlocIj5yaxltEccBMzIXbHvP0UbjfOkMiz+UygoRh0he7QtPtmJvSxcgE
         07mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689228760; x=1691820760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9eIxGwV2swH1Q5icxqUUF229kl+GDhD5WZZF6TiHHM=;
        b=Lgvgz+wyL3sYEAzMqjY3I351yIF5BvbxDEN4kkRoIlb7rE5RvNSDKZCyZC6MxGDP6f
         /2V+v2oCHFNpuofZgQaSci6Iq3+ZrszilK5x5XpmbC6RrkAC+5eo+OmFRxSj1FoZnFlp
         Q3NWKUUOPUifrn/NtE00LTagNATlp+mj4q1CzdeEO+fz4XYuEkSkENW7rZjDNBxMDpjh
         ewU2dHe3CiZ9meg4rmkhgK16QrCMi8i3Kj9RoSG/FeLK3wZY4ixqyLEW69IAh0Cn4aRE
         09rkqiq6WPB9L23uiWHKy0hA/1A6vSSzoYy2ebuGiNAGA3KXwupLISWXzRVJocIRJLo3
         Ttqg==
X-Gm-Message-State: ABy/qLZlYI64VSM6u2Kl/0LAtCJYXOUOFnqSzt0IStjWQMXDPhJkeU2b
	XhwCG8YemoLfgyya8GqIQ++Lxv2pTvo=
X-Google-Smtp-Source: APBJJlGoSv0+ZRdW9U3kw+39ZOxtIpkYRcRv4D2JTca4h+X316jXYguYtMppcKCVbMWim5/Aqhhnzg==
X-Received: by 2002:a05:6a00:2d90:b0:661:4a00:1ea5 with SMTP id fb16-20020a056a002d9000b006614a001ea5mr446206pfb.20.1689228759628;
        Wed, 12 Jul 2023 23:12:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::5a1b])
        by smtp.gmail.com with ESMTPSA id g13-20020a62e30d000000b00682bec0b680sm4603506pfh.89.2023.07.12.23.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 23:12:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ptest-packagelists-meta-oe: Limit mcelog to x86/x86_64
Date: Wed, 12 Jul 2023 23:12:36 -0700
Message-ID: <20230713061236.1622484-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jul 2023 06:12:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103854

mcelog is only available on x86 and x86_64 architectures.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 0c5f6beaae..77dace08a0 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -26,7 +26,6 @@ PTESTS_FAST_META_OE = "\
     libxmlb \
     libyang \
     lmdb \
-    mcelog \
     minicoredumper \
     neon \
     nodejs \
@@ -38,6 +37,9 @@ PTESTS_FAST_META_OE = "\
     xmlsec1 \
     zeromq \
 "
+PTESTS_FAST_META_OE:append:x86 = " mcelog"
+PTESTS_FAST_META_OE:append:x86-64 = " mcelog"
+
 PTESTS_FAST_META_OE:remove:libc-musl = "minicoredumper"
 PTESTS_FAST_META_OE:remove:riscv64 = "nodejs"
 PTESTS_FAST_META_OE:remove:riscv32 = "nodejs"
-- 
2.41.0


