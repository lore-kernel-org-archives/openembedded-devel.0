Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.25702.1613351623886876907
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 17:13:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kQlX0PG7;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id s15so2812931plr.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 17:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=oH9OiCIInnk5qLsd2DbwjK7KOGVnS0BMCsfLmSIo7Cs=;
        b=kQlX0PG7P8NSMC2W6gO3cpbfULi99lt5IcHgpFJbmz8KWOOPe1W9+oLejNaKknXUFj
         ZkKo9j0wJsKD8BHWhygCgNPtyMw8D5YVQhqatRfxdDWKzq7tdtPdugl4cvGUz7VXLtua
         xkYKRJhM6Fv/OOVtK3y55tKq/+yVSqkKPUAvLD7Z+3Yj6+yZTDCTPD6peHQyaBQSmoR0
         pUzBXHt2czHSUVXHHACxOfz2L+3EWpCI3cy5jYUcK4k4ao97tQWm/1klhwe1RH9Ghou/
         2+am2NWLKX4NPERUbT+n8wSuYS5JMBR9AH4WyxkzEx0Pjvfcp1uOtwdWSsaeJhq0FtNG
         nLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=oH9OiCIInnk5qLsd2DbwjK7KOGVnS0BMCsfLmSIo7Cs=;
        b=ZhLgZqB+yc8o6rWZB6MQU437Urd8C+Ty9vfL/PO5Nlc1mCDNM8NzcgorIygafM2Kbv
         V61/IBHgipjid7ZRQtNeCMfOMf0ChF6UaPT2jxKGAWbEt+Tvg+xXXAZhbEHsgXrtwKK/
         7q4066ISFJEsM1BA4L3NEq1rI9hDaPoqyNC3wRtNOiVFP/a0MXeD5GHpmlAIaIG5ilui
         81awNCmNToLneSo7ybjbHwWWCDSmLVeOY4zpSQFrKbQz5ihA5R49L3hd+vHl6lvbSiVv
         SL/5XAam84jGBdbLRVblpP2kmFhhnojIWwQOpIaaRM7Dmj2qr0l911UvBI/hO0Tgfiah
         TtZQ==
X-Gm-Message-State: AOAM530gAtbtWWJhJqpTi/XAnPfn6uIBmtMnvV5wgP4VxfxB3ALymiMB
	aCYRNG3kM0dD4CtAVEXvuKCrbPTIOftCSw==
X-Google-Smtp-Source: ABdhPJwUA1sX0EKxCAGX/z+ZSYnqM/HvZ/8NKinUVgAxDHrKOsiibV6hthcld+MU5lClGG1wmB2MUg==
X-Received: by 2002:a17:90b:410d:: with SMTP id io13mr13702281pjb.165.1613351623320;
        Sun, 14 Feb 2021 17:13:43 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id t1sm16077998pfl.194.2021.02.14.17.13.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:13:43 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 11/15] wireguard-module: remove PKG assignment
Date: Sun, 14 Feb 2021 17:13:25 -0800
Message-Id: <f9502868169715ee4945f5d8bef7c845dbb7b9e0.1613349480.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613349480.git.akuster808@gmail.com>
References: <cover.1613349480.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* it's not clear why it was added in first place and it's causing issues since:
  "package: get_package_mapping: avoid dependency mapping if renamed package provides original name"
  commit in oe-core as discussed in:
  https://lists.openembedded.org/g/openembedded-core/message/143672
  https://github.com/openembedded/meta-openembedded/issues/285

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 304f660f880bdf7dd5c51695875ab0a73aaed8b2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireguard/wireguard-module_1.0.20200908.bb             | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200908.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200908.bb
index 4e3f3deca3..20fa533455 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200908.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200908.bb
@@ -21,13 +21,6 @@ MAKE_TARGETS = "module"
 RRECOMMENDS_${PN} = "kernel-module-xt-hashlimit"
 MODULE_NAME = "wireguard"
 
-# Kernel module packages MUST begin with 'kernel-module-', otherwise
-# multilib image generation can fail.
-#
-# The following line is only necessary if the recipe name does not begin
-# with kernel-module-.
-PKG_${PN} = "kernel-module-${MODULE_NAME}"
-
 module_do_install() {
     install -d ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}
     install -m 0644 ${MODULE_NAME}.ko \
-- 
2.17.1

