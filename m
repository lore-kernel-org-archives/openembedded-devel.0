Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A933AC38A02
	for <webhook@archiver.kernel.org>; Sat, 29 Oct 2022 14:32:18 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.3726.1667053930343982802
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Oct 2022 07:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CZ2aTNrQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id l9so5173294qkk.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 07:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zVb6VS3s9Bk3ghBIgkImzE1pc/qfBnd+sTEKI66DEmo=;
        b=CZ2aTNrQHzE/IqT8/bDRYdfd5v4xfzM3KoOXZe5NpC5ybGE37GNisQsIIfz666DoQq
         qxlsJVdK5WpPSLFECM2x7WJhG2FjGqTZfj//EfSBRE/wLHMbLJmZS+/cdlbRKyOrTaa3
         OGtGifE/od/Vr/GeY5iMtx5dWD/pMZiX90ZSKPiPWSOAo3aRiOcTkMFN9B7XHC4W7iqI
         Sa+Y4JhkP23svtSD6pcrCYkVn1CyI63/Lu+KIYUqsliXZnXx1UZ3vy6RHB8AiYgqlf1v
         p6qmZsMXkLySC39oB6X5o3E7lKj2JCTHq9pQmP9CWLxNYrmcA25RFmK49PiclQqPuv29
         XDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVb6VS3s9Bk3ghBIgkImzE1pc/qfBnd+sTEKI66DEmo=;
        b=lrOHBPKxpjpMvDkmSJdak188pPNTP71y2X+7B3Z627z0LKDWJ1vPfzpVsd2gX+RF5B
         YWxe/fLd4xY69Y4NT8CMSMAuPs+2iXsNvYBCvitkw9vNHTKek3Sf89JGdtzlEhZikryu
         dhbI1kIOkYPK3fkgMdmaAG5QmEikvP9jmsTFuWcFuNI8B+FHQXfFOQPz/iT7lVdu2w3U
         fcVPwB4FqyOFiW+d1sm+8QVY0rvTu/35xZJbKfdPikBXMNhF0TWOfkBJtUr09QOAD9A5
         eh9MohtyM5T3+Z4VxThHcsYvY3pFcFxExrr6zD8WxgSvilxqHH0OcTbjkTmc77cCVCWP
         o/Hw==
X-Gm-Message-State: ACrzQf2JRFClYh8qeeG/1cGoWIVxhP/dndkGBS74rFXVIIRDCfqS8P+k
	vaMUVi3IlY/SW4a6E8+yMb8SZspr/XQ=
X-Google-Smtp-Source: AMsMyM4w1BknWPDDGt1nJI4UNVt633n2HYAtp/fwbSU4NSw/+CcrNZUw1vbLlKiGng2qIjVaZ14EkA==
X-Received: by 2002:a05:620a:f11:b0:6cf:be4e:e953 with SMTP id v17-20020a05620a0f1100b006cfbe4ee953mr3196321qkl.437.1667053928961;
        Sat, 29 Oct 2022 07:32:08 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:30da:70b2:60a2:47d8])
        by smtp.gmail.com with ESMTPSA id o17-20020a05620a229100b006ed30a8fb21sm1143689qkh.76.2022.10.29.07.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 07:32:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin Finck <c.finck@enlyze.com>
Subject: [meta-oe][dunfell][PATCH] [dunfell] wireguard: Upgrade to 1.0.20220627 (module) and 1.0.20210914 (tools)
Date: Sat, 29 Oct 2022 10:32:07 -0400
Message-Id: <20221029143207.181183-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 14:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99340

From: Colin Finck <c.finck@enlyze.com>

Quoting Jason A. Donenfeld on IRC:

<zx2c4> Colin_Finck: you should never, ever use old versions
<zx2c4> Notice that neither the major nor minor version numbers change
<zx2c4> Use the latest versions on your LTS

With that definite answer, I'd like to fix the problem described in https://lore.kernel.org/yocto/CswA.1659543156268567471.pbrp@lists.yoctoproject.org/ by importing the latest versions instead of maintaining our own fork of wireguard 1.0.20200401.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...NC_-START-END-were-backported-to-5.4.patch | 29 -----------------
 ...send-functions-were-backported-exten.patch | 32 -------------------
 .../wireguard-module_1.0.20200401.bb          | 30 -----------------
 .../wireguard-module_1.0.20220627.bb          | 23 +++++++++++++
 ...319.bb => wireguard-tools_1.0.20210914.bb} |  4 +--
 5 files changed, 25 insertions(+), 93 deletions(-)
 delete mode 100644 meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch
 delete mode 100644 meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_send-functions-were-backported-exten.patch
 delete mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
 create mode 100644 meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_1.0.20200319.bb => wireguard-tools_1.0.20210914.bb} (84%)

