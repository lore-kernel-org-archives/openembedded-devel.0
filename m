Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1087ACDB47C
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 09:41:42 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17366.1782207697536104913
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2026 02:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZaH8KMQY;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4924593f45dso37153925e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 02:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1782207696; x=1782812496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0a0oHb7L+I+3C+LlVl0EsyqPL10t6oRK81KTcg83H8=;
        b=ZaH8KMQYil1hOWSRgC0mmYomlm7DnLFOPu/qj0piHyBDpudFzoQWLjsOTC3BIhPAfz
         7sDmhYMgzTckfa+QKekV7JweDXjH6QKrxANPR9wo0IOSA2UGfWQRcYzCXKhevsjzRrS9
         +vltd6TGSEXE1yOkHaGrpJGjlzN0MQ7FST5SA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207696; x=1782812496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0a0oHb7L+I+3C+LlVl0EsyqPL10t6oRK81KTcg83H8=;
        b=LJ882ueLay3dN/omaq1c9pSZnTygfhQKdHA1vWRcR0qbJtJGpSemT49+ys6P85xfTx
         6eDLNVhg5BEae7hkj+65lEDPogQdgA9v0Ly+t0Lw2YBp1o4hhRYHCLV0P6tGDhT+DA8q
         9VpXPg8BjyfGT0DRLx9hPzyNA2lOPgrHBP18VnaoN6gmIwRMt7v/OOHnGbWX3K4NmATj
         fpB3tgqVRmFweoU96oV8/wv7gGv2XHvaqPtW1AFw6XoUyMs2gvVP2lSoi89vr+0ltr89
         E0SrWt/MFNXB2aeYePDSVjvJS4Pt1DNRPaDrHmFhO2wgWOAtbdTDrTOna4rzLnVvzBmz
         ofBA==
X-Gm-Message-State: AOJu0Yyd9T+RafINa46ldaUsokmIzafzfhaaUZ1ivj56irlptgiORnt8
	PhhvlTFQhNICF7ofQICaukH03iNBi8zT3dLK0PKZ4+AOUi7IGl6SLngV/yZ4EdgvLEC6MCnqOqp
	sqc6y
X-Gm-Gg: AfdE7ck30ht0+9GB+Yd6SOMqxEyRj6K/tWiyyYIi+fSpkwI2em6OvU/wEAiJYg7uX0J
	xHYUBOPwdKuMBil48J3D3yVTGpUIRh4E59NgwxvmBH4F9WXI98ZDiyQN9DGk00vtolBR3TNkqmD
	vmxicKeFGZ7WVzhUhe4p1RF/lqd6gLShj3XwBocmGLGpu+SAX8Jk0Fsb+YHge3UFPZmQkT3mwE9
	aVIqNpdCExTjyyB4EhqqIamAxeoiZqh2zPRvKSHhlR8GR72Nrd+oO8f3pWeI+IhDeLbTRfVZObG
	0kvlLIz2Nb6XpNJASgTgHx2cFguwK2lxQGtJbYIkaIrLA0oeDK1Niw0VoXCmo4tzTUHSUHXEzvQ
	kbbhVbnqMatv+56F3MWOYmOZCi3VWQPQqEtLQr5Sjopy2hJpJQU6jpQvVz69/D7MCJRPuEVZtWh
	4AnTFd2cMpLGKtj2N9NDqOFQ74Bw==
X-Received: by 2002:a05:600c:8b2a:b0:492:41a1:f217 with SMTP id 5b1f17b1804b1-4925b3867b7mr28029515e9.1.1782207695064;
        Tue, 23 Jun 2026 02:41:35 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c4fd2sm33581597f8f.14.2026.06.23.02.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 02:41:33 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-jdatetime: Enable tests
Date: Tue, 23 Jun 2026 12:41:27 +0300
Message-ID: <20260623094127.1592848-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260623094127.1592848-1-leon.anavi@konsulko.com>
References: <20260623094127.1592848-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 09:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127700

Inherit ptest and include tests for jdatetime. The PyPI package
omits some files for testing like tests/__init__.py so use the
GitHub source instead.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-jdatetime/run-ptest        |  3 +++
 .../python/python3-jdatetime_5.3.0.bb         | 23 +++++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-jdatetime/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime/run-ptest b/meta-python/recipes-devtools/python/python3-jdatetime/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jdatetime/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_5.3.0.bb b/meta-python/recipes-devtools/python/python3-jdatetime_5.3.0.bb
index 9275736eb3..90dacb8d5e 100644
--- a/meta-python/recipes-devtools/python/python3-jdatetime_5.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_5.3.0.bb
@@ -3,9 +3,15 @@ HOMEPAGE = "https://github.com/slashmili/python-jalali"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c80be45b33471b4a23cf53d06a8172be"
 
-SRC_URI[sha256sum] = "d20eb9fc2a00e86493a6156b2a0e4e579f23379e8fea186a0e603fd36a130227"
+# The PyPI package omits some files for testing like tests/__init__.py
+# so use the GitHub source instead.
+SRCREV = "ea119aab729d4c48f797f3663a692680c93fb9f5"
+SRC_URI = " \
+    git://github.com/slashmili/jdatetime;branch=main;protocol=https \
+    file://run-ptest \
+"
 
-inherit pypi python_setuptools_build_meta
+inherit python_setuptools_build_meta ptest
 
 CLEANBROKEN = "1"
 
@@ -14,3 +20,16 @@ RDEPENDS:${PN} += " \
     python3-jalali-core \
 "
 
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-core \
+    python3-pickle \
+    python3-unittest \
+    python3-zoneinfo \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.47.3


