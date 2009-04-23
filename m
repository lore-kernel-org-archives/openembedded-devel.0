Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LwneJ-0001Mv-RQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 03:22:48 +0200
Received: by qyk30 with SMTP id 30so632193qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 18:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=+YgX/Z/8RsREZKfsf5JX2yq10NgViW8i6Wr6c/dMNrM=;
	b=vzOfjUFhncC23PGRhPH8/nRAYQTdrYXL1QgZk6sOC2ZL4iWx4bljbsQvIAD3ceEKmA
	K6i1enC+XjNc0f7SRFuuBzxwWdlPTwteHzpYo39d2fyRB7LNXvRve7iSaBp7pmzWrhT1
	8UZLmd834q1d0JMKJFJJxH8iJV2xCTVLKCzjc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=pjdkE1TYQ2fYeMORpt+1pAT+vz+4JGTFm8QaQkOjZ/ac2VW0bVJIo+L1eeMhWpqb0o
	+M1l1C8Y4oA05CrrKEwdmsLcTp0FRPVQuqfeVv8kgkztM3vGM6kzFPcZ/yK4jhuIpdAE
	vsTeJ/t6rDV2JryxJzfkQ+2jzT8UOwZXEv9Mk=
Received: by 10.220.45.208 with SMTP id g16mr743432vcf.111.1240449491088;
	Wed, 22 Apr 2009 18:18:11 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm592480ywn.5.2009.04.22.18.18.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 22 Apr 2009 18:18:09 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 9B8E561006D; Wed, 22 Apr 2009 22:17:54 -0300 (BRT)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Apr 2009 22:17:38 -0300
Message-Id: <1240449461-26116-4-git-send-email-otavio@debian.org>
X-Mailer: git-send-email 1.6.2.1.303.g63699
In-Reply-To: <1240449461-26116-3-git-send-email-otavio@debian.org>
References: <1240449461-26116-1-git-send-email-otavio@debian.org>
	<1240449461-26116-2-git-send-email-otavio@debian.org>
	<1240449461-26116-3-git-send-email-otavio@debian.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/6] machine/geode[gl]x: use more optimization while compiling
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Apr 2009 01:22:48 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/machine/geodegx.conf             |    2 +-
 conf/machine/geodelx.conf             |   15 ++++++++-------
 conf/machine/include/tune-geodegx.inc |    3 +--
 conf/machine/include/tune-geodelx.inc |    6 +-----
 4 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/conf/machine/geodegx.conf b/conf/machine/geodegx.conf
index 6fe6a83..e468a5d 100644
--- a/conf/machine/geodegx.conf
+++ b/conf/machine/geodegx.conf
@@ -14,4 +14,4 @@ udevdir = "/dev"
 KERNEL_IMAGETYPE = "bzImage"
 
 GLIBC_ADDONS = "nptl"
-GLIBC_EXTRA_OECONF = "--with-tls"
+GLIBC_EXTRA_OECONF = "--with-tls --with-cpu=geode"
diff --git a/conf/machine/geodelx.conf b/conf/machine/geodelx.conf
index de4d9ca..80efb9c 100644
--- a/conf/machine/geodelx.conf
+++ b/conf/machine/geodelx.conf
@@ -1,14 +1,15 @@
-TARGET_ARCH = "i486"
+# Machine file for devices with the AMD Geode LX processor 
+# Copyright (C) 2005, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
 
-require conf/machine/include/tune-geodelx.inc
+TARGET_ARCH =  "i486"
 
-PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}depmod:module-init-tools-cross"
+require conf/machine/include/tune-geodelx.inc
 
-PREFERRED_PROVIDER_virtual/kernel="linux-geodelx"
-
-SELECTED_OPTIMIZATION_glibc := "${@'${SELECTED_OPTIMIZATION}'.replace('-fomit-frame-pointer', '')}"
+PREFERRED_PROVIDER_virtual/kernel = "linux-geodelx"
 
 KERNEL_IMAGETYPE = "bzImage"
 
 GLIBC_ADDONS = "nptl"
-GLIBC_EXTRA_OECONF = "--with-tls"
+GLIBC_EXTRA_OECONF = "--with-tls --with-cpu=geode"
+SELECTED_OPTIMIZATION_glibc := "${@'${SELECTED_OPTIMIZATION}'.replace('-fomit-frame-pointer', '')}"
diff --git a/conf/machine/include/tune-geodegx.inc b/conf/machine/include/tune-geodegx.inc
index cae285a..eda332a 100644
--- a/conf/machine/include/tune-geodegx.inc
+++ b/conf/machine/include/tune-geodegx.inc
@@ -1,6 +1,5 @@
-TARGET_CC_ARCH = "-march=geode"
+TARGET_CC_ARCH = "-march=geode -mtune=geode"
 BASE_PACKAGE_ARCH = "geode"
 PACKAGE_EXTRA_ARCHS += "x86 i386 geode"
 
 FEED_ARCH = "geode"
-
diff --git a/conf/machine/include/tune-geodelx.inc b/conf/machine/include/tune-geodelx.inc
index 63e6678..eda332a 100644
--- a/conf/machine/include/tune-geodelx.inc
+++ b/conf/machine/include/tune-geodelx.inc
@@ -1,9 +1,5 @@
-# Geode CPU has it's own target in GCC 4.3
-# in older versions k6-2 is closest
-#
-TARGET_CC_ARCH = "-march=geode"
+TARGET_CC_ARCH = "-march=geode -mtune=geode"
 BASE_PACKAGE_ARCH = "geode"
 PACKAGE_EXTRA_ARCHS += "x86 i386 geode"
 
 FEED_ARCH = "geode"
-
-- 
1.6.2.1.303.g63699



