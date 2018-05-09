Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id A4B8774F99
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 18:28:56 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id d73-v6so72310iog.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 11:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3FMmlJijkJjB1pwCVjNZqZ/6eAJ1ipFVcvrUxSin89o=;
	b=uoD7bH0jvOVWZPN4qOx7HIZcW9fkn+H7yHBglJWP/mAJRudnfxLsD9pbTHYx97kfXU
	aEZDehFcldhjbww8KxWIIUJQmFoXnRIq/cUVTBE1CAkdJTHk3mxgg+7yDUx7GtYIXQzs
	rw63CjIboWt03N89bD98K/w5R+cYNvaGEnr4mRlmk+tStX4SchK3ayMFZbD9PHIcNmZt
	+nyxF9mFNTgY7vNCGVb4j2mFK8H83mHML8FR4TFUY/2wkx3oXMHUJfIzEH6RRUL9sVxJ
	yj78LzLXzweTlN27DwQ+JzKrfhQDZ9rdNg2Slw3Dl7SVtNFUtc8GI9cDOZdkPNPj0PNX
	XJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3FMmlJijkJjB1pwCVjNZqZ/6eAJ1ipFVcvrUxSin89o=;
	b=E+/pBlxirHoxl7D4Xel0g9uztRKpEyOGfWjO6DSS0I5KpD6WFU3mDSzTq/AToiQZIv
	FYlbmH5OQVFazYLK84/vyQpvWR8JybXEKbTd1iFKPUkJVf7M1uQaQTZaXCzr8nxcUmrx
	nxu2yZ522rnbqYYjS64D5ydYTy9nYr1pQO+Sgo0V8YYMjNs3vMob/AB6ntW/CEIb2ASd
	no1v5W4YsvlTiggFvB2xhXSYQLseEMOAgArZlg1Rh9hIpdnXp7/GhOxts1GqMNIGWJ9T
	2UIv8upNKtILThaB/rM2kgmEF2rb7e945wprWwRQ2J5aAMWMjam63t4X1DfDRe7Wxca4
	gEvg==
X-Gm-Message-State: ALQs6tBoOCRhTCn8nXPx8fjkJxJ+j5vITCOjJBaKQYoe4oFT462EL34a
	jONPFCgWGdZ3Eg3nPZknToAYBATW
X-Google-Smtp-Source: AB8JxZqiQTwVggnR9NMUY/EjLFhva6L000qe26Jrm2UoI959gDQc6WRIfVbl2ldccOUmKuyWS72irg==
X-Received: by 2002:a6b:6918:: with SMTP id
	e24-v6mr54576363ioc.242.1525890537059; 
	Wed, 09 May 2018 11:28:57 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	g16-v6sm5876963ita.0.2018.05.09.11.28.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 11:28:56 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 14:28:40 -0400
Message-Id: <20180509182840.21251-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
In-Reply-To: <20180509182840.21251-1-twoerner@gmail.com>
References: <20180509182840.21251-1-twoerner@gmail.com>
Subject: [meta-initramfs][PATCH 2/2] grubby: update to latest
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
X-List-Received-Date: Wed, 09 May 2018 18:28:56 -0000

This project doesn't seem to produce regular releases as they once did, the
last such release (8.40-1) was in 2015 (over 3 years ago at this point).
Therefore switch to building the latest git commit.

Also, refresh the patches as required (used devtool --force-patch-refresh).

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 ...able-LIBS-to-provides-libraries-from.patch | 14 ++---
 ...rename-grub2-editenv-to-grub-editenv.patch | 59 +++++++++++--------
 .../recipes-devtools/grubby/grubby_git.bb     | 40 +++++++++++++
 3 files changed, 79 insertions(+), 34 deletions(-)
 create mode 100644 meta-initramfs/recipes-devtools/grubby/grubby_git.bb

