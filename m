Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55F9C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 13:30:40 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.18739.1708090233345735338
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 05:30:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=H3Fu/Iv7;
 spf=pass (domain: linaro.org, ip: 209.85.128.46, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-411f895c8b6so16686375e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 05:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708090231; x=1708695031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rH0DskxYW9jKjDpCh85RH+qUGA7DS/dOEgxtcPekZCo=;
        b=H3Fu/Iv7KcBG//4eNplPbYHDVaVWlvt8fZqBn8fvh6CfgSPTJVvlWIXXSa2LVcj59V
         Zyns2nok0ALy0CP/Ie80i8HAgKNSFrSXcVK+UyF1E4vdFrhsez9oJxO7wNX0FIvDzuRx
         +JhB7L6+x/zthhPg6R8sUWvigb4t+2uV28+MVq5Fxb+Sae5jg4KBdFLDfoJx7TEr/3DQ
         tBQh3IALazIHQu4aAPCUTCSvGr6RH18PguVZ69qkc8m23+JtOhGCLnrAo/FBqNqME13j
         X4sXemaEDHlgEezu+xvHhgJVq/H0jMBXq12B3UbqcCwqtxfYt2cmtGdL5jBFGMOZ+GLv
         A9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708090231; x=1708695031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rH0DskxYW9jKjDpCh85RH+qUGA7DS/dOEgxtcPekZCo=;
        b=thxfewElOsjnX2HZ2qPM/vVIORfl88t6eH+DwshVaFLovDQzsZj8uyiTg8VvqboyA0
         Dtzm1mjGKbxmZsFbFo+jL1o4uHV3TKY5WUiRRpsDj3a/fGODfp3QRHgzDgYjX9gcGNdS
         wV/TbYtFPzDa7Seg9RP27QHudQxecCZjsSOnSKP3g+62rpXJlw3FYZyFnFC9ddbMCdd5
         swMsCw2QWGhP1sNqKTzuJoqOTwJ619zs8fePpY3eLU5WZANtV/HxYdFs/SKa9USA4e/4
         UAs/f5hpXgB0sz+qHeZjzMxXhKYEHZqR69naoOtNphY/joTH4bXZDtgqGHEIoW7e6EOo
         /DEQ==
X-Gm-Message-State: AOJu0YwcVWJfjyOo7zv+gQoKWytvzxBFBwckdTUW5SsWG8UkAKYYfMLV
	yE/GRqyFMfn9UXmiihoyoRfYkyMqIssmLgzjgqOdcem96AJ4Cx6XIRxQa123pXdlGj1K8kx+5ZS
	AMxs=
X-Google-Smtp-Source: AGHT+IFEKWjNsh3jHRo5Uy/XAOXoUqn5+Odal19A7/EjpDfhEfRhE1laeBZfFtiVB8rEaavstEqsZw==
X-Received: by 2002:a05:600c:4691:b0:410:c25d:37e9 with SMTP id p17-20020a05600c469100b00410c25d37e9mr3767808wmo.16.1708090231029;
        Fri, 16 Feb 2024 05:30:31 -0800 (PST)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id v11-20020a05600c444b00b00410d7e55e5asm2414455wmn.3.2024.02.16.05.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 05:30:30 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-python][mickeldore][PATCH] python3-django: upgrade from 4.2.7 to 4.2.10
Date: Fri, 16 Feb 2024 14:30:27 +0100
Message-ID: <20240216133028.2755417-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 13:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108764

Upgrade to the latest 4.x LTS release.

Bugs fixes only. Fix CVE:
CVE-2024-24680: Potential denial-of-service in intcomma template filter

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../{python3-django_4.2.7.bb => python3-django_4.2.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.7.bb => python3-django_4.2.10.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.7.bb b/meta-python/recipes-devtools/python/python3-django_4.2.10.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.2.7.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.10.bb
index 100db9bd71..a25ebc4b11 100644
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


