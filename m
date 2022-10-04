Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DA4C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 05:27:55 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.7381.1664861272364081261
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 22:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hO5mVu6c;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id u10so19460157wrq.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 22:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=fmBdStii50m/e+vwxiA0WmkFq1AcGh3RAr65vktTlS8=;
        b=hO5mVu6cyrWOMUf+FcyC5ANk7LP0xLKCxYLEEV7pvFTmPcPVdYyUiVQgHSNP9cppsn
         szyevDigPLSh6ai6NXmFrJvhwijdzYDlXQWbxbhm70kHkFF03pfCM4XJPrZL3n9VMNEA
         hH4IfUO9V6u/N22ommd/MeNmOcPI3ZkZUVT6Cy0+r3WBMku4z47JNDCk1QpOfHttSEM1
         Z9gucsIPAUHlZC5flCgdZ5FtA5v3OaXN5ZfxHumNNyHJNMdGG7U1RekSpXsLNaPvdksh
         pfiKm/g9lDeR3jlgZRid9xIQ9FhoAMEoTnD26x64r3JcUIx+zffDWFLomWXLEm5hfLbU
         upuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=fmBdStii50m/e+vwxiA0WmkFq1AcGh3RAr65vktTlS8=;
        b=oCyj76JQES31UF1QEw4oiktd/cSO6cQ4Tsm+W5X+OYj9nhhFAfNNFaTcKbt7V8FuR0
         Gv7cCo7gyXK71f/VklesxKtkCXPe3kDC40nv404McqN6wdA6bBd7+nMYb0YPx13hSJtz
         J0wNVtIyyfn8JKeY64TaU3hw5bNu+Aab+pNrRT2t5I94qEKtau6zPIUCfXQJgYQQvkeR
         uqQ0BFl3jWu4MQY0S8FHVFuHYlA6IjTaJQGrg5gqxvXrUOzWWFwQlLXVDkbgqSwQm6Yr
         BeFTkeO3vyIPfQPBuVm7bgdlyCTtWhOAaIpUd2nD/ey9iZ/VBWMXOHQbeTfisQJ5Wphh
         dHRw==
X-Gm-Message-State: ACrzQf33AdX9JixMsqYtvn5n4giOyBRixQ5qLkiOBYWtyZjyNRaxcuKL
	7lI52+YryzTd6qLGO+0GLKDuHebdru5wHQ==
X-Google-Smtp-Source: 
 AMsMyM5Wkxu5OcejNvlZArs53fw8z8jb/YCRsp0c7OD92QG5mdcumQjivHQNpuqh/OjPCtN5wld7Kw==
X-Received: by 2002:a5d:4b8b:0:b0:22e:4185:bcc7 with SMTP id
 b11-20020a5d4b8b000000b0022e4185bcc7mr3951572wrt.174.1664861270459;
        Mon, 03 Oct 2022 22:27:50 -0700 (PDT)
Received: from developer.localdomain
 (dslb-002-205-007-169.002.205.pools.vodafone-ip.de. [2.205.7.169])
        by smtp.gmail.com with ESMTPSA id
 f15-20020a05600c490f00b003a2e92edeccsm17611010wmp.46.2022.10.03.22.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 22:27:50 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <v.yurkov@precitec.de>
Subject: [meta-networking][PATCH] opcua: Add new recipe
Date: Tue,  4 Oct 2022 07:27:07 +0200
Message-Id: <20221004052707.1499760-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Oct 2022 05:27:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99046

From: Vyacheslav Yurkov <v.yurkov@precitec.de>

