Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1700CD11DD
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 01:51:04 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.9275.1711417859122578327
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 18:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ok3YKAIV;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1def142ae7bso44203655ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 18:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711417858; x=1712022658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbpnT/qpuhN7vwfSZ1VGqe0vIEBLcSbh3Rnto9sFIYM=;
        b=Ok3YKAIVft1GftlMAtxj8YoX4VPakEJcaHbvmcPHl7CqiSpfqXU0Lox1o/py6s8vZs
         j7FaLMQs6kY1wLn/Rkm5hiQwc6MQhkrjy9MWOZ9BgltxD3eeJoTe2lNXpWSoXWANR0iB
         bju9bJskx6haG3+3cV36tQr3xO2RJwnocMjKGFi6wYqfMCoTsmUCG3RsM0BNgmBxnvDm
         xZSREUgY2yTKd0wZWfWCnKvWHg9WtWy1BfubL4rY1f+3hVKnxA+oADCiy/j0vtmYmKAk
         EiOgqESTWcp9ZHb6GTiQIAKyEyBjtCVEo1tVBHtELeBRXMnG0ha300tElFifVj/F5/HN
         xU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711417858; x=1712022658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbpnT/qpuhN7vwfSZ1VGqe0vIEBLcSbh3Rnto9sFIYM=;
        b=uWV3HsAWUlR603YbXcckd2cW6B5VDQvBA79rrNIk0+Ucg/B5+mNBIpcTQXBoJEif2Z
         ALx3hUwFB43WBJ1S/3xGav7oJlqwqjl+07YTm9Gih7UH9IPSml1OW0vmIhQe44pP7PRL
         ZQMAeya43K7/PX8vDRQuuMpRd95aPugMel0GdgPeh8zBr/Wli+6Uguiv8/vP8FUBIBI/
         1/5Ppbb5yPllMcVjL5yfI4Q5/AEQWP63Qie7SSyWFJuRY+vhNm3OfBrG3y/V2aHUhn/1
         omv2hlQfqrfNIBVbHc4WJp2JrT+HprkpZpqfhS7+gtbpG2bdXAtIJ41Ct15Xg0F7Fnrr
         0enw==
X-Gm-Message-State: AOJu0Yx3TkqbO7nBLfinbY7l0jrW8kWp1t+76mzY3Ga/nH6/qIGvF7um
	bUDhHDbdsQJp0eLTurM4TsLYeyWGFuf5HKdpoX/zdrrPWEW5JjCvJy5elnXg
X-Google-Smtp-Source: AGHT+IGoZh1TT9U0aolFIxVb4WK5rH+ArrTRQeLlLbXOhxUFY7A59aAPEHMRIlnJBzVjtY1MAmG81g==
X-Received: by 2002:a17:902:c10c:b0:1df:fa37:4975 with SMTP id 12-20020a170902c10c00b001dffa374975mr7503025pli.3.1711417858254;
        Mon, 25 Mar 2024 18:50:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902e54100b001dcfc68e7desm5425070plf.75.2024.03.25.18.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 18:50:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/10] directfb: Fix build with musl >= 1.2.5
Date: Mon, 25 Mar 2024 18:50:44 -0700
Message-ID: <20240326015047.543274-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326015047.543274-1-raj.khem@gmail.com>
References: <20240326015047.543274-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 01:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109618

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-graphics/directfb/directfb.inc    |  1 +
 .../0001-include-libgen.h-for-basename.patch  | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/directfb/directfb/0001-include-libgen.h-for-basename.patch

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recipes-graphics/directfb/directfb.inc
index 07b98648fd..4d38632e25 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -23,6 +23,7 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/DirectFB-${PV}.tar.g
            file://fix-tslib-version-check.patch \
            file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
            file://0001-os-linux-Fix-build-when-__NR_futex-is-not-available.patch \
+           file://0001-include-libgen.h-for-basename.patch \
            "
 
 S = "${WORKDIR}/DirectFB-${PV}"
diff --git a/meta-oe/recipes-graphics/directfb/directfb/0001-include-libgen.h-for-basename.patch b/meta-oe/recipes-graphics/directfb/directfb/0001-include-libgen.h-for-basename.patch
new file mode 100644
index 0000000000..abdba18fec
--- /dev/null
+++ b/meta-oe/recipes-graphics/directfb/directfb/0001-include-libgen.h-for-basename.patch
@@ -0,0 +1,32 @@
+From c8cf3ffd4fa14cdc6d607a09d51e898dec922348 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Mar 2024 18:17:44 -0700
+Subject: [PATCH] include libgen.h for basename
+
+basename prototype has been removed from string.h from latest musl [1]
+compilers e.g. clang-18 flags the absense of prototype as error. therefore
+include libgen.h for providing it.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Inappropriate [Upstream is dead]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ systems/fbdev/fbdev.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/systems/fbdev/fbdev.c b/systems/fbdev/fbdev.c
+index 5297358..4e6f178 100644
+--- a/systems/fbdev/fbdev.c
++++ b/systems/fbdev/fbdev.c
+@@ -42,6 +42,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <strings.h>
++#include <libgen.h>
+ #if defined(HAVE_SYSIO)
+ # include <sys/io.h>
+ #endif
+-- 
+2.44.0
+
-- 
2.44.0


