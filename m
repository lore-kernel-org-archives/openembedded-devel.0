Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5A9447854E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 19:46:59 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id w1so12569167qtg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DPl1rm6NDTgn47Fk0Jl2PZsmT8SH8EoSvnDDbgSJW4w=;
	b=lHkpSo6sZPpfcSfB9M9htv6BMYYfLO7XmaVnSKegiq3VlC9cyBY0Oe6fCYZyBMNS6k
	PseUU9jPx+8OHwKn/gzVunHeZ/9pCkztQtuUVO21imri0HkEXG5QB7Xt5C8pYp1BRqYT
	BmS+uWEHUlON7tabmfZ3/rK8oH/mmyi3hNmrZtiFfNoloWDKfMNBr4L63fPJQQqB963H
	d1JzVYXvfuBb0KtoHHjauR6ZHH+dBg+hqNekjdOpn9OZVEHmfYQxuOWbW+vsNUagmlnu
	A3AmHPer+3Rpwovai+Pvy1zJoxZFl+MLo/vQ+1n4Dve0L6Z9HO+PFl7S1jbIuXIXpTX3
	W/7g==
X-Gm-Message-State: AKS2vOxRX5VlBTG1sKWGwA72RtDQxalTgS6puF9d8Iy2BggeTd5SDDSl
	/9X3CAFs1gQNg8+c694=
X-Received: by 10.237.35.89 with SMTP id i25mr14185040qtc.25.1497642420707;
	Fri, 16 Jun 2017 12:47:00 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	m51sm2249769qtb.62.2017.06.16.12.46.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 12:47:00 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:46:53 -0400
Message-Id: <1497642413-11835-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-parse: update to version 1.8.2
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
X-List-Received-Date: Fri, 16 Jun 2017 19:47:04 -0000

Verify the license terms and update the start, stop, and checksum

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-parse_1.8.0.bb | 13 -------------
 meta-python/recipes-devtools/python/python-parse_1.8.2.bb | 13 +++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-parse_1.8.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-parse_1.8.2.bb

diff --git a/meta-python/recipes-devtools/python/python-parse_1.8.0.bb b/meta-python/recipes-devtools/python/python-parse_1.8.0.bb
deleted file mode 100644
index 0fd905b..0000000
--- a/meta-python/recipes-devtools/python/python-parse_1.8.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Parse strings using a specification based on the Python format() syntax"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://parse.py;md5=083d8ef8f98a3035dbf890a808498fde;startline=1189;endline=1208"
-
-SRC_URI[md5sum] = "6ea7e32cb35810113137f6073fb30639"
-SRC_URI[sha256sum] = "8b4f28bbe7c0f24981669ea92b2ba704ee63b5346027e82be30118bb5788ff10"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-logging \
-    "
diff --git a/meta-python/recipes-devtools/python/python-parse_1.8.2.bb b/meta-python/recipes-devtools/python/python-parse_1.8.2.bb
new file mode 100644
index 0000000..037221a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-parse_1.8.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Parse strings using a specification based on the Python format() syntax"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://parse.py;md5=a84b494563bba466a2f02b05f2e6ad4a;startline=1191;endline=1210"
+
+SRC_URI[md5sum] = "42002338551bdfa0f01bbe4e679a17dd"
+SRC_URI[sha256sum] = "8048dde3f5ca07ad7ac7350460952d83b63eaacecdac1b37f45fd74870d849d2"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-logging \
+    "
-- 
2.7.4


