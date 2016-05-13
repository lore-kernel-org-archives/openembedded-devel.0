Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 032CD6FF5D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 14:22:12 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id f92so58320586qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 07:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JjgXXNjSEERXlj+Zc2nmm9loR7xq9MWghx4MK8O4NDs=;
	b=RQpg4+m3lB3FZtwcrH+E1ZdW77EiPgJcpvoOdh6pmSHIDGXAsGekmkwgA9zSDQl/z9
	kZrjTP5cB5x2V/Fk2cnjVrHrHb+A1jEmooHhywM5KQASDRgikTlpiHyVonhgWb/ts7vP
	fAVVWT6k842GXXm4ajUSAhyJicxfvDIPYM2HqKRrrD0hI5hBSf22OaTwpmZtEMCFJwwN
	9HgU7NnXKOg/y/cIL/hNipLRFta2quzN6tywVKZdfchwrSGXJeJvGZqVZiCRNFirFYLh
	rUKjGfXlQBIM9fL/QmqaYFzbq6QjW6lwLz419oUnVku4Sk/iGbssegThDHZq+Frm1bQc
	WwJQ==
X-Gm-Message-State: AOPr4FUqdk1HICU3WdUqF5Fl0PzX/0501hT9WZsUwX9LtIW7CvIdttHT2iEhGWwFBDVHTA==
X-Received: by 10.140.84.145 with SMTP id l17mr15546451qgd.12.1463149333165;
	Fri, 13 May 2016 07:22:13 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	x202sm8371898qhx.30.2016.05.13.07.22.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 07:22:12 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 May 2016 10:21:51 -0400
Message-Id: <1463149311-25413-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-requests: update to version 2.10.0
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
X-List-Received-Date: Fri, 13 May 2016 14:22:14 -0000

Update license checksum and verify it is still Apache 2.0

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-requests.inc           | 8 +++++---
 .../{python-requests_2.9.1.bb => python-requests_2.10.0.bb}       | 0
 .../{python3-requests_2.9.1.bb => python3-requests_2.10.0.bb}     | 0
 3 files changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-requests_2.9.1.bb => python-requests_2.10.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-requests_2.9.1.bb => python3-requests_2.10.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index ebce253..6f9e85c 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -1,9 +1,11 @@
 DESCRIPTION = "Python HTTP for Humans."
 HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=58c7e163c9f8ee037246da101c6afd1e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d9bb3515869c0f426cb8441c899ae7f5"
 
-SRC_URI[md5sum] = "0b7f480d19012ec52bab78292efd976d"
-SRC_URI[sha256sum] = "c577815dd00f1394203fc44eb979724b098f88264a9ef898ee45b8e5e9cf587f"
+SRC_URI[md5sum] = "a36f7a64600f1bfec4d55ae021d232ae"
+SRC_URI[sha256sum] = "63f1815788157130cee16a933b2ee184038e975f0017306d723ac326b5525b54"
+
+PYPI_PACKAGE_HASH = "496f183063f01aae1e025cf0130772b55848750a2f3a89bfa11b385b35d7329d"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-email ${PYTHON_PN}-json ${PYTHON_PN}-netserver"
diff --git a/meta-python/recipes-devtools/python/python-requests_2.9.1.bb b/meta-python/recipes-devtools/python/python-requests_2.10.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-requests_2.9.1.bb
rename to meta-python/recipes-devtools/python/python-requests_2.10.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.9.1.bb b/meta-python/recipes-devtools/python/python3-requests_2.10.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-requests_2.9.1.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.10.0.bb
-- 
1.9.1


