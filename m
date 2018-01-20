Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id DA84578733
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jan 2018 16:02:27 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id c2so11073064qtn.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jan 2018 08:02:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tgp5Cxp/CtSLV2Jt1TApP3xD7B5mscEbRb//UyUMj4Y=;
	b=hMtqr5YVGmJUsJK/GYbS3/wJbSmN9IZHRrR5wxDZLkp2idID9SF1tqL5VvlRVY06aL
	HIV7+yuEfuJZd0GO8V2inWpLSufmoUmVBCSUdHnmjS9H/AOxarlGzULwJg+cJxqd7uIJ
	e/OZeI2Z7gj/XEiiTF/4QoyfCvx0RkKOJJ7z+IdRsu/78Ymbm3wPpR+WCCpSxaFHb4a2
	/ut/Pul2wqYHgNJc0ecKCUM/lGPuW06afnh7hXDz0qGtn8s7s6zB93I5f7mpeEjel33v
	Q3kDsffWvGqX3w5FoDOoUHdD8seY+T7yEZWjgQKw+kSL9zFKcFokOV+dSWPKwfSyrFIG
	qvhA==
X-Gm-Message-State: AKwxyte4/LzwebBjzojcskWns130f98v3Scxm1V28NlI5ul6esixEDkZ
	GzKZl3glDo/CvX5RjyztWhvCg6lS
X-Google-Smtp-Source: AH8x2261xpvmiit/P29M0NxTTeu2wJUtkTUBvWiOi+rdzNVj9jceWFUaeUI3eqnxVRyhbH/rhDpdFw==
X-Received: by 10.200.9.80 with SMTP id z16mr2801794qth.166.1516464148539;
	Sat, 20 Jan 2018 08:02:28 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	h55sm8520312qta.75.2018.01.20.08.02.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 20 Jan 2018 08:02:28 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jan 2018 11:02:21 -0500
Message-Id: <1516464141-16895-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-mako: add initial recipe for 1.0.7
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
X-List-Received-Date: Sat, 20 Jan 2018 16:02:28 -0000

python3 version is available in oe-core

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-mako.inc | 21 +++++++++++++++++++++
 .../recipes-devtools/python/python-mako_1.0.7.bb    |  2 ++
 2 files changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-mako.inc
 create mode 100644 meta-python/recipes-devtools/python/python-mako_1.0.7.bb

diff --git a/meta-python/recipes-devtools/python/python-mako.inc b/meta-python/recipes-devtools/python/python-mako.inc
new file mode 100644
index 0000000..a9fa556
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-mako.inc
@@ -0,0 +1,21 @@
+SUMMARY = "A super-fast templating language that borrows the best ideas from the existing templating languages"
+HOMEPAGE = "http://www.makotemplates.org/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1bb21fa2d2f7a534c884b990430a6863"
+
+PYPI_PACKAGE = "Mako"
+
+inherit pypi
+
+SRC_URI[md5sum] = "5836cc997b1b773ef389bf6629c30e65"
+SRC_URI[sha256sum] = "4e02fde57bd4abb5ec400181e4c314f56ac3e49ba4fb8b0d50bba18cb27d25ae"
+
+RDEPENDS_${PN} = " \
+    ${PYTHON_PN}-html \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-threading \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-mako_1.0.7.bb b/meta-python/recipes-devtools/python/python-mako_1.0.7.bb
new file mode 100644
index 0000000..3372eeb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-mako_1.0.7.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-mako.inc
-- 
2.7.4


