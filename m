Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D2CC433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 12:52:00 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.22711.1669294319561673302
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Nov 2022 04:52:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hV5SCkEb;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id b3so2433775lfv.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 04:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nS81YbN+eX6vsZKPKpn6+2D6kZAmmfyEs6E7rrcQBlA=;
        b=hV5SCkEbh6cV/oOHxlavL3tChXyqq0NRU0CfD43R0zAd6jMKQCfBJAVsQOpOtPUfcM
         emMGg3ONKojqN8MolTqNNhwBbdhDDAYBbVXiqVlzRumFj7UX2hfXkhixtjVmi+TUV0Q9
         AcxGrifWmxou/dQN490abeweBquz7J4N2plbuDIFjP9xD+b29UgPyQ+qSThiiep+WBVS
         vUAhUDTXTzgwnoUJQqmLN9Vmr+j+siwfvYQMFNLViDApWEQsjaY9w89UGZ5R8TtgDEzm
         UHQ8uHjeYz58Bsg0daa3oBPXiVVgtdcIj3ovi82D0hMDpTGDX1vSJg+Zv6fN7lDJF5Hm
         LBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nS81YbN+eX6vsZKPKpn6+2D6kZAmmfyEs6E7rrcQBlA=;
        b=5dakk8lMUUBJfWnj0bJRG1WmkzziZlHZPNWWcDi4zNVtkTKmnTPX9p9ZWyenQSFJu/
         WzL/r+8M0sNXT2mWkdytGq9xrKvDXawynId9gNcWmA2P3O51sCUKE0nVjlVgylhXi+Zi
         vAqlNxV79IKtJBm75fPdHbcyAWZFYmTXh5m4nzbZFcJOuvwzEtS8I/updRQawv3S61X3
         qk2610Zeyf0uGgcOpYcGtQzN3u8X4dsi3aaeE72U7kYtrpVRS4oj/D8wmJ6Z801ivCc/
         oohO0FwtL4/GmlL4E+lC3wDfyeBY3r2u1kyIAr2JxEooEFmC8to+91Dtf3+QECFovnYE
         RvEw==
X-Gm-Message-State: ANoB5pnAAOdiYU8zrkjjVjcxy5wm3eF9WvXxrJQC+OhKhPGF6vzJ84Gw
	ejVtHcJO5ipvTaVL9qHMjWI7oaOcY3LPpsZ5
X-Google-Smtp-Source: AA0mqf6b2xWPI/wCQfkNd+vd9eYiii3uk/truWb41e2h1U7NMZuFtUWMHyLAMWYBIcebn5/JjJC1Bg==
X-Received: by 2002:a19:9107:0:b0:4a2:4c47:5416 with SMTP id t7-20020a199107000000b004a24c475416mr4492349lfd.273.1669294317474;
        Thu, 24 Nov 2022 04:51:57 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y30-20020a0565123f1e00b004a2386b8cf9sm112309lfa.206.2022.11.24.04.51.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 04:51:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] nss: fix cross-compilation error
Date: Thu, 24 Nov 2022 15:51:56 +0300
Message-Id: <20221124125156.1030857-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 12:52:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99712

Change OS_TEST to be soft assignment so that the cross-compilation
doens't fail with the errors like (note the difference in CPU tags):

| make[4]: *** No rule to make target
'../certhigh/Linux3.4_x86_64_glibc_PTH_64_OPT.OBJ/certhtml.o', needed by
'Linux3.4_aarch64_glibc_PTH_64_OPT.OBJ/libnss3.so'.  Stop.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../nss/nss/0001-nss-fix-support-cross-compiling.patch     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
index eb6174a7b016..950fae667a8c 100644
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
2.30.2


