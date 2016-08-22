Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0072973243
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:02:47 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id r128so8982839qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=WZSylnoL/rSr21L33xx6tjNyHgLASnXAczQ2+TfMius=;
	b=wPyY0jj4bNWpUKz2gu8Ob8rOS/neDV3a24ZCxp2dujc0pO6yi446IhuU0V/LprUoAm
	YviCQa19MIkEcse6lP+s9G4PHVd53QrKTtuC2mAuIldPMH/YGAJlI5oopebkcTPiVy2N
	j2Br+xhyWOBa8X9KcBOuwRryvuJtPQJT3AChXzGHITTkf9UXcSMmthses8tRaDbYNmnR
	DqXOj6oid/JOehFfcCYGLbqbt9LGJMujLgG4na4L5rjNYsfti6COvu1zVGs7p1c/Tgxe
	oHyPvy/UEdCsSqbOxw4bnaInhC+HV3JdKqQ19aCkf6dzZc+DIEjbwr47fhw0+Uxeq38f
	USig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=WZSylnoL/rSr21L33xx6tjNyHgLASnXAczQ2+TfMius=;
	b=DhQTxc/mZ7pwd6jIjbK7ee3xnWZL7Y1U7Saq2WGuWIzITLPzF8HZY572sv8tpftU/b
	udRf+HpihlB1LB9JOHzGEuqQN6QzYWqetugKTW6sqn4VAfHf6fuAH4CjJZsaaLQd2n4y
	fpVH82UJUHQfQLXHnY2ZkGl7Ais0dAIG5EzdEnk9wAZgS+o3VSJ+ac6uHDanqa3eg16v
	n7wMT4dJU6ldtjKyieeS+5OvvXmjwQL5xErLqa4Oqy3AnLQNrPxFTW4LVv4wICho6lbK
	/neRlwU66R6bgd4Y+5dq3UJkYO4McENTQ4jeH0Z0baMZaBUNMm/8JAS0dYT2RzhB3rpO
	7Xlw==
X-Gm-Message-State: AE9vXwPmFyFWJ/OYXPHmQWlvszxTUH9syoz+eZkIWxqHOmvmmZHPcCuD5Phke0rXFR+BvA==
X-Received: by 10.55.44.134 with SMTP id s128mr25013471qkh.177.1471892567920; 
	Mon, 22 Aug 2016 12:02:47 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.02.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:02:46 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:15 -0300
Message-Id: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 01/17] python-cffi: Extend recipe to support Python 3
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
X-List-Received-Date: Mon, 22 Aug 2016 19:02:51 -0000

  - Add Python 3 recipe
  - Add native and nativesdk to BBCLASSEXTEND

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-cffi.inc       |  9 +++++++++
 meta-python/recipes-devtools/python/python-cffi_1.7.0.bb  | 11 +----------
 meta-python/recipes-devtools/python/python3-cffi_1.7.0.bb |  2 ++
 3 files changed, 12 insertions(+), 10 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-cffi.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-cffi_1.7.0.bb

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
new file mode 100644
index 0000000..7038d90
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -0,0 +1,9 @@
+SUMMARY = "Foreign Function Interface for Python calling C code"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
+DEPENDS = "libffi ${PYTHON_PN}-pycparser"
+
+SRC_URI[md5sum] = "34122a545060cee58bab88feab57006d"
+SRC_URI[sha256sum] = "6ed5dd6afd8361f34819c68aaebf9e8fc12b5a5893f91f50c9e50c8886bb60df"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.7.0.bb b/meta-python/recipes-devtools/python/python-cffi_1.7.0.bb
index 6f4d77a..1d2d241 100644
--- a/meta-python/recipes-devtools/python/python-cffi_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python-cffi_1.7.0.bb
@@ -1,11 +1,2 @@
-SUMMARY = "Foreign Function Interface for Python calling C code"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
-DEPENDS = "libffi python-pycparser"
-
-SRC_URI[md5sum] = "34122a545060cee58bab88feab57006d"
-SRC_URI[sha256sum] = "6ed5dd6afd8361f34819c68aaebf9e8fc12b5a5893f91f50c9e50c8886bb60df"
-
 inherit pypi setuptools
-
-BBCLASSEXTEND = "native"
+require python-cffi.inc
diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.7.0.bb b/meta-python/recipes-devtools/python/python3-cffi_1.7.0.bb
new file mode 100644
index 0000000..e888084
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cffi_1.7.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-cffi.inc
-- 
2.1.4


