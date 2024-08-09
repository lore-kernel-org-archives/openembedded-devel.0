Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3EAC5320C
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:32:27 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.88282.1723221138623499480
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=arMDS5g3;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-36d2a601c31so854530f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 09:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723221137; x=1723825937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZLAjOGKu/zQA4TfGfgW/tFOejKnPyY03JtP5jaRicc=;
        b=arMDS5g3AKwFv7x6q5T3IjzxPqcxcdZtoDkPOVwEvkQ3mHr9secyg/+PjZ/iqMJWt9
         7Er2lC9BSlVrH9Q5WwTBlfDxlICD2IspdqVAUtTy2IIL+iknFkNfbdI6fnhO1eig9ge8
         7JBzE7RB3X7j1HRTX8ui/vBh+SYgUSgS+t19Y+DwdQ34QnXFzVq87UGLgekwy3c6M7Mu
         WGDfVsCLOfimauAOSRWTAJJ9C5pjqqEEKXVh0AQm2ePL6RF6uxJyTqacgrZuuSSWEI2A
         j6oV+XvupwTMn6TaoDYjzm7qiRF20e/uWWfZCHL8eoeF66JCiKg5uVb9dzcnoZwjPu/b
         TqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723221137; x=1723825937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZLAjOGKu/zQA4TfGfgW/tFOejKnPyY03JtP5jaRicc=;
        b=nx5kCf456T9NxEGHYla/uPZc5XDkndg6Ra/n7BG7RGZv3i5t8QS3rhXuUDsSHqMXAI
         2kJw/lf4yLqpYi4jWmY96xBeduI3RM7nE2QQ3ycL4Kve0eXuaXcGKbZGJFIsY5n96dsP
         MrpUAseIRFYuCtj8+szufqQutId87vMj0dQ4Hmo4rrIyqKUOoNL2pbZTw8pbGvzxFtUb
         w5x82hacY6DfPtNT+Y6K08qrh2bYwMkGTJ3YwjlMZJc3rfJHOOG2n/y4RnAVIZkoskjs
         y8xkr28mtwqieDCs/G2o3MXCGJkVQ48Kf9cBFZKJeoKiXefjuD3AZVb0FBTSp0BEJktf
         0R1Q==
X-Gm-Message-State: AOJu0YwiiDrjU5FiyD/wlWb9j+awDxxaO/mkP1lxJE8r2ok8Ms/PnIP+
	FIkvcuxkab+D+C5qVcqumNGa0r5HrX/Bfy8GXw0SLGD/Ro4dkBafJBhgEH6u
X-Google-Smtp-Source: AGHT+IGh5KhDyLvlMI87DQpUDmczSvtOuvdEpUgkh4yxGkk7UnGyGvzVq+/YsHCKf8mSnkRz65USag==
X-Received: by 2002:a05:6000:dce:b0:367:8a2b:7354 with SMTP id ffacd0b85a97d-36d5dd75e5emr1621948f8f.11.1723221136562;
        Fri, 09 Aug 2024 09:32:16 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716bf49sm5789123f8f.25.2024.08.09.09.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:32:15 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 04/12] python3-pytest-timeout: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 19:30:53 +0300
Message-Id: <20240809163101.8416-4-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809163101.8416-1-alperyasinak1@gmail.com>
References: <20240809163101.8416-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111715

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

- The PyPi package name (defaults to PN without the python3- prefix), so there is no need to set PYPI_PACKAGE as pytest-timeout, it is by default.

Fix:

WARNING: python3-pytest-timeout-2.3.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-pytest-timeout_2.3.1.bb   | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb
index b56c26aad..fe9d814c0 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.3.1.bb
@@ -3,10 +3,8 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-timeout/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff"
 
-PYPI_PACKAGE = "pytest-timeout"
-
 SRC_URI[sha256sum] = "12397729125c6ecbdaca01035b9e5239d4db97352320af155b3f5de1ba5165d9"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = "python3-pytest"
-- 
2.25.1