diff --git a/meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch b/meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch
deleted file mode 100644
index a9dc9dc2b7..0000000000
--- a/meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From ce8faa3ee266ea69431805e6ed4bd7102d982508 Mon Sep 17 00:00:00 2001
-From: "Jason A. Donenfeld" <Jason@zx2c4.com>
-Date: Thu, 12 Nov 2020 09:43:38 +0100
-Subject: [PATCH] compat: SYM_FUNC_{START,END} were backported to 5.4
-
-Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
-
-Upstream-Status: Backport
-Fixes build failure in Dunfell.
-
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
----
- compat/compat-asm.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: src/compat/compat-asm.h
-===================================================================
---- src.orig/compat/compat-asm.h
-+++ src/compat/compat-asm.h
-@@ -40,7 +40,7 @@
- #undef pull
- #endif
- 
--#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 5, 0)
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 76)
- #define SYM_FUNC_START ENTRY
- #define SYM_FUNC_END ENDPROC
- #endif
diff --git a/meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_send-functions-were-backported-exten.patch b/meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_send-functions-were-backported-exten.patch
deleted file mode 100644
index f01cfe4e1c..0000000000
--- a/meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_send-functions-were-backported-exten.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 122f06bfd8fc7b06a0899fa9adc4ce8e06900d98 Mon Sep 17 00:00:00 2001
-From: "Jason A. Donenfeld" <Jason@zx2c4.com>
-Date: Sun, 7 Mar 2021 08:14:33 -0700
-Subject: [PATCH] compat: icmp_ndo_send functions were backported extensively
-
-Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
-
-Upstream-Status: Backport
-
-Fixes build with 5.4.103 update.
-/include/linux/icmpv6.h:56:6: note: previous declaration of 'icmpv6_ndo_send' was here
-|    56 | void icmpv6_ndo_send(struct sk_buff *skb_in, u8 type, u8 code, __u32 info);
-
-Signed-of-by: Armin Kuster <akuster808@gmail.com>
-
----
- src/compat/compat.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: src/compat/compat.h
-===================================================================
---- src.orig/compat/compat.h
-+++ src/compat/compat.h
-@@ -946,7 +946,7 @@ static inline int skb_ensure_writable(st
- }
- #endif
- 
--#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0)
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0) && LINUX_VERSION_CODE >= KERNEL_VERSION(5, 5, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 102) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 178) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 223) && LINUX_VERSION_CODE > KERNEL_VERSION(4, 10, 0)) || LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 259) || defined(ISRHEL8) || defined(ISUBUNTU1804)
- #if IS_ENABLED(CONFIG_NF_NAT)
- #include <linux/ip.h>
- #include <linux/icmpv6.h>
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
deleted file mode 100644
index 9215f4a6d8..0000000000
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-require wireguard.inc
-
-SRCREV = "43f57dac7b8305024f83addc533c9eede6509129"
-
-SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat;branch=master \
-           file://0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch \
-           file://0001-compat-icmp_ndo_send-functions-were-backported-exten.patch "
-
-inherit module kernel-module-split
-
-DEPENDS = "virtual/kernel libmnl"
-
-# This module requires Linux 3.10 higher and several networking related
-# configuration options. For exact kernel requirements visit:
-# https://www.wireguard.io/install/#kernel-requirements
-
-EXTRA_OEMAKE_append = " \
-    KERNELDIR=${STAGING_KERNEL_DIR} \
-    "
-
-MAKE_TARGETS = "module"
-
-RRECOMMENDS_${PN} = "kernel-module-xt-hashlimit"
-MODULE_NAME = "wireguard"
-
-module_do_install() {
-    install -d ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}
-    install -m 0644 ${MODULE_NAME}.ko \
-    ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}/${MODULE_NAME}.ko
-}
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb
new file mode 100644
index 0000000000..df2db15349
--- /dev/null
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20220627.bb
@@ -0,0 +1,23 @@
+require wireguard.inc
+
+SRCREV = "18fbcd68a35a892527345dc5679d0b2d860ee004"
+
+SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat;protocol=https;branch=master"
+
+inherit module kernel-module-split
+
+DEPENDS = "virtual/kernel libmnl"
+
+# This module requires Linux 3.10 higher and several networking related
+# configuration options. For exact kernel requirements visit:
+# https://www.wireguard.io/install/#kernel-requirements
+
+EXTRA_OEMAKE_append = " \
+    KERNELDIR=${STAGING_KERNEL_DIR} \
+    "
+
+MAKE_TARGETS = "module"
+MODULES_INSTALL_TARGET = "module-install"
+
+RRECOMMENDS_${PN} = "kernel-module-xt-hashlimit"
+MODULE_NAME = "wireguard"
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
similarity index 84%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
index 9e486ecc34..b63ef88182 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
@@ -1,6 +1,6 @@
 require wireguard.inc
 
-SRCREV = "a8063adc8ae9b4fc9848500e93f94bee8ad2e585"
+SRCREV = "3ba6527130c502144e7388b900138bca6260f4e8"
 SRC_URI = "git://git.zx2c4.com/wireguard-tools;branch=master"
 
 inherit bash-completion systemd pkgconfig
@@ -9,7 +9,7 @@ DEPENDS += "wireguard-module libmnl"
 
 do_install () {
     oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
-        SYSTEMDUNITDIR="${systemd_unitdir}" \
+        SYSTEMDUNITDIR="${systemd_system_unitdir}" \
         WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'yes', '', d)} \
         WITH_BASHCOMPLETION=yes \
         WITH_WGQUICK=yes \
-- 
2.25.1


