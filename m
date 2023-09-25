Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A307E6FE31
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 23:16:04 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.6811.1695683762931367697
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 16:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kn5mSVp0;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6c4d625da40so3187517a34.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 16:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695683762; x=1696288562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WTz0HKYK+P9vfLMuCOJijzcAvCob4ZhltJKx+jBRrxk=;
        b=Kn5mSVp0++AoT78FLFxW/oJZQU1oJ5nSvd6iJUv3iOLMO0UAvoTpIpO0rQUlDtOGK7
         IwfyB0aVpYmYu5tQ70rG3l9pMQmiNndsOZ0Ne8IUHJzwd834F7ucAV7acSsVoq7/ygy3
         FK0Vo/R7ccYWkg+zxF24DrVjYev/WLN/YQFDF+KnJ/nkJK54T49SGzopVfOsweflmfOh
         Zoa8V/wz9ZFmiCZfe9cAFFyxQ4CWT7FsUIflsXb+MrUdq+Ut3yhnOvZ8rrRqP6O+0bFC
         QRvSHhlkzNACdCD9U3p9ie9esnoRtKoNDnibSaJFm9nrPwWVeaYMSsLYVOEir+vFDwBi
         Bg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695683762; x=1696288562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTz0HKYK+P9vfLMuCOJijzcAvCob4ZhltJKx+jBRrxk=;
        b=v7sGm+jTdjsQ6/0r/CQE8A4oSqOTXbkTFE2TkcGsGRZY4gylEia9jt+nN/0S1IMfN3
         2iVZBq9RDARc262EFvNnzp6uhE0dsRHFBgav4L6+ORW0eKIkTR5HTSzPJXCAMch3Bk3e
         eu6buefvAMp1JgT4vHBQ5plWO4FBsiZQ4fwxkrweesPCdiy+V+DlRGhcASgYRTI2DG4/
         JcLaBLR4DA0h7WLk0jEiX3XN4wOFYJXSQgUcWjOTE//2Ant2sq0/L0qp7cs13bqEQxZq
         2jCQFzoZ4oQfqQdxnGzFRlCMqLOFH1LTOGuYYEF4ah9w3w/lPexG09c79xqpdVKkvkvo
         P7xw==
X-Gm-Message-State: AOJu0YylQGPeS1F0e0FWpcHsORWYcaT/iZBoHFvNumIG25aeaNhTBHYb
	Z1qJG87MQeKXfpCfW0m1k4v3coYD0+AKrw==
X-Google-Smtp-Source: AGHT+IEdHjI2olAkA4CyXQGiLTPMm9enq7YP6kiUFI9skgl8VEaPP3Hg0ZR4nJAxB2fYr80vTIHn3g==
X-Received: by 2002:a05:6359:5e83:b0:145:63e6:8710 with SMTP id px3-20020a0563595e8300b0014563e68710mr4806547rwb.23.1695683761767;
        Mon, 25 Sep 2023 16:16:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id x17-20020aa793b1000000b0068fb43a72c3sm8636248pff.20.2023.09.25.16.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 16:16:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mozjs-115: Apply autoconf tuple mismatch fix
Date: Mon, 25 Sep 2023 16:15:58 -0700
Message-ID: <20230925231558.2150308-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 23:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105134

Fixes
DEBUG: | Invalid configuration `riscv64gc-yoe-linux-gnu': machine `riscv64gc-yoe' not recognized

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-autoconf-s-config.sub-to-canonicali.patch | 25 +++++++++++++++----
 .../mozjs/mozjs-115_115.2.0.bb                |  1 +
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch b/meta-oe/recipes-extended/mozjs/mozjs-115/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch
index fe905fe4dd..38496ea56c 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch
@@ -14,16 +14,31 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  build/moz.configure/init.configure | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/build/moz.configure/init.configure b/build/moz.configure/init.configure
-index 81f500a0b7..0b7a2ff60f 100644
 --- a/build/moz.configure/init.configure
 +++ b/build/moz.configure/init.configure
-@@ -585,7 +585,7 @@ def help_host_target(help, host, target):
+@@ -647,24 +647,7 @@ def help_host_target(help, host, target)
  
  def config_sub(shell, triplet):
      config_sub = os.path.join(os.path.dirname(__file__), "..", "autoconf", "config.sub")
--    return check_cmd_output(shell, config_sub, triplet).strip()
+-    # Config.sub doesn't like the *-windows-msvc/*-windows-gnu triplets, so
+-    # munge those before and after calling config.sub.
+-    suffix = None
+-    munging = {
+-        "-windows-msvc": "-mingw32",
+-        "-windows-gnu": "-mingw32",
+-    }
+-    for check_suffix, replacement in munging.items():
+-        if triplet.endswith(check_suffix):
+-            suffix = check_suffix
+-            triplet = triplet[: -len(suffix)] + replacement
+-            break
+-    result = check_cmd_output(shell, config_sub, triplet).strip()
+-    if suffix:
+-        assert result.endswith(replacement)
+-        result = result[: -len(replacement)] + suffix
+-    return result
+-
 +    return triplet
  
- 
  @depends("--host", shell)
+ @checking("for host system type", lambda h: h.alias)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
index 799b8abd90..babe39822a 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch \
            file://0004-use-asm-sgidefs.h.patch \
            file://fix-musl-build.patch \
+           file://0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch \
            file://riscv32.patch \
            file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch \
            file://0001-rewrite-cargo-host-linker-in-python3.patch  \
-- 
2.42.0


