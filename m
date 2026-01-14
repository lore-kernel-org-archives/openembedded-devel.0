Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429E6D3CC83
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 21:57:08 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22334.1768427820504342666
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 13:57:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YyVKb7aU;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1233702afd3so337630c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768427819; x=1769032619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nx0yRPac9len3lucxg2la5uBJFgz3fBBsp9eI4F0h0g=;
        b=YyVKb7aUHasC1mvZrmCLWzGQrfCeSmYsoot2sr0L6CJtG3nmRhKUzNBX3GfE80TnIH
         rup6dYLfFVAadaKCPMnp+npgSdISG0WzJ1KMqJIeWBMkLCy0vMVPovx4xV5ePuTaDmgy
         I8gI7o/IGWtemqX/nxIEPC0JhQL+PR4p61ufmcAAQM86iefX8b4wPBhRjhHsGjyICMOX
         mA8IXi/BiBqm5XvRSNzrkXWbJjYlQXnTKKHIreE63xaby0X6x8XXzaMidTzqArmzqATM
         BqAAQMwh7jEm6z/t2+vwXZmUAoLSN+4mf90Z79ae83JdXR0KCpWOURUdPYl/nnPJSI0b
         xAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768427819; x=1769032619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nx0yRPac9len3lucxg2la5uBJFgz3fBBsp9eI4F0h0g=;
        b=hadJ6X+u1KF2rsw7hDc1b69hHqV/pqwAgSwGHqNqk/gRCn+a+/3HsBrJo3VYp0nIXp
         mbkau7GSv3Nd6wjNh70pZ8lruB9Yc80bCqz8Gaf6ul1soD+Oc+FPr5tV3exiT94ns+WG
         3ZlcacXsCDjHq+T9j+mCH1xZfY4PbKP538+G53xe5qNQkJtbBUVYmYy0S11Ch11rlotp
         LCoQc/GY69k+vgqaIQpXVdSG+j34i2t2tBxu9Xwybcv7AX6IBh4t43jad8PfR/GWQTt6
         o5H3apjMvpbVhmbLrp+HeEjaJgXSUMiORpXnmJmNuBvJkGnAqxWbSmLIx+AwSbjc+a/j
         rWBg==
X-Gm-Message-State: AOJu0Yy3c44X7Ww+DC26Hu7sA/dfxv/1quIVGNP5PMYLseCqTN3/U3N3
	I6huy/fvf7yASWhpK3CAeIjNoZqxRwMOJgFeqzrURZMFWtSIHW8y17AyPFxbTA==
X-Gm-Gg: AY/fxX681hVMjNM68gWGXBIca98mR72feGVTntq4ISJAr2mCfvAC950x0w94JN2O7Jv
	hINcuuuZBYrtnlmHkHQ23FPKiZLUxv25VqZns5bajKxkYSMozaTRBXMgqAAi8S53jih223IAxtR
	ZuMUBhJPEfe1ihyEUl+a2JTCggtNrs+JXc2myOuz+dQyofampDEm/8s8l3AYM4k9VX26Y+PKefI
	a47ohhSQT286O2W+nkQrhoBaHve+izer8DCYFpufAt+373/q7OP/2k65vpVGSHTktxorbt1jv1G
	vOfVo2C7in0SoFn9OGp8rQ7VzO6J+gJM6FVFNd1Fco+wfYIwnddvgc4BpVKwQWBmvz+RXUYfbnz
	/9aqt5BA6quOTS6mBdPe00mZkZqYrm7JxShF57Drnh7PR6rNeG5AlyotjlC1C4g9JN4Ry1qnAFT
	ILmiR692V9cnp810wx8/k2DBmSTs7GckPQO33wIkkmd6IwZGORcLTfDhwEmUokEv7ununq9uj/2
	0ODSlW+Tkt/zPe6Gqpq6AlM3Pjh7l4=
X-Received: by 2002:a05:693c:3105:b0:2ac:1506:c781 with SMTP id 5a478bee46e88-2b486c8d4ecmr3757416eec.10.1768427819254;
        Wed, 14 Jan 2026 13:56:59 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d57aasm19440277eec.30.2026.01.14.13.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:56:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] grpc: Upgrade to 1.76.0
