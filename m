Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
	[209.85.167.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1B66D61338
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 17:43:18 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id q81so12829600oig.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 09:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z1+OU3aQMqcFqkW3vWdHnskwa6qeH8PTC5UVI33a7MM=;
	b=hl9+QzfixImCaMDR4pakz+H1hsAQLsQGWk8Y7pC25olOIV1kgeyTBz3GsVw67I1UYa
	zwlmXw/G+tw+CbeBdUTlYh9fnlwJZ5Z6b0zLrUUKcIE7GFr0CtSy7OhQV8pMNiA/8Lsp
	48Ma3WK1fhgd3KI5UJmilr+SifM0f8AoSQjt/PgG+rDBBDN4jO54mUSgFX1hClgueuiL
	W6sjn7M2QUtKvwXYtqzfbPLEHSZPr8MYAG589iyNgy9K+um1blJcAYONaqKPXlAx3t5O
	plQILbGIyOR5+fGOJE7XMH0zJ2cDXsL4cyT3Fil4th+yRd6q8leLxQUOXyEoyCxrxLGp
	bMSw==
X-Gm-Message-State: APjAAAX/LEBx9C4LshZs7dj9vwxkLmgGQP8Va6YV12cbt8MsQSJUfdJ6
	CDean0HxEmSqzY6RHPkqllXkDovxrMk=
X-Google-Smtp-Source: APXvYqy2PsrNzCdkx3J4KB2Ozf84hqESK6y2nbPZIzpVLJL1HBL4Xsk9Xb2WIv0/Cc0F8zTyGnW0ug==
X-Received: by 2002:aca:4c90:: with SMTP id z138mr5674032oia.140.1581788599761;
	Sat, 15 Feb 2020 09:43:19 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id 7sm3004754oin.5.2020.02.15.09.43.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 09:43:19 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Feb 2020 12:43:10 -0500
Message-Id: <20200215174310.1931-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-constantly: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Sat, 15 Feb 2020 17:43:19 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-constantly.inc   | 11 -----------
 .../python/python3-constantly_15.1.0.bb             | 13 +++++++++++--
 2 files changed, 11 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-constantly.inc

diff --git a/meta-python/recipes-devtools/python/python-constantly.inc b/meta-python/recipes-devtools/python/python-constantly.inc
deleted file mode 100644
index 8153504929..0000000000
--- a/meta-python/recipes-devtools/python/python-constantly.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Symbolic constants in Python"
-HOMEPAGE = "https://github.com/twisted/constantly"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e393e4ddd223e3a74982efa784f89fd7"
-
-SRC_URI[md5sum] = "f0762f083d83039758e53f8cf0086eef"
-SRC_URI[sha256sum] = "586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35"
-
-inherit pypi
-
-RDEPENDS_${PN} += "${PYTHON_PN}-json"
diff --git a/meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb b/meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb
index 3f667540d9..ad24f6de6d 100644
--- a/meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-constantly_15.1.0.bb
@@ -1,2 +1,11 @@
-inherit setuptools3
-require python-constantly.inc
+DESCRIPTION = "Symbolic constants in Python"
+HOMEPAGE = "https://github.com/twisted/constantly"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e393e4ddd223e3a74982efa784f89fd7"
+
+SRC_URI[md5sum] = "f0762f083d83039758e53f8cf0086eef"
+SRC_URI[sha256sum] = "586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-json"
-- 
2.17.1


