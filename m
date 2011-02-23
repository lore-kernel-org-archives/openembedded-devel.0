Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PsAJE-0000eR-2O
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 09:42:56 +0100
Received: by fxm8 with SMTP id 8so3362243fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 00:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=NAl6lvX9ptOeVAVWej1wGcL3jb78pA4H5YL2b9PHjt4=;
	b=vtowdFnrCW0srSTgPufqNTs87Sp62Lh54GFh3TFTX8jfbSczLq1V+Dw6MWudaOkKpx
	abJhGyB5MdwhwOgkwowHDIeoEIbOTEan93JV0H4Isc5FAiu/V1TKZOulUiZl4OmcxIqG
	B0rozlXfQDOYw7D7cg3hf3ANMqYVwKQnjRIIk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=U5vrJCn2aEULqnNhDCZ+PZXfhGgMv1zJPLWkOOsOmK6iBPQjohL8t0aejODDWS4jHu
	aD/XQkgptAQHHDlhMNa5CY+4SBDM8tidZ3znl/kB57UQ+VaJz2axFsUPf8m+vID1B7mc
	kuUtHYQ9hwXv+3r41tRKM8OEteZEakQXDAuYU=
Received: by 10.223.72.15 with SMTP id k15mr4755160faj.54.1298450428262;
	Wed, 23 Feb 2011 00:40:28 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n2sm1059042fam.28.2011.02.23.00.40.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 00:40:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 09:40:17 +0100
Message-Id: <1298450417-28211-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] linux-2.6.37: upgrade to 2.6.37.1
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
X-List-Received-Date: Wed, 23 Feb 2011 08:42:56 -0000

* update om-gta0* defconfigs like
  8e4bd2fd4cbf1c75acd30adbd3aaa074c3175a3e and
  1516588acd3c4b4dd4add71d06ab8ce0d1bafa02

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/linux/linux-2.6.37/om-gta01/defconfig |    9 ++++-----
 recipes/linux/linux-2.6.37/om-gta02/defconfig |    9 ++++-----
 recipes/linux/linux_2.6.37.bb                 |    5 ++++-
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/recipes/linux/linux-2.6.37/om-gta01/defconfig b/recipes/linux/linux-2.6.37/om-gta01/defconfig
index 22427bb..4f8e4e5 100644
--- a/recipes/linux/linux-2.6.37/om-gta01/defconfig
+++ b/recipes/linux/linux-2.6.37/om-gta01/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Linux/arm 2.6.37 Kernel Configuration
-# Mon Jan 10 16:05:41 2011
+# Linux/arm 2.6.37.1 Kernel Configuration
+# Tue Feb 22 11:01:17 2011
 #
 CONFIG_ARM=y
 CONFIG_HAVE_PWM=y
@@ -1217,7 +1217,7 @@ CONFIG_HW_CONSOLE=y
 CONFIG_VT_HW_CONSOLE_BINDING=y
 # CONFIG_DEVKMEM is not set
 # CONFIG_SERIAL_NONSTANDARD is not set
-# CONFIG_N_GSM is not set
+CONFIG_N_GSM=m
 
 #
 # Serial drivers
@@ -2189,7 +2189,6 @@ CONFIG_BKL=y
 # CONFIG_SPARSE_RCU_POINTER is not set
 CONFIG_DEBUG_BUGVERBOSE=y
 # CONFIG_DEBUG_MEMORY_INIT is not set
-CONFIG_FRAME_POINTER=y
 # CONFIG_SYSCTL_SYSCALL_CHECK is not set
 CONFIG_HAVE_FUNCTION_TRACER=y
 CONFIG_HAVE_DYNAMIC_FTRACE=y
@@ -2200,7 +2199,7 @@ CONFIG_TRACING_SUPPORT=y
 # CONFIG_SAMPLES is not set
 CONFIG_HAVE_ARCH_KGDB=y
 # CONFIG_STRICT_DEVMEM is not set
-# CONFIG_ARM_UNWIND is not set
+CONFIG_ARM_UNWIND=y
 # CONFIG_DEBUG_USER is not set
 # CONFIG_OC_ETM is not set
 CONFIG_DEBUG_S3C_UART=2
diff --git a/recipes/linux/linux-2.6.37/om-gta02/defconfig b/recipes/linux/linux-2.6.37/om-gta02/defconfig
index 89f7081..a0541cc 100644
--- a/recipes/linux/linux-2.6.37/om-gta02/defconfig
+++ b/recipes/linux/linux-2.6.37/om-gta02/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Linux/arm 2.6.37 Kernel Configuration
-# Mon Jan 10 16:08:20 2011
+# Linux/arm 2.6.37.1 Kernel Configuration
+# Tue Feb 22 10:58:18 2011
 #
 CONFIG_ARM=y
 CONFIG_HAVE_PWM=y
@@ -1225,7 +1225,7 @@ CONFIG_HW_CONSOLE=y
 CONFIG_VT_HW_CONSOLE_BINDING=y
 # CONFIG_DEVKMEM is not set
 # CONFIG_SERIAL_NONSTANDARD is not set
-# CONFIG_N_GSM is not set
+CONFIG_N_GSM=m
 
 #
 # Serial drivers
@@ -2205,7 +2205,6 @@ CONFIG_BKL=y
 # CONFIG_SPARSE_RCU_POINTER is not set
 CONFIG_DEBUG_BUGVERBOSE=y
 # CONFIG_DEBUG_MEMORY_INIT is not set
-CONFIG_FRAME_POINTER=y
 # CONFIG_SYSCTL_SYSCALL_CHECK is not set
 CONFIG_HAVE_FUNCTION_TRACER=y
 CONFIG_HAVE_DYNAMIC_FTRACE=y
@@ -2216,7 +2215,7 @@ CONFIG_TRACING_SUPPORT=y
 # CONFIG_SAMPLES is not set
 CONFIG_HAVE_ARCH_KGDB=y
 # CONFIG_STRICT_DEVMEM is not set
-# CONFIG_ARM_UNWIND is not set
+CONFIG_ARM_UNWIND=y
 # CONFIG_DEBUG_USER is not set
 # CONFIG_OC_ETM is not set
 CONFIG_DEBUG_S3C_UART=2
diff --git a/recipes/linux/linux_2.6.37.bb b/recipes/linux/linux_2.6.37.bb
index 39c0c08..e11af81 100644
--- a/recipes/linux/linux_2.6.37.bb
+++ b/recipes/linux/linux_2.6.37.bb
@@ -1,6 +1,6 @@
 require linux.inc
 
-PR = "r2"
+PR = "r3"
 
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
@@ -20,6 +20,7 @@ DEFAULT_PREFERENCE_visstrim_m10 = "1"
 # DEFAULT_PREFERENCE_om-gta01 = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
+           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.1.bz2;apply=yes;name=stablepatch \
            file://defconfig "
 
 SRC_URI_append_om-gta02 = " \
@@ -33,3 +34,5 @@ SRC_URI_append_om-gta01 = " \
 
 SRC_URI[kernel.md5sum] = "c8ee37b4fdccdb651e0603d35350b434"
 SRC_URI[kernel.sha256sum] = "edbf091805414739cf57a3bbfeba9e87f5e74f97e38f04d12060e9e0c71e383a"
+SRC_URI[stablepatch.md5sum] = "7693d1d32ed39346cc988e0f027e5890"
+SRC_URI[stablepatch.sha256sum] = "c33bfa59828a9ff6916993ec008967a8c1d71a18b743ee15f4280e773ef4baaf"
-- 
1.7.4.1



