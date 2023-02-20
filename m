Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE8EC64ED9
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:24:41 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.17426.1676910274259805162
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iZPiZKY/;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id s26so6761428edw.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 08:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5rPaCIt2tjbMCWABAZfhgyitpfuSjF4HWRUaFBP1UIQ=;
        b=iZPiZKY/11dF0ctks8jsy/Xfpln9dMWuOjIR++qXBGgCqJ3hN9RxqTnJ0gsNlMTUfv
         b0VNrS2jDj7scaJ5v2kHf0N0CJkESfBMgBpj9L0CjjcNf4RVkQ6awN/I8WrHorK7xmkM
         /l3VhRDFH8UOdCxO9K2+s1zPuAWfPkYN/5pwPc0G3/2Sm9DnYp9vajR/7vFdU3PBFM7+
         orf/pNDgWsCPpJYVbxEw++65xpAd+E9c8QR97RDuR39y7MkmRM5K6D94IFyjvmQ53mXh
         xT8SmczmklP08j3iuNDxRiXBJe1IIEfFagsK1uQ/hNEjIl2wv/dsdbTjgxt4tgtsMNJy
         V8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rPaCIt2tjbMCWABAZfhgyitpfuSjF4HWRUaFBP1UIQ=;
        b=wNc0JJsyR9F/V3YPc/0S6Q4tYl2WnCuTp1Tpf4/jl3ZZg2Pgj9FfR/600WBMRndtgL
         U231k8FH0lfZpMD6AeddHY3R4P4BNImfl62eMD93kgHO+nA9QkEgPOM1D/2oAL5vkwzS
         DTcp5gY0nJ8QeiPjnczPoG4j3M0gqKmoe6qarUQ4Euv9mQJM/VaGxuXUEgkJxdU/EJtZ
         muPpa43Mb/PVpbbV2rvU83ogIdtsRG2LEelNY23ha//Yt3itAyNqsh1QyrEwKDsll4m4
         yEl+HQVK8qfIwXyAvWtJ7pYof1uMa08wqpnVV7drOCdYgxun6LAThM3SL7W4MJ4GG/Qy
         XDXg==
X-Gm-Message-State: AO0yUKVrbrjj5OCrTF1Km+awsXlHcvJ67KP/18Gmi7RuDgOeOqlWWjS9
	yOkMCYy5ONdJYnTsU445Nw2cmZkeDLA=
X-Google-Smtp-Source: AK7set+6UFPFdgvLpsacs8AZAV4OHrGhOTo7EI6ax7i/oukuq9OkJz9bGZjLd1FnKQ2Rr4TLr5WWjw==
X-Received: by 2002:a05:6402:b04:b0:4ae:f496:10ac with SMTP id bm4-20020a0564020b0400b004aef49610acmr1767110edb.0.1676910272351;
        Mon, 20 Feb 2023 08:24:32 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u13-20020aa7d88d000000b004ab4c28a967sm765024edq.44.2023.02.20.08.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 08:24:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH][kirkstone 1/3] nss: fix cross-compilation error
Date: Mon, 20 Feb 2023 17:24:28 +0100
Message-Id: <20230220162430.30368-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 16:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101177

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Change OS_TEST to be soft assignment so that the cross-compilation
doens't fail with the errors like (note the difference in CPU tags):

| make[4]: *** No rule to make target
'../certhigh/Linux3.4_x86_64_glibc_PTH_64_OPT.OBJ/certhtml.o', needed by
'Linux3.4_aarch64_glibc_PTH_64_OPT.OBJ/libnss3.so'.  Stop.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nss/nss/0001-nss-fix-support-cross-compiling.patch     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
index eb6174a7b0..950fae667a 100644
--- a/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
+++ b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
@@ -18,7 +18,12 @@ diff --git a/nss/coreconf/arch.mk b/nss/coreconf/arch.mk
 index 2012d18..78fca62 100644
 --- a/nss/coreconf/arch.mk
 +++ b/nss/coreconf/arch.mk
-@@ -30,7 +30,7 @@ OS_TEST := $(shell uname -m)
+@@ -26,11 +26,11 @@ OS_ARCH := $(subst /,_,$(shell uname -s)
+ # Attempt to differentiate between sparc and x86 Solaris
+ #
+ 
+-OS_TEST := $(shell uname -m)
++OS_TEST ?= $(shell uname -m)
  ifeq ($(OS_TEST),i86pc)
      OS_RELEASE := $(shell uname -r)_$(OS_TEST)
  else
-- 
2.39.2


