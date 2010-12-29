Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PXt2X-0002fR-74
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 11:14:10 +0100
Received: (qmail 7553 invoked by uid 503); 29 Dec 2010 09:46:00 -0000
Received: from b6.ovh.net (HELO mail436.ha.ovh.net) (213.186.33.56)
	by 30.mail-out.ovh.net with SMTP; 29 Dec 2010 09:46:00 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Dec 2010 12:12:58 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 29 Dec 2010 12:12:57 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Dec 2010 11:08:08 +0100
Message-Id: <1293617288-20930-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 696087619169070409
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Cc: Mike Westerhof <mwester@dls.net>
Subject: [PATCH] busybox: update 1.18.0 to 1.18.1
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
X-List-Received-Date: Wed, 29 Dec 2010 10:14:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* 1.18.1 is considered as the latest stable version
* add the lastest fixes from http://busybox.net/downloads/fixes-1.18.1/
* default 1.18.1 for SlugOS

Signed-off-by: Eric Bénard <eric@eukrea.com>
Acked-by: Khem Raj <raj.khem@gmail.com>
Cc: Mike Westerhof <mwester@dls.net>
---
 conf/distro/include/preferred-slugos-versions.inc  |    2 +-
 recipes/busybox/busybox-1.18.0/B921600.patch       |   13 -
 .../busybox-1.18.0/busybox-1.18.0-buildsys.patch   |   21 -
 .../busybox-1.18.0/busybox-1.18.0-runsvdir.patch   |   17 -
 .../busybox-1.18.0/busybox-1.18.0-sha.patch        |  118 ---
 recipes/busybox/busybox-1.18.0/defconfig           |  873 -----------------
 recipes/busybox/busybox-1.18.0/fdisk_nios2.patch   |   13 -
 .../busybox/busybox-1.18.0/get_header_tar.patch    |   13 -
 recipes/busybox/busybox-1.18.0/slugos/defconfig    |  986 --------------------
 .../busybox-1.18.0/udhcpc-fix-nfsroot.patch        |   47 -
 recipes/busybox/busybox-1.18.0/udhcpscript.patch   |   13 -
 recipes/busybox/busybox-1.18.1/B921600.patch       |   13 +
 .../busybox-1.18.1/busybox-1.18.1-cpio.patch       |   20 +
 .../busybox-1.18.1/busybox-1.18.1-hush.patch       |  241 +++++
 recipes/busybox/busybox-1.18.1/defconfig           |  873 +++++++++++++++++
 recipes/busybox/busybox-1.18.1/fdisk_nios2.patch   |   13 +
 .../busybox/busybox-1.18.1/get_header_tar.patch    |   13 +
 recipes/busybox/busybox-1.18.1/slugos/defconfig    |  986 ++++++++++++++++++++
 .../busybox-1.18.1/udhcpc-fix-nfsroot.patch        |   47 +
 recipes/busybox/busybox-1.18.1/udhcpscript.patch   |   13 +
 recipes/busybox/busybox_1.18.0.bb                  |   14 -
 recipes/busybox/busybox_1.18.1.bb                  |   13 +
 22 files changed, 2233 insertions(+), 2129 deletions(-)
 delete mode 100644 recipes/busybox/busybox-1.18.0/B921600.patch
 delete mode 100644 recipes/busybox/busybox-1.18.0/busybox-1.18.0-buildsys.patch
 delete mode 100644 recipes/busybox/busybox-1.18.0/busybox-1.18.0-runsvdir.patch
 delete mode 100644 recipes/busybox/busybox-1.18.0/busybox-1.18.0-sha.patch
 delete mode 100644 recipes/busybox/busybox-1.18.0/defconfig
 delete mode 100644 recipes/busybox/busybox-1.18.0/fdisk_nios2.patch
 delete mode 100644 recipes/busybox/busybox-1.18.0/get_header_tar.patch
 delete mode 100644 recipes/busybox/busybox-1.18.0/slugos/defconfig
 delete mode 100644 recipes/busybox/busybox-1.18.0/udhcpc-fix-nfsroot.patch
 delete mode 100644 recipes/busybox/busybox-1.18.0/udhcpscript.patch
 create mode 100644 recipes/busybox/busybox-1.18.1/B921600.patch
 create mode 100644 recipes/busybox/busybox-1.18.1/busybox-1.18.1-cpio.patch
 create mode 100644 recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
 create mode 100644 recipes/busybox/busybox-1.18.1/defconfig
 create mode 100644 recipes/busybox/busybox-1.18.1/fdisk_nios2.patch
 create mode 100644 recipes/busybox/busybox-1.18.1/get_header_tar.patch
 create mode 100644 recipes/busybox/busybox-1.18.1/slugos/defconfig
 create mode 100644 recipes/busybox/busybox-1.18.1/udhcpc-fix-nfsroot.patch
 create mode 100644 recipes/busybox/busybox-1.18.1/udhcpscript.patch
 delete mode 100644 recipes/busybox/busybox_1.18.0.bb
 create mode 100644 recipes/busybox/busybox_1.18.1.bb

diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
index 4a670ea..6ae4432 100644
--- a/conf/distro/include/preferred-slugos-versions.inc
+++ b/conf/distro/include/preferred-slugos-versions.inc
@@ -29,7 +29,7 @@ PREFERRED_VERSION_automake-native		?= "1.11.1"
 PREFERRED_VERSION_binutils			?= "2.20.1"
 PREFERRED_VERSION_binutils-cross		?= "2.20.1"
 PREFERRED_VERSION_binutils-cross-sdk		?= "2.20.1"
-PREFERRED_VERSION_busybox			?= "1.18.0"
+PREFERRED_VERSION_busybox			?= "1.18.1"
 PREFERRED_VERSION_dbus				?= "1.2.3"
 PREFERRED_VERSION_eglibc			?= "2.11"
 PREFERRED_VERSION_eglibc-initial		?= "2.11"
