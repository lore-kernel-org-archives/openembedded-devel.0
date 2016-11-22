Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2459E71A78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:46:57 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id h201so7574315qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 15:46:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=B7jD6gpUpbQ0W0DLFUkKB27LSgxaDbvJUWHMghCX0dU=;
	b=HU5k6rv/UfVRQW7iNkPejEGM+yWNWkHJ5rfJPQkcCVtX1MxGWra5UtfIq7hilLPtO2
	KRMQqGZFyeiQxSoJa/kWz0gH/nbQ3Z+HECFsSiMVpEY0OzwoyWEgWcHcSihrwiUqdJuC
	clA+5TgybuhagUVbLidY3hvtXg+wN55vbwBbK2mhYqfsb1q5KjSss84DTXQcT86z6kLr
	indWd+EToWAmSL0hTPq74KCUIRFfvgtQejEGRmubGThC3TmfllZVVVmTgHixtjdd2CkY
	jasIzWq417+WSThoTUcIrrBz3/E321A5bq6nUCuesnuFX14DZzGlTtnePbTX/qm5kWJK
	meXQ==
X-Gm-Message-State: AKaTC02i5wG7j5uzsegfZYYTo1Shi9Js7vgNJklvv0zxz3yrN9NRaX3bOwgc7xovUgmbiw==
X-Received: by 10.55.33.2 with SMTP id h2mr234902qkh.230.1479858419098;
	Tue, 22 Nov 2016 15:46:59 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	h43sm14967931qth.29.2016.11.22.15.46.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Nov 2016 15:46:58 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Nov 2016 18:46:39 -0500
Message-Id: <1479858399-6837-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-pycparser: update to version 2.17
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
X-List-Received-Date: Tue, 22 Nov 2016 23:46:58 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pycparser.inc       | 10 +++++++---
 .../{python-pycparser_2.14.bb => python-pycparser_2.17.bb}     |  0
 meta-python/recipes-devtools/python/python3-pycparser_2.14.bb  |  2 --
 meta-python/recipes-devtools/python/python3-pycparser_2.17.bb  |  6 ++++++
 4 files changed, 13 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pycparser_2.14.bb => python-pycparser_2.17.bb} (100%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pycparser_2.14.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pycparser_2.17.bb

diff --git a/meta-python/recipes-devtools/python/python-pycparser.inc b/meta-python/recipes-devtools/python/python-pycparser.inc
index bf3b757..fe8c34d 100644
--- a/meta-python/recipes-devtools/python/python-pycparser.inc
+++ b/meta-python/recipes-devtools/python/python-pycparser.inc
@@ -1,8 +1,12 @@
 SUMMARY = "Parser of the C language, written in pure Python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8fb364772b1441821d391591f340c35a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d0cfca7bbc0610f849707d9e4fd82eac"
 
-SRC_URI[md5sum] = "a2bc8d28c923b4fe2b2c3b4b51a4f935"
-SRC_URI[sha256sum] = "7959b4a74abdc27b312fed1c21e6caf9309ce0b29ea86b591fd2e99ecdf27f73"
+SRC_URI[md5sum] = "ca98dcb50bc1276f230118f6af5a40c7"
+SRC_URI[sha256sum] = "0aac31e917c24cb3357f5a4d5566f2cc91a19ca41862f6c3c22dc60a629673b6"
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-subprocess \
+    "
diff --git a/meta-python/recipes-devtools/python/python-pycparser_2.14.bb b/meta-python/recipes-devtools/python/python-pycparser_2.17.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pycparser_2.14.bb
rename to meta-python/recipes-devtools/python/python-pycparser_2.17.bb
diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.14.bb b/meta-python/recipes-devtools/python/python3-pycparser_2.14.bb
deleted file mode 100644
index b30db54..0000000
--- a/meta-python/recipes-devtools/python/python3-pycparser_2.14.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-pycparser.inc
diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.17.bb b/meta-python/recipes-devtools/python/python3-pycparser_2.17.bb
new file mode 100644
index 0000000..7cc024e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycparser_2.17.bb
@@ -0,0 +1,6 @@
+inherit pypi setuptools3
+require python-pycparser.inc
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-netclient \
+    " 
-- 
2.7.4