Date: Wed, 14 Jan 2026 13:56:56 -0800
Message-ID: <20260114215656.1235700-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 21:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123487

Backport a fix to build with latest gcc and clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-build-add-missing-includes-41351.patch | 58 +++++++++++++++++++
 .../grpc/{grpc_1.71.0.bb => grpc_1.76.0.bb}   |  7 ++-
 2 files changed, 62 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-build-add-missing-includes-41351.patch
 rename meta-oe/recipes-devtools/grpc/{grpc_1.71.0.bb => grpc_1.76.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-build-add-missing-includes-41351.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-build-add-missing-includes-41351.patch
new file mode 100644
index 0000000000..bf1f22b906
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc/0001-build-add-missing-includes-41351.patch
@@ -0,0 +1,58 @@
+From a976f66ac7d1b9f43a3071e22b5014fcfeab04b3 Mon Sep 17 00:00:00 2001
+From: "Mark D. Roth" <roth@google.com>
+Date: Tue, 6 Jan 2026 10:09:45 -0800
+Subject: [PATCH] [build] add missing includes (#41351)
+
+Fixes #41305.
+
+Closes #41351
+
+COPYBARA_INTEGRATE_REVIEW=https://github.com/grpc/grpc/pull/41351 from markdroth:add_missing_includes 223be6932adb00d085149c53167c1b0318745f6c
+PiperOrigin-RevId: 852829597
+
+Upstream-Status: Backport [https://github.com/grpc/grpc/commit/d54219b508423f0a2ff6a0b98c16fb6dafd44b84]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/grpc/event_engine/memory_request.h | 2 ++
+ src/core/channelz/v2tov1/property_list.cc  | 1 +
+ src/core/util/glob.cc                      | 2 ++
+ 3 files changed, 5 insertions(+)
+
+diff --git a/include/grpc/event_engine/memory_request.h b/include/grpc/event_engine/memory_request.h
+index 76bcbb2036..ad8cab842e 100644
+--- a/include/grpc/event_engine/memory_request.h
++++ b/include/grpc/event_engine/memory_request.h
+@@ -17,6 +17,8 @@
+ #include <grpc/support/port_platform.h>
+ #include <stddef.h>
+
++#include <string>
++
+ #include "absl/strings/string_view.h"
+
+ namespace grpc_event_engine {
+diff --git a/src/core/channelz/v2tov1/property_list.cc b/src/core/channelz/v2tov1/property_list.cc
+index 64bbb6307c..03367cce7c 100644
+--- a/src/core/channelz/v2tov1/property_list.cc
++++ b/src/core/channelz/v2tov1/property_list.cc
+@@ -15,6 +15,7 @@
+ #include "src/core/channelz/v2tov1/property_list.h"
+
+ #include <cstdint>
++#include <limits>
+ #include <optional>
+ #include <string>
+
+diff --git a/src/core/util/glob.cc b/src/core/util/glob.cc
+index 1b1c16e23d..22e54259f0 100644
+--- a/src/core/util/glob.cc
++++ b/src/core/util/glob.cc
+@@ -12,6 +12,8 @@
+ // See the License for the specific language governing permissions and
+ // limitations under the License.
+
++#include <algorithm>
++
+ #include "absl/strings/string_view.h"
+
+ namespace grpc_core {
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.76.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.76.0.bb
index 53867b8fe6..f05b2d9e83 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.76.0.bb
@@ -23,10 +23,11 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # Both dependencies are mutually exclusive
 # RDEPENDS:${PN}-dev += "${PN}-compiler"

-SRCREV_grpc = "4e9357bca1408596663a218c0c608a4c0560a867"
-BRANCH = "v1.71.x"
-SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
+SRCREV_grpc = "f5ffb68d8a2fd603dff16287e90a4ac571e1fec6"
+BRANCH = "v1.76.x"
+SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH};tag=v${PV} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
+           file://0001-build-add-missing-includes-41351.patch \
            "

 inherit cmake pkgconfig

