Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB2FC64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:53:27 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.28769.1677862401017376036
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:53:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D4mt3ShI;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id y11so3330659plg.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 08:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677862400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r8gJm5T2DmHY1GQ3ONcscAu8w2pgvb/icawSx2lWjx4=;
        b=D4mt3ShIESnC3ZWcaN3CCZQ+WvJZeSHzGDTLFP+tMj5KvdYqosc/Kz03rRZy5XYAmk
         PKtNFLtqsq8ckXQWv1dKfto4FieeC4Rwd1i1n8a8S/ljfO5mopaROi0uhiKDf32sYqNf
         XwY3zQC54UpVK4o0xWxBzVri2j1dkFE8PxheHnONT8vuKX1pNL0qCG2RFO+d7cQKLmAQ
         zQlCSPFYnAi/cJlafNHHEjj2Hi+PFlnSrjIOQ4a8+8fG5ltSLkjErGFfH17qA0tt5Okz
         hb8wz+1VhY8Xb3tl+cb3cqaG74b3Tmbv6eHONnLR5V+485Q4Cy+9aoE6Qo65jHGbeZxr
         403g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677862400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8gJm5T2DmHY1GQ3ONcscAu8w2pgvb/icawSx2lWjx4=;
        b=aMbVeq7BrvvxU0QpATMqpr3EgS3SZ0PJrHz8equGR+qaq+lENYR66jTPsK6XrR0h/e
         HzrHeYEeq4nTS4dIe+iXhEa4j8SkTP6hjuzn0Hi29qRHNjRazFWa2hQk1y1+E0eTx3l+
         cU2xINRm1wEh3QIc+q3UaLegi/2Ri6/otSlX3Qex5Q4DXpsKhxgWtlhSU6JzMGYoeBKx
         Pu/BpyPCRj7xc2Aw0eLwlCZRjlm17Osc/DQWqPW6/JyIeQV/K1JflGG+qthG86Tz7JXC
         znnfz1nmWdTXCYP+sUkiBeENuIOdnArkCbujdq80V7J5sOJlUJbiu+FfWng13VnOJ8G1
         //8g==
X-Gm-Message-State: AO0yUKVPcl+NZnFKoCQGTEvZFKTgAUKZ3mb8obc1IMM+3T/gsl0n8HXI
	iur+ODgW37iarKCLBEUgyDvBYPO+P7g=
X-Google-Smtp-Source: AK7set/xF0yaZ1FkHzGJSm6LHDmT5N3FrtBckfHpFT+IM7C8yhW+JTQVsmVfT+CNidKVRz1QoPMToA==
X-Received: by 2002:a05:6a20:5487:b0:c6:d37c:2a62 with SMTP id i7-20020a056a20548700b000c6d37c2a62mr3368128pzk.11.1677862400062;
        Fri, 03 Mar 2023 08:53:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id u1-20020aa78381000000b005cd81a74821sm1838759pfm.152.2023.03.03.08.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:53:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] glog: Disable 64bit atomics on rv32
Date: Fri,  3 Mar 2023 08:53:17 -0800
Message-Id: <20230303165317.3428479-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 16:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101351

Fixes
riscv32-yoe-linux-ld: CMakeFiles/logging_unittest.dir/src/logging_unittest.cc.o: in function `no symbol':
/usr/include/c++/v1/vector:835: undefined reference to `__atomic_load_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/glog/glog_0.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/glog/glog_0.6.0.bb b/meta-oe/recipes-support/glog/glog_0.6.0.bb
index 89b7cfd184..5d12ba6931 100644
--- a/meta-oe/recipes-support/glog/glog_0.6.0.bb
+++ b/meta-oe/recipes-support/glog/glog_0.6.0.bb
@@ -20,7 +20,7 @@ inherit cmake
 
 PACKAGECONFIG ?= "shared unwind 64bit-atomics"
 PACKAGECONFIG:remove:riscv64 = "unwind"
-PACKAGECONFIG:remove:riscv32 = "unwind"
+PACKAGECONFIG:remove:riscv32 = "unwind 64bit-atomics"
 PACKAGECONFIG:remove:mipsarch = "64bit-atomics"
 
 PACKAGECONFIG:append:libc-musl:riscv64 = " execinfo"
-- 
2.39.2


