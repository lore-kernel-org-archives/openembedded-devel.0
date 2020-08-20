Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.121981.1597962054328084593
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 15:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LMmejzL1;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id y6so1688235plt.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2020 15:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dz659l++E0aAljjJ2pbv71JMLPB68PDoo4VBdxBKdu4=;
        b=LMmejzL13+RSmesV6jr2aWtdYDEByUgsQFhkQdZ3KGLPYZBEz9kc1qrtjarKwOeP9c
         XqvVAebEvKOHQusqjyU7tsIoxQ/SLGTtqUD++BXO1nl2S669RFVtf6iw7vaIZAomawIS
         K2G9oU44LGkq/xu+O/wjTRRWi+RGGHYmUaqxWYGVUQSdrPGVBUx8zGu4ChJ4awjf8ZB9
         6jwlNOTLYXVTn2CEBaHMRlPagBRXvLeZ3ppj/kmBXgthQUIILF1IAbBW78SRu9FmDuSG
         JaDGCT66+BeGJo6hcZ/Tw0j1KTRNLuzY//miINXeYGQ5wRcQIeTe9XWvbQxeB+72JRM/
         b7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dz659l++E0aAljjJ2pbv71JMLPB68PDoo4VBdxBKdu4=;
        b=bne2CC5bU/97FP8/FjLnH5VZKBeSZkKJBSE4b2NMtiqLgDU3idLzOP5fldWw84okvz
         Mw31c1dUoSkI2p476iLpOW1gipvTsOC4u3K/0pvNbbSlrBRxAKqsNf/grw1LS42HTtUi
         x8e6SdsfGodLjPJ5lWbHO1lWcFRHjKNhYz4Wrrb70RiVQBbpCGVG7Ztt/2Lanye1Ehmn
         woLuP7wUbqIwBWjIBaVDMkqI57rS/dtxwXVwCYt+II80fSzRly4t3F+dE+9UtSiVngzD
         a5rH11oMuEyLLN5MaX/uVzI4URwM8o0L2VvCv1m6C57etnJvJCHPtT/I8XXGbPCneu/U
         xIYA==
X-Gm-Message-State: AOAM533VZ7tKw5Y5cksPpI2AKsHbxlPo9ZgqBOBatL5ffP22GjjqnVIB
	3VtCfrFyyE2r944bSMo0Pe8gj31Fx6pzog==
X-Google-Smtp-Source: ABdhPJyn+9ICBUP2ZxXRRc6p1vkwNRcM4aK09Q7+W+V+n2aMBIVipGilhOTtQlVP+QAzF3oDbenmWQ==
X-Received: by 2002:a17:902:b115:: with SMTP id q21mr390624plr.191.1597962053319;
        Thu, 20 Aug 2020 15:20:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id q66sm61849pjq.17.2020.08.20.15.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 15:20:52 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] wireguard-module: Exlude from world builds
Date: Thu, 20 Aug 2020 15:20:49 -0700
Message-Id: <20200820222050.1300359-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moving beyond kernel 5.6, this kmod is not needed and core has moved the
reference kernel to 5.8 for reference machines

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../wireguard/wireguard-module_1.0.20200712.bb               | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200712.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200712.bb
index bc94e29ea3..3a83e48eea 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200712.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200712.bb
@@ -33,3 +33,8 @@ module_do_install() {
     install -m 0644 ${MODULE_NAME}.ko \
     ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}/${MODULE_NAME}.ko
 }
+
+# WireGuard has been merged into Linux kernel >= 5.6 and therefore this compatibility module is no longer required.
+# OE-core post dunfell has moved to use kernel 5.8 which now means we cant build this module in world builds
+# for reference machines e.g. qemu
+EXCLUDE_FROM_WORLD = "1"
-- 
2.28.0

