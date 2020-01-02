Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 724ED7F961
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 09:10:30 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id d139so4558942wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 01:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=q0yaT9uYJSphKGu1tPcDyeP8ZX+DhqAnaKt2WrX54Mw=;
	b=OGysLKenTb18KFJLb52O6SI746fAIiqazH0t53ayizhdN00ZsNn5d/dIvSNgYDY/W/
	pMsXHJJPPBTEgAj0lwlosYuriz+zObYqpd7clYrfKyf91fYfWG8JPyFtQRX1SbbiReU7
	Dm0d4PSEL27JBnYvKj0tfozvH0DpzIKhbn3YM4C/fYycfbWyR+5dy/Tsw05LW4RxsUCY
	5NJKWthuPUbZafCSScHN7fWmvh3s5nLrv0NnSnozpvHP/c8NPBD7DsOw49oewMDtse2j
	krZT3jCJ8+7M5ys+OvW7nhDkoG1q6zldfz/JV13HxgWgBpN1Qs7rWC5wv+M/8kr2JX7o
	HR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=q0yaT9uYJSphKGu1tPcDyeP8ZX+DhqAnaKt2WrX54Mw=;
	b=H7QTJ2b2tPqVB1YXtp2eGqcABSrkcrwL/wrkKZB4JVi+fvW9v9oPMFuLGo8N6jYhla
	hqDmB3XqozPuMmWIxCjdyLIVUFjQqkAGevwSLuiTuG9X/T55WaJNJYoe1/fibPQxInCm
	y4pmdh8Vv7wCAMseQeq1oGqLEMb0J+gcHbJ+so/zw0Wixrp0EV43yt8AwjH2/6LG+aEZ
	lOulmI+VSUbpfmsWJDqNjp3aS6obHm87ZtoSkBEEiRR4F9LVWUyurM6Z8k8e3yk15OVE
	+lUhcdqwmsdyVwW5D8MQf6GzRnBr/RD+XI7LNeRYJtz02L4m9aB9DDEJksMT3QzgZHaO
	Sjpg==
X-Gm-Message-State: APjAAAXC2JRlaaxo54Lw2apOoQlqAR66kxDu6X2DefTQxVXVqu/L9Snw
	QiCDXYQszyBZGx37seqHX/FPpVA/9Ds=
X-Google-Smtp-Source: APXvYqwaM6WHnZz0FBcJ5PbBpNAIwGmAyPQSX+fOnntN4gPYKWS/mUIFP2LZGXVx+3UJBHG6SzE+yA==
X-Received: by 2002:a7b:c74c:: with SMTP id w12mr13369455wmk.1.1577956230596; 
	Thu, 02 Jan 2020 01:10:30 -0800 (PST)
Received: from beaker.muppets.liwing.de (p5B25B970.dip0.t-ipconnect.de.
	[91.37.185.112])
	by smtp.gmail.com with ESMTPSA id t1sm7919076wma.43.2020.01.02.01.10.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 01:10:29 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 10:07:27 +0100
Message-Id: <20200102090727.7333-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-oe][PATCH] log4cplus: update to 2.0.5
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
X-List-Received-Date: Thu, 02 Jan 2020 09:10:30 -0000

Update log4cplus library to 2019-12-23 released version containing (relevant
for *nix)
* Modernized CMake build.
* Fix issue with std::va_list value reuse.
* Fix parsing of include in configuration when included file path
  contains =. (Patch by Peter Pei)
* Change of default behaviour: Instantiate thread pool with only 4 threads

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 ...-version-entry-from-ELF-.comment-sec.patch | 40 -------------------
 ...{log4cplus_2.0.4.bb => log4cplus_2.0.5.bb} |  5 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch
 rename meta-oe/recipes-devtools/log4cplus/{log4cplus_2.0.4.bb => log4cplus_2.0.5.bb} (73%)

diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch b/meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch
deleted file mode 100644
index 44a835c35..000000000
--- a/meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From da5338e68f146efadab7c221291ba4c949d8f12f Mon Sep 17 00:00:00 2001
-From: Vaclav Haisman <vhaisman@gmail.com>
-Date: Sun, 21 Jul 2019 23:23:16 -0700
-Subject: [PATCH] Remove log4cplus version entry from ELF .comment section
-
-Reverts
-https://github.com/log4cplus/log4cplus/commit/9cb0d4ade619da4e40628c9b95ff51de3df29f1b
-
-Upstream-Status: Backport [https://github.com/log4cplus/log4cplus/commit/7e6addc70dffd2e30e902efd18eb845c5d5dd7bb]
-
-Suggested-by: Adrian Bunk <bunk@stusta.de>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/version.cxx | 12 ------------
- 1 file changed, 12 deletions(-)
-
-diff --git a/src/version.cxx b/src/version.cxx
-index ce18212..e002de9 100644
---- a/src/version.cxx
-+++ b/src/version.cxx
-@@ -34,16 +34,4 @@ namespace log4cplus
- unsigned const version = LOG4CPLUS_VERSION;
- char const versionStr[] = LOG4CPLUS_VERSION_STR LOG4CPLUS_VERSION_STR_SUFFIX;
- 
--namespace
--{
--
--#if defined (__ELF__) && (defined (__GNUC__) || defined (__clang__))
--char const versionStrComment[]
--    __attribute__ ((__used__, __section__ ((".comment"))))
--    = "log4cplus " LOG4CPLUS_VERSION_STR LOG4CPLUS_VERSION_STR_SUFFIX;
--#endif
--
--
--} // namespace
--
- } // namespace log4cplus
--- 
-2.22.0
-
diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.5.bb
similarity index 73%
rename from meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
rename to meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.5.bb
index 566de2853..967ac7623 100644
--- a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
+++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.5.bb
@@ -7,10 +7,9 @@ LICENSE = "Apache-2.0 & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
-           file://0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch \
           "
-SRC_URI[md5sum] = "2b5b7bc294698bf30a315a259ef9eec2"
-SRC_URI[sha256sum] = "196eedbc7f2dd792dae721b1159c7ac132255bb368226353c24d4d5fa7c7797a"
+SRC_URI[md5sum] = "71dd956bf686195127559671f1426cff"
+SRC_URI[sha256sum] = "c07115c23219390633798def30b7b51a0f79fdeb857e4b49632f17746d0ceb97"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
 UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.17.1