diff --git a/recipes/busybox/busybox-1.18.0/B921600.patch b/recipes/busybox/busybox-1.18.0/B921600.patch
deleted file mode 100644
index 61cc32b..0000000
--- a/recipes/busybox/busybox-1.18.0/B921600.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -upNr busybox-1.7.2/libbb/speed_table.c busybox-1.7.2-921600/libbb/speed_table.c
---- busybox-1.7.2/libbb/speed_table.c	2007-09-03 13:48:41.000000000 +0200
-+++ busybox-1.7.2-921600/libbb/speed_table.c	2008-10-09 16:23:26.269592899 +0200
-@@ -52,6 +52,9 @@ static const struct speed_map speeds[] =
- #ifdef B460800
- 	{B460800, 460800/256 + 0x8000U},
- #endif
-+#ifdef B921600
-+	{B921600, 921600/256 + 0x8000U},
-+#endif
- };
- 
- enum { NUM_SPEEDS = ARRAY_SIZE(speeds) };
diff --git a/recipes/busybox/busybox-1.18.0/busybox-1.18.0-buildsys.patch b/recipes/busybox/busybox-1.18.0/busybox-1.18.0-buildsys.patch
deleted file mode 100644
index c72e4d3..0000000
--- a/recipes/busybox/busybox-1.18.0/busybox-1.18.0-buildsys.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -urpN busybox-1.18.0/scripts/gen_build_files.sh busybox-1.18.0-buildsys/scripts/gen_build_files.sh
---- busybox-1.18.0/scripts/gen_build_files.sh	2010-11-22 21:43:22.000000000 +0100
-+++ busybox-1.18.0-buildsys/scripts/gen_build_files.sh	2010-11-24 14:59:47.732712663 +0100
-@@ -18,14 +18,14 @@ generate()
- 	local src="$1" dst="$2" header="$3" insert="$4"
- 	#chk "${dst}"
- 	(
--		echo "${header}"
-+		printf "%s\n" "${header}"
- 		if grep -qs '^INSERT$' "${src}"; then
- 			sed -n '1,/^INSERT$/p' "${src}"
--			echo "${insert}"
-+			printf "%s\n" "${insert}"
- 			sed -n '/^INSERT$/,$p' "${src}"
- 		else
- 			if [ -n "${insert}" ]; then
--				echo "ERROR: INSERT line missing in: ${src}" 1>&2
-+				printf "%s\n" "ERROR: INSERT line missing in: ${src}" 1>&2
- 			fi
- 			cat "${src}"
- 		fi
diff --git a/recipes/busybox/busybox-1.18.0/busybox-1.18.0-runsvdir.patch b/recipes/busybox/busybox-1.18.0/busybox-1.18.0-runsvdir.patch
deleted file mode 100644
index 41ad570..0000000
--- a/recipes/busybox/busybox-1.18.0/busybox-1.18.0-runsvdir.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-diff -urpN busybox-1.18.0/runit/runsvdir.c busybox-1.18.0-runsvdir/runit/runsvdir.c
---- busybox-1.18.0/runit/runsvdir.c	2010-11-22 21:43:22.000000000 +0100
-+++ busybox-1.18.0-runsvdir/runit/runsvdir.c	2010-12-06 01:27:56.926036992 +0100
-@@ -312,8 +312,11 @@ int runsvdir_main(int argc UNUSED_PARAM,
- 						last_mtime = s.st_mtime;
- 						last_dev = s.st_dev;
- 						last_ino = s.st_ino;
--						//if (now <= mtime)
--						//	sleep(1);
-+						/* if the svdir changed this very second, wait until the
-+						 * next second, because we won't be able to detect more
-+						 * changes within this second */
-+						while (time(NULL) == last_mtime)
-+							usleep(100000);
- 						need_rescan = do_rescan();
- 						while (fchdir(curdir) == -1) {
- 							warn2_cannot("change directory, pausing", "");
diff --git a/recipes/busybox/busybox-1.18.0/busybox-1.18.0-sha.patch b/recipes/busybox/busybox-1.18.0/busybox-1.18.0-sha.patch
deleted file mode 100644
index 3ad66fd..0000000
--- a/recipes/busybox/busybox-1.18.0/busybox-1.18.0-sha.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-diff -urpN busybox-1.18.0/libbb/pw_encrypt_sha.c busybox-1.18.0-sha/libbb/pw_encrypt_sha.c
---- busybox-1.18.0/libbb/pw_encrypt_sha.c	2010-11-22 21:43:22.000000000 +0100
-+++ busybox-1.18.0-sha/libbb/pw_encrypt_sha.c	2010-12-01 13:56:24.372704380 +0100
-@@ -3,7 +3,7 @@
-  */
- 
- /* Prefix for optional rounds specification.  */
--static const char str_rounds[] = "rounds=%u$";
-+static const char str_rounds[] ALIGN1 = "rounds=%u$";
- 
- /* Maximum salt string length.  */
- #define SALT_LEN_MAX 16
-@@ -19,8 +19,8 @@ NOINLINE
- sha_crypt(/*const*/ char *key_data, /*const*/ char *salt_data)
- {
- 	void (*sha_begin)(void *ctx) FAST_FUNC;
--	void (*sha_hash)(const void *buffer, size_t len, void *ctx) FAST_FUNC;
--	void (*sha_end)(void *resbuf, void *ctx) FAST_FUNC;
-+	void (*sha_hash)(void *ctx, const void *buffer, size_t len) FAST_FUNC;
-+	void (*sha_end)(void *ctx, void *resbuf) FAST_FUNC;
- 	int _32or64;
- 
- 	char *result, *resptr;
-@@ -103,40 +103,40 @@ sha_crypt(/*const*/ char *key_data, /*co
- 
- 	/* Add KEY, SALT.  */
- 	sha_begin(&ctx);
--	sha_hash(key_data, key_len, &ctx);
--	sha_hash(salt_data, salt_len, &ctx);
-+	sha_hash(&ctx, key_data, key_len);
-+	sha_hash(&ctx, salt_data, salt_len);
- 
- 	/* Compute alternate SHA sum with input KEY, SALT, and KEY.
- 	   The final result will be added to the first context.  */
- 	sha_begin(&alt_ctx);
--	sha_hash(key_data, key_len, &alt_ctx);
--	sha_hash(salt_data, salt_len, &alt_ctx);
--	sha_hash(key_data, key_len, &alt_ctx);
--	sha_end(alt_result, &alt_ctx);
-+	sha_hash(&alt_ctx, key_data, key_len);
-+	sha_hash(&alt_ctx, salt_data, salt_len);
-+	sha_hash(&alt_ctx, key_data, key_len);
-+	sha_end(&alt_ctx, alt_result);
- 
- 	/* Add result of this to the other context.  */
- 	/* Add for any character in the key one byte of the alternate sum.  */
- 	for (cnt = key_len; cnt > _32or64; cnt -= _32or64)
--		sha_hash(alt_result, _32or64, &ctx);
--	sha_hash(alt_result, cnt, &ctx);
-+		sha_hash(&ctx, alt_result, _32or64);
-+	sha_hash(&ctx, alt_result, cnt);
- 
- 	/* Take the binary representation of the length of the key and for every
- 	   1 add the alternate sum, for every 0 the key.  */
- 	for (cnt = key_len; cnt != 0; cnt >>= 1)
- 		if ((cnt & 1) != 0)
--			sha_hash(alt_result, _32or64, &ctx);
-+			sha_hash(&ctx, alt_result, _32or64);
- 		else
--			sha_hash(key_data, key_len, &ctx);
-+			sha_hash(&ctx, key_data, key_len);
- 
- 	/* Create intermediate result.  */
--	sha_end(alt_result, &ctx);
-+	sha_end(&ctx, alt_result);
- 
- 	/* Start computation of P byte sequence.  */
- 	/* For every character in the password add the entire password.  */
- 	sha_begin(&alt_ctx);
- 	for (cnt = 0; cnt < key_len; ++cnt)
--		sha_hash(key_data, key_len, &alt_ctx);
--	sha_end(temp_result, &alt_ctx);
-+		sha_hash(&alt_ctx, key_data, key_len);
-+	sha_end(&alt_ctx, temp_result);
- 
- 	/* NB: past this point, raw key_data is not used anymore */
- 
-@@ -153,8 +153,8 @@ sha_crypt(/*const*/ char *key_data, /*co
- 	/* For every character in the password add the entire password.  */
- 	sha_begin(&alt_ctx);
- 	for (cnt = 0; cnt < 16 + alt_result[0]; ++cnt)
--		sha_hash(salt_data, salt_len, &alt_ctx);
--	sha_end(temp_result, &alt_ctx);
-+		sha_hash(&alt_ctx, salt_data, salt_len);
-+	sha_end(&alt_ctx, temp_result);
- 
- 	/* NB: past this point, raw salt_data is not used anymore */
- 
-@@ -174,22 +174,22 @@ sha_crypt(/*const*/ char *key_data, /*co
- 
- 		/* Add key or last result.  */
- 		if ((cnt & 1) != 0)
--			sha_hash(p_bytes, key_len, &ctx);
-+			sha_hash(&ctx, p_bytes, key_len);
- 		else
--			sha_hash(alt_result, _32or64, &ctx);
-+			sha_hash(&ctx, alt_result, _32or64);
- 		/* Add salt for numbers not divisible by 3.  */
- 		if (cnt % 3 != 0)
--			sha_hash(s_bytes, salt_len, &ctx);
-+			sha_hash(&ctx, s_bytes, salt_len);
- 		/* Add key for numbers not divisible by 7.  */
- 		if (cnt % 7 != 0)
--			sha_hash(p_bytes, key_len, &ctx);
-+			sha_hash(&ctx, p_bytes, key_len);
- 		/* Add key or last result.  */
- 		if ((cnt & 1) != 0)
--			sha_hash(alt_result, _32or64, &ctx);
-+			sha_hash(&ctx, alt_result, _32or64);
- 		else
--			sha_hash(p_bytes, key_len, &ctx);
-+			sha_hash(&ctx, p_bytes, key_len);
- 
--		sha_end(alt_result, &ctx);
-+		sha_end(&ctx, alt_result);
- 	}
- 
- 	/* Append encrypted password to result buffer */
diff --git a/recipes/busybox/busybox-1.18.0/defconfig b/recipes/busybox/busybox-1.18.0/defconfig
deleted file mode 100644
index 5a6870c..0000000
--- a/recipes/busybox/busybox-1.18.0/defconfig
+++ /dev/null
@@ -1,873 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Busybox version: 1.13.2
-# Sun Feb  8 17:22:39 2009
-#
-CONFIG_HAVE_DOT_CONFIG=y
-
-#
-# Busybox Settings
-#
-
-#
-# General Configuration
-#
-# CONFIG_DESKTOP is not set
-# CONFIG_EXTRA_COMPAT is not set
-CONFIG_FEATURE_ASSUME_UNICODE=y
-CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
-# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
-# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
-CONFIG_SHOW_USAGE=y
-CONFIG_FEATURE_VERBOSE_USAGE=y
-CONFIG_FEATURE_COMPRESS_USAGE=y
-# CONFIG_FEATURE_INSTALLER is not set
-CONFIG_LOCALE_SUPPORT=y
-CONFIG_GETOPT_LONG=y
-CONFIG_FEATURE_DEVPTS=y
-# CONFIG_FEATURE_CLEAN_UP is not set
-CONFIG_FEATURE_PIDFILE=y
-CONFIG_FEATURE_SUID=y
-CONFIG_FEATURE_SUID_CONFIG=y
-CONFIG_FEATURE_SUID_CONFIG_QUIET=y
-# CONFIG_SELINUX is not set
-# CONFIG_FEATURE_PREFER_APPLETS is not set
-CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
-CONFIG_FEATURE_SYSLOG=y
-CONFIG_FEATURE_HAVE_RPC=y
-
-#
-# Build Options
-#
-# CONFIG_STATIC is not set
-# CONFIG_PIE is not set
-# CONFIG_NOMMU is not set
-# CONFIG_BUILD_LIBBUSYBOX is not set
-# CONFIG_FEATURE_INDIVIDUAL is not set
-# CONFIG_FEATURE_SHARED_BUSYBOX is not set
-CONFIG_LFS=y
-CONFIG_CROSS_COMPILER_PREFIX=""
-
-#
-# Debugging Options
-#
-# CONFIG_DEBUG is not set
-# CONFIG_DEBUG_PESSIMIZE is not set
-# CONFIG_WERROR is not set
-CONFIG_NO_DEBUG_LIB=y
-# CONFIG_DMALLOC is not set
-# CONFIG_EFENCE is not set
-# CONFIG_INCLUDE_SUSv2 is not set
-
-#
-# Installation Options
-#
-# CONFIG_INSTALL_NO_USR is not set
-CONFIG_INSTALL_APPLET_SYMLINKS=y
-# CONFIG_INSTALL_APPLET_HARDLINKS is not set
-# CONFIG_INSTALL_APPLET_SCRIPT_WRAPPERS is not set
-# CONFIG_INSTALL_APPLET_DONT is not set
-# CONFIG_INSTALL_SH_APPLET_SYMLINK is not set
-# CONFIG_INSTALL_SH_APPLET_HARDLINK is not set
-# CONFIG_INSTALL_SH_APPLET_SCRIPT_WRAPPER is not set
-CONFIG_PREFIX="./_install"
-
-#
-# Busybox Library Tuning
-#
-CONFIG_PASSWORD_MINLEN=6
-CONFIG_MD5_SIZE_VS_SPEED=2
-CONFIG_FEATURE_FAST_TOP=y
-# CONFIG_FEATURE_ETC_NETWORKS is not set
-CONFIG_FEATURE_EDITING=y
-CONFIG_FEATURE_EDITING_MAX_LEN=1024
-# CONFIG_FEATURE_EDITING_VI is not set
-CONFIG_FEATURE_EDITING_HISTORY=64
-CONFIG_FEATURE_EDITING_SAVEHISTORY=y
-CONFIG_FEATURE_TAB_COMPLETION=y
-CONFIG_FEATURE_USERNAME_COMPLETION=y
-CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
-CONFIG_FEATURE_VERBOSE_CP_MESSAGE=y
-CONFIG_FEATURE_COPYBUF_KB=4
-CONFIG_MONOTONIC_SYSCALL=y
-CONFIG_IOCTL_HEX2STR_ERROR=y
-CONFIG_FEATURE_HWIB=y
-
-#
-# Applets
-#
-
-#
-# Archival Utilities
-#
-# CONFIG_FEATURE_SEAMLESS_LZMA is not set
-CONFIG_FEATURE_SEAMLESS_BZ2=y
-CONFIG_FEATURE_SEAMLESS_GZ=y
-CONFIG_FEATURE_SEAMLESS_Z=y
-CONFIG_AR=y
-# CONFIG_FEATURE_AR_LONG_FILENAMES is not set
-CONFIG_BUNZIP2=y
-# CONFIG_BZIP2 is not set
-CONFIG_CPIO=y
-# CONFIG_FEATURE_CPIO_O is not set
-# CONFIG_DPKG is not set
-# CONFIG_DPKG_DEB is not set
-# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
-CONFIG_GUNZIP=y
-CONFIG_GZIP=y
-# CONFIG_RPM2CPIO is not set
-# CONFIG_RPM is not set
-CONFIG_TAR=y
-CONFIG_FEATURE_TAR_CREATE=y
-CONFIG_FEATURE_TAR_AUTODETECT=y
-CONFIG_FEATURE_TAR_FROM=y
-CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY=y
-# CONFIG_FEATURE_TAR_OLDSUN_COMPATIBILITY is not set
-CONFIG_FEATURE_TAR_GNU_EXTENSIONS=y
-CONFIG_FEATURE_TAR_LONG_OPTIONS=y
-CONFIG_FEATURE_TAR_UNAME_GNAME=y
-# CONFIG_UNCOMPRESS is not set
-# CONFIG_UNLZMA is not set
-# CONFIG_FEATURE_LZMA_FAST is not set
-CONFIG_UNZIP=y
-
-#
-# Coreutils
-#
-CONFIG_BASENAME=y
-# CONFIG_CAL is not set
-CONFIG_CAT=y
-# CONFIG_CATV is not set
-CONFIG_CHGRP=y
-CONFIG_CHMOD=y
-CONFIG_CHOWN=y
-CONFIG_CHROOT=y
-# CONFIG_CKSUM is not set
-# CONFIG_COMM is not set
-CONFIG_CP=y
-CONFIG_CUT=y
-CONFIG_DATE=y
-CONFIG_FEATURE_DATE_ISOFMT=y
-CONFIG_DD=y
-CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
-# CONFIG_FEATURE_DD_IBS_OBS is not set
-CONFIG_DF=y
-CONFIG_FEATURE_DF_FANCY=y
-CONFIG_DIRNAME=y
-# CONFIG_DOS2UNIX is not set
-# CONFIG_UNIX2DOS is not set
-CONFIG_DU=y
-CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
-CONFIG_ECHO=y
-CONFIG_FEATURE_FANCY_ECHO=y
-CONFIG_ENV=y
-CONFIG_FEATURE_ENV_LONG_OPTIONS=y
-# CONFIG_EXPAND is not set
-# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
-CONFIG_EXPR=y
-# CONFIG_EXPR_MATH_SUPPORT_64 is not set
-CONFIG_FALSE=y
-# CONFIG_FOLD is not set
-CONFIG_HEAD=y
-CONFIG_FEATURE_FANCY_HEAD=y
-# CONFIG_HOSTID is not set
-CONFIG_ID=y
-# CONFIG_INSTALL is not set
-# CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
-# CONFIG_LENGTH is not set
-CONFIG_LN=y
-CONFIG_LOGNAME=y
-CONFIG_LS=y
-CONFIG_FEATURE_LS_FILETYPES=y
-CONFIG_FEATURE_LS_FOLLOWLINKS=y
-CONFIG_FEATURE_LS_RECURSIVE=y
-CONFIG_FEATURE_LS_SORTFILES=y
-CONFIG_FEATURE_LS_TIMESTAMPS=y
-CONFIG_FEATURE_LS_USERNAME=y
-CONFIG_FEATURE_LS_COLOR=y
-# CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
-CONFIG_MD5SUM=y
-CONFIG_MKDIR=y
-CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y
-CONFIG_MKFIFO=y
-CONFIG_MKNOD=y
-CONFIG_MV=y
-CONFIG_FEATURE_MV_LONG_OPTIONS=y
-CONFIG_NICE=y
-CONFIG_NOHUP=y
-CONFIG_OD=y
-# CONFIG_PRINTENV is not set
-CONFIG_PRINTF=y
-CONFIG_PWD=y
-CONFIG_READLINK=y
-CONFIG_FEATURE_READLINK_FOLLOW=y
-CONFIG_REALPATH=y
-CONFIG_RM=y
-CONFIG_RMDIR=y
-CONFIG_FEATURE_RMDIR_LONG_OPTIONS=y
-CONFIG_SEQ=y
-# CONFIG_SHA1SUM is not set
-CONFIG_SLEEP=y
-CONFIG_FEATURE_FANCY_SLEEP=y
-CONFIG_FEATURE_FLOAT_SLEEP=y
-CONFIG_SORT=y
-CONFIG_FEATURE_SORT_BIG=y
-# CONFIG_SPLIT is not set
-# CONFIG_FEATURE_SPLIT_FANCY is not set
-# CONFIG_STAT is not set
-# CONFIG_FEATURE_STAT_FORMAT is not set
-CONFIG_STTY=y
-# CONFIG_SUM is not set
-CONFIG_SYNC=y
-# CONFIG_TAC is not set
-CONFIG_TAIL=y
-CONFIG_FEATURE_FANCY_TAIL=y
-CONFIG_TEE=y
-CONFIG_FEATURE_TEE_USE_BLOCK_IO=y
-CONFIG_TEST=y
-# CONFIG_FEATURE_TEST_64 is not set
-CONFIG_TOUCH=y
-CONFIG_TR=y
-CONFIG_FEATURE_TR_CLASSES=y
-# CONFIG_FEATURE_TR_EQUIV is not set
-CONFIG_TRUE=y
-CONFIG_TTY=y
-CONFIG_UNAME=y
-# CONFIG_UNEXPAND is not set
-# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
-CONFIG_UNIQ=y
-CONFIG_USLEEP=y
-# CONFIG_UUDECODE is not set
-# CONFIG_UUENCODE is not set
-CONFIG_WC=y
-# CONFIG_FEATURE_WC_LARGE is not set
-CONFIG_WHO=y
-CONFIG_WHOAMI=y
-CONFIG_YES=y
-
-#
-# Common options for cp and mv
-#
-# CONFIG_FEATURE_PRESERVE_HARDLINKS is not set
-
-#
-# Common options for ls, more and telnet
-#
-CONFIG_FEATURE_AUTOWIDTH=y
-
-#
-# Common options for df, du, ls
-#
-CONFIG_FEATURE_HUMAN_READABLE=y
-
-#
-# Common options for md5sum, sha1sum
-#
-CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
-
-#
-# Console Utilities
-#
-CONFIG_CHVT=y
-CONFIG_CLEAR=y
-CONFIG_DEALLOCVT=y
-CONFIG_DUMPKMAP=y
-# CONFIG_KBD_MODE is not set
-CONFIG_LOADFONT=y
-CONFIG_LOADKMAP=y
-CONFIG_OPENVT=y
-CONFIG_RESET=y
-# CONFIG_RESIZE is not set
-# CONFIG_FEATURE_RESIZE_PRINT is not set
-CONFIG_SETCONSOLE=y
-# CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
-CONFIG_SETFONT=y
-CONFIG_FEATURE_SETFONT_TEXTUAL_MAP=y
-CONFIG_DEFAULT_SETFONT_DIR=""
-# CONFIG_SETKEYCODES is not set
-# CONFIG_SETLOGCONS is not set
-CONFIG_SHOWKEY=y
-
-#
-# Debian Utilities
-#
-CONFIG_MKTEMP=y
-# CONFIG_PIPE_PROGRESS is not set
-CONFIG_RUN_PARTS=y
-CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
-CONFIG_FEATURE_RUN_PARTS_FANCY=y
-CONFIG_START_STOP_DAEMON=y
-CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
-CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
-CONFIG_WHICH=y
-
-#
-# Editors
-#
-CONFIG_AWK=y
-CONFIG_FEATURE_AWK_LIBM=y
-CONFIG_CMP=y
-CONFIG_DIFF=y
-CONFIG_FEATURE_DIFF_BINARY=y
-CONFIG_FEATURE_DIFF_DIR=y
-CONFIG_FEATURE_DIFF_MINIMAL=y
-# CONFIG_ED is not set
-CONFIG_PATCH=y
-CONFIG_SED=y
-CONFIG_VI=y
-CONFIG_FEATURE_VI_MAX_LEN=1024
-CONFIG_FEATURE_VI_8BIT=y
-CONFIG_FEATURE_VI_COLON=y
-CONFIG_FEATURE_VI_YANKMARK=y
-CONFIG_FEATURE_VI_SEARCH=y
-CONFIG_FEATURE_VI_USE_SIGNALS=y
-CONFIG_FEATURE_VI_DOT_CMD=y
-# CONFIG_FEATURE_VI_READONLY is not set
-# CONFIG_FEATURE_VI_SETOPTS is not set
-CONFIG_FEATURE_VI_SET=y
-CONFIG_FEATURE_VI_WIN_RESIZE=y
-CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
-CONFIG_FEATURE_ALLOW_EXEC=y
-
-#
-# Finding Utilities
-#
-CONFIG_FIND=y
-CONFIG_FEATURE_FIND_PRINT0=y
-CONFIG_FEATURE_FIND_MTIME=y
-CONFIG_FEATURE_FIND_MMIN=y
-CONFIG_FEATURE_FIND_PERM=y
-CONFIG_FEATURE_FIND_TYPE=y
-CONFIG_FEATURE_FIND_XDEV=y
-CONFIG_FEATURE_FIND_MAXDEPTH=y
-CONFIG_FEATURE_FIND_NEWER=y
-CONFIG_FEATURE_FIND_INUM=y
-CONFIG_FEATURE_FIND_EXEC=y
-CONFIG_FEATURE_FIND_USER=y
-CONFIG_FEATURE_FIND_GROUP=y
-CONFIG_FEATURE_FIND_NOT=y
-CONFIG_FEATURE_FIND_DEPTH=y
-CONFIG_FEATURE_FIND_PAREN=y
-CONFIG_FEATURE_FIND_SIZE=y
-CONFIG_FEATURE_FIND_PRUNE=y
-CONFIG_FEATURE_FIND_DELETE=y
-CONFIG_FEATURE_FIND_PATH=y
-CONFIG_FEATURE_FIND_REGEX=y
-# CONFIG_FEATURE_FIND_CONTEXT is not set
-CONFIG_GREP=y
-CONFIG_FEATURE_GREP_EGREP_ALIAS=y
-CONFIG_FEATURE_GREP_FGREP_ALIAS=y
-CONFIG_FEATURE_GREP_CONTEXT=y
-CONFIG_XARGS=y
-# CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION is not set
-CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=y
-CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=y
-CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
-
-#
-# Init Utilities
-#
-CONFIG_INIT=y
-CONFIG_FEATURE_USE_INITTAB=y
-CONFIG_FEATURE_KILL_REMOVED=y
-CONFIG_FEATURE_KILL_DELAY=0
-# CONFIG_FEATURE_INIT_SCTTY is not set
-# CONFIG_FEATURE_INIT_SYSLOG is not set
-# CONFIG_FEATURE_EXTRA_QUIET is not set
-# CONFIG_FEATURE_INIT_COREDUMPS is not set
-CONFIG_FEATURE_INITRD=y
-CONFIG_HALT=y
-# CONFIG_MESG is not set
-
-#
-# Login/Password Management Utilities
-#
-CONFIG_FEATURE_SHADOWPASSWDS=y
-# CONFIG_USE_BB_PWD_GRP is not set
-# CONFIG_USE_BB_SHADOW is not set
-CONFIG_USE_BB_CRYPT=y
-CONFIG_ADDGROUP=y
-CONFIG_FEATURE_ADDUSER_TO_GROUP=y
-CONFIG_DELGROUP=y
-CONFIG_FEATURE_DEL_USER_FROM_GROUP=y
-CONFIG_FEATURE_CHECK_NAMES=y
-CONFIG_ADDUSER=y
-CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=y
-CONFIG_DELUSER=y
-CONFIG_GETTY=y
-CONFIG_FEATURE_UTMP=y
-CONFIG_FEATURE_WTMP=y
-CONFIG_LOGIN=y
-# CONFIG_PAM is not set
-CONFIG_LOGIN_SCRIPTS=y
-CONFIG_FEATURE_NOLOGIN=y
-CONFIG_FEATURE_SECURETTY=y
-CONFIG_PASSWD=y
-CONFIG_FEATURE_PASSWD_WEAK_CHECK=y
-CONFIG_CRYPTPW=y
-CONFIG_CHPASSWD=y
-CONFIG_SU=y
-CONFIG_FEATURE_SU_SYSLOG=y
-CONFIG_FEATURE_SU_CHECKS_SHELLS=y
-CONFIG_SULOGIN=y
-CONFIG_VLOCK=y
-
-#
-# Linux Ext2 FS Progs
-#
-CONFIG_CHATTR=y
-CONFIG_FSCK=y
-# CONFIG_LSATTR is not set
-
-#
-# Linux Module Utilities
-#
-CONFIG_DEFAULT_MODULES_DIR="/lib/modules"
-CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
-# CONFIG_MODPROBE_SMALL is not set
-# CONFIG_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE is not set
-# CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not set
-CONFIG_INSMOD=y
-CONFIG_RMMOD=y
-CONFIG_LSMOD=y
-CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT=y
-CONFIG_MODPROBE=y
-CONFIG_FEATURE_MODPROBE_BLACKLIST=y
-# CONFIG_DEPMOD is not set
-
-#
-# Options common to multiple modutils
-#
-# CONFIG_FEATURE_2_4_MODULES is not set
-# CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
-# CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
-# CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
-# CONFIG_FEATURE_INSMOD_LOAD_MAP is not set
-# CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL is not set
-CONFIG_FEATURE_CHECK_TAINTED_MODULE=y
-CONFIG_FEATURE_MODUTILS_ALIAS=y
-CONFIG_FEATURE_MODUTILS_SYMBOLS=y
-
-#
-# Linux System Utilities
-#
-CONFIG_BLKID=y
-CONFIG_DMESG=y
-CONFIG_FEATURE_DMESG_PRETTY=y
-CONFIG_FBSET=y
-CONFIG_FEATURE_FBSET_FANCY=y
-CONFIG_FEATURE_FBSET_READMODE=y
-# CONFIG_FDFLUSH is not set
-# CONFIG_FDFORMAT is not set
-CONFIG_FDISK=y
-CONFIG_FDISK_SUPPORT_LARGE_DISKS=y
-CONFIG_FEATURE_FDISK_WRITABLE=y
-# CONFIG_FEATURE_AIX_LABEL is not set
-# CONFIG_FEATURE_SGI_LABEL is not set
-# CONFIG_FEATURE_SUN_LABEL is not set
-CONFIG_FEATURE_OSF_LABEL=y
-CONFIG_FEATURE_FDISK_ADVANCED=y
-# CONFIG_FINDFS is not set
-CONFIG_FREERAMDISK=y
-CONFIG_FSCK_MINIX=y
-CONFIG_MKFS_MINIX=y
-
-#
-# Minix filesystem support
-#
-CONFIG_FEATURE_MINIX2=y
-CONFIG_GETOPT=y
-CONFIG_HEXDUMP=y
-# CONFIG_FEATURE_HEXDUMP_REVERSE is not set
-# CONFIG_HD is not set
-CONFIG_HWCLOCK=y
-CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=y
-CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
-# CONFIG_IPCRM is not set
-# CONFIG_IPCS is not set
-CONFIG_LOSETUP=y
-CONFIG_MDEV=y
-CONFIG_FEATURE_MDEV_CONF=y
-CONFIG_FEATURE_MDEV_RENAME=y
-CONFIG_FEATURE_MDEV_RENAME_REGEXP=y
-CONFIG_FEATURE_MDEV_EXEC=y
-CONFIG_FEATURE_MDEV_LOAD_FIRMWARE=y
-CONFIG_MKSWAP=y
-# CONFIG_FEATURE_MKSWAP_V0 is not set
-CONFIG_MORE=y
-CONFIG_FEATURE_USE_TERMIOS=y
-CONFIG_VOLUMEID=y
-# CONFIG_FEATURE_VOLUMEID_EXT is not set
-# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
-# CONFIG_FEATURE_VOLUMEID_FAT is not set
-# CONFIG_FEATURE_VOLUMEID_HFS is not set
-# CONFIG_FEATURE_VOLUMEID_JFS is not set
-# CONFIG_FEATURE_VOLUMEID_XFS is not set
-# CONFIG_FEATURE_VOLUMEID_NTFS is not set
-# CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
-# CONFIG_FEATURE_VOLUMEID_UDF is not set
-# CONFIG_FEATURE_VOLUMEID_LUKS is not set
-# CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
-# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
-# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
-# CONFIG_FEATURE_VOLUMEID_SYSV is not set
-# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
-# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
-CONFIG_MOUNT=y
-# CONFIG_FEATURE_MOUNT_FAKE is not set
-CONFIG_FEATURE_MOUNT_VERBOSE=y
-CONFIG_FEATURE_MOUNT_HELPERS=y
-CONFIG_FEATURE_MOUNT_LABEL=y
-CONFIG_FEATURE_MOUNT_NFS=y
-CONFIG_FEATURE_MOUNT_CIFS=y
-CONFIG_FEATURE_MOUNT_FLAGS=y
-CONFIG_FEATURE_MOUNT_FSTAB=y
-CONFIG_PIVOT_ROOT=y
-CONFIG_RDATE=y
-CONFIG_RDEV=y
-CONFIG_READPROFILE=y
-CONFIG_RTCWAKE=y
-# CONFIG_SCRIPT is not set
-# CONFIG_SETARCH is not set
-CONFIG_SWAPONOFF=y
-# CONFIG_FEATURE_SWAPON_PRI is not set
-CONFIG_SWITCH_ROOT=y
-CONFIG_UMOUNT=y
-CONFIG_FEATURE_UMOUNT_ALL=y
-
-#
-# Common options for mount/umount
-#
-CONFIG_FEATURE_MOUNT_LOOP=y
-# CONFIG_FEATURE_MTAB_SUPPORT is not set
-
-#
-# Miscellaneous Utilities
-#
-# CONFIG_ADJTIMEX is not set
-# CONFIG_BBCONFIG is not set
-# CONFIG_CHAT is not set
-# CONFIG_FEATURE_CHAT_NOFAIL is not set
-# CONFIG_FEATURE_CHAT_TTY_HIFI is not set
-# CONFIG_FEATURE_CHAT_IMPLICIT_CR is not set
-# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
-# CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
-# CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
-# CONFIG_FEATURE_CHAT_CLR_ABORT is not set
-# CONFIG_CHRT is not set
-# CONFIG_CROND is not set
-# CONFIG_FEATURE_CROND_D is not set
-# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
-# CONFIG_CRONTAB is not set
-CONFIG_DC=y
-CONFIG_FEATURE_DC_LIBM=y
-# CONFIG_DEVFSD is not set
-# CONFIG_DEVFSD_MODLOAD is not set
-# CONFIG_DEVFSD_FG_NP is not set
-# CONFIG_DEVFSD_VERBOSE is not set
-# CONFIG_FEATURE_DEVFS is not set
-# CONFIG_DEVMEM is not set
-# CONFIG_EJECT is not set
-# CONFIG_FEATURE_EJECT_SCSI is not set
-CONFIG_FBSPLASH=y
-# CONFIG_INOTIFYD is not set
-CONFIG_LAST=y
-CONFIG_FEATURE_LAST_SMALL=y
-# CONFIG_FEATURE_LAST_FANCY is not set
-CONFIG_LESS=y
-CONFIG_FEATURE_LESS_MAXLINES=9999999
-CONFIG_FEATURE_LESS_BRACKETS=y
-CONFIG_FEATURE_LESS_FLAGS=y
-# CONFIG_FEATURE_LESS_DASHCMD is not set
-# CONFIG_FEATURE_LESS_MARKS is not set
-# CONFIG_FEATURE_LESS_REGEXP is not set
-# CONFIG_FEATURE_LESS_LINENUMS is not set
-# CONFIG_FEATURE_LESS_WINCH is not set
-# CONFIG_HDPARM is not set
-# CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
-# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
-# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
-CONFIG_MAKEDEVS=y
-# CONFIG_FEATURE_MAKEDEVS_LEAF is not set
-CONFIG_FEATURE_MAKEDEVS_TABLE=y
-# CONFIG_MAN is not set
-CONFIG_MICROCOM=y
-# CONFIG_MOUNTPOINT is not set
-# CONFIG_MT is not set
-# CONFIG_RAIDAUTORUN is not set
-CONFIG_READAHEAD=y
-# CONFIG_RUNLEVEL is not set
-# CONFIG_RX is not set
-# CONFIG_SETSID is not set
-CONFIG_STRINGS=y
-# CONFIG_TASKSET is not set
-# CONFIG_FEATURE_TASKSET_FANCY is not set
-CONFIG_TIME=y
-# CONFIG_TTYSIZE is not set
-# CONFIG_WATCHDOG is not set
-
-#
-# Networking Utilities
-#
-CONFIG_FEATURE_IPV6=y
-CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
-# CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
-# CONFIG_ARP is not set
-# CONFIG_ARPING is not set
-# CONFIG_BRCTL is not set
-# CONFIG_FEATURE_BRCTL_FANCY is not set
-# CONFIG_FEATURE_BRCTL_SHOW is not set
-# CONFIG_DNSD is not set
-# CONFIG_ETHER_WAKE is not set
-# CONFIG_FAKEIDENTD is not set
-# CONFIG_FTPGET is not set
-# CONFIG_FTPPUT is not set
-# CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
-CONFIG_HOSTNAME=y
-CONFIG_HTTPD=y
-CONFIG_FEATURE_HTTPD_RANGES=y
-CONFIG_FEATURE_HTTPD_USE_SENDFILE=y
-CONFIG_FEATURE_HTTPD_RELOAD_CONFIG_SIGHUP=y
-CONFIG_FEATURE_HTTPD_SETUID=y
-CONFIG_FEATURE_HTTPD_BASIC_AUTH=y
-CONFIG_FEATURE_HTTPD_AUTH_MD5=y
-CONFIG_FEATURE_HTTPD_CONFIG_WITH_MIME_TYPES=y
-CONFIG_FEATURE_HTTPD_CGI=y
-CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR=y
-CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV=y
-CONFIG_FEATURE_HTTPD_ENCODE_URL_STR=y
-CONFIG_FEATURE_HTTPD_ERROR_PAGES=y
-CONFIG_FEATURE_HTTPD_PROXY=y
-CONFIG_IFCONFIG=y
-CONFIG_FEATURE_IFCONFIG_STATUS=y
-# CONFIG_FEATURE_IFCONFIG_SLIP is not set
-# CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ is not set
-CONFIG_FEATURE_IFCONFIG_HW=y
-CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS=y
-# CONFIG_IFENSLAVE is not set
-CONFIG_IFUPDOWN=y
-CONFIG_IFUPDOWN_IFSTATE_PATH="/var/run/ifstate"
-# CONFIG_FEATURE_IFUPDOWN_IP is not set
-# CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
-CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN=y
-CONFIG_FEATURE_IFUPDOWN_IPV4=y
-CONFIG_FEATURE_IFUPDOWN_IPV6=y
-CONFIG_FEATURE_IFUPDOWN_MAPPING=y
-# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
-# CONFIG_INETD is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
-# CONFIG_FEATURE_INETD_RPC is not set
-CONFIG_IP=y
-CONFIG_FEATURE_IP_ADDRESS=y
-CONFIG_FEATURE_IP_LINK=y
-CONFIG_FEATURE_IP_ROUTE=y
-CONFIG_FEATURE_IP_TUNNEL=y
-# CONFIG_FEATURE_IP_RULE is not set
-# CONFIG_FEATURE_IP_SHORT_FORMS is not set
-# CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
-# CONFIG_IPADDR is not set
-# CONFIG_IPLINK is not set
-# CONFIG_IPROUTE is not set
-# CONFIG_IPTUNNEL is not set
-# CONFIG_IPRULE is not set
-# CONFIG_IPCALC is not set
-# CONFIG_FEATURE_IPCALC_FANCY is not set
-# CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
-# CONFIG_NAMEIF is not set
-# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
-CONFIG_NC=y
-CONFIG_NC_SERVER=y
-CONFIG_NC_EXTRA=y
-CONFIG_NETSTAT=y
-CONFIG_FEATURE_NETSTAT_WIDE=y
-CONFIG_FEATURE_NETSTAT_PRG=y
-CONFIG_NSLOOKUP=y
-CONFIG_PING=y
-CONFIG_PING6=y
-CONFIG_FEATURE_FANCY_PING=y
-# CONFIG_PSCAN is not set
-CONFIG_ROUTE=y
-# CONFIG_SLATTACH is not set
-CONFIG_TELNET=y
-# CONFIG_FEATURE_TELNET_TTYPE is not set
-CONFIG_FEATURE_TELNET_AUTOLOGIN=y
-CONFIG_TELNETD=y
-# CONFIG_FEATURE_TELNETD_STANDALONE is not set
-CONFIG_TFTP=y
-# CONFIG_TFTPD is not set
-CONFIG_FEATURE_TFTP_GET=y
-CONFIG_FEATURE_TFTP_PUT=y
-# CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
-# CONFIG_TFTP_DEBUG is not set
-CONFIG_TRACEROUTE=y
-CONFIG_FEATURE_TRACEROUTE_VERBOSE=y
-CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE=y
-CONFIG_FEATURE_TRACEROUTE_USE_ICMP=y
-CONFIG_UDHCPD=y
-CONFIG_DHCPRELAY=y
-CONFIG_DUMPLEASES=y
-# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
-CONFIG_DHCPD_LEASES_FILE="/var/lib/misc/udhcpd.leases"
-CONFIG_UDHCPC=y
-CONFIG_FEATURE_UDHCPC_ARPING=y
-# CONFIG_FEATURE_UDHCP_PORT is not set
-# CONFIG_UDHCP_DEBUG is not set
-# CONFIG_FEATURE_UDHCP_RFC3397 is not set
-CONFIG_UDHCPC_DEFAULT_SCRIPT="@DATADIR@/udhcpc/default.script"
-CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
-# CONFIG_VCONFIG is not set
-CONFIG_WGET=y
-CONFIG_FEATURE_WGET_STATUSBAR=y
-CONFIG_FEATURE_WGET_AUTHENTICATION=y
-CONFIG_FEATURE_WGET_LONG_OPTIONS=y
-# CONFIG_ZCIP is not set
-# CONFIG_TCPSVD is not set
-# CONFIG_UDPSVD is not set
-
-#
-# Print Utilities
-#
-# CONFIG_LPD is not set
-# CONFIG_LPR is not set
-# CONFIG_LPQ is not set
-
-#
-# Mail Utilities
-#
-# CONFIG_MAKEMIME is not set
-CONFIG_FEATURE_MIME_CHARSET=""
-# CONFIG_POPMAILDIR is not set
-# CONFIG_FEATURE_POPMAILDIR_DELIVERY is not set
-# CONFIG_REFORMIME is not set
-# CONFIG_FEATURE_REFORMIME_COMPAT is not set
-# CONFIG_SENDMAIL is not set
-# CONFIG_FEATURE_SENDMAIL_MAILX is not set
-# CONFIG_FEATURE_SENDMAIL_MAILXX is not set
-
-#
-# Process Utilities
-#
-CONFIG_FREE=y
-CONFIG_FUSER=y
-CONFIG_KILL=y
-CONFIG_KILLALL=y
-# CONFIG_KILLALL5 is not set
-# CONFIG_NMETER is not set
-# CONFIG_PGREP is not set
-CONFIG_PIDOF=y
-CONFIG_FEATURE_PIDOF_SINGLE=y
-CONFIG_FEATURE_PIDOF_OMIT=y
-# CONFIG_PKILL is not set
-CONFIG_PS=y
-CONFIG_FEATURE_PS_WIDE=y
-# CONFIG_FEATURE_PS_TIME is not set
-# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
-CONFIG_RENICE=y
-CONFIG_BB_SYSCTL=y
-CONFIG_TOP=y
-CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE=y
-CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
-# CONFIG_FEATURE_TOP_SMP_CPU is not set
-# CONFIG_FEATURE_TOP_DECIMALS is not set
-# CONFIG_FEATURE_TOP_SMP_PROCESS is not set
-# CONFIG_FEATURE_TOPMEM is not set
-CONFIG_UPTIME=y
-CONFIG_WATCH=y
-
-#
-# Runit Utilities
-#
-# CONFIG_RUNSV is not set
-# CONFIG_RUNSVDIR is not set
-# CONFIG_FEATURE_RUNSVDIR_LOG is not set
-# CONFIG_SV is not set
-CONFIG_SV_DEFAULT_SERVICE_DIR=""
-# CONFIG_SVLOGD is not set
-# CONFIG_CHPST is not set
-# CONFIG_SETUIDGID is not set
-# CONFIG_ENVUIDGID is not set
-# CONFIG_ENVDIR is not set
-# CONFIG_SOFTLIMIT is not set
-# CONFIG_CHCON is not set
-# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
-# CONFIG_GETENFORCE is not set
-# CONFIG_GETSEBOOL is not set
-# CONFIG_LOAD_POLICY is not set
-# CONFIG_MATCHPATHCON is not set
-# CONFIG_RESTORECON is not set
-# CONFIG_RUNCON is not set
-# CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
-# CONFIG_SELINUXENABLED is not set
-# CONFIG_SETENFORCE is not set
-# CONFIG_SETFILES is not set
-# CONFIG_FEATURE_SETFILES_CHECK_OPTION is not set
-# CONFIG_SETSEBOOL is not set
-# CONFIG_SESTATUS is not set
-
-#
-# Shells
-#
-CONFIG_FEATURE_SH_IS_ASH=y
-# CONFIG_FEATURE_SH_IS_HUSH is not set
-# CONFIG_FEATURE_SH_IS_MSH is not set
-# CONFIG_FEATURE_SH_IS_NONE is not set
-CONFIG_ASH=y
-
-#
-# Ash Shell Options
-#
-CONFIG_ASH_BASH_COMPAT=y
-CONFIG_ASH_JOB_CONTROL=y
-CONFIG_ASH_READ_NCHARS=y
-CONFIG_ASH_READ_TIMEOUT=y
-CONFIG_ASH_ALIAS=y
-CONFIG_ASH_MATH_SUPPORT=y
-# CONFIG_ASH_MATH_SUPPORT_64 is not set
-CONFIG_ASH_GETOPTS=y
-CONFIG_ASH_BUILTIN_ECHO=y
-CONFIG_ASH_BUILTIN_PRINTF=y
-CONFIG_ASH_BUILTIN_TEST=y
-# CONFIG_ASH_CMDCMD is not set
-# CONFIG_ASH_MAIL is not set
-# CONFIG_ASH_OPTIMIZE_FOR_SIZE is not set
-# CONFIG_ASH_RANDOM_SUPPORT is not set
-CONFIG_ASH_EXPAND_PRMT=y
-# CONFIG_HUSH is not set
-# CONFIG_HUSH_HELP is not set
-# CONFIG_HUSH_INTERACTIVE is not set
-# CONFIG_HUSH_JOB is not set
-# CONFIG_HUSH_TICK is not set
-# CONFIG_HUSH_IF is not set
-# CONFIG_HUSH_LOOPS is not set
-# CONFIG_HUSH_CASE is not set
-# CONFIG_LASH is not set
-# CONFIG_MSH is not set
-
-#
-# Bourne Shell Options
-#
-CONFIG_FEATURE_SH_EXTRA_QUIET=y
-# CONFIG_FEATURE_SH_STANDALONE is not set
-# CONFIG_FEATURE_SH_NOFORK is not set
-# CONFIG_CTTYHACK is not set
-
-#
-# System Logging Utilities
-#
-CONFIG_SYSLOGD=y
-CONFIG_FEATURE_ROTATE_LOGFILE=y
-CONFIG_FEATURE_REMOTE_LOG=y
-CONFIG_FEATURE_SYSLOGD_DUP=y
-CONFIG_FEATURE_IPC_SYSLOG=y
-CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=16
-CONFIG_LOGREAD=y
-CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=y
-CONFIG_KLOGD=y
-CONFIG_LOGGER=y
diff --git a/recipes/busybox/busybox-1.18.0/fdisk_nios2.patch b/recipes/busybox/busybox-1.18.0/fdisk_nios2.patch
deleted file mode 100644
index 648e68e..0000000
--- a/recipes/busybox/busybox-1.18.0/fdisk_nios2.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: busybox-1.15.3/util-linux/fdisk_osf.c
-===================================================================
---- busybox-1.15.3.orig/util-linux/fdisk_osf.c
-+++ busybox-1.15.3/util-linux/fdisk_osf.c
-@@ -44,7 +44,7 @@
- #define BSD_LINUX_BOOTDIR "/usr/ucb/mdec"
- 
- #if defined(i386) || defined(__sparc__) || defined(__arm__) \
-- || defined(__m68k__) || defined(__mips__) || defined(__s390__) \
-+ || defined(__m68k__) || defined(__mips__) || defined(__nios2__) \
-  || defined(__s390__) || defined(__s390x__) \
-  || defined(__sh__) || defined(__x86_64__) || defined(__avr32__)
- # define BSD_LABELSECTOR   1
diff --git a/recipes/busybox/busybox-1.18.0/get_header_tar.patch b/recipes/busybox/busybox-1.18.0/get_header_tar.patch
deleted file mode 100644
index 62b55af..0000000
--- a/recipes/busybox/busybox-1.18.0/get_header_tar.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/get_header_tar.c
-index 78b0ae2..58b15c1 100644
---- a/archival/libarchive/get_header_tar.c
-+++ b/archival/libarchive/get_header_tar.c
-@@ -314,6 +314,8 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
- 			file_header->name = concat_path_file(tar.prefix, tar.name);
- 		} else
- 			file_header->name = xstrdup(tar.name);
-+		if (strlen(file_header->name) > 100)
-+			file_header->name[100] = 0;
- 	}
- 
- 	/* Set bits 12-15 of the files mode */
diff --git a/recipes/busybox/busybox-1.18.0/slugos/defconfig b/recipes/busybox/busybox-1.18.0/slugos/defconfig
deleted file mode 100644
index d3e38b8..0000000
--- a/recipes/busybox/busybox-1.18.0/slugos/defconfig
+++ /dev/null
@@ -1,986 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Busybox version: 1.18.0
-# Sun Dec 26 22:59:53 2010
-#
-CONFIG_HAVE_DOT_CONFIG=y
-
-#
-# Busybox Settings
-#
-
-#
-# General Configuration
-#
-# CONFIG_DESKTOP is not set
-# CONFIG_EXTRA_COMPAT is not set
-# CONFIG_INCLUDE_SUSv2 is not set
-# CONFIG_USE_PORTABLE_CODE is not set
-CONFIG_PLATFORM_LINUX=y
-CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
-# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
-# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
-CONFIG_SHOW_USAGE=y
-CONFIG_FEATURE_VERBOSE_USAGE=y
-CONFIG_FEATURE_COMPRESS_USAGE=y
-# CONFIG_FEATURE_INSTALLER is not set
-# CONFIG_INSTALL_NO_USR is not set
-# CONFIG_LOCALE_SUPPORT is not set
-CONFIG_UNICODE_SUPPORT=y
-# CONFIG_UNICODE_USING_LOCALE is not set
-# CONFIG_FEATURE_CHECK_UNICODE_IN_ENV is not set
-CONFIG_SUBST_WCHAR=63
-CONFIG_LAST_SUPPORTED_WCHAR=767
-# CONFIG_UNICODE_COMBINING_WCHARS is not set
-# CONFIG_UNICODE_WIDE_WCHARS is not set
-# CONFIG_UNICODE_BIDI_SUPPORT is not set
-# CONFIG_UNICODE_NEUTRAL_TABLE is not set
-# CONFIG_UNICODE_PRESERVE_BROKEN is not set
-CONFIG_LONG_OPTS=y
-CONFIG_FEATURE_DEVPTS=y
-# CONFIG_FEATURE_CLEAN_UP is not set
-CONFIG_FEATURE_WTMP=y
-CONFIG_FEATURE_UTMP=y
-CONFIG_FEATURE_PIDFILE=y
-CONFIG_FEATURE_SUID=y
-CONFIG_FEATURE_SUID_CONFIG=y
-CONFIG_FEATURE_SUID_CONFIG_QUIET=y
-# CONFIG_SELINUX is not set
-# CONFIG_FEATURE_PREFER_APPLETS is not set
-CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
-CONFIG_FEATURE_SYSLOG=y
-CONFIG_FEATURE_HAVE_RPC=y
-
-#
-# Build Options
-#
-# CONFIG_STATIC is not set
-# CONFIG_PIE is not set
-# CONFIG_NOMMU is not set
-# CONFIG_BUILD_LIBBUSYBOX is not set
-# CONFIG_FEATURE_INDIVIDUAL is not set
-# CONFIG_FEATURE_SHARED_BUSYBOX is not set
-CONFIG_LFS=y
-CONFIG_CROSS_COMPILER_PREFIX="arm-linux-gnueabi-"
-CONFIG_EXTRA_CFLAGS="-isystem/r/slug/slugos/tmp/sysroots/armv5te-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os"
-
-#
-# Debugging Options
-#
-# CONFIG_DEBUG is not set
-# CONFIG_DEBUG_PESSIMIZE is not set
-# CONFIG_WERROR is not set
-CONFIG_NO_DEBUG_LIB=y
-# CONFIG_DMALLOC is not set
-# CONFIG_EFENCE is not set
-
-#
-# Installation Options ("make install" behavior)
-#
-CONFIG_INSTALL_APPLET_SYMLINKS=y
-# CONFIG_INSTALL_APPLET_HARDLINKS is not set
-# CONFIG_INSTALL_APPLET_SCRIPT_WRAPPERS is not set
-# CONFIG_INSTALL_APPLET_DONT is not set
-# CONFIG_INSTALL_SH_APPLET_SYMLINK is not set
-# CONFIG_INSTALL_SH_APPLET_HARDLINK is not set
-# CONFIG_INSTALL_SH_APPLET_SCRIPT_WRAPPER is not set
-CONFIG_PREFIX="./_install"
-
-#
-# Busybox Library Tuning
-#
-CONFIG_PASSWORD_MINLEN=6
-CONFIG_MD5_SIZE_VS_SPEED=1
-CONFIG_FEATURE_FAST_TOP=y
-# CONFIG_FEATURE_ETC_NETWORKS is not set
-CONFIG_FEATURE_USE_TERMIOS=y
-CONFIG_FEATURE_EDITING=y
-CONFIG_FEATURE_EDITING_MAX_LEN=1024
-# CONFIG_FEATURE_EDITING_VI is not set
-CONFIG_FEATURE_EDITING_HISTORY=50
-CONFIG_FEATURE_EDITING_SAVEHISTORY=y
-CONFIG_FEATURE_TAB_COMPLETION=y
-CONFIG_FEATURE_USERNAME_COMPLETION=y
-CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
-# CONFIG_FEATURE_EDITING_ASK_TERMINAL is not set
-CONFIG_FEATURE_NON_POSIX_CP=y
-CONFIG_FEATURE_VERBOSE_CP_MESSAGE=y
-CONFIG_FEATURE_COPYBUF_KB=4
-CONFIG_MONOTONIC_SYSCALL=y
-CONFIG_IOCTL_HEX2STR_ERROR=y
-# CONFIG_FEATURE_HWIB is not set
-
-#
-# Applets
-#
-
-#
-# Archival Utilities
-#
-CONFIG_FEATURE_SEAMLESS_XZ=y
-# CONFIG_FEATURE_SEAMLESS_LZMA is not set
-CONFIG_FEATURE_SEAMLESS_BZ2=y
-CONFIG_FEATURE_SEAMLESS_GZ=y
-CONFIG_FEATURE_SEAMLESS_Z=y
-CONFIG_AR=y
-CONFIG_FEATURE_AR_LONG_FILENAMES=y
-CONFIG_FEATURE_AR_CREATE=y
-CONFIG_BUNZIP2=y
-CONFIG_BZIP2=y
-CONFIG_CPIO=y
-CONFIG_FEATURE_CPIO_O=y
-CONFIG_FEATURE_CPIO_P=y
-# CONFIG_DPKG is not set
-# CONFIG_DPKG_DEB is not set
-# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
-CONFIG_GUNZIP=y
-CONFIG_GZIP=y
-CONFIG_FEATURE_GZIP_LONG_OPTIONS=y
-CONFIG_LZOP=y
-# CONFIG_LZOP_COMPR_HIGH is not set
-# CONFIG_RPM2CPIO is not set
-# CONFIG_RPM is not set
-CONFIG_TAR=y
-CONFIG_FEATURE_TAR_CREATE=y
-CONFIG_FEATURE_TAR_AUTODETECT=y
-CONFIG_FEATURE_TAR_FROM=y
-CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY=y
-# CONFIG_FEATURE_TAR_OLDSUN_COMPATIBILITY is not set
-CONFIG_FEATURE_TAR_GNU_EXTENSIONS=y
-CONFIG_FEATURE_TAR_LONG_OPTIONS=y
-CONFIG_FEATURE_TAR_TO_COMMAND=y
-CONFIG_FEATURE_TAR_UNAME_GNAME=y
-CONFIG_FEATURE_TAR_NOPRESERVE_TIME=y
-# CONFIG_FEATURE_TAR_SELINUX is not set
-CONFIG_UNCOMPRESS=y
-CONFIG_UNLZMA=y
-# CONFIG_FEATURE_LZMA_FAST is not set
-CONFIG_LZMA=y
-CONFIG_UNXZ=y
-CONFIG_XZ=y
-CONFIG_UNZIP=y
-
-#
-# Coreutils
-#
-CONFIG_BASENAME=y
-CONFIG_CAT=y
-CONFIG_DATE=y
-CONFIG_FEATURE_DATE_ISOFMT=y
-# CONFIG_FEATURE_DATE_NANO is not set
-CONFIG_FEATURE_DATE_COMPAT=y
-CONFIG_TEST=y
-# CONFIG_FEATURE_TEST_64 is not set
-CONFIG_TR=y
-CONFIG_FEATURE_TR_CLASSES=y
-CONFIG_FEATURE_TR_EQUIV=y
-CONFIG_BASE64=y
-# CONFIG_CAL is not set
-# CONFIG_CATV is not set
-CONFIG_CHGRP=y
-CONFIG_CHMOD=y
-CONFIG_CHOWN=y
-CONFIG_FEATURE_CHOWN_LONG_OPTIONS=y
-CONFIG_CHROOT=y
-# CONFIG_CKSUM is not set
-# CONFIG_COMM is not set
-CONFIG_CP=y
-CONFIG_FEATURE_CP_LONG_OPTIONS=y
-CONFIG_CUT=y
-CONFIG_DD=y
-CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
-CONFIG_FEATURE_DD_THIRD_STATUS_LINE=y
-CONFIG_FEATURE_DD_IBS_OBS=y
-CONFIG_DF=y
-# CONFIG_FEATURE_DF_FANCY is not set
-CONFIG_DIRNAME=y
-CONFIG_DOS2UNIX=y
-CONFIG_UNIX2DOS=y
-CONFIG_DU=y
-CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
-CONFIG_ECHO=y
-CONFIG_FEATURE_FANCY_ECHO=y
-CONFIG_ENV=y
-CONFIG_FEATURE_ENV_LONG_OPTIONS=y
-# CONFIG_EXPAND is not set
-# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
-CONFIG_EXPR=y
-# CONFIG_EXPR_MATH_SUPPORT_64 is not set
-CONFIG_FALSE=y
-# CONFIG_FOLD is not set
-CONFIG_FSYNC=y
-CONFIG_HEAD=y
-CONFIG_FEATURE_FANCY_HEAD=y
-# CONFIG_HOSTID is not set
-CONFIG_ID=y
-# CONFIG_INSTALL is not set
-# CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
-CONFIG_LENGTH=y
-CONFIG_LN=y
-CONFIG_LOGNAME=y
-CONFIG_LS=y
-CONFIG_FEATURE_LS_FILETYPES=y
-CONFIG_FEATURE_LS_FOLLOWLINKS=y
-CONFIG_FEATURE_LS_RECURSIVE=y
-CONFIG_FEATURE_LS_SORTFILES=y
-CONFIG_FEATURE_LS_TIMESTAMPS=y
-CONFIG_FEATURE_LS_USERNAME=y
-CONFIG_FEATURE_LS_COLOR=y
-# CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
-CONFIG_MD5SUM=y
-CONFIG_MKDIR=y
-CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y
-CONFIG_MKFIFO=y
-CONFIG_MKNOD=y
-CONFIG_MV=y
-CONFIG_FEATURE_MV_LONG_OPTIONS=y
-CONFIG_NICE=y
-CONFIG_NOHUP=y
-CONFIG_OD=y
-# CONFIG_PRINTENV is not set
-CONFIG_PRINTF=y
-CONFIG_PWD=y
-CONFIG_READLINK=y
-CONFIG_FEATURE_READLINK_FOLLOW=y
-CONFIG_REALPATH=y
-CONFIG_RM=y
-CONFIG_RMDIR=y
-CONFIG_FEATURE_RMDIR_LONG_OPTIONS=y
-CONFIG_SEQ=y
-CONFIG_SHA1SUM=y
-CONFIG_SHA256SUM=y
-CONFIG_SHA512SUM=y
-CONFIG_SLEEP=y
-CONFIG_FEATURE_FANCY_SLEEP=y
-# CONFIG_FEATURE_FLOAT_SLEEP is not set
-CONFIG_SORT=y
-CONFIG_FEATURE_SORT_BIG=y
-CONFIG_SPLIT=y
-CONFIG_FEATURE_SPLIT_FANCY=y
-# CONFIG_STAT is not set
-# CONFIG_FEATURE_STAT_FORMAT is not set
-CONFIG_STTY=y
-CONFIG_SUM=y
-CONFIG_SYNC=y
-# CONFIG_TAC is not set
-CONFIG_TAIL=y
-CONFIG_FEATURE_FANCY_TAIL=y
-CONFIG_TEE=y
-CONFIG_FEATURE_TEE_USE_BLOCK_IO=y
-CONFIG_TOUCH=y
-CONFIG_TRUE=y
-CONFIG_TTY=y
-CONFIG_UNAME=y
-# CONFIG_UNEXPAND is not set
-# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
-CONFIG_UNIQ=y
-CONFIG_USLEEP=y
-# CONFIG_UUDECODE is not set
-# CONFIG_UUENCODE is not set
-CONFIG_WC=y
-# CONFIG_FEATURE_WC_LARGE is not set
-CONFIG_WHO=y
-CONFIG_WHOAMI=y
-CONFIG_YES=y
-
-#
-# Common options for cp and mv
-#
-CONFIG_FEATURE_PRESERVE_HARDLINKS=y
-
-#
-# Common options for ls, more and telnet
-#
-CONFIG_FEATURE_AUTOWIDTH=y
-
-#
-# Common options for df, du, ls
-#
-CONFIG_FEATURE_HUMAN_READABLE=y
-
-#
-# Common options for md5sum, sha1sum, sha256sum, sha512sum
-#
-CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
-
-#
-# Console Utilities
-#
-CONFIG_CHVT=y
-CONFIG_FGCONSOLE=y
-CONFIG_CLEAR=y
-CONFIG_DEALLOCVT=y
-CONFIG_DUMPKMAP=y
-CONFIG_KBD_MODE=y
-# CONFIG_LOADFONT is not set
-CONFIG_LOADKMAP=y
-CONFIG_OPENVT=y
-CONFIG_RESET=y
-CONFIG_RESIZE=y
-CONFIG_FEATURE_RESIZE_PRINT=y
-CONFIG_SETCONSOLE=y
-CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS=y
-# CONFIG_SETFONT is not set
-# CONFIG_FEATURE_SETFONT_TEXTUAL_MAP is not set
-CONFIG_DEFAULT_SETFONT_DIR=""
-CONFIG_SETKEYCODES=y
-CONFIG_SETLOGCONS=y
-# CONFIG_SHOWKEY is not set
-# CONFIG_FEATURE_LOADFONT_PSF2 is not set
-# CONFIG_FEATURE_LOADFONT_RAW is not set
-
-#
-# Debian Utilities
-#
-CONFIG_MKTEMP=y
-# CONFIG_PIPE_PROGRESS is not set
-CONFIG_RUN_PARTS=y
-CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
-CONFIG_FEATURE_RUN_PARTS_FANCY=y
-CONFIG_START_STOP_DAEMON=y
-CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
-CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
-CONFIG_WHICH=y
-
-#
-# Editors
-#
-CONFIG_PATCH=y
-CONFIG_AWK=y
-# CONFIG_FEATURE_AWK_LIBM is not set
-CONFIG_CMP=y
-CONFIG_DIFF=y
-CONFIG_FEATURE_DIFF_LONG_OPTIONS=y
-CONFIG_FEATURE_DIFF_DIR=y
-# CONFIG_ED is not set
-CONFIG_SED=y
-CONFIG_VI=y
-CONFIG_FEATURE_VI_MAX_LEN=1024
-CONFIG_FEATURE_VI_8BIT=y
-CONFIG_FEATURE_VI_COLON=y
-CONFIG_FEATURE_VI_YANKMARK=y
-CONFIG_FEATURE_VI_SEARCH=y
-CONFIG_FEATURE_VI_USE_SIGNALS=y
-# CONFIG_FEATURE_VI_DOT_CMD is not set
-# CONFIG_FEATURE_VI_READONLY is not set
-# CONFIG_FEATURE_VI_SETOPTS is not set
-# CONFIG_FEATURE_VI_SET is not set
-CONFIG_FEATURE_VI_WIN_RESIZE=y
-CONFIG_FEATURE_VI_ASK_TERMINAL=y
-CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
-CONFIG_FEATURE_ALLOW_EXEC=y
-
-#
-# Finding Utilities
-#
-CONFIG_FIND=y
-CONFIG_FEATURE_FIND_PRINT0=y
-CONFIG_FEATURE_FIND_MTIME=y
-CONFIG_FEATURE_FIND_MMIN=y
-CONFIG_FEATURE_FIND_PERM=y
-CONFIG_FEATURE_FIND_TYPE=y
-CONFIG_FEATURE_FIND_XDEV=y
-CONFIG_FEATURE_FIND_MAXDEPTH=y
-CONFIG_FEATURE_FIND_NEWER=y
-CONFIG_FEATURE_FIND_INUM=y
-CONFIG_FEATURE_FIND_EXEC=y
-CONFIG_FEATURE_FIND_USER=y
-CONFIG_FEATURE_FIND_GROUP=y
-CONFIG_FEATURE_FIND_NOT=y
-CONFIG_FEATURE_FIND_DEPTH=y
-CONFIG_FEATURE_FIND_PAREN=y
-CONFIG_FEATURE_FIND_SIZE=y
-CONFIG_FEATURE_FIND_PRUNE=y
-CONFIG_FEATURE_FIND_DELETE=y
-CONFIG_FEATURE_FIND_PATH=y
-CONFIG_FEATURE_FIND_REGEX=y
-# CONFIG_FEATURE_FIND_CONTEXT is not set
-CONFIG_FEATURE_FIND_LINKS=y
-CONFIG_GREP=y
-CONFIG_FEATURE_GREP_EGREP_ALIAS=y
-CONFIG_FEATURE_GREP_FGREP_ALIAS=y
-CONFIG_FEATURE_GREP_CONTEXT=y
-CONFIG_XARGS=y
-CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION=y
-CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=y
-CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=y
-CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
-
-#
-# Init Utilities
-#
-CONFIG_BOOTCHARTD=y
-CONFIG_FEATURE_BOOTCHARTD_BLOATED_HEADER=y
-CONFIG_FEATURE_BOOTCHARTD_CONFIG_FILE=y
-# CONFIG_HALT is not set
-# CONFIG_FEATURE_CALL_TELINIT is not set
-CONFIG_TELINIT_PATH=""
-# CONFIG_INIT is not set
-# CONFIG_FEATURE_USE_INITTAB is not set
-# CONFIG_FEATURE_KILL_REMOVED is not set
-CONFIG_FEATURE_KILL_DELAY=0
-# CONFIG_FEATURE_INIT_SCTTY is not set
-# CONFIG_FEATURE_INIT_SYSLOG is not set
-# CONFIG_FEATURE_EXTRA_QUIET is not set
-# CONFIG_FEATURE_INIT_COREDUMPS is not set
-# CONFIG_FEATURE_INITRD is not set
-CONFIG_INIT_TERMINAL_TYPE=""
-# CONFIG_MESG is not set
-
-#
-# Login/Password Management Utilities
-#
-# CONFIG_ADD_SHELL is not set
-# CONFIG_REMOVE_SHELL is not set
-# CONFIG_FEATURE_SHADOWPASSWDS is not set
-CONFIG_USE_BB_PWD_GRP=y
-# CONFIG_USE_BB_SHADOW is not set
-CONFIG_USE_BB_CRYPT=y
-CONFIG_USE_BB_CRYPT_SHA=y
-CONFIG_ADDUSER=y
-CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=y
-CONFIG_FEATURE_CHECK_NAMES=y
-CONFIG_FIRST_SYSTEM_ID=100
-CONFIG_LAST_SYSTEM_ID=499
-CONFIG_ADDGROUP=y
-CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS=y
-CONFIG_FEATURE_ADDUSER_TO_GROUP=y
-CONFIG_DELUSER=y
-CONFIG_DELGROUP=y
-CONFIG_FEATURE_DEL_USER_FROM_GROUP=y
-CONFIG_GETTY=y
-CONFIG_LOGIN=y
-# CONFIG_PAM is not set
-CONFIG_LOGIN_SCRIPTS=y
-CONFIG_FEATURE_NOLOGIN=y
-CONFIG_FEATURE_SECURETTY=y
-CONFIG_PASSWD=y
-CONFIG_FEATURE_PASSWD_WEAK_CHECK=y
-CONFIG_CRYPTPW=y
-CONFIG_CHPASSWD=y
-CONFIG_SU=y
-CONFIG_FEATURE_SU_SYSLOG=y
-CONFIG_FEATURE_SU_CHECKS_SHELLS=y
-CONFIG_SULOGIN=y
-# CONFIG_VLOCK is not set
-
-#
-# Linux Ext2 FS Progs
-#
-# CONFIG_CHATTR is not set
-# CONFIG_FSCK is not set
-# CONFIG_LSATTR is not set
-# CONFIG_TUNE2FS is not set
-
-#
-# Linux Module Utilities
-#
-CONFIG_MODINFO=y
-# CONFIG_MODPROBE_SMALL is not set
-# CONFIG_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE is not set
-# CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not set
-# CONFIG_INSMOD is not set
-# CONFIG_RMMOD is not set
-# CONFIG_LSMOD is not set
-# CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT is not set
-# CONFIG_MODPROBE is not set
-# CONFIG_FEATURE_MODPROBE_BLACKLIST is not set
-# CONFIG_DEPMOD is not set
-
-#
-# Options common to multiple modutils
-#
-# CONFIG_FEATURE_2_4_MODULES is not set
-# CONFIG_FEATURE_INSMOD_TRY_MMAP is not set
-# CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
-# CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
-# CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
-# CONFIG_FEATURE_INSMOD_LOAD_MAP is not set
-# CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL is not set
-# CONFIG_FEATURE_CHECK_TAINTED_MODULE is not set
-# CONFIG_FEATURE_MODUTILS_ALIAS is not set
-# CONFIG_FEATURE_MODUTILS_SYMBOLS is not set
-CONFIG_DEFAULT_MODULES_DIR="/lib/modules"
-CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
-
-#
-# Linux System Utilities
-#
-CONFIG_BLOCKDEV=y
-CONFIG_REV=y
-CONFIG_ACPID=y
-CONFIG_FEATURE_ACPID_COMPAT=y
-CONFIG_BLKID=y
-CONFIG_DMESG=y
-CONFIG_FEATURE_DMESG_PRETTY=y
-# CONFIG_FBSET is not set
-# CONFIG_FEATURE_FBSET_FANCY is not set
-# CONFIG_FEATURE_FBSET_READMODE is not set
-# CONFIG_FDFLUSH is not set
-# CONFIG_FDFORMAT is not set
-CONFIG_FDISK=y
-CONFIG_FDISK_SUPPORT_LARGE_DISKS=y
-CONFIG_FEATURE_FDISK_WRITABLE=y
-# CONFIG_FEATURE_AIX_LABEL is not set
-# CONFIG_FEATURE_SGI_LABEL is not set
-# CONFIG_FEATURE_SUN_LABEL is not set
-# CONFIG_FEATURE_OSF_LABEL is not set
-# CONFIG_FEATURE_GPT_LABEL is not set
-CONFIG_FEATURE_FDISK_ADVANCED=y
-CONFIG_FINDFS=y
-CONFIG_FLOCK=y
-CONFIG_FREERAMDISK=y
-# CONFIG_FSCK_MINIX is not set
-CONFIG_MKFS_EXT2=y
-# CONFIG_MKFS_MINIX is not set
-# CONFIG_FEATURE_MINIX2 is not set
-# CONFIG_MKFS_REISER is not set
-CONFIG_MKFS_VFAT=y
-CONFIG_GETOPT=y
-CONFIG_FEATURE_GETOPT_LONG=y
-CONFIG_HEXDUMP=y
-CONFIG_FEATURE_HEXDUMP_REVERSE=y
-CONFIG_HD=y
-CONFIG_HWCLOCK=y
-CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=y
-CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
-# CONFIG_IPCRM is not set
-# CONFIG_IPCS is not set
-CONFIG_LOSETUP=y
-CONFIG_LSPCI=y
-CONFIG_LSUSB=y
-CONFIG_MDEV=y
-CONFIG_FEATURE_MDEV_CONF=y
-CONFIG_FEATURE_MDEV_RENAME=y
-CONFIG_FEATURE_MDEV_RENAME_REGEXP=y
-CONFIG_FEATURE_MDEV_EXEC=y
-CONFIG_FEATURE_MDEV_LOAD_FIRMWARE=y
-CONFIG_MKSWAP=y
-CONFIG_FEATURE_MKSWAP_UUID=y
-CONFIG_MORE=y
-CONFIG_MOUNT=y
-CONFIG_FEATURE_MOUNT_FAKE=y
-CONFIG_FEATURE_MOUNT_VERBOSE=y
-CONFIG_FEATURE_MOUNT_HELPERS=y
-CONFIG_FEATURE_MOUNT_LABEL=y
-CONFIG_FEATURE_MOUNT_NFS=y
-CONFIG_FEATURE_MOUNT_CIFS=y
-CONFIG_FEATURE_MOUNT_FLAGS=y
-CONFIG_FEATURE_MOUNT_FSTAB=y
-CONFIG_PIVOT_ROOT=y
-CONFIG_RDATE=y
-# CONFIG_RDEV is not set
-# CONFIG_READPROFILE is not set
-# CONFIG_RTCWAKE is not set
-CONFIG_SCRIPT=y
-CONFIG_SCRIPTREPLAY=y
-# CONFIG_SETARCH is not set
-CONFIG_SWAPONOFF=y
-CONFIG_FEATURE_SWAPON_PRI=y
-CONFIG_SWITCH_ROOT=y
-CONFIG_UMOUNT=y
-CONFIG_FEATURE_UMOUNT_ALL=y
-
-#
-# Common options for mount/umount
-#
-CONFIG_FEATURE_MOUNT_LOOP=y
-CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
-# CONFIG_FEATURE_MTAB_SUPPORT is not set
-CONFIG_VOLUMEID=y
-
-#
-# Filesystem/Volume identification
-#
-CONFIG_FEATURE_VOLUMEID_EXT=y
-CONFIG_FEATURE_VOLUMEID_BTRFS=y
-# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
-CONFIG_FEATURE_VOLUMEID_FAT=y
-CONFIG_FEATURE_VOLUMEID_HFS=y
-CONFIG_FEATURE_VOLUMEID_JFS=y
-# CONFIG_FEATURE_VOLUMEID_XFS is not set
-CONFIG_FEATURE_VOLUMEID_NTFS=y
-CONFIG_FEATURE_VOLUMEID_ISO9660=y
-CONFIG_FEATURE_VOLUMEID_UDF=y
-CONFIG_FEATURE_VOLUMEID_LUKS=y
-CONFIG_FEATURE_VOLUMEID_LINUXSWAP=y
-# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
-# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
-# CONFIG_FEATURE_VOLUMEID_SYSV is not set
-# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
-CONFIG_FEATURE_VOLUMEID_LINUXRAID=y
-
-#
-# Miscellaneous Utilities
-#
-# CONFIG_CONSPY is not set
-# CONFIG_NANDWRITE is not set
-# CONFIG_NANDDUMP is not set
-# CONFIG_UBIATTACH is not set
-# CONFIG_UBIDETACH is not set
-CONFIG_ADJTIMEX=y
-CONFIG_BBCONFIG=y
-CONFIG_FEATURE_COMPRESS_BBCONFIG=y
-CONFIG_BEEP=y
-CONFIG_FEATURE_BEEP_FREQ=4000
-CONFIG_FEATURE_BEEP_LENGTH_MS=30
-# CONFIG_CHAT is not set
-# CONFIG_FEATURE_CHAT_NOFAIL is not set
-# CONFIG_FEATURE_CHAT_TTY_HIFI is not set
-# CONFIG_FEATURE_CHAT_IMPLICIT_CR is not set
-# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
-# CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
-# CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
-# CONFIG_FEATURE_CHAT_CLR_ABORT is not set
-CONFIG_CHRT=y
-CONFIG_CROND=y
-# CONFIG_FEATURE_CROND_D is not set
-# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
-CONFIG_FEATURE_CROND_DIR="/var/spool/cron"
-CONFIG_CRONTAB=y
-CONFIG_DC=y
-# CONFIG_FEATURE_DC_LIBM is not set
-# CONFIG_DEVFSD is not set
-# CONFIG_DEVFSD_MODLOAD is not set
-# CONFIG_DEVFSD_FG_NP is not set
-# CONFIG_DEVFSD_VERBOSE is not set
-# CONFIG_FEATURE_DEVFS is not set
-# CONFIG_DEVMEM is not set
-# CONFIG_EJECT is not set
-# CONFIG_FEATURE_EJECT_SCSI is not set
-# CONFIG_FBSPLASH is not set
-# CONFIG_FLASHCP is not set
-# CONFIG_FLASH_LOCK is not set
-# CONFIG_FLASH_UNLOCK is not set
-# CONFIG_FLASH_ERASEALL is not set
-CONFIG_IONICE=y
-# CONFIG_INOTIFYD is not set
-# CONFIG_LAST is not set
-# CONFIG_FEATURE_LAST_SMALL is not set
-# CONFIG_FEATURE_LAST_FANCY is not set
-CONFIG_LESS=y
-CONFIG_FEATURE_LESS_MAXLINES=9999999
-CONFIG_FEATURE_LESS_BRACKETS=y
-CONFIG_FEATURE_LESS_FLAGS=y
-CONFIG_FEATURE_LESS_MARKS=y
-CONFIG_FEATURE_LESS_REGEXP=y
-# CONFIG_FEATURE_LESS_WINCH is not set
-# CONFIG_FEATURE_LESS_DASHCMD is not set
-# CONFIG_FEATURE_LESS_LINENUMS is not set
-# CONFIG_HDPARM is not set
-# CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
-# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
-# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
-CONFIG_MAKEDEVS=y
-# CONFIG_FEATURE_MAKEDEVS_LEAF is not set
-CONFIG_FEATURE_MAKEDEVS_TABLE=y
-# CONFIG_MAN is not set
-CONFIG_MICROCOM=y
-CONFIG_MOUNTPOINT=y
-# CONFIG_MT is not set
-CONFIG_RAIDAUTORUN=y
-CONFIG_READAHEAD=y
-# CONFIG_RFKILL is not set
-CONFIG_RUNLEVEL=y
-CONFIG_RX=y
-# CONFIG_SETSID is not set
-CONFIG_STRINGS=y
-# CONFIG_TASKSET is not set
-# CONFIG_FEATURE_TASKSET_FANCY is not set
-CONFIG_TIME=y
-CONFIG_TIMEOUT=y
-# CONFIG_TTYSIZE is not set
-CONFIG_VOLNAME=y
-CONFIG_WALL=y
-CONFIG_WATCHDOG=y
-
-#
-# Networking Utilities
-#
-CONFIG_NBDCLIENT=y
-CONFIG_NC=y
-CONFIG_NC_SERVER=y
-CONFIG_NC_EXTRA=y
-# CONFIG_NC_110_COMPAT is not set
-CONFIG_FEATURE_IPV6=y
-# CONFIG_FEATURE_UNIX_LOCAL is not set
-CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
-CONFIG_VERBOSE_RESOLUTION_ERRORS=y
-CONFIG_ARP=y
-CONFIG_ARPING=y
-CONFIG_BRCTL=y
-CONFIG_FEATURE_BRCTL_FANCY=y
-CONFIG_FEATURE_BRCTL_SHOW=y
-# CONFIG_DNSD is not set
-# CONFIG_ETHER_WAKE is not set
-# CONFIG_FAKEIDENTD is not set
-CONFIG_FTPD=y
-CONFIG_FEATURE_FTP_WRITE=y
-CONFIG_FEATURE_FTPD_ACCEPT_BROKEN_LIST=y
-# CONFIG_FTPGET is not set
-# CONFIG_FTPPUT is not set
-# CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
-CONFIG_HOSTNAME=y
-CONFIG_HTTPD=y
-CONFIG_FEATURE_HTTPD_RANGES=y
-CONFIG_FEATURE_HTTPD_USE_SENDFILE=y
-CONFIG_FEATURE_HTTPD_SETUID=y
-CONFIG_FEATURE_HTTPD_BASIC_AUTH=y
-CONFIG_FEATURE_HTTPD_AUTH_MD5=y
-CONFIG_FEATURE_HTTPD_CGI=y
-CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR=y
-CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV=y
-CONFIG_FEATURE_HTTPD_ENCODE_URL_STR=y
-CONFIG_FEATURE_HTTPD_ERROR_PAGES=y
-CONFIG_FEATURE_HTTPD_PROXY=y
-CONFIG_FEATURE_HTTPD_GZIP=y
-CONFIG_IFCONFIG=y
-CONFIG_FEATURE_IFCONFIG_STATUS=y
-# CONFIG_FEATURE_IFCONFIG_SLIP is not set
-# CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ is not set
-CONFIG_FEATURE_IFCONFIG_HW=y
-CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS=y
-# CONFIG_IFENSLAVE is not set
-CONFIG_IFPLUGD=y
-CONFIG_IFUPDOWN=y
-CONFIG_IFUPDOWN_IFSTATE_PATH="/var/run/ifstate"
-# CONFIG_FEATURE_IFUPDOWN_IP is not set
-# CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
-CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN=y
-CONFIG_FEATURE_IFUPDOWN_IPV4=y
-CONFIG_FEATURE_IFUPDOWN_IPV6=y
-# CONFIG_FEATURE_IFUPDOWN_MAPPING is not set
-# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
-# CONFIG_INETD is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
-# CONFIG_FEATURE_INETD_RPC is not set
-CONFIG_IP=y
-CONFIG_FEATURE_IP_ADDRESS=y
-CONFIG_FEATURE_IP_LINK=y
-CONFIG_FEATURE_IP_ROUTE=y
-CONFIG_FEATURE_IP_TUNNEL=y
-CONFIG_FEATURE_IP_RULE=y
-CONFIG_FEATURE_IP_SHORT_FORMS=y
-# CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
-CONFIG_IPADDR=y
-CONFIG_IPLINK=y
-CONFIG_IPROUTE=y
-CONFIG_IPTUNNEL=y
-CONFIG_IPRULE=y
-CONFIG_IPCALC=y
-CONFIG_FEATURE_IPCALC_FANCY=y
-CONFIG_FEATURE_IPCALC_LONG_OPTIONS=y
-# CONFIG_NAMEIF is not set
-# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
-CONFIG_NETSTAT=y
-CONFIG_FEATURE_NETSTAT_WIDE=y
-# CONFIG_FEATURE_NETSTAT_PRG is not set
-CONFIG_NSLOOKUP=y
-CONFIG_NTPD=y
-CONFIG_FEATURE_NTPD_SERVER=y
-CONFIG_PING=y
-CONFIG_PING6=y
-CONFIG_FEATURE_FANCY_PING=y
-CONFIG_PSCAN=y
-CONFIG_ROUTE=y
-# CONFIG_SLATTACH is not set
-# CONFIG_TCPSVD is not set
-CONFIG_TELNET=y
-CONFIG_FEATURE_TELNET_TTYPE=y
-CONFIG_FEATURE_TELNET_AUTOLOGIN=y
-# CONFIG_TELNETD is not set
-# CONFIG_FEATURE_TELNETD_STANDALONE is not set
-# CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
-CONFIG_TFTP=y
-# CONFIG_TFTPD is not set
-
-#
-# Common options for tftp/tftpd
-#
-CONFIG_FEATURE_TFTP_GET=y
-CONFIG_FEATURE_TFTP_PUT=y
-CONFIG_FEATURE_TFTP_BLOCKSIZE=y
-CONFIG_FEATURE_TFTP_PROGRESS_BAR=y
-# CONFIG_TFTP_DEBUG is not set
-CONFIG_TRACEROUTE=y
-CONFIG_TRACEROUTE6=y
-CONFIG_FEATURE_TRACEROUTE_VERBOSE=y
-CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE=y
-# CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
-CONFIG_TUNCTL=y
-CONFIG_FEATURE_TUNCTL_UG=y
-# CONFIG_UDHCPD is not set
-# CONFIG_DHCPRELAY is not set
-# CONFIG_DUMPLEASES is not set
-# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
-CONFIG_DHCPD_LEASES_FILE=""
-CONFIG_UDHCPC=y
-CONFIG_FEATURE_UDHCPC_ARPING=y
-# CONFIG_FEATURE_UDHCP_PORT is not set
-CONFIG_UDHCP_DEBUG=9
-# CONFIG_FEATURE_UDHCP_RFC3397 is not set
-CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
-CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=120
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
-# CONFIG_UDPSVD is not set
-CONFIG_VCONFIG=y
-CONFIG_WGET=y
-CONFIG_FEATURE_WGET_STATUSBAR=y
-CONFIG_FEATURE_WGET_AUTHENTICATION=y
-CONFIG_FEATURE_WGET_LONG_OPTIONS=y
-CONFIG_FEATURE_WGET_TIMEOUT=y
-# CONFIG_ZCIP is not set
-
-#
-# Print Utilities
-#
-# CONFIG_LPD is not set
-# CONFIG_LPR is not set
-# CONFIG_LPQ is not set
-
-#
-# Mail Utilities
-#
-# CONFIG_MAKEMIME is not set
-CONFIG_FEATURE_MIME_CHARSET=""
-# CONFIG_POPMAILDIR is not set
-# CONFIG_FEATURE_POPMAILDIR_DELIVERY is not set
-# CONFIG_REFORMIME is not set
-# CONFIG_FEATURE_REFORMIME_COMPAT is not set
-# CONFIG_SENDMAIL is not set
-
-#
-# Process Utilities
-#
-CONFIG_IOSTAT=y
-CONFIG_MPSTAT=y
-CONFIG_PMAP=y
-CONFIG_POWERTOP=y
-CONFIG_SMEMCAP=y
-CONFIG_FREE=y
-CONFIG_FUSER=y
-CONFIG_KILL=y
-CONFIG_KILLALL=y
-CONFIG_KILLALL5=y
-# CONFIG_NMETER is not set
-# CONFIG_PGREP is not set
-CONFIG_PIDOF=y
-CONFIG_FEATURE_PIDOF_SINGLE=y
-CONFIG_FEATURE_PIDOF_OMIT=y
-CONFIG_PKILL=y
-CONFIG_PS=y
-CONFIG_FEATURE_PS_WIDE=y
-# CONFIG_FEATURE_PS_TIME is not set
-# CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is not set
-# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
-CONFIG_RENICE=y
-CONFIG_BB_SYSCTL=y
-CONFIG_TOP=y
-CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE=y
-CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
-# CONFIG_FEATURE_TOP_SMP_CPU is not set
-CONFIG_FEATURE_TOP_DECIMALS=y
-# CONFIG_FEATURE_TOP_SMP_PROCESS is not set
-CONFIG_FEATURE_TOPMEM=y
-CONFIG_FEATURE_SHOW_THREADS=y
-CONFIG_UPTIME=y
-CONFIG_WATCH=y
-
-#
-# Runit Utilities
-#
-# CONFIG_RUNSV is not set
-# CONFIG_RUNSVDIR is not set
-# CONFIG_FEATURE_RUNSVDIR_LOG is not set
-# CONFIG_SV is not set
-CONFIG_SV_DEFAULT_SERVICE_DIR=""
-# CONFIG_SVLOGD is not set
-# CONFIG_CHPST is not set
-# CONFIG_SETUIDGID is not set
-# CONFIG_ENVUIDGID is not set
-# CONFIG_ENVDIR is not set
-# CONFIG_SOFTLIMIT is not set
-# CONFIG_CHCON is not set
-# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
-# CONFIG_GETENFORCE is not set
-# CONFIG_GETSEBOOL is not set
-# CONFIG_LOAD_POLICY is not set
-# CONFIG_MATCHPATHCON is not set
-# CONFIG_RESTORECON is not set
-# CONFIG_RUNCON is not set
-# CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
-# CONFIG_SELINUXENABLED is not set
-# CONFIG_SETENFORCE is not set
-# CONFIG_SETFILES is not set
-# CONFIG_FEATURE_SETFILES_CHECK_OPTION is not set
-# CONFIG_SETSEBOOL is not set
-# CONFIG_SESTATUS is not set
-
-#
-# Shells
-#
-CONFIG_ASH=y
-CONFIG_ASH_BASH_COMPAT=y
-CONFIG_ASH_JOB_CONTROL=y
-CONFIG_ASH_ALIAS=y
-CONFIG_ASH_GETOPTS=y
-CONFIG_ASH_BUILTIN_ECHO=y
-CONFIG_ASH_BUILTIN_PRINTF=y
-CONFIG_ASH_BUILTIN_TEST=y
-CONFIG_ASH_CMDCMD=y
-# CONFIG_ASH_MAIL is not set
-CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
-CONFIG_ASH_RANDOM_SUPPORT=y
-CONFIG_ASH_EXPAND_PRMT=y
-CONFIG_CTTYHACK=y
-# CONFIG_HUSH is not set
-# CONFIG_HUSH_BASH_COMPAT is not set
-# CONFIG_HUSH_BRACE_EXPANSION is not set
-# CONFIG_HUSH_HELP is not set
-# CONFIG_HUSH_INTERACTIVE is not set
-# CONFIG_HUSH_SAVEHISTORY is not set
-# CONFIG_HUSH_JOB is not set
-# CONFIG_HUSH_TICK is not set
-# CONFIG_HUSH_IF is not set
-# CONFIG_HUSH_LOOPS is not set
-# CONFIG_HUSH_CASE is not set
-# CONFIG_HUSH_FUNCTIONS is not set
-# CONFIG_HUSH_LOCAL is not set
-# CONFIG_HUSH_RANDOM_SUPPORT is not set
-# CONFIG_HUSH_EXPORT_N is not set
-# CONFIG_HUSH_MODE_X is not set
-# CONFIG_MSH is not set
-CONFIG_FEATURE_SH_IS_ASH=y
-# CONFIG_FEATURE_SH_IS_HUSH is not set
-# CONFIG_FEATURE_SH_IS_NONE is not set
-# CONFIG_FEATURE_BASH_IS_ASH is not set
-# CONFIG_FEATURE_BASH_IS_HUSH is not set
-CONFIG_FEATURE_BASH_IS_NONE=y
-CONFIG_SH_MATH_SUPPORT=y
-CONFIG_SH_MATH_SUPPORT_64=y
-CONFIG_FEATURE_SH_EXTRA_QUIET=y
-# CONFIG_FEATURE_SH_STANDALONE is not set
-# CONFIG_FEATURE_SH_NOFORK is not set
-
-#
-# System Logging Utilities
-#
-CONFIG_SYSLOGD=y
-CONFIG_FEATURE_ROTATE_LOGFILE=y
-CONFIG_FEATURE_REMOTE_LOG=y
-CONFIG_FEATURE_SYSLOGD_DUP=y
-CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
-CONFIG_FEATURE_IPC_SYSLOG=y
-CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=16
-CONFIG_LOGREAD=y
-CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=y
-CONFIG_KLOGD=y
-CONFIG_FEATURE_KLOGD_KLOGCTL=y
-CONFIG_LOGGER=y
diff --git a/recipes/busybox/busybox-1.18.0/udhcpc-fix-nfsroot.patch b/recipes/busybox/busybox-1.18.0/udhcpc-fix-nfsroot.patch
deleted file mode 100644
index 3b975b6..0000000
--- a/recipes/busybox/busybox-1.18.0/udhcpc-fix-nfsroot.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Index: busybox-1.15.1/examples/udhcp/simple.script
-===================================================================
---- busybox-1.15.1.orig/examples/udhcp/simple.script	2009-09-16 22:52:09.000000000 +0200
-+++ busybox-1.15.1/examples/udhcp/simple.script	2009-09-16 22:57:11.424608476 +0200
-@@ -10,10 +10,17 @@ NETMASK=""
- BROADCAST="broadcast +"
- [ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
- 
-+# return 0 if root is mounted on a network filesystem
-+root_is_nfs() {
-+	grep -qe '^/dev/root.*\(nfs\|smbfs\|ncp\|coda\) .*' /proc/mounts
-+}
-+
- case "$1" in
- 	deconfig)
-+		if ! root_is_nfs ; then
- 		echo "Setting IP address 0.0.0.0 on $interface"
--		ifconfig $interface 0.0.0.0
-+			ifconfig $interface 0.0.0.0
-+		fi
- 		;;
- 
- 	renew|bound)
-@@ -21,15 +28,18 @@ case "$1" in
- 		ifconfig $interface $ip $NETMASK $BROADCAST
- 
- 		if [ -n "$router" ] ; then
--			echo "Deleting routers"
--			while route del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
--				:
--			done
-+			if ! root_is_nfs ; then
-+				echo "Deleting routers"
-+				while route del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
-+					:
-+				done
-+			:
-+		done
- 
- 			metric=0
- 			for i in $router ; do
- 				echo "Adding router $i"
--				route add default gw $i dev $interface metric $((metric++))
-+				route add default gw $i dev $interface metric $((metric++)) 2>/dev/null
- 			done
- 		fi
- 
diff --git a/recipes/busybox/busybox-1.18.0/udhcpscript.patch b/recipes/busybox/busybox-1.18.0/udhcpscript.patch
deleted file mode 100644
index 2ffba95..0000000
--- a/recipes/busybox/busybox-1.18.0/udhcpscript.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: busybox-1.15.1/examples/udhcp/simple.script
-===================================================================
---- busybox-1.15.1.orig/examples/udhcp/simple.script	2009-09-12 17:55:36.000000000 +0200
-+++ busybox-1.15.1/examples/udhcp/simple.script	2009-09-16 22:51:06.599693412 +0200
-@@ -22,7 +22,7 @@ case "$1" in
- 
- 		if [ -n "$router" ] ; then
- 			echo "Deleting routers"
--			while route del default gw 0.0.0.0 dev $interface ; do
-+			while route del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
- 				:
- 			done
- 
diff --git a/recipes/busybox/busybox-1.18.1/B921600.patch b/recipes/busybox/busybox-1.18.1/B921600.patch
new file mode 100644
index 0000000..61cc32b
--- /dev/null
+++ b/recipes/busybox/busybox-1.18.1/B921600.patch
@@ -0,0 +1,13 @@
+diff -upNr busybox-1.7.2/libbb/speed_table.c busybox-1.7.2-921600/libbb/speed_table.c
+--- busybox-1.7.2/libbb/speed_table.c	2007-09-03 13:48:41.000000000 +0200
++++ busybox-1.7.2-921600/libbb/speed_table.c	2008-10-09 16:23:26.269592899 +0200
+@@ -52,6 +52,9 @@ static const struct speed_map speeds[] =
+ #ifdef B460800
+ 	{B460800, 460800/256 + 0x8000U},
+ #endif
++#ifdef B921600
++	{B921600, 921600/256 + 0x8000U},
++#endif
+ };
+ 
+ enum { NUM_SPEEDS = ARRAY_SIZE(speeds) };
diff --git a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-cpio.patch b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-cpio.patch
new file mode 100644
index 0000000..135f809
--- /dev/null
+++ b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-cpio.patch
@@ -0,0 +1,20 @@
+diff -urpN busybox-1.18.1/archival/cpio.c busybox-1.18.1-cpio/archival/cpio.c
+--- busybox-1.18.1/archival/cpio.c	2010-12-20 01:41:26.000000000 +0100
++++ busybox-1.18.1-cpio/archival/cpio.c	2010-12-26 02:26:38.000000000 +0100
+@@ -308,16 +308,12 @@ int cpio_main(int argc UNUSED_PARAM, cha
+ 	/* -L makes sense only with -o or -p */
+ 
+ #if !ENABLE_FEATURE_CPIO_O
+-	/* no parameters */
+-	opt_complementary = "=0";
+ 	opt = getopt32(argv, OPTION_STR, &cpio_filename);
+ 	argv += optind;
+ 	if (opt & CPIO_OPT_FILE) { /* -F */
+ 		xmove_fd(xopen(cpio_filename, O_RDONLY), STDIN_FILENO);
+ 	}
+ #else
+-	/* _exactly_ one parameter for -p, thus <= 1 param if -p is allowed */
+-	opt_complementary = ENABLE_FEATURE_CPIO_P ? "?1" : "=0";
+ 	opt = getopt32(argv, OPTION_STR "oH:" IF_FEATURE_CPIO_P("p"), &cpio_filename, &cpio_fmt);
+ 	argv += optind;
+ 	if ((opt & (CPIO_OPT_FILE|CPIO_OPT_CREATE)) == CPIO_OPT_FILE) { /* -F without -o */
diff --git a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
new file mode 100644
index 0000000..3e189a9
--- /dev/null
+++ b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
@@ -0,0 +1,241 @@
+diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1-hush/shell/hush.c
+--- busybox-1.18.1/shell/hush.c	2010-12-21 05:31:04.000000000 +0100
++++ busybox-1.18.1-hush/shell/hush.c	2010-12-21 21:20:02.493651813 +0100
+@@ -913,7 +913,7 @@ static const struct built_in_command blt
+  */
+ #if HUSH_DEBUG
+ /* prevent disasters with G.debug_indent < 0 */
+-# define indent() fprintf(stderr, "%*s", (G.debug_indent * 2) & 0xff, "")
++# define indent() fdprintf(2, "%*s", (G.debug_indent * 2) & 0xff, "")
+ # define debug_enter() (G.debug_indent++)
+ # define debug_leave() (G.debug_indent--)
+ #else
+@@ -923,56 +923,56 @@ static const struct built_in_command blt
+ #endif
+ 
+ #ifndef debug_printf
+-# define debug_printf(...) (indent(), fprintf(stderr, __VA_ARGS__))
++# define debug_printf(...) (indent(), fdprintf(2, __VA_ARGS__))
+ #endif
+ 
+ #ifndef debug_printf_parse
+-# define debug_printf_parse(...) (indent(), fprintf(stderr, __VA_ARGS__))
++# define debug_printf_parse(...) (indent(), fdprintf(2, __VA_ARGS__))
+ #endif
+ 
+ #ifndef debug_printf_exec
+-#define debug_printf_exec(...) (indent(), fprintf(stderr, __VA_ARGS__))
++#define debug_printf_exec(...) (indent(), fdprintf(2, __VA_ARGS__))
+ #endif
+ 
+ #ifndef debug_printf_env
+-# define debug_printf_env(...) (indent(), fprintf(stderr, __VA_ARGS__))
++# define debug_printf_env(...) (indent(), fdprintf(2, __VA_ARGS__))
+ #endif
+ 
+ #ifndef debug_printf_jobs
+-# define debug_printf_jobs(...) (indent(), fprintf(stderr, __VA_ARGS__))
++# define debug_printf_jobs(...) (indent(), fdprintf(2, __VA_ARGS__))
+ # define DEBUG_JOBS 1
+ #else
+ # define DEBUG_JOBS 0
+ #endif
+ 
+ #ifndef debug_printf_expand
+-# define debug_printf_expand(...) (indent(), fprintf(stderr, __VA_ARGS__))
++# define debug_printf_expand(...) (indent(), fdprintf(2, __VA_ARGS__))
+ # define DEBUG_EXPAND 1
+ #else
+ # define DEBUG_EXPAND 0
+ #endif
+ 
+ #ifndef debug_printf_varexp
+-# define debug_printf_varexp(...) (indent(), fprintf(stderr, __VA_ARGS__))
++# define debug_printf_varexp(...) (indent(), fdprintf(2, __VA_ARGS__))
+ #endif
+ 
+ #ifndef debug_printf_glob
+-# define debug_printf_glob(...) (indent(), fprintf(stderr, __VA_ARGS__))
++# define debug_printf_glob(...) (indent(), fdprintf(2, __VA_ARGS__))
+ # define DEBUG_GLOB 1
+ #else
+ # define DEBUG_GLOB 0
+ #endif
+ 
+ #ifndef debug_printf_list
+-# define debug_printf_list(...) (indent(), fprintf(stderr, __VA_ARGS__))
++# define debug_printf_list(...) (indent(), fdprintf(2, __VA_ARGS__))
+ #endif
+ 
+ #ifndef debug_printf_subst
+-# define debug_printf_subst(...) (indent(), fprintf(stderr, __VA_ARGS__))
++# define debug_printf_subst(...) (indent(), fdprintf(2, __VA_ARGS__))
+ #endif
+ 
+ #ifndef debug_printf_clean
+-# define debug_printf_clean(...) (indent(), fprintf(stderr, __VA_ARGS__))
++# define debug_printf_clean(...) (indent(), fdprintf(2, __VA_ARGS__))
+ # define DEBUG_CLEAN 1
+ #else
+ # define DEBUG_CLEAN 0
+@@ -982,9 +982,9 @@ static const struct built_in_command blt
+ static void debug_print_strings(const char *prefix, char **vv)
+ {
+ 	indent();
+-	fprintf(stderr, "%s:\n", prefix);
++	fdprintf(2, "%s:\n", prefix);
+ 	while (*vv)
+-		fprintf(stderr, " '%s'\n", *vv++);
++		fdprintf(2, " '%s'\n", *vv++);
+ }
+ #else
+ # define debug_print_strings(prefix, vv) ((void)0)
+@@ -1416,6 +1416,22 @@ static void hush_exit(int exitcode)
+ 		builtin_eval(argv);
+ 	}
+ 
++#if ENABLE_FEATURE_CLEAN_UP
++	{
++		struct variable *cur_var;
++		if (G.cwd != bb_msg_unknown)
++			free((char*)G.cwd);
++		cur_var = G.top_var;
++		while (cur_var) {
++			struct variable *tmp = cur_var;
++			if (!cur_var->max_len)
++				free(cur_var->varstr);
++			cur_var = cur_var->next;
++			free(tmp);
++		}
++	}
++#endif
++
+ #if ENABLE_HUSH_JOB
+ 	fflush_all();
+ 	sigexit(- (exitcode & 0xff));
+@@ -2158,22 +2174,22 @@ static void debug_print_list(const char 
+ 	int i = 0;
+ 
+ 	indent();
+-	fprintf(stderr, "%s: list:%p n:%d string_start:%d length:%d maxlen:%d glob:%d quoted:%d escape:%d\n",
++	fdprintf(2, "%s: list:%p n:%d string_start:%d length:%d maxlen:%d glob:%d quoted:%d escape:%d\n",
+ 			prefix, list, n, string_start, o->length, o->maxlen,
+ 			!!(o->o_expflags & EXP_FLAG_GLOB),
+ 			o->has_quoted_part,
+ 			!!(o->o_expflags & EXP_FLAG_ESC_GLOB_CHARS));
+ 	while (i < n) {
+ 		indent();
+-		fprintf(stderr, " list[%d]=%d '%s' %p\n", i, (int)list[i],
+-				o->data + (int)list[i] + string_start,
+-				o->data + (int)list[i] + string_start);
++		fdprintf(2, " list[%d]=%d '%s' %p\n", i, (int)(uintptr_t)list[i],
++				o->data + (int)(uintptr_t)list[i] + string_start,
++				o->data + (int)(uintptr_t)list[i] + string_start);
+ 		i++;
+ 	}
+ 	if (n) {
+-		const char *p = o->data + (int)list[n - 1] + string_start;
++		const char *p = o->data + (int)(uintptr_t)list[n - 1] + string_start;
+ 		indent();
+-		fprintf(stderr, " total_sz:%ld\n", (long)((p + strlen(p) + 1) - o->data));
++		fdprintf(2, " total_sz:%ld\n", (long)((p + strlen(p) + 1) - o->data));
+ 	}
+ }
+ #else
+@@ -2672,18 +2688,18 @@ static void debug_print_tree(struct pipe
+ 
+ 	pin = 0;
+ 	while (pi) {
+-		fprintf(stderr, "%*spipe %d res_word=%s followup=%d %s\n", lvl*2, "",
++		fdprintf(2, "%*spipe %d res_word=%s followup=%d %s\n", lvl*2, "",
+ 				pin, RES[pi->res_word], pi->followup, PIPE[pi->followup]);
+ 		prn = 0;
+ 		while (prn < pi->num_cmds) {
+ 			struct command *command = &pi->cmds[prn];
+ 			char **argv = command->argv;
+ 
+-			fprintf(stderr, "%*s cmd %d assignment_cnt:%d",
++			fdprintf(2, "%*s cmd %d assignment_cnt:%d",
+ 					lvl*2, "", prn,
+ 					command->assignment_cnt);
+ 			if (command->group) {
+-				fprintf(stderr, " group %s: (argv=%p)%s%s\n",
++				fdprintf(2, " group %s: (argv=%p)%s%s\n",
+ 						CMDTYPE[command->cmd_type],
+ 						argv
+ # if !BB_MMU
+@@ -2697,10 +2713,10 @@ static void debug_print_tree(struct pipe
+ 				continue;
+ 			}
+ 			if (argv) while (*argv) {
+-				fprintf(stderr, " '%s'", *argv);
++				fdprintf(2, " '%s'", *argv);
+ 				argv++;
+ 			}
+-			fprintf(stderr, "\n");
++			fdprintf(2, "\n");
+ 			prn++;
+ 		}
+ 		pi = pi->next;
+@@ -7445,7 +7461,7 @@ int hush_main(int argc, char **argv)
+ 	unsigned builtin_argc;
+ 	char **e;
+ 	struct variable *cur_var;
+-	struct variable shell_ver;
++	struct variable *shell_ver;
+ 
+ 	INIT_G();
+ 	if (EXIT_SUCCESS) /* if EXIT_SUCCESS == 0, it is already done */
+@@ -7454,17 +7470,17 @@ int hush_main(int argc, char **argv)
+ 	G.argv0_for_re_execing = argv[0];
+ #endif
+ 	/* Deal with HUSH_VERSION */
+-	memset(&shell_ver, 0, sizeof(shell_ver));
+-	shell_ver.flg_export = 1;
+-	shell_ver.flg_read_only = 1;
++	shell_ver = xzalloc(sizeof(*shell_ver));
++	shell_ver->flg_export = 1;
++	shell_ver->flg_read_only = 1;
+ 	/* Code which handles ${var<op>...} needs writable values for all variables,
+ 	 * therefore we xstrdup: */
+-	shell_ver.varstr = xstrdup(hush_version_str),
+-	G.top_var = &shell_ver;
++	shell_ver->varstr = xstrdup(hush_version_str);
+ 	/* Create shell local variables from the values
+ 	 * currently living in the environment */
+ 	debug_printf_env("unsetenv '%s'\n", "HUSH_VERSION");
+ 	unsetenv("HUSH_VERSION"); /* in case it exists in initial env */
++	G.top_var = shell_ver;
+ 	cur_var = G.top_var;
+ 	e = environ;
+ 	if (e) while (*e) {
+@@ -7479,8 +7495,8 @@ int hush_main(int argc, char **argv)
+ 		e++;
+ 	}
+ 	/* (Re)insert HUSH_VERSION into env (AFTER we scanned the env!) */
+-	debug_printf_env("putenv '%s'\n", shell_ver.varstr);
+-	putenv(shell_ver.varstr);
++	debug_printf_env("putenv '%s'\n", shell_ver->varstr);
++	putenv(shell_ver->varstr);
+ 
+ 	/* Export PWD */
+ 	set_pwd_var(/*exp:*/ 1);
+@@ -7840,18 +7856,6 @@ int hush_main(int argc, char **argv)
+ 	parse_and_run_file(stdin);
+ 
+  final_return:
+-#if ENABLE_FEATURE_CLEAN_UP
+-	if (G.cwd != bb_msg_unknown)
+-		free((char*)G.cwd);
+-	cur_var = G.top_var->next;
+-	while (cur_var) {
+-		struct variable *tmp = cur_var;
+-		if (!cur_var->max_len)
+-			free(cur_var->varstr);
+-		cur_var = cur_var->next;
+-		free(tmp);
+-	}
+-#endif
+ 	hush_exit(G.last_exitcode);
+ }
+ 
diff --git a/recipes/busybox/busybox-1.18.1/defconfig b/recipes/busybox/busybox-1.18.1/defconfig
new file mode 100644
index 0000000..5a6870c
--- /dev/null
+++ b/recipes/busybox/busybox-1.18.1/defconfig
@@ -0,0 +1,873 @@
+#
+# Automatically generated make config: don't edit
+# Busybox version: 1.13.2
+# Sun Feb  8 17:22:39 2009
+#
+CONFIG_HAVE_DOT_CONFIG=y
+
+#
+# Busybox Settings
+#
+
+#
+# General Configuration
+#
+# CONFIG_DESKTOP is not set
+# CONFIG_EXTRA_COMPAT is not set
+CONFIG_FEATURE_ASSUME_UNICODE=y
+CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
+# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
+# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
+CONFIG_SHOW_USAGE=y
+CONFIG_FEATURE_VERBOSE_USAGE=y
+CONFIG_FEATURE_COMPRESS_USAGE=y
+# CONFIG_FEATURE_INSTALLER is not set
+CONFIG_LOCALE_SUPPORT=y
+CONFIG_GETOPT_LONG=y
+CONFIG_FEATURE_DEVPTS=y
+# CONFIG_FEATURE_CLEAN_UP is not set
+CONFIG_FEATURE_PIDFILE=y
+CONFIG_FEATURE_SUID=y
+CONFIG_FEATURE_SUID_CONFIG=y
+CONFIG_FEATURE_SUID_CONFIG_QUIET=y
+# CONFIG_SELINUX is not set
+# CONFIG_FEATURE_PREFER_APPLETS is not set
+CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
+CONFIG_FEATURE_SYSLOG=y
+CONFIG_FEATURE_HAVE_RPC=y
+
+#
+# Build Options
+#
+# CONFIG_STATIC is not set
+# CONFIG_PIE is not set
+# CONFIG_NOMMU is not set
+# CONFIG_BUILD_LIBBUSYBOX is not set
+# CONFIG_FEATURE_INDIVIDUAL is not set
+# CONFIG_FEATURE_SHARED_BUSYBOX is not set
+CONFIG_LFS=y
+CONFIG_CROSS_COMPILER_PREFIX=""
+
+#
+# Debugging Options
+#
+# CONFIG_DEBUG is not set
+# CONFIG_DEBUG_PESSIMIZE is not set
+# CONFIG_WERROR is not set
+CONFIG_NO_DEBUG_LIB=y
+# CONFIG_DMALLOC is not set
+# CONFIG_EFENCE is not set
+# CONFIG_INCLUDE_SUSv2 is not set
+
+#
+# Installation Options
+#
+# CONFIG_INSTALL_NO_USR is not set
+CONFIG_INSTALL_APPLET_SYMLINKS=y
+# CONFIG_INSTALL_APPLET_HARDLINKS is not set
+# CONFIG_INSTALL_APPLET_SCRIPT_WRAPPERS is not set
+# CONFIG_INSTALL_APPLET_DONT is not set
+# CONFIG_INSTALL_SH_APPLET_SYMLINK is not set
+# CONFIG_INSTALL_SH_APPLET_HARDLINK is not set
+# CONFIG_INSTALL_SH_APPLET_SCRIPT_WRAPPER is not set
+CONFIG_PREFIX="./_install"
+
+#
+# Busybox Library Tuning
+#
+CONFIG_PASSWORD_MINLEN=6
+CONFIG_MD5_SIZE_VS_SPEED=2
+CONFIG_FEATURE_FAST_TOP=y
+# CONFIG_FEATURE_ETC_NETWORKS is not set
+CONFIG_FEATURE_EDITING=y
+CONFIG_FEATURE_EDITING_MAX_LEN=1024
+# CONFIG_FEATURE_EDITING_VI is not set
+CONFIG_FEATURE_EDITING_HISTORY=64
+CONFIG_FEATURE_EDITING_SAVEHISTORY=y
+CONFIG_FEATURE_TAB_COMPLETION=y
+CONFIG_FEATURE_USERNAME_COMPLETION=y
+CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
+CONFIG_FEATURE_VERBOSE_CP_MESSAGE=y
+CONFIG_FEATURE_COPYBUF_KB=4
+CONFIG_MONOTONIC_SYSCALL=y
+CONFIG_IOCTL_HEX2STR_ERROR=y
+CONFIG_FEATURE_HWIB=y
+
+#
+# Applets
+#
+
+#
+# Archival Utilities
+#
+# CONFIG_FEATURE_SEAMLESS_LZMA is not set
+CONFIG_FEATURE_SEAMLESS_BZ2=y
+CONFIG_FEATURE_SEAMLESS_GZ=y
+CONFIG_FEATURE_SEAMLESS_Z=y
+CONFIG_AR=y
+# CONFIG_FEATURE_AR_LONG_FILENAMES is not set
+CONFIG_BUNZIP2=y
+# CONFIG_BZIP2 is not set
+CONFIG_CPIO=y
+# CONFIG_FEATURE_CPIO_O is not set
+# CONFIG_DPKG is not set
+# CONFIG_DPKG_DEB is not set
+# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
+CONFIG_GUNZIP=y
+CONFIG_GZIP=y
+# CONFIG_RPM2CPIO is not set
+# CONFIG_RPM is not set
+CONFIG_TAR=y
+CONFIG_FEATURE_TAR_CREATE=y
+CONFIG_FEATURE_TAR_AUTODETECT=y
+CONFIG_FEATURE_TAR_FROM=y
+CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY=y
+# CONFIG_FEATURE_TAR_OLDSUN_COMPATIBILITY is not set
+CONFIG_FEATURE_TAR_GNU_EXTENSIONS=y
+CONFIG_FEATURE_TAR_LONG_OPTIONS=y
+CONFIG_FEATURE_TAR_UNAME_GNAME=y
+# CONFIG_UNCOMPRESS is not set
+# CONFIG_UNLZMA is not set
+# CONFIG_FEATURE_LZMA_FAST is not set
+CONFIG_UNZIP=y
+
+#
+# Coreutils
+#
+CONFIG_BASENAME=y
+# CONFIG_CAL is not set
+CONFIG_CAT=y
+# CONFIG_CATV is not set
+CONFIG_CHGRP=y
+CONFIG_CHMOD=y
+CONFIG_CHOWN=y
+CONFIG_CHROOT=y
+# CONFIG_CKSUM is not set
+# CONFIG_COMM is not set
+CONFIG_CP=y
+CONFIG_CUT=y
+CONFIG_DATE=y
+CONFIG_FEATURE_DATE_ISOFMT=y
+CONFIG_DD=y
+CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
+# CONFIG_FEATURE_DD_IBS_OBS is not set
+CONFIG_DF=y
+CONFIG_FEATURE_DF_FANCY=y
+CONFIG_DIRNAME=y
+# CONFIG_DOS2UNIX is not set
+# CONFIG_UNIX2DOS is not set
+CONFIG_DU=y
+CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
+CONFIG_ECHO=y
+CONFIG_FEATURE_FANCY_ECHO=y
+CONFIG_ENV=y
+CONFIG_FEATURE_ENV_LONG_OPTIONS=y
+# CONFIG_EXPAND is not set
+# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
+CONFIG_EXPR=y
+# CONFIG_EXPR_MATH_SUPPORT_64 is not set
+CONFIG_FALSE=y
+# CONFIG_FOLD is not set
+CONFIG_HEAD=y
+CONFIG_FEATURE_FANCY_HEAD=y
+# CONFIG_HOSTID is not set
+CONFIG_ID=y
+# CONFIG_INSTALL is not set
+# CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
+# CONFIG_LENGTH is not set
+CONFIG_LN=y
+CONFIG_LOGNAME=y
+CONFIG_LS=y
+CONFIG_FEATURE_LS_FILETYPES=y
+CONFIG_FEATURE_LS_FOLLOWLINKS=y
+CONFIG_FEATURE_LS_RECURSIVE=y
+CONFIG_FEATURE_LS_SORTFILES=y
+CONFIG_FEATURE_LS_TIMESTAMPS=y
+CONFIG_FEATURE_LS_USERNAME=y
+CONFIG_FEATURE_LS_COLOR=y
+# CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
+CONFIG_MD5SUM=y
+CONFIG_MKDIR=y
+CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y
+CONFIG_MKFIFO=y
+CONFIG_MKNOD=y
+CONFIG_MV=y
+CONFIG_FEATURE_MV_LONG_OPTIONS=y
+CONFIG_NICE=y
+CONFIG_NOHUP=y
+CONFIG_OD=y
+# CONFIG_PRINTENV is not set
+CONFIG_PRINTF=y
+CONFIG_PWD=y
+CONFIG_READLINK=y
+CONFIG_FEATURE_READLINK_FOLLOW=y
+CONFIG_REALPATH=y
+CONFIG_RM=y
+CONFIG_RMDIR=y
+CONFIG_FEATURE_RMDIR_LONG_OPTIONS=y
+CONFIG_SEQ=y
+# CONFIG_SHA1SUM is not set
+CONFIG_SLEEP=y
+CONFIG_FEATURE_FANCY_SLEEP=y
+CONFIG_FEATURE_FLOAT_SLEEP=y
+CONFIG_SORT=y
+CONFIG_FEATURE_SORT_BIG=y
+# CONFIG_SPLIT is not set
+# CONFIG_FEATURE_SPLIT_FANCY is not set
+# CONFIG_STAT is not set
+# CONFIG_FEATURE_STAT_FORMAT is not set
+CONFIG_STTY=y
+# CONFIG_SUM is not set
+CONFIG_SYNC=y
+# CONFIG_TAC is not set
+CONFIG_TAIL=y
+CONFIG_FEATURE_FANCY_TAIL=y
+CONFIG_TEE=y
+CONFIG_FEATURE_TEE_USE_BLOCK_IO=y
+CONFIG_TEST=y
+# CONFIG_FEATURE_TEST_64 is not set
+CONFIG_TOUCH=y
+CONFIG_TR=y
+CONFIG_FEATURE_TR_CLASSES=y
+# CONFIG_FEATURE_TR_EQUIV is not set
+CONFIG_TRUE=y
+CONFIG_TTY=y
+CONFIG_UNAME=y
+# CONFIG_UNEXPAND is not set
+# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
+CONFIG_UNIQ=y
+CONFIG_USLEEP=y
+# CONFIG_UUDECODE is not set
+# CONFIG_UUENCODE is not set
+CONFIG_WC=y
+# CONFIG_FEATURE_WC_LARGE is not set
+CONFIG_WHO=y
+CONFIG_WHOAMI=y
+CONFIG_YES=y
+
+#
+# Common options for cp and mv
+#
+# CONFIG_FEATURE_PRESERVE_HARDLINKS is not set
+
+#
+# Common options for ls, more and telnet
+#
+CONFIG_FEATURE_AUTOWIDTH=y
+
+#
+# Common options for df, du, ls
+#
+CONFIG_FEATURE_HUMAN_READABLE=y
+
+#
+# Common options for md5sum, sha1sum
+#
+CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
+
+#
+# Console Utilities
+#
+CONFIG_CHVT=y
+CONFIG_CLEAR=y
+CONFIG_DEALLOCVT=y
+CONFIG_DUMPKMAP=y
+# CONFIG_KBD_MODE is not set
+CONFIG_LOADFONT=y
+CONFIG_LOADKMAP=y
+CONFIG_OPENVT=y
+CONFIG_RESET=y
+# CONFIG_RESIZE is not set
+# CONFIG_FEATURE_RESIZE_PRINT is not set
+CONFIG_SETCONSOLE=y
+# CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
+CONFIG_SETFONT=y
+CONFIG_FEATURE_SETFONT_TEXTUAL_MAP=y
+CONFIG_DEFAULT_SETFONT_DIR=""
+# CONFIG_SETKEYCODES is not set
+# CONFIG_SETLOGCONS is not set
+CONFIG_SHOWKEY=y
+
+#
+# Debian Utilities
+#
+CONFIG_MKTEMP=y
+# CONFIG_PIPE_PROGRESS is not set
+CONFIG_RUN_PARTS=y
+CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
+CONFIG_FEATURE_RUN_PARTS_FANCY=y
+CONFIG_START_STOP_DAEMON=y
+CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
+CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
+CONFIG_WHICH=y
+
+#
+# Editors
+#
+CONFIG_AWK=y
+CONFIG_FEATURE_AWK_LIBM=y
+CONFIG_CMP=y
+CONFIG_DIFF=y
+CONFIG_FEATURE_DIFF_BINARY=y
+CONFIG_FEATURE_DIFF_DIR=y
+CONFIG_FEATURE_DIFF_MINIMAL=y
+# CONFIG_ED is not set
+CONFIG_PATCH=y
+CONFIG_SED=y
+CONFIG_VI=y
+CONFIG_FEATURE_VI_MAX_LEN=1024
+CONFIG_FEATURE_VI_8BIT=y
+CONFIG_FEATURE_VI_COLON=y
+CONFIG_FEATURE_VI_YANKMARK=y
+CONFIG_FEATURE_VI_SEARCH=y
+CONFIG_FEATURE_VI_USE_SIGNALS=y
+CONFIG_FEATURE_VI_DOT_CMD=y
+# CONFIG_FEATURE_VI_READONLY is not set
+# CONFIG_FEATURE_VI_SETOPTS is not set
+CONFIG_FEATURE_VI_SET=y
+CONFIG_FEATURE_VI_WIN_RESIZE=y
+CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
+CONFIG_FEATURE_ALLOW_EXEC=y
+
+#
+# Finding Utilities
+#
+CONFIG_FIND=y
+CONFIG_FEATURE_FIND_PRINT0=y
+CONFIG_FEATURE_FIND_MTIME=y
+CONFIG_FEATURE_FIND_MMIN=y
+CONFIG_FEATURE_FIND_PERM=y
+CONFIG_FEATURE_FIND_TYPE=y
+CONFIG_FEATURE_FIND_XDEV=y
+CONFIG_FEATURE_FIND_MAXDEPTH=y
+CONFIG_FEATURE_FIND_NEWER=y
+CONFIG_FEATURE_FIND_INUM=y
+CONFIG_FEATURE_FIND_EXEC=y
+CONFIG_FEATURE_FIND_USER=y
+CONFIG_FEATURE_FIND_GROUP=y
+CONFIG_FEATURE_FIND_NOT=y
+CONFIG_FEATURE_FIND_DEPTH=y
+CONFIG_FEATURE_FIND_PAREN=y
+CONFIG_FEATURE_FIND_SIZE=y
+CONFIG_FEATURE_FIND_PRUNE=y
+CONFIG_FEATURE_FIND_DELETE=y
+CONFIG_FEATURE_FIND_PATH=y
+CONFIG_FEATURE_FIND_REGEX=y
+# CONFIG_FEATURE_FIND_CONTEXT is not set
+CONFIG_GREP=y
+CONFIG_FEATURE_GREP_EGREP_ALIAS=y
+CONFIG_FEATURE_GREP_FGREP_ALIAS=y
+CONFIG_FEATURE_GREP_CONTEXT=y
+CONFIG_XARGS=y
+# CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION is not set
+CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=y
+CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=y
+CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
+
+#
+# Init Utilities
+#
+CONFIG_INIT=y
+CONFIG_FEATURE_USE_INITTAB=y
+CONFIG_FEATURE_KILL_REMOVED=y
+CONFIG_FEATURE_KILL_DELAY=0
+# CONFIG_FEATURE_INIT_SCTTY is not set
+# CONFIG_FEATURE_INIT_SYSLOG is not set
+# CONFIG_FEATURE_EXTRA_QUIET is not set
+# CONFIG_FEATURE_INIT_COREDUMPS is not set
+CONFIG_FEATURE_INITRD=y
+CONFIG_HALT=y
+# CONFIG_MESG is not set
+
+#
+# Login/Password Management Utilities
+#
+CONFIG_FEATURE_SHADOWPASSWDS=y
+# CONFIG_USE_BB_PWD_GRP is not set
+# CONFIG_USE_BB_SHADOW is not set
+CONFIG_USE_BB_CRYPT=y
+CONFIG_ADDGROUP=y
+CONFIG_FEATURE_ADDUSER_TO_GROUP=y
+CONFIG_DELGROUP=y
+CONFIG_FEATURE_DEL_USER_FROM_GROUP=y
+CONFIG_FEATURE_CHECK_NAMES=y
+CONFIG_ADDUSER=y
+CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=y
+CONFIG_DELUSER=y
+CONFIG_GETTY=y
+CONFIG_FEATURE_UTMP=y
+CONFIG_FEATURE_WTMP=y
+CONFIG_LOGIN=y
+# CONFIG_PAM is not set
+CONFIG_LOGIN_SCRIPTS=y
+CONFIG_FEATURE_NOLOGIN=y
+CONFIG_FEATURE_SECURETTY=y
+CONFIG_PASSWD=y
+CONFIG_FEATURE_PASSWD_WEAK_CHECK=y
+CONFIG_CRYPTPW=y
+CONFIG_CHPASSWD=y
+CONFIG_SU=y
+CONFIG_FEATURE_SU_SYSLOG=y
+CONFIG_FEATURE_SU_CHECKS_SHELLS=y
+CONFIG_SULOGIN=y
+CONFIG_VLOCK=y
+
+#
+# Linux Ext2 FS Progs
+#
+CONFIG_CHATTR=y
+CONFIG_FSCK=y
+# CONFIG_LSATTR is not set
+
+#
+# Linux Module Utilities
+#
+CONFIG_DEFAULT_MODULES_DIR="/lib/modules"
+CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
+# CONFIG_MODPROBE_SMALL is not set
+# CONFIG_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE is not set
+# CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not set
+CONFIG_INSMOD=y
+CONFIG_RMMOD=y
+CONFIG_LSMOD=y
+CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT=y
+CONFIG_MODPROBE=y
+CONFIG_FEATURE_MODPROBE_BLACKLIST=y
+# CONFIG_DEPMOD is not set
+
+#
+# Options common to multiple modutils
+#
+# CONFIG_FEATURE_2_4_MODULES is not set
+# CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
+# CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
+# CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
+# CONFIG_FEATURE_INSMOD_LOAD_MAP is not set
+# CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL is not set
+CONFIG_FEATURE_CHECK_TAINTED_MODULE=y
+CONFIG_FEATURE_MODUTILS_ALIAS=y
+CONFIG_FEATURE_MODUTILS_SYMBOLS=y
+
+#
+# Linux System Utilities
+#
+CONFIG_BLKID=y
+CONFIG_DMESG=y
+CONFIG_FEATURE_DMESG_PRETTY=y
+CONFIG_FBSET=y
+CONFIG_FEATURE_FBSET_FANCY=y
+CONFIG_FEATURE_FBSET_READMODE=y
+# CONFIG_FDFLUSH is not set
+# CONFIG_FDFORMAT is not set
+CONFIG_FDISK=y
+CONFIG_FDISK_SUPPORT_LARGE_DISKS=y
+CONFIG_FEATURE_FDISK_WRITABLE=y
+# CONFIG_FEATURE_AIX_LABEL is not set
+# CONFIG_FEATURE_SGI_LABEL is not set
+# CONFIG_FEATURE_SUN_LABEL is not set
+CONFIG_FEATURE_OSF_LABEL=y
+CONFIG_FEATURE_FDISK_ADVANCED=y
+# CONFIG_FINDFS is not set
+CONFIG_FREERAMDISK=y
+CONFIG_FSCK_MINIX=y
+CONFIG_MKFS_MINIX=y
+
+#
+# Minix filesystem support
+#
+CONFIG_FEATURE_MINIX2=y
+CONFIG_GETOPT=y
+CONFIG_HEXDUMP=y
+# CONFIG_FEATURE_HEXDUMP_REVERSE is not set
+# CONFIG_HD is not set
+CONFIG_HWCLOCK=y
+CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=y
+CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
+# CONFIG_IPCRM is not set
+# CONFIG_IPCS is not set
+CONFIG_LOSETUP=y
+CONFIG_MDEV=y
+CONFIG_FEATURE_MDEV_CONF=y
+CONFIG_FEATURE_MDEV_RENAME=y
+CONFIG_FEATURE_MDEV_RENAME_REGEXP=y
+CONFIG_FEATURE_MDEV_EXEC=y
+CONFIG_FEATURE_MDEV_LOAD_FIRMWARE=y
+CONFIG_MKSWAP=y
+# CONFIG_FEATURE_MKSWAP_V0 is not set
+CONFIG_MORE=y
+CONFIG_FEATURE_USE_TERMIOS=y
+CONFIG_VOLUMEID=y
+# CONFIG_FEATURE_VOLUMEID_EXT is not set
+# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
+# CONFIG_FEATURE_VOLUMEID_FAT is not set
+# CONFIG_FEATURE_VOLUMEID_HFS is not set
+# CONFIG_FEATURE_VOLUMEID_JFS is not set
+# CONFIG_FEATURE_VOLUMEID_XFS is not set
+# CONFIG_FEATURE_VOLUMEID_NTFS is not set
+# CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
+# CONFIG_FEATURE_VOLUMEID_UDF is not set
+# CONFIG_FEATURE_VOLUMEID_LUKS is not set
+# CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
+# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
+# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
+# CONFIG_FEATURE_VOLUMEID_SYSV is not set
+# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
+# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
+CONFIG_MOUNT=y
+# CONFIG_FEATURE_MOUNT_FAKE is not set
+CONFIG_FEATURE_MOUNT_VERBOSE=y
+CONFIG_FEATURE_MOUNT_HELPERS=y
+CONFIG_FEATURE_MOUNT_LABEL=y
+CONFIG_FEATURE_MOUNT_NFS=y
+CONFIG_FEATURE_MOUNT_CIFS=y
+CONFIG_FEATURE_MOUNT_FLAGS=y
+CONFIG_FEATURE_MOUNT_FSTAB=y
+CONFIG_PIVOT_ROOT=y
+CONFIG_RDATE=y
+CONFIG_RDEV=y
+CONFIG_READPROFILE=y
+CONFIG_RTCWAKE=y
+# CONFIG_SCRIPT is not set
+# CONFIG_SETARCH is not set
+CONFIG_SWAPONOFF=y
+# CONFIG_FEATURE_SWAPON_PRI is not set
+CONFIG_SWITCH_ROOT=y
+CONFIG_UMOUNT=y
+CONFIG_FEATURE_UMOUNT_ALL=y
+
+#
+# Common options for mount/umount
+#
+CONFIG_FEATURE_MOUNT_LOOP=y
+# CONFIG_FEATURE_MTAB_SUPPORT is not set
+
+#
+# Miscellaneous Utilities
+#
+# CONFIG_ADJTIMEX is not set
+# CONFIG_BBCONFIG is not set
+# CONFIG_CHAT is not set
+# CONFIG_FEATURE_CHAT_NOFAIL is not set
+# CONFIG_FEATURE_CHAT_TTY_HIFI is not set
+# CONFIG_FEATURE_CHAT_IMPLICIT_CR is not set
+# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
+# CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
+# CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
+# CONFIG_FEATURE_CHAT_CLR_ABORT is not set
+# CONFIG_CHRT is not set
+# CONFIG_CROND is not set
+# CONFIG_FEATURE_CROND_D is not set
+# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
+# CONFIG_CRONTAB is not set
+CONFIG_DC=y
+CONFIG_FEATURE_DC_LIBM=y
+# CONFIG_DEVFSD is not set
+# CONFIG_DEVFSD_MODLOAD is not set
+# CONFIG_DEVFSD_FG_NP is not set
+# CONFIG_DEVFSD_VERBOSE is not set
+# CONFIG_FEATURE_DEVFS is not set
+# CONFIG_DEVMEM is not set
+# CONFIG_EJECT is not set
+# CONFIG_FEATURE_EJECT_SCSI is not set
+CONFIG_FBSPLASH=y
+# CONFIG_INOTIFYD is not set
+CONFIG_LAST=y
+CONFIG_FEATURE_LAST_SMALL=y
+# CONFIG_FEATURE_LAST_FANCY is not set
+CONFIG_LESS=y
+CONFIG_FEATURE_LESS_MAXLINES=9999999
+CONFIG_FEATURE_LESS_BRACKETS=y
+CONFIG_FEATURE_LESS_FLAGS=y
+# CONFIG_FEATURE_LESS_DASHCMD is not set
+# CONFIG_FEATURE_LESS_MARKS is not set
+# CONFIG_FEATURE_LESS_REGEXP is not set
+# CONFIG_FEATURE_LESS_LINENUMS is not set
+# CONFIG_FEATURE_LESS_WINCH is not set
+# CONFIG_HDPARM is not set
+# CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
+# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
+# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
+CONFIG_MAKEDEVS=y
+# CONFIG_FEATURE_MAKEDEVS_LEAF is not set
+CONFIG_FEATURE_MAKEDEVS_TABLE=y
+# CONFIG_MAN is not set
+CONFIG_MICROCOM=y
+# CONFIG_MOUNTPOINT is not set
+# CONFIG_MT is not set
+# CONFIG_RAIDAUTORUN is not set
+CONFIG_READAHEAD=y
+# CONFIG_RUNLEVEL is not set
+# CONFIG_RX is not set
+# CONFIG_SETSID is not set
+CONFIG_STRINGS=y
+# CONFIG_TASKSET is not set
+# CONFIG_FEATURE_TASKSET_FANCY is not set
+CONFIG_TIME=y
+# CONFIG_TTYSIZE is not set
+# CONFIG_WATCHDOG is not set
+
+#
+# Networking Utilities
+#
+CONFIG_FEATURE_IPV6=y
+CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
+# CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
+# CONFIG_ARP is not set
+# CONFIG_ARPING is not set
+# CONFIG_BRCTL is not set
+# CONFIG_FEATURE_BRCTL_FANCY is not set
+# CONFIG_FEATURE_BRCTL_SHOW is not set
+# CONFIG_DNSD is not set
+# CONFIG_ETHER_WAKE is not set
+# CONFIG_FAKEIDENTD is not set
+# CONFIG_FTPGET is not set
+# CONFIG_FTPPUT is not set
+# CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
+CONFIG_HOSTNAME=y
+CONFIG_HTTPD=y
+CONFIG_FEATURE_HTTPD_RANGES=y
+CONFIG_FEATURE_HTTPD_USE_SENDFILE=y
+CONFIG_FEATURE_HTTPD_RELOAD_CONFIG_SIGHUP=y
+CONFIG_FEATURE_HTTPD_SETUID=y
+CONFIG_FEATURE_HTTPD_BASIC_AUTH=y
+CONFIG_FEATURE_HTTPD_AUTH_MD5=y
+CONFIG_FEATURE_HTTPD_CONFIG_WITH_MIME_TYPES=y
+CONFIG_FEATURE_HTTPD_CGI=y
+CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR=y
+CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV=y
+CONFIG_FEATURE_HTTPD_ENCODE_URL_STR=y
+CONFIG_FEATURE_HTTPD_ERROR_PAGES=y
+CONFIG_FEATURE_HTTPD_PROXY=y
+CONFIG_IFCONFIG=y
+CONFIG_FEATURE_IFCONFIG_STATUS=y
+# CONFIG_FEATURE_IFCONFIG_SLIP is not set
+# CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ is not set
+CONFIG_FEATURE_IFCONFIG_HW=y
+CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS=y
+# CONFIG_IFENSLAVE is not set
+CONFIG_IFUPDOWN=y
+CONFIG_IFUPDOWN_IFSTATE_PATH="/var/run/ifstate"
+# CONFIG_FEATURE_IFUPDOWN_IP is not set
+# CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
+CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN=y
+CONFIG_FEATURE_IFUPDOWN_IPV4=y
+CONFIG_FEATURE_IFUPDOWN_IPV6=y
+CONFIG_FEATURE_IFUPDOWN_MAPPING=y
+# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
+# CONFIG_INETD is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
+# CONFIG_FEATURE_INETD_RPC is not set
+CONFIG_IP=y
+CONFIG_FEATURE_IP_ADDRESS=y
+CONFIG_FEATURE_IP_LINK=y
+CONFIG_FEATURE_IP_ROUTE=y
+CONFIG_FEATURE_IP_TUNNEL=y
+# CONFIG_FEATURE_IP_RULE is not set
+# CONFIG_FEATURE_IP_SHORT_FORMS is not set
+# CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
+# CONFIG_IPADDR is not set
+# CONFIG_IPLINK is not set
+# CONFIG_IPROUTE is not set
+# CONFIG_IPTUNNEL is not set
+# CONFIG_IPRULE is not set
+# CONFIG_IPCALC is not set
+# CONFIG_FEATURE_IPCALC_FANCY is not set
+# CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
+# CONFIG_NAMEIF is not set
+# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
+CONFIG_NC=y
+CONFIG_NC_SERVER=y
+CONFIG_NC_EXTRA=y
+CONFIG_NETSTAT=y
+CONFIG_FEATURE_NETSTAT_WIDE=y
+CONFIG_FEATURE_NETSTAT_PRG=y
+CONFIG_NSLOOKUP=y
+CONFIG_PING=y
+CONFIG_PING6=y
+CONFIG_FEATURE_FANCY_PING=y
+# CONFIG_PSCAN is not set
+CONFIG_ROUTE=y
+# CONFIG_SLATTACH is not set
+CONFIG_TELNET=y
+# CONFIG_FEATURE_TELNET_TTYPE is not set
+CONFIG_FEATURE_TELNET_AUTOLOGIN=y
+CONFIG_TELNETD=y
+# CONFIG_FEATURE_TELNETD_STANDALONE is not set
+CONFIG_TFTP=y
+# CONFIG_TFTPD is not set
+CONFIG_FEATURE_TFTP_GET=y
+CONFIG_FEATURE_TFTP_PUT=y
+# CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
+# CONFIG_TFTP_DEBUG is not set
+CONFIG_TRACEROUTE=y
+CONFIG_FEATURE_TRACEROUTE_VERBOSE=y
+CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE=y
+CONFIG_FEATURE_TRACEROUTE_USE_ICMP=y
+CONFIG_UDHCPD=y
+CONFIG_DHCPRELAY=y
+CONFIG_DUMPLEASES=y
+# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
+CONFIG_DHCPD_LEASES_FILE="/var/lib/misc/udhcpd.leases"
+CONFIG_UDHCPC=y
+CONFIG_FEATURE_UDHCPC_ARPING=y
+# CONFIG_FEATURE_UDHCP_PORT is not set
+# CONFIG_UDHCP_DEBUG is not set
+# CONFIG_FEATURE_UDHCP_RFC3397 is not set
+CONFIG_UDHCPC_DEFAULT_SCRIPT="@DATADIR@/udhcpc/default.script"
+CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
+# CONFIG_VCONFIG is not set
+CONFIG_WGET=y
+CONFIG_FEATURE_WGET_STATUSBAR=y
+CONFIG_FEATURE_WGET_AUTHENTICATION=y
+CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+# CONFIG_ZCIP is not set
+# CONFIG_TCPSVD is not set
+# CONFIG_UDPSVD is not set
+
+#
+# Print Utilities
+#
+# CONFIG_LPD is not set
+# CONFIG_LPR is not set
+# CONFIG_LPQ is not set
+
+#
+# Mail Utilities
+#
+# CONFIG_MAKEMIME is not set
+CONFIG_FEATURE_MIME_CHARSET=""
+# CONFIG_POPMAILDIR is not set
+# CONFIG_FEATURE_POPMAILDIR_DELIVERY is not set
+# CONFIG_REFORMIME is not set
+# CONFIG_FEATURE_REFORMIME_COMPAT is not set
+# CONFIG_SENDMAIL is not set
+# CONFIG_FEATURE_SENDMAIL_MAILX is not set
+# CONFIG_FEATURE_SENDMAIL_MAILXX is not set
+
+#
+# Process Utilities
+#
+CONFIG_FREE=y
+CONFIG_FUSER=y
+CONFIG_KILL=y
+CONFIG_KILLALL=y
+# CONFIG_KILLALL5 is not set
+# CONFIG_NMETER is not set
+# CONFIG_PGREP is not set
+CONFIG_PIDOF=y
+CONFIG_FEATURE_PIDOF_SINGLE=y
+CONFIG_FEATURE_PIDOF_OMIT=y
+# CONFIG_PKILL is not set
+CONFIG_PS=y
+CONFIG_FEATURE_PS_WIDE=y
+# CONFIG_FEATURE_PS_TIME is not set
+# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
+CONFIG_RENICE=y
+CONFIG_BB_SYSCTL=y
+CONFIG_TOP=y
+CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE=y
+CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
+# CONFIG_FEATURE_TOP_SMP_CPU is not set
+# CONFIG_FEATURE_TOP_DECIMALS is not set
+# CONFIG_FEATURE_TOP_SMP_PROCESS is not set
+# CONFIG_FEATURE_TOPMEM is not set
+CONFIG_UPTIME=y
+CONFIG_WATCH=y
+
+#
+# Runit Utilities
+#
+# CONFIG_RUNSV is not set
+# CONFIG_RUNSVDIR is not set
+# CONFIG_FEATURE_RUNSVDIR_LOG is not set
+# CONFIG_SV is not set
+CONFIG_SV_DEFAULT_SERVICE_DIR=""
+# CONFIG_SVLOGD is not set
+# CONFIG_CHPST is not set
+# CONFIG_SETUIDGID is not set
+# CONFIG_ENVUIDGID is not set
+# CONFIG_ENVDIR is not set
+# CONFIG_SOFTLIMIT is not set
+# CONFIG_CHCON is not set
+# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
+# CONFIG_GETENFORCE is not set
+# CONFIG_GETSEBOOL is not set
+# CONFIG_LOAD_POLICY is not set
+# CONFIG_MATCHPATHCON is not set
+# CONFIG_RESTORECON is not set
+# CONFIG_RUNCON is not set
+# CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
+# CONFIG_SELINUXENABLED is not set
+# CONFIG_SETENFORCE is not set
+# CONFIG_SETFILES is not set
+# CONFIG_FEATURE_SETFILES_CHECK_OPTION is not set
+# CONFIG_SETSEBOOL is not set
+# CONFIG_SESTATUS is not set
+
+#
+# Shells
+#
+CONFIG_FEATURE_SH_IS_ASH=y
+# CONFIG_FEATURE_SH_IS_HUSH is not set
+# CONFIG_FEATURE_SH_IS_MSH is not set
+# CONFIG_FEATURE_SH_IS_NONE is not set
+CONFIG_ASH=y
+
+#
+# Ash Shell Options
+#
+CONFIG_ASH_BASH_COMPAT=y
+CONFIG_ASH_JOB_CONTROL=y
+CONFIG_ASH_READ_NCHARS=y
+CONFIG_ASH_READ_TIMEOUT=y
+CONFIG_ASH_ALIAS=y
+CONFIG_ASH_MATH_SUPPORT=y
+# CONFIG_ASH_MATH_SUPPORT_64 is not set
+CONFIG_ASH_GETOPTS=y
+CONFIG_ASH_BUILTIN_ECHO=y
+CONFIG_ASH_BUILTIN_PRINTF=y
+CONFIG_ASH_BUILTIN_TEST=y
+# CONFIG_ASH_CMDCMD is not set
+# CONFIG_ASH_MAIL is not set
+# CONFIG_ASH_OPTIMIZE_FOR_SIZE is not set
+# CONFIG_ASH_RANDOM_SUPPORT is not set
+CONFIG_ASH_EXPAND_PRMT=y
+# CONFIG_HUSH is not set
+# CONFIG_HUSH_HELP is not set
+# CONFIG_HUSH_INTERACTIVE is not set
+# CONFIG_HUSH_JOB is not set
+# CONFIG_HUSH_TICK is not set
+# CONFIG_HUSH_IF is not set
+# CONFIG_HUSH_LOOPS is not set
+# CONFIG_HUSH_CASE is not set
+# CONFIG_LASH is not set
+# CONFIG_MSH is not set
+
+#
+# Bourne Shell Options
+#
+CONFIG_FEATURE_SH_EXTRA_QUIET=y
+# CONFIG_FEATURE_SH_STANDALONE is not set
+# CONFIG_FEATURE_SH_NOFORK is not set
+# CONFIG_CTTYHACK is not set
+
+#
+# System Logging Utilities
+#
+CONFIG_SYSLOGD=y
+CONFIG_FEATURE_ROTATE_LOGFILE=y
+CONFIG_FEATURE_REMOTE_LOG=y
+CONFIG_FEATURE_SYSLOGD_DUP=y
+CONFIG_FEATURE_IPC_SYSLOG=y
+CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=16
+CONFIG_LOGREAD=y
+CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=y
+CONFIG_KLOGD=y
+CONFIG_LOGGER=y
diff --git a/recipes/busybox/busybox-1.18.1/fdisk_nios2.patch b/recipes/busybox/busybox-1.18.1/fdisk_nios2.patch
new file mode 100644
index 0000000..648e68e
--- /dev/null
+++ b/recipes/busybox/busybox-1.18.1/fdisk_nios2.patch
@@ -0,0 +1,13 @@
+Index: busybox-1.15.3/util-linux/fdisk_osf.c
+===================================================================
+--- busybox-1.15.3.orig/util-linux/fdisk_osf.c
++++ busybox-1.15.3/util-linux/fdisk_osf.c
+@@ -44,7 +44,7 @@
+ #define BSD_LINUX_BOOTDIR "/usr/ucb/mdec"
+ 
+ #if defined(i386) || defined(__sparc__) || defined(__arm__) \
+- || defined(__m68k__) || defined(__mips__) || defined(__s390__) \
++ || defined(__m68k__) || defined(__mips__) || defined(__nios2__) \
+  || defined(__s390__) || defined(__s390x__) \
+  || defined(__sh__) || defined(__x86_64__) || defined(__avr32__)
+ # define BSD_LABELSECTOR   1
diff --git a/recipes/busybox/busybox-1.18.1/get_header_tar.patch b/recipes/busybox/busybox-1.18.1/get_header_tar.patch
new file mode 100644
index 0000000..62b55af
--- /dev/null
+++ b/recipes/busybox/busybox-1.18.1/get_header_tar.patch
@@ -0,0 +1,13 @@
+diff --git a/archival/libarchive/get_header_tar.c b/archival/libarchive/get_header_tar.c
+index 78b0ae2..58b15c1 100644
+--- a/archival/libarchive/get_header_tar.c
++++ b/archival/libarchive/get_header_tar.c
+@@ -314,6 +314,8 @@ char FAST_FUNC get_header_tar(archive_handle_t *archive_handle)
+ 			file_header->name = concat_path_file(tar.prefix, tar.name);
+ 		} else
+ 			file_header->name = xstrdup(tar.name);
++		if (strlen(file_header->name) > 100)
++			file_header->name[100] = 0;
+ 	}
+ 
+ 	/* Set bits 12-15 of the files mode */
diff --git a/recipes/busybox/busybox-1.18.1/slugos/defconfig b/recipes/busybox/busybox-1.18.1/slugos/defconfig
new file mode 100644
index 0000000..d3e38b8
--- /dev/null
+++ b/recipes/busybox/busybox-1.18.1/slugos/defconfig
@@ -0,0 +1,986 @@
+#
+# Automatically generated make config: don't edit
+# Busybox version: 1.18.0
+# Sun Dec 26 22:59:53 2010
+#
+CONFIG_HAVE_DOT_CONFIG=y
+
+#
+# Busybox Settings
+#
+
+#
+# General Configuration
+#
+# CONFIG_DESKTOP is not set
+# CONFIG_EXTRA_COMPAT is not set
+# CONFIG_INCLUDE_SUSv2 is not set
+# CONFIG_USE_PORTABLE_CODE is not set
+CONFIG_PLATFORM_LINUX=y
+CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
+# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
+# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
+CONFIG_SHOW_USAGE=y
+CONFIG_FEATURE_VERBOSE_USAGE=y
+CONFIG_FEATURE_COMPRESS_USAGE=y
+# CONFIG_FEATURE_INSTALLER is not set
+# CONFIG_INSTALL_NO_USR is not set
+# CONFIG_LOCALE_SUPPORT is not set
+CONFIG_UNICODE_SUPPORT=y
+# CONFIG_UNICODE_USING_LOCALE is not set
+# CONFIG_FEATURE_CHECK_UNICODE_IN_ENV is not set
+CONFIG_SUBST_WCHAR=63
+CONFIG_LAST_SUPPORTED_WCHAR=767
+# CONFIG_UNICODE_COMBINING_WCHARS is not set
+# CONFIG_UNICODE_WIDE_WCHARS is not set
+# CONFIG_UNICODE_BIDI_SUPPORT is not set
+# CONFIG_UNICODE_NEUTRAL_TABLE is not set
+# CONFIG_UNICODE_PRESERVE_BROKEN is not set
+CONFIG_LONG_OPTS=y
+CONFIG_FEATURE_DEVPTS=y
+# CONFIG_FEATURE_CLEAN_UP is not set
+CONFIG_FEATURE_WTMP=y
+CONFIG_FEATURE_UTMP=y
+CONFIG_FEATURE_PIDFILE=y
+CONFIG_FEATURE_SUID=y
+CONFIG_FEATURE_SUID_CONFIG=y
+CONFIG_FEATURE_SUID_CONFIG_QUIET=y
+# CONFIG_SELINUX is not set
+# CONFIG_FEATURE_PREFER_APPLETS is not set
+CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
+CONFIG_FEATURE_SYSLOG=y
+CONFIG_FEATURE_HAVE_RPC=y
+
+#
+# Build Options
+#
+# CONFIG_STATIC is not set
+# CONFIG_PIE is not set
+# CONFIG_NOMMU is not set
+# CONFIG_BUILD_LIBBUSYBOX is not set
+# CONFIG_FEATURE_INDIVIDUAL is not set
+# CONFIG_FEATURE_SHARED_BUSYBOX is not set
+CONFIG_LFS=y
+CONFIG_CROSS_COMPILER_PREFIX="arm-linux-gnueabi-"
+CONFIG_EXTRA_CFLAGS="-isystem/r/slug/slugos/tmp/sysroots/armv5te-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os"
+
+#
+# Debugging Options
+#
+# CONFIG_DEBUG is not set
+# CONFIG_DEBUG_PESSIMIZE is not set
+# CONFIG_WERROR is not set
+CONFIG_NO_DEBUG_LIB=y
+# CONFIG_DMALLOC is not set
+# CONFIG_EFENCE is not set
+
+#
+# Installation Options ("make install" behavior)
+#
+CONFIG_INSTALL_APPLET_SYMLINKS=y
+# CONFIG_INSTALL_APPLET_HARDLINKS is not set
+# CONFIG_INSTALL_APPLET_SCRIPT_WRAPPERS is not set
+# CONFIG_INSTALL_APPLET_DONT is not set
+# CONFIG_INSTALL_SH_APPLET_SYMLINK is not set
+# CONFIG_INSTALL_SH_APPLET_HARDLINK is not set
+# CONFIG_INSTALL_SH_APPLET_SCRIPT_WRAPPER is not set
+CONFIG_PREFIX="./_install"
+
+#
+# Busybox Library Tuning
+#
+CONFIG_PASSWORD_MINLEN=6
+CONFIG_MD5_SIZE_VS_SPEED=1
+CONFIG_FEATURE_FAST_TOP=y
+# CONFIG_FEATURE_ETC_NETWORKS is not set
+CONFIG_FEATURE_USE_TERMIOS=y
+CONFIG_FEATURE_EDITING=y
+CONFIG_FEATURE_EDITING_MAX_LEN=1024
+# CONFIG_FEATURE_EDITING_VI is not set
+CONFIG_FEATURE_EDITING_HISTORY=50
+CONFIG_FEATURE_EDITING_SAVEHISTORY=y
+CONFIG_FEATURE_TAB_COMPLETION=y
+CONFIG_FEATURE_USERNAME_COMPLETION=y
+CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
+# CONFIG_FEATURE_EDITING_ASK_TERMINAL is not set
+CONFIG_FEATURE_NON_POSIX_CP=y
+CONFIG_FEATURE_VERBOSE_CP_MESSAGE=y
+CONFIG_FEATURE_COPYBUF_KB=4
+CONFIG_MONOTONIC_SYSCALL=y
+CONFIG_IOCTL_HEX2STR_ERROR=y
+# CONFIG_FEATURE_HWIB is not set
+
+#
+# Applets
+#
+
+#
+# Archival Utilities
+#
+CONFIG_FEATURE_SEAMLESS_XZ=y
+# CONFIG_FEATURE_SEAMLESS_LZMA is not set
+CONFIG_FEATURE_SEAMLESS_BZ2=y
+CONFIG_FEATURE_SEAMLESS_GZ=y
+CONFIG_FEATURE_SEAMLESS_Z=y
+CONFIG_AR=y
+CONFIG_FEATURE_AR_LONG_FILENAMES=y
+CONFIG_FEATURE_AR_CREATE=y
+CONFIG_BUNZIP2=y
+CONFIG_BZIP2=y
+CONFIG_CPIO=y
+CONFIG_FEATURE_CPIO_O=y
+CONFIG_FEATURE_CPIO_P=y
+# CONFIG_DPKG is not set
+# CONFIG_DPKG_DEB is not set
+# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
+CONFIG_GUNZIP=y
+CONFIG_GZIP=y
+CONFIG_FEATURE_GZIP_LONG_OPTIONS=y
+CONFIG_LZOP=y
+# CONFIG_LZOP_COMPR_HIGH is not set
+# CONFIG_RPM2CPIO is not set
+# CONFIG_RPM is not set
+CONFIG_TAR=y
+CONFIG_FEATURE_TAR_CREATE=y
+CONFIG_FEATURE_TAR_AUTODETECT=y
+CONFIG_FEATURE_TAR_FROM=y
+CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY=y
+# CONFIG_FEATURE_TAR_OLDSUN_COMPATIBILITY is not set
+CONFIG_FEATURE_TAR_GNU_EXTENSIONS=y
+CONFIG_FEATURE_TAR_LONG_OPTIONS=y
+CONFIG_FEATURE_TAR_TO_COMMAND=y
+CONFIG_FEATURE_TAR_UNAME_GNAME=y
+CONFIG_FEATURE_TAR_NOPRESERVE_TIME=y
+# CONFIG_FEATURE_TAR_SELINUX is not set
+CONFIG_UNCOMPRESS=y
+CONFIG_UNLZMA=y
+# CONFIG_FEATURE_LZMA_FAST is not set
+CONFIG_LZMA=y
+CONFIG_UNXZ=y
+CONFIG_XZ=y
+CONFIG_UNZIP=y
+
+#
+# Coreutils
+#
+CONFIG_BASENAME=y
+CONFIG_CAT=y
+CONFIG_DATE=y
+CONFIG_FEATURE_DATE_ISOFMT=y
+# CONFIG_FEATURE_DATE_NANO is not set
+CONFIG_FEATURE_DATE_COMPAT=y
+CONFIG_TEST=y
+# CONFIG_FEATURE_TEST_64 is not set
+CONFIG_TR=y
+CONFIG_FEATURE_TR_CLASSES=y
+CONFIG_FEATURE_TR_EQUIV=y
+CONFIG_BASE64=y
+# CONFIG_CAL is not set
+# CONFIG_CATV is not set
+CONFIG_CHGRP=y
+CONFIG_CHMOD=y
+CONFIG_CHOWN=y
+CONFIG_FEATURE_CHOWN_LONG_OPTIONS=y
+CONFIG_CHROOT=y
+# CONFIG_CKSUM is not set
+# CONFIG_COMM is not set
+CONFIG_CP=y
+CONFIG_FEATURE_CP_LONG_OPTIONS=y
+CONFIG_CUT=y
+CONFIG_DD=y
+CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
+CONFIG_FEATURE_DD_THIRD_STATUS_LINE=y
+CONFIG_FEATURE_DD_IBS_OBS=y
+CONFIG_DF=y
+# CONFIG_FEATURE_DF_FANCY is not set
+CONFIG_DIRNAME=y
+CONFIG_DOS2UNIX=y
+CONFIG_UNIX2DOS=y
+CONFIG_DU=y
+CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
+CONFIG_ECHO=y
+CONFIG_FEATURE_FANCY_ECHO=y
+CONFIG_ENV=y
+CONFIG_FEATURE_ENV_LONG_OPTIONS=y
+# CONFIG_EXPAND is not set
+# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
+CONFIG_EXPR=y
+# CONFIG_EXPR_MATH_SUPPORT_64 is not set
+CONFIG_FALSE=y
+# CONFIG_FOLD is not set
+CONFIG_FSYNC=y
+CONFIG_HEAD=y
+CONFIG_FEATURE_FANCY_HEAD=y
+# CONFIG_HOSTID is not set
+CONFIG_ID=y
+# CONFIG_INSTALL is not set
+# CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
+CONFIG_LENGTH=y
+CONFIG_LN=y
+CONFIG_LOGNAME=y
+CONFIG_LS=y
+CONFIG_FEATURE_LS_FILETYPES=y
+CONFIG_FEATURE_LS_FOLLOWLINKS=y
+CONFIG_FEATURE_LS_RECURSIVE=y
+CONFIG_FEATURE_LS_SORTFILES=y
+CONFIG_FEATURE_LS_TIMESTAMPS=y
+CONFIG_FEATURE_LS_USERNAME=y
+CONFIG_FEATURE_LS_COLOR=y
+# CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
+CONFIG_MD5SUM=y
+CONFIG_MKDIR=y
+CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y
+CONFIG_MKFIFO=y
+CONFIG_MKNOD=y
+CONFIG_MV=y
+CONFIG_FEATURE_MV_LONG_OPTIONS=y
+CONFIG_NICE=y
+CONFIG_NOHUP=y
+CONFIG_OD=y
+# CONFIG_PRINTENV is not set
+CONFIG_PRINTF=y
+CONFIG_PWD=y
+CONFIG_READLINK=y
+CONFIG_FEATURE_READLINK_FOLLOW=y
+CONFIG_REALPATH=y
+CONFIG_RM=y
+CONFIG_RMDIR=y
+CONFIG_FEATURE_RMDIR_LONG_OPTIONS=y
+CONFIG_SEQ=y
+CONFIG_SHA1SUM=y
+CONFIG_SHA256SUM=y
+CONFIG_SHA512SUM=y
+CONFIG_SLEEP=y
+CONFIG_FEATURE_FANCY_SLEEP=y
+# CONFIG_FEATURE_FLOAT_SLEEP is not set
+CONFIG_SORT=y
+CONFIG_FEATURE_SORT_BIG=y
+CONFIG_SPLIT=y
+CONFIG_FEATURE_SPLIT_FANCY=y
+# CONFIG_STAT is not set
+# CONFIG_FEATURE_STAT_FORMAT is not set
+CONFIG_STTY=y
+CONFIG_SUM=y
+CONFIG_SYNC=y
+# CONFIG_TAC is not set
+CONFIG_TAIL=y
+CONFIG_FEATURE_FANCY_TAIL=y
+CONFIG_TEE=y
+CONFIG_FEATURE_TEE_USE_BLOCK_IO=y
+CONFIG_TOUCH=y
+CONFIG_TRUE=y
+CONFIG_TTY=y
+CONFIG_UNAME=y
+# CONFIG_UNEXPAND is not set
+# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
+CONFIG_UNIQ=y
+CONFIG_USLEEP=y
+# CONFIG_UUDECODE is not set
+# CONFIG_UUENCODE is not set
+CONFIG_WC=y
+# CONFIG_FEATURE_WC_LARGE is not set
+CONFIG_WHO=y
+CONFIG_WHOAMI=y
+CONFIG_YES=y
+
+#
+# Common options for cp and mv
+#
+CONFIG_FEATURE_PRESERVE_HARDLINKS=y
+
+#
+# Common options for ls, more and telnet
+#
+CONFIG_FEATURE_AUTOWIDTH=y
+
+#
+# Common options for df, du, ls
+#
+CONFIG_FEATURE_HUMAN_READABLE=y
+
+#
+# Common options for md5sum, sha1sum, sha256sum, sha512sum
+#
+CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
+
+#
+# Console Utilities
+#
+CONFIG_CHVT=y
+CONFIG_FGCONSOLE=y
+CONFIG_CLEAR=y
+CONFIG_DEALLOCVT=y
+CONFIG_DUMPKMAP=y
+CONFIG_KBD_MODE=y
+# CONFIG_LOADFONT is not set
+CONFIG_LOADKMAP=y
+CONFIG_OPENVT=y
+CONFIG_RESET=y
+CONFIG_RESIZE=y
+CONFIG_FEATURE_RESIZE_PRINT=y
+CONFIG_SETCONSOLE=y
+CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS=y
+# CONFIG_SETFONT is not set
+# CONFIG_FEATURE_SETFONT_TEXTUAL_MAP is not set
+CONFIG_DEFAULT_SETFONT_DIR=""
+CONFIG_SETKEYCODES=y
+CONFIG_SETLOGCONS=y
+# CONFIG_SHOWKEY is not set
+# CONFIG_FEATURE_LOADFONT_PSF2 is not set
+# CONFIG_FEATURE_LOADFONT_RAW is not set
+
+#
+# Debian Utilities
+#
+CONFIG_MKTEMP=y
+# CONFIG_PIPE_PROGRESS is not set
+CONFIG_RUN_PARTS=y
+CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
+CONFIG_FEATURE_RUN_PARTS_FANCY=y
+CONFIG_START_STOP_DAEMON=y
+CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
+CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
+CONFIG_WHICH=y
+
+#
+# Editors
+#
+CONFIG_PATCH=y
+CONFIG_AWK=y
+# CONFIG_FEATURE_AWK_LIBM is not set
+CONFIG_CMP=y
+CONFIG_DIFF=y
+CONFIG_FEATURE_DIFF_LONG_OPTIONS=y
+CONFIG_FEATURE_DIFF_DIR=y
+# CONFIG_ED is not set
+CONFIG_SED=y
+CONFIG_VI=y
+CONFIG_FEATURE_VI_MAX_LEN=1024
+CONFIG_FEATURE_VI_8BIT=y
+CONFIG_FEATURE_VI_COLON=y
+CONFIG_FEATURE_VI_YANKMARK=y
+CONFIG_FEATURE_VI_SEARCH=y
+CONFIG_FEATURE_VI_USE_SIGNALS=y
+# CONFIG_FEATURE_VI_DOT_CMD is not set
+# CONFIG_FEATURE_VI_READONLY is not set
+# CONFIG_FEATURE_VI_SETOPTS is not set
+# CONFIG_FEATURE_VI_SET is not set
+CONFIG_FEATURE_VI_WIN_RESIZE=y
+CONFIG_FEATURE_VI_ASK_TERMINAL=y
+CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
+CONFIG_FEATURE_ALLOW_EXEC=y
+
+#
+# Finding Utilities
+#
+CONFIG_FIND=y
+CONFIG_FEATURE_FIND_PRINT0=y
+CONFIG_FEATURE_FIND_MTIME=y
+CONFIG_FEATURE_FIND_MMIN=y
+CONFIG_FEATURE_FIND_PERM=y
+CONFIG_FEATURE_FIND_TYPE=y
+CONFIG_FEATURE_FIND_XDEV=y
+CONFIG_FEATURE_FIND_MAXDEPTH=y
+CONFIG_FEATURE_FIND_NEWER=y
+CONFIG_FEATURE_FIND_INUM=y
+CONFIG_FEATURE_FIND_EXEC=y
+CONFIG_FEATURE_FIND_USER=y
+CONFIG_FEATURE_FIND_GROUP=y
+CONFIG_FEATURE_FIND_NOT=y
+CONFIG_FEATURE_FIND_DEPTH=y
+CONFIG_FEATURE_FIND_PAREN=y
+CONFIG_FEATURE_FIND_SIZE=y
+CONFIG_FEATURE_FIND_PRUNE=y
+CONFIG_FEATURE_FIND_DELETE=y
+CONFIG_FEATURE_FIND_PATH=y
+CONFIG_FEATURE_FIND_REGEX=y
+# CONFIG_FEATURE_FIND_CONTEXT is not set
+CONFIG_FEATURE_FIND_LINKS=y
+CONFIG_GREP=y
+CONFIG_FEATURE_GREP_EGREP_ALIAS=y
+CONFIG_FEATURE_GREP_FGREP_ALIAS=y
+CONFIG_FEATURE_GREP_CONTEXT=y
+CONFIG_XARGS=y
+CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION=y
+CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=y
+CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=y
+CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
+
+#
+# Init Utilities
+#
+CONFIG_BOOTCHARTD=y
+CONFIG_FEATURE_BOOTCHARTD_BLOATED_HEADER=y
+CONFIG_FEATURE_BOOTCHARTD_CONFIG_FILE=y
+# CONFIG_HALT is not set
+# CONFIG_FEATURE_CALL_TELINIT is not set
+CONFIG_TELINIT_PATH=""
+# CONFIG_INIT is not set
+# CONFIG_FEATURE_USE_INITTAB is not set
+# CONFIG_FEATURE_KILL_REMOVED is not set
+CONFIG_FEATURE_KILL_DELAY=0
+# CONFIG_FEATURE_INIT_SCTTY is not set
+# CONFIG_FEATURE_INIT_SYSLOG is not set
+# CONFIG_FEATURE_EXTRA_QUIET is not set
+# CONFIG_FEATURE_INIT_COREDUMPS is not set
+# CONFIG_FEATURE_INITRD is not set
+CONFIG_INIT_TERMINAL_TYPE=""
+# CONFIG_MESG is not set
+
+#
+# Login/Password Management Utilities
+#
+# CONFIG_ADD_SHELL is not set
+# CONFIG_REMOVE_SHELL is not set
+# CONFIG_FEATURE_SHADOWPASSWDS is not set
+CONFIG_USE_BB_PWD_GRP=y
+# CONFIG_USE_BB_SHADOW is not set
+CONFIG_USE_BB_CRYPT=y
+CONFIG_USE_BB_CRYPT_SHA=y
+CONFIG_ADDUSER=y
+CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=y
+CONFIG_FEATURE_CHECK_NAMES=y
+CONFIG_FIRST_SYSTEM_ID=100
+CONFIG_LAST_SYSTEM_ID=499
+CONFIG_ADDGROUP=y
+CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS=y
+CONFIG_FEATURE_ADDUSER_TO_GROUP=y
+CONFIG_DELUSER=y
+CONFIG_DELGROUP=y
+CONFIG_FEATURE_DEL_USER_FROM_GROUP=y
+CONFIG_GETTY=y
+CONFIG_LOGIN=y
+# CONFIG_PAM is not set
+CONFIG_LOGIN_SCRIPTS=y
+CONFIG_FEATURE_NOLOGIN=y
+CONFIG_FEATURE_SECURETTY=y
+CONFIG_PASSWD=y
+CONFIG_FEATURE_PASSWD_WEAK_CHECK=y
+CONFIG_CRYPTPW=y
+CONFIG_CHPASSWD=y
+CONFIG_SU=y
+CONFIG_FEATURE_SU_SYSLOG=y
+CONFIG_FEATURE_SU_CHECKS_SHELLS=y
+CONFIG_SULOGIN=y
+# CONFIG_VLOCK is not set
+
+#
+# Linux Ext2 FS Progs
+#
+# CONFIG_CHATTR is not set
+# CONFIG_FSCK is not set
+# CONFIG_LSATTR is not set
+# CONFIG_TUNE2FS is not set
+
+#
+# Linux Module Utilities
+#
+CONFIG_MODINFO=y
+# CONFIG_MODPROBE_SMALL is not set
+# CONFIG_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE is not set
+# CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not set
+# CONFIG_INSMOD is not set
+# CONFIG_RMMOD is not set
+# CONFIG_LSMOD is not set
+# CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT is not set
+# CONFIG_MODPROBE is not set
+# CONFIG_FEATURE_MODPROBE_BLACKLIST is not set
+# CONFIG_DEPMOD is not set
+
+#
+# Options common to multiple modutils
+#
+# CONFIG_FEATURE_2_4_MODULES is not set
+# CONFIG_FEATURE_INSMOD_TRY_MMAP is not set
+# CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
+# CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
+# CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
+# CONFIG_FEATURE_INSMOD_LOAD_MAP is not set
+# CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL is not set
+# CONFIG_FEATURE_CHECK_TAINTED_MODULE is not set
+# CONFIG_FEATURE_MODUTILS_ALIAS is not set
+# CONFIG_FEATURE_MODUTILS_SYMBOLS is not set
+CONFIG_DEFAULT_MODULES_DIR="/lib/modules"
+CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
+
+#
+# Linux System Utilities
+#
+CONFIG_BLOCKDEV=y
+CONFIG_REV=y
+CONFIG_ACPID=y
+CONFIG_FEATURE_ACPID_COMPAT=y
+CONFIG_BLKID=y
+CONFIG_DMESG=y
+CONFIG_FEATURE_DMESG_PRETTY=y
+# CONFIG_FBSET is not set
+# CONFIG_FEATURE_FBSET_FANCY is not set
+# CONFIG_FEATURE_FBSET_READMODE is not set
+# CONFIG_FDFLUSH is not set
+# CONFIG_FDFORMAT is not set
+CONFIG_FDISK=y
+CONFIG_FDISK_SUPPORT_LARGE_DISKS=y
+CONFIG_FEATURE_FDISK_WRITABLE=y
+# CONFIG_FEATURE_AIX_LABEL is not set
+# CONFIG_FEATURE_SGI_LABEL is not set
+# CONFIG_FEATURE_SUN_LABEL is not set
+# CONFIG_FEATURE_OSF_LABEL is not set
+# CONFIG_FEATURE_GPT_LABEL is not set
+CONFIG_FEATURE_FDISK_ADVANCED=y
+CONFIG_FINDFS=y
+CONFIG_FLOCK=y
+CONFIG_FREERAMDISK=y
+# CONFIG_FSCK_MINIX is not set
+CONFIG_MKFS_EXT2=y
+# CONFIG_MKFS_MINIX is not set
+# CONFIG_FEATURE_MINIX2 is not set
+# CONFIG_MKFS_REISER is not set
+CONFIG_MKFS_VFAT=y
+CONFIG_GETOPT=y
+CONFIG_FEATURE_GETOPT_LONG=y
+CONFIG_HEXDUMP=y
+CONFIG_FEATURE_HEXDUMP_REVERSE=y
+CONFIG_HD=y
+CONFIG_HWCLOCK=y
+CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=y
+CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
+# CONFIG_IPCRM is not set
+# CONFIG_IPCS is not set
+CONFIG_LOSETUP=y
+CONFIG_LSPCI=y
+CONFIG_LSUSB=y
+CONFIG_MDEV=y
+CONFIG_FEATURE_MDEV_CONF=y
+CONFIG_FEATURE_MDEV_RENAME=y
+CONFIG_FEATURE_MDEV_RENAME_REGEXP=y
+CONFIG_FEATURE_MDEV_EXEC=y
+CONFIG_FEATURE_MDEV_LOAD_FIRMWARE=y
+CONFIG_MKSWAP=y
+CONFIG_FEATURE_MKSWAP_UUID=y
+CONFIG_MORE=y
+CONFIG_MOUNT=y
+CONFIG_FEATURE_MOUNT_FAKE=y
+CONFIG_FEATURE_MOUNT_VERBOSE=y
+CONFIG_FEATURE_MOUNT_HELPERS=y
+CONFIG_FEATURE_MOUNT_LABEL=y
+CONFIG_FEATURE_MOUNT_NFS=y
+CONFIG_FEATURE_MOUNT_CIFS=y
+CONFIG_FEATURE_MOUNT_FLAGS=y
+CONFIG_FEATURE_MOUNT_FSTAB=y
+CONFIG_PIVOT_ROOT=y
+CONFIG_RDATE=y
+# CONFIG_RDEV is not set
+# CONFIG_READPROFILE is not set
+# CONFIG_RTCWAKE is not set
+CONFIG_SCRIPT=y
+CONFIG_SCRIPTREPLAY=y
+# CONFIG_SETARCH is not set
+CONFIG_SWAPONOFF=y
+CONFIG_FEATURE_SWAPON_PRI=y
+CONFIG_SWITCH_ROOT=y
+CONFIG_UMOUNT=y
+CONFIG_FEATURE_UMOUNT_ALL=y
+
+#
+# Common options for mount/umount
+#
+CONFIG_FEATURE_MOUNT_LOOP=y
+CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
+# CONFIG_FEATURE_MTAB_SUPPORT is not set
+CONFIG_VOLUMEID=y
+
+#
+# Filesystem/Volume identification
+#
+CONFIG_FEATURE_VOLUMEID_EXT=y
+CONFIG_FEATURE_VOLUMEID_BTRFS=y
+# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
+CONFIG_FEATURE_VOLUMEID_FAT=y
+CONFIG_FEATURE_VOLUMEID_HFS=y
+CONFIG_FEATURE_VOLUMEID_JFS=y
+# CONFIG_FEATURE_VOLUMEID_XFS is not set
+CONFIG_FEATURE_VOLUMEID_NTFS=y
+CONFIG_FEATURE_VOLUMEID_ISO9660=y
+CONFIG_FEATURE_VOLUMEID_UDF=y
+CONFIG_FEATURE_VOLUMEID_LUKS=y
+CONFIG_FEATURE_VOLUMEID_LINUXSWAP=y
+# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
+# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
+# CONFIG_FEATURE_VOLUMEID_SYSV is not set
+# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
+CONFIG_FEATURE_VOLUMEID_LINUXRAID=y
+
+#
+# Miscellaneous Utilities
+#
+# CONFIG_CONSPY is not set
+# CONFIG_NANDWRITE is not set
+# CONFIG_NANDDUMP is not set
+# CONFIG_UBIATTACH is not set
+# CONFIG_UBIDETACH is not set
+CONFIG_ADJTIMEX=y
+CONFIG_BBCONFIG=y
+CONFIG_FEATURE_COMPRESS_BBCONFIG=y
+CONFIG_BEEP=y
+CONFIG_FEATURE_BEEP_FREQ=4000
+CONFIG_FEATURE_BEEP_LENGTH_MS=30
+# CONFIG_CHAT is not set
+# CONFIG_FEATURE_CHAT_NOFAIL is not set
+# CONFIG_FEATURE_CHAT_TTY_HIFI is not set
+# CONFIG_FEATURE_CHAT_IMPLICIT_CR is not set
+# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
+# CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
+# CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
+# CONFIG_FEATURE_CHAT_CLR_ABORT is not set
+CONFIG_CHRT=y
+CONFIG_CROND=y
+# CONFIG_FEATURE_CROND_D is not set
+# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
+CONFIG_FEATURE_CROND_DIR="/var/spool/cron"
+CONFIG_CRONTAB=y
+CONFIG_DC=y
+# CONFIG_FEATURE_DC_LIBM is not set
+# CONFIG_DEVFSD is not set
+# CONFIG_DEVFSD_MODLOAD is not set
+# CONFIG_DEVFSD_FG_NP is not set
+# CONFIG_DEVFSD_VERBOSE is not set
+# CONFIG_FEATURE_DEVFS is not set
+# CONFIG_DEVMEM is not set
+# CONFIG_EJECT is not set
+# CONFIG_FEATURE_EJECT_SCSI is not set
+# CONFIG_FBSPLASH is not set
+# CONFIG_FLASHCP is not set
+# CONFIG_FLASH_LOCK is not set
+# CONFIG_FLASH_UNLOCK is not set
+# CONFIG_FLASH_ERASEALL is not set
+CONFIG_IONICE=y
+# CONFIG_INOTIFYD is not set
+# CONFIG_LAST is not set
+# CONFIG_FEATURE_LAST_SMALL is not set
+# CONFIG_FEATURE_LAST_FANCY is not set
+CONFIG_LESS=y
+CONFIG_FEATURE_LESS_MAXLINES=9999999
+CONFIG_FEATURE_LESS_BRACKETS=y
+CONFIG_FEATURE_LESS_FLAGS=y
+CONFIG_FEATURE_LESS_MARKS=y
+CONFIG_FEATURE_LESS_REGEXP=y
+# CONFIG_FEATURE_LESS_WINCH is not set
+# CONFIG_FEATURE_LESS_DASHCMD is not set
+# CONFIG_FEATURE_LESS_LINENUMS is not set
+# CONFIG_HDPARM is not set
+# CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
+# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
+# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
+CONFIG_MAKEDEVS=y
+# CONFIG_FEATURE_MAKEDEVS_LEAF is not set
+CONFIG_FEATURE_MAKEDEVS_TABLE=y
+# CONFIG_MAN is not set
+CONFIG_MICROCOM=y
+CONFIG_MOUNTPOINT=y
+# CONFIG_MT is not set
+CONFIG_RAIDAUTORUN=y
+CONFIG_READAHEAD=y
+# CONFIG_RFKILL is not set
+CONFIG_RUNLEVEL=y
+CONFIG_RX=y
+# CONFIG_SETSID is not set
+CONFIG_STRINGS=y
+# CONFIG_TASKSET is not set
+# CONFIG_FEATURE_TASKSET_FANCY is not set
+CONFIG_TIME=y
+CONFIG_TIMEOUT=y
+# CONFIG_TTYSIZE is not set
+CONFIG_VOLNAME=y
+CONFIG_WALL=y
+CONFIG_WATCHDOG=y
+
+#
+# Networking Utilities
+#
+CONFIG_NBDCLIENT=y
+CONFIG_NC=y
+CONFIG_NC_SERVER=y
+CONFIG_NC_EXTRA=y
+# CONFIG_NC_110_COMPAT is not set
+CONFIG_FEATURE_IPV6=y
+# CONFIG_FEATURE_UNIX_LOCAL is not set
+CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
+CONFIG_VERBOSE_RESOLUTION_ERRORS=y
+CONFIG_ARP=y
+CONFIG_ARPING=y
+CONFIG_BRCTL=y
+CONFIG_FEATURE_BRCTL_FANCY=y
+CONFIG_FEATURE_BRCTL_SHOW=y
+# CONFIG_DNSD is not set
+# CONFIG_ETHER_WAKE is not set
+# CONFIG_FAKEIDENTD is not set
+CONFIG_FTPD=y
+CONFIG_FEATURE_FTP_WRITE=y
+CONFIG_FEATURE_FTPD_ACCEPT_BROKEN_LIST=y
+# CONFIG_FTPGET is not set
+# CONFIG_FTPPUT is not set
+# CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
+CONFIG_HOSTNAME=y
+CONFIG_HTTPD=y
+CONFIG_FEATURE_HTTPD_RANGES=y
+CONFIG_FEATURE_HTTPD_USE_SENDFILE=y
+CONFIG_FEATURE_HTTPD_SETUID=y
+CONFIG_FEATURE_HTTPD_BASIC_AUTH=y
+CONFIG_FEATURE_HTTPD_AUTH_MD5=y
+CONFIG_FEATURE_HTTPD_CGI=y
+CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR=y
+CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV=y
+CONFIG_FEATURE_HTTPD_ENCODE_URL_STR=y
+CONFIG_FEATURE_HTTPD_ERROR_PAGES=y
+CONFIG_FEATURE_HTTPD_PROXY=y
+CONFIG_FEATURE_HTTPD_GZIP=y
+CONFIG_IFCONFIG=y
+CONFIG_FEATURE_IFCONFIG_STATUS=y
+# CONFIG_FEATURE_IFCONFIG_SLIP is not set
+# CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ is not set
+CONFIG_FEATURE_IFCONFIG_HW=y
+CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS=y
+# CONFIG_IFENSLAVE is not set
+CONFIG_IFPLUGD=y
+CONFIG_IFUPDOWN=y
+CONFIG_IFUPDOWN_IFSTATE_PATH="/var/run/ifstate"
+# CONFIG_FEATURE_IFUPDOWN_IP is not set
+# CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
+CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN=y
+CONFIG_FEATURE_IFUPDOWN_IPV4=y
+CONFIG_FEATURE_IFUPDOWN_IPV6=y
+# CONFIG_FEATURE_IFUPDOWN_MAPPING is not set
+# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
+# CONFIG_INETD is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
+# CONFIG_FEATURE_INETD_RPC is not set
+CONFIG_IP=y
+CONFIG_FEATURE_IP_ADDRESS=y
+CONFIG_FEATURE_IP_LINK=y
+CONFIG_FEATURE_IP_ROUTE=y
+CONFIG_FEATURE_IP_TUNNEL=y
+CONFIG_FEATURE_IP_RULE=y
+CONFIG_FEATURE_IP_SHORT_FORMS=y
+# CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
+CONFIG_IPADDR=y
+CONFIG_IPLINK=y
+CONFIG_IPROUTE=y
+CONFIG_IPTUNNEL=y
+CONFIG_IPRULE=y
+CONFIG_IPCALC=y
+CONFIG_FEATURE_IPCALC_FANCY=y
+CONFIG_FEATURE_IPCALC_LONG_OPTIONS=y
+# CONFIG_NAMEIF is not set
+# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
+CONFIG_NETSTAT=y
+CONFIG_FEATURE_NETSTAT_WIDE=y
+# CONFIG_FEATURE_NETSTAT_PRG is not set
+CONFIG_NSLOOKUP=y
+CONFIG_NTPD=y
+CONFIG_FEATURE_NTPD_SERVER=y
+CONFIG_PING=y
+CONFIG_PING6=y
+CONFIG_FEATURE_FANCY_PING=y
+CONFIG_PSCAN=y
+CONFIG_ROUTE=y
+# CONFIG_SLATTACH is not set
+# CONFIG_TCPSVD is not set
+CONFIG_TELNET=y
+CONFIG_FEATURE_TELNET_TTYPE=y
+CONFIG_FEATURE_TELNET_AUTOLOGIN=y
+# CONFIG_TELNETD is not set
+# CONFIG_FEATURE_TELNETD_STANDALONE is not set
+# CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
+CONFIG_TFTP=y
+# CONFIG_TFTPD is not set
+
+#
+# Common options for tftp/tftpd
+#
+CONFIG_FEATURE_TFTP_GET=y
+CONFIG_FEATURE_TFTP_PUT=y
+CONFIG_FEATURE_TFTP_BLOCKSIZE=y
+CONFIG_FEATURE_TFTP_PROGRESS_BAR=y
+# CONFIG_TFTP_DEBUG is not set
+CONFIG_TRACEROUTE=y
+CONFIG_TRACEROUTE6=y
+CONFIG_FEATURE_TRACEROUTE_VERBOSE=y
+CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE=y
+# CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
+CONFIG_TUNCTL=y
+CONFIG_FEATURE_TUNCTL_UG=y
+# CONFIG_UDHCPD is not set
+# CONFIG_DHCPRELAY is not set
+# CONFIG_DUMPLEASES is not set
+# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
+CONFIG_DHCPD_LEASES_FILE=""
+CONFIG_UDHCPC=y
+CONFIG_FEATURE_UDHCPC_ARPING=y
+# CONFIG_FEATURE_UDHCP_PORT is not set
+CONFIG_UDHCP_DEBUG=9
+# CONFIG_FEATURE_UDHCP_RFC3397 is not set
+CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
+CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=120
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
+# CONFIG_UDPSVD is not set
+CONFIG_VCONFIG=y
+CONFIG_WGET=y
+CONFIG_FEATURE_WGET_STATUSBAR=y
+CONFIG_FEATURE_WGET_AUTHENTICATION=y
+CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+CONFIG_FEATURE_WGET_TIMEOUT=y
+# CONFIG_ZCIP is not set
+
+#
+# Print Utilities
+#
+# CONFIG_LPD is not set
+# CONFIG_LPR is not set
+# CONFIG_LPQ is not set
+
+#
+# Mail Utilities
+#
+# CONFIG_MAKEMIME is not set
+CONFIG_FEATURE_MIME_CHARSET=""
+# CONFIG_POPMAILDIR is not set
+# CONFIG_FEATURE_POPMAILDIR_DELIVERY is not set
+# CONFIG_REFORMIME is not set
+# CONFIG_FEATURE_REFORMIME_COMPAT is not set
+# CONFIG_SENDMAIL is not set
+
+#
+# Process Utilities
+#
+CONFIG_IOSTAT=y
+CONFIG_MPSTAT=y
+CONFIG_PMAP=y
+CONFIG_POWERTOP=y
+CONFIG_SMEMCAP=y
+CONFIG_FREE=y
+CONFIG_FUSER=y
+CONFIG_KILL=y
+CONFIG_KILLALL=y
+CONFIG_KILLALL5=y
+# CONFIG_NMETER is not set
+# CONFIG_PGREP is not set
+CONFIG_PIDOF=y
+CONFIG_FEATURE_PIDOF_SINGLE=y
+CONFIG_FEATURE_PIDOF_OMIT=y
+CONFIG_PKILL=y
+CONFIG_PS=y
+CONFIG_FEATURE_PS_WIDE=y
+# CONFIG_FEATURE_PS_TIME is not set
+# CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is not set
+# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
+CONFIG_RENICE=y
+CONFIG_BB_SYSCTL=y
+CONFIG_TOP=y
+CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE=y
+CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
+# CONFIG_FEATURE_TOP_SMP_CPU is not set
+CONFIG_FEATURE_TOP_DECIMALS=y
+# CONFIG_FEATURE_TOP_SMP_PROCESS is not set
+CONFIG_FEATURE_TOPMEM=y
+CONFIG_FEATURE_SHOW_THREADS=y
+CONFIG_UPTIME=y
+CONFIG_WATCH=y
+
+#
+# Runit Utilities
+#
+# CONFIG_RUNSV is not set
+# CONFIG_RUNSVDIR is not set
+# CONFIG_FEATURE_RUNSVDIR_LOG is not set
+# CONFIG_SV is not set
+CONFIG_SV_DEFAULT_SERVICE_DIR=""
+# CONFIG_SVLOGD is not set
+# CONFIG_CHPST is not set
+# CONFIG_SETUIDGID is not set
+# CONFIG_ENVUIDGID is not set
+# CONFIG_ENVDIR is not set
+# CONFIG_SOFTLIMIT is not set
+# CONFIG_CHCON is not set
+# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
+# CONFIG_GETENFORCE is not set
+# CONFIG_GETSEBOOL is not set
+# CONFIG_LOAD_POLICY is not set
+# CONFIG_MATCHPATHCON is not set
+# CONFIG_RESTORECON is not set
+# CONFIG_RUNCON is not set
+# CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
+# CONFIG_SELINUXENABLED is not set
+# CONFIG_SETENFORCE is not set
+# CONFIG_SETFILES is not set
+# CONFIG_FEATURE_SETFILES_CHECK_OPTION is not set
+# CONFIG_SETSEBOOL is not set
+# CONFIG_SESTATUS is not set
+
+#
+# Shells
+#
+CONFIG_ASH=y
+CONFIG_ASH_BASH_COMPAT=y
+CONFIG_ASH_JOB_CONTROL=y
+CONFIG_ASH_ALIAS=y
+CONFIG_ASH_GETOPTS=y
+CONFIG_ASH_BUILTIN_ECHO=y
+CONFIG_ASH_BUILTIN_PRINTF=y
+CONFIG_ASH_BUILTIN_TEST=y
+CONFIG_ASH_CMDCMD=y
+# CONFIG_ASH_MAIL is not set
+CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
+CONFIG_ASH_RANDOM_SUPPORT=y
+CONFIG_ASH_EXPAND_PRMT=y
+CONFIG_CTTYHACK=y
+# CONFIG_HUSH is not set
+# CONFIG_HUSH_BASH_COMPAT is not set
+# CONFIG_HUSH_BRACE_EXPANSION is not set
+# CONFIG_HUSH_HELP is not set
+# CONFIG_HUSH_INTERACTIVE is not set
+# CONFIG_HUSH_SAVEHISTORY is not set
+# CONFIG_HUSH_JOB is not set
+# CONFIG_HUSH_TICK is not set
+# CONFIG_HUSH_IF is not set
+# CONFIG_HUSH_LOOPS is not set
+# CONFIG_HUSH_CASE is not set
+# CONFIG_HUSH_FUNCTIONS is not set
+# CONFIG_HUSH_LOCAL is not set
+# CONFIG_HUSH_RANDOM_SUPPORT is not set
+# CONFIG_HUSH_EXPORT_N is not set
+# CONFIG_HUSH_MODE_X is not set
+# CONFIG_MSH is not set
+CONFIG_FEATURE_SH_IS_ASH=y
+# CONFIG_FEATURE_SH_IS_HUSH is not set
+# CONFIG_FEATURE_SH_IS_NONE is not set
+# CONFIG_FEATURE_BASH_IS_ASH is not set
+# CONFIG_FEATURE_BASH_IS_HUSH is not set
+CONFIG_FEATURE_BASH_IS_NONE=y
+CONFIG_SH_MATH_SUPPORT=y
+CONFIG_SH_MATH_SUPPORT_64=y
+CONFIG_FEATURE_SH_EXTRA_QUIET=y
+# CONFIG_FEATURE_SH_STANDALONE is not set
+# CONFIG_FEATURE_SH_NOFORK is not set
+
+#
+# System Logging Utilities
+#
+CONFIG_SYSLOGD=y
+CONFIG_FEATURE_ROTATE_LOGFILE=y
+CONFIG_FEATURE_REMOTE_LOG=y
+CONFIG_FEATURE_SYSLOGD_DUP=y
+CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
+CONFIG_FEATURE_IPC_SYSLOG=y
+CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=16
+CONFIG_LOGREAD=y
+CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=y
+CONFIG_KLOGD=y
+CONFIG_FEATURE_KLOGD_KLOGCTL=y
+CONFIG_LOGGER=y
diff --git a/recipes/busybox/busybox-1.18.1/udhcpc-fix-nfsroot.patch b/recipes/busybox/busybox-1.18.1/udhcpc-fix-nfsroot.patch
new file mode 100644
index 0000000..3b975b6
--- /dev/null
+++ b/recipes/busybox/busybox-1.18.1/udhcpc-fix-nfsroot.patch
@@ -0,0 +1,47 @@
+Index: busybox-1.15.1/examples/udhcp/simple.script
+===================================================================
+--- busybox-1.15.1.orig/examples/udhcp/simple.script	2009-09-16 22:52:09.000000000 +0200
++++ busybox-1.15.1/examples/udhcp/simple.script	2009-09-16 22:57:11.424608476 +0200
+@@ -10,10 +10,17 @@ NETMASK=""
+ BROADCAST="broadcast +"
+ [ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
+ 
++# return 0 if root is mounted on a network filesystem
++root_is_nfs() {
++	grep -qe '^/dev/root.*\(nfs\|smbfs\|ncp\|coda\) .*' /proc/mounts
++}
++
+ case "$1" in
+ 	deconfig)
++		if ! root_is_nfs ; then
+ 		echo "Setting IP address 0.0.0.0 on $interface"
+-		ifconfig $interface 0.0.0.0
++			ifconfig $interface 0.0.0.0
++		fi
+ 		;;
+ 
+ 	renew|bound)
+@@ -21,15 +28,18 @@ case "$1" in
+ 		ifconfig $interface $ip $NETMASK $BROADCAST
+ 
+ 		if [ -n "$router" ] ; then
+-			echo "Deleting routers"
+-			while route del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
+-				:
+-			done
++			if ! root_is_nfs ; then
++				echo "Deleting routers"
++				while route del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
++					:
++				done
++			:
++		done
+ 
+ 			metric=0
+ 			for i in $router ; do
+ 				echo "Adding router $i"
+-				route add default gw $i dev $interface metric $((metric++))
++				route add default gw $i dev $interface metric $((metric++)) 2>/dev/null
+ 			done
+ 		fi
+ 
diff --git a/recipes/busybox/busybox-1.18.1/udhcpscript.patch b/recipes/busybox/busybox-1.18.1/udhcpscript.patch
new file mode 100644
index 0000000..2ffba95
--- /dev/null
+++ b/recipes/busybox/busybox-1.18.1/udhcpscript.patch
@@ -0,0 +1,13 @@
+Index: busybox-1.15.1/examples/udhcp/simple.script
+===================================================================
+--- busybox-1.15.1.orig/examples/udhcp/simple.script	2009-09-12 17:55:36.000000000 +0200
++++ busybox-1.15.1/examples/udhcp/simple.script	2009-09-16 22:51:06.599693412 +0200
+@@ -22,7 +22,7 @@ case "$1" in
+ 
+ 		if [ -n "$router" ] ; then
+ 			echo "Deleting routers"
+-			while route del default gw 0.0.0.0 dev $interface ; do
++			while route del default gw 0.0.0.0 dev $interface 2>/dev/null ; do
+ 				:
+ 			done
+ 
diff --git a/recipes/busybox/busybox_1.18.0.bb b/recipes/busybox/busybox_1.18.0.bb
deleted file mode 100644
index d11dffe..0000000
--- a/recipes/busybox/busybox_1.18.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require busybox_1.1x.inc
-PR = "${INC_PR}.3"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI += " \
-	file://busybox-1.18.0-buildsys.patch \
-	file://busybox-1.18.0-sha.patch \
-	file://busybox-1.18.0-runsvdir.patch \
-	"
-
-SRC_URI[md5sum] = "7a8150a10558a5292fa1f52f1c65b0f5"
-SRC_URI[sha256sum] = "3a9d5e6929045440ec3d0c9987376cbbb78e98886d6c5fa58fc2306d2662eb00"
-
diff --git a/recipes/busybox/busybox_1.18.1.bb b/recipes/busybox/busybox_1.18.1.bb
new file mode 100644
index 0000000..8fe1210
--- /dev/null
+++ b/recipes/busybox/busybox_1.18.1.bb
@@ -0,0 +1,13 @@
+require busybox_1.1x.inc
+PR = "${INC_PR}.0"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI += " \
+	file://busybox-1.18.1-hush.patch \
+	file://busybox-1.18.1-cpio.patch \
+	"
+
+SRC_URI[md5sum] = "f15fe752d8b7012aa5e59f83b88ccb1c"
+SRC_URI[sha256sum] = "33eb25ea7b20c727c3af769256b21408a1ac1f927ff9f89a1f1e3767c18c9967"
+
-- 
1.6.3.3



