Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id C610E730AE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Mar 2017 14:33:05 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n127so10999761qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Mar 2017 06:33:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9/PWNv4JQwpo32tD0Rw+8cje5LtXwWrSb+Dndmow2Gk=;
	b=QlP8RpVQZ6jPWbtoBw+WaZOjNQnXn6A+F4U87Wv/cDNdOKmbMCfr2PMO3q8Nt8UA+l
	Ky8RMYb+F0soPCaYP0b9TRblbjrQcN6rNxV7oOPTFNsGS2c+jFWvAECjX1pJHkM5EbEr
	UiakhsNSl8LBx+MtOhpoqSZnId+FE3RqMnyv9O3Lf1VaohtERg3v8FDK3xP1tbo1laD9
	Ru8oinfyBoLYYJo3O/lJqaUoEgiKQ/WNZ/SqggH16D2ZHjFexsSaqvebAcn529ps1aoS
	5uZ24gL+ZQj1vepYxgzzjcb7g/P5cMVWfQAgyP2phXCNKvV9nI92UQYDESgqNMSATUy0
	6iEg==
X-Gm-Message-State: AMke39kjoDBQ7bQ/t+ME3xRv54IW2cDdWkjGurmE7X/5zGJWqOltmrTwtdAjL3XIBXmaBg==
X-Received: by 10.55.17.206 with SMTP id 75mr10420439qkr.156.1488378786700;
	Wed, 01 Mar 2017 06:33:06 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	o14sm3248434qtc.46.2017.03.01.06.33.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Mar 2017 06:33:06 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Mar 2017 09:32:58 -0500
Message-Id: <1488378778-2019-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-parse: update to version 1.8.0
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
X-List-Received-Date: Wed, 01 Mar 2017 14:33:06 -0000

Verified that license remains the same and updated the checksum

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-parse_1.6.6.bb |  8 --------
 meta-python/recipes-devtools/python/python-parse_1.8.0.bb | 13 +++++++++++++
 2 files changed, 13 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-parse_1.6.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python-parse_1.8.0.bb

diff --git a/meta-python/recipes-devtools/python/python-parse_1.6.6.bb b/meta-python/recipes-devtools/python/python-parse_1.6.6.bb
deleted file mode 100644
index 45b52a3..0000000
--- a/meta-python/recipes-devtools/python/python-parse_1.6.6.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "Parse strings using a specification based on the Python format() syntax"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://parse.py;md5=e067ba2a08b73721dbe7356dc0282918;startline=1108;endline=1126"
-
-SRC_URI[md5sum] = "11bc8c60a30fe52db4ac9a827653d0ca"
-SRC_URI[sha256sum] = "71435aaac494e08cec76de646de2aab8392c114e56fe3f81c565ecc7eb886178"
-
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-parse_1.8.0.bb b/meta-python/recipes-devtools/python/python-parse_1.8.0.bb
new file mode 100644
index 0000000..0fd905b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-parse_1.8.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Parse strings using a specification based on the Python format() syntax"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://parse.py;md5=083d8ef8f98a3035dbf890a808498fde;startline=1189;endline=1208"
+
+SRC_URI[md5sum] = "6ea7e32cb35810113137f6073fb30639"
+SRC_URI[sha256sum] = "8b4f28bbe7c0f24981669ea92b2ba704ee63b5346027e82be30118bb5788ff10"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-logging \
+    "
-- 
2.7.4


