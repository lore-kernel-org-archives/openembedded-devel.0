Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id BF009786DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:17:12 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id t74so351879wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TypW7dOKwZ0hX05+U//YPlUym43qp1cA18h1DrAgJsM=;
	b=TJ5d5vWwZkq74N9DTf4K1qykedgZhag6GinqK4NBPS6QTbWgeQXIfY+JAavUJ5VmfR
	7BO52OeqSS5t5+h7qmcUl5djiQj48NSfSa0f2l5iT6uOsKoeJzeriLUxlhCVeExCTm2F
	54fY0D/mAqzveiWf3zs1l8F+I3KjezLoMmC9bOGbI3K312MVqgOB3BFYMkkBmIwuMyPe
	PZqfxHjM2uoikBXzd9bS7n6ZLBTs1jvGPVmpH9eNHWqPx4zLMBNGJKF0EtaiVHVpZ1z1
	5QkUZ72dTaRjSZ0Jl3bhxx5J+cJOk2JEUUr3qbAafkD7XVBgT6uUI8wVgFhO9ZcsaHcq
	i2wA==
X-Gm-Message-State: AKwxytdPKGEZ9dpba2fJocx1T9ys+C7ddFMYCa5Xj9SMitJuJG6SpjK/
	m3uA/VXuBzson/sVrsZs9YddWz19
X-Google-Smtp-Source: ACJfBotZiZWKGTpRdUInU9rcyWZqiJx1CpEvW5Tsx2VNOiMfegq+vzG/oSngXXL0jrUYYW7F/V54OQ==
X-Received: by 10.80.181.130 with SMTP id a2mr25820057ede.287.1516007833178;
	Mon, 15 Jan 2018 01:17:13 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 15sm780937eds.54.2018.01.15.01.17.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 01:17:12 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:17:07 +0000
Message-Id: <20180115091707.1539-6-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180115091707.1539-1-git@andred.net>
References: <20180115091707.1539-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH 6/6] python-pyjks: add initial recipe for version 17.1.1
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
X-List-Received-Date: Mon, 15 Jan 2018 09:17:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../recipes-devtools/python/python-pyjks.inc       | 22 ++++++++++++++++++++++
 .../recipes-devtools/python/python-pyjks_17.1.1.bb |  2 ++
 .../python/python3-pyjks_17.1.1.bb                 |  2 ++
 3 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyjks.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pyjks_17.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjks_17.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pyjks.inc b/meta-python/recipes-devtools/python/python-pyjks.inc
new file mode 100644
index 000000000..d866c5650
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyjks.inc
@@ -0,0 +1,22 @@
+SUMMARY = "Pure-Python Java Keystore (JKS) library"
+DESCRIPTION = "PyJKS enables Python projects to load and manipulate\
+ Java KeyStore (JKS) data without a JVM dependency. PyJKS supports JKS,\
+ JCEKS, BKS and UBER (BouncyCastle) keystores."
+HOMEPAGE = "http://github.com/kurtbrose/pyjks"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9694d6cc724caf7f7386be88a4a81958"
+
+SRC_URI[md5sum] = "d53501e7c80d465969742bc6bee91d49"
+SRC_URI[sha256sum] = "709c44a303dd6b2464078ebeb677417e717818d4b3dc3844a462bef9d215dcc8"
+
+inherit pypi
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-javaobj-py3 \
+    ${PYTHON_PN}-pyasn1 \
+    ${PYTHON_PN}-pyasn1-modules \
+    ${PYTHON_PN}-pycryptodome \
+    ${PYTHON_PN}-twofish\
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pyjks_17.1.1.bb b/meta-python/recipes-devtools/python/python-pyjks_17.1.1.bb
new file mode 100644
index 000000000..ce99f2835
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyjks_17.1.1.bb
@@ -0,0 +1,2 @@
+require python-pyjks.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-pyjks_17.1.1.bb b/meta-python/recipes-devtools/python/python3-pyjks_17.1.1.bb
new file mode 100644
index 000000000..8982fcebc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyjks_17.1.1.bb
@@ -0,0 +1,2 @@
+require python-pyjks.inc
+inherit setuptools3
-- 
2.15.1


