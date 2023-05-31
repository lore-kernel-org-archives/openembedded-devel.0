Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0913BC7EE32
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:42 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.9081.1685521592029993424
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=UfRMf0vQ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30b023b0068so545998f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521590; x=1688113590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3zztxpUm94jdDnRnvH0Isgak+tnLY4JCV/XW1vV9pI=;
        b=UfRMf0vQPut496/TqYhMz44Yt1uogYnWKxf7l3COTFHYymfPu7YnA4BfNBMbzHCER5
         HY2w1SMKEAB469GWoO3bI6bcOmh7zAr15XO0cAImfEbdpyn0TUfgPHxxw3A5A9FqvbSt
         HWa5FNh9AjZ0d7YgQsoYwMcYHgIByrbQ/8um+CLSvFhzvgFXXwrCLkWrfoNMFU/I+OO1
         bAd9rnESCw6RVQONNY8WxbNAAp0+b06nplB4IwIYKJWhIn7jHvQJwc8qhBFC2nvfLmXP
         d4ghnWuAGHCyAC8vDvk+vSrT5J75ju0/x6QkMxoulA5eDYNry/d8UACmWNeLkmtzO53L
         772Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521590; x=1688113590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3zztxpUm94jdDnRnvH0Isgak+tnLY4JCV/XW1vV9pI=;
        b=g0mUUVybzjYQkG5Rh8UJazN5TbDeTmaubc4JDh/X57LZbeCNyoXObvL8uugcLq1BCw
         FUhuh2oAmMHxmYIvBLpmUJnI4M5AtLHReaSnkNfzxfp9iXmft30QF92QzIHzZ9ucIydj
         EmO5LX/9d9XsHY9/X1XgY0AqL8loiKyKZdbP6QHyeJJGO7vJaEtm6XjzSvMTVek8Tb9J
         RmBjJgYPqXq3TVyN+UB5hWjFK9KHz88QU2d59soz29TyFhJ9AI2tqWrh+Y8qM+K/NMiO
         MS0a96Ui95z6LYEllp0H36okosEAPlYHoBhXEYJ3Nq7hiE1LlK9joVC69o9VHFaOMqxE
         JrFA==
X-Gm-Message-State: AC+VfDzm3mOBCyD1r0H8pbN5BVf0UBQcPM8iOHnjb+134m9j4cR9VuNH
	cJmSrARr4sBQii7j93QQUcL/KA==
X-Google-Smtp-Source: ACHHUZ4MMK0vaVWyT4cccwH6j+FNMj1bwbBqMCKtwGOHhD0ebhEPVaUxFhQA2lVLGVHlEO4l0kN6uw==
X-Received: by 2002:a5d:4f84:0:b0:307:f75:f581 with SMTP id d4-20020a5d4f84000000b003070f75f581mr4406569wru.18.1685521590636;
        Wed, 31 May 2023 01:26:30 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 075/149] python3-pyjks: stop using PYTHON_PN
Date: Wed, 31 May 2023 10:23:23 +0200
Message-Id: <20230531082437.10646-76-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103002

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2, so use python3 explicitly. While at it:
add missing spaces for consistent coding style.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-pyjks_20.0.0.bb  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb b/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
index 87e212d9d..e1b30e3e1 100644
--- a/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
@@ -11,12 +11,12 @@ SRC_URI[sha256sum] = "0378cec15fb11b2ed27ba54dad9fd987d48e6f62f49fcff138f5f7a8b3
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "\
-    ${PYTHON_PN}-javaobj-py3 \
-    ${PYTHON_PN}-pyasn1 \
-    ${PYTHON_PN}-pyasn1-modules \
-    ${PYTHON_PN}-pycryptodome \
-    ${PYTHON_PN}-twofish\
+RDEPENDS:${PN} = " \
+    python3-javaobj-py3 \
+    python3-pyasn1 \
+    python3-pyasn1-modules \
+    python3-pycryptodome \
+    python3-twofish \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


