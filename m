Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ss5nE-0005hg-BZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jul 2012 07:30:24 +0200
Received: by ggnp4 with SMTP id p4so3370373ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 22:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=+F9dIoVZc6GTw6wm4VzVKE7iaIcgIZc6e3HN1wzspD0=;
	b=GX9RgWp+FyroW2rD++X2nZlGzvDQfZ15Eh8ejNRANUelcuCJxQcFZ6QVRMqD4ncTwl
	7grfi6XtKq/GE9ErKOqY2D6lHxW1gOuUlqp40fhsNv3hDQRUBF0N1layQQ8Mzx3Yy4Ny
	+Ikm8l00ejPad7yRSiS6XrxdN1mYKuv2nbD3qC0xoS60DM8MAQ6tUteHbVeTTRtlzAyV
	ajTksJa6idENSfTqPhcifCCmNSFJubWoytKW4KlwVsnLOGi9VGAC5jGr0gfvfY6FaN5g
	x/aqqJiHlYhBCy0vsSsMLVgFSUNMVyozxTY9fX4Q1vZgbgPgsXwlt4aZoHjLW0l6VRz5
	FkjQ==
Received: by 10.66.73.70 with SMTP id j6mr8893066pav.5.1342761540835;
	Thu, 19 Jul 2012 22:19:00 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ng8sm3217474pbc.13.2012.07.19.22.18.59
	(version=SSLv3 cipher=OTHER); Thu, 19 Jul 2012 22:18:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 22:18:54 -0700
Message-Id: <1342761538-19890-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-java][PATCH 1/5] openjdk-6-common: Pass LD_LIBRARY_PATH to app running under qemu
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
X-List-Received-Date: Fri, 20 Jul 2012 05:30:24 -0000

When target and build host are same eg. x86_64 and qemux86-64
then application uses the dynamic linker from OEs sysroot but
libc from the build host and they may have different versions
and end up in unpleasant results.

We therefore make sure that libc is also used from OEs sysroot

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-core/openjdk/openjdk-6-common.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
index d81543c..c1861b6 100644
--- a/recipes-core/openjdk/openjdk-6-common.inc
+++ b/recipes-core/openjdk/openjdk-6-common.inc
@@ -10,7 +10,7 @@ ICEDTEA = "NEEDS TO BE SET"
 S = "${WORKDIR}/${ICEDTEA}"
 B = "${S}/build"
 
-INC_PR = "r17"
+INC_PR = "r18"
 
 SRC_URI = "\
   ${ICEDTEA_URI} \
@@ -242,7 +242,7 @@ EXTRA_OEMAKE += 'OE_LAUNCHER_LDFLAGS="${OE_LAUNCHER_LDFLAGS}"'
 
 
 # Large stack is required at least on x86_64 host, otherwise random segfaults appear:
-QEMU = "${@qemu_target_binary(d)} ${QEMU_OPTIONS} -s 1048576 -L ${STAGING_DIR_TARGET}"
+QEMU = "${@qemu_target_binary(d)} ${QEMU_OPTIONS} -s 1048576 -L ${STAGING_DIR_TARGET} -E LD_LIBRARY_PATH=${STAGING_BASELIBDIR}"
 
 EXTRA_OEMAKE += 'QEMU="${QEMU}"'
 
-- 
1.7.9.5



