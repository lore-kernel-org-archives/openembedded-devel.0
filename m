Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9808C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 20:26:51 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.14084.1657657605446668231
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jul 2022 13:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AuX3/mvo;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id y8so11579682eda.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jul 2022 13:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VqDFNMCcn5TLXfELzH21cpN3XNk58ok9sGMWFMVnKQE=;
        b=AuX3/mvokrylvJD9Bdpv1GQYqDGhGUXcQ9cBX4jWMu7jsUWt7goym1Y2ZWExEvqyJ+
         h04wE3Uep722QsROT37KE+yk2h3+W2+1ocjjtxVs4/jVSROM0VrdejhvDPbDPtZ3T0+o
         18TAtYy8dN2lb4OlRiSavuWV/A85LpCDcEnXTRJwuXo8fAS0Rkw6tRPyJf7qwV1aRWoG
         tI3Op2K0LuldRYkLMXIlJgf4MdrKPnXBBhWypvLuBjACNY+Mdc5xkW4w8rkXaPOcPJVF
         zgJdObphtzQvql0WHLELo/hbD34BEFH/AT9xzRKUWCwCJjWow1ORiahlga9+xY4gMR0F
         6IDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VqDFNMCcn5TLXfELzH21cpN3XNk58ok9sGMWFMVnKQE=;
        b=G1Eyc30QJUs9tc1oSZqjxHD/nE7Ia3Ol+kYvQqVzYGF9F0RhANYjLmiuwz/jk1b80G
         mmwTSjadZAduRrt4zOfikBiHLArKxmh04eP4zKDew7GrZi/FOkM2633cX9j1xRq02aZU
         6SiqL0sUqxQZ7+EZXLXkxL53V9PQMZyfIT1I7c5sIelw4+3qRzGJ4ZuPH+PtsfRFZsP/
         8GgQhur15rtRLlJtM57NdIdHMuOZL8vT8h7Dnv4mZbPJdTduhmk9FJEaQs3jbj+b/kAt
         GHB63nJ+ZKDPItLA2UcgM64UD94AJwBsoUCGdAKQMG0NTsIx+cUQpvsRmzsxE9okML4T
         ulPg==
X-Gm-Message-State: AJIora+YVllu9gCBfFgaV9SAByk0rGr+e0TshefZ65zHI6v9gOeibSYS
	n+ch22dwLAUZf7MbCx0zKNnL+36DxCk=
X-Google-Smtp-Source: 
 AGRyM1vRf3uNKKZnL5EEauyd6R/7vc6iWYxBYPEHwTSFuvnzR5/tDCoRXgfbo6DE6hAszinLAf+bVg==
X-Received: by 2002:a50:fb81:0:b0:43a:7975:c721 with SMTP id
 e1-20020a50fb81000000b0043a7975c721mr34771438edq.381.1657657603470;
        Tue, 12 Jul 2022 13:26:43 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 lb16-20020a170907785000b0072b36cbcdaasm4184433ejc.92.2022.07.12.13.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 13:26:43 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH v3] nftables: Upgrade 1.0.2 -> 1.0.4
Date: Tue, 12 Jul 2022 21:26:39 +0100
Message-Id: <20220712202639.6265-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Jul 2022 20:26:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97819

Drop backported patch, switch PACKAGECONFIG assignment to ?= (matches
current practice), add in editline, linenoise CLI options and xtables
option. Switch to --disable-python when building without python to avoid
a configure time warning.

We can drop UPSTREAM_CHECK_REGEX as the version no longer gets confused
by the 0.099 version which exists.

Fix buildpaths warning by switching to setuptools and add dependency on
${PN}-python to ${PN}-ptest so that the embedded paths in the compiled
python files are correct.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...-with-make-check-and-add-AM_CPPFLAGS.patch | 39 ----------------
 ...tables-python-Split-root-from-prefix.patch | 44 +++++++++++++++++++
 .../{nftables_1.0.2.bb => nftables_1.0.4.bb}  | 20 ++++-----
 3 files changed, 54 insertions(+), 49 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
 create mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-nftables-python-Split-root-from-prefix.patch
 rename meta-networking/recipes-filter/nftables/{nftables_1.0.2.bb => nftables_1.0.4.bb} (69%)

diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch b/meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
deleted file mode 100644
index 65ab2dfd8c49..000000000000
--- a/meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 18a08fb7f0443f8bde83393bd6f69e23a04246b3 Mon Sep 17 00:00:00 2001
-From: Pablo Neira Ayuso <pablo@netfilter.org>
-Date: Tue, 22 Feb 2022 00:56:36 +0100
-Subject: [PATCH] examples: compile with `make check' and add AM_CPPFLAGS
-
-Compile examples via `make check' like libnftnl does. Use AM_CPPFLAGS to
-specify local headers via -I.
-
-Unfortunately, `make distcheck' did not catch this compile time error in
-my system, since it was using the nftables/libnftables.h file of the
-previous nftables release.
-
-Fixes: 5b364657a35f ("build: missing SUBIRS update")
-Fixes: caf2a6ad2d22 ("examples: add libnftables example program")
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
-
-Upstream-Status: Backport
-[http://git.netfilter.org/nftables/commit/?id=18a08fb7f0443f8bde83393bd6f69e23a04246b3]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- examples/Makefile.am | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/examples/Makefile.am b/examples/Makefile.am
-index c972170d..3b8b0b67 100644
---- a/examples/Makefile.am
-+++ b/examples/Makefile.am
-@@ -1,4 +1,6 @@
--noinst_PROGRAMS	= nft-buffer		\
-+check_PROGRAMS	= nft-buffer		\
- 		  nft-json-file
- 
-+AM_CPPFLAGS = -I$(top_srcdir)/include
-+
- LDADD = $(top_builddir)/src/libnftables.la
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-nftables-python-Split-root-from-prefix.patch b/meta-networking/recipes-filter/nftables/nftables/0001-nftables-python-Split-root-from-prefix.patch
new file mode 100644
index 000000000000..377b29fff825
--- /dev/null
+++ b/meta-networking/recipes-filter/nftables/nftables/0001-nftables-python-Split-root-from-prefix.patch
@@ -0,0 +1,44 @@
+From c7513195a72b2e5be5c9c439cc606eb5dcc3fb7a Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Tue, 12 Jul 2022 17:44:34 +0100
+Subject: [PATCH] nftables: python: Split root from prefix
+
+The buildpaths QA check fails when python is enabled:
+
+  WARNING: nftables-1.0.4-r0 do_package_qa: QA Issue: File /usr/lib/python3.10/site-packages/nftables/__pycache__/nftables.cpython-310.pyc in package nftables-python contains reference to TMPDIR
+  File /usr/lib/python3.10/site-packages/nftables/__pycache__/__init__.cpython-310.pyc in package nftables-python contains reference to TMPDIR [buildpaths]
+
+Upstream-Status: Pending
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ py/Makefile.am | 2 +-
+ py/setup.py    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/py/Makefile.am b/py/Makefile.am
+index 215ecd9e4751..a827cca10135 100644
+--- a/py/Makefile.am
++++ b/py/Makefile.am
+@@ -7,7 +7,7 @@ all-local:
+ install-exec-local:
+ 	cd $(srcdir) && \
+ 		$(PYTHON_BIN) setup.py build --build-base $(abs_builddir) \
+-		install --prefix $(DESTDIR)$(prefix)
++		install --root $(DESTDIR) --prefix $(prefix)
+ 
+ uninstall-local:
+ 	rm -rf $(DESTDIR)$(prefix)/lib*/python*/site-packages/nftables
+diff --git a/py/setup.py b/py/setup.py
+index 72fc8fd98b26..976aec583b71 100755
+--- a/py/setup.py
++++ b/py/setup.py
+@@ -1,5 +1,5 @@
+ #!/usr/bin/env python
+-from distutils.core import setup
++from setuptools._distutils.core import setup
+ from nftables import NFTABLES_VERSION
+ 
+ setup(name='nftables',
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
similarity index 69%
rename from meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
index e078be79a1df..3466e16a62b4 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
@@ -6,26 +6,27 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d1a78fdd879a263a5e0b42d1fc565e79"
 DEPENDS = "libmnl libnftnl bison-native \
            ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
 
-# Ensure we reject the 0.099 version by matching at least two dots
-UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
-
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
-           file://0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch \
+           file://0001-nftables-python-Split-root-from-prefix.patch \
            file://run-ptest \
           "
 
-SRC_URI[sha256sum] = "0b28a36ffcf4567b841de7bd3f37918b1fed27859eb48bdec51e1f7a83954c02"
+SRC_URI[sha256sum] = "927fb1fea1f685a328c10cf791eb655d7e1ed49d310eea5cb3101dfd8d6cba35"
 
 inherit autotools manpages pkgconfig ptest
 
-PACKAGECONFIG ??= "python readline json"
+PACKAGECONFIG ?= "python readline json"
+PACKAGECONFIG[editline] = "--with-cli=editline, , libedit, , , linenoise readline"
 PACKAGECONFIG[json] = "--with-json, --without-json, jansson"
+PACKAGECONFIG[linenoise] = "--with-cli=linenoise, , linenoise, , , editline readline"
 PACKAGECONFIG[manpages] = "--enable-man-doc, --disable-man-doc, asciidoc-native"
 PACKAGECONFIG[mini-gmp] = "--with-mini-gmp, --without-mini-gmp"
-PACKAGECONFIG[python] = "--enable-python --with-python-bin=${PYTHON}, --with-python-bin="", python3"
-PACKAGECONFIG[readline] = "--with-cli=readline, --without-cli, readline"
+PACKAGECONFIG[python] = "--enable-python --with-python-bin=${PYTHON}, --disable-python, python3-setuptools-native"
+PACKAGECONFIG[readline] = "--with-cli=readline, , readline, , , editline linenoise"
 PACKAGECONFIG[xtables] = "--with-xtables, --without-xtables, iptables"
 
+EXTRA_OECONF = "${@bb.utils.contains_any('PACKAGECONFIG', 'editline linenoise readline', '', '--without-cli', d)}"
+
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
 
 RRECOMMENDS:${PN} += "kernel-module-nf-tables"
@@ -34,7 +35,7 @@ PACKAGES =+ "${PN}-python"
 FILES:${PN}-python = "${nonarch_libdir}/${PYTHON_DIR}"
 RDEPENDS:${PN}-python = "python3-core python3-json ${PN}"
 
-RDEPENDS:${PN}-ptest += " make bash python3-core python3-ctypes python3-json python3-misc util-linux"
+RDEPENDS:${PN}-ptest += " ${PN}-python make bash python3-core python3-ctypes python3-json python3-misc util-linux"
 
 TESTDIR = "tests"
 
@@ -46,7 +47,6 @@ do_install_ptest() {
     mkdir -p ${D}${PTEST_PATH}/src/.libs
     cp -rf ${B}/src/.libs/* ${D}${PTEST_PATH}/src/.libs
     cp -rf ${B}/src/.libs/nft ${D}${PTEST_PATH}/src/
-    cp -rf ${S}/py ${D}${PTEST_PATH}
     cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}/${TESTDIR}
     sed -i 's#/usr/bin/python#/usr/bin/python3#' ${D}${PTEST_PATH}/${TESTDIR}/json_echo/run-test.py
     sed -i 's#/usr/bin/env python#/usr/bin/env python3#' ${D}${PTEST_PATH}/${TESTDIR}/py/nft-test.py
-- 
2.35.1


