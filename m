Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B397C6FA82
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:26 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.2763.1662594079947148040
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gqvp2Lm0;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so524855pjq.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bPUr1HXlkQDOR1ItbL+h3D68z4qOFbrFsJHCKYIVqgo=;
        b=gqvp2Lm0ArGUccKLLSy1w5ILDx4OoAjyR8lApA2CGZC5cZ6pe+ieZQ/wBDTgCRZyy2
         adKqo/43lt/6wcgtrG+QE/efZqaSttg8JZaALM+kXAb+kZXBGIV6NTgazvqsigEKmL6A
         MKeTo6rrTzATW57i0PnLRruu/HA6Xwwqtuif9h8XDlIg/IT8ITQmsslkf3qrfPu0lncG
         83P5m2gdsTTrN0qY1AYgwYeKRkYdMe+IylPIhN/ZXuIkt4ijuxZc2v6lhdNesrPAwOUT
         PHf3+y9O9y1NIJRZCObNSUE3JXzjpz0tqTuSWyOCYXQLVlPTE1YOZAQq1SN0Fx/lyn5U
         5JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bPUr1HXlkQDOR1ItbL+h3D68z4qOFbrFsJHCKYIVqgo=;
        b=qV8I6L3NZMNCe/TvMQq+sisEWR2HjjmQwm/Rxc3H10WAlz8WrTByg41/qXe+YWpBf1
         OujJDMEeYtSQ0U0Pnoc9LyyHCeKycY44pIfrsP016rx6DlzuxxQm3Lvn64B5aDsYH/sP
         fq8CVkNZg8DY/vnlsoRt7U6drWQsNVpxVmRCDQl2cBXe2xUCHiOmye6XB7o8PjUDrlZv
         h8eAHcSSBEdYJ7WQRzvrP0/etxmIMSiOGqLz/sIMZ1xftm4saNG35mmCivm5hIS7R6yF
         B3GTtZhvE1+/huApSvRmJH5EAH4i1gez2xqGZGg9gbNImBubzBlVGZado5YT/YYDgUX1
         SDxg==
X-Gm-Message-State: ACgBeo2wZBXunrnnPwQu/yiMKEsnjX5oU38yDaCmZ+eyhtNiRjl6Qr/r
	PvUZ7esAqKChpfZwcUXIaMDwbc3q5H7dDw==
X-Google-Smtp-Source: 
 AA6agR7mPtLvO/Hln6ZaQLl9b85+8RwnBs74GO79hKVcKkFlbExCBVenDJyH2i4+9XMSWlAOiGJchA==
X-Received: by 2002:a17:902:f54b:b0:174:f4a3:767c with SMTP id
 h11-20020a170902f54b00b00174f4a3767cmr6357497plf.4.1662594079223;
        Wed, 07 Sep 2022 16:41:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 18/22] android-tools: Use local strlcpy
 implementation on glibc
Date: Wed,  7 Sep 2022 16:40:58 -0700
Message-Id: <20220907234102.3312797-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98708

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...define-strlcpy-for-glibc-based-syste.patch | 35 +++++++++++++++++++
 .../android-tools/android-tools_5.1.1.r37.bb  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0001-memory.h-Always-define-strlcpy-for-glibc-based-syste.patch

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-memory.h-Always-define-strlcpy-for-glibc-based-syste.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-memory.h-Always-define-strlcpy-for-glibc-based-syste.patch
new file mode 100644
index 0000000000..82e97152be
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0001-memory.h-Always-define-strlcpy-for-glibc-based-syste.patch
@@ -0,0 +1,35 @@
+From db3a3714be07c8ab51b9ae7b035e4afe9f39c645 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 7 Sep 2022 13:20:22 -0700
+Subject: [PATCH] memory.h: Always define strlcpy for glibc based systems
+
+android-config.h file includes on compiler cmdline sets HAVE_STRLCPY
+unconditionally, since bionic supports it, its no big deal on android
+and also no problem when using musl since implementation exists for musl
+too, but glibc does not provide this. So either we include libbsd or use
+the implementation provided by android-tools here. We are currently
+using the in tree implementation for systems which do not provide it
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/cutils/memory.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/cutils/memory.h b/include/cutils/memory.h
+index e725cdd032..9e99353c58 100644
+--- a/include/cutils/memory.h
++++ b/include/cutils/memory.h
+@@ -30,7 +30,7 @@ void android_memset16(uint16_t* dst, uint16_t value, size_t size);
+ /* size is given in bytes and must be multiple of 4 */
+ void android_memset32(uint32_t* dst, uint32_t value, size_t size);
+ 
+-#if !HAVE_STRLCPY
++#if !HAVE_STRLCPY || defined(__GLIBC__)
+ /* Declaration of strlcpy() for platforms that don't already have it. */
+ size_t strlcpy(char *dst, const char *src, size_t size);
+ #endif
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 37e72de2a6..abd140c7b8 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -45,6 +45,7 @@ SRC_URI = " \
     file://core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch;patchdir=system/core \
     file://core/0016-libsparse-Add-hole-mode-to-sparse_file_read.patch;patchdir=system/core \
     file://core/0017-img2simg-Add-support-for-converting-holes-to-don-t-c.patch;patchdir=system/core \
+    file://core/0001-memory.h-Always-define-strlcpy-for-glibc-based-syste.patch;patchdir=system/core \
     file://extras/0001-ext4_utils-remove-selinux-extensions.patch;patchdir=system/extras \
     file://extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch;patchdir=system/extras \
     file://libselinux/0001-Remove-bionic-specific-calls.patch;patchdir=external/libselinux \
-- 
2.37.3


