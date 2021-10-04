Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F5F9C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 20:21:43 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web08.15658.1633378901976898822
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Oct 2021 13:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qB4rdM1d;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id j5so71703039lfg.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Oct 2021 13:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OmLt9QjWjbLIKr86U6egnwz1huZIWvaDNa9eaOHBK0A=;
        b=qB4rdM1dqoT9Xg2c0Ksp2vLID+Dtz2z2D6eVhv6oHgW0CLmWcaXNu1JNo2LpBidSFj
         WQnxSeKcS9ZH4EYZA2i7dy68wYN1aZv12XCAx8hiVpx7fCMqJf/mEoPuQ0PhuwiSNANX
         YhEWDRYuUsi8oJ8m0GgfZ6jTVfiAae52HmzYjR2om3Up210N2oWjURFDwcjOUmy+WcLi
         FM3mDdPQuQMJ3Jz/OHiimX9h2C32NKh2tItxTvYUs8P4OaPbJg27Qh8XjD7olyw3Xcnb
         bzWJnqUES7Ute//6xV+589obnW/rP+bpU5bP+QhCVvV+juECZbXLFe9xNzHbdQtPBLlw
         rg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OmLt9QjWjbLIKr86U6egnwz1huZIWvaDNa9eaOHBK0A=;
        b=Yna4CeC1opCC5NqXrA/90vALX24T5UZs4dqwrO+eBybiR9F203l1590PNQ7kgKyrQs
         GPqhZcMdE6KBYNwQX+WldYxRmxJ4J5nEpV7YamZRPt6ImJpIcMn0Kl4/2oRbNZli6YmN
         XeMYcm0wHZP0S98vTdXvFUbmTQ/zVGvhCP0eGHg84h7sZloEvh9TYg/P7uzfoEbsU5ka
         zYTqj8cdvX3ptGtKkd1OH1uv1IwOuY2JRoikdaQh1yK0QogWgH5uBjcDkPaZ9qNpUcoe
         PUTTMaWumQJBj2mVdTzVqyRKy44YPf3DDYituwtp1kYCo/CybiTg0GfscVoGJ2l0wfoY
         Hvuw==
X-Gm-Message-State: AOAM533ZAIMwhKXSIUR1DY8Bsr/BT7XZiNAuMD29NZQpCyMTw0v+nLZB
	YhfBB5kI+1Gom8MOy8lS9QwWfVMvLwZ8/g==
X-Google-Smtp-Source: 
 ABdhPJxTJ1Pz1HRdmkRKibWFJCHxaQ7Ra8IpzgbUmPc3c0apObpJrPFVkQHLB4YmqQotwLy7s2ABiQ==
X-Received: by 2002:ac2:5c50:: with SMTP id
 s16mr16226558lfp.605.1633378899716;
        Mon, 04 Oct 2021 13:21:39 -0700 (PDT)
Received: from slackware.local ([185.253.97.13])
        by smtp.gmail.com with ESMTPSA id
 l6sm1689988lfe.218.2021.10.04.13.21.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 13:21:39 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] grpc: fix cross-compilation of grpc applications
Date: Mon,  4 Oct 2021 22:21:30 +0200
Message-Id: 
 <4069569d2f67d9f9f30fd80a8cad827386887c8b.1633378334.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1633378334.git.uvv.mail@gmail.com>
References: <cover.1633378334.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Oct 2021 20:21:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93198

When we build an application that uses grpc for the target, following
error occurs

CMake Error at <application work dir>/recipe-sysroot/usr/lib/cmake/grpc/gRPCTargets.cmake:179 (message):
|   The imported target "gRPC::grpc_cpp_plugin" references the file
|
|      "<application work dir>/recipe-sysroot/usr/bin/grpc_cpp_plugin"
|
|   but this file does not exist.  Possible reasons include:
|
|   * The file was deleted, renamed, or moved to another location.
|
|   * An install or uninstall procedure did not complete successfully.
|
|   * The installation package was faulty and contained
|
|      "<application work dir>/recipe-sysroot/usr/lib/cmake/grpc/gRPCTargets.cmake"
|
|   but not all the files it references.
|
| Call Stack (most recent call first):
|   <application work dir>/recipe-sysroot/usr/lib/cmake/grpc/gRPCConfig.cmake:25 (include)
|   	CMakeLists.txt:4 (find_package)

That's because target grpc was built with CPP plugin support and
referenes it from CMake config file. This commit disables CPP plugin
build for the target, and sets dependency on compiler for native and SDK
builds

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
index b4f10662d..e2b86dad1 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.38.1.bb
@@ -13,7 +13,11 @@ DEPENDS:append:class-nativesdk = " grpc-native "
 PACKAGE_BEFORE_PN = "${PN}-compiler"
 
 RDEPENDS:${PN}-compiler = "${PN}"
-RDEPENDS:${PN}-dev += "${PN}-compiler"
+RDEPENDS:${PN}-dev:class_native += "${PN}-compiler"
+# Configuration above allows to cross-compile gRPC applications
+# In order to compile applications on the target, use the dependency below
+# Both dependencies are mutually exclusive
+# RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
 SRCREV_grpc = "96b73272eadc01afb5fb45b92b408c47e4387274"
@@ -39,6 +43,7 @@ EXTRA_OECMAKE = " \
     "
 
 PACKAGECONFIG ??= "cpp shared"
+PACKAGECONFIG_class-target ?= "shared"
 PACKAGECONFIG[cpp] = "-DgRPC_BUILD_GRPC_CPP_PLUGIN=ON,-DgRPC_BUILD_GRPC_CPP_PLUGIN=OFF"
 PACKAGECONFIG[csharp] = "-DgRPC_BUILD_GRPC_CSHARP_PLUGIN=ON,-DgRPC_BUILD_GRPC_CSHARP_PLUGIN=OFF"
 PACKAGECONFIG[node] = "-DgRPC_BUILD_GRPC_NODE_PLUGIN=ON,-DgRPC_BUILD_GRPC_NODE_PLUGIN=OFF"
-- 
2.28.0