diff --git a/meta-initramfs/recipes-devtools/grubby/grubby/0001-Add-another-variable-LIBS-to-provides-libraries-from.patch b/meta-initramfs/recipes-devtools/grubby/grubby/0001-Add-another-variable-LIBS-to-provides-libraries-from.patch
index 1b1a993a03..dfbe7ba6b4 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby/0001-Add-another-variable-LIBS-to-provides-libraries-from.patch
+++ b/meta-initramfs/recipes-devtools/grubby/grubby/0001-Add-another-variable-LIBS-to-provides-libraries-from.patch
@@ -1,26 +1,24 @@
-From 22afaa21b4b258082be591e54c99e1ba6fbd7748 Mon Sep 17 00:00:00 2001
+From b7b3caa9b5c8abcd3c371d0683001cd681e104b3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Jul 2017 10:19:22 -0700
 Subject: [PATCH 1/2] Add another variable LIBS to provides libraries from env
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index ac14404..92a8e73 100644
+index cc7e823..ae30a07 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -27,7 +27,7 @@ RPM_OPT_FLAGS ?= -O2 -g -pipe -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector
- CFLAGS += $(RPM_OPT_FLAGS) -std=gnu99 -Wall -Werror -Wno-error=unused-function -Wno-unused-function -ggdb
- LDFLAGS := 
+@@ -31,7 +31,7 @@ ifneq ($(VERBOSE_TEST),)
+ 	VERBOSE_TEST="--verbose"
+ endif
  
 -grubby_LIBS = -lblkid -lpopt
 +grubby_LIBS = -lblkid -lpopt ${LIBS}
  
  all: grubby
  
--- 
-2.13.3
-
diff --git a/meta-initramfs/recipes-devtools/grubby/grubby/grubby-rename-grub2-editenv-to-grub-editenv.patch b/meta-initramfs/recipes-devtools/grubby/grubby/grubby-rename-grub2-editenv-to-grub-editenv.patch
index d936249be8..e693916e1d 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby/grubby-rename-grub2-editenv-to-grub-editenv.patch
+++ b/meta-initramfs/recipes-devtools/grubby/grubby/grubby-rename-grub2-editenv-to-grub-editenv.patch
@@ -1,4 +1,4 @@
-From 0841706a5b5280e501c8e392c70c466c5fbcf0aa Mon Sep 17 00:00:00 2001
+From 15f0572f2f456c2c1b700bc790d9ce7a5c13cc74 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Tue, 4 Aug 2015 23:54:41 -0700
 Subject: [PATCH] rename grub2-editenv to grub-editenv
@@ -8,38 +8,48 @@ We don't use the name grub2-editenv for grub2.
 Upstream-Status: Inappropriate
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
 ---
  grubby.c | 4 ++--
- test.sh  | 6 +++---
- 2 files changed, 5 insertions(+), 5 deletions(-)
+ test.sh  | 8 ++++----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/grubby.c b/grubby.c
-index d4ebb86..47a1a15 100644
+index 396041a..3ceae69 100644
 --- a/grubby.c
 +++ b/grubby.c
-@@ -290,7 +290,7 @@ static char *grub2GetEnv(struct configFileInfo *info, char *name)
-     char *s = NULL;
-     char *ret = NULL;
-     char *envFile = info->envFile ? info->envFile : "/boot/grub2/grubenv";
--    int rc = asprintf(&s, "grub2-editenv %s list | grep '^%s='", envFile, name);
-+    int rc = asprintf(&s, "grub-editenv %s list | grep '^%s='", envFile, name);
+@@ -301,7 +301,7 @@ static char *grub2GetEnv(struct configFileInfo *info, char *name)
+ 	char *ret = NULL;
+ 	char *envFile = info->envFile ? info->envFile : "/boot/grub2/grubenv";
+ 	int rc =
+-	    asprintf(&s, "grub2-editenv %s list | grep '^%s='", envFile, name);
++	    asprintf(&s, "grub-editenv %s list | grep '^%s='", envFile, name);
  
-     if (rc < 0)
- 	return NULL;
-@@ -361,7 +361,7 @@ static int grub2SetEnv(struct configFileInfo *info, char *name, char *value)
-     if (!value)
- 	    return -1;
+ 	if (rc < 0)
+ 		return NULL;
+@@ -373,7 +373,7 @@ static int grub2SetEnv(struct configFileInfo *info, char *name, char *value)
+ 	if (!value)
+ 		return -1;
  
