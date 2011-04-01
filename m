Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5mSp-00037p-HX
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 00:05:07 +0200
Received: by iwn10 with SMTP id 10so4361066iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 15:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Ffb7aMBfbghtJNEDoFaXY/IUCH2SwS8lWOTWuy3GQGs=;
	b=knQQVYWr/cx4Pm0UJ6kWDNR9HdeReREzMGrwEXxQtF5ZSIst6jcK1JhLFhGVEzy7nL
	AwL/FNubfL/ZOMRrpofFYAhNnxwS1bijGJk/yAmOBo4IVsqqGLaAM0UknejPOLQ5bDWG
	l2Mz35dCzu5l+bxHmPu8DU7tG9+7vIRyZuGBo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=QrkNeMoVUx61MBEMsXI5lyw3CboiHrqKk+8R31OM3nuRtaJCZ2RDE3xTz0B2XN2g+d
	Oy1Hxf8jIj+FStpQXgZz4eob5ZqLwRUbRUAOVbvhYtcJdbhsEjijm/Ue3NfYo2B3XLsU
	pKfs8S8tWoL8RVRI3BXMFsdm012z20Y28pOb0=
Received: by 10.42.134.136 with SMTP id l8mr5453817ict.307.1301695385295;
	Fri, 01 Apr 2011 15:03:05 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id xi12sm1543487icb.18.2011.04.01.15.03.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Apr 2011 15:03:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2011 15:02:55 -0700
Message-Id: <0781931dc3d599af1e77937f75777ab01ad84447.1301695158.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301695158.git.raj.khem@gmail.com>
References: <cover.1301695158.git.raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/7] openssl-0.9.8m, binutils-2.20.1: Use linux-uclibceabi instead of uclibcgnueabi
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
X-List-Received-Date: Fri, 01 Apr 2011 22:05:07 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openssl/openssl-0.9.8m/configure-targets.patch |    4 ++--
 .../binutils-2.20.1/110-arm-eabi-conf.patch        |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/openssl/openssl-0.9.8m/configure-targets.patch b/meta-oe/recipes-connectivity/openssl/openssl-0.9.8m/configure-targets.patch
index b68123a..6fd2769 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl-0.9.8m/configure-targets.patch
+++ b/meta-oe/recipes-connectivity/openssl/openssl-0.9.8m/configure-targets.patch
@@ -14,8 +14,8 @@ Index: openssl-0.9.8g/Configure
 +"linux-elf-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-gnueabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-uclibcgnueabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-uclibcgnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +
 +"linux-avr32","$ENV{'CC'}:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).",
 +
diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/110-arm-eabi-conf.patch b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/110-arm-eabi-conf.patch
index 2623301..eace3e9 100644
--- a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/110-arm-eabi-conf.patch
+++ b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/110-arm-eabi-conf.patch
@@ -5,7 +5,7 @@
      libgloss_dir=arm
      ;;
 -  arm*-*-linux-gnueabi)
-+  arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
++  arm*-*-linux-gnueabi | arm*-*-linux-uclibceabi)
      noconfigdirs="$noconfigdirs target-qthreads"
      noconfigdirs="$noconfigdirs target-libobjc"
      case ${with_newlib} in
@@ -16,7 +16,7 @@
      libgloss_dir=arm
      ;;
 -  arm*-*-linux-gnueabi)
-+  arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
++  arm*-*-linux-gnueabi | arm*-*-linux-uclibceabi)
      noconfigdirs="$noconfigdirs target-qthreads"
      noconfigdirs="$noconfigdirs target-libobjc"
      case ${with_newlib} in
-- 
1.7.4.1



