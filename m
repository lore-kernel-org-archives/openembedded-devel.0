Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 70C15773DE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 23:25:07 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id t184so97436869qkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 15:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ykZM2YUxpS64TIZ50QMujFvb97CldpY00SCjiwnrhv4=;
	b=C0aVtASBLR5HiEhTDGKa8dwpT8Q+Kg0i0Ec3FrAuTHv268l4OCBr4+A3mruDng8kup
	DClcffcpjbEPAsSgvIynEiFZp3dldHsFaAD1Jyv35gNxjGZdzxNPgbdYDfyLk/OrzL4K
	B567MK6BkmQ2v67t+DWlbRa5WZsMKcQZqOY6nxYP3ZQh1oikMRNDfO6ZptAyvlLj0akS
	5vycnOaHDmZFGUUt0Ky1odSmOIJsL4CJlZfIaEDAEXewsmO8ZO+OBHE1OOi0D+aM4Uw3
	lqZTr3slT2AGYuD91dyc7Em68zFtjCp1/bBOTSB1waOYy1VsMf4XPr6m4Y9QtgFkL0Pw
	TIAg==
X-Gm-Message-State: AIkVDXI9dZAAjKxInu2jm2jA+0jRi2qhmO7Yu1+bbwvBJVTKBA7YUh2dLqPdkUroarfVrQ==
X-Received: by 10.55.46.69 with SMTP id u66mr7219452qkh.88.1482362708418;
	Wed, 21 Dec 2016 15:25:08 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	g46sm16660557qtb.44.2016.12.21.15.25.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 15:25:07 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Dec 2016 18:24:53 -0500
Message-Id: <1482362693-19714-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-dominate: update to version 2.3.1
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
X-List-Received-Date: Wed, 21 Dec 2016 23:25:07 -0000

  * Updated the license file and validated the license terms still apply

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-dominate_2.2.1.bb      | 15 ---------------
 .../recipes-devtools/python/python-dominate_2.3.1.bb      | 13 +++++++++++++
 2 files changed, 13 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-dominate_2.2.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-dominate_2.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python-dominate_2.2.1.bb b/meta-python/recipes-devtools/python/python-dominate_2.2.1.bb
deleted file mode 100644
index dc6e41c..0000000
--- a/meta-python/recipes-devtools/python/python-dominate_2.2.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Dominate is a Python library for creating and manipulating HTML documents using an elegant DOM API."
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a30b9a8d0a5585c482c6c5a6d54aaebc"
-
-SRC_URI[md5sum] = "cd156b5b290f49f2bb5814ea8acc12a3"
-SRC_URI[sha256sum] = "4aa6a2f458461541f9ceeb58b49da9b42320f80aa2a6f692baea2817431d9953"
-
-PYPI_PACKAGE_EXT = "zip"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-threading \
-    "
diff --git a/meta-python/recipes-devtools/python/python-dominate_2.3.1.bb b/meta-python/recipes-devtools/python/python-dominate_2.3.1.bb
new file mode 100644
index 0000000..13ebf92
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-dominate_2.3.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Dominate is a Python library for creating and manipulating HTML documents using an elegant DOM API."
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
+
+SRC_URI[md5sum] = "45bd97e6f7888aac24ae86013c57638e"
+SRC_URI[sha256sum] = "4b8ce6f33633c9dd9175b228d21c00c801b6bd0327747cd5e17fc2da934c3a69"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-threading \
+    "
-- 
2.7.4


