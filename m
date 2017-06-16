Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id EBE4B783FE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 17:25:23 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id s33so11764214qtg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pQswDdDgveBHaSf3fcPVzwbjXtTiiCtPH9OGbh4nndw=;
	b=DN+Bipu5WIXXPMNuKxs8Spu92HS5/Na+7ADXgAPdrLUVojsWmPcK0v9tVMSw5lx1YD
	2eob6Q+YqL2gjzgOpxOstrfI1opQColenA15CjxoHOS/NgeAw30cE1mrRWB4hxZZnTub
	fc1EvuMrOjJkepQxL+MQcDpdV1pcdm40ohwbhCQOdXr0HfaMb2RCiViqaiRDAUdqjq1S
	Sbb6tlmAwNszWGqx24TmFegIJYpReA4DP7RrCcN0z4Mh0rPV/zM17tLBf1/O+EwDonQL
	4vSo5o/Ce5RMvEgkFO1SU87YhlIABVojuLRu+sUMrFXLbg1Q63swZTdL7WojkjckdE/w
	iTxw==
X-Gm-Message-State: AKS2vOzQYuyQRW7KXLab0AH8GK/bLRkasV3Gu0Iv62/UolZ36Uh00rGn
	S0Jd4HST9EWMThz7Vvc=
X-Received: by 10.55.75.76 with SMTP id y73mr13716533qka.32.1497633924293;
	Fri, 16 Jun 2017 10:25:24 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4])
	by smtp.gmail.com with ESMTPSA id 34sm2080506qtp.17.2017.06.16.10.25.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 10:25:23 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 13:25:17 -0400
Message-Id: <1497633917-2272-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-selectors34: update to version 1.2
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
X-List-Received-Date: Fri, 16 Jun 2017 17:25:24 -0000

Verify the license remains the same and update the checksum

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-selectors34_1.1.bb        | 12 ------------
 .../recipes-devtools/python/python-selectors34_1.2.bb        | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-selectors34_1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-selectors34_1.2.bb

diff --git a/meta-python/recipes-devtools/python/python-selectors34_1.1.bb b/meta-python/recipes-devtools/python/python-selectors34_1.1.bb
deleted file mode 100644
index 1982418..0000000
--- a/meta-python/recipes-devtools/python/python-selectors34_1.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Backport of the selectors module from Python 3.4"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1cfbbf590d8d5b7fe937516217b778b3"
-
-SRC_URI[md5sum] = "403194b10f35a5258e0642712fdd3753"
-SRC_URI[sha256sum] = "84b3743b9046461aebbcd13c15e79ab91e79acfb6e030b54a0ec6360ae0bbc52"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-six \
-    "    
diff --git a/meta-python/recipes-devtools/python/python-selectors34_1.2.bb b/meta-python/recipes-devtools/python/python-selectors34_1.2.bb
new file mode 100644
index 0000000..69545eb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-selectors34_1.2.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Backport of the selectors module from Python 3.4"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2fae0222c31d6c10488d4ab93a863af7"
+
+SRC_URI[md5sum] = "bc855a1c8839a811476c019dc07d92dd"
+SRC_URI[sha256sum] = "09f5066337f8a76fb5233f267873f89a27a17c10bf79575954894bb71686451c"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-six \
+    "    
-- 
2.7.4


