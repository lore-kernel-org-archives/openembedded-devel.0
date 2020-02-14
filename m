Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
	[209.85.210.46])
	by mail.openembedded.org (Postfix) with ESMTP id B574861090
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 18:57:34 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id z9so10128398oth.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 10:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Igz5VVrW5F73i8gH7hslqcnRyBqkgsp73SgK1jK0eoI=;
	b=cYQi0lmkYQbpbC9O4/ycowx2wZSzpYd97MFTIYh+jHm56bVN1D4qs1QvQZA2MmZ1aJ
	Ds8fxSWzf7OaKgYrYU946Hs9ae9qZx63gFYCS1E6bSh395zKKWX5xYetKitpkDTZuJeY
	xpnRjqVjgpJKzYbo3xxwq8h/zK7K5y5lZRwHzmUGbCFTp2hFVk7cJb0DvXQ9xc1jG525
	dX6qBHX0OuCsbKeJay1jczK4GlQMTgJGfnYmtuxVa1HjKdxELWfbCNPeNpZAXHt6Yc8h
	GnZtoknboZ6QI3X/rTSQ2JW2yARB0NIT7cRls2Bl2/J9acAwLFd3rsee32himw11Fbae
	hVSw==
X-Gm-Message-State: APjAAAX8MJ7+BQBQdBMIn6jX/ID3Htt5js0wErqHnuKO/1Kyw2y5gKDs
	AEZkNnR/pYBxcUiIZB7fgWTA4WX3AGM=
X-Google-Smtp-Source: APXvYqz89B0i/EgnYmzZOjv6sxasYtAYaOuCPyFbVCqNcRCFPieWhpgdrQZ5ouXcZZOlR2kIyBR8uA==
X-Received: by 2002:a05:6830:99:: with SMTP id
	a25mr3564079oto.130.1581706655465; 
	Fri, 14 Feb 2020 10:57:35 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	n16sm2249892otk.25.2020.02.14.10.57.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 10:57:35 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 13:57:24 -0500
Message-Id: <20200214185724.30409-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-behave: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Fri, 14 Feb 2020 18:57:34 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-behave.inc   | 15 ---------------
 .../python/python3-behave_1.2.6.bb              | 17 +++++++++++++++--
 2 files changed, 15 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-behave.inc

diff --git a/meta-python/recipes-devtools/python/python-behave.inc b/meta-python/recipes-devtools/python/python-behave.inc
deleted file mode 100644
index ded75801dd..0000000000
--- a/meta-python/recipes-devtools/python/python-behave.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "A behavior-driven development framework, Python style"
-HOMEPAGE = "https://github.com/behave/behave"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d950439e8ea6ed233e4288f5e1a49c06"
-
-SRC_URI[md5sum] = "3f05c859a1c45f5ed33e925817ad887d"
-SRC_URI[sha256sum] = "b9662327aa53294c1351b0a9c369093ccec1d21026f050c3bd9b3e5cccf81a86"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-parse-type \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-six \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
index 1c55871b10..a28e527315 100644
--- a/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb
@@ -1,2 +1,15 @@
-inherit setuptools3
-require python-behave.inc
+SUMMARY = "A behavior-driven development framework, Python style"
+HOMEPAGE = "https://github.com/behave/behave"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d950439e8ea6ed233e4288f5e1a49c06"
+
+SRC_URI[md5sum] = "3f05c859a1c45f5ed33e925817ad887d"
+SRC_URI[sha256sum] = "b9662327aa53294c1351b0a9c369093ccec1d21026f050c3bd9b3e5cccf81a86"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-parse-type \
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-six \
+    "
-- 
2.17.1


