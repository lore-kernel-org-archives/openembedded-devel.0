Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1BAA6057A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 05:41:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAG5fWdq008245
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 21:41:32 -0800 (PST)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 15 Nov 2016 21:41:31 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Nov 2016 13:41:30 +0800
Message-ID: <1479274890-5588-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lvm2: 2.02.138 -> 2.02.166
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
X-List-Received-Date: Wed, 16 Nov 2016 05:41:31 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc              |  12 +-
 ...01-implement-libc-specific-_reopen_stream.patch | 139 ---------------------
 ...001-implement-libc-specific-reopen_stream.patch |  80 ++++++++++++
 ...002-Guard-use-of-mallinfo-with-__GLIBC__.patch} |  19 +--
 ..._MUTEX_RECURSIVE-instead-of-PTHREAD_MUTEX.patch |  44 -------
 ...ntl.h-for-O_-defines-and-fcntl-signature.patch} |  15 +--
 ...004-tweak-MODPROBE_CMD-for-cross-compile.patch} |  22 ++--
 meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb      |   6 +
 8 files changed, 120 insertions(+), 217 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-_reopen_stream.patch
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reopen_stream.patch
 rename meta-oe/recipes-support/lvm2/lvm2/{0003-Guard-use-of-mallinfo-with-__GLIBC__.patch => 0002-Guard-use-of-mallinfo-with-__GLIBC__.patch} (53%)
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0002-use-PTHREAD_MUTEX_RECURSIVE-instead-of-PTHREAD_MUTEX.patch
 rename meta-oe/recipes-support/lvm2/lvm2/{0004-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch => 0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch} (64%)
 rename meta-oe/recipes-support/lvm2/lvm2/{0005-tweak-MODPROBE_CMD-for-cross-compile.patch => 0004-tweak-MODPROBE_CMD-for-cross-compile.patch} (70%)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 74b7211..7bd26c0 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -2,18 +2,16 @@ SECTION = "utils"
 DESCRIPTION = "LVM2 is a set of utilities to manage logical volumes in Linux."
 DEPENDS = "udev"
 LICENSE = "GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+LIC_FILES_CHKSUM = "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"
 
 SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
            file://lvm.conf \
-           file://0001-implement-libc-specific-_reopen_stream.patch \
-           file://0002-use-PTHREAD_MUTEX_RECURSIVE-instead-of-PTHREAD_MUTEX.patch \
-           file://0003-Guard-use-of-mallinfo-with-__GLIBC__.patch \
-           file://0004-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch \
-           file://0005-tweak-MODPROBE_CMD-for-cross-compile.patch \
+           file://0001-implement-libc-specific-reopen_stream.patch \
+           file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
+           file://0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch \
+           file://0004-tweak-MODPROBE_CMD-for-cross-compile.patch \
            "
