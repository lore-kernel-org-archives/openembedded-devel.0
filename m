Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2C2E47E97A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 21:18:24 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id i18so18260893pgl.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 14:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RR1+ziXPZZZi31Kxd3aFOGKTgnfeiAs774lMZt+SMD8=;
	b=gV8DmL1P1Qx0qj0R7EKiaZEDRBi2fgSs9/ZF5bJ1dMTM022cQIWXJQig6/Zq4GpTJN
	5N9cHmUFGtn4wd/4UO8sPjIUFyiMe1N+lO2MCjpBRCfrf/512xLtHh+r3NmXW3vfIyXY
	Vc++G7tKCY5AV9sxP9UDP28ac1YW3l9hQFlEq+377rHUyPc26HGEMCgAkzR60IUaK06K
	vm/6UqDE5c0mFTeFfmLTw+fp+zGWSZHwY6toR/zTaVoG7jXCtjKlptfYiN8XBhCVXk9I
	mfQATB347kg14hwP4rx2xwXwPCIUYHbjs1FGwP1Db8J9j9RgmT0nfvDQBjraTSHw/GqC
	UHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RR1+ziXPZZZi31Kxd3aFOGKTgnfeiAs774lMZt+SMD8=;
	b=jkoesb0GyBGKn13cHbDqmq/UjppevHMl/OPZWoFqSG09f8Ex2+5GAuFDggIZuQpPHY
	PM6lwfOprChAF0QlD9tZJGu7UuNgyRw1x9X8aeJ2N1lHwLTKKFkpSDROvpXpNYMEp8j2
	qn+NoQqUM7k1Ia9DOkAf2b+wEwSBN6H/EyFt4VDwuZjwRK2ngKH9TIoSETi026f/38su
	xKhpOgCHkcc4bfAeqZT40zixOWXVN6s1yMKbFjPMO/MroBbGQvS1bRzh45YUz8Wsgvvs
	lfvv1Qftb7iha10MMZVP4gEuYmLbMwqLkbiZptHGDeqL87+2zb190iFEagGyiO3Jar8z
	gX9A==
X-Gm-Message-State: APjAAAXn1ZJpY6/T3TUL9dZ5vsR3OIOFVSu4bAkUMSyJJSG3cbh88hk0
	qwc/pVWgTvn47YLKdyl7IL7ipCBkWvE=
X-Google-Smtp-Source: APXvYqyTJfoJojas1LFqcGmUSzCPrw+XhLzQ8CKGxr1CzIz3sIV0Yli4KAgVzjwmtyCiKReANlBN7Q==
X-Received: by 2002:a62:e71a:: with SMTP id s26mr2124206pfh.89.1563830304785; 
	Mon, 22 Jul 2019 14:18:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	a3sm36347816pfl.145.2019.07.22.14.18.24
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 22 Jul 2019 14:18:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jul 2019 14:18:14 -0700
Message-Id: <20190722211814.14237-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722211814.14237-1-raj.khem@gmail.com>
References: <20190722211814.14237-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Adrian Bunk <bunk@stusta.de>
Subject: [meta-oe][PATCH] log4cplus: Fix build with gold linker
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
X-List-Received-Date: Mon, 22 Jul 2019 21:18:24 -0000
Content-Transfer-Encoding: 8bit

Fixes a potential linker error and eventual linker crash when using gold
linker [1]

[1] https://errors.yoctoproject.org/Errors/Details/253440/

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>
Cc: Mingli Yu <mingli.yu@windriver.com>
---
 ...-version-entry-from-ELF-.comment-sec.patch | 40 +++++++++++++++++++
 .../log4cplus/log4cplus_2.0.4.bb              |  6 ++-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch

diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch b/meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch
new file mode 100644
index 0000000000..44a835c35f
--- /dev/null
+++ b/meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch
@@ -0,0 +1,40 @@
+From da5338e68f146efadab7c221291ba4c949d8f12f Mon Sep 17 00:00:00 2001
+From: Vaclav Haisman <vhaisman@gmail.com>
+Date: Sun, 21 Jul 2019 23:23:16 -0700
+Subject: [PATCH] Remove log4cplus version entry from ELF .comment section
+
+Reverts
+https://github.com/log4cplus/log4cplus/commit/9cb0d4ade619da4e40628c9b95ff51de3df29f1b
+
+Upstream-Status: Backport [https://github.com/log4cplus/log4cplus/commit/7e6addc70dffd2e30e902efd18eb845c5d5dd7bb]
+
+Suggested-by: Adrian Bunk <bunk@stusta.de>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/version.cxx | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/src/version.cxx b/src/version.cxx
+index ce18212..e002de9 100644
+--- a/src/version.cxx
++++ b/src/version.cxx
+@@ -34,16 +34,4 @@ namespace log4cplus
+ unsigned const version = LOG4CPLUS_VERSION;
+ char const versionStr[] = LOG4CPLUS_VERSION_STR LOG4CPLUS_VERSION_STR_SUFFIX;
+ 
+-namespace
+-{
+-
+-#if defined (__ELF__) && (defined (__GNUC__) || defined (__clang__))
+-char const versionStrComment[]
+-    __attribute__ ((__used__, __section__ ((".comment"))))
+-    = "log4cplus " LOG4CPLUS_VERSION_STR LOG4CPLUS_VERSION_STR_SUFFIX;
+-#endif
+-
+-
+-} // namespace
+-
+ } // namespace log4cplus
+-- 
+2.22.0
+
diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
index d86521aba3..b396cabf3f 100644
--- a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
+++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
@@ -6,7 +6,9 @@ BUGTRACKER = "http://sourceforge.net/p/log4cplus/bugs/"
 LICENSE = "Apache-2.0 & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
+           file://0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch \
+          "
 SRC_URI[md5sum] = "2b5b7bc294698bf30a315a259ef9eec2"
 SRC_URI[sha256sum] = "196eedbc7f2dd792dae721b1159c7ac132255bb368226353c24d4d5fa7c7797a"
 
@@ -16,3 +18,5 @@ UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
 inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native"
+
+CXXFLAGS += "-fuse-ld=gold"
-- 
2.22.0


