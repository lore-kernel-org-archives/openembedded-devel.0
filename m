Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412D8C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 19:05:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.46.1717095896772440464
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 12:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WjRXskY8;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4211245e889so12126615e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 12:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717095895; x=1717700695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zhhAtXxRf/5YHn+CGRFZCnESlXkBPaazpHuA7EOxD5M=;
        b=WjRXskY8/vwpsFZJd/DDcCaVRDU6s2aC8mALWqsQ6LFoacueh8qFQDOqcJSPrPKYM3
         YMkA29RnaHjy0VNynCbrT6gqEo/9IKaCXWEgKMzeUnidPIiuH4OvgrXAfo8xMNZiAGT8
         mifYSaS02RVCFj2Smn2uaN0rUVdevzCHj/eVQo+nIoMctOfdrwM0WeZdEF9GLk7ULN5I
         5OLLVplmkRjwCCKIn2Yo8AFKijBKbJDvpnK13BItPfObSkOZzw0GtZar8dcdcdJgCMbF
         kfGNd35H3gjm9F4T/X5tqJ6UwfEnUUiJOoQ0J6bvndFnKLxk29KHHLuToskf/j9oXz5c
         c9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717095895; x=1717700695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhhAtXxRf/5YHn+CGRFZCnESlXkBPaazpHuA7EOxD5M=;
        b=lITlB82RP7zUcbz2DSOr6PYLXaDHRP3ZrcFssHYI8IlaIPNVnE0Vwtm7tBHKqYjbnb
         Y+j3dMfyTNr8TNu4TITobltY0axFfCoEt8uY0nGyjUa/4C7BbBK+7qfWI+HzqveIlytc
         8pL5nGSyKuufZkFVnIQjnSKMW0hi0tahqTUTz6Kbd5yYx19uhQRfo69KHny3TcxGwaY9
         uB93RWZhSisJkxM+hce6auv9UKlF1MqTBE6ZLWSJ4Cs+ZLc6E9QTrTAGMfohg3rEx4RY
         lx5wLB+Di3NgvrVfavTBUyaPLF5MEEs1TSC3+3QGSYhUOu9oI1r5mAQxZFl8dw1zgGDP
         M64Q==
X-Gm-Message-State: AOJu0Yx8HydU/+p+6dKU9ZkIVLq5/cucW6hAHy27glCt1i4z/8nAa1hr
	5toIlm5ioqyjx70cVcpgYFXhX+PGkCwGJzznHsvCh2ipK24oGmoKLyVWtA==
X-Google-Smtp-Source: AGHT+IELipQgLPKwFn/meMjfRTLclluEYBLkN6rhNLVkC3wRUqQYvG31vjIPkknv9QHfTdwJ4dY7zA==
X-Received: by 2002:a05:600c:1989:b0:420:355f:1c07 with SMTP id 5b1f17b1804b1-42127816306mr32806985e9.13.1717095894445;
        Thu, 30 May 2024 12:04:54 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0d98sm169546f8f.24.2024.05.30.12.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 12:04:54 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-dasbus: Add new recipe
Date: Thu, 30 May 2024 21:04:50 +0200
Message-Id: <20240530190450.692894-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 19:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110638

From: Mingli Yu <mingli.yu@windriver.com>

Dasbus is a DBus library written in Python 3, based on GLib
and inspired by pydbus.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-dasbus_1.7.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dasbus_1.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
new file mode 100644
index 000000000..3efa96171
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Dasbus is a DBus library written in Python 3, based on GLib and inspired by pydbus."
+HOMEPAGE = "https://dasbus.readthedocs.io"
+SECTION = "devel"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
+
+SRC_URI = "git://github.com/dasbus-project/dasbus.git;protocol=https;branch=master \
+"
+SRCREV = "413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS:${PN} = "python3-pygobject"
-- 
2.39.2


