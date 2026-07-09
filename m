Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9310CC43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 13:09:31 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8866.1783602570035587879
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2026 06:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QGc1KVCo;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so10936235e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 06:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783602568; x=1784207368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfvy5Z4/wl3wkc1y27HDAJJU3fASy6ca4C2R03bZrqQ=;
        b=QGc1KVCoMlvWsfVlOHyc//sEIP87N6bM1+nMmhM8mQURWAfpM7SP8Asxr4T6g48Mro
         IjmMUIdrhMcSdBHuHj6yAEB/dpLi2WrbhMvrB79E96cakBMO7it7bXtBUdHArqXN9nKM
         QJSd2p6IDDFoDk7A6+ujj/9yIjJ50wjp7H5O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602568; x=1784207368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nfvy5Z4/wl3wkc1y27HDAJJU3fASy6ca4C2R03bZrqQ=;
        b=X84QOmwrpXKkYv9DhA4K/WQl57uO556DPPE16usts3P6CmZ9u9BxZ1Sfw/2Dp2WEHq
         q1b4sPUBxmPJyNEMRp7VDQJJme+eXx5AS3mg113gyoyHNemOQn8NgLXiv6Dvr7RZ+bMr
         fIR6w6512bDetISaxDDYnVrWevF9bkyLEddKe9BMUSMeTCvEO4ToEDoVAk73ssXHnXfr
         6oGGzy3/iQr/zLrehOdKc9fsTxu1I70zUeT6KiYGi/RQMBj6/4lsPayTLz5eIKpW9+me
         7Upnku4nYqW3+fIPnkp/wnm9JqYJ2Bpa6kxqia0yA3vQCwMRBwd8Px/x/0AfBw3kNJks
         nIlg==
X-Gm-Message-State: AOJu0YwuGJwzmWclbRyK5gVhVdZ1rc9O7hcIwLwlS+8kdyEqm8AMaFKi
	qEGa89ePtOdER2BBKeB6kW7bQndvadr4v2F9SpYcPaNByNssliTD3Ziafsqw95I+sNv3apMBl6y
	AhApo
X-Gm-Gg: AfdE7ckWeeK6GUdZjqwKTO1aSA4Bwaej/CAB3sGhkSnkooy5BgEcFiM7d613iHH6Hpo
	yOICnori6A1TCym74gh5tL5MsVbARn4Ywx8YOKTEWvHEacviESsX3FFfGigZ9H8+jzr2L/v12xQ
	bOqJgqRGuNVw5fIYYCfCMtp5Sge+LKZE16O66QevI7SarQrooFDzbAdghKIxQfgxbTYYlDuTA5O
	0fSn1RhMOiJuiNZwmXBUYS+6N4qbggI2r8dIYB/wK8WawslRYUmSezdM+X6aqzzC1nRla4T5mak
	DFIXRG0p3JBRR7jnhtsjOalpVZsI6PlMz9CstZYcSCU+WfvfBIyNvtI70MB3yAoFV1NIvyHVk4R
	scTLOch05bKoaS0KA3CoYpfDmmQdpd5JhVN6/4kaL1mCJ0eIp6s1Cj09MAS8yFlcbE6RjCN3hPZ
	YVIiRoKYxBiYcStQ/DDCmdkkY9xGhrKLSNXB+QTV0Jsmk4zF1LOnn+5f6ix6wPEVR3htAfv69pz
	AsDisC0lvz471eiTNoZW1u/CZEMCHmZkHQgALQIoQ==
X-Received: by 2002:a05:600c:3115:b0:493:c862:3f2d with SMTP id 5b1f17b1804b1-493ed78e5bfmr22084175e9.5.1783602568351;
        Thu, 09 Jul 2026 06:09:28 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6cccfdsm61032835e9.1.2026.07.09.06.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:09:27 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pybcj: Enable tests
Date: Thu,  9 Jul 2026 16:09:20 +0300
Message-ID: <20260709130921.4185087-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260709130921.4185087-1-leon.anavi@konsulko.com>
References: <20260709130921.4185087-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 13:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128124

Inherit ptest and include tests for pybcj.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pybcj/run-ptest            |  3 ++
 .../python/python3-pybcj_1.0.7.bb             | 28 ++++++++++++++++---
 2 files changed, 27 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pybcj/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pybcj/run-ptest b/meta-python/recipes-devtools/python/python3-pybcj/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pybcj/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pybcj_1.0.7.bb b/meta-python/recipes-devtools/python/python3-pybcj_1.0.7.bb
index 299677b072..e291375456 100644
--- a/meta-python/recipes-devtools/python/python3-pybcj_1.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pybcj_1.0.7.bb
@@ -4,11 +4,15 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "72d64574069ffb0a800020668376b7ebd7adea159adbf4d35f8effc62f0daa67"
-
-inherit pypi python_setuptools_build_meta pypi
+# The PyPI package omits files for testing
+# so use the GitHub source instead.
+SRCREV = "0735ad15fa001748dc3a13f36be2fe7a4971cf79"
+SRC_URI = " \
+    git://github.com/miurahr/pybcj;branch=main;protocol=https \
+    file://run-ptest \
+"
 
-#PROVIDES = "python3-pybcj"
+inherit python_setuptools_build_meta ptest
 
 DEPENDS += " \
     python3-setuptools-scm-native \
@@ -22,3 +26,19 @@ RDEPENDS:${PN} += "\
     python3-core \
     python3-compression \
 "
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-core \
+    python3-datetime \
+    python3-crypt \
+    python3-compression \
+    python3-hypothesis \
+    python3-unittest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.47.3


