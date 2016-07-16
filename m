Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 45082731C7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jul 2016 15:59:08 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n202so6915295qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jul 2016 08:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eiC1hKPk3h1zSuq1e+3K3Z1qb5b2cSW9Y1sfRMUnYp0=;
	b=VafZvJpLI4HBed8JPz4zJ9bGInMf7u+aiSuT2R1q41+ibE9nctkfjGI7HYXABZ+nEI
	plCtnWYU7XrTbUwH+yNAoqETSw5lnvFz6m4GyC03mNFjgKUcYp0yronugQj7V5+OCDNJ
	GmkCjdhPMPrwrG1SIrozbsEz39Wp31x0wM4PcgIYv5QQPaw6wm11TyyL4QQHMSD45AcA
	kgGKVU0SdH2T9ZW0a9l7iD8TwT1tf8MOVyR+26TgpFK8Ry96NiHTfLda43rhH/FOMBwn
	Im8TFZbhny5KgVW5/gyiyKIytLpFopsdxbITlQWBweN1QNkjAaIxw17mkHj1p1N4rWZs
	kHUw==
X-Gm-Message-State: ALyK8tKHbKogkj5tOAxaWCTI6VCRYFir4gUo7NZVjST0XgEkODddzZKxxS1dxmyKQdz7CQ==
X-Received: by 10.55.47.66 with SMTP id v63mr31329958qkh.11.1468684749383;
	Sat, 16 Jul 2016 08:59:09 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	c15sm2390257qkg.46.2016.07.16.08.59.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Jul 2016 08:59:08 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Jul 2016 11:59:03 -0400
Message-Id: <1468684743-5332-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-evdev: update to version 0.6.1 and add package RDEPENDS
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
X-List-Received-Date: Sat, 16 Jul 2016 15:59:09 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-evdev_0.6.0.bb       | 12 ------------
 .../recipes-devtools/python/python-evdev_0.6.1.bb       | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-evdev_0.6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-evdev_0.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python-evdev_0.6.0.bb b/meta-python/recipes-devtools/python/python-evdev_0.6.0.bb
deleted file mode 100644
index e555552..0000000
--- a/meta-python/recipes-devtools/python/python-evdev_0.6.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Python evdev lib"
-HOMEPAGE = "https://github.com/gvalkov/python-evdev"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
-
-SRC_URI = "https://github.com/gvalkov/python-evdev/archive/v${PV}.zip"
-
-SRC_URI[md5sum] = "24e4ffa98e338b535eae44d91d609005"
-SRC_URI[sha256sum] = "61f6893d80da87a995e5781c74d22a39448b1b32004ffac2f31817017709be04"
-
-inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-evdev_0.6.1.bb b/meta-python/recipes-devtools/python/python-evdev_0.6.1.bb
new file mode 100644
index 0000000..963b162
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-evdev_0.6.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Python evdev lib"
+HOMEPAGE = "https://github.com/gvalkov/python-evdev"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
+
+SRC_URI[md5sum] = "8a3ff1012534963cfc16efebcc208fa6"
+SRC_URI[sha256sum] = "67b3c71461e5ce191a34cd4ec17f6b3d59e66f6013f98f84c2fba817b8738a3b"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-stringold \
+    "
-- 
1.9.1


