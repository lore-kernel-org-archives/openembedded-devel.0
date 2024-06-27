Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB668C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 22:41:21 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.5045.1719528080964076018
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 15:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l4hu/9G+;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4256742f67fso8340795e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 15:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719528079; x=1720132879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hi0WX1b7ZvmPl5wsp87N4fhJqzOMmACYY0F1O56PdnE=;
        b=l4hu/9G+EPRXOINdgRZyDK6RmlE0UhsO1rn8e3FHmO+/Mz0xpDhgH/++h56nWHTgJa
         ZUMpZjQFM3uUmuQoMtQI+1EqKCeetcITHFinm1teRWZIjVrdXdmxVYlMNW/fs0KNC6un
         i0SDg30QzqwPx6AicVRsuPFiZX+AAjgPV4i05Kd6RifcmOiWVDhwFo8tQ4qu32KWf3+S
         cEFeKpTkJE3j2md0th6m9riR6EdAXfZPDi1IFAi3fc4ys44/9rXz61b9r7wo64PLeNUI
         jN+zblkWCQtVoWV+7XoORypfsCcE4CpckIrOy8OM41l+juEgxrDS69MZ5EUVIPDRT6w/
         7BQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719528079; x=1720132879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hi0WX1b7ZvmPl5wsp87N4fhJqzOMmACYY0F1O56PdnE=;
        b=SZd1ctWIWp54FUYRtaP3c8DDLG5va997yfLkLIqnSfePwSmWMvUx/Roh4JI78h7Szq
         jYD5i5qoKXd69n7eBQMbC1wj+nssTiuk/jXeG+zl6kKVUbUr243jVc25qd/oBtl1Mi+M
         ODWYqJL4GQ5csmJRtZ7iEKQ5A9UcDawY8raNu7DFaEJgtrofTE5BTuCHto9xwZDnKFZa
         jyUM+8vm/YfFawUgdwHkGPtaUyru+O/PlZTKmjl5dRTvjKArxA64ASxDH52CftiuXtLz
         CSOdnkxbRv1KZIFywyyHPBB7bWxZ5BvQfAWeNcuFXVxywf/eiOHvNlEmS+K0J7lxDe3+
         9tYA==
X-Gm-Message-State: AOJu0YyyFsb7CVK+MXkOMDYgBwK2P2GL1yjZVRMwKmqcbEeFGKZIKoka
	ekp0bjpHoB0b+a0z8L7NKVyv0fEghOtlyvpV/IWnqtjnpQkW9Z28t3FKsQ==
X-Google-Smtp-Source: AGHT+IGE2JnvHBCa73e3qvNM0tcsfHetSb7GpamDTyrtQr3HuPtccDYiTqvK0x1p/lr9gdq0rcjb0g==
X-Received: by 2002:a05:600c:89a:b0:425:68f0:623c with SMTP id 5b1f17b1804b1-42568f063f4mr10337705e9.8.1719528078944;
        Thu, 27 Jun 2024 15:41:18 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b064f16sm9719935e9.27.2024.06.27.15.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 15:41:18 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][PATCH] python3-bleak: upgrade 0.21.1 -> 0.22.2
Date: Thu, 27 Jun 2024 22:41:12 +0000
Message-Id: <20240627224112.198171-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 22:41:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111131

Changes to the build:
- Drop python3-async-timeout which is only required for Python 3.10 and older.

Changelogs:
* https://github.com/hbldh/bleak/releases/tag/v0.22.2
* https://github.com/hbldh/bleak/releases/tag/v0.22.1
* https://github.com/hbldh/bleak/releases/tag/v0.22.0

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../{python3-bleak_0.21.1.bb => python3-bleak_0.22.2.bb}  | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bleak_0.21.1.bb => python3-bleak_0.22.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb b/meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
rename to meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
index 96f3fcbcf..36a823a9b 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
@@ -3,13 +3,10 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRCREV = "054b092e19c7a45d5ea07d8948022f54117fe5e8"
-PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop"
+SRC_URI[sha256sum] = "09010c0f4bd843e7dcaa1652e1bfb2450ce690da08d4c6163f0723aaa986e9fe"
 
 inherit pypi python_poetry_core ptest
 
-S = "${WORKDIR}/git"
-
 SRC_URI += " \
 	file://run-ptest \
 "
@@ -26,8 +23,7 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += " \
-	python3-core (>3.7) \
-	python3-async-timeout \
+	python3-core (>3.8) \
 	python3-dbus-fast \
 	python3-xml \
 "
-- 
2.34.1


