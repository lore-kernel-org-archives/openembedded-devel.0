Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2871B6B6A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 12:06:21 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id fb10so589092wid.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 04:06:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=e7TVAPib98/xJ/SNrtolRc1qB+JuTT3sECJ77idzdoU=;
	b=mtx9V2rI9BEpy8DY2vkWv75VZsCK8pGBvdEWA1B+RyWtwmX3+O0vM2KYOy3r5xuTkU
	f5UjHaiEOajHHvFLawDAtgsLLaUHed7M/u020DURwCNITyACKy1vYrUozP3vvl4FBxPC
	2DyTg1yPPvgYARgd8sFNvyCpgrS7eh2COLmd87N8FTFmGzzaIDVxdKkvMYrjwNxHB5VZ
	b4GGhjCBtnNcoY/ez9tE3ohoTBBO4BPVgLdSeQEIYcYE/AZRzrVoxJFvj68+jeqs19w9
	PaRxD4oVQMUhYoekzAhYkuyk5XKTscmmn7gJCUOa4b9+rqhiCk4uUeQeuumXXzgjz0L8
	D5Kw==
X-Gm-Message-State: ALoCoQkq7iDD2NqKIVypb2H/y5zaZpk92W7L82gGIT9EGblI5rqyf/J7/bxOyTYPXUVAruMhE8d9
X-Received: by 10.194.48.74 with SMTP id j10mr1569905wjn.41.1389960381603;
	Fri, 17 Jan 2014 04:06:21 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id y13sm9153018wjr.8.2014.01.17.04.06.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jan 2014 04:06:20 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2014 13:06:13 +0100
Message-Id: <1389960374-16694-2-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1389960374-16694-1-git-send-email-koen.kooi@linaro.org>
References: <1389960374-16694-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCHv2 2/3] acpica: replace patch with EXTRA_OEMAKE args
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jan 2014 12:06:21 -0000

No need to patch the makefile when you can just passs CC=${TARGET_PREFIX}gcc to make.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-extended/acpica/acpica_20140114.bb    |  3 +--
 .../recipes-extended/acpica/files/cross-compile.patch | 19 -------------------
 2 files changed, 1 insertion(+), 21 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/acpica/files/cross-compile.patch

diff --git a/meta-oe/recipes-extended/acpica/acpica_20140114.bb b/meta-oe/recipes-extended/acpica/acpica_20140114.bb
index 5cc2d5a..2bb7ad7 100644
--- a/meta-oe/recipes-extended/acpica/acpica_20140114.bb
+++ b/meta-oe/recipes-extended/acpica/acpica_20140114.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://generate/unix/readme.txt;md5=204407e197c1a01154a48f6c
 DEPENDS = "bison flex"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
-    file://cross-compile.patch \
     file://no-werror.patch \
     "
 SRC_URI[md5sum] = "fcd4b7304f1bfabc7d4b9cfdecc6b0c6"
@@ -20,7 +19,7 @@ SRC_URI[sha256sum] = "0d5bd32690ab77e21ab143ef25361c314a4ed13c33a5fb3ddd6f5559ab
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
 
-EXTRA_OEMAKE = "'OPT_CFLAGS=-Wall'"
+EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc 'OPT_CFLAGS=-Wall'"
 
 do_install() {
     install -D -p -m0755 generate/unix/bin*/iasl ${D}${bindir}/iasl
diff --git a/meta-oe/recipes-extended/acpica/files/cross-compile.patch b/meta-oe/recipes-extended/acpica/files/cross-compile.patch
deleted file mode 100644
index f2917ca..0000000
--- a/meta-oe/recipes-extended/acpica/files/cross-compile.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Description: add cross compile support
-Forwarded: not-needed
-Author: Fathi Boudra <fathi.boudra@linaro.org>
-
----
- generate/unix/Makefile.config |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/generate/unix/Makefile.config
-+++ b/generate/unix/Makefile.config
-@@ -35,7 +35,7 @@
- .SUFFIXES :
- PROGS = acpibin acpidump acpiexec acpihelp acpinames acpisrc acpixtract iasl
- HOST ?= _CYGWIN
--CC =    gcc
-+CC ?=    $(CROSS_COMPILE)gcc
- 
- #
- # Common defines
-- 
1.8.4.2


