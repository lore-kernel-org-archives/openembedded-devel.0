Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.38984.1617506698104039225
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Apr 2021 20:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ETmNrLbd;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id ha17so4451385pjb.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Apr 2021 20:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=J/i/fTvhFSMC2MqtcSZ83WoOXc74m4EQ1iNbVTvF4cU=;
        b=ETmNrLbdGKUmTh/2h+znI3D8rizqXfQBi6zLQeiCY5c7dsoQ/FwrNa74kQLiSXBmKU
         Yu+PJ47i2RHXBfC6c/TFz8l7fVO+Vudw3M0zmg7JE7XPXNki7wukNrQLZKmmGC2+8jJW
         zvfVuE78q0dWlY0V8WVkH7tXIEvQY+e4TBTJ93rvuFkEV0neWGywyRXACWCEom0TqAI7
         32takWgE7tjdoJZNRNnauZnduRpGkBfPncl90Llbz760i2RAjMEMAxJ4Yrq2Xz69gj0e
         9c+EH4nJbFqAUbFXZrXieqzOPdu6IhLF7wdAr/KKUm2dvcSVOnuTXYIN5qTrJXuWcRGQ
         3qGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=J/i/fTvhFSMC2MqtcSZ83WoOXc74m4EQ1iNbVTvF4cU=;
        b=lk807Dh+AlG5QpApR1yTeRNMiw2JBX+vaV8Vd7v8bteW7syfHkq/j24ttTUjZ9D/kK
         PO4waKBWyZtkKwnpE/dMwWcTnv+4imoinQFHTkwy0Yr/RjgqTm/8TXK4MLPKG8Q6VYru
         bvoO0h/VYa98J/IkXHfGJwjDFhqCHDKSNlR8UyTjVFbbKsaz5ERTIKgjLOWD4UcBSr+R
         xvIit38omiYnY52dq0Du/XPgDYBujtbEkKKDVRrTzrtxCQiGo54q2RLpqUTF8MyAl9lX
         q3tT5ZIBabmtw2k2awSLytaq7Klzfv1dgStQ8mNtPkJnWCcxVdSCYGezEC3IQYJ/fra0
         q14w==
X-Gm-Message-State: AOAM530VhUJR/RjecLG5sSqm0qv7jSltfCDJwulAfNnLoyJMSK+1KaPo
	AAGbAFJWXd9bbddFbLLYLuaTGcQp7bk=
X-Google-Smtp-Source: ABdhPJxD+41sasXsefEQRTOX3NFwafSWvH2Frbe1IDQpr5IPVIQmTIJamIIhKvPlBrxPkPzqEX2qvA==
X-Received: by 2002:a17:90b:1643:: with SMTP id il3mr11018010pjb.2.1617506697323;
        Sat, 03 Apr 2021 20:24:57 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9025:25df:a21:bcfb])
        by smtp.gmail.com with ESMTPSA id ot17sm11593682pjb.50.2021.04.03.20.24.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 20:24:56 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][dunfell][PATCH] wireguard: fix build issue with updated 5.4 kernel
Date: Sat,  3 Apr 2021 20:24:55 -0700
Message-Id: <20210404032455.22904-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

 error: static declaration of 'icmp_ndo_send' follows non-static declaration
 |   959 | static inline void icmp_ndo_send(struct sk_buff *skb_in, int type, int code, __be32 info)
 |       |                    ^~~~~~~~~~~~~

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...send-functions-were-backported-exten.patch | 32 +++++++++++++++++++
 .../wireguard-module_1.0.20200401.bb          |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_send-functions-were-backported-exten.patch

diff --git a/meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_send-functions-were-backported-exten.patch b/meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_send-functions-were-backported-exten.patch
new file mode 100644
index 00000000000..f01cfe4e1c5
--- /dev/null
+++ b/meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_send-functions-were-backported-exten.patch
@@ -0,0 +1,32 @@
+From 122f06bfd8fc7b06a0899fa9adc4ce8e06900d98 Mon Sep 17 00:00:00 2001
+From: "Jason A. Donenfeld" <Jason@zx2c4.com>
+Date: Sun, 7 Mar 2021 08:14:33 -0700
+Subject: [PATCH] compat: icmp_ndo_send functions were backported extensively
+
+Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
+
+Upstream-Status: Backport
+
+Fixes build with 5.4.103 update.
+/include/linux/icmpv6.h:56:6: note: previous declaration of 'icmpv6_ndo_send' was here
+|    56 | void icmpv6_ndo_send(struct sk_buff *skb_in, u8 type, u8 code, __u32 info);
+
+Signed-of-by: Armin Kuster <akuster808@gmail.com>
+
+---
+ src/compat/compat.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: src/compat/compat.h
+===================================================================
+--- src.orig/compat/compat.h
++++ src/compat/compat.h
+@@ -946,7 +946,7 @@ static inline int skb_ensure_writable(st
+ }
+ #endif
+ 
+-#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0)
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0) && LINUX_VERSION_CODE >= KERNEL_VERSION(5, 5, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 102) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 178) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 223) && LINUX_VERSION_CODE > KERNEL_VERSION(4, 10, 0)) || LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 259) || defined(ISRHEL8) || defined(ISUBUNTU1804)
+ #if IS_ENABLED(CONFIG_NF_NAT)
+ #include <linux/ip.h>
+ #include <linux/icmpv6.h>
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
index e8891c4428a..6ed988bafa2 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
@@ -3,7 +3,8 @@ require wireguard.inc
 SRCREV = "43f57dac7b8305024f83addc533c9eede6509129"
 
 SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat \
-           file://0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch"
+           file://0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch \
+           file://0001-compat-icmp_ndo_send-functions-were-backported-exten.patch "
 
 inherit module kernel-module-split
 
-- 
2.17.1

