Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 51B107503B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2019 18:07:59 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u6so17015591pfh.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2019 10:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qjw3032qnASckcOqmpcfcm4jz46nJSBKtcbTBjqZSKw=;
	b=YdvBEqwPmgmYS1BSTRzg69gekyeD+h+SCaOhssSDUEESSq7ix2ffsgnPoG/yeZ9uYS
	HPmImHJ1xz4tN6SSqrAOMdZ4WKRD6Pxqr+rXnqRjSKG+bQpGuX+teenV/PevsXRWP21Z
	o9fNdOHRtLutqfFqCCyGIEZk+mAWbmZDv6Bk7bva7oIjzY6wPq9qjuoqO35UdPVKmv2k
	zy+0OGGXmxv0/YurlLekRyO/dxoZdrRW4L/lpa1L2DQJ8uA97pMXiE0JKj44/GS5BzfN
	Ml4kYNWDrki2jfGSZK2O/Ro4azcqMsERX2qVOGiuDWXc9WmffuajzXsKzjXjCbfQVqvy
	meaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qjw3032qnASckcOqmpcfcm4jz46nJSBKtcbTBjqZSKw=;
	b=Bn2hn3uSkBjCrwXarRj+WqPtWgr6TPbnNlpG0KjBKkwb7JWKMpK8DQEVRsQaC+L9SK
	1iPzgr87C+tT5Y0t3X+g07WenGdOOMw9ehggNilKhsbOJU6yCLk4aAd/KuHbBoxve52z
	VXT/HyJYeCntDn1ietETwXYk/fcKDtp2XSfGDro57FLRsFlXZDBvYRj3gQf68gJf2fIS
	t7NcqNRYUVF7p9fPyXrwBhXKX0433oz2lqAEV7DWzf8EUZIWLILn56edt9qFzPOG12x5
	6Iex1JPvVpJv2R9XmzZSJpj4hEy+sPQkA0I2YrA4WeYrAvg6N0qxU1IGFroedAudQr4v
	4lLw==
X-Gm-Message-State: AJcUukcdhg/O0yasu07sgI/mzSYU3mFo0WPQ6jmYXFPXLFq5gqD06f/D
	xbETNhnJ3v8WA29wjjomRHuPTuFJEB0=
X-Google-Smtp-Source: ALg8bN5M5WIXha80YXz/E9CxR2skQA42t0OzTN0uM+HpYF7GI2kkrzjQLM5AjaUg1pBdwwYzYIPpHA==
X-Received: by 2002:a62:64d7:: with SMTP id y206mr9785922pfb.84.1546538879119; 
	Thu, 03 Jan 2019 10:07:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6ee7])
	by smtp.gmail.com with ESMTPSA id
	m67sm75487168pfm.73.2019.01.03.10.07.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Jan 2019 10:07:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2019 10:07:49 -0800
Message-Id: <20190103180751.24958-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] start-stop-daemon: Upgrade to 1.18.25
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
X-List-Received-Date: Thu, 03 Jan 2019 18:07:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Import patches from oe-core to fix build  for mips64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Add-linux-musleabi-to-ostable.patch  | 39 ---------
 .../0001-dpkg-Support-muslx32-build.patch     | 41 +++++++++
 ...rs-kernel-version-which-has-characte.patch | 38 ++++++++
 ...s-expect-D-to-be-set-when-running-in.patch | 75 ++++++++++++++++
 ...tion-doesn-t-work-properly-for-all-s.patch | 31 +++++++
 .../0005-dpkg-compiler.m4-remove-Wvla.patch   | 36 ++++++++
 ...add-musleabi-to-known-target-tripets.patch | 42 +++++++++
 ...c-Remove-usage-of-clamp-mtime-in-tar.patch | 39 +++++++++
 .../add_armeb_triplet_entry.patch             | 48 ++++++++++
 .../start-stop-daemon/arch_pm.patch           | 29 +++++++
 .../start-stop-daemon/noman.patch             | 22 +++++
 .../remove-tar-no-timestamp.patch             | 17 ++++
 .../start-stop-daemon_1.17.25.bb              | 39 ---------
 .../start-stop-daemon_1.18.25.bb              | 87 +++++++++++++++++++
 14 files changed, 505 insertions(+), 78 deletions(-)
 delete mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0001-Add-linux-musleabi-to-ostable.patch
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0001-dpkg-Support-muslx32-build.patch
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0005-dpkg-compiler.m4-remove-Wvla.patch
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0006-add-musleabi-to-known-target-tripets.patch
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/add_armeb_triplet_entry.patch
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/arch_pm.patch
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/noman.patch
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/remove-tar-no-timestamp.patch
 delete mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb
 create mode 100644 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.18.25.bb

diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0001-Add-linux-musleabi-to-ostable.patch b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0001-Add-linux-musleabi-to-ostable.patch
deleted file mode 100644
index 269441fc8b..0000000000
--- a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0001-Add-linux-musleabi-to-ostable.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 087840efdbc86b1432ebdd81f25b4cb78c75f818 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 11 Sep 2018 12:28:10 -0700
-Subject: [PATCH] Add linux-musleabi to ostable
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ostable      | 1 +
- triplettable | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/ostable b/ostable
-index 3bb6819..d0ffdc7 100644
---- a/ostable
-+++ b/ostable
-@@ -15,6 +15,7 @@
- uclibceabi-linux	linux-uclibceabi	linux[^-]*-uclibceabi
- uclibc-linux		linux-uclibc		linux[^-]*-uclibc
- musleabihf-linux	linux-musleabihf	linux[^-]*-musleabihf
-+musleabi-linux		linux-musleabi		linux[^-]*-musleabi
- musl-linux		linux-musl		linux[^-]*-musl
- gnueabihf-linux		linux-gnueabihf		linux[^-]*-gnueabihf
- gnueabi-linux		linux-gnueabi		linux[^-]*-gnueabi
-diff --git a/triplettable b/triplettable
-index 7257744..45864c3 100644
---- a/triplettable
-+++ b/triplettable
-@@ -6,6 +6,7 @@
- uclibceabi-linux-arm	uclibc-linux-armel
- uclibc-linux-<cpu>	uclibc-linux-<cpu>
- musleabihf-linux-arm	musl-linux-armhf
-+musleabi-linux-arm	musl-linux-arm
- musl-linux-<cpu>	musl-linux-<cpu>
- gnueabihf-linux-arm	armhf
- gnueabi-linux-arm	armel
--- 
-2.18.0
-
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0001-dpkg-Support-muslx32-build.patch b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0001-dpkg-Support-muslx32-build.patch
new file mode 100644
index 0000000000..50e6894406
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0001-dpkg-Support-muslx32-build.patch
@@ -0,0 +1,41 @@
+From a328c8bec0bf8071ae8f20fee4c7475205064ba1 Mon Sep 17 00:00:00 2001
+From: sweeaun <swee.aun.khor@intel.com>
+Date: Sun, 10 Sep 2017 00:14:15 -0700
+Subject: [PATCH] dpkg: Support muslx32 build
+
+Upstream-Status: Pending.
+Changes made on ostable and tupletable to enable muslx32 build.
+
+Signed-off-by: sweeaun <swee.aun.khor@intel.com>
+---
+ data/ostable    | 1 +
+ data/tupletable | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/data/ostable b/data/ostable
+index be64342..87db273 100644
+--- a/data/ostable
++++ b/data/ostable
+@@ -19,6 +19,7 @@ base-uclibc-linux	linux-uclibc		linux[^-]*-uclibc
+ eabihf-musl-linux	linux-musleabihf	linux[^-]*-musleabihf
+ eabi-musl-linux		linux-musleabi		linux[^-]*-musleabi
+ base-musl-linux		linux-musl		linux[^-]*-musl
++x32-musl-linux		linux-muslx32		linux[^-]*-muslx32
+ eabihf-gnu-linux	linux-gnueabihf		linux[^-]*-gnueabihf
+ eabi-gnu-linux		linux-gnueabi		linux[^-]*-gnueabi
+ abin32-gnu-linux	linux-gnuabin32		linux[^-]*-gnuabin32
+diff --git a/data/tupletable b/data/tupletable
+index 28f00bf..748ffab 100644
+--- a/data/tupletable
++++ b/data/tupletable
+@@ -10,6 +10,7 @@ base-uclibc-linux-<cpu>		uclibc-linux-<cpu>
+ eabihf-musl-linux-arm		musl-linux-armhf
+ eabi-musl-linux-arm		musl-linux-armel
+ base-musl-linux-<cpu>		musl-linux-<cpu>
++x32-musl-linux-amd64		x32
+ ilp32-gnu-linux-arm64		arm64ilp32
+ eabihf-gnu-linux-arm		armhf
+ eabi-gnu-linux-arm		armel
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
new file mode 100644
index 0000000000..9fe0ca7600
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
@@ -0,0 +1,38 @@
+From b4ea54158c399874e12394ebc91afe98954695e2 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 26 Aug 2015 16:16:16 +0300
+Subject: [PATCH 2/5] Adapt to linux-wrs kernel version, which has character
+ '_' inside. Remove the first-char-digit-check (as the 1.15.8.5 version does).
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ lib/dpkg/parsehelp.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/lib/dpkg/parsehelp.c b/lib/dpkg/parsehelp.c
+index 453077fd9..f42ea2882 100644
+--- a/lib/dpkg/parsehelp.c
++++ b/lib/dpkg/parsehelp.c
+@@ -243,14 +243,12 @@ parseversion(struct dpkg_version *rversion, const char *string,
+   ptr = rversion->version;
+   if (!*ptr)
+     return dpkg_put_error(err, _("version number is empty"));
+-  if (*ptr && !c_isdigit(*ptr++))
+-    return dpkg_put_warn(err, _("version number does not start with digit"));
+   for (; *ptr; ptr++) {
+-    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".-+~:", *ptr) == NULL)
++    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".-+~:_", *ptr) == NULL)
+       return dpkg_put_warn(err, _("invalid character in version number"));
+   }
+   for (ptr = rversion->revision; *ptr; ptr++) {
+-    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".+~", *ptr) == NULL)
++    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".-+~_", *ptr) == NULL)
+       return dpkg_put_warn(err, _("invalid character in revision number"));
+   }
+ 
+
+-- 
+2.11.0
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
new file mode 100644
index 0000000000..93d870443c
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
@@ -0,0 +1,75 @@
+From 24229971492515b64c81e8c6392e5dfbdc22b44c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 26 Aug 2015 16:25:45 +0300
+Subject: [PATCH 3/5] Our pre/postinsts expect $D to be set when running in a
+ sysroot and don't expect a chroot. This matches up our system expectations
+ with what dpkg does.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+RP 2011/12/07
+ALIMON 2016/05/26
+ALIMON 2017/02/21
+---
+ src/script.c | 44 +++-----------------------------------------
+ 1 file changed, 3 insertions(+), 41 deletions(-)
+
+diff --git a/src/script.c b/src/script.c
+index 2f252ae..768a9d1 100644
+--- a/src/script.c
++++ b/src/script.c
+@@ -97,48 +97,10 @@ setexecute(const char *path, struct stat *stab)
+ static const char *
+ maintscript_pre_exec(struct command *cmd)
+ {
+-	const char *admindir = dpkg_db_get_dir();
+-	const char *changedir;
+-	size_t instdirlen = strlen(instdir);
+-
+-	if (instdirlen > 0 && fc_script_chrootless)
+-		changedir = instdir;
+-	else
+-		changedir = "/";
+-
+-	if (instdirlen > 0 && !fc_script_chrootless) {
+-		if (strncmp(admindir, instdir, instdirlen) != 0)
+-			ohshit(_("admindir must be inside instdir for dpkg to work properly"));
+-		if (setenv("DPKG_ADMINDIR", admindir + instdirlen, 1) < 0)
+-			ohshite(_("unable to setenv for subprocesses"));
+-		if (setenv("DPKG_ROOT", "", 1) < 0)
+-			ohshite(_("unable to setenv for subprocesses"));
+-
+-		if (chroot(instdir))
+-			ohshite(_("failed to chroot to '%.250s'"), instdir);
++	if (*instdir) {
++		setenv("D", instdir, 1);
+ 	}
+-	/* Switch to a known good directory to give the maintainer script
+-	 * a saner environment, also needed after the chroot(). */
+-	if (chdir(changedir))
+-		ohshite(_("failed to chdir to '%.255s'"), changedir);
+-	if (debug_has_flag(dbg_scripts)) {
+-		struct varbuf args = VARBUF_INIT;
+-		const char **argv = cmd->argv;
+-
+-		while (*++argv) {
+-			varbuf_add_char(&args, ' ');
+-			varbuf_add_str(&args, *argv);
+-		}
+-		varbuf_end_str(&args);
+-		debug(dbg_scripts, "fork/exec %s (%s )", cmd->filename,
+-		      args.buf);
+-		varbuf_destroy(&args);
+-	}
+-	if (instdirlen == 0 || fc_script_chrootless)
+-		return cmd->filename;
+-
+-	assert(strlen(cmd->filename) >= instdirlen);
+-	return cmd->filename + instdirlen;
++	return cmd->filename;
+ }
+ 
+ /**
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
new file mode 100644
index 0000000000..56c85c7733
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
@@ -0,0 +1,31 @@
+From adb6bfd0feeceaf030df0debe3343d7f73e708a0 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 26 Aug 2015 16:27:45 +0300
+Subject: [PATCH 4/5] The lutimes function doesn't work properly for all
+ systems.
+
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ src/archives.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/archives.c b/src/archives.c
+index bff5f14..b711013 100644
+--- a/src/archives.c
++++ b/src/archives.c
+@@ -449,8 +449,9 @@ tarobject_set_mtime(struct tar_entry *te, const char *path)
+ 
+   if (te->type == TAR_FILETYPE_SYMLINK) {
+ #ifdef HAVE_LUTIMES
+-    if (lutimes(path, tv) && errno != ENOSYS)
++/*    if (lutimes(path, tv) && errno != ENOSYS)
+       ohshite(_("error setting timestamps of '%.255s'"), path);
++*/
+ #endif
+   } else {
+     if (utimes(path, tv))
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0005-dpkg-compiler.m4-remove-Wvla.patch b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0005-dpkg-compiler.m4-remove-Wvla.patch
new file mode 100644
index 0000000000..96e96f277b
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0005-dpkg-compiler.m4-remove-Wvla.patch
@@ -0,0 +1,36 @@
+From 0ad7bba80d5b9035089ff2b2f77a774b5b201915 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 26 Aug 2015 16:28:59 +0300
+Subject: [PATCH 5/5] dpkg-compiler.m4: remove -Wvla
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Remove the -Wvla flag from the set of compiler warning flags, since gcc
+on old host systems such as CentOS 5.8 doesn't support it, and it
+causes a build error for dpkg-native.
+
+Upstream-Status: Pending
+
+Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+---
+ m4/dpkg-compiler.m4 | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/m4/dpkg-compiler.m4 b/m4/dpkg-compiler.m4
+index 682857c..23ed7d0 100644
+--- a/m4/dpkg-compiler.m4
++++ b/m4/dpkg-compiler.m4
+@@ -52,7 +52,6 @@ AC_DEFUN([DPKG_CHECK_COMPILER_WARNINGS], [
+   DPKG_CHECK_COMPILER_FLAG([-Wlogical-op])
+   DPKG_CHECK_COMPILER_FLAG([-Wlogical-not-parentheses])
+   DPKG_CHECK_COMPILER_FLAG([-Wswitch-bool])
+-  DPKG_CHECK_COMPILER_FLAG([-Wvla])
+   DPKG_CHECK_COMPILER_FLAG([-Winit-self])
+   DPKG_CHECK_COMPILER_FLAG([-Wwrite-strings])
+   DPKG_CHECK_COMPILER_FLAG([-Wcast-align])
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0006-add-musleabi-to-known-target-tripets.patch b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0006-add-musleabi-to-known-target-tripets.patch
new file mode 100644
index 0000000000..8797ea55c6
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0006-add-musleabi-to-known-target-tripets.patch
@@ -0,0 +1,42 @@
+From f8910022dc3ec622272f168cd0022dbdf6dff93a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Dec 2015 23:05:41 +0000
+Subject: [PATCH] add musleabi to known target tripets
+
+helps compiling dpkg for musl/arm-softfloat
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+---
+ data/ostable    | 1 +
+ data/tupletable | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/data/ostable b/data/ostable
+index 99c1f889d..be6434271 100644
+--- a/data/ostable
++++ b/data/ostable
+@@ -17,6 +17,7 @@
+ eabi-uclibc-linux	linux-uclibceabi	linux[^-]*-uclibceabi
+ base-uclibc-linux	linux-uclibc		linux[^-]*-uclibc
+ eabihf-musl-linux	linux-musleabihf	linux[^-]*-musleabihf
++eabi-musl-linux		linux-musleabi		linux[^-]*-musleabi
+ base-musl-linux		linux-musl		linux[^-]*-musl
+ eabihf-gnu-linux	linux-gnueabihf		linux[^-]*-gnueabihf
+ eabi-gnu-linux		linux-gnueabi		linux[^-]*-gnueabi
+diff --git a/data/tupletable b/data/tupletable
+index 5f500f6ca..28f00bfe6 100644
+--- a/data/tupletable
++++ b/data/tupletable
+@@ -8,6 +8,7 @@
+ eabi-uclibc-linux-arm		uclibc-linux-armel
+ base-uclibc-linux-<cpu>		uclibc-linux-<cpu>
+ eabihf-musl-linux-arm		musl-linux-armhf
++eabi-musl-linux-arm		musl-linux-armel
+ base-musl-linux-<cpu>		musl-linux-<cpu>
+ ilp32-gnu-linux-arm64		arm64ilp32
+ eabihf-gnu-linux-arm		armhf
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
new file mode 100644
index 0000000000..1b985df0f5
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
@@ -0,0 +1,39 @@
+From 8659eeeeda74d71e12080121f0b13a88cbdda433 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+Date: Tue, 21 Feb 2017 11:23:27 -0600
+Subject: [PATCH] dpkg-deb/build.c: Remove usage of --clamp-mtime in tar
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Recently dpkg added --clamp-mtime to tar to create reproducible
+build tarballs [1].
+
+But host tools doesn't support this option because is new on tar
+so disable in our builds.
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+
+Upstream-Status: Inappropriate [Configuration]
+
+[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=759999#20
+[2] https://lists.gnu.org/archive/html/help-tar/2016-01/msg00000.html
+---
+ dpkg-deb/build.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
+index a92b58e..a3d1912 100644
+--- a/dpkg-deb/build.c
++++ b/dpkg-deb/build.c
+@@ -450,7 +450,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+ 
+     command_init(&cmd, TAR, "tar -cf");
+     command_add_args(&cmd, "tar", "-cf", "-", "--format=gnu",
+-                           "--mtime", mtime, "--clamp-mtime", NULL);
++                           "--mtime", mtime, NULL);
+     /* Mode might become a positional argument, pass it before -T. */
+     if (mode)
+       command_add_args(&cmd, "--mode", mode, NULL);
+-- 
+2.11.0
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/add_armeb_triplet_entry.patch b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/add_armeb_triplet_entry.patch
new file mode 100644
index 0000000000..d165616a19
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/add_armeb_triplet_entry.patch
@@ -0,0 +1,48 @@
+Author: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
+Date:   Wed Apr 8 18:08:14 2015 +0530
+
+[PATCH] add armeb triplet entry into triplettable.
+
+Cross-compling dpkg application for armeb fails with below error
+during configure task,
+
+(snip)
+ configure:23141: checking dpkg cpu type
+ configure:23148: result: armeb
+ configure:23150: WARNING: armeb not found in cputable
+ configure:23162: checking dpkg operating system type
+ configure:23169: result: linux-gnueabi
+ configure:23171: WARNING: linux-gnueabi not found in ostable
+ configure:23183: checking dpkg architecture name
+ configure:23189: error: cannot determine host dpkg architecture
+-- CUT --
+
+the required combination of "gnueabi-linux-armeb" was not found in
+the triplettable file thereby returning dpkg_arch as
+empty in configure script.
+
+Upstream-Status: Pending
+
+Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+
+---
+ data/tupletable | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/data/tupletable b/data/tupletable
+index b7802bec3..5f500f6ca 100644
+--- a/data/tupletable
++++ b/data/tupletable
+@@ -12,6 +12,7 @@ base-musl-linux-<cpu>		musl-linux-<cpu>
+ ilp32-gnu-linux-arm64		arm64ilp32
+ eabihf-gnu-linux-arm		armhf
+ eabi-gnu-linux-arm		armel
++eabi-gnu-linux-armeb		armeb
+ abin32-gnu-linux-mips64r6el	mipsn32r6el
+ abin32-gnu-linux-mips64r6	mipsn32r6
+ abin32-gnu-linux-mips64el	mipsn32el
+-- 
+2.11.0
+
+
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/arch_pm.patch b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/arch_pm.patch
new file mode 100644
index 0000000000..4e0d22acbb
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/arch_pm.patch
@@ -0,0 +1,29 @@
+configure cannot determine the proper cpu, os, or
+architecture for mips64, and possibly other arch's
+because of faulty code added to Arch.pm in the latest
+release from upstream.  We remove that code.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+---
+ scripts/Dpkg/Arch.pm | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/scripts/Dpkg/Arch.pm b/scripts/Dpkg/Arch.pm
+index 1720847b8..6345ce3b9 100644
+--- a/scripts/Dpkg/Arch.pm
++++ b/scripts/Dpkg/Arch.pm
+@@ -323,9 +323,6 @@ sub _load_tupletable()
+ 		    (my $dt = $debtuple) =~ s/<cpu>/$_cpu/;
+ 		    (my $da = $debarch) =~ s/<cpu>/$_cpu/;
+ 
+-		    next if exists $debarch_to_debtuple{$da}
+-		         or exists $debtuple_to_debarch{$dt};
+-
+ 		    $debarch_to_debtuple{$da} = $dt;
+ 		    $debtuple_to_debarch{$dt} = $da;
+ 		}
+-- 
+2.11.0
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/noman.patch b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/noman.patch
new file mode 100644
index 0000000000..a7f3cb8f45
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/noman.patch
@@ -0,0 +1,22 @@
+Upstream-Status: Inappropriate [disable feature]
+
+---
+ Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 0da52cb16..a1f79e0a2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -13,8 +13,7 @@ SUBDIRS = \
+ 	$(MAYBE_DSELECT) \
+ 	scripts \
+ 	t-func \
+-	po \
+-	man
++	po
+ 
+ ACLOCAL_AMFLAGS = -I m4
+ 
+-- 
+2.11.0
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/remove-tar-no-timestamp.patch b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/remove-tar-no-timestamp.patch
new file mode 100644
index 0000000000..4f408ff777
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon/remove-tar-no-timestamp.patch
@@ -0,0 +1,17 @@
+busybox-1.19.4 tar utility doesn't support --warning=no-timestamp
+
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+Index: dpkg-1.17.1/dpkg-deb/extract.c
+===================================================================
+--- dpkg-1.17.1.orig/dpkg-deb/extract.c
++++ dpkg-1.17.1/dpkg-deb/extract.c
+@@ -318,7 +318,6 @@ extracthalf(const char *debar, const cha
+ 
+       command_add_arg(&cmd, "-f");
+       command_add_arg(&cmd, "-");
+-      command_add_arg(&cmd, "--warning=no-timestamp");
+ 
+       m_dup2(p2[0],0);
+       close(p2[0]);
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb
deleted file mode 100644
index b9b22a316e..0000000000
--- a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Debian's start-stop-daemon utility extracted from the dpkg \
-package"
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://utils/start-stop-daemon.c;endline=21;md5=8fbd0497a7d0b01e99820bffcb58e9ad"
-# start-stop-daemon is usually shipped by dpkg
-DEPENDS = "ncurses"
-RCONFLICTS_${PN} = "dpkg"
-
-SRC_URI = " \
-    ${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz \
-    file://0001-dpkg-start-stop-daemon-Accept-SIG-prefixed-signal-na.patch \
-    file://0001-Add-linux-musleabi-to-ostable.patch \
-"
-
-SRC_URI[md5sum] = "e48fcfdb2162e77d72c2a83432d537ca"
-SRC_URI[sha256sum] = "07019d38ae98fb107c79dbb3690cfadff877f153b8c4970e3a30d2e59aa66baa"
-
-inherit autotools gettext pkgconfig
-
-S = "${WORKDIR}/dpkg-${PV}"
-
-EXTRA_OECONF = " \
-    --without-bz2 \
-    --without-selinux \
-"
-
-do_install_append () {
-    # remove everything that is not related to start-stop-daemon, since there
-    # is no explicit rule for only installing ssd
-    find ${D} -type f -not -name "*start-stop-daemon*" -exec rm {} \;
-    find ${D} -depth -type d -empty -exec rmdir {} \;
-
-    # support for buggy init.d scripts that refer to an alternative
-    # explicit path to start-stop-daemon
-    if [ "${base_sbindir}" != "${sbindir}" ]; then
-        mkdir -p ${D}${base_sbindir}
-        ln -sf ${sbindir}/start-stop-daemon ${D}${base_sbindir}/start-stop-daemon
-    fi
-}
diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.18.25.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.18.25.bb
new file mode 100644
index 0000000000..b372d3c4a1
--- /dev/null
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.18.25.bb
@@ -0,0 +1,87 @@
+SUMMARY = "Debian's start-stop-daemon utility extracted from the dpkg \
+package"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://utils/start-stop-daemon.c;endline=21;md5=8fbd0497a7d0b01e99820bffcb58e9ad"
+DEPENDS = "zlib bzip2 perl ncurses"
+# start-stop-daemon is usually shipped by dpkg
+RCONFLICTS_${PN} = "dpkg"
+
+SRC_URI = " \
+    ${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz \
+    file://0001-dpkg-start-stop-daemon-Accept-SIG-prefixed-signal-na.patch \
+    file://noman.patch \
+    file://remove-tar-no-timestamp.patch \
+    file://arch_pm.patch \
+    file://add_armeb_triplet_entry.patch \
+    file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
+    file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
+    file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
+    file://0005-dpkg-compiler.m4-remove-Wvla.patch \
+    file://0006-add-musleabi-to-known-target-tripets.patch \
+    file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
+    file://0001-dpkg-Support-muslx32-build.patch \
+"
+SRC_URI[md5sum] = "e463f58b04acb23659df23d2a7a05cff"
+SRC_URI[sha256sum] = "c49c371953aea03f543814dcae37c069e86069333fb2e24e9252e76647663492"
+
+inherit autotools gettext perlnative pkgconfig perl-version
+
+S = "${WORKDIR}/dpkg-${PV}"
+
+EXTRA_OECONF = "\
+                --disable-dselect \
+                --enable-start-stop-daemon \
+                --with-libz \
+                --with-libbz2 \
+                --without-libselinux \
+                "
+
+PACKAGECONFIG = "liblzma"
+PACKAGECONFIG[liblzma] = "--with-liblzma,--without-liblzma, xz"
+
+export PERL = "${bindir}/perl"
+export PERL_LIBDIR = "${libdir}/perl/${@get_perl_version(d)}"
+EXTRA_OECONF += "TAR=tar"
+
+EXTRA_OECONF_append_class-target = " DEB_HOST_ARCH=${DPKG_ARCH}"
+
+DPKG_ARCH ??= "${@deb_arch_map(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'))}"
+
+def deb_arch_map(arch, tune):
+    tune_features = tune.split()
+    if arch == "allarch":
+        return "all"
+    if arch in ["i586", "i686"]:
+        return "i386"
+    if arch == "x86_64":
+        if "mx32" in tune_features:
+            return "x32"
+        return "amd64"
+    if arch.startswith("mips"):
+        endian = ["el", ""]["bigendian" in tune_features]
+        if "n64" in tune_features:
+            return "mips64" + endian
+        if "n32" in tune_features:
+            return "mipsn32" + endian
+        return "mips" + endian
+    if arch == "powerpc":
+        return arch + ["", "spe"]["spe" in tune_features]
+    if arch == "aarch64":
+        return "arm64"
+    if arch == "arm":
+        return arch + ["el", "hf"]["callconvention-hard" in tune_features]
+    return arch
+
+do_install_append () {
+    # remove everything that is not related to start-stop-daemon, since there
+    # is no explicit rule for only installing ssd
+    find ${D} -type f -not -name "*start-stop-daemon*" -exec rm {} \;
+    find ${D} -depth -type d -empty -exec rmdir {} \;
+
+    # support for buggy init.d scripts that refer to an alternative
+    # explicit path to start-stop-daemon
+    if [ "${base_sbindir}" != "${sbindir}" ]; then
+        mkdir -p ${D}${base_sbindir}
+        ln -sf ${sbindir}/start-stop-daemon ${D}${base_sbindir}/start-stop-daemon
+    fi
+}
-- 
2.20.1


