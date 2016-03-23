Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA0960290
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 20:02:47 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q184so1069436qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QN+ry9echC/9YW2Hk5e4VGNgC68OeUGq1/TNLUwZuos=;
	b=W748MFEfFAlR1anVTbeq/Bhm2JfhIM8EF0r2CtqENmtbkkiW5oBoa78OHRNh3bWuYL
	oxg7xtmMLV/ng+IfPdDhZFMQ5LFL5tiZ41i7VsUwScrAgOxlHYO96VPFOCJpuseFWbp/
	a2Jd1kfrP4Q39YpA9euf7vhZjB+Vv0xkC98jaLTroGxNqCQLpb4aJaYQ9FYIRPOoeMm/
	NCzB0d2HW3k3Q0kJYq4XAxBHBO7xObpqT2bJ9jq6QXgtvJ1RfumtRfUx4ugRpV3O4ROi
	AgKvCGCMVWcRz2dKc9YqpLcX+yzGdkbEA3n92PRHfLQXNDSV0WaYHQBHiikOUvUsR0Dc
	oWyw==
X-Gm-Message-State: AD7BkJKCf6prsWZ1rMHaeeINQ6Hl+n6DPIQ16uT+TqE6Eq9D/7TK4jsacAvwGY6nhCuwUw==
X-Received: by 10.55.76.84 with SMTP id z81mr6005588qka.17.1458763368394;
	Wed, 23 Mar 2016 13:02:48 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	a102sm1752180qgf.21.2016.03.23.13.02.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 13:02:47 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2016 16:02:01 -0400
Message-Id: <1458763321-30761-6-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458763321-30761-1-git-send-email-derek@asterius.io>
References: <1458763321-30761-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 6/6] python-pyusb: update to 1.0.0b2 and use the common pypi
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
X-List-Received-Date: Wed, 23 Mar 2016 20:02:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyusb_1.0.0a2.bb    | 18 ------------------
 .../recipes-devtools/python/python-pyusb_1.0.0b2.bb    | 10 ++++++++++
 2 files changed, 10 insertions(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyusb_1.0.0a2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pyusb_1.0.0b2.bb

diff --git a/meta-python/recipes-devtools/python/python-pyusb_1.0.0a2.bb b/meta-python/recipes-devtools/python/python-pyusb_1.0.0a2.bb
deleted file mode 100644
index 360f213..0000000
--- a/meta-python/recipes-devtools/python/python-pyusb_1.0.0a2.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "PyUSB provides USB access on the Python language"
-HOMEPAGE = "http://pyusb.sourceforge.net/"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a53a9c39efcfb812e2464af14afab013"
-DEPENDS = "libusb1"
-PR = "r1"
-
-SRC_URI = "\
-    ${SOURCEFORGE_MIRROR}/pyusb/${SRCNAME}-${PV}.tar.gz \
-"
-SRC_URI[md5sum] = "9136b3dc019272c62a5b6d4eb624f89f"
-SRC_URI[sha256sum] = "dacbf7d568c0bb09a974d56da66d165351f1ba3c4d5169ab5b734266623e1736"
-
-SRCNAME = "pyusb"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
diff --git a/meta-python/recipes-devtools/python/python-pyusb_1.0.0b2.bb b/meta-python/recipes-devtools/python/python-pyusb_1.0.0b2.bb
new file mode 100644
index 0000000..d279abc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyusb_1.0.0b2.bb
@@ -0,0 +1,10 @@
+SUMMARY = "PyUSB provides USB access on the Python language"
+HOMEPAGE = "http://pyusb.sourceforge.net/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=50d46bda6248a0b4a46a6d59a66ee08e"
+DEPENDS = "libusb1"
+
+SRC_URI[md5sum] = "bc12e83ff3ef1045d4306d13a9955fc1"
+SRC_URI[sha256sum] = "14ec66077bdcd6f1aa9e892a0a35a54bb3c1ec56aa740ead64349c18f0186d19"
+
+inherit pypi distutils
-- 
1.9.1


