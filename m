Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1781DC36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 11:21:00 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.18964.1742556052777443377
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 04:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UzSBuorj;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac3b12e8518so404805666b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 04:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742556051; x=1743160851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJpS3BCqLIP/9825j2+oAGFuxqJISaXCEmSjWjuS6Z8=;
        b=UzSBuorjwY0mS+AqsNjNGhs+PnS1SzRtFTonFWgWNYzfBQYiwE8PqOODCs6pXmIqGR
         6cOwxnrAxPvpLk/s5SNITzEXYJvU+z8r3/T09TS7pyh6bJXcKn7HIyekUBt5irbXcnQm
         jY7VrmHFet9LCiNVZ5PGWk+qEN2T+5jr7MTPOHUXCpydNK0h53NZ0PFhl7Nyt84Y5vNs
         WoUjoXxdxoPOeemUW7wZ4v/yF8SCKKjnoYe5Zys7VFyptMnFgLCw2JYaAEFnWGFg65gZ
         aMqw0pPvviX4ahX+Ta4zSxJZOrfUkGUxbwOrZ/8Y3V3DoUqwWxu3TOnAjwLO0FV0oNJP
         ByoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742556051; x=1743160851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJpS3BCqLIP/9825j2+oAGFuxqJISaXCEmSjWjuS6Z8=;
        b=NKR0dpHtCJbFdJnh6ptxLXePkJ7MG4NKrdO6Gv0q5xDfe+h9prtUcQfdp1UGB6QuTP
         QFgWhN9CmMS+RZbKlsn9RnR0WsvhCQq8BkNvZEWB0wUJRoI5XiRRzl1XMoPKCL0UIjp2
         dDafy/w+iZ4Aeb7lmGY3SaUmUZFHfl9Yr4N+/Nrhc+nFC2C/mDrMlNBijjuElCb/CSRh
         Xg2sAbiouMwrYa2gZ4v9Y27Qm99IpEhA6QDAwQ9pHPNMSvrBNtktTdKIm9yn/XTBEBYr
         oquMtxeKbYVWavwsWSIhZUNSFLbdciggoAGNlBH1Qwa2AV0IGgQu5zvDLwIN2hNx4E29
         +EBw==
X-Gm-Message-State: AOJu0YwHCO50wtJ1KKJBbmPlW+HloVTbGA8ubf0Zsxi5gdh0343tvqoH
	mTNlsHj/3ByMeejAdN7cy4u4tLs4Ceh9TuQpzjz8Wqef7ZZSs11jfpoXGQ==
X-Gm-Gg: ASbGncu55O7V6/34rDVgYymv6AkCEojC+0y0EsDCBit7Hiu2Gh/oP7FNEHTsxixdnD6
	zAcDVRR/JJtwDWS7fkhjzgVRI5etwH49EGkIpNRs0NdbxGkkaeak6hCnnsE84VULuqZdZ1VV4no
	zIx7DilS2HRsOWJ493oUaloFZpxBa6yo8j7FBK8ih81dLXHQEiQjk6yA+fi+sfDJVDKBciyGpMo
	UAEX/7L7742bzB9d+MAGjQcmX5cK3JRlTNw1uyLF7mPnyMDqhn7uJLTjg/2/bMl+XXbPEc/N0L3
	LqgyviimuRRkVk4WIUxOFiBZuJRZ1HeunUKUaapHA39O1Jd2g9lUTUqliw3c49UMWtPCFialg3S
	00A==
X-Google-Smtp-Source: AGHT+IGhpNFaRtRauhV7wh+eXGOXG6nJVggZHMdxih28cPbDpJ4ojAmz2fLNTgMJc6iEU0XE8rOgUw==
X-Received: by 2002:a17:907:da0:b0:abf:6cc9:7ef2 with SMTP id a640c23a62f3a-ac3f24d5d6bmr328951166b.42.1742556050944;
        Fri, 21 Mar 2025 04:20:50 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac3ef8d3d38sm133822566b.39.2025.03.21.04.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 04:20:50 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] lvgl: fix build with gcc-15 when thorvg is enabled
Date: Fri, 21 Mar 2025 12:20:43 +0100
Message-ID: <20250321112043.2425580-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250321112043.2425580-1-martin.jansa@gmail.com>
References: <20250321112043.2425580-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 11:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116183

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  http://errors.yoctoproject.org/Errors/Details/848488/
  which is triggered only when thorvg PACKAGECONFIG is enabled

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-thorvg-fix-build-with-gcc-15.patch   | 34 +++++++++++++++++++
 meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0001-thorvg-fix-build-with-gcc-15.patch

diff --git a/meta-oe/recipes-graphics/lvgl/files/0001-thorvg-fix-build-with-gcc-15.patch b/meta-oe/recipes-graphics/lvgl/files/0001-thorvg-fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..eefcbe5b9c
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/0001-thorvg-fix-build-with-gcc-15.patch
@@ -0,0 +1,34 @@
+From a9e41f7e9590c757e74877cace6442dd676223ff Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 21 Mar 2025 10:25:43 +0000
+Subject: [PATCH] thorvg: fix build with gcc-15
+
+* add missing include to fix:
+  src/libs/thorvg/thorvg.h:357:20: error: 'uint8_t' has not been declared
+  357 |     Result opacity(uint8_t o) noexcept;
+      |                    ^~~~~~~
+
+* not needed with latest master where it was resolved differently in
+  fc5c15638 feat(thorvg): use LVGL's malloc/realloc/zalloc/free (#7772)
+  which includes stdlib/lv_string.h which includes misc/lv_types.h which
+  includes stdint
+
+Upstream-Status: Pending [not needed with latest master where it was resolved differently in fc5c15638 feat(thorvg): use LVGL's malloc/realloc/zalloc/free (#7772)]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ src/libs/thorvg/thorvg.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/libs/thorvg/thorvg.h b/src/libs/thorvg/thorvg.h
+index 7f5a84b94..0c84ec66e 100644
+--- a/src/libs/thorvg/thorvg.h
++++ b/src/libs/thorvg/thorvg.h
+@@ -18,6 +18,7 @@
+ #ifndef _THORVG_H_
+ #define _THORVG_H_
+ 
++#include <cstdint>
+ #include <functional>
+ #include <memory>
+ #include <string>
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
index 63c810d74d..b07cdfc8f6 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "\
 	file://0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch \
 	file://0007-fix-cmake-generate-versioned-shared-libraries.patch \
 	file://0008-fix-fbdev-set-resolution-prior-to-buffer.patch \
+        file://0001-thorvg-fix-build-with-gcc-15.patch \
 	"
 SRCREV = "e1c0b21b2723d391b885de4b2ee5cc997eccca91"
 

