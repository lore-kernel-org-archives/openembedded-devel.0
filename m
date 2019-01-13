Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4E8947C113
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 10:55:52 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id y20so16426844edw.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 02:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JBW3eOls1SRygmu7p1l+++3eUQ4qrxCJZEMv9FcodeU=;
	b=o1yHIRxy8F1TlV2uJhFHYdJ1QltjJnqdNlK/L+KZvdVSSFYGIhAw/wpl+TNkBTuoOX
	WoMvK+hlFbMpPv7xNdPs17lYH+fvxqyDuPnZKJ7ddj++gItShtzfzqMSWQ4d0tupabEY
	qfVaBN4laZbtjTp7hvYt1wLTUfBl3rfmArB+inc2q+LZLdyA7KLQENowe1kB4r+Z+QTZ
	I68evkNq87fR0jsgBSJYPQC4A/LqvjN9y6xysUJSciL873xWlDLdQdC4pjR23rOWljbu
	TikiLEGS+p2KSHw1DPcSmB0wKFkI2pY78aVBM2JwHhoHOGxV7IqRJZy/5gWUsr/H0mMg
	xORw==
X-Gm-Message-State: AJcUukdjxYMiPpLOCADL3xanA6oML1XyJQA0sXqaoxIukRGMive9gmFx
	Q6FPjhRaZ4+Pk5i3aj7pweTZWkHW
X-Google-Smtp-Source: ALg8bN5ACO98Vk38xNxB+cNakxhS1O6ff9K0tuKrtGemTYgQem6j2XN495p6HTU69y7ZLhiLQjQ3oA==
X-Received: by 2002:a50:ce0f:: with SMTP id y15mr18545350edi.207.1547376952788;
	Sun, 13 Jan 2019 02:55:52 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	p1-v6sm1912798ejo.49.2019.01.13.02.55.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Jan 2019 02:55:52 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Jan 2019 10:55:51 +0000
Message-Id: <20190113105551.12243-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] meta-oe: remove True option to getVar calls (again)
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
X-List-Received-Date: Sun, 13 Jan 2019 10:55:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

A couple have still been missed in the past despite multiple
attempts at doing so (or simply have re-appeared?).

Search & replace made using the following command:
    sed -e 's|\(d\.getVar \?\)( \?\([^,()]*\), \?True)|\1(\2)|g' \
        -i $(git grep -E 'getVar ?\( ?([^,()]*), ?True\)' \
             | cut -d':' -f1 \
             | sort -u)

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-oe/classes/scancode.bbclass                  | 10 +++++-----
 meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb   |  2 +-
 meta-oe/recipes-devtools/php/php.inc              |  2 +-
 meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb |  2 +-
 meta-oe/recipes-kernel/bpftool/bpftool.bb         |  2 +-
 meta-oe/recipes-kernel/cpupower/cpupower.bb       |  2 +-
 meta-oe/recipes-support/opencv/opencv_3.4.3.bb    |  4 ++--
 7 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-oe/classes/scancode.bbclass b/meta-oe/classes/scancode.bbclass
index 701660f57..e0f0dbca4 100644
--- a/meta-oe/classes/scancode.bbclass
+++ b/meta-oe/classes/scancode.bbclass
@@ -3,18 +3,18 @@
 # For more informaiton https://github.com/nexB/scancode-toolkit
 
 SCANCODE_FORMAT ?= "html-app"
-EXT = "${@'html' if d.getVar('SCANCODE_FORMAT', True) == 'html-app' else 'json'}"
+EXT = "${@'html' if d.getVar('SCANCODE_FORMAT') == 'html-app' else 'json'}"
 SCANCODE_TOOLKIT = "${@get_scancode_toolkit(d)}"
 SCANCODE_TAG = "v2.2.1"
 SCANCODE_GIT_LOCATION ?= "https://github.com/nexB/scancode-toolkit.git"
 SCANCODE_SRC_LOCATION ?= "${DL_DIR}/scancode"
 
 def get_scancode_toolkit(d):
