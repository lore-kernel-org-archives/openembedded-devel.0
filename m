Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
	[209.85.210.51])
	by mail.openembedded.org (Postfix) with ESMTP id 943776111B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 22:57:05 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id 59so10702019otp.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m1QobTwXNxo8ToT0/dmTyI2Go4EHeCLS/URkWzEomvs=;
	b=tGvO6FVB2yuc/+dRG7isZISwL6+t6FF2oP2aKy7UhA8o8HUxeN+Hvw10al3Wv/gBt7
	yxHOKXGtSKIjDDgTpKnxGpkKCMfUmNM3wv9utxxg56e2MgdsFVs2gD2MVhN3nuszPltY
	JazqyQW+n1O/HLQcG2DiGRc6BwPUFGYw/hX5tG58fq+N1Jsl98IiCss2wevsid7NMNoS
	0ECrtukgKTe9Jg0OVwSYpfBYohdYa5qLbttGgdlbTlW73szgsSWb7yOSoEN6zLeE2lEe
	+XVCMjaAhnPFXQi6wxpfs7bTnhnh0NgbxPW/8A+bVz9BSV0Ua/7zpNifhxnvjUgoJd9C
	Fqwg==
X-Gm-Message-State: APjAAAVkNBDyjRQzqfj6eSYyNqNHiJUb9QM/mbCuoWmernccF2f3YYpc
	0Sb3AHsubxV9w+1wyNAU0rKVAZ+WRV4=
X-Google-Smtp-Source: APXvYqxi13zYipJfR3jjmRNe3XnD0w0I2W8G8VCckir/LV+PHNZR2R3r5WcWZvv81aKsmL5ZILObKg==
X-Received: by 2002:a9d:4c81:: with SMTP id m1mr4064947otf.5.1581721026217;
	Fri, 14 Feb 2020 14:57:06 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	w72sm2210904oie.49.2020.02.14.14.57.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 14:57:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 17:56:59 -0500
Message-Id: <20200214225659.21361-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-cmd2: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Fri, 14 Feb 2020 22:57:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-cmd2.inc   | 13 ------------
 .../python/python3-cmd2_0.9.23.bb             | 20 +++++++++++++++----
 2 files changed, 16 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-cmd2.inc

diff --git a/meta-python/recipes-devtools/python/python-cmd2.inc b/meta-python/recipes-devtools/python/python-cmd2.inc
deleted file mode 100644
index 68381ad220..0000000000
--- a/meta-python/recipes-devtools/python/python-cmd2.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Extra features for standard library's cmd module"
-HOMEPAGE = "http://packages.python.org/cmd2/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
-
-SRC_URI[md5sum] = "6db66a06210d5f1edb44693b887ed62b"
-SRC_URI[sha256sum] = "8ad12ef3cc46d03073c545b6e80a3f84a5921f6653073a60e7d9a7ff3b352c9e"
-
-inherit pypi
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb b/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
index f5c5c7e1a3..a2bf0c45e2 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
@@ -1,9 +1,21 @@
-inherit setuptools3
-require python-cmd2.inc
+SUMMARY = "Extra features for standard library's cmd module"
+HOMEPAGE = "http://packages.python.org/cmd2/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
+SRC_URI[md5sum] = "6db66a06210d5f1edb44693b887ed62b"
+SRC_URI[sha256sum] = "8ad12ef3cc46d03073c545b6e80a3f84a5921f6653073a60e7d9a7ff3b352c9e"
+
+inherit pypi setuptools3
 
 RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-attrs \
+    ${PYTHON_PN}-colorama \
     ${PYTHON_PN}-pyperclip \
     ${PYTHON_PN}-colorama \
-    ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-wcwidth \
-    "
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