-
 S = "${WORKDIR}/LVM2.${PV}"
 
 inherit autotools-brokensep pkgconfig systemd
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-_reopen_stream.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-_reopen_stream.patch
deleted file mode 100644
index f0b4e71..0000000
--- a/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-_reopen_stream.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-From 089c9c701a1b68b721f479dfc0c58c35b9dd4175 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 20 Jan 2016 04:39:53 +0000
-Subject: [PATCH 1/4] implement libc specific _reopen_stream
-
-musl defines stdin/stdio/stderr as constant types which means
-we can not assign to them as we are doing here but works ok with glibc
-therefore abstract out the _reopen_stream definition depending upon if
-we are using glibc or otherwise
-
-Origin:
-http://git.alpinelinux.org/cgit/aports/tree/main/lvm2/fix-stdio-usage.patch
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- lib/commands/toolcontext.c | 22 +++++++++++-----------
- tools/lvmcmdline.c         |  6 +++---
- 2 files changed, 14 insertions(+), 14 deletions(-)
-
-diff --git a/lib/commands/toolcontext.c b/lib/commands/toolcontext.c
-index a2f21b8..7f796e4 100644
---- a/lib/commands/toolcontext.c
-+++ b/lib/commands/toolcontext.c
-@@ -1637,7 +1637,10 @@ static void _init_globals(struct cmd_context *cmd)
- /*
-  * Close and reopen stream on file descriptor fd.
-  */
--static int _reopen_stream(FILE *stream, int fd, const char *mode, const char *name, FILE **new_stream)
-+#ifdef __GLIBC__
-+#define _reopen_stream(stream, fd, mode, name) __reopen_stream(stream, fd, mode, name, &stream)
-+
-+static int __reopen_stream(FILE *stream, int fd, const char *mode, const char *name, FILE **new_stream)
- {
- 	int fd_copy, new_fd;
- 
-@@ -1664,6 +1667,9 @@ static int _reopen_stream(FILE *stream, int fd, const char *mode, const char *na
- 
- 	return 1;
- }
-+#else
-+#define _reopen_stream(stream, fd, mode, name) (freopen(NULL, mode, stream) != NULL)
-+#endif
- 
- static int _init_lvmetad(struct cmd_context *cmd)
- {
-@@ -1741,7 +1747,6 @@ struct cmd_context *create_toolcontext(unsigned is_long_lived,
- 				       unsigned set_filters)
- {
- 	struct cmd_context *cmd;
--	FILE *new_stream;
- 	int flags;
- 
- #ifdef M_MMAP_MAX
-@@ -1791,9 +1796,8 @@ struct cmd_context *create_toolcontext(unsigned is_long_lived,
- 		if (is_valid_fd(STDIN_FILENO) &&
- 		    ((flags = fcntl(STDIN_FILENO, F_GETFL)) > 0) &&
- 		    (flags & O_ACCMODE) != O_WRONLY) {
--			if (!_reopen_stream(stdin, STDIN_FILENO, "r", "stdin", &new_stream))
-+			if (!_reopen_stream(stdin, STDIN_FILENO, "r", "stdin"))
- 				goto_out;
--			stdin = new_stream;
- 			if (setvbuf(stdin, cmd->linebuffer, _IOLBF, linebuffer_size)) {
- 				log_sys_error("setvbuf", "");
- 				goto out;
-@@ -1803,9 +1807,8 @@ struct cmd_context *create_toolcontext(unsigned is_long_lived,
- 		if (is_valid_fd(STDOUT_FILENO) &&
- 		    ((flags = fcntl(STDOUT_FILENO, F_GETFL)) > 0) &&
- 		    (flags & O_ACCMODE) != O_RDONLY) {
--			if (!_reopen_stream(stdout, STDOUT_FILENO, "w", "stdout", &new_stream))
-+			if (!_reopen_stream(stdout, STDOUT_FILENO, "w", "stdout"))
- 				goto_out;
--			stdout = new_stream;
- 			if (setvbuf(stdout, cmd->linebuffer + linebuffer_size,
- 				     _IOLBF, linebuffer_size)) {
- 				log_sys_error("setvbuf", "");
-@@ -2131,7 +2134,6 @@ int refresh_toolcontext(struct cmd_context *cmd)
- void destroy_toolcontext(struct cmd_context *cmd)
- {
- 	struct dm_config_tree *cft_cmdline;
--	FILE *new_stream;
- 	int flags;
- 
- 	if (cmd->dump_filter && cmd->filter && cmd->filter->dump &&
-@@ -2167,8 +2169,7 @@ void destroy_toolcontext(struct cmd_context *cmd)
- 		if (is_valid_fd(STDIN_FILENO) &&
- 		    ((flags = fcntl(STDIN_FILENO, F_GETFL)) > 0) &&
- 		    (flags & O_ACCMODE) != O_WRONLY) {
--			if (_reopen_stream(stdin, STDIN_FILENO, "r", "stdin", &new_stream)) {
--				stdin = new_stream;
-+			if (_reopen_stream(stdin, STDIN_FILENO, "r", "stdin")) {
- 				setlinebuf(stdin);
- 			} else
- 				cmd->linebuffer = NULL;	/* Leave buffer in place (deliberate leak) */
-@@ -2177,8 +2178,7 @@ void destroy_toolcontext(struct cmd_context *cmd)
- 		if (is_valid_fd(STDOUT_FILENO) &&
- 		    ((flags = fcntl(STDOUT_FILENO, F_GETFL)) > 0) &&
- 		    (flags & O_ACCMODE) != O_RDONLY) {
--			if (_reopen_stream(stdout, STDOUT_FILENO, "w", "stdout", &new_stream)) {
--				stdout = new_stream;
-+			if (_reopen_stream(stdout, STDOUT_FILENO, "w", "stdout")) {
- 				setlinebuf(stdout);
- 			} else
- 				cmd->linebuffer = NULL;	/* Leave buffer in place (deliberate leak) */
-diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
-index 6577977..a33258a 100644
---- a/tools/lvmcmdline.c
-+++ b/tools/lvmcmdline.c
-@@ -1744,7 +1744,7 @@ static int _check_standard_fds(void)
- 	int err = is_valid_fd(STDERR_FILENO);
- 
- 	if (!is_valid_fd(STDIN_FILENO) &&
--	    !(stdin = fopen(_PATH_DEVNULL, "r"))) {
-+	    !freopen(_PATH_DEVNULL, "r", stdin)) {
- 		if (err)
- 			perror("stdin stream open");
- 		else
-@@ -1754,7 +1754,7 @@ static int _check_standard_fds(void)
- 	}
- 
- 	if (!is_valid_fd(STDOUT_FILENO) &&
--	    !(stdout = fopen(_PATH_DEVNULL, "w"))) {
-+	    !freopen(_PATH_DEVNULL, "w", stdout)) {
- 		if (err)
- 			perror("stdout stream open");
- 		/* else no stdout */
-@@ -1762,7 +1762,7 @@ static int _check_standard_fds(void)
- 	}
- 
- 	if (!is_valid_fd(STDERR_FILENO) &&
--	    !(stderr = fopen(_PATH_DEVNULL, "w"))) {
-+	    !freopen(_PATH_DEVNULL, "w", stderr)) {
- 		printf("stderr stream open: %s\n",
- 		       strerror(errno));
- 		return 0;
--- 
-2.7.0
-
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reopen_stream.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reopen_stream.patch
new file mode 100644
index 0000000..f09fd76
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reopen_stream.patch
@@ -0,0 +1,80 @@
+From ede7976da9431573b0104dbcfe91a32c02dbea13 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Tue, 25 Oct 2016 11:49:40 +0000
+Subject: [PATCH 1/4] implement libc specific reopen_stream
+
+musl defines stdin/stdio/stderr as constant types which means
+we can not assign to them as we are doing here but works ok with glibc
+therefore abstract out the _reopen_stream definition depending upon if
+we are using glibc or otherwise
+
+Origin:
+http://git.alpinelinux.org/cgit/aports/tree/main/lvm2/fix-stdio-usage.patch
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+Upstream-Status: Pending
+---
+ lib/log/log.c      | 6 ++++++
+ tools/lvmcmdline.c | 6 +++---
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/lib/log/log.c b/lib/log/log.c
+index c933154..638839d 100644
+--- a/lib/log/log.c
++++ b/lib/log/log.c
+@@ -161,6 +161,7 @@ static void _check_and_replace_standard_log_streams(FILE *old_stream, FILE *new_
+  * Close and reopen standard stream on file descriptor fd.
+  */
+ int reopen_standard_stream(FILE **stream, const char *mode)
++#ifdef __GLIBC__
+ {
+ 	int fd, fd_copy, new_fd;
+ 	const char *name;
+@@ -207,6 +208,11 @@ int reopen_standard_stream(FILE **stream, const char *mode)
+ 	*stream = new_stream;
+ 	return 1;
+ }
++#else
++{
++	return (freopen(NULL, mode, *stream) != NULL)
++}
++#endif
+ 
+ void init_log_fn(lvm2_log_fn_t log_fn)
+ {
+diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
+index 9a4deb7..f1f18e6 100644
+--- a/tools/lvmcmdline.c
++++ b/tools/lvmcmdline.c
+@@ -1818,7 +1818,7 @@ static int _check_standard_fds(void)
+ 	int err = is_valid_fd(STDERR_FILENO);
+ 
+ 	if (!is_valid_fd(STDIN_FILENO) &&
+-	    !(stdin = fopen(_PATH_DEVNULL, "r"))) {
++	    !freopen(_PATH_DEVNULL, "r", stdin)) {
+ 		if (err)
+ 			perror("stdin stream open");
+ 		else
+@@ -1828,7 +1828,7 @@ static int _check_standard_fds(void)
+ 	}
+ 
+ 	if (!is_valid_fd(STDOUT_FILENO) &&
+-	    !(stdout = fopen(_PATH_DEVNULL, "w"))) {
++	    !freopen(_PATH_DEVNULL, "w", stdout)) {
+ 		if (err)
+ 			perror("stdout stream open");
+ 		/* else no stdout */
+@@ -1836,7 +1836,7 @@ static int _check_standard_fds(void)
+ 	}
+ 
+ 	if (!is_valid_fd(STDERR_FILENO) &&
+-	    !(stderr = fopen(_PATH_DEVNULL, "w"))) {
++	    !freopen(_PATH_DEVNULL, "w", stderr)) {
+ 		printf("stderr stream open: %s\n",
+ 		       strerror(errno));
+ 		return 0;
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0003-Guard-use-of-mallinfo-with-__GLIBC__.patch b/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
similarity index 53%
rename from meta-oe/recipes-support/lvm2/lvm2/0003-Guard-use-of-mallinfo-with-__GLIBC__.patch
rename to meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
index 3d71767..5baafab 100644
--- a/meta-oe/recipes-support/lvm2/lvm2/0003-Guard-use-of-mallinfo-with-__GLIBC__.patch
+++ b/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
@@ -1,30 +1,31 @@
-From e018d055603389b22cbc3bd68b1525f3048ebee7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 20 Jan 2016 04:50:26 +0000
-Subject: [PATCH 3/4] Guard use of mallinfo() with __GLIBC__
+From 8706a6d33753d8b2cf5bb2a12bd6880b371ce337 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Tue, 25 Oct 2016 11:52:44 +0000
+Subject: [PATCH 2/4] Guard use of mallinfo() with __GLIBC__
 
 This API is glibc-only
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
 Upstream-Status: Pending
-
+---
  lib/mm/memlock.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/mm/memlock.c b/lib/mm/memlock.c
-index 969f1d7..405a7c0 100644
+index da90144..c1bf8fb 100644
 --- a/lib/mm/memlock.c
 +++ b/lib/mm/memlock.c
-@@ -145,7 +145,7 @@ static void _touch_memory(void *mem, size_t size)
+@@ -150,7 +150,7 @@ static void _touch_memory(void *mem, size_t size)
  
  static void _allocate_memory(void)
  {
 -#ifndef VALGRIND_POOL
-+#if !defined(VALGRIND_POOL) && defined(__GLIBC__)
++#ifndef VALGRIND_POOL && defined(__GLIBC__)
  	void *stack_mem;
  	struct rlimit limit;
  	int i, area = 0, missing = _size_malloc_tmp, max_areas = 32, hblks;
 -- 
-2.7.0
+2.9.3
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0002-use-PTHREAD_MUTEX_RECURSIVE-instead-of-PTHREAD_MUTEX.patch b/meta-oe/recipes-support/lvm2/lvm2/0002-use-PTHREAD_MUTEX_RECURSIVE-instead-of-PTHREAD_MUTEX.patch
deleted file mode 100644
index 969a152..0000000
--- a/meta-oe/recipes-support/lvm2/lvm2/0002-use-PTHREAD_MUTEX_RECURSIVE-instead-of-PTHREAD_MUTEX.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c8a1b669cbff3eee367fd4db3389e337bc4c98ba Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 20 Jan 2016 04:46:26 +0000
-Subject: [PATCH 2/4] use PTHREAD_MUTEX_RECURSIVE instead of
- PTHREAD_MUTEX_RECURSIVE_NP
-
-PTHREAD_MUTEX_RECURSIVE_NP was used for compatibility with old glibc.
-Although due to the_GNU_SOURCES define the portable,
-PTHREAD_MUTEX_RECURSIVE will be available for Linuxes since at least
-1998. Simplify things giving us compatibility with musl which
-apparently does not provide the non-portable define.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- daemons/lvmetad/lvmetad-core.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/daemons/lvmetad/lvmetad-core.c b/daemons/lvmetad/lvmetad-core.c
-index 7af9bde..63707c2 100644
---- a/daemons/lvmetad/lvmetad-core.c
-+++ b/daemons/lvmetad/lvmetad-core.c
-@@ -300,7 +300,7 @@ static struct dm_config_tree *lock_vg(lvmetad_state *s, const char *id) {
- 	if (!(vg = dm_hash_lookup(s->lock.vg, id))) {
- 		if (!(vg = malloc(sizeof(pthread_mutex_t))) ||
- 		    pthread_mutexattr_init(&rec) ||
--		    pthread_mutexattr_settype(&rec, PTHREAD_MUTEX_RECURSIVE_NP) ||
-+		    pthread_mutexattr_settype(&rec, PTHREAD_MUTEX_RECURSIVE) ||
- 		    pthread_mutex_init(vg, &rec))
- 			goto bad;
- 		if (!dm_hash_insert(s->lock.vg, id, vg)) {
-@@ -2890,7 +2890,7 @@ static int init(daemon_state *s)
- 	ls->log = s->log;
- 
- 	pthread_mutexattr_init(&rec);
--	pthread_mutexattr_settype(&rec, PTHREAD_MUTEX_RECURSIVE_NP);
-+	pthread_mutexattr_settype(&rec, PTHREAD_MUTEX_RECURSIVE);
- 	pthread_mutex_init(&ls->lock.pvid_to_pvmeta, &rec);
- 	pthread_mutex_init(&ls->lock.vgid_to_metadata, &rec);
- 	pthread_mutex_init(&ls->lock.pvid_to_vgid, NULL);
--- 
-2.7.0
-
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0004-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch b/meta-oe/recipes-support/lvm2/lvm2/0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
similarity index 64%
rename from meta-oe/recipes-support/lvm2/lvm2/0004-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
rename to meta-oe/recipes-support/lvm2/lvm2/0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
index 2a3b843..9ab1c06 100644
--- a/meta-oe/recipes-support/lvm2/lvm2/0004-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
+++ b/meta-oe/recipes-support/lvm2/lvm2/0003-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
@@ -1,19 +1,20 @@
-From 9b793d5b4adc5d8b3684e7f66943e236eae7c2db Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 20 Jan 2016 04:52:59 +0000
-Subject: [PATCH 4/4] include fcntl.h for O_* defines and fcntl() signature
+From b1ad91a059d99afd1ce25823b7c0a8d3ac63d2fd Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Tue, 25 Oct 2016 11:55:49 +0000
+Subject: [PATCH 3/4] include fcntl.h for O_* defines and fcntl() signature
 
 On glibc _somehow_ this header gets pulled in indirectly
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
 Upstream-Status: Pending
-
+---
  libdaemon/server/daemon-server.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/libdaemon/server/daemon-server.c b/libdaemon/server/daemon-server.c
-index d9d60d1..433d100 100644
+index 6af6de9..a9590e7 100644
 --- a/libdaemon/server/daemon-server.c
 +++ b/libdaemon/server/daemon-server.c
 @@ -18,6 +18,7 @@
@@ -25,5 +26,5 @@ index d9d60d1..433d100 100644
  #include <errno.h>
  #include <pthread.h>
 -- 
-2.7.0
+2.9.3
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0005-tweak-MODPROBE_CMD-for-cross-compile.patch b/meta-oe/recipes-support/lvm2/lvm2/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
similarity index 70%
rename from meta-oe/recipes-support/lvm2/lvm2/0005-tweak-MODPROBE_CMD-for-cross-compile.patch
rename to meta-oe/recipes-support/lvm2/lvm2/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
index 8db320d..aaeaa72 100644
--- a/meta-oe/recipes-support/lvm2/lvm2/0005-tweak-MODPROBE_CMD-for-cross-compile.patch
+++ b/meta-oe/recipes-support/lvm2/lvm2/0004-tweak-MODPROBE_CMD-for-cross-compile.patch
@@ -1,7 +1,7 @@
-From 72866782f83c8cf85b10017df461128af90cae6e Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 30 Aug 2016 22:33:47 -0400
-Subject: [PATCH] tweak MODPROBE_CMD for cross compile
+From 0012ea63f6070a5d41fa380970f9c30b953237d2 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Tue, 25 Oct 2016 11:59:40 +0000
+Subject: [PATCH 4/4] tweak MODPROBE_CMD for cross compile
 
 Lvm uses variable MODPROBE_CMD at runtime, so build time detection of modprobe
 is incorrect.
@@ -16,23 +16,23 @@ filter=["r|/loop1$|","r|/loop2$|","r|/loop3$|","r|/loop4$|","r|/loop5$|","r|/loo
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
- configure.in | 2 --
- 1 file changed, 2 deletions(-)
+ configure.in | 1 -
+ 1 file changed, 1 deletion(-)
 
 diff --git a/configure.in b/configure.in
-index 8e04782..77681b0 100644
+index cc77aab..a3579f2 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -1779,8 +1779,6 @@ if test "$UDEV_SYNC" = yes; then
+@@ -1853,7 +1853,6 @@ if test "$UDEV_SYNC" = yes; then
  fi
  
  ################################################################################
 -AC_PATH_TOOL(MODPROBE_CMD, modprobe)
--
+ 
  if test -n "$MODPROBE_CMD"; then
  	AC_DEFINE_UNQUOTED([MODPROBE_CMD], ["$MODPROBE_CMD"], [The path to 'modprobe', if available.])
- fi
 -- 
-2.8.1
+2.9.3
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb
new file mode 100644
index 0000000..8476b01
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb
@@ -0,0 +1,6 @@
+require lvm2.inc
+
+SRC_URI[md5sum] = "c5a54ee0b86703daaad6e856439e115a"
+SRC_URI[sha256sum] = "e120b066b85b224552efda40204488c5123de068725676fd6e5c8bc655051b94"
+
+DEPENDS += "autoconf-archive"
-- 
2.7.4


