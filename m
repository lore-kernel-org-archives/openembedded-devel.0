Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A510BC44501
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 13:09:31 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8822.1783602566623188385
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2026 06:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=N1TcYpiQ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so14870815e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 06:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783602565; x=1784207365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HOIqr00HV0aaPjNwVmncDf7YhdH74F/KdMX3YTZ5mrk=;
        b=N1TcYpiQcRCZc6icSppabjMfF/UTFmjMf40Lu24gp6d4VpMTeGof/rxPxo6S65K3Eu
         JS8z0b/OegNvlK5+R6eyq5NJTNRJGhcPP+VzJZq92JYwuQXIIYjDIApoOAQhIerEOiBv
         5+yArIuYYfsFd6ROg6rIBtkJf7LFShBiLlxWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602565; x=1784207365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HOIqr00HV0aaPjNwVmncDf7YhdH74F/KdMX3YTZ5mrk=;
        b=Z/FcvYtwYXBoHfO4RnWrDSb05P92iylSiGHr/M4BkLHVIA6RwtdVGPFoxB2bqf1sxz
         GKfjFn+lmBK3Buh89ITPQZ+jBKJyhsf2gbs/81245Jt46ODlYvaojQ8XyAp81NcqtWGm
         A9kYWzf7Bgx2ujQPCLnLwMAtB5q3yNi8b2eQjbrAj0+iFtwBNYClOgDiMRficSVfbFPb
         rcmUCKfngzg1slwhnmbs9nK00D4RAWWLMfHgk6TOGycdSKb0ep66KBVZZKPnOFw7VKEI
         CNyp8A2kNtkJOreKdgQ6cWVG/R8rZ06+xTxqqvJoVIbiiv2mdPEMVCfMJpeSIynIXqGD
         JOwA==
X-Gm-Message-State: AOJu0Yx0ZX3UL/D/rhY4RNOcVWDEccZU+76LEwUpF4Hj2A9lTNxDIG9B
	sR003tWAcRvXb+7vqUyDXiHARiII2CS57/rIsQ9jP1w/bURVz4vyhqvbKkcAO65rlPzt/ZzETiB
	mtLHt
X-Gm-Gg: AfdE7cn3W2OtoS99C4iMhzl+GbrZ7KJcfQ9EOXSQYWdVIN0XiKzLi0BKk4IHzxPYeDb
	bAe9xuUB0ksuYz8cK5I1ACxya+oBItpKFE6krqswhkPAh/NOMbhJXAch5cRkaVydlsn3yCs8sO0
	Td3QwA8O2wc9f5aLfoT+B96HYdmFDy6h3b7U/5jfHpqcIOB+9AFeFHTMqYl0GRu05s3dCDkm5y4
	JLtf96Pm19viB1ltfTsSnckH7AL6eZClsURUMHGaAQnFuYzbcotgL5KO9t+p9J/Zg8PAH9YRclB
	z507YSSv0LklRv0rDMajWF9u85l7wDomPKd64uiduFDGRLH8KCb3g9dZbLTZyexNjvAmT+CLbsK
	7LdmW8T9oY5tDNW8smznbsQC482c9VIsgxRShhoGClm93jwXyPjj0ihOeCi3kw2Y38C+AxAjIgq
	JObyZ70gDQXHDneovjJj33tnr0TGCl8KGeCkq7o4+QVXtmUOZ28G0Cd/Zz6VkHfj02fiDfu/8wc
	WuT0WbpxGuFiWtGA373QGwmNuvZE3KCu/+AWtVTww==
X-Received: by 2002:a05:600c:4ece:b0:493:c337:db1a with SMTP id 5b1f17b1804b1-493ec874dd9mr27232095e9.38.1783602564569;
        Thu, 09 Jul 2026 06:09:24 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6cccfdsm61032835e9.1.2026.07.09.06.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:09:23 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-jsbeautifier: Enable tests
Date: Thu,  9 Jul 2026 16:09:17 +0300
Message-ID: <20260709130921.4185087-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 13:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128121

Inherit ptest and include tests for jsbeautifier.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-jsbeautifier/run-ptest     |  3 +++
 .../python/python3-jsbeautifier_2.0.3.bb      | 23 ++++++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-jsbeautifier/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-jsbeautifier/run-ptest b/meta-python/recipes-devtools/python/python3-jsbeautifier/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jsbeautifier/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.3.bb b/meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.3.bb
index 635dc69a13..05de25c3fc 100644
--- a/meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.3.bb
@@ -4,11 +4,11 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "9579d4e9dbaa00383f3efdff4c98c8140bb85ba319398e8b97cdaba27abd6ba3"
+SRC_URI += "file://run-ptest"
 
-PYPI_PACKAGE = "jsbeautifier"
+SRC_URI[sha256sum] = "9579d4e9dbaa00383f3efdff4c98c8140bb85ba319398e8b97cdaba27abd6ba3"
 
 RDEPENDS:${PN} += "\
     python3-core \
@@ -16,4 +16,21 @@ RDEPENDS:${PN} += "\
     python3-shell \
 "
 
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-core \
+    python3-unittest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/${PYPI_PACKAGE}/tests/* ${D}${PTEST_PATH}/tests/
+
+    cat > ${D}${PTEST_PATH}/pytest.ini <<EOF
+[pytest]
+python_files = test*.py
+EOF
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


