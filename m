Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FAFC433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:41:59 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.2781.1633977718859232699
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P8yLwx5J;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id u18so59284264wrg.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hGHWbdkQ3RBj+k2DVO4/wXTCdoTn4vMxJhB574y3WXo=;
        b=P8yLwx5JNrrC4u98FhQSb+wzzUu9q/Hq2l/Z58VbmcNUsQ3qyDpxu56tHERUr1cF/q
         diEsew1/5kBWcZZc46kn6sBIhBIYH8pv4Go1/U7QmxL6ALFpVcias8yYQglN84F1j1BY
         Y1ThnYZDVRr6W7tjbavcL5LpbseXbKSQU+IE2mIyeTB1T2JzJT9N7irvN0nKyrg/4JET
         ZxaR6yvhg0yEzzj4VK1NXBZ39lgbNrlYLh7HDt8YJrbx5tN8FRbfqbksYD6R8VGarcnF
         Juds7wz3ZX5k02C7G5PoioKsDsL7Uemc0Q5rSMKnlLad6njorA3L4tky8E/L75/P8vzv
         WE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hGHWbdkQ3RBj+k2DVO4/wXTCdoTn4vMxJhB574y3WXo=;
        b=1K0NO2FTfv7w93x46Spz3G9i3u1+2QHDV2fdGu9t4KX1NiVNJLRFY5AW+CfT0+R2Iz
         tU/AcSTR9UENAW+nD6jrU69vjV+2WFrcCw5TMrCwSqxrECeJ1sCBgNNB/DJ9qhHVdvwg
         KugQZil69bHsLtbql08tLyHh/+dky7jimWfKnDW1BTl0U03hkTS2qViU17m57wdk8k1G
         gwZvYz4KKel24c6SXdRDxCcgkZ0paVE/N9wg8pcnHwX2RzR1BAC6Grl3vO2ImNWpbEsL
         7ZNHj4UQYrhUxNXBCwJJfTEtOx/BXyG/fQpyd1fTYECZmw/1DNwswp2L5IjaOQQ8i5vy
         65lg==
X-Gm-Message-State: AOAM533ro3WLP2ZafS6q2mTE32mqDdjbftn+9A2VO3YWNUc8MaJMAPUv
	FpoAhDXxR5teoJHx30p3mjNjRNiBFmQoeg==
X-Google-Smtp-Source: 
 ABdhPJxWXErPAC6B4ZRk9gjOS8qqZ3Fy5Kl2Zb115ExFU+g7rZ4+PwS11Xsmuk9941H0NRB6XYEf2A==
X-Received: by 2002:a1c:2c2:: with SMTP id 185mr683585wmc.85.1633977717496;
        Mon, 11 Oct 2021 11:41:57 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:41:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/24] nodejs: add a python 3.10 compatibility patch
Date: Mon, 11 Oct 2021 20:41:31 +0200
Message-Id: <20211011184140.653609-15-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:41:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93229

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-jinja-tests.py-add-py-3.10-fix.patch | 41 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_14.17.1.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-jinja-tests.py-add-py-3.10-fix.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-jinja-tests.py-add-py-3.10-fix.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-jinja-tests.py-add-py-3.10-fix.patch
new file mode 100644
index 000000000..b2a2da959
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-jinja-tests.py-add-py-3.10-fix.patch
@@ -0,0 +1,41 @@
+From e1d838089cd461d9efcf4d29d9f18f65994d2d6b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sun, 3 Oct 2021 22:48:39 +0200
+Subject: [PATCH] jinja/tests.py: add py 3.10 fix
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ deps/v8/third_party/jinja2/tests.py      | 2 +-
+ tools/inspector_protocol/jinja2/tests.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/deps/v8/third_party/jinja2/tests.py b/deps/v8/third_party/jinja2/tests.py
+index 0adc3d4..b14f85f 100644
+--- a/deps/v8/third_party/jinja2/tests.py
++++ b/deps/v8/third_party/jinja2/tests.py
+@@ -10,7 +10,7 @@
+ """
+ import operator
+ import re
+-from collections import Mapping
++from collections.abc import Mapping
+ from jinja2.runtime import Undefined
+ from jinja2._compat import text_type, string_types, integer_types
+ import decimal
+diff --git a/tools/inspector_protocol/jinja2/tests.py b/tools/inspector_protocol/jinja2/tests.py
+index 0adc3d4..b14f85f 100644
+--- a/tools/inspector_protocol/jinja2/tests.py
++++ b/tools/inspector_protocol/jinja2/tests.py
+@@ -10,7 +10,7 @@
+ """
+ import operator
+ import re
+-from collections import Mapping
++from collections.abc import Mapping
+ from jinja2.runtime import Undefined
+ from jinja2._compat import text_type, string_types, integer_types
+ import decimal
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
index e44398721..a64288d8a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.17.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://big-endian.patch \
            file://mips-warnings.patch \
            file://mips-less-memory.patch \
+           file://0001-jinja-tests.py-add-py-3.10-fix.patch \
            "
 SRC_URI:append:class-target = " \
            file://0002-Using-native-binaries.patch \
-- 
2.20.1