-    lf = bb.utils.lockfile(d.getVar('SCANCODE_SRC_LOCATION', True) + ".lock")
-    if (not os.path.exists(d.getVar('SCANCODE_SRC_LOCATION', True))):
-        os.system("git clone %s %s -b %s" % (d.getVar('SCANCODE_GIT_LOCATION', True), d.getVar('SCANCODE_SRC_LOCATION', True), d.getVar('SCANCODE_TAG', True)))
+    lf = bb.utils.lockfile(d.getVar('SCANCODE_SRC_LOCATION') + ".lock")
+    if (not os.path.exists(d.getVar('SCANCODE_SRC_LOCATION'))):
+        os.system("git clone %s %s -b %s" % (d.getVar('SCANCODE_GIT_LOCATION'), d.getVar('SCANCODE_SRC_LOCATION'), d.getVar('SCANCODE_TAG')))
     bb.utils.unlockfile(lf)
-    return (d.getVar('SCANCODE_SRC_LOCATION', True))
+    return (d.getVar('SCANCODE_SRC_LOCATION'))
 
 do_scancode() {
 	mkdir -p ${DEPLOY_DIR_IMAGE}/scancode
diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
index f3a0f70ee..c2d2180ba 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
@@ -22,7 +22,7 @@ BBCLASSEXTEND = "native"
 # you need to install the multilib development package (e.g.
 # libc6-dev-i386 on Debian/Ubuntu) and build a 32 bit host part
 # (HOST_CC="gcc -m32").
-BUILD_CC_ARCH_append = " ${@['-m32',''][d.getVar('SITEINFO_BITS', True) != '32']}"
+BUILD_CC_ARCH_append = " ${@['-m32',''][d.getVar('SITEINFO_BITS') != '32']}"
 
 # The lua makefiles expect the TARGET_SYS to be from uname -s
 # Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD
diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index bfd0ddfb8..ca7bd91b2 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -8,7 +8,7 @@ BBCLASSEXTEND = "native"
 DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native"
 DEPENDS_class-native = "zlib-native libxml2-native"
 
-PHP_MAJOR_VERSION = "${@d.getVar('PV', True).split('.')[0]}"
+PHP_MAJOR_VERSION = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
index ca38e6aa2..30c850365 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb
@@ -21,7 +21,7 @@ LDFLAGS_append_libc-musl = " -largp"
 
 def set_target_arch(d):
     import re
-    arch = d.getVar('TARGET_ARCH', True)
+    arch = d.getVar('TARGET_ARCH')
     if re.match(r'i.86', arch, re.I):
         return 'i386'
     else:
diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index dd7eaa2aa..f75ac6f81 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -27,7 +27,7 @@ do_install() {
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 python do_package_prepend() {
-    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
+    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
 }
 
 B = "${WORKDIR}/${BPN}-${PV}"
diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipes-kernel/cpupower/cpupower.bb
index 4544f5b2e..928973871 100644
--- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
+++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
@@ -30,7 +30,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 RDEPENDS_${PN} = "bash"
 
 python do_package_prepend() {
-    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
+    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
 }
 
 B = "${WORKDIR}/${BPN}-${PV}"
diff --git a/meta-oe/recipes-support/opencv/opencv_3.4.3.bb b/meta-oe/recipes-support/opencv/opencv_3.4.3.bb
index 0a99700b4..2b25e39dc 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.4.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.4.3.bb
@@ -20,7 +20,7 @@ SRC_URI[tinydnn.sha256sum] = "e2c61ce8c5debaa644121179e9dbdcf83f497f39de853f8dd5
 
 def ipp_filename(d):
     import re
-    arch = d.getVar('TARGET_ARCH', True)
+    arch = d.getVar('TARGET_ARCH')
     if re.match("i.86$", arch):
         return "ippicv_2017u3_lnx_ia32_general_20180518.tgz"
     else:
@@ -28,7 +28,7 @@ def ipp_filename(d):
 
 def ipp_md5sum(d):
     import re
-    arch = d.getVar('TARGET_ARCH', True)
+    arch = d.getVar('TARGET_ARCH')
     if re.match("i.86$", arch):
         return "ea72de74dae3c604eb6348395366e78e"
     else:
-- 
2.20.1


