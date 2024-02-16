Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D60C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 13:43:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.18975.1708091025582217402
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 05:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OLMgmpB7;
 spf=pass (domain: linaro.org, ip: 209.85.128.53, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4124c3a7a75so3703545e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 05:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708091023; x=1708695823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rHWWqtIPmfiBBSL4XAXeW4xKpetTLKwHBoyZL4A534E=;
        b=OLMgmpB7S6OsmAVBikqyqRIMghp7DnwNIhHOxnnqqpyKc4ACvfjqydnakWKJiZpE+t
         qZAUxWETH4oq89bJXUvDk9BNwS+TV9XOjSRcbICjw2SeSHXKZAOKEMnQ+4ao5Aj5XmJ/
         JOXxJrcyumdLNc4g0BZZGyLpLXL7dkfZgFZyAADZIJ0rkpTwYc6VTYYxS+3sGPnLtzGC
         +4nLwMM4lMuKLDQxDqC9+KaR4MaKU+AhF/WmoEyNrz4ne8SgRMnFXp7oZzlEle5f/3BN
         TVX/GhKoEuR3+IkOutiB1UzF38Qd5bSAa2KwCnhZyemPpvju/4yNKxgSdMcf8MvbM6gO
         dRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708091023; x=1708695823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHWWqtIPmfiBBSL4XAXeW4xKpetTLKwHBoyZL4A534E=;
        b=Qu6mwMoUY4trRo1bxKz41vARAnYhgv3CaguDsNusQE/oH0M+4ERdHj4elCUT912T+Q
         DGufyRf58TguMmUjQtOI0peloNmrM91eQoJiymqX8U8YHmtLccwbaoVPh+VnoZlWwT0L
         /cgxHZe6Y9JpzYZWGO2LM9Fjmf98962jisKvoMyWNM5tiRQEYsMV4SqMtl/KHJnuF3sT
         0nja5iKi9rjxItsPl5rlaTEOU0dKtoTG2Wfsl2sagan0YN7KUwIBtOB1IGZCP8+MROxY
         860wmpBj8TPT2HcHErhYa6A2zYBdiByaJFuC1J+htBSIvV8UFKuCCtCOpy0ejbDPlA4+
         tFmA==
X-Gm-Message-State: AOJu0YwMjFIFj7Aj9RqaEZdPkg3zk6eEG9GYiid7re4g3TFjzzrpvQQN
	owKSD+2YpRdzwd3aG0RzBjGhcKIyoqMhkKWDvP9Ft7PcSCcr9eVZiDlZCv17TyDLsK0eJ6qgML2
	eeV0=
X-Google-Smtp-Source: AGHT+IHeoPOEDP+ja75KDCNH/6HU3b39ymEBbYIurkvEIIiAmAYMRGW+HPMwN5uvXQFxtAnPy8Z4mQ==
X-Received: by 2002:a5d:6711:0:b0:33b:8050:291f with SMTP id o17-20020a5d6711000000b0033b8050291fmr3873635wru.32.1708091023302;
        Fri, 16 Feb 2024 05:43:43 -0800 (PST)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id az9-20020adfe189000000b0033b7a2136a4sm2303381wrb.97.2024.02.16.05.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 05:43:42 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-python][kirkstone][PATCH] python3-django: upgrade from 4.2.7 to 4.2.10
Date: Fri, 16 Feb 2024 14:43:40 +0100
Message-ID: <20240216134340.2756376-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 13:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108766

Upgrade to the latest 4.x LTS release.

Bugs fixes only. Fix CVE:
CVE-2024-24680: Potential denial-of-service in intcomma template filter

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../{python3-django_4.2.7.bb => python3-django_4.2.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.7.bb => python3-django_4.2.10.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.7.bb b/meta-python/recipes-devtools/python/python3-django_4.2.10.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_4.2.7.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.10.bb
index 580592d702..a9f25ac2b3 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.10.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "8e0f1c2c2786b5c0e39fe1afce24c926040fad47c8ea8ad30aaf1188df29fc41"
+SRC_URI[sha256sum] = "b1260ed381b10a11753c73444408e19869f3241fc45c985cd55a30177c789d13"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.43.0


