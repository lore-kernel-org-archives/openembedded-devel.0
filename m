Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272AACDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 10:22:57 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39958.1782123774468050791
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2026 03:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QB9lWeXC;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-463f1165e16so4172784f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 03:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1782123772; x=1782728572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHI5b4Sa0x7Afb18Kvh2VS+WYFIc8IeH2hD9+PPscX4=;
        b=QB9lWeXCnMruooceIHarjDPstiQ+A41/yoohg662r+9gVM4BL5ZZ4JaVVwZ3gwtcv6
         P5yTniQKvKgCl99YcpvQneiIovxOxljnKLNcJ1kU/ybsAyv7CEM98qGFcY5G2QMv1IMy
         +VV2DVF8CIITqL5GDml+SM2QltKOfAOd3PoAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782123772; x=1782728572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WHI5b4Sa0x7Afb18Kvh2VS+WYFIc8IeH2hD9+PPscX4=;
        b=UtRrSiFdEX1voFShu9idwtLHm0dHEsBJXVkUDlfDqFajAoX2U6rFijTubQOTLZ62Ib
         w7Kv4nkOHDw/pL9xkzVrbxXR7bwDYUfdT/p4UGvAPvDrsyXCe0BkRGkkGLClUKmrPUzn
         rWiYznXeoZpLNDfht2UlOM8AtBM2oPdF65QEBZ4Ekhym1yJUrxPHsxpl8QKa1mtMWpbh
         ojMgZd/NJIjgszGu3hDamqCZA49mHAGf5uCZzOLvWuWnAI1BGBtumWfUyKh3jwXiN+F2
         asUzVJMCoe/Q8SBFQVywOAa0eqOVqA3l42wXp2XtHFUn46FeS3asYxzY/xjw37h42ZmW
         FtMg==
X-Gm-Message-State: AOJu0YybbPPJLpk6u5wvaIRM+BggoPSs8xRndH6pssTTLUuS1PgQH0dE
	IxfW5pi+u1iCLX4FGuBDhTaXvIYTQp8VDoSfEWsBakbE3BTgIhd9LZl+Z9jSjtdDppN4RKgK5/x
	2CYyl
X-Gm-Gg: AfdE7ckD390/Vp6GgQTIBChE+4FgWfu8FaFgAvTKHNqX6EZ9nQF2Y/umwCxzW05XXaG
	OnZoEUEHnpVaJYvhqpDjRKNvYKkimnXi0MLceynAm6n9CrQ1Y/fcy1rOQMEoS0hqyz5/DPX7P7x
	JP7i12+J09WSe3FPSDUtdeQzjmhdRuFrJ7P8ylp4sD1IAiJiR/nrcnGw/1tR98wGVg82V9DahFK
	sVzCz/F6tRFcPqs1jwB40lxOT001yalWA57JKZXKcdkUkgVR7pEtcMQtpxtrvetdQw2mahlqV0l
	Um/F/48OUVfn3oAOGr71AmEEfCTNeFozE10vtUjl2Wg/Vq1EH5lTstsd17XIsWKkdaUjLOe5JMG
	eg6h4m1Hr/IH+85LU9/cOvhddW55Gw1D6v0/lZr1wvZQTqhuN1m1/DXUZBL/MPG78WoRnmNdzTq
	qLANtsYzMKoeW9MpQqd6Stgh0ksQ==
X-Received: by 2002:a05:6000:46d4:b0:45e:f381:cd7b with SMTP id ffacd0b85a97d-4650638556dmr15566255f8f.8.1782123772427;
        Mon, 22 Jun 2026 03:22:52 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666712cceesm24397077f8f.35.2026.06.22.03.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 03:22:52 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-zeroconf: Enable tests
Date: Mon, 22 Jun 2026 13:22:47 +0300
Message-ID: <20260622102247.3370957-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260622102247.3370957-1-leon.anavi@konsulko.com>
References: <20260622102247.3370957-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 10:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127691

Inherit ptest and includes tests for python3-zeroconf.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-zeroconf/run-ptest            |  3 +++
 .../python/python3-zeroconf_0.149.17.bb          | 16 +++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-zeroconf/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf/run-ptest b/meta-python/recipes-devtools/python/python3-zeroconf/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-zeroconf/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.149.17.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.149.17.bb
index 165ea63dda..e0ab47d3aa 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.149.17.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.149.17.bb
@@ -5,9 +5,23 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9fe712b1bc27c5c4e9ecd7f31d208900"
 
 SRC_URI[sha256sum] = "f10e58071bc5e749176b8dc8d7e7ed4d2e6b507dde20fd8169b760cf4f7f4c5a"
 
-inherit pypi python_poetry_core cython
+SRC_URI += "file://run-ptest"
+
+inherit pypi python_poetry_core cython ptest
 
 RDEPENDS:${PN} += " \
     python3-ifaddr (>=0.1.7) \
     python3-async-timeout \
 "
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-pytest-asyncio \
+    python3-pytest-codspeed \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.47.3


