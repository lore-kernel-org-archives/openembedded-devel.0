Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id D0F4471A23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 02:32:16 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id x190so29480344qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 18:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XCt9SsCrfaarTgBZUzzTrRpvfjEundutspicmyZkATo=;
	b=Rnqmhb4l4B9c24j8cPiJDi+XojaiV6fFjYXY2leNY1b9Izp9q9jsS2cXdcB7GujDxF
	PhA743yRyTObCO1eK6ToCdB/6tV9EmyWDlcz/Pffwhkqx4mk/TDTahF4Gn66glNqJQdd
	oe6fouwmN/v1llgNq2BHUzIjui+zsvM8J9jSiImR9sK7+mXHwNQRck4xXVRzepPJ1tm0
	p9tj3BjHrADsfprikk8spr5dbS3Cl0tMyqnrxEZnoQmQCC6PRo8udrr/Bjw3gZJFFCvk
	j/4a9oQIUsuKVhDu9AI/QyN1nSr9E23eTeDfvkHndbsy2EzhzgBQgO52/de7On5FpPMI
	/mBQ==
X-Gm-Message-State: AKaTC01KlAuCYxGzke5XtQeLzoTS1drs39x4uu27qMDXrl8iLFZyW9wC03eR4MZnUKmGBQ==
X-Received: by 10.55.22.18 with SMTP id g18mr7662657qkh.75.1479436337547;
	Thu, 17 Nov 2016 18:32:17 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	g79sm2616993qke.26.2016.11.17.18.32.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Nov 2016 18:32:16 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Nov 2016 21:32:03 -0500
Message-Id: <1479436323-26549-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pycparser: update to version 2.17
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
X-List-Received-Date: Fri, 18 Nov 2016 02:32:17 -0000

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
index bf3b757..88646f0 100644
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
+RDEPENDS_${PN} += "\
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
index 0000000..0bd1c8f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycparser_2.17.bb
@@ -0,0 +1,6 @@
+inherit pypi setuptools3
+require python-pycparser.inc
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-netclient \
+    " 
-- 
2.7.4


