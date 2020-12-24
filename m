Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.3572.1608847960840725126
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Dec 2020 14:12:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DhpvKpIq;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id l23so1772779pjg.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Dec 2020 14:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=PdkrB6lL4ltmr5OUb91oj05qMCMPw8U5taqBAthZEqw=;
        b=DhpvKpIqmgGXjbW2EWCZUaHrSwmnlzU/V4MU7WTOwPUuWezMs0InP7zY9+UdJTokss
         S/jVtT85lWrXjNBsdy4uswhAien42Q9+957V36IsSwx6pZWdKvyIqzajuz++rQ/MNeMf
         rZqjxlZ7OtnvA3un1s0E4kkNNCh9W84ehM3qjrAZ/2gkP9NHocKuznGzPi1cN9pPYkN1
         9oZ1iBhdhO2OXCrgJQoWrz1iAaVTfoROOf6lPF0KPV1h4eRyj1GNZdKlrW7p8FrHj+qD
         YJ1Pv1PoZTKQw14tvYtDlsSmRD5yQnRj6fCj+N2pojvbVDrWkItQA1PW4tc7PICGIvBT
         y13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=PdkrB6lL4ltmr5OUb91oj05qMCMPw8U5taqBAthZEqw=;
        b=VnPVS2Z8uQw/Aqy5Dtp4A8WUpOAACUOnB5iCT1e2SOhMLmU0KqYjqDpt29MbH1w0Hn
         AqM5R2Sqokk6bpwaFBXnlevp+B/qM+uDZjzRKS4/hfTmdHYcxi912UiSl2hL2suJbDXc
         jz2kgmGGnypcLCv10/ncAbBLyo/oUb5cCNVuOD9J2lO92DGDeoRfnOXNSIxO3zn6TVeL
         uKBZIN0rBZ1gLSPdZtL2PHEHABV0aD+rWKbHspdEAciSY2dPv+pnYXP5BcnpL/T/dJlo
         LjhgP41cRDflBqqi3V3EhYUvcAN825ZMxiWujTDW+HB+Ac9DiurKdjOM7jzy9lVj9PYS
         ZUVg==
X-Gm-Message-State: AOAM531jPLJDBcgB1F2O34MZBj4B/PmmA40lkaA47na/WcECnBi7ABMV
	VIs7sl5158s3PHz9hvu7ncrRA8evKiz73Q==
X-Google-Smtp-Source: ABdhPJz3KBTdU4KEQsYfR3GupnRhBUHFiYjemlk7xR5fhuv3J3hI75Vo73F4KYk/9LDm6lwK3uMf4Q==
X-Received: by 2002:a17:90a:ce0c:: with SMTP id f12mr6160270pju.89.1608847960157;
        Thu, 24 Dec 2020 14:12:40 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:164:fbbe:2531:3c5b])
        by smtp.gmail.com with ESMTPSA id 68sm1198392pfe.33.2020.12.24.14.12.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 14:12:39 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell][meta-networking] wireguard-module: fix build issue with 5.4 kernel
Date: Thu, 24 Dec 2020 14:12:38 -0800
Message-Id: <20201224221238.26810-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

 /tmp/work/qemux86_64-poky-linux/wireguard-module/1.0.20200401-r0/git/src/compat/compat-asm.h:44: warning: "SYM_FUNC_START" redefined
|    44 | #define SYM_FUNC_START ENTRY
|       |
| In file included from /tmp/work/qemux86_64-poky-linux/wireguard-module/1.0.20200401-r0/git/src/compat/compat-asm.h:9,
|                  from <command-line>:
| /tmp/work-shared/qemux86-64/kernel-source/include/linux/linkage.h:218: note: this is the location of the previous definition
|   218 | #define SYM_FUNC_START(name)    \
|       |
| In file included from <command-line>:
| /tmp/work/qemux86_64-poky-linux/wireguard-module/1.0.20200401-r0/git/src/compat/compat-asm.h:45: warning: "SYM_FUNC_END" redefined
|    45 | #define SYM_FUNC_END ENDPROC
|       |

Backporit fix from upstream

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...NC_-START-END-were-backported-to-5.4.patch | 29 +++++++++++++++++++
 .../wireguard-module_1.0.20200401.bb          |  3 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch

diff --git a/meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch b/meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch
new file mode 100644
index 00000000000..a9dc9dc2b7f
--- /dev/null
+++ b/meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch
@@ -0,0 +1,29 @@
+From ce8faa3ee266ea69431805e6ed4bd7102d982508 Mon Sep 17 00:00:00 2001
+From: "Jason A. Donenfeld" <Jason@zx2c4.com>
+Date: Thu, 12 Nov 2020 09:43:38 +0100
+Subject: [PATCH] compat: SYM_FUNC_{START,END} were backported to 5.4
+
+Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
+
+Upstream-Status: Backport
+Fixes build failure in Dunfell.
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+---
+ compat/compat-asm.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: src/compat/compat-asm.h
+===================================================================
+--- src.orig/compat/compat-asm.h
++++ src/compat/compat-asm.h
+@@ -40,7 +40,7 @@
+ #undef pull
+ #endif
+ 
+-#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 5, 0)
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 76)
+ #define SYM_FUNC_START ENTRY
+ #define SYM_FUNC_END ENDPROC
+ #endif
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
index 73199592c88..45324c02a16 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
@@ -2,7 +2,8 @@ require wireguard.inc
 
 SRCREV = "43f57dac7b8305024f83addc533c9eede6509129"
 
-SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat"
+SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat \
+           file://0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch"
 
 inherit module kernel-module-split
 
-- 
2.17.1

