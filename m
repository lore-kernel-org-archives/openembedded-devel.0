Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id CE9DD719AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 17:33:11 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id k123so3632756qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Nov 2017 10:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3khSfi0Hx6eip34atkpDtAVVjvkHo5C0cyJdMotrFvs=;
	b=OwBfbmnITjBHNnXHHu4OWElTHIzagFNcqZyP8t+1LttHNu+XGNrfexl1+jSOdW3Hhq
	XQspX9VSD8oP9F9LhOvNwnqR9Hs+6fLd8HF6blbrxYQ9UWGPJyTtAeRJU2nElxnQmIJH
	0dFdrF0H5wU/4/hYLeAQj06PjJPeGNh6x656jO2+yw9qTkX/eqCy4AAjhXtEhJtxN3hG
	SA3x2tdEvusMj8lnQloJJEK2k82dLRh6/OsSXsN88xgk+pVxcPT/KKMriNBJFrI+sZXm
	m5/Fk9hEUI37CjtaA+vDt3ASp+jfY5aoNPsUbwCntQ7Sa00l76H1MDzyrvBErYhsyoAM
	b8BA==
X-Gm-Message-State: AMCzsaVw/Rag1+QQNDosZ0pVRqyzWj1xO8xBP2iowaqO8pSaGE6fJTPf
	72zpzh+efZXEHDWclhR0tH9RBUCq
X-Google-Smtp-Source: ABhQp+Si2yH6Moq89TY1xIebKK04W9b3PL3WovUdN6dzVU/R/F1oX2NzLEJCUNVqhFS0ELolywUPyg==
X-Received: by 10.55.107.3 with SMTP id g3mr979226qkc.24.1509557592058;
	Wed, 01 Nov 2017 10:33:12 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id z55sm782227qth.24.2017.11.01.10.33.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Nov 2017 10:33:11 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Nov 2017 13:33:03 -0400
Message-Id: <1509557583-26065-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-twisted: clean-up the dependencies
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
X-List-Received-Date: Wed, 01 Nov 2017 17:33:12 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-twisted.inc        | 4 ++--
 meta-python/recipes-devtools/python/python-twisted_17.9.0.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index 4bd4788..0dd584f 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -41,16 +41,16 @@ PACKAGES =+ "\
 
 RDEPENDS_${PN} = "\
     ${PN}-bin \
+    ${PN}-core \
     ${PN}-conch \
     ${PN}-mail \
     ${PN}-names \
-    ${PN}-news \
     ${PN}-runner \
     ${PN}-web \
     ${PN}-words \
 "
 
-RDEPENDS_${PN}-core = "python-core python-zopeinterface python-contextlib"
+RDEPENDS_${PN}-core = "${PYTHON_PN}-core ${PYTHON_PN}-zopeinterface ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink ${PYTHON_PN}-automat"
 RDEPENDS_${PN}-test = "${PN}"
 RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
 RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
diff --git a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
index 3b45110..2be1709 100644
--- a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
+++ b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
@@ -1,4 +1,4 @@
 inherit pypi setuptools
 require python-twisted.inc
 
-RDEPENDS_${PN}-core = "python-core python-zopeinterface python-contextlib"
+RDEPENDS_${PN}-core += "${PYTHON_PN}-contextlib"
diff --git a/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb b/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
index 98016cc..d7533d8 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
@@ -1,7 +1,7 @@
 inherit pypi setuptools3
 require python-twisted.inc
 
-RDEPENDS_${PN}-core = "python3-core python3-zopeinterface python3-lang"
+RDEPENDS_${PN}-core += "python3-lang"
 
 FILES_${PN}-core_append += " \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/__pycache__ \
-- 
2.7.4


