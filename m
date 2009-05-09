Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2ard-0000U5-DB
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:29 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1075454ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=1eSj5Na494tFs5wjj3nmKIOaPSuveABM+nAlgZAEwwA=;
	b=FAeVa9DtpEUMxFsKI5E05SIl9J3mqLoxuBPSe8yk9FxJQn7gI/JLRDofKlLRo6AkAj
	vky5540SHcxBSeQ53TUTPNewcmVHBeFz4bZ0iVHNSs/kfoF54rgOjEJMVPT6z1ceJg3e
	aEGNz+Y7UPHMD/1eouypkJYBnPSy5gAPH9YoE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=XJc6Ye2QENrrgoH5KVjId1b9RK83avgd0m1zarzSDKRlpGT9z14c4QdJ4YhDEM7TVg
	iKTzMwpvYEj0Oung/OuegLfAjGutZ0J4cVk9phVXQ/gIh/M3IruGjDiYkkF2pkywKahF
	b7sXiB8KWgzY+hfQKA1Migg2KQ1NS60XFRokI=
Received: by 10.100.9.11 with SMTP id 11mr5174584ani.72.1241830213222;
	Fri, 08 May 2009 17:50:13 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm1653938ywc.1.2009.05.08.17.50.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:12 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id A29B6610194; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:18 -0300
Message-Id: <1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 02/23] machine/geode[gl]x: use more optimization while compiling
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
X-List-Received-Date: Sat, 09 May 2009 00:56:29 -0000

Since the code is now the same for Geode GX and Geode LX we also
merged the tunning files in a single tune-geode.inc, making it easy to
improve from now on.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/machine/geodegx.conf             |    4 ++--
 conf/machine/geodelx.conf             |   15 ++++++++-------
 conf/machine/include/tune-geode.inc   |    5 +++++
 conf/machine/include/tune-geodegx.inc |    6 ------
 conf/machine/include/tune-geodelx.inc |    9 ---------
 5 files changed, 15 insertions(+), 24 deletions(-)
 create mode 100644 conf/machine/include/tune-geode.inc
 delete mode 100644 conf/machine/include/tune-geodegx.inc
 delete mode 100644 conf/machine/include/tune-geodelx.inc

diff --git a/conf/machine/geodegx.conf b/conf/machine/geodegx.conf
index 6fe6a83..0ec6782 100644
--- a/conf/machine/geodegx.conf
+++ b/conf/machine/geodegx.conf
@@ -4,7 +4,7 @@
 
 TARGET_ARCH =  "i486"
 
-require conf/machine/include/tune-geodegx.inc
+require conf/machine/include/tune-geode.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-geodegx"
 BOOTSTRAP_EXTRA_RDEPENDS = "kernel pciutils udev kernel-modules"
@@ -14,4 +14,4 @@ udevdir = "/dev"
 KERNEL_IMAGETYPE = "bzImage"
 
 GLIBC_ADDONS = "nptl"
-GLIBC_EXTRA_OECONF = "--with-tls"
+GLIBC_EXTRA_OECONF = "--with-tls --with-cpu=geode"
diff --git a/conf/machine/geodelx.conf b/conf/machine/geodelx.conf
index de4d9ca..f8874fd 100644
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
+require conf/machine/include/tune-geode.inc
 
-PREFERRED_PROVIDER_virtual/kernel="linux-geodelx"
-
-SELECTED_OPTIMIZATION_glibc := "${@'${SELECTED_OPTIMIZATION}'.replace('-fomit-frame-pointer', '')}"
+PREFERRED_PROVIDER_virtual/kernel = "linux-geodelx"
 
 KERNEL_IMAGETYPE = "bzImage"
 
 GLIBC_ADDONS = "nptl"
-GLIBC_EXTRA_OECONF = "--with-tls"
+GLIBC_EXTRA_OECONF = "--with-tls --with-cpu=geode"
+SELECTED_OPTIMIZATION_pn-glibc := "${@'${SELECTED_OPTIMIZATION}'.replace('-fomit-frame-pointer', '')}"
diff --git a/conf/machine/include/tune-geode.inc b/conf/machine/include/tune-geode.inc
new file mode 100644
index 0000000..eda332a
--- /dev/null
+++ b/conf/machine/include/tune-geode.inc
@@ -0,0 +1,5 @@
+TARGET_CC_ARCH = "-march=geode -mtune=geode"
+BASE_PACKAGE_ARCH = "geode"
+PACKAGE_EXTRA_ARCHS += "x86 i386 geode"
+
+FEED_ARCH = "geode"
diff --git a/conf/machine/include/tune-geodegx.inc b/conf/machine/include/tune-geodegx.inc
deleted file mode 100644
index cae285a..0000000
--- a/conf/machine/include/tune-geodegx.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-TARGET_CC_ARCH = "-march=geode"
-BASE_PACKAGE_ARCH = "geode"
-PACKAGE_EXTRA_ARCHS += "x86 i386 geode"
-
-FEED_ARCH = "geode"
-
diff --git a/conf/machine/include/tune-geodelx.inc b/conf/machine/include/tune-geodelx.inc
deleted file mode 100644
index 63e6678..0000000
--- a/conf/machine/include/tune-geodelx.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-# Geode CPU has it's own target in GCC 4.3
-# in older versions k6-2 is closest
-#
-TARGET_CC_ARCH = "-march=geode"
-BASE_PACKAGE_ARCH = "geode"
-PACKAGE_EXTRA_ARCHS += "x86 i386 geode"
-
-FEED_ARCH = "geode"
-
-- 
1.6.3.rc1.51.gea0b7



