Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50378C7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:31:02 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.9185.1685521857997583337
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=fIjhdJwe;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.42, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f4f8b94c06so4405773e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521856; x=1688113856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vAkoMCtfwuQnE91+fjzohd87C69jJ+sD7KmZjc4GfAk=;
        b=fIjhdJweDo9UNQu/e3iGNXEkHTWgsuMRfCO4TGt7/tv++e8ACpXqA7RNdhQVlzzB+I
         iAZsNgWfU/yZZWQGT42+hBht6yIBqlQij4tmcKcMrilbNgi5pAteRLIhmAnKwOSIT+UI
         CGvmamBH/Ezic/p6GjnFowWtKOwRGV1jV8sRAy3zhNkhlIdxIKAyo4zcfG6jOSJYeQYu
         X8z7ZKRfB5MGqxqxxdsCLi36m95IF/78I1K+He5VcQgaVoJC7zVN6mgjEeULOn0GI+OM
         oJvwGucO+JHU+LKaMSjKwx56+qDry/4q++Ajk7pSRPb/Pgj4hHFfInNi0t4tnf6+a4lO
         qt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521856; x=1688113856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAkoMCtfwuQnE91+fjzohd87C69jJ+sD7KmZjc4GfAk=;
        b=AOYxCX3Z4/IgxYIsHW5L3izJehBB+n5C0lDUMSbmIa2CSuXmm7LE9ovHOF5JtuI75X
         xcKyIWaUA15oCgzkDbre4TIEks3qDxnr418z2eFkGKQi1AdCbBWM2xUnTjoVp9lHjEQn
         eu+NPVgZ6ot2X08PRG2WB7bPZhLmOq4uzpIGNa+Pc83xoyoLylrlhls6t/+oM4DR4stJ
         iQxcnjsTbt7pd9TChE8CERWqXQJC0Y6CsCK5wWUtSOrj3Yh74/+r0J6TrPYUAR0WDa7F
         mU/KaxMdtApP3LresHT7ESFLkZfMZSH90uSgT4u3QJwdS8Y06C9QELVHtrYo3wiEmNeS
         Ulwg==
X-Gm-Message-State: AC+VfDyQgzoISgrrpy4Cgwe8WITYdDrbIUjrHEzThKpJ6eAOHv398rT4
	uDBHbzWyhk+9svTFc/74hMedMHIVW52ajgfb2UE=
X-Google-Smtp-Source: ACHHUZ6cbtraJ0gaRKTCJfO38iHOIPutV0VpC+im0pWmt8MAqhkauOXFkwxdWCilJkCzum8AOKvaxw==
X-Received: by 2002:ac2:5a1d:0:b0:4ef:d482:9c91 with SMTP id q29-20020ac25a1d000000b004efd4829c91mr2237311lfn.47.1685521856222;
        Wed, 31 May 2023 01:30:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id t16-20020a1c7710000000b003f604793989sm23338288wmi.18.2023.05.31.01.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:30:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 092/149] python3-msm: add missing run-time dependencies
Date: Wed, 31 May 2023 10:29:07 +0200
Message-Id: <20230531083004.11083-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103019

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-msm_0.8.8.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb b/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
index ed30fd76c..966ff86de 100644
--- a/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
+++ b/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
@@ -10,8 +10,16 @@ inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
     python3-appdirs \
+    python3-git \
+    python3-fasteners \
+    python3-io \
+    python3-json \
+    python3-lazy \
     python3-monotonic \
+    python3-multiprocessing \
     python3-pako \
+    python3-pyyaml \
+    python3-requests \
 "
 
 do_install:append() {
-- 
2.39.2


