Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MjaS9-0003NK-7j
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 17:11:53 +0200
Received: by fg-out-1718.google.com with SMTP id d23so1012572fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2009 07:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=rzJBaPn58rSrWyVjyCToa4aIaQiR3JMwMG33QAudJ2g=;
	b=ey4eSZTgzHBTqEAbNdjmh1W7XUPK8jVGE3g1d3TDndt+QJolGdhDI9BgxPPw30MArr
	jyLCHmQss7WMm7c8AKnoijvqnApG6HbWjCBfaA8P9Belioa6U2m5vwO4+xoXfHchvFGm
	qNC2Uvsri6y28Lfatrn2orN/NiUrjXk9k1NsA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=HwvytMpthlF75CKSpigizye582BadwF11VvMqmnyrOAksbj0w72C4z7SC8Tjf8qgwh
	8FjDMJTp5I2CKffYsrXkaKnXogmY4gQiDQ0XmQig4SWZIJNIzdt4rDIsMQmAmV1CXH5f
	fXSiG1odHbNcjrXRhnisXt9CK92RZKueBuVgI=
Received: by 10.86.243.15 with SMTP id q15mr5048747fgh.21.1252075975978;
	Fri, 04 Sep 2009 07:52:55 -0700 (PDT)
Received: from localhost (adsl-71-146-28-171.dsl.pltn13.sbcglobal.net
	[71.146.28.171])
	by mx.google.com with ESMTPS id 4sm2348318fgg.6.2009.09.04.07.52.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Sep 2009 07:52:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Sep 2009 07:52:48 -0700
Message-Id: <1252075968-14536-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] angstrom: Use linux-uclibceabi instead of linux-uclibcgnueabi
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
X-List-Received-Date: Fri, 04 Sep 2009 15:11:53 -0000

* For uclibc based ARM EABI systems switch to using linux-uclibceabi
  as TARGET_OS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/angstrom-2007-for-openmoko.inc |    4 ++--
 conf/distro/include/angstrom-uclibc.inc            |    2 +-
 conf/distro/include/angstrom-uclinux-uclibc.inc    |    2 +-
 .../include/sane-toolchain-uclinux-uclibc.inc      |    2 --
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/conf/distro/include/angstrom-2007-for-openmoko.inc b/conf/distro/include/angstrom-2007-for-openmoko.inc
index 1deb85d..6741bae 100644
--- a/conf/distro/include/angstrom-2007-for-openmoko.inc
+++ b/conf/distro/include/angstrom-2007-for-openmoko.inc
@@ -143,8 +143,8 @@ PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        = "glibc"
 PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc         = "glibc"
 PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc          = "glibc"
 
-PREFERRED_PROVIDER_virtual/arm-angstrom-linux-uclibcgnueabi-libc-for-gcc    = "uclibc-initial"
-PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-uclibcgnueabi-libc-for-gcc  = "uclibc-initial"
+PREFERRED_PROVIDER_virtual/arm-angstrom-linux-uclibceabi-libc-for-gcc    = "uclibc-initial"
+PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-uclibceabi-libc-for-gcc  = "uclibc-initial"
 
 # hostap stuff, we prefer the in-kernel modules, but those don't work for all machines
 PREFERRED_PROVIDER_hostap-conf                      ?= "hostap-conf"
diff --git a/conf/distro/include/angstrom-uclibc.inc b/conf/distro/include/angstrom-uclibc.inc
index a60952f..004d904 100644
--- a/conf/distro/include/angstrom-uclibc.inc
+++ b/conf/distro/include/angstrom-uclibc.inc
@@ -9,7 +9,7 @@ USE_NLS_glib-2.0 = "yes"
 USE_NLS_glib-2.0-native = "yes"
 USE_NLS_gcc-cross = "no"
 
-TARGET_OS_UC = "linux${@['-uclibc','-uclibcgnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
+TARGET_OS_UC = "linux${@['-uclibc','-uclibceabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
 TARGET_OS = "${@['${TARGET_OS_UC}', 'uclinux-uclibc'][bb.data.getVar('TARGET_ARCH',d)  in ['bfin']]}"
 
 #mess with compiler flags to use -Os instead of -O2
diff --git a/conf/distro/include/angstrom-uclinux-uclibc.inc b/conf/distro/include/angstrom-uclinux-uclibc.inc
index 019f814..ad499f7 100644
--- a/conf/distro/include/angstrom-uclinux-uclibc.inc
+++ b/conf/distro/include/angstrom-uclinux-uclibc.inc
@@ -6,7 +6,7 @@ USE_NLS_glib-2.0 = "yes"
 USE_NLS_glib-2.0-native = "yes"
 USE_NLS_gcc-cross = "no"
 
-TARGET_OS_UC = "uclinux${@['-uclibc','-uclibcgnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
+TARGET_OS_UC = "uclinux${@['-uclibc','-uclibceabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
 
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
diff --git a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
index b757efb..fbb239a 100644
--- a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
+++ b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
@@ -7,8 +7,6 @@ USE_NLS_glib-2.0 = "yes"
 USE_NLS_glib-2.0-native = "yes"
 USE_NLS_gcc-cross = "no"
 
-TARGET_OS_UC = "uclinux${@['-uclibc','-uclibcgnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
-
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os"
-- 
1.6.3.3



