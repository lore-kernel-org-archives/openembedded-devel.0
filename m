Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311EAC7EE24
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:13 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.69127.1683477191715428731
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=srfFGAXf;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55a214572e8so56929177b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477190; x=1686069190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kXt9C9rcFKlCLMy4dUhxFjZf+OHAZkcHFSUHvzOKks=;
        b=srfFGAXfnwrz7C0ttblmRLaW+TvDwf6aP9s/r1EQqbsmmzTPSZ5T3hdwM/PvNEFnsa
         aV7hoFSf2mjrJMj5QzDLxIjF8kVDhzPDYgeh0RGOR4uS43o3aBGUWDXqLjUaAt2sE4Bg
         0Onxp1oNI21GJRmwB9VdG0S+CD4v/8ZC+IpEDv5ibozTKVMEehNt9YyUaD4IGv4zJonq
         TVFqCPs1KErw1sHf1anbibVDo/3Dg/gu/Nfsez4kn7BdOJU+s0zqo0fYvW5VUoLnkSqA
         +Cwp6vCAXbdoIth5JbVFmroqby3dYJGLv0KLyUZLOweVK//8uUhfospKHwki+VR083xS
         K+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477190; x=1686069190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kXt9C9rcFKlCLMy4dUhxFjZf+OHAZkcHFSUHvzOKks=;
        b=YoiXnRsUHUl5CWcfmIAxXFcN6xZYzWOFSeVcakWpBK4oKTKyOgCvRtnRHGcZcu66cO
         cxXe6zFPGbONA2zPxpvKqg9VyvaeYLqM1agnD4baxVQEHmhr1W+pNLRPIoV/W4dXkcYX
         7U/gRFx1V8kNdQHrvEtG8C08FTWUCjfhrmZ4ZVa3HWfBKH1a5BPe9dXoByRysv9pAn8Q
         dMHfoM8OM9Y30VTLS6kGwPp89P4Hy0r7USshgYK11nwf4qWoRUjWrTIaCITSGC4h7qH1
         fAlXmmCG0Elmjor2Fcwr4UIZpksIb50RySmYHnb0TZbZ6zs926BKT7OrHtSe05ci2Xhc
         Go0g==
X-Gm-Message-State: AC+VfDy03td5V9VdIZa7NR375L1voO8LDzTgz/fU0ibzhE3M2RSHlpV4
	S8vrYdQLbczZKXEvlmZDQLA1Usqd5gw=
X-Google-Smtp-Source: ACHHUZ7SdLgsAJ9jOy0P5LiagjvQ/pLi5zCrcqTP5JlT6EuhPzRvgc8GebiqUh/xuXukfm8mcJobvQ==
X-Received: by 2002:a0d:d4cb:0:b0:55a:7212:5353 with SMTP id w194-20020a0dd4cb000000b0055a72125353mr8908768ywd.5.1683477190514;
        Sun, 07 May 2023 09:33:10 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 04/29] python3-gpiod: add missing run-time dependencies
Date: Sun,  7 May 2023 12:32:40 -0400
Message-Id: <20230507163305.3261044-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102334

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The gpiod package needs some standard python modules so add them to
RDEPENDS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ce5cf625cdfc0adbffa344de7c59274cb89f5612)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-gpiod_2.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb
index 18cf8ae8b5..2d3b8772db 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.0.bb
@@ -18,7 +18,11 @@ S = "${WORKDIR}/libgpiod-2.0/bindings/python"
 inherit setuptools3 ptest
 
 DEPENDS += "libgpiod"
-RDEPENDS:${PN} += "libgpiod (>= 2.0)"
+RDEPENDS:${PN} += " \
+    libgpiod (>= 2.0) \
+    python3-datetime \
+    python3-profile \
+"
 RDEPENDS:${PN}-ptest += "python3-setuptools"
 
 export GPIOD_WITH_TESTS = "${@bb.utils.contains("PTEST_ENABLED", "1", "1", "0", d)}"
-- 
2.25.1


