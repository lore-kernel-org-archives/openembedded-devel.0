Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4578AC433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 09:33:52 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.10224.1632994431239878439
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Sep 2021 02:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PnDMFD7D;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id g8so19902909edt.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Sep 2021 02:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7UFZWsM34JmGdT/cq9IyZrZViwQJCtVpVuQHPqehDaE=;
        b=PnDMFD7D0KZPHYLfnHyAeCQeYhfCJqnBQiDRwVF2R/MHikUwD/yF9YPwMeg0W/PfyP
         oK4QV48tML6AIbcPhBo2aq8dcrU5F96M2S9TSJLyHxTAwKEkujBIgKoorYjJDwNRrenV
         UpzTeGsTrQDCSbNgEYpcrnE7ZPsDhMdO9BOpGNsOfCueJfOuHf2Iy3jF/gd2BFAOYK0G
         qe3shcssLPe2koWLHf+4Io/uRiDlR1wSP2dNbITDRPsHE8g/MGLy8RZPhCrQeIjxi8Ob
         KOO0Cvc3H3hx2oWpcjYIweqanIgvD0ymsHkIzUckFx2JJ+ThtdrGKQTZNxwdCZz9w6lt
         hnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7UFZWsM34JmGdT/cq9IyZrZViwQJCtVpVuQHPqehDaE=;
        b=KkEE5/J5mCK6CPZ3UlIjrF7PD2T3kVGYFouDOO/hrV0pf5nDc98bLr3iTbmlzCjAf/
         XuNwB2EFPDNA4mIPv7r6cMMZMNaGcEhVt2oW84Jl1+c6VyluMvL8267ZEkJahbMpOLDf
         GuWV1yzUw+aD3qDDhFs1JYaJksZ8a4krJXWyovfaT5mxpDL4pf8qLsu8/RPPg5AIycpC
         G8I5TEEY4mzc/CZlURybIGhmcWcQUaNAHGSQPFy9A75TOsUscmDCrPJFxL8CNdgKdzV/
         tUTgoNFpQXPHQrwifn38Nfjp8wGIZWVD5VSpT8TeuArNG1L9DJFKnx+u7VPl8ZsCxaAO
         CvGA==
X-Gm-Message-State: AOAM531d2HTUDTL9FjLri/JmDDdQTyVMBDxoppCrPc7GPzpUSLUECf/w
	XXMueYpYkH2ffXzCZt5OLerkdm9fQM8=
X-Google-Smtp-Source: 
 ABdhPJwwORBApnM/8xxaOlJFQR9QJaJBVHrlZmLLSjtIf6v7M7xDBnYqCx14YQRa4jUSNf2U7pxqYA==
X-Received: by 2002:a50:cfc3:: with SMTP id i3mr5816981edk.36.1632994429259;
        Thu, 30 Sep 2021 02:33:49 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e9sm1128759ejh.0.2021.09.30.02.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 02:33:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] README: mention linux-libc-dev:i386 for luajit on
 ubuntu-21.10
Date: Thu, 30 Sep 2021 11:33:46 +0200
Message-Id: <20210930093346.740721-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Sep 2021 09:33:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93180

* for host* parts you need to install linux-libc-dev:i386 on ubuntu-21.10
  (not pulled by gcc-multilib already mentioned in meta-oe/README), otherwise
  build for 32bit target will fail like this:

  cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/luajit/2.1.0~beta3-210112-r0/git/src$ gcc  -m32   -Wall   -I. -DLUAJIT_TARGET=LUAJIT_ARCH_arm -DLJ_ARCH_HASFPU=1 -DLJ_ABI_SOFTFP=0 -isystem/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/luajit/2.1.0~beta3-210112-r0/recipe-sysroot-native/usr/include -O2 -pipe -c -o host/minilua.o host/minilua.c
  In file included from /usr/include/bits/errno.h:26,
                   from /usr/include/errno.h:28,
                   from host/minilua.c:40:
  /usr/include/linux/errno.h:1:10: fatal error: asm/errno.h: No such file or directory
      1 | #include <asm/errno.h>
        |          ^~~~~~~~~~~~~
  compilation terminated.

  while for 64bit taget it would build without -m32 and work fine without linux-libc-dev:i386:

  cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/luajit/2.1.0~beta3-210112-r0/git/src$ gcc    -Wall   -I. -DLUAJIT_TARGET=LUAJIT_ARCH_arm -DLJ_ARCH_HASFPU=1 -DLJ_ABI_SOFTFP=0 -isystem/OE/build/oe-core/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-oe-linux-gnueabi/luajit/2.1.0~beta3-210112-r0/recipe-sysroot-native/usr/include -O2 -pipe -c -o host/minilua.o host/minilua.c
  <OK>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/README b/meta-oe/README
index 98f671d7c2..a0a28189c6 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -15,7 +15,7 @@ e.g. on archlinux based distributions install prerequisites like below
 pacman -S lib32-gcc-libs lib32-glibc
 
 Ubuntu
-sudo apt-get install gcc-multilib
+sudo apt-get install gcc-multilib linux-libc-dev:i386
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
 
-- 
2.32.0


