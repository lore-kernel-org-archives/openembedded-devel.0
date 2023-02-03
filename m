Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3378C636CC
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 04:29:07 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.3774.1675398538516345614
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Feb 2023 20:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OZPHQSrR;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso3837948pjb.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Feb 2023 20:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jFR5Q38lg3H7/VaFwME4JkmBdyv70/uwyEYUcGdvfyc=;
        b=OZPHQSrRQCrsrxpN8nzTilgbg+yH/fiVvc+no9ZPyzSXvrOXKWT7Gy6aHiTIo/uzxj
         osYICzcSmQb5z4hD+tmt5Zb0VadVgz/XY205XGNIVtpdQvdlCwpZQ3EYHdpuEu52+8ex
         BCGU+FkXo8MTzii6FuNdNLKFiqmxucSOcT3gXjEuKYu9WGq8C3rY+s5ckT60bGUkaGlG
         MbdIAbXmuNIkYIZtotiX9DHAcca5fIWVbY5TgomBTXFM0oLlgT2DlxExah3Zq+iOjB11
         u3m3y4my4+LAe8LOaOFz9VAymrVKX7LVa1Felrt9kiEnFfaNIP0edV1dyJ/paafo6DV2
         KLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jFR5Q38lg3H7/VaFwME4JkmBdyv70/uwyEYUcGdvfyc=;
        b=AyASEPrqZFAkTOMgAhP6LceiiFopegomcejNT9nL0CyVBTnsoFtp6FCNWXJi41OP49
         Ig7jhZK+sfb/jHFQ1+XC4+bU6krdWxUJnYxxtjGv2roD6djdwgq4+I8cvg1vZI+usEgp
         EOvbGuPsrlR8HxQnZQ2cLmy5sbgrg3xqqfhJl6ZyrUly6GMS0Bx+4WmjrH2SIZhJCKRq
         ynv5Nt6RUVYpZ5Zo8bQaaB8wIHhpl0DdcwS4K+isc6/TusxCwAlbNKtkhMZLmva/+pFQ
         zEHGjm3qJ07Zh/GYo4xFkqw7X8aJJcpW10zNXOQyMq8WX5Sx+TJA5NgC/OGeufqsZadT
         xJPg==
X-Gm-Message-State: AO0yUKX+ERndn0/SFBBgz6RfNe0VchoRfusQsowP+URMUU/GGIM9zIvq
	yWLzmLkuxyhJTf65Ia6lKDg473Kuu96s6A==
X-Google-Smtp-Source: AK7set/+R4eHqxpLimD9Vya5YXjKc7SzorudWoXdcsu1yvTQPJW++bEKp5qPL/VfphYVeKfBAFHT+w==
X-Received: by 2002:a05:6a20:3d15:b0:be:8c7e:4dfc with SMTP id y21-20020a056a203d1500b000be8c7e4dfcmr10649139pzi.20.1675398537478;
        Thu, 02 Feb 2023 20:28:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id ju1-20020a170903428100b001888cadf8f6sm506060plb.49.2023.02.02.20.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 20:28:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sysdig: Fix build with gcc13
Date: Thu,  2 Feb 2023 20:28:55 -0800
Message-Id: <20230203042855.1495234-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Feb 2023 04:29:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100917

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Add-cstdint-for-uintXX_t-types.patch | 38 +++++++++++++++++++
 .../recipes-extended/sysdig/sysdig_0.28.0.bb  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cstdint-for-uintXX_t-types.patch

diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cstdint-for-uintXX_t-types.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cstdint-for-uintXX_t-types.patch
new file mode 100644
index 0000000000..e564958dad
--- /dev/null
+++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cstdint-for-uintXX_t-types.patch
@@ -0,0 +1,38 @@
+From 3d076ea588eb3c7f334133b4c31172a14beadf5b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 2 Feb 2023 20:18:27 -0800
+Subject: [PATCH] Add <cstdint> for uintXX_t types
+
+gcc 13 moved some includes around and as a result <cstdint> is no
+longer transitively included [1]. Explicitly include it
+for uintXX_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://github.com/falcosecurity/libs/pull/862]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ userspace/libsinsp/filter/parser.h | 1 +
+ userspace/libsinsp/filter_value.h  | 1 +
+ 2 files changed, 2 insertions(+)
+
+--- a/userspace/libsinsp/filter/parser.h
++++ b/userspace/libsinsp/filter/parser.h
+@@ -18,6 +18,7 @@ limitations under the License.
+ #pragma once
+ 
+ #include "ast.h"
++#include <cstdint>
+ 
+ //
+ // Context-free Grammar for Sinsp Filters
+--- a/userspace/libsinsp/filter_value.h
++++ b/userspace/libsinsp/filter_value.h
+@@ -18,6 +18,7 @@ limitations under the License.
+ #pragma once
+ 
+ #include <string.h>
++#include <cstdint>
+ #include <utility>
+ 
+ // Used for CO_IN/CO_PMATCH filterchecks using PT_CHARBUFs to allow
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
index 4181da732f..92897cd3fc 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
@@ -24,6 +24,7 @@ RDEPENDS:${PN} = "bash"
 
 SRC_URI = "git://github.com/draios/sysdig.git;branch=dev;protocol=https;name=sysdig \
            git://github.com/falcosecurity/libs;protocol=https;branch=master;name=falco;subdir=git/falcosecurity-libs \
+           file://0001-Add-cstdint-for-uintXX_t-types.patch;patchdir=./falcosecurity-libs \
            file://0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch \
           "
 SRCREV_sysdig = "4fb6288275f567f63515df0ff0a6518043ecfa9b"
-- 
2.39.1


