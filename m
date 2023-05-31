Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631E4C7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:31 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.9109.1685521524243439924
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=yUWKvoIB;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f61530506aso57685865e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521524; x=1688113524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kK2xTQG9XJ0kPMvFra4hLlVEOZ9YtgdQqHNs1txRpeU=;
        b=yUWKvoIBUITCh3SPaMPyFkiFW3Joap86jRctYzZBvEagXv+QAdLJZqSlvMgcB4zaJm
         yetEpwPaLI4/+Pjx9EBIJGNVpLbeoiFZZgz0Y4WtG8YXjaJh200goYXT6pyFaM6G+xft
         csvC54IxJdPzf3C78hwAPagY9mOhDKUstdVRhK7Q1EQOGdtDBuCxqonmnqviC09MbED9
         5QB/hqtGDWV4P65R5Dpq/CoYH9gjNUxuEp6jKOQmE0BBwC/xJKMTGg1NDCuyX7Ke1g5z
         0d0YZbu0y95ZTru18nj3QyXShUAlpeZ5qjcdRsq/V3pAMvuGqeubUCCZVSIFdqhvj77C
         x/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521524; x=1688113524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kK2xTQG9XJ0kPMvFra4hLlVEOZ9YtgdQqHNs1txRpeU=;
        b=XPV8uFSeNqXYGP7d2wfz2KNo5ILILXjARcmhFaHTTbgHIuy7RW8F5jb2A8lU9NRJaD
         BCXQUhnFzpW+GE9/8seh3sU/IhIWwo8ILovJJht2qZtJpSq1E4n/4hkI0ULKRWlYJPzb
         1oCZ2NEoiI6a+26fcvTINaE+ZwCLR7L4RK5zU/xaHq3oH+3SaBCQTBrkSOpB3sQYFl9B
         c+Ga6xk5+lrqaXEe0GgD0u1hY18hIB0qa5TKzVDnwT5h8Lbo+UqXe0j1VM+gyiA8AknP
         Cs34x7EL7uUAvFD4vA7qDbtqIsGpos83sD9ovx2p5udWfGf2oYlD9tcb5tODGHcwsUY1
         bKbQ==
X-Gm-Message-State: AC+VfDyrsrNCC4lhCIiP1k7Bc3ATEExjeu4UsAOq0XuKR7q1x50hWwdR
	Q7r/MIcU9Dux/HoycIRWLwfvFMeoUH69+2mrvt8=
X-Google-Smtp-Source: ACHHUZ4dwqihQ9oEohPzFig/76NRh8mx8F/an9ad3mbJwxsMlHQvnYvcT96dKUTp+najcxwJBDS3jw==
X-Received: by 2002:adf:d84e:0:b0:30a:e5b7:a290 with SMTP id k14-20020adfd84e000000b0030ae5b7a290mr3642522wrl.15.1685521524774;
        Wed, 31 May 2023 01:25:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 017/149] python3-pyiface: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:25 +0200
Message-Id: <20230531082437.10646-18-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102944

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-pyiface_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyiface_git.bb b/meta-python/recipes-devtools/python/python3-pyiface_git.bb
index 5e0d2de91..29a0bc86c 100644
--- a/meta-python/recipes-devtools/python/python3-pyiface_git.bb
+++ b/meta-python/recipes-devtools/python/python3-pyiface_git.bb
@@ -7,6 +7,12 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
 
 DEPENDS += "python3-setuptools-scm-native"
 
+RDEPENDS:${PN} += " \
+    python3-ctypes \
+    python3-fcntl \
+    python3-io \
+"
+
 inherit setuptools3
 
 SRC_URI = "git://github.com/bat-serjo/PyIface.git;protocol=https;branch=master"
-- 
2.39.2


