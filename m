Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D9EC28B2B
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 06:40:58 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.231.1660891257617305863
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Aug 2022 23:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TAtkcRJE;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d16so3361298pll.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Aug 2022 23:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=viLM6ukTqpTpsdvUx7WRalU7tkEULYXkSdXoG8yHAbQ=;
        b=TAtkcRJEP3LJMIgUGHo09kIuZGf30Npz4HoOj4Z8ZIWt57G1eYbCJAXRjGdr9Dfdpf
         Aq2Ntq0WssRZzu3mG1vnv7vtoom/uG36T+jyZKfl/5PheryJ9OC/PosgyIzqtjPDU8u7
         fLfE6KD7U0Vwr7fN33OeRSWfj86J05Hmbm2kd/iIy5VYuTYJ7S4zarFPJyVrU3pqFKLj
         pINpXeREN//5HwLaC1k9wS7olzVg3TNTUEqqGR+o7IyJReEWkkmgq0oYmQrg9CdIakDh
         Gb1lqgHT1vTtaA1cogfBCuJped+PqfkJF2JPABmHyYfTu+nXXf0M8NDIpvec5S16blAh
         tD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=viLM6ukTqpTpsdvUx7WRalU7tkEULYXkSdXoG8yHAbQ=;
        b=VDk+Is8nxu95WCLDMISNeO04zgOoVH9PRVG9Iwl+9TE9TzvLREV9pOpeP3gie1BmYy
         SiRcKthr7KF/4/ZmVz3K7lJPk/klS2CP7HmX3x91Fx9c0bKkGtpFYdcK5YQAlgFTz+q2
         tSFpAmzyYJbCtl2jX/bgs04UyF6DX3agafN4HpODTWA5EGgRm+AxIMhjoYXNV8EOHRcf
         /M/JQwf1vQ6Ygnz13fiZhRBK+NWJ/89pnFWk3dewYZl4tlsFbL41it22dtInMMJeALr2
         DEOQ9VT2/AHUdv90cD7khoWykLDG0XdbhM++nHU60+mYFMyma3K/PsKua6+6ZnJBpPvl
         ks+w==
X-Gm-Message-State: ACgBeo0NXV9/tubtY4NtUnY5wtwYVOvfpct2yiPnADf3CjXU7oPG8X+O
	VzLLzg0NuB+6+lCMdygLGcUcqkk2JAkxUA==
X-Google-Smtp-Source: 
 AA6agR5EQp6IOHea+OuNDUJgpfKZIJXMQRu+Kw8dPtSPcwvkbGKIkfSt0kO7rUW4YGTYoQ78J7/cuw==
X-Received: by 2002:a17:90a:8911:b0:1fa:c8f7:1450 with SMTP id
 u17-20020a17090a891100b001fac8f71450mr6868809pjn.123.1660891256582;
        Thu, 18 Aug 2022 23:40:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d53f])
        by smtp.gmail.com with ESMTPSA id
 j125-20020a625583000000b00535fd3290f0sm1111857pfb.113.2022.08.18.23.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 23:40:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] fluentbit: Use CMAKE_C_STANDARD_LIBRARIES cmake
 var to pass libatomic
Date: Thu, 18 Aug 2022 23:40:53 -0700
Message-Id: <20220819064054.1471627-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Aug 2022 06:40:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98322

Since libatomic needs to be linked last in the list of libs, take
advantange of using CMAKE_C_STANDARD_LIBRARIES insread of FLB_DEPS
since DFLB_DEPS is not appended last to linker flags in CMakefiles
it ends up with undefined references for libatomic symbols in libs
appearing after FLB_LIBS in sequence

Use it for mips too

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb
index ea6f81cbf0..a801694f42 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb
@@ -75,8 +75,9 @@ EXTRA_OECMAKE += "-DFLB_RELEASE=On"
 # musl needs these options
 EXTRA_OECMAKE:append:libc-musl = ' -DFLB_JEMALLOC_OPTIONS="--with-jemalloc-prefix=je_ --with-lg-quantum=3" -DFLB_CORO_STACK_SIZE=24576'
 
-EXTRA_OECMAKE:append:riscv64 = " -DFLB_DEPS='atomic'"
-EXTRA_OECMAKE:append:riscv32 = " -DFLB_DEPS='atomic'"
+EXTRA_OECMAKE:append:riscv64 = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
+EXTRA_OECMAKE:append:riscv32 = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
+EXTRA_OECMAKE:append:mips = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
 
 inherit cmake systemd pkgconfig
 
-- 
2.37.2


