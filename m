Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6BEC433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 16:14:04 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.62387.1656864836483338463
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jul 2022 09:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qrGhlozs;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id j18so1045315plj.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jul 2022 09:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K+4qSws7R0+AM+oxhcznKz1p31idws7OxR+xupRjH44=;
        b=qrGhlozsT7dv2AUu1cGP7o5Mkwb24O/Dth4gbxnwFWU/IFYTK0NX1GTuaEuzR5W5xB
         vC10Gi3TNPROdomrR/cMtgSndTptftaVIR/K84TAYdHnkW7vmJuuNzoXhjRAkL0y6J1t
         6GpABWk+jqOLL+HEM7j96mgQlN79lFtmSULsHJOCUlB0bFp+1syKhLQNfO2P9aUtg920
         0teK1G3buXV7s9vJ8u7HAwqykQfHotl11LSojLVVcqEZ9iR9w7zS5dL5rp/wdQbcqBBm
         JCdX1kRmjItd2bojqLZXdQSglP1daeJUOkWRiTW9WwryMxkZOvGQWVa6OF+a/7q7aidQ
         YFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K+4qSws7R0+AM+oxhcznKz1p31idws7OxR+xupRjH44=;
        b=Ce2D1iIcfMa8YyZWkmwlziMaqTaZPE3Co98x8VxxLYTTTybpHaZPk5GE+aZMLQbH45
         wHPkQYcrsdbITC4tONU83AD3c96AQoVAV7N8GDLoR5CB+bwx63ysYQbNvwdGZSqFW7jz
         Sp+cp9NLt0hZ73VXqf6pgyfBGtXkWNpGGMc9Ee8tyAtNT1f0Zgg1RArJp4BCCtx5me99
         QpD7xldO2BCoaS6/JG3MyNtNvI7e4wh8uG5wRZ2qNUngWNvS9YZh2GCJKuJkaQkmIsqR
         LA+OPAUh1qqKG/sTwOqgZnQNRvGb19fVPb+zHL7owZDPorsPBaiaLdyySooYLdlYDyjg
         HLDQ==
X-Gm-Message-State: AJIora/1RvDToFZ7SNnHgcAwu8N+HSYti1Ii50Irr8/DlUehdnhhsnf6
	iSk1Ie+ZL5ZU6fr40uRcu2A/FGz1D46Cew==
X-Google-Smtp-Source: 
 AGRyM1u5iRLP6qrHh7jGvVF8cLP4QMBae+HdHv7LiwYx8zS0W9C25QpY2BjuYurbapi84z47v5TmfQ==
X-Received: by 2002:a17:90a:ac04:b0:1ec:81d2:739 with SMTP id
 o4-20020a17090aac0400b001ec81d20739mr30930115pjq.171.1656864835363;
        Sun, 03 Jul 2022 09:13:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7b1b])
        by smtp.gmail.com with ESMTPSA id
 v12-20020a17090a0c8c00b001ece32cbec9sm8003498pja.24.2022.07.03.09.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 09:13:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] php: Fix absolute paths to php in phar.phar scripts
Date: Sun,  3 Jul 2022 09:13:52 -0700
Message-Id: <20220703161352.2516944-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Jul 2022 16:14:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97679

This patch is not only needed for target but also needed for native and
nativesdk variants.

Fixes
 do_populate_sysroot: QA Issue: : /work/x86_64-linux/php-native/8.1.7-r0/sysroot-destdir/
work/x86_64-linux/php-native/8.1.7-r0/recipe-sysroot-native/usr/bin/phar.phar maximum shebang size exceeded, the ma
ximum size is 128. [shebang-size]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch | 9 ++-------
 meta-oe/recipes-devtools/php/php_8.1.7.bb                | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch b/meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch
index 26872d1204..acf2940839 100644
--- a/meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch
+++ b/meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch
@@ -18,11 +18,9 @@ Signed-off-by: Claude Bing <cbing@cybernetics.com>
  ext/phar/Makefile.frag | 17 +++--------------
  1 file changed, 3 insertions(+), 14 deletions(-)
 
-diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
-index 58789cae25..c02af1b186 100644
 --- a/ext/phar/Makefile.frag
 +++ b/ext/phar/Makefile.frag
-@@ -10,20 +10,9 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
+@@ -10,20 +10,9 @@ pharcmd: $(builddir)/phar.php $(builddir
  
  PHP_PHARCMD_SETTINGS = -n -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1' -d phar.readonly=0
  PHP_PHARCMD_EXECUTABLE = ` \
@@ -42,10 +40,7 @@ index 58789cae25..c02af1b186 100644
 -PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(INSTALL_ROOT)$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
 +               $(top_srcdir)/build/shtool echo -n -- "$(PHP_EXECUTABLE)"; `
 +
-+PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "$(bindir)/$(program_prefix)php$(program_suffix)$(EXEEXT)";`
++PHP_PHARCMD_BANG = `$(top_srcdir)/build/shtool echo -n -- "/usr/bin/env $(program_prefix)php$(program_suffix)$(EXEEXT)";`
  
  $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
  	-@test -d $(builddir)/phar || mkdir $(builddir)/phar
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php_8.1.7.bb b/meta-oe/recipes-devtools/php/php_8.1.7.bb
index e9e8eccf3a..043f3a81b2 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.7.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.7.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://0002-build-php.m4-don-t-unset-cache-variables.patch \
            file://0003-php-remove-host-specific-info-from-header-file.patch \
            file://0004-configure.ac-don-t-include-build-libtool.m4.patch \
+           file://0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch \
            file://0009-php-don-t-use-broken-wrapper-for-mkdir.patch \
            file://0010-iconv-fix-detection.patch \
           "
@@ -23,7 +24,6 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
 SRC_URI:append:class-target = " \
             file://0001-ext-opcache-config.m4-enable-opcache.patch \
             file://0005-pear-fix-Makefile.frag-for-Yocto.patch \
-            file://0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch \
             file://0007-sapi-cli-config.m4-fix-build-directory.patch \
             file://0008-ext-imap-config.m4-fix-include-paths.patch \
             file://php-fpm.conf \
-- 
2.37.0


