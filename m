Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3B4FD774C2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 22:35:28 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id x35so671083qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 14:35:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ik0BdJzSzw76Rgw3dhgHMNj58frcuRCAqxrPgwo4ZKo=;
	b=gfkdrw0ex5iPfztYCmcXWhIF7AAWBZBiNIHx13QjbNlj9E6oM339LILHkCIM7rVAMy
	rVs48qaU4VYtXPFKKbNbVJxET/glgyqkLCvkB2Ri13H+EKMHBSZZfeftpP7HthVk5GH6
	7E4Zg+SJHJS3tV23/6Y7fU1urd6oG0G+daQGCJa2+bw+syv9d6/O4W+l2oiX4RI3kFmc
	eewJXPRWNvRvi4f68a6BXXG5FCxxY7yX/9wt2GlgaAKF9HciCkL3hKQXWPsD7Bhw2CjO
	zG6M9tdadE0Lxvek3PYmwdc+O+eT3+kKMcg7Fm2pLw/tQCQU1LADKj1W2+BkPCaVlZME
	fJSw==
X-Gm-Message-State: AMke39mDdhW4Ku75P1ums24dFOL+JD6vZtkAGsYcG83J1trNhCb9kFx1gQ/T7edBJZuQQw==
X-Received: by 10.200.48.54 with SMTP id f51mr19682173qte.164.1487889329893;
	Thu, 23 Feb 2017 14:35:29 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	h56sm3582692qte.24.2017.02.23.14.35.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 14:35:29 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 17:35:13 -0500
Message-Id: <1487889313-23556-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-cassandra-driver: update to version 3.8.0
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
X-List-Received-Date: Thu, 23 Feb 2017 22:35:29 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cassandra-driver.inc   | 4 ++--
 .../recipes-devtools/python/python3-cassandra-driver_3.7.1.bb     | 2 --
 .../recipes-devtools/python/python3-cassandra-driver_3.8.0.bb     | 8 ++++++++
 3 files changed, 10 insertions(+), 4 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-cassandra-driver_3.7.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-cassandra-driver_3.8.0.bb

diff --git a/meta-python/recipes-devtools/python/python-cassandra-driver.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
index bc83592..3146bc7 100644
--- a/meta-python/recipes-devtools/python/python-cassandra-driver.inc
+++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
@@ -8,8 +8,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRCNAME = "cassandra-driver"
 
-SRC_URI[md5sum] = "e01822b1e08940f300c0013765e070be"
-SRC_URI[sha256sum] = "cd76355a6bf30b9cb9f1dd12327b6db2f4b883d5521eb6cac5e6b905000d688e"
+SRC_URI[md5sum] = "7561a89cd8a432a22cf33abef76b64ee"
+SRC_URI[sha256sum] = "10b0c88854f3bddcfd994cb208d780507de62524ef8dcb4f068c084d335b7054"
 
 DISTUTILS_BUILD_ARGS += " \
     --no-libev \
diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.7.1.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.7.1.bb
deleted file mode 100644
index 4f5c019..0000000
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.7.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-cassandra-driver.inc
diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.8.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.8.0.bb
new file mode 100644
index 0000000..34f149d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.8.0.bb
@@ -0,0 +1,8 @@
+inherit setuptools3
+require python-cassandra-driver.inc
+
+# Requires concurrent which is currently in -misc
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-numbers \
+"
-- 
2.7.4


