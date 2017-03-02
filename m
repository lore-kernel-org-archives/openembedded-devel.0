Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id CB7F2775CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 16:30:17 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id j127so2081870qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Mar 2017 08:30:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=V/wGqDDCV5qsaghrCAHQICU9N6zVB44hnhzqwCittDo=;
	b=FwiuPFV/junitke54y4Tu8qx2qBTsnnU5YB76NQYXHQSwd5hONkyCSzcBKBF4kGahp
	J0jjLtfnctGeVtnkjR1Pkcld9KHLiVy79NcHnTslPhH7CzzTE/VTtlDQiRGdbMZgAh2I
	WIRzfAEdI5BNdeX1gHgp10Re+h9ZUF7zAgzWVl206+dsq9WqgrUEQIh6uQih9QvPYbUw
	yXqQiqDgI6bbdXFS4iYKogkacvyUFVwJ5kSdSeKa9QnjvzZ+Rv8CR8t+pMs2+GdnLc/k
	4ox51reb5KrkCU4Mt/uEo7oQ17ft+GKw68XQY6K09xtF/Isxl/3irqcyNQGtEZsov/OL
	98xQ==
X-Gm-Message-State: AMke39nvQBCarz4yMinZzJMIl8rbao6tJsBwhMthSnNLrbBqY+HjW1GEPgDDL2KD5nKTqw==
X-Received: by 10.237.37.121 with SMTP id w54mr19055076qtc.14.1488472218462;
	Thu, 02 Mar 2017 08:30:18 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	q66sm5624599qkd.69.2017.03.02.08.30.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Mar 2017 08:30:17 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Mar 2017 11:24:24 -0500
Message-Id: <1488471864-32442-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-simplejson: relocate to meta-python and add a python3 version
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
X-List-Received-Date: Thu, 02 Mar 2017 16:30:18 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-simplejson.inc   | 21 ++++++---------------
 .../python/python-simplejson_3.10.0.bb              |  2 ++
 .../python/python3-simplejson_3.10.0.bb             |  7 +++++++
 3 files changed, 15 insertions(+), 15 deletions(-)
 rename meta-oe/recipes-devtools/python/python-simplejson_3.10.0.bb => meta-python/recipes-devtools/python/python-simplejson.inc (53%)
 create mode 100644 meta-python/recipes-devtools/python/python-simplejson_3.10.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-simplejson_3.10.0.bb

diff --git a/meta-oe/recipes-devtools/python/python-simplejson_3.10.0.bb b/meta-python/recipes-devtools/python/python-simplejson.inc
similarity index 53%
rename from meta-oe/recipes-devtools/python/python-simplejson_3.10.0.bb
rename to meta-python/recipes-devtools/python/python-simplejson.inc
index 75ec2dc..2eed199 100644
--- a/meta-oe/recipes-devtools/python/python-simplejson_3.10.0.bb
+++ b/meta-python/recipes-devtools/python/python-simplejson.inc
@@ -1,26 +1,17 @@
 SUMMARY = "Simple, fast, extensible JSON encoder/decoder for Python"
 HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
-SECTION = "devel/python"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRCNAME = "simplejson"
-
-SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 SRC_URI[md5sum] = "426a9631d22851a7a970b1a677368b15"
 SRC_URI[sha256sum] = "953be622e88323c6f43fad61ffd05bebe73b9fd9863a46d68b052d2aa7d71ce2"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit pypi
 
-RDEPENDS_${PN} = "\
-    python-core \
-    python-re \
-    python-io \
-    python-netserver \
-    python-numbers \
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-re \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-numbers \
 "
-
-
diff --git a/meta-python/recipes-devtools/python/python-simplejson_3.10.0.bb b/meta-python/recipes-devtools/python/python-simplejson_3.10.0.bb
new file mode 100644
index 0000000..e33edfe
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-simplejson_3.10.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-simplejson.inc
diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.10.0.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.10.0.bb
new file mode 100644
index 0000000..d44bc15
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.10.0.bb
@@ -0,0 +1,7 @@
+inherit setuptools3
+require python-simplejson.inc
+
+# Requires _pydecimal which is in misc
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-misc \
+"
-- 
2.7.4