--    rc = asprintf(&s, "grub2-editenv %s set '%s=%s'", envFile, name, value);
-+    rc = asprintf(&s, "grub-editenv %s set '%s=%s'", envFile, name, value);
-     free(value);
-     if (rc <0)
- 	return -1;
+-	rc = asprintf(&s, "grub2-editenv %s set '%s=%s'", envFile, name, value);
++	rc = asprintf(&s, "grub-editenv %s set '%s=%s'", envFile, name, value);
+ 	free(value);
+ 	if (rc < 0)
+ 		return -1;
 diff --git a/test.sh b/test.sh
-index 6379698..f738388 100755
+index 33d24cf..009479c 100755
 --- a/test.sh
 +++ b/test.sh
-@@ -574,7 +574,7 @@ if [ "$testgrub2" == "y" ]; then
+@@ -573,7 +573,7 @@ if [ "$testgrub2" == "y" ]; then
+         --remove-kernel=/boot/vmlinuz-2.6.38.2-9.fc15.x86_64 \
+         --boot-filesystem=/boot/
+     commandTest "saved_default output" \
+-        "grub2-editenv test/grub2-support_files/env_temp list" \
++        "grub-editenv test/grub2-support_files/env_temp list" \
+         "saved_entry=Linux, with Fedora 2.6.38.8-32.fc15.x86_64"
+ 
+     # copy a stanza and add arguments as well, while using --set-index=
+@@ -627,7 +627,7 @@ if [ "$testgrub2" == "y" ]; then
          --title='title' --initrd=/boot/new-initrd --boot-filesystem=/boot/ \
          --copy-default
      commandTest "saved_default output" \
@@ -48,7 +58,7 @@ index 6379698..f738388 100755
          "saved_entry=Linux, with Fedora 2.6.38.8-32.fc15.x86_64"
  
      testing="GRUB2 add kernel with default=saved_entry and a terrible title"
-@@ -587,13 +587,13 @@ if [ "$testgrub2" == "y" ]; then
+@@ -640,13 +640,13 @@ if [ "$testgrub2" == "y" ]; then
      testing="GRUB2 set default with default=saved_entry and a terrible name"
      grub2Test grub2.9 add/g2-1.9 --env grubenv.1 --set-default-index=0
      commandTest "saved_default output" \
@@ -64,6 +74,3 @@ index 6379698..f738388 100755
          "saved_entry=title"
  
      testing="GRUB2 --default-index with default=saved_entry"
--- 
-2.3.5
-
diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
new file mode 100644
index 0000000000..8430b7e102
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
@@ -0,0 +1,40 @@
+SUMMARY = "A command line tool for updating and displaying info about boot loaders"
+DESCRIPTION = "grubby is a command line tool for updating and displaying information \
+about the configuration files for the grub, lilo, elilo (ia64), yaboot (powerpc) and \
+zipl (s390) boot loaders. It is primarily designed to be used from scripts which install \
+new kernels and need to find information about the current boot environment. \
+"
+HOMEPAGE = "https://github.com/rhboot/grubby"
+LICENSE = "GPLv2+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
+
+DEPENDS = "popt util-linux"
+DEPENDS_append_libc-musl = " libexecinfo"
+
+S = "${WORKDIR}/git"
+SRCREV = "a1d2ae93408c3408e672d7eba4550fdf27fb0201"
+SRC_URI = "git://github.com/rhboot/grubby.git;protocol=https; \
+           file://grubby-rename-grub2-editenv-to-grub-editenv.patch \
+           file://run-ptest \
+           file://0001-Add-another-variable-LIBS-to-provides-libraries-from.patch \
+           file://0002-include-paths.h-for-_PATH_MOUNTED.patch \
+           "
+
+RDEPENDS_${PN} += "dracut"
+
+inherit autotools-brokensep ptest
+
+EXTRA_OEMAKE = "-e 'CC=${CC}' 'LDFLAGS=${LDFLAGS}' LIBS='${LIBS}'"
+
+LIBS_libc-musl = "-lexecinfo"
+LIBS ?= ""
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    cp -r ${S}/test ${S}/test.sh ${D}${PTEST_PATH}
+    sed -i 's|./grubby|grubby|' ${D}${PTEST_PATH}/test.sh
+}
+
+RDEPENDS_${PN}-ptest = "util-linux-getopt bash"
+
+COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
-- 
2.17.0.rc2.3.gc2a499e6c


