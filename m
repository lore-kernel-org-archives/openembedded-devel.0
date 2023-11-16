Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA10BC54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 14:06:58 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.7282.1700143610983541612
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 06:06:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WAVJLwt4;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-507a3b8b113so1207693e87.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 06:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700143608; x=1700748408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PQR7iesMeA2MEm484bQd65xjxAtiQRKsUvRKwnZpg74=;
        b=WAVJLwt4b22VveXSa8EqGWNQsV2RaAmm8NEehAVHaF6EGQh1fRaVcxIBthrvUJeUjk
         ket5IxRG6A3LMMmQ4uxs7eOFbHtNDs8p8g3g23b0a8jKnsMQEazQNCF3pVAwus+RXffJ
         cjNNhdxpheeVKQ0TR4mDHNZ6zFJfIgJMNnuvJXiDku4Vi5r3lu9cwVjjGn4pmHzYUrtM
         kdQmw6uuhsBOSCBXKiAyIr9U7fwaaSLUJjdS0Wi7ZZn737XzZpwXbD61+TAwHguqQAMT
         sigMxVpcpuBw4RywfEAnyjtOb8gPlgeLPwVxZ8GZ1jRscLIejFJm45NQEZILQFEUADBS
         9jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700143608; x=1700748408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQR7iesMeA2MEm484bQd65xjxAtiQRKsUvRKwnZpg74=;
        b=qcZ6KFyCP5esJ1JP63ftdRaYBMokJ/vKLYv2oQryvXXkzZPFa4plX6OUePuhx8gIUO
         BEuxDVMg+Nv8TXmKRmSNYwoY20buerJJwq9pVQc70klvoTuMLO6HF8O9AKBaqK7H+XhY
         56po6tPbUOoMFCp8krKdkAduTk4uBCPHpyUAXofLzqtINfcaYxpXo+OiOpUojBNNoo1m
         3pO6YcGhrkwuTNfPiihFfqBQckm8dYc2FYCA6JM3OFrsk4nBC61Wbi3b0gHCIfrq0Ogn
         b2VacrvH/5Qd+fTXHP4RPFFAu/D2z3Zpm6zTH6f9SbmcCU5XqI3q0bf25VTEynTNhTvP
         JR2g==
X-Gm-Message-State: AOJu0Yw/yaQXmUSvOZDamumw9GHO8pZ4BhfdF/UcGGYKOyCHZS33gn8a
	JnEfvQ/7oRJtshLDc7omM5pMTS74qL8IjQ==
X-Google-Smtp-Source: AGHT+IHI4EYJJUCOsKjGVIAplKZq4Oecuwfey+wZTwQEKhMwfMOfNcS1gj9ZD62CZV3E5PLups7F+A==
X-Received: by 2002:a05:6512:70d:b0:503:3787:f75a with SMTP id b13-20020a056512070d00b005033787f75amr10521428lfs.62.1700143608194;
        Thu, 16 Nov 2023 06:06:48 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id d2-20020a50f682000000b00546cf67c348sm8037298edn.59.2023.11.16.06.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 06:06:47 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] botan: upgrade 2.19.3 -> 3.2.0
Date: Thu, 16 Nov 2023 17:06:03 +0300
Message-Id: <20231116140603.1063254-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 14:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106816

License-Update: Copyright year updated.

Changelog:

https://botan.randombit.net/news.html#version-3-0-0-2023-04-11
https://botan.randombit.net/news.html#version-3-1-0-2023-07-11
https://botan.randombit.net/news.html#version-3-1-1-2023-07-13
https://botan.randombit.net/news.html#version-3-2-0-2023-10-09

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../botan/{botan_2.19.3.bb => botan_3.2.0.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-crypto/botan/{botan_2.19.3.bb => botan_3.2.0.bb} (83%)

diff --git a/meta-oe/recipes-crypto/botan/botan_2.19.3.bb b/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
similarity index 83%
rename from meta-oe/recipes-crypto/botan/botan_2.19.3.bb
rename to meta-oe/recipes-crypto/botan/botan_3.2.0.bb
index 8d9d423ce..5eff2d383 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.19.3.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Crypto and TLS for C++11"
 HOMEPAGE = "https://botan.randombit.net"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://license.txt;md5=f4ce98476c07c34e1793daa036960fad"
+LIC_FILES_CHKSUM = "file://license.txt;md5=f5254d3abe90ec5bb82c5694ff751546"
 SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
-SRC_URI[sha256sum] = "dae047f399c5a47f087db5d3d9d9e8f11ae4985d14c928d71da1aff801802d55"
+SRC_URI[sha256sum] = "049c847835fcf6ef3a9e206b33de05dd38999c325e247482772a5598d9e5ece3"
 
 S = "${WORKDIR}/Botan-${PV}"
 
@@ -40,7 +40,7 @@ do_compile() {
 }
 do_install() {
 	oe_runmake install
-	sed -i -e "s|${D}||g" ${D}${libdir}/pkgconfig/botan-2.pc
+	sed -i -e "s|${D}||g" ${D}${libdir}/pkgconfig/botan-3.pc
 }
 
 PACKAGES += "${PN}-python3"
-- 
2.25.1


