Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 40C4D780C4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 17:27:22 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id r58so10484580qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 10:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MPux1YtsCmOScY6am96YFQRqJXp9vUtnv4BU/ndYzHg=;
	b=Wt0Ep5Sp+QC0WOicXVJxwNmmzYmp9SFoHgQORhHN/B1TP01UrKp+zdy1yJ4x0Tkloe
	6nfNDMMmrqNlqIYtmUaWWBRcVbDRi5a9lKGi8GzO09l/6LmDzr04JNd/Mgv8E/crDNcp
	7U1aZycwmowgwZyb3Nb2AZZhx7HIxflfGn+uOn5KMetmkFZ1oF0H7pDjCJcZqbzdbGJO
	TVV4tNzku7YzIXIchGyY2hckgfkKorpZVgWKEuyB38OXwUA6o826cYHC+pt1KHra9BNS
	3Ei9jvgFkW/C2zP3F3C7UoIv6zXXEnM5o6ao1gwHYQ091R+czbzbNeubHxIyIbfbNJvr
	FSLg==
X-Gm-Message-State: AODbwcBNRaHahXEinPnMGpYrWuHOyw5/HimfAxndXGuMMW/FLJhaRdfg
	4O/FtJV56NpmAQ==
X-Received: by 10.237.58.70 with SMTP id n64mr2118316qte.9.1495214844264;
	Fri, 19 May 2017 10:27:24 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	r19sm6272804qkl.54.2017.05.19.10.27.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 10:27:23 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 13:27:16 -0400
Message-Id: <1495214836-12116-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-backports-functools-lru-cache: update to version 1.4
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
X-List-Received-Date: Fri, 19 May 2017 17:27:24 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-backports-functools-lru-cache_1.3.bb       | 14 --------------
 .../python-backports-functools-lru-cache_1.4.bb       | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.4.bb

diff --git a/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.3.bb b/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.3.bb
deleted file mode 100644
index 211cfde..0000000
--- a/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Backport of functools.lru_cache from Python 3.3"
-HOMEPAGE = "https://github.com/jaraco/backports.functools_lru_cache"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=42;endline=42;md5=98fc3658e5970d26f6b2109808c766be"
-
-PYPI_PACKAGE = "backports.functools_lru_cache"
-
-SRC_URI[md5sum] = "b26a223250bd24ea2e0ad6ce47b19084"
-SRC_URI[sha256sum] = "444a21bcec4ae177da554321f81a78dc879eaa8f6ea9920cb904830585d31e95"
-
-DEPENDS = "python-setuptools-scm-native"
-
-inherit setuptools pypi
diff --git a/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.4.bb b/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.4.bb
new file mode 100644
index 0000000..961436f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.4.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Backport of functools.lru_cache from Python 3.3"
+HOMEPAGE = "https://github.com/jaraco/backports.functools_lru_cache"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=47;endline=47;md5=98fc3658e5970d26f6b2109808c766be"
+
+PYPI_PACKAGE = "backports.functools_lru_cache"
+
+SRC_URI[md5sum] = "b954e7d5e2ca0f0f66ad2ed12ba800e5"
+SRC_URI[sha256sum] = "31f235852f88edc1558d428d890663c49eb4514ffec9f3650e7f3c9e4a12e36f"
+
+DEPENDS += "python-setuptools-scm-native"
+
+inherit setuptools pypi
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-threading \
+    "
-- 
2.7.4


