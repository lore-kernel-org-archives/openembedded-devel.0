Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8A4F173212
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 14:26:51 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id x67so3570456qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 07:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GTbvFbLFzhqNkrwTMQoUrMBOX3kVgZCAKPYTWOjl+/I=;
	b=gCBHISGs1PhEluhthbJ7kYiHISxI1SIQc6vBUPCX+BiVcWfIOZ+SNDhJ9OErljaJnR
	lpIADULFXBR2lHkAksftMZyXox+xakp/GxalXMa5eErnSr944k9dAUFNkVZ1+BMeq5Tq
	N+gaW7+T0m/VJ2ZPwEDrhV6IvMxzAVBI1BbtWaqyMGYUN+wZylikFEq0bOfqa+ZV35eo
	q3R5AKZxLxT+Ie9LNzbZ/oReL10arO25mzk4uZcJhSaHmC1DtKaN5P5LD7lzQR/PWkHr
	YWHyg1rP7RyiWMlM5VAx3SDi0fHN5LsQT4OaKLOZRmziCYEictxKouHasRapISbJpgWk
	Ykyw==
X-Gm-Message-State: AEkoous3N5yMFuh/WuSWTyenbQ10/ONQt+sTScYSC4BVo9re/lNYA8A1G89iR+I7/R8Cew==
X-Received: by 10.55.56.129 with SMTP id f123mr4858725qka.30.1470839212432;
	Wed, 10 Aug 2016 07:26:52 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	n128sm23349388qkc.36.2016.08.10.07.26.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Aug 2016 07:26:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Aug 2016 10:26:41 -0400
Message-Id: <1470839201-14645-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] espeak: fix package for gcc6
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
X-List-Received-Date: Wed, 10 Aug 2016 14:26:53 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/espeak/espeak.inc             |  3 ++-
 meta-oe/recipes-support/espeak/espeak_1.37.bb         |  3 ---
 .../espeak/files/fix-gcc6-errors.patch                | 19 +++++++++++++++++++
 3 files changed, 21 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/espeak/files/fix-gcc6-errors.patch

diff --git a/meta-oe/recipes-support/espeak/espeak.inc b/meta-oe/recipes-support/espeak/espeak.inc
index 98a1765..5d0b403 100644
--- a/meta-oe/recipes-support/espeak/espeak.inc
+++ b/meta-oe/recipes-support/espeak/espeak.inc
@@ -3,7 +3,8 @@ SECTION = "base"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://License.txt;md5=cb7a20edb4c9f5f478de6523dcd7362c"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/espeak/espeak-${PV}-source.zip"
+SRC_URI = "${SOURCEFORGE_MIRROR}/espeak/espeak-${PV}-source.zip \
+           file://fix-gcc6-errors.patch"
 
 S = "${WORKDIR}/espeak-${PV}-source"
 
diff --git a/meta-oe/recipes-support/espeak/espeak_1.37.bb b/meta-oe/recipes-support/espeak/espeak_1.37.bb
index 2cf5ff2..273fe34 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.37.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.37.bb
@@ -42,6 +42,3 @@ do_install() {
     cp -prf ${S}/espeak-data/* ${D}${datadir}/espeak-data
     chown -R root:root ${D}${datadir}/espeak-data
 }
-
-# http://errors.yoctoproject.org/Errors/Details/68663/
-PNBLACKLIST[espeak] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-oe/recipes-support/espeak/files/fix-gcc6-errors.patch b/meta-oe/recipes-support/espeak/files/fix-gcc6-errors.patch
new file mode 100644
index 0000000..9cf23cf
--- /dev/null
+++ b/meta-oe/recipes-support/espeak/files/fix-gcc6-errors.patch
@@ -0,0 +1,19 @@
+Fix gcc6 errors with narrowing
+
+| tr_languages.cpp:462:73: error: narrowing conversion of '171' from 'int' to 'char' inside { } [-Wnarrowing]
+|     static const char ko_voiced[] = {0x02,0x05,0x06,0xab,0xaf,0xb7,0xbc,0};  // voiced consonants, l,m,n,N
+
+Upstream-Status: Backport
+
+Signed-off-by: Derek Straka <derek@asterius.io>
+--- a/src/tr_languages.cpp
++++ b/src/tr_languages.cpp
+@@ -459,7 +459,7 @@
+ 	case L('k','o'):   // Korean, TEST
+ 		{
+ 			static const char ko_ivowels[] = {0x63,0x64,0x67,0x68,0x6d,0x72,0x74,0x75,0};  // y and i vowels
+-			static const char ko_voiced[] = {0x02,0x05,0x06,0xab,0xaf,0xb7,0xbc,0};  // voiced consonants, l,m,n,N
++			static const char ko_voiced[] = {0x02,0x05,0x06,(char)0xab,(char)0xaf,(char)0xb7,(char)0xbc,0};  // voiced consonants, l,m,n,N
+ 			tr = new Translator();
+ 
+ 			tr->letter_bits_offset = OFFSET_KOREAN;
-- 
1.9.1


