Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC149C44500
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 13:05:15 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.173948.1783429509860580780
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jul 2026 06:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=WqQNUGHE;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4758bd3731bso540869f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 06:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783429508; x=1784034308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9rW/lO09c6j3EXDTrIyQwTE0g1HPtATosGBFyKWQQA=;
        b=WqQNUGHEdPLy1tpisgh6og3Ma3rRNNdP2gcqMmfIHGRli+JTkniYWSnyJU48m3Ds8Q
         ejMNDK6P6aVgtakqPNqnWe0tyYlXgwFSfglc7bZWyoRuPz6M1LVLRu2ZZeRBlQD/QQMq
         tGpUEU/W8TDKtAb8SSG3xvi/5V+Pt2bIzXBQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783429508; x=1784034308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p9rW/lO09c6j3EXDTrIyQwTE0g1HPtATosGBFyKWQQA=;
        b=Sn4ADYifI0lrKqWhRJL7Y1SSOaZ97aGpSrcv+qzNFqkmGX2VNJ3eqXiZj0I+vfA5TX
         jCT9tcm9hYSerAHOxhnJ9Lfgy4U8KFUwypLvYsszhzkaBl9KApOsSFFn5O9MLfSgmgSD
         aN3iI7TagK/w4aA3oz0Wlj/iuoukJm0evRcS58dHBZ2gZKBIqkoUisFdolOZNvaJIYor
         OWDZ4hh8klQq+eWHtnNxMJ/VtOMwl21X3QOENcJNwwElFQnNRBFHdLKFsyNFJZ4oJZrx
         0HQ0pBhznDhzHzgDVUr5RyZjaCT5ca4NNlCVnMgGq6utbnuxjKHCQWV3qzMPBKoOgNiY
         VV/w==
X-Gm-Message-State: AOJu0YwUFD/185DISXz/e58TVwxYmiM8krRh4Z18ro+P4mNjkieTRQZR
	bGaaBJ5O1XdCsVPZxUTtTaWx91dYa587oyQrGd4QDIBV8HR0XdD8jrKQ86z3pn7FOSYkEPwhOav
	2bucF
X-Gm-Gg: AfdE7clmd6WF5QG9TXYNGh3ivTm+qcgquhG/JcuOG2A6bCnaAZAXj/M2yOaX5ar8VaX
	81DfON3IIleJ9WUTW/nyrCLqVkiPMZIvV1VVS8ckTsgMB4kRAMRmyoGWCUVbK49FWMfouc3KX1h
	3m949vkqXNkyExkr92O1HPSD1+swT65XUZlAvVW1AvYnl6yjHKf/ZEcgyy4/zPNa9+LF/Rsb02Y
	v+YqRuG+lcXmQvgIHFn2VDJ51slFXguz8SrhavPTiYx19fL5W/J8Szf3FB7VWpWKeC8a2LgPT2o
	0S1PF/Rs4wxaAgoTUR/gN3rOpjrDmP8Ih0MXQXTW44618nX5CmOLCTSlzm409pz6mIDpOqUUbsv
	34lo5LYbnHffAvMt1NQzbjOpQxpxM+b5JwQQTxPsmdJkUSkyd+A5JbdD95DVZ4oLkVPxwIpIprl
	JJpYnGAYo3RAUJ7zJoNMqWrsaoqZ+IMW3+YKxXQ/m4V5eoy/F+G0Tp9GX2t5G2fOW1OnMaM3Yee
	SmFLyT+29UR5bLlqp9Tl3LDnFztaA9SPvaWUlsBpqaXPm0cov+1
X-Received: by 2002:a05:6000:1889:b0:473:1e79:87e6 with SMTP id ffacd0b85a97d-47de97d8e1bmr3366346f8f.3.1783429507964;
        Tue, 07 Jul 2026 06:05:07 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm33986385f8f.3.2026.07.07.06.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:05:07 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-pycurl: Enable tests
Date: Tue,  7 Jul 2026 16:05:00 +0300
Message-ID: <20260707130500.888218-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260707130500.888218-1-leon.anavi@konsulko.com>
References: <20260707130500.888218-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 13:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128064

Inherit ptest, update runtime dependencies and include the tests
for pycurl.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pycurl/run-ptest           |  3 +++
 .../python/python3-pycurl_7.47.0.bb           | 21 ++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pycurl/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pycurl/run-ptest b/meta-python/recipes-devtools/python/python3-pycurl/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycurl/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb
index 7259957174..5ed7b8e30d 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb
@@ -14,8 +14,27 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI[sha256sum] = "5e3cf357939da8d4ceefe3c7f305afcf9b47cba66cfd95e7768ca43b38445e14"
 
+SRC_URI += " file://run-ptest"
+
 DEPENDS = "curl"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-core \
+    python3-flask \
+    python3-numpy \
+    python3-flaky \
+    python3-setuptools \
+    python3-unittest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    cp -f ${S}/setup.py ${D}${PTEST_PATH}
+}
 
 BBCLASSEXTEND  += "native nativesdk"
-- 
2.47.3


