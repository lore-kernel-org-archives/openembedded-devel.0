Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id BFD696E650
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 22:39:42 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id u10so4019567qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jan 2018 14:39:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TyU7Du/NQ0nkSBQBXp6RkESFbxk8e8ZN/lQ4kpZI3FM=;
	b=F1fVSDd1PQU2+yeFOWKxZn7iMZgCmhC6UTsSEZ7UUsgp2oUImd4BuGhh3Xgkw5hu7C
	Cn2W8ZAZWqv68nXA5sCyOWqRr59xvrX86eUL78DfwCPb0RciXUSsW6BuF/LIkcZwfjBz
	DlyN9sFS/cx1NTDdVT7qYgBr3qyYcuEVqMDQ74/ZKJ8A2hFFfk04IBY4kcXzX0xyxdr+
	OntLQhE/YYj0WqJYNWqckuU4VHEICTpxv+Y7q3YaJ9S3OwBSvv/816Hhu+JQVaCWMGk4
	K03HXp8SI3QmOUsQ40ewEONY4EhzcDzS3KMdnalD1ZL8AlRYRkb1jhDNiQNphYp+NY5M
	EuSg==
X-Gm-Message-State: AKGB3mI4c1oFYRU4w/h07zlavt6X2gH7/40vWTjEXe6gXzaaPXXrqeWM
	pttE00rfOicYdj/AtXP8GYSchDVO
X-Google-Smtp-Source: ACJfBotfeRWBHSfJc58NbmZqUik6WyDoiRxyWFKxMT2jo4gDO7V2agmtDo6WaxEI798OMb5T3U2Aog==
X-Received: by 10.200.44.243 with SMTP id 48mr3568863qtx.99.1515019183271;
	Wed, 03 Jan 2018 14:39:43 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	s41sm1241142qtk.37.2018.01.03.14.39.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jan 2018 14:39:42 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 17:39:32 -0500
Message-Id: <1515019174-24971-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/3] python-jsonpointer: add a python3 version of the recipe
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
X-List-Received-Date: Wed, 03 Jan 2018 22:39:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-jsonpointer.inc | 14 ++++++++++++++
 .../recipes-devtools/python/python-jsonpointer_1.14.bb     | 13 ++-----------
 .../recipes-devtools/python/python3-jsonpointer_1.14.bb    |  2 ++
 3 files changed, 18 insertions(+), 11 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-jsonpointer.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-jsonpointer_1.14.bb

diff --git a/meta-python/recipes-devtools/python/python-jsonpointer.inc b/meta-python/recipes-devtools/python/python-jsonpointer.inc
new file mode 100644
index 0000000..e678198
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-jsonpointer.inc
@@ -0,0 +1,14 @@
+SUMMARY = "Resolve JSON Pointers in Python"
+HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
+
+inherit pypi
+
+SRC_URI[md5sum] = "190aeb8afcb0efddfe831a4e533e163b"
+SRC_URI[sha256sum] = "c681af823545c731b7b38aedd5d4eee4c5eff87bc0f25e0ff25444a4189eac4d"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-re \
+"
diff --git a/meta-python/recipes-devtools/python/python-jsonpointer_1.14.bb b/meta-python/recipes-devtools/python/python-jsonpointer_1.14.bb
index 96b71e3..064bd6c 100644
--- a/meta-python/recipes-devtools/python/python-jsonpointer_1.14.bb
+++ b/meta-python/recipes-devtools/python/python-jsonpointer_1.14.bb
@@ -1,11 +1,2 @@
-SUMMARY = "Resolve JSON Pointers in Python"
-HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
-
-inherit pypi setuptools
-
-SRC_URI[md5sum] = "190aeb8afcb0efddfe831a4e533e163b"
-SRC_URI[sha256sum] = "c681af823545c731b7b38aedd5d4eee4c5eff87bc0f25e0ff25444a4189eac4d"
-
-RDEPENDS_${PN} += "python-re python-json"
+inherit setuptools
+require python-jsonpointer.inc
diff --git a/meta-python/recipes-devtools/python/python3-jsonpointer_1.14.bb b/meta-python/recipes-devtools/python/python3-jsonpointer_1.14.bb
new file mode 100644
index 0000000..8d0a09b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jsonpointer_1.14.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-jsonpointer.inc
-- 
2.7.4


