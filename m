Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id D088B780CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 17:57:52 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id f55so63972276qta.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 10:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Jx8TIsDlXvEencJRRLPmMqAJFEWEPmch8GqVqAr7a3Y=;
	b=K4bLEL9MifWhB2T84EAuPbk/Xgf4xtbo8Ob8+6zDRXt64f4AmXj26B3AENMB8WLo38
	aZXFp1rkgnmxkLlwpWoqX1pnF0sw0FEuZ4gMSzLad5y6XU4GjU3ORVZ3eA5A+CdAeOa9
	qrPVnAgYgV8MmcNQtQX9E3ERwShDF27XeB2IVdjh/mg2HX7osLASV+kX5YJyDYmbt51Y
	xGz5wTQ15dPi8vk8N9BOIin/h7psBnUeWJXUEEg9lrq02FSvUpklaNdU0XmXg0ncaHCP
	5I5qswjHOKfYC2Bp3qZ9gsqZ8bR7D1OmyuBZXgBhCuYvaBQzbK7FxQWOa9GV/2ljgR+c
	bibA==
X-Gm-Message-State: AODbwcDsB3Z4kT2sKFRfKMWbUPB8oQP1Zffhs/a3yhaEbvn4V+KxXqbR
	ZeoI3blZJ5R+Wg==
X-Received: by 10.200.41.135 with SMTP id 7mr9805237qts.85.1495216673674;
	Fri, 19 May 2017 10:57:53 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id 47sm6486222qts.26.2017.05.19.10.57.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 10:57:53 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 13:57:41 -0400
Message-Id: <1495216661-25472-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.71
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 May 2017 17:57:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc               | 6 +++---
 .../python/{python-pymisp_2.4.67.bb => python-pymisp_2.4.71.bb}     | 0
 .../python/{python3-pymisp_2.4.67.bb => python3-pymisp_2.4.71.bb}   | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.67.bb => python-pymisp_2.4.71.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.67.bb => python3-pymisp_2.4.71.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index fe25b50..6c36cc9 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "Python API for MISP"
 HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2e1efdc433498cebd33ec277ad8741e5"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=97a1b2b62a1315b13e1d7f1f633624ee"
 
-SRC_URI[md5sum] = "5320f41bf96cf22d13af7eb31e1d321f"
-SRC_URI[sha256sum] = "6c7bd97f0ea9c7eb1935902f1bc6fc1ec27eba86056c5b938234a7229891d5a2"
+SRC_URI[md5sum] = "c82084718360bb3ad92eb48a07ec8914"
+SRC_URI[sha256sum] = "ad36f7c4507dc06afaff4166d83c86da12efb839854752720b6fdbc9bb3e20e8"
 
 RDEPENDS_${PN} += " ${PYTHON_PN}-requests ${PYTHON_PN}-json ${PYTHON_PN}-jsonschema"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.67.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.71.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.67.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.71.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.67.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.71.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.67.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.71.bb
-- 
2.7.4


