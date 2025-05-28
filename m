Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FECC3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 23:40:32 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.9374.1748475622914387057
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 May 2025 16:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EM1Ml7XO;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso154137b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 May 2025 16:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748475622; x=1749080422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MNm2+yjvBQnwQbXe51B5RBgVFlpFsuEUAOG2p80yKKk=;
        b=EM1Ml7XOh2/s/LRvX/rBaxQFVPmhXayTVPP9wRgjazlWO3XbFqw99ciLGDraYK6FnT
         M+RSMac+y5he81zLOT6k7J83rzLqcnb/oHFa4z8WziXEokMv0CGWT8Qss0hKraX2I9Qy
         NCCiYXicgF3RJGelm3tvfUYioSRcs1Lddo0kBQ5cEvCExbDzDuOVFYApuUoqQBz70qKK
         h29zUU6I6yQxmgVdBRKUQ7Vd+vPzN6BMJVnxi2U2kkutDGtxALxS8tbxCYzzsJYpOZ5j
         XubjNwGtYQP13Nn3ZPJuLem/6aPetCJ5KBVMybGHpx4DLF4UUaKKN6PPqII3yoS34dcn
         f2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748475622; x=1749080422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNm2+yjvBQnwQbXe51B5RBgVFlpFsuEUAOG2p80yKKk=;
        b=evCNsxhU9SmF1X1f3vQVX44RtsV5TrUpQTNBC7CsdA+UdVz7ljqCtn6Q7yhmw2PdWW
         LkMk4K4Z2fg0z3PDffaz7ijvNKBYK05cfeMeZyx/6NaXi/lPEx/RYjXBOLf41IR0fgfR
         F33oAS+n1e1svlMSjvlmxYyPf315AFSzzMgNFWjrEPPsmkt184ka5BO9YWj3iF0ksKyk
         JKz9ouZxacj1Y0T07WnRs+Wzis5ppVcjEfAgoZlDfYRXKJ5IqLKo2pQj5UOWnH44EU6c
         DQnQxV67NzQtIrIAIxqPz0zGHvK+CUSrflD/vbZbKFayTvbsKniF1mtXNDWcl7NI9avR
         3CPA==
X-Gm-Message-State: AOJu0YyYvQ5kKwJ5HrlPMyXzW/YcEGJvnSDMxjItiBCeIOmrqOT54BDs
	bFJBvqnmJshWpqmtxLZxJk5nqBA5M4znOAeZVAsBWE6DyzHKRpOA6SnUTpNQfDsu
X-Gm-Gg: ASbGnctsZyo+xSPyV3zmKSrWsU8gZ9VC87bKaRSpPm3TL7LQYAsiqruKvjwmNPZiNMe
	WFBjxdwRqSmG4kX139cwmyWHzk7UBN3I9VbHnGZGr7Pfh+c3tGhj+MvamiFlB8eGFTfY6MC2pFL
	uq7SbgDZ3+K6K54lpwE5NPGOUSaFu4+7suImnUygieagqyaZ8pbi2gAVdpyhkDsXqJObzISD/pt
	FkTxJFMK4/2VoHW/HzLaiQQxAkxsW4UfWuz0IhW99oeALPnppFMzcRNSgXWpZwH6VPgTxpoR7Yw
	hc5YLU89+uko7UDxEJEe6uVkp6ihBygi+GAqfgopgRQ=
X-Google-Smtp-Source: AGHT+IFf+2L8CnQm6Bj7icnh6XtDDbHPhmmE5pOiX1ZF9/sHUbPKBR+7u+fZEynp0jg/4tBLhhjIIw==
X-Received: by 2002:a05:6a21:999c:b0:1f5:882e:60f with SMTP id adf61e73a8af0-21aad7b9894mr5416626637.17.1748475622010;
        Wed, 28 May 2025 16:40:22 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe966c7sm156446b3a.8.2025.05.28.16.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:40:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] system-config-printer: Remove pyc files
Date: Wed, 28 May 2025 16:40:13 -0700
Message-ID: <20250528234014.3625637-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 May 2025 23:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117651

The pyc files contain references to TMPDIR and they can be regenerated
during execution on device

Fixes
stdio: ERROR: system-config-printer-1.5.18-r0 do_package_qa: QA Issue: File /usr/lib/python3.13/site-packages/cupshelpers/__pycache__/__init__.cpython-313.pyc in package system-config-printer contains reference to TMPDIR [buildpaths]
stdio: ERROR: system-config-printer-1.5.18-r0 do_package_qa: QA Issue: File /usr/lib/python3.13/site-packages/cupshelpers/__pycache__/installdriver.cpython-313.pyc in package system-config-printer contains reference to TMPDIR [buildpaths]
stdio: ERROR: system-config-printer-1.5.18-r0 do_package_qa: QA Issue: File /usr/lib/python3.13/site-packages/cupshelpers/__pycache__/ppds.cpython-313.pyc in package system-config-printer contains reference to TMPDIR [buildpaths]
stdio: ERROR: system-config-printer-1.5.18-r0 do_package_qa: QA Issue: File /usr/lib/python3.13/site-packages/cupshelpers/__pycache__/xmldriverprefs.cpython-313.pyc in package system-config-printer contains reference to TMPDIR [buildpaths]
stdio: ERROR: system-config-printer-1.5.18-r0 do_package_qa: QA Issue: File /usr/lib/python3.13/site-packages/cupshelpers/__pycache__/config.cpython-313.pyc in package system-config-printer contains reference to TMPDIR [buildpaths]
stdio: ERROR: system-config-printer-1.5.18-r0 do_package_qa: QA Issue: File /usr/lib/python3.13/site-packages/cupshelpers/__pycache__/cupshelpers.cpython-313.pyc in package system-config-printer contains reference to TMPDIR [buildpaths]
stdio: ERROR: system-config-printer-1.5.18-r0 do_package_qa: QA Issue: File /usr/lib/python3.13/site-packages/cupshelpers/__pycache__/openprinting.cpython-313.pyc in package system-config-printer contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../system-config-printer/system-config-printer_1.5.18.bb  | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
index f9a5e15689..6cd25e346a 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
@@ -26,12 +26,7 @@ do_install:append() {
     cp -rf ${B}/cupshelpers.egg-info ${D}${PYTHON_SITEPACKAGES_DIR}
     cp -rf ${B}/cupshelpers ${D}${PYTHON_SITEPACKAGES_DIR}
     rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/*.egg
-    for f in __init__.cpython-311.pyc cupshelpers.cpython-311.pyc \
-        config.cpython-311.pyc ppds.cpython-311.pyc \
-        installdriver.cpython-311.pyc openprinting.cpython-311.pyc \
-        xmldriverprefs.cpython-311.pyc; do
-        rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/cupshelpers/__pycache__/$f
-    done
+    rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/cupshelpers/__pycache__
 }
 
 FILES:${PN} += "${libdir} ${datadir}"

