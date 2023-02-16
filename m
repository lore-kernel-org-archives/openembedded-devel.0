Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2EB9C636D6
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:28:09 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.8627.1676550481338422081
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ff0tb3L5;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id n9so1102469qvs.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 04:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rm5jOkQnHPPmANCfDPek4ssdBvlB5wl7rRGoVVB5QZI=;
        b=Ff0tb3L5vXMVcjkCD8ZEtklE1pMZAWec7ZcjHoB0HIrXLvwcH4a4z9Cfsxtdl+I2hh
         toG/zQqve4glRTLfF85Ry2TWHsepwjcQ0tDXPY9BjrjOKOW6/2ZQZkrCPcWzEzSFqy2n
         zbUsjHiqkehsFDB8IKuW732GR3CEfbRWfWN7nS0Tgh3khBgfG/rlhOuWMk+WOQY/dGB3
         rZU16m2godGVtQuHUD0yWe5QRfouKDlzK0/z5GQbrJVx4sUmLjTTG2YQm39DmCLMB9zK
         4v06le4cw1XCnIToobx90jH22o+NvS/q5t6aDn7wgPscjQZhG1jaxMg04RF4PcSlRaUo
         lcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rm5jOkQnHPPmANCfDPek4ssdBvlB5wl7rRGoVVB5QZI=;
        b=RckcHAk3QFEeug7Xp5rUPBp7cCZQC6FvDWSbTVWCFVcvdDueSyM4nDEfUER8W5DEoG
         MYjoEGtzumJBTJ4WglxsUaU8KMCubDrpO97qZ7FeXgGp2+b2n0/4rCwcRSk7sDsg/2BX
         SX2nofWAuon6pbi0vQbTr3bVLzl7cJauSMyR7SgmWVEsCkAYbgft531XTEWD7+lgge8x
         LKC8jeUvA//y7ukbjsk0BcAUhgnzy6Di/GDY1eTLZzAYIyrRpaiGgY3wz513jQ6LK1H1
         yCwiCeEP+0rLRUzb9NLMwRtSVy4T4eWXdZxHoGGin0//dJaJ7gDap9HXZX8A2rtRwcvG
         mBbw==
X-Gm-Message-State: AO0yUKXm/aIKmcpkNzDJWFDoTAX/9o/0BlBJWqtKvEgdpVz+yhorge3O
	PU1GM7yS4aEddkxqMTu1Nkt3t9ppayw=
X-Google-Smtp-Source: AK7set8itmucQtm5hnb/gppCbYVlAAn6NoOt3k316qO+3uYfOdg9p10cR5FI9Ev3kaw6m5FUaCCJjA==
X-Received: by 2002:ad4:5945:0:b0:56e:b966:408c with SMTP id eo5-20020ad45945000000b0056eb966408cmr9807730qvb.0.1676550450136;
        Thu, 16 Feb 2023 04:27:30 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:2ead:d6b6:b6e2:9e85])
        by smtp.gmail.com with ESMTPSA id t127-20020a379185000000b0073b4d9e2e8dsm1102362qkd.43.2023.02.16.04.27.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:27:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 01/15] nss: fix cross-compilation error
Date: Thu, 16 Feb 2023 07:27:11 -0500
Message-Id: <e042a51d9550d4caff7ad8f5efcf99478e404ee5.1676550369.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676550369.git.akuster808@gmail.com>
References: <cover.1676550369.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 12:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101103

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Change OS_TEST to be soft assignment so that the cross-compilation
doens't fail with the errors like (note the difference in CPU tags):

| make[4]: *** No rule to make target
'../certhigh/Linux3.4_x86_64_glibc_PTH_64_OPT.OBJ/certhtml.o', needed by
'Linux3.4_aarch64_glibc_PTH_64_OPT.OBJ/libnss3.so'.  Stop.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


