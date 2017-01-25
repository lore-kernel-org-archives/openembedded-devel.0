Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6714A71E50
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 15:23:44 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id l7so22872540qtd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 07:23:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eTUftNJ1URKWUp9NXS+5vzbFgmbvfi/zTAVrZY3C8cg=;
	b=mc1BK2GAFmspaIyNQhDfD0vwEJMN4ZrPKz7moZ3IidDbXLQsYJG28765jOx2SPEcBX
	r+RdaS6EtIZm3KTagO5P41SXjd5+kmddOQRxxQ+W5MkO6cUS688EVIQ/7rtaNbIBU8sb
	nDY2h864rz69rfeaHwjHzjmPNY3usF+CuCxLwDFJNTfFmFYZJEU0bIpfRcaI5Hlgljsi
	DQdeLPhpF7i3/0O2rfcE8ZSbwIIuOpXGcou/v5Fg3rZ/DgE03g+EI3pVBuhlqUzVa1f5
	InBARV5VCuBoAw2FScK/OiUxZL7ST1qRESBU8bnf8h0oNlJ7xyKQbdUd8qsFeDokI4p7
	eY7Q==
X-Gm-Message-State: AIkVDXIfdaonWVYa+k0zIYGoGB14GFpEoq69d2snYJWC6G6UfKOK0Pgid24oz3YFtfY3+g==
X-Received: by 10.200.35.124 with SMTP id b57mr35658958qtb.147.1485357825203; 
	Wed, 25 Jan 2017 07:23:45 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	y189sm517294qky.39.2017.01.25.07.23.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 07:23:44 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2017 10:22:57 -0500
Message-Id: <1485357777-6007-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485357777-6007-1-git-send-email-derek@asterius.io>
References: <1485357777-6007-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 3/3] python-pyro4: update to version 4.53
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
X-List-Received-Date: Wed, 25 Jan 2017 15:23:45 -0000

  * Update license to reflect year change

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-pyro4/python-pyro4_4.39.bb                  | 10 ----------
 .../python-pyro4/python-pyro4_4.53.bb                  | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb
 create mode 100644 meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.53.bb

diff --git a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb
deleted file mode 100644
index 5b4ca7b..0000000
--- a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Python Remote Objects"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b48b62dd270c4691fabaa85be3236030"
-
-SRC_URI[md5sum] = "75ed5cd142803b0a8d587dc8b6bb51ed"
-SRC_URI[sha256sum] = "39c6ca7f86b0f0bebfeada687a5a8b99f66470a52b0f815195ae63c683266f24"
-
-PYPI_PACKAGE = "Pyro4"
-
-inherit pypi setuptools
diff --git a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.53.bb b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.53.bb
new file mode 100644
index 0000000..4730150
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.53.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Python Remote Objects"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=378acef375e17a3bff03bd0f78c53220"
+
+SRC_URI[md5sum] = "71a2629229b7101996d41282c5c7157f"
+SRC_URI[sha256sum] = "c6ca6461472a74a7608a2247413b66e951889351fcf8e9eed5d7232ae844b702"
+
+PYPI_PACKAGE = "Pyro4"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-selectors34 \
+    ${PYTHON_PN}-serpent \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-zlib \
+    "
-- 
2.7.4


