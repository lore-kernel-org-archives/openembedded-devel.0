Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F7FC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 19:39:53 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.847.1717097984733103670
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 12:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BiBr6Lic;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-420180b5922so16470495e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717097983; x=1717702783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c3YqV/BpwyilBCYFMI82h73d+h7ZgA72NJz2i3AI0w4=;
        b=BiBr6Licw9x8Y+DNi1YWZM9XmUyvyQFYAYQUaSPCNEWpE9HGjkjU+iDxXNdeDYoTJo
         Nz6xkNTVHwAMSN+UObEejPE4T0ABjSJjFUbQhLRMo4WBNsLSoWFb5uN8KOS2Mzmr3trK
         gBM1YlcSw2yVZhe7DhNNLOU/8KLjfim8GXhQxhpQnPjtTh0zC0LN3XdJAPnS0MA+q/OY
         SRfPGQhL5CeJotQ7hOg4T+w+eVucJVdpMwReXM/eMf390T9QEMySvGrJI0Zztf+ve/6Y
         Jfc6TNLll+pcblBJwkVCay4IZfY7JaDY+spwK4TbNNr4Jnjlf7T44eg8x0+bHrj3sIqs
         CxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717097983; x=1717702783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3YqV/BpwyilBCYFMI82h73d+h7ZgA72NJz2i3AI0w4=;
        b=ijSZivkqKsffKINe6eAl/+NhjUOJd2x7IL2SN02ZFEq+kCXeFNkXaweyA2B1YRUYm2
         N29S7E8wP7bZ0oBKYt5GUk8ZokYshi6MzNFxygzSx7gCbmC7ldDT7jdZIDkhXgNGOj5Q
         7+uGrgf/AoRgTCl3eL2Ju2TWrDh1aNaEM13bY2T6afwfHe+HDHIpJGugPcvbMPk/atWT
         ii+7c9bh+nhR6dQSEL544Tq/SmQrrUj5Mn/A3mZ1Or4R1wkaJW5B2iE2INFNySMXRriV
         Jylnhp5abGhb8AXljFE9kQE2TL6bpaXHe09a2FOJXUHgqYgjFfCtUgMJ0K/DV32njUjx
         5A6g==
X-Gm-Message-State: AOJu0YyH3ssR60Y/xdAZ8iOHLRsLFjLW1VOgAPVWvP7FoN41E9eyKgwd
	GE/62nFvJpiX2wgmsmStt3IE/gURf5ywxqq9KNvhUxdBG5pChCH0CoS3ZQ==
X-Google-Smtp-Source: AGHT+IE61LW5V6bj6gwch1+BqkBmQWrk41mtyayTXzieFGzRMxvhoxQ7ri2BAWQ01TjCF/x50UvCzQ==
X-Received: by 2002:a05:600c:4748:b0:420:fed7:2903 with SMTP id 5b1f17b1804b1-42127814313mr40329915e9.15.1717097982860;
        Thu, 30 May 2024 12:39:42 -0700 (PDT)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be. [78.20.160.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd064afe3sm199600f8f.97.2024.05.30.12.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 12:39:42 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH v2] python3-flask: add ptest
Date: Thu, 30 May 2024 21:37:39 +0200
Message-Id: <20240530193739.694645-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 19:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110646

* test added to the fast list

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-python.inc   |  1 +
 .../recipes-devtools/python/python3-flask/run-ptest   |  3 +++
 .../recipes-devtools/python/python3-flask_3.0.2.bb    | 11 ++++++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index e07aaf3c0..2e701dc15 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -19,6 +19,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-click \
     python3-dominate \
     python3-execnet \
+    python3-flask \
     python3-flexcache \
     python3-flexparser \
     python3-freezegun \
diff --git a/meta-python/recipes-devtools/python/python3-flask/run-ptest b/meta-python/recipes-devtools/python/python3-flask/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb b/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
index 300ca99dd..99524b437 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.0.2.bb
@@ -8,10 +8,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
 SRC_URI[sha256sum] = "822c03f4b799204250a7ee84b1eddc40665395333973dfb9deebfe425fefcb7d"
 
+SRC_URI += " \
+        file://run-ptest \
+"
+
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/Flask"
 UPSTREAM_CHECK_REGEX = "/Flask/(?P<pver>(\d+[\.\-_]*)+)"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest
 
 CLEANBROKEN = "1"
 
@@ -23,3 +27,8 @@ RDEPENDS:${PN} = " \
     python3-profile \
     python3-werkzeug \
 "
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.39.2


