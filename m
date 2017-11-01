Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4C28D78210
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 14:58:39 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id r64so3024063qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Nov 2017 07:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yGWMWn7o6KqeSfXpwSRjf9HdQ2NjN+GuMy9enA3foRI=;
	b=bTRyM45YlEKcG1ZUyM90ubyJS/LAVo0eD3ZMNZEXLlZdvobcmRsoDTTfboxhh+UqCz
	GHYtfIhsGr/1hZvYv6nEdTRMa2kH1ZZVPJnzX7Pksb6GJ/CcZUrLrOvgg7Dp2Yfc9GPQ
	EwpDpi5eDJcBQrFT0p6iOKf2E5hC5a5R9EntymCsNKEy6TOo6CjO87g16Fnnijtfi+N/
	qE+CJHYxCsvuG3R24r17HtTB6jCAOjW/2DWvM8yRUc1d3UIyh4P3BNzAPBrRwUIoH93m
	dncOPieGhKhWhXQ8MvJo/vQG+yOIC6FniDyxMsPS4RmjsVQK7JZ06Oqo1zAjhBKYn0eF
	0bdA==
X-Gm-Message-State: AMCzsaXyBjQnrf+kCwEv9AXyQxTSAr7cuCuJMjwwUof6db4Gp25WKl2T
	r5VUy89/cQlPT8+eQbrDBISWVZqv
X-Google-Smtp-Source: ABhQp+SlSe7dAv3s6dzk7UJA+C/pvSnay4HVRgy7m5diG+lGVVm55KXFNZ6v2EgtHP2+Ob8ti+JIHg==
X-Received: by 10.55.3.130 with SMTP id 124mr235754qkd.42.1509548320085;
	Wed, 01 Nov 2017 07:58:40 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	b194sm536794qkc.31.2017.11.01.07.58.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Nov 2017 07:58:39 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Nov 2017 10:58:33 -0400
Message-Id: <1509548313-2286-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-incremental: add an initial recipe for version 17.5.0
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
X-List-Received-Date: Wed, 01 Nov 2017 14:58:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-incremental.inc | 14 ++++++++++++++
 .../recipes-devtools/python/python-incremental_17.5.0.bb   |  2 ++
 .../recipes-devtools/python/python3-incremental_17.5.0.bb  |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-incremental.inc
 create mode 100644 meta-python/recipes-devtools/python/python-incremental_17.5.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python-incremental.inc b/meta-python/recipes-devtools/python/python-incremental.inc
new file mode 100644
index 0000000..3675458
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-incremental.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "Incremental is a small library that versions your Python projects"
+HOMEPAGE = "https://github.com/twisted/incremental"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6ca9b07f08e2c72d48c74d363d1e0e15"
+
+SRC_URI[md5sum] = "602746e0d438e075a5a9e0678140bba2"
+SRC_URI[sha256sum] = "7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167eebd4b3"
+
+inherit pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-twisted \
+    ${PYTHON_PN}-click \
+"
diff --git a/meta-python/recipes-devtools/python/python-incremental_17.5.0.bb b/meta-python/recipes-devtools/python/python-incremental_17.5.0.bb
new file mode 100644
index 0000000..139ac0c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-incremental_17.5.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-incremental.inc
diff --git a/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb b/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
new file mode 100644
index 0000000..0f04df4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-incremental_17.5.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-incremental.inc
-- 
2.7.4