open62541 (http://open62541.org) is an open source and free implementation
of OPC Unified Architecture according to IEC62541 standard

The patch exclude git-related files from installation directory
Upstream-Status: Accepted
https://github.com/open62541/open62541/commit/a0328d4cb527f9778a262fc4a6b42bfbdffc38e9

Signed-off-by: Vyacheslav Yurkov <v.yurkov@precitec.de>
---
 ...1-fix-build-do-not-install-git-files.patch | 22 +++++++++++
 .../opcua/open62541_1.3.3.bb                  | 38 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/opcua/open62541/0001-fix-build-do-not-install-git-files.patch
 create mode 100644 meta-networking/recipes-protocols/opcua/open62541_1.3.3.bb

diff --git a/meta-networking/recipes-protocols/opcua/open62541/0001-fix-build-do-not-install-git-files.patch b/meta-networking/recipes-protocols/opcua/open62541/0001-fix-build-do-not-install-git-files.patch
new file mode 100644
index 000000000..44ee7b92c
--- /dev/null
+++ b/meta-networking/recipes-protocols/opcua/open62541/0001-fix-build-do-not-install-git-files.patch
@@ -0,0 +1,22 @@
+From a490e82dca5a669b0af27a13d74759d8f77e2333 Mon Sep 17 00:00:00 2001
+From: Vyacheslav Yurkov <v.yurkov@precitec.de>
+Date: Mon, 3 Oct 2022 18:25:15 +0200
+Subject: [PATCH] fix(build): do not install git files
+
+Signed-off-by: Vyacheslav Yurkov <v.yurkov@precitec.de>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1934374e..bc5c8bad 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1703,6 +1703,7 @@ install(DIRECTORY ${UA_install_tools_dirs}
+     FILES_MATCHING
+     PATTERN "*"
+     PATTERN "*.pyc" EXCLUDE
++    PATTERN ".git*" EXCLUDE
+     )
+ 
+ install(FILES ${UA_install_tools_files} DESTINATION ${open62541_install_tools_dir})
diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.3.3.bb b/meta-networking/recipes-protocols/opcua/open62541_1.3.3.bb
new file mode 100644
index 000000000..317697262
--- /dev/null
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.3.3.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "open62541 is an implementation of OPC UA (OPC Unified Architecture)"
+HOMEPAGE = "https://github.com/open62541/open62541.git"
+LICENSE = "MPL-2.0 & BSD-3-Clause & MIT"
+LIC_FILES_CHKSUM = "\
+    file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad \
+    file://deps/mdnsd/LICENSE;md5=3bb4047dc4095cd7336de3e2a9be94f0 \
+    file://deps/mqtt-c/LICENSE;md5=9226377baf0b79174c89a1ab55592456 \
+"
+
+SRCREV_FORMAT = "opcua_mdnsd_ua-nodeset_mqtt-c"
+SRCREV_opcua = "ff73268829359639531ff02905c889f73a77b408"
+SRCREV_mdnsd = "3151afe5899dba5125dffa9f4cf3ae1fe2edc0f0"
+SRCREV_ua-nodeset = "f71b3f411d5cb16097c3ae0c744f67ad45535ffb"
+SRCREV_mqtt-c = "f69ce1e7fd54f3b1834c9c9137ce0ec5d703cb4d"
+
+SRC_URI = " \
+    git://github.com/open62541/open62541.git;name=opcua;branch=1.3;protocol=https \
+    git://github.com/Pro/mdnsd.git;name=mdnsd;protocol=https;branch=master;destsuffix=git/deps/mdnsd \
+    git://github.com/OPCFoundation/UA-Nodeset;name=ua-nodeset;protocol=https;branch=v1.04;destsuffix=git/deps/ua-nodeset \
+    git://github.com/LiamBindle/MQTT-C.git;name=mqtt-c;protocol=https;branch=master;destsuffix=git/deps/mqtt-c \
+    file://0001-fix-build-do-not-install-git-files.patch \
+"
+
+S = "${WORKDIR}/git"
+
+inherit cmake python3native
+
+EXTRA_OECMAKE += "\
+    -DBUILD_SHARED_LIBS=ON \
+    -DUA_NAMESPACE_ZERO=FULL \
+    -DUA_LOGLEVEL=600 \
+"
+
+PACKAGECONFIG ?= "encryption pubsub pubsub-eth"
+PACKAGECONFIG[amalgamation] = "-DUA_ENABLE_AMALGAMATION=ON, -DUA_ENABLE_AMALGAMATION=OFF"
+PACKAGECONFIG[encryption] = "-DUA_ENABLE_ENCRYPTION=ON, -DUA_ENABLE_ENCRYPTION=OFF, mbedtls"
+PACKAGECONFIG[pubsub] = "-DUA_ENABLE_PUBSUB=ON, -DUA_ENABLE_PUBSUB=OFF"
+PACKAGECONFIG[pubsub-eth] = "-DUA_ENABLE_PUBSUB_ETH_UADP=ON, -DUA_ENABLE_PUBSUB_ETH_UADP=OFF"
-- 
2.30.2


