Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id DA0E7731CF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 08:31:32 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id s64so6906678lfs.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 01:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5HNfpGGZzklR8i28+sqZpcQg1WzKwT8sFzlBx968EV8=;
	b=I4oAhAazwwNRVFuArcPgQ+ci2PXECAHdIdVYZ0fdpZuBbwrSukTahvPe6HtGJWoIQ3
	m159/bZHmAi2VyhmtjaBBTWGrCiRcWdMj57lgoR8C30jfw6ABmBHT9qE21GHrVar71g4
	3IIIyfv/VkkmtqvWuzMcbkpSmTCFLgjVxGji3wRIiSeVj2Pas+rH2Ms0YSxsDmRgtjdW
	g85gej1NZQRwTpc/9lBzO2SEkuofitov6WyE1CYgzEE02A0xXEUmp32eLqWcT3sfm6XG
	WCUwkLMq49z6AhXFkZTEUM28KS6/0OoeNA/UvA254eCMynjh9O5i30nXGeUWBsdRkzFM
	mCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5HNfpGGZzklR8i28+sqZpcQg1WzKwT8sFzlBx968EV8=;
	b=Qtp8T8oTBp/eCqPY32rpqvWJc0EMzi/j3FnzhYKskd9hSne3//i2sEZRyVKEh9UZ2M
	L9k/Aq97GjH1oyxPtZjbLIg8Dxgtv4qKuvH1OmT326ERC+CHXz9c6qr9++lINHuN8f6c
	/eqjTEviyUCUfUknetJHptUeUhIQiBifDuSJ6srE4bfMTpw0/iEn4mxvn8rKCDXJt1Lu
	wegV/X5+dDPosvKJcZtYM7aMrJGLTUkYyqJF+pduhcuTCp/vYheeVmCr6nL9I9nxrixr
	7EIWUq57kR2xvb1K+MfSwwdOyWdToLzySRIE/xqhM6zW3JuG8NritnFA0lk7Dy3wLWS5
	Abmg==
X-Gm-Message-State: AE9vXwN5C3xyoe/kzlq6BEU8y2aa56CxAS8FwoxuWqNlsBxU8i5Yrmua4xq7KjB1PMpmKw==
X-Received: by 10.25.157.132 with SMTP id g126mr6820899lfe.53.1473755492696;
	Tue, 13 Sep 2016 01:31:32 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	s187sm3745352lfd.3.2016.09.13.01.31.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Sep 2016 01:31:31 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, patrick.ohly@intel.com,
	bkylerussell@gmail.com, daniel.mcgregor@vecima.com, maxin.john@intel.com
Date: Tue, 13 Sep 2016 10:31:28 +0200
Message-Id: <20160913083128.24725-2-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160913083128.24725-1-ricardo.ribalda@gmail.com>
References: <20160913083128.24725-1-ricardo.ribalda@gmail.com>
Subject: [meta-java][PATCH 2/2] icedtea7-native: Fix IOException constructor compile error
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
X-List-Received-Date: Tue, 13 Sep 2016 08:31:33 -0000

Under some circumstances, the bootstrap error fails with the following
error:

build-bootstrap-javac:
 [javac] Compiling 1 source file to
 build/openjdk.build-boot/langtools/build/bootstrap/classes
 [javac] 1. ERROR in /com/sun/tools/javac/file/ZipFileIndex.java
 [javac]     super(message, cause);
 [javac] The constructor IOException(String, Throwable) is undefined

The reason for that error is that rt.jar does not contain the openjdk
classes but the ones from classpath 0.99.

The error eventually goes away after a couple of hours :S.

After some tedious debug, I figured out that the problem was the
timestamp handling of zip/unzip.

The Makefile launches zip with the following options:

$(ZIP) -qur

which only updates the content of the classes that have a timestamp
older than the new ones.

According to zip manpage:
"""
Note that under many operating systems, the TZ (timezone) environment
variable must be set correctly in order for -f and -u to work properly
"""

On this patch, I remove the -u option from zip, always replacing the
classes inside rt.jar with the classes from openjdk. I cannot think of
an scenario where this may fail.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-core/icedtea/icedtea7-native.inc                 |  1 +
 recipes-core/icedtea/openjdk-7-03b147/timezoneszip.patch | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/timezoneszip.patch

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 4314fb51b259..727998c94e6c 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -41,6 +41,7 @@ SRC_URI = " \
   ${OPENJDK_PATCHES} \
   file://allow-headless-build.patch;striplevel=0 \
   file://jaxws_fix_NullPointerException.patch;apply=no \
+  file://timezoneszip.patch \
   "
 
 S = "${WORKDIR}/${ICEDTEA}"
diff --git a/recipes-core/icedtea/openjdk-7-03b147/timezoneszip.patch b/recipes-core/icedtea/openjdk-7-03b147/timezoneszip.patch
new file mode 100644
index 000000000000..befb7c79b9f9
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/timezoneszip.patch
@@ -0,0 +1,13 @@
+diff --git a/Makefile.am b/Makefile.am
+index 5eaff4c40aac..a4f0f63f3e43 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2294,7 +2294,7 @@ if LACKS_SUN_AWT_TOOLKIT
+ 	   mkdir -p `dirname $$destpath` ; \
+ 	   cp -a ../../$$dirs $$destpath ; \
+ 	 done ; \
+-	 $(ZIP) -qur $(STAGE1_BOOT_DIR)/jre/lib/rt.jar \
++	 $(ZIP) -qr $(STAGE1_BOOT_DIR)/jre/lib/rt.jar \
+ 	 com java javax sun );
+ endif
+ 	mkdir -p stamps
-- 
2.9.3


