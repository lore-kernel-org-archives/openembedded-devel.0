Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id E361277117
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 20:02:26 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id c52so2478067qte.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 13:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=znOjDwXXOWlS6erYNFcp6TvGQCH7rTI8CDILxNP9JQQ=;
	b=meC6nxBIKX83fQ9JGKtTYIv9/sr0BmhOtYMeNKwM7HWkB3/M0t7ydpb3bMk024YRcm
	XrdwIX8DG532pvLbMe2LIkbEqcFf91VGT5VqmyR+B9THFi68jR9w+4x9+tASCrG9FA06
	5VSw5E/A05arhSaT/o+ZAeuNnr/se8LJ26zDv9ph4MskV+IP80pJOUeJ6Ov9LJfkBzPl
	A5nBSNgGij/lSqfMR5YaEwzdQIdofE3wG8jh17AUU5QcpTfkBTUOv2PsqO5vy72R0DoW
	ELzTgsF0EI2K5Wt5Ydu55zCpHKJzpK/cuGrXz/Wln7tVfR2KVeReYHFISjigFzvDylS3
	0puQ==
X-Gm-Message-State: AEkoouuYKV4tcRoMilXczOL1wH/G6rJUvSqGffD56gKOf6tJbsRcXJPgNLPVD8vkyD9JQA==
X-Received: by 10.200.55.137 with SMTP id d9mr34506440qtc.46.1471291347303;
	Mon, 15 Aug 2016 13:02:27 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	t15sm13213454qtc.26.2016.08.15.13.02.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 13:02:26 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 16:02:19 -0400
Message-Id: <1471291339-23654-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-requests: update to version 2.11.0
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
X-List-Received-Date: Mon, 15 Aug 2016 20:02:28 -0000

  * Bug fix release
  * Update RDEPENDS

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-requests.inc              | 4 ++--
 .../python/{python-requests_2.10.0.bb => python-requests_2.11.0.bb}  | 0
 meta-python/recipes-devtools/python/python3-requests_2.10.0.bb       | 2 --
 meta-python/recipes-devtools/python/python3-requests_2.11.0.bb       | 5 +++++
 4 files changed, 7 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-requests_2.10.0.bb => python-requests_2.11.0.bb} (100%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-requests_2.10.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-requests_2.11.0.bb

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index e00b257..7ce193c 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9bb3515869c0f426cb8441c899ae7f5"
 
-SRC_URI[md5sum] = "a36f7a64600f1bfec4d55ae021d232ae"
-SRC_URI[sha256sum] = "63f1815788157130cee16a933b2ee184038e975f0017306d723ac326b5525b54"
+SRC_URI[md5sum] = "147afc07d8967cf46359701551a6cb69"
+SRC_URI[sha256sum] = "b2ff053e93ef11ea08b0e596a1618487c4e4c5f1006d7a1706e3671c57dea385"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-email ${PYTHON_PN}-json ${PYTHON_PN}-netserver"
diff --git a/meta-python/recipes-devtools/python/python-requests_2.10.0.bb b/meta-python/recipes-devtools/python/python-requests_2.11.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-requests_2.10.0.bb
rename to meta-python/recipes-devtools/python/python-requests_2.11.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.10.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.10.0.bb
deleted file mode 100644
index e5220fa..0000000
--- a/meta-python/recipes-devtools/python/python3-requests_2.10.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-requests.inc
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.11.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.11.0.bb
new file mode 100644
index 0000000..5e869b7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests_2.11.0.bb
@@ -0,0 +1,5 @@
+inherit pypi setuptools3
+require python-requests.inc
+
+# Add the runtime depends for selectors.py
+RDEPENDS_${PN} += "${PYTHON_PN}-misc"
-- 
2.7.4


