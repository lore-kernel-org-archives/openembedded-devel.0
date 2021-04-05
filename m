Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.5841.1617634483904948212
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LcI4XKnA;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id y2so5784041plg.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=J/i/fTvhFSMC2MqtcSZ83WoOXc74m4EQ1iNbVTvF4cU=;
        b=LcI4XKnABPbcigN97TjvQhM2hrHNrJPK0S179DLekyZe0n3+vTFeLfxolvO2XeeWNS
         hloespYqC7xeqW8W18rzvjRJ3I9e2D2+SSSMbdrI9q6R/kGCv+AUJ6RwA3E2Msww3d/2
         yE5oGZW5Sy4PirzK6KNxIQ4bl0mY9axXFhwFCy0kug6VhhkD664gRihyjHmrNKkHFFvL
         dumFo1EQSSu39bStPchs0D6/msdGQWeKXPo1KAShJeCV7IcfAx1EOsAL+SxIV/B0kEXL
         oJyXSp55skHakyrveJUjdym7B2L5fKzYyu7D/eqQSmN6BuH4HM+IO8uPTrPlxMkP2BCj
         xKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=J/i/fTvhFSMC2MqtcSZ83WoOXc74m4EQ1iNbVTvF4cU=;
        b=PHKLZ7rFwrhXrwqrEdA/d2FGcdp5RsAOjLTa3BuK5LDuRK/D3fPJF26uCBFTj1pb5R
         O+oyRotlZCiZkqn8Yr0A74i/XTn45LBzUPceLjRufukFvOTrXxqRrE/52ySRZDBwdsPm
         6EsDxWw9ZwDRNLRMJKI2lcXHnmfWETCwPivH+K5viFJmKfGLNXy3kdRVGpf1xHN66sj2
         6fIGZ2r99oL0Urn6hBreGXv75fZoJ34Q19ZuTcKzooqoyj/C7FNpdSq0xPL01yVDz0pZ
         X/5R55GBtAvFxkvqqHA39SKLIN5MO+N6qhFCjAG+FAh5iZB2bTm6KUBPtNabvVeJOviD
         L7Qg==
X-Gm-Message-State: AOAM530NS0FpLDcCrw6uZWFLcUXeN+u1YpI/qYqJLZcze3ibiJRtPK0/
	kC6rzzs2OM81sK/LyQiM+iFi+keyoyU=
X-Google-Smtp-Source: ABdhPJzrpZDyw86NHckBCH47hKBrEXoG10JyJK4UHCWmSlcf5cSEf1jKYmGCEYwOcvVXXI93L4XTvw==
X-Received: by 2002:a17:90b:3114:: with SMTP id gc20mr3716816pjb.123.1617634483295;
        Mon, 05 Apr 2021 07:54:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:cb2:3225:c999:3d47])
        by smtp.gmail.com with ESMTPSA id k11sm16501654pjs.1.2021.04.05.07.54.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:42 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Dunfell patch review 11/11] wireguard: fix build issue with updated 5.4 kernel
Date: Mon,  5 Apr 2021 07:54:24 -0700
Message-Id: <6b299a2efc9d34ce650907d2fbd6a4d8edaaca32.1617634345.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617634345.git.akuster808@gmail.com>
References: <cover.1617634345.git.akuster808@gmail.com>

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

