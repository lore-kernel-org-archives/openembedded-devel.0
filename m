Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id AB46260053
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Feb 2017 17:30:46 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id s186so5117218qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2017 09:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NdJtTakx/dwuwoqRgych/rFTYFPlEp/rEt12w2u97oU=;
	b=KN4gEXi3PNFL++ZnkvZbNbccpYvu91WR4cnHTVY21E5yZAWiZmHQ+nQPmPCuzhcsAi
	zVeD2sfjxAU/vaYw5rrnYgbJTBYP2gSuPuO3CR4/rrL1biQ5T0nWPWtJcF3dNLrG82Ki
	na7yu+2brPDjyesbtpRdthk9aYu+nhsXkxaTRc1V3AR9Jr73NkZcn2H9DpmBmMQnTUQz
	oeT+lVwAFkMY6zXRfyiN69qjzyKMtkoof0FAVslQDLENyQZnTZ1SsOc1q7GYMQHjomWk
	Dr/QVt/D+yGEtobNYIt39cnLO9iTVF80J3Ie6HZz5cSQyqriGesGIbn+7n4hzDXMhvsN
	7qqQ==
X-Gm-Message-State: AMke39k+H2Sp1AeleDX20InRMjy303+Vq+XUzMpWoYyp2JIVL0dfJfYQGM7cf7a/eICCpA==
X-Received: by 10.55.89.196 with SMTP id n187mr14417843qkb.17.1486143047296;
	Fri, 03 Feb 2017 09:30:47 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	r24sm24861520qkl.5.2017.02.03.09.30.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Feb 2017 09:30:46 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Feb 2017 12:30:40 -0500
Message-Id: <1486143040-14351-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyudev: update to version 0.21.0
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
X-List-Received-Date: Fri, 03 Feb 2017 17:30:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-pyudev_0.20.0.bb => python-pyudev_0.21.0.bb}   | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyudev_0.20.0.bb => python-pyudev_0.21.0.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python-pyudev_0.20.0.bb b/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python-pyudev_0.20.0.bb
rename to meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
index e403d4e..7253f88 100644
--- a/meta-python/recipes-devtools/python/python-pyudev_0.20.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyudev_0.21.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "A libudev binding"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[md5sum] = "30c19f94dba43b6f5a010285838a3f45"
-SRC_URI[sha256sum] = "14d85bc9611dbf798732996cb7107858f58a3a1b9d246e4063c7a20ade65842a"
+SRC_URI[md5sum] = "cf4d9db7d772622144ca1be6b5d9353b"
+SRC_URI[sha256sum] = "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b"
 
 inherit pypi setuptools
 
@@ -13,8 +13,10 @@ do_configure_prepend() {
 }
 
 RDEPENDS_${PN} = "\
-    python-ctypes \
-    python-subprocess \
-    python-misc \
-    python-contextlib \
+    ${PYTHON_PN}-contextlib \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-threading \
 "
-- 
2.7.4


