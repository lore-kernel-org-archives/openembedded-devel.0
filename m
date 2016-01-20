Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id A32BD731F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 05:03:15 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id o6so32273231qkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=awq/3E/XNk3jjjOLAao+xc4iYw4LeSYLucSxRg4zPqw=;
	b=OOdUisBK8txzHMt3sXESQhbFio+CwsQshEuWZSUYQAoqMZ3uIgmfNlnbu3WdhFKarc
	IttF0uxx/I9trlHQ8qjvDLFD8UkcXKGb5yASzaO/eT5OpE6wan9qhOuW4PW2h/ZyVQJN
	qStZqLXo7GQAzO5UKdh1IWhUGSAIwYz4qPhA7DyBBI0hBkMQIBCWuWsUJybPTjhVWVYA
	C4KSM/Lqaj+2TFWHOmCea0pAVDhlgZ8hIUkaSMUbR6S9uvxXLOleZZ4CT/tgjI8Wz5/A
	/1YdDaPNVLhVNhlmlLyyiHiemfeGD0a4Bxx6DB1IOcO1m6kgCsq4rMsKgMxXd222LnGS
	5xug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=awq/3E/XNk3jjjOLAao+xc4iYw4LeSYLucSxRg4zPqw=;
	b=Spk2t/5e5eR3ILEqJpRbUxHiGIC/T/hSh0UmUJTFmTqse9LTjbgXOi9wKBaSe9vWtO
	fn1jxnVdywvyBJrK2EHCnzjOKrQFgPtoQ1OG8HjnhJeTgOdQs9miOqPcZMTi0iPso385
	W91TNUw1hGi29iDO9KtzbsVSLsjzb46dT58cz8lmtpY+tZYrzpsGOvDr2U6N16JfGi9l
	W4ppwt3txw59ipgyH8d3ibRHNQsQhC057/2rsp9eUq5Jpwm37+o+pSDz5wK1FgYAEANC
	w5XVzq/yDWVPg2f1Jk2ACO9EShcYqKSDF/tpeSrNyVL7tNntfhWNIsfqSZTaCHIkbV9H
	XmUg==
X-Gm-Message-State: ALoCoQl06rlrTkdMFciC0tcXd2fdhAw32XYhApGW9LaHhRj9ZceoGLYDSXYm0BE8ycNPo0Faig/Dgn97N8wq4WYxYkjYryqzxA==
X-Received: by 10.55.71.135 with SMTP id u129mr43765260qka.26.1453266196395;
	Tue, 19 Jan 2016 21:03:16 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	c2sm13720662qkb.41.2016.01.19.21.03.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jan 2016 21:03:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jan 2016 05:03:08 +0000
Message-Id: <1453266190-95648-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [meta-oe][PATCH 1/3] lvm2: Portable fixes for fixing compile with musl
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
X-List-Received-Date: Wed, 20 Jan 2016 05:03:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc              |   6 +-
 ...01-implement-libc-specific-_reopen_stream.patch | 139 +++++++++++++++++++++
 ..._MUTEX_RECURSIVE-instead-of-PTHREAD_MUTEX.patch |  44 +++++++
 ...0003-Guard-use-of-mallinfo-with-__GLIBC__.patch |  30 +++++
 ...cntl.h-for-O_-defines-and-fcntl-signature.patch |  29 +++++
 5 files changed, 247 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-_reopen_stream.patch
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0002-use-PTHREAD_MUTEX_RECURSIVE-instead-of-PTHREAD_MUTEX.patch
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0003-Guard-use-of-mallinfo-with-__GLIBC__.patch
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0004-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index c4d1b19..a891950 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -8,7 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 S = "${WORKDIR}/LVM2.${PV}"
 SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
            file://lvm.conf \
-          "
+           file://0001-implement-libc-specific-_reopen_stream.patch \
+           file://0002-use-PTHREAD_MUTEX_RECURSIVE-instead-of-PTHREAD_MUTEX.patch \
+           file://0003-Guard-use-of-mallinfo-with-__GLIBC__.patch \
+           file://0004-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch \
+           "
 
 PACKAGECONFIG ??= "readline"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-_reopen_stream.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-_reopen_stream.patch
new file mode 100644
index 0000000..f0b4e71
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-_reopen_stream.patch
@@ -0,0 +1,139 @@
+From 089c9c701a1b68b721f479dfc0c58c35b9dd4175 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 20 Jan 2016 04:39:53 +0000
+Subject: [PATCH 1/4] implement libc specific _reopen_stream
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
+---
+Upstream-Status: Pending
+
+ lib/commands/toolcontext.c | 22 +++++++++++-----------
+ tools/lvmcmdline.c         |  6 +++---
+ 2 files changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/lib/commands/toolcontext.c b/lib/commands/toolcontext.c
+index a2f21b8..7f796e4 100644
+--- a/lib/commands/toolcontext.c
++++ b/lib/commands/toolcontext.c
+@@ -1637,7 +1637,10 @@ static void _init_globals(struct cmd_context *cmd)
+ /*
+  * Close and reopen stream on file descriptor fd.
+  */
+-static int _reopen_stream(FILE *stream, int fd, const char *mode, const char *name, FILE **new_stream)
++#ifdef __GLIBC__
++#define _reopen_stream(stream, fd, mode, name) __reopen_stream(stream, fd, mode, name, &stream)
++
++static int __reopen_stream(FILE *stream, int fd, const char *mode, const char *name, FILE **new_stream)
+ {
+ 	int fd_copy, new_fd;
+ 
+@@ -1664,6 +1667,9 @@ static int _reopen_stream(FILE *stream, int fd, const char *mode, const char *na
+ 
+ 	return 1;
+ }
++#else
++#define _reopen_stream(stream, fd, mode, name) (freopen(NULL, mode, stream) != NULL)
++#endif
+ 
+ static int _init_lvmetad(struct cmd_context *cmd)
+ {
+@@ -1741,7 +1747,6 @@ struct cmd_context *create_toolcontext(unsigned is_long_lived,
+ 				       unsigned set_filters)
+ {
+ 	struct cmd_context *cmd;
+-	FILE *new_stream;
+ 	int flags;
+ 
+ #ifdef M_MMAP_MAX
+@@ -1791,9 +1796,8 @@ struct cmd_context *create_toolcontext(unsigned is_long_lived,
+ 		if (is_valid_fd(STDIN_FILENO) &&
+ 		    ((flags = fcntl(STDIN_FILENO, F_GETFL)) > 0) &&
+ 		    (flags & O_ACCMODE) != O_WRONLY) {
+-			if (!_reopen_stream(stdin, STDIN_FILENO, "r", "stdin", &new_stream))
++			if (!_reopen_stream(stdin, STDIN_FILENO, "r", "stdin"))
+ 				goto_out;
+-			stdin = new_stream;
+ 			if (setvbuf(stdin, cmd->linebuffer, _IOLBF, linebuffer_size)) {
+ 				log_sys_error("setvbuf", "");
+ 				goto out;
+@@ -1803,9 +1807,8 @@ struct cmd_context *create_toolcontext(unsigned is_long_lived,
+ 		if (is_valid_fd(STDOUT_FILENO) &&
+ 		    ((flags = fcntl(STDOUT_FILENO, F_GETFL)) > 0) &&
+ 		    (flags & O_ACCMODE) != O_RDONLY) {
+-			if (!_reopen_stream(stdout, STDOUT_FILENO, "w", "stdout", &new_stream))
++			if (!_reopen_stream(stdout, STDOUT_FILENO, "w", "stdout"))
+ 				goto_out;
+-			stdout = new_stream;
+ 			if (setvbuf(stdout, cmd->linebuffer + linebuffer_size,
+ 				     _IOLBF, linebuffer_size)) {
+ 				log_sys_error("setvbuf", "");
+@@ -2131,7 +2134,6 @@ int refresh_toolcontext(struct cmd_context *cmd)
+ void destroy_toolcontext(struct cmd_context *cmd)
+ {
+ 	struct dm_config_tree *cft_cmdline;
+-	FILE *new_stream;
+ 	int flags;
+ 
+ 	if (cmd->dump_filter && cmd->filter && cmd->filter->dump &&
+@@ -2167,8 +2169,7 @@ void destroy_toolcontext(struct cmd_context *cmd)
+ 		if (is_valid_fd(STDIN_FILENO) &&
+ 		    ((flags = fcntl(STDIN_FILENO, F_GETFL)) > 0) &&
+ 		    (flags & O_ACCMODE) != O_WRONLY) {
+-			if (_reopen_stream(stdin, STDIN_FILENO, "r", "stdin", &new_stream)) {
+-				stdin = new_stream;
++			if (_reopen_stream(stdin, STDIN_FILENO, "r", "stdin")) {
+ 				setlinebuf(stdin);
+ 			} else
+ 				cmd->linebuffer = NULL;	/* Leave buffer in place (deliberate leak) */
+@@ -2177,8 +2178,7 @@ void destroy_toolcontext(struct cmd_context *cmd)
+ 		if (is_valid_fd(STDOUT_FILENO) &&
+ 		    ((flags = fcntl(STDOUT_FILENO, F_GETFL)) > 0) &&
+ 		    (flags & O_ACCMODE) != O_RDONLY) {
+-			if (_reopen_stream(stdout, STDOUT_FILENO, "w", "stdout", &new_stream)) {
+-				stdout = new_stream;
++			if (_reopen_stream(stdout, STDOUT_FILENO, "w", "stdout")) {
+ 				setlinebuf(stdout);
+ 			} else
+ 				cmd->linebuffer = NULL;	/* Leave buffer in place (deliberate leak) */
+diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
+index 6577977..a33258a 100644
+--- a/tools/lvmcmdline.c
++++ b/tools/lvmcmdline.c
+@@ -1744,7 +1744,7 @@ static int _check_standard_fds(void)
+ 	int err = is_valid_fd(STDERR_FILENO);
+ 
+ 	if (!is_valid_fd(STDIN_FILENO) &&
+-	    !(stdin = fopen(_PATH_DEVNULL, "r"))) {
++	    !freopen(_PATH_DEVNULL, "r", stdin)) {
+ 		if (err)
+ 			perror("stdin stream open");
+ 		else
+@@ -1754,7 +1754,7 @@ static int _check_standard_fds(void)
+ 	}
+ 
+ 	if (!is_valid_fd(STDOUT_FILENO) &&
+-	    !(stdout = fopen(_PATH_DEVNULL, "w"))) {
++	    !freopen(_PATH_DEVNULL, "w", stdout)) {
+ 		if (err)
+ 			perror("stdout stream open");
+ 		/* else no stdout */
+@@ -1762,7 +1762,7 @@ static int _check_standard_fds(void)
+ 	}
+ 
+ 	if (!is_valid_fd(STDERR_FILENO) &&
+-	    !(stderr = fopen(_PATH_DEVNULL, "w"))) {
++	    !freopen(_PATH_DEVNULL, "w", stderr)) {
+ 		printf("stderr stream open: %s\n",
+ 		       strerror(errno));
+ 		return 0;
+-- 
+2.7.0
+
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0002-use-PTHREAD_MUTEX_RECURSIVE-instead-of-PTHREAD_MUTEX.patch b/meta-oe/recipes-support/lvm2/lvm2/0002-use-PTHREAD_MUTEX_RECURSIVE-instead-of-PTHREAD_MUTEX.patch
new file mode 100644
index 0000000..969a152
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0002-use-PTHREAD_MUTEX_RECURSIVE-instead-of-PTHREAD_MUTEX.patch
@@ -0,0 +1,44 @@
+From c8a1b669cbff3eee367fd4db3389e337bc4c98ba Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 20 Jan 2016 04:46:26 +0000
+Subject: [PATCH 2/4] use PTHREAD_MUTEX_RECURSIVE instead of
+ PTHREAD_MUTEX_RECURSIVE_NP
+
+PTHREAD_MUTEX_RECURSIVE_NP was used for compatibility with old glibc.
+Although due to the_GNU_SOURCES define the portable,
+PTHREAD_MUTEX_RECURSIVE will be available for Linuxes since at least
+1998. Simplify things giving us compatibility with musl which
+apparently does not provide the non-portable define.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ daemons/lvmetad/lvmetad-core.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/daemons/lvmetad/lvmetad-core.c b/daemons/lvmetad/lvmetad-core.c
+index 7af9bde..63707c2 100644
+--- a/daemons/lvmetad/lvmetad-core.c
++++ b/daemons/lvmetad/lvmetad-core.c
+@@ -300,7 +300,7 @@ static struct dm_config_tree *lock_vg(lvmetad_state *s, const char *id) {
+ 	if (!(vg = dm_hash_lookup(s->lock.vg, id))) {
+ 		if (!(vg = malloc(sizeof(pthread_mutex_t))) ||
+ 		    pthread_mutexattr_init(&rec) ||
+-		    pthread_mutexattr_settype(&rec, PTHREAD_MUTEX_RECURSIVE_NP) ||
++		    pthread_mutexattr_settype(&rec, PTHREAD_MUTEX_RECURSIVE) ||
+ 		    pthread_mutex_init(vg, &rec))
+ 			goto bad;
+ 		if (!dm_hash_insert(s->lock.vg, id, vg)) {
+@@ -2890,7 +2890,7 @@ static int init(daemon_state *s)
+ 	ls->log = s->log;
+ 
+ 	pthread_mutexattr_init(&rec);
+-	pthread_mutexattr_settype(&rec, PTHREAD_MUTEX_RECURSIVE_NP);
++	pthread_mutexattr_settype(&rec, PTHREAD_MUTEX_RECURSIVE);
+ 	pthread_mutex_init(&ls->lock.pvid_to_pvmeta, &rec);
+ 	pthread_mutex_init(&ls->lock.vgid_to_metadata, &rec);
+ 	pthread_mutex_init(&ls->lock.pvid_to_vgid, NULL);
+-- 
+2.7.0
+
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0003-Guard-use-of-mallinfo-with-__GLIBC__.patch b/meta-oe/recipes-support/lvm2/lvm2/0003-Guard-use-of-mallinfo-with-__GLIBC__.patch
new file mode 100644
index 0000000..3d71767
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0003-Guard-use-of-mallinfo-with-__GLIBC__.patch
@@ -0,0 +1,30 @@
+From e018d055603389b22cbc3bd68b1525f3048ebee7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 20 Jan 2016 04:50:26 +0000
+Subject: [PATCH 3/4] Guard use of mallinfo() with __GLIBC__
+
+This API is glibc-only
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ lib/mm/memlock.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/mm/memlock.c b/lib/mm/memlock.c
+index 969f1d7..405a7c0 100644
+--- a/lib/mm/memlock.c
++++ b/lib/mm/memlock.c
+@@ -145,7 +145,7 @@ static void _touch_memory(void *mem, size_t size)
+ 
+ static void _allocate_memory(void)
+ {
+-#ifndef VALGRIND_POOL
++#if !defined(VALGRIND_POOL) && defined(__GLIBC__)
+ 	void *stack_mem;
+ 	struct rlimit limit;
+ 	int i, area = 0, missing = _size_malloc_tmp, max_areas = 32, hblks;
+-- 
+2.7.0
+
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0004-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch b/meta-oe/recipes-support/lvm2/lvm2/0004-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
new file mode 100644
index 0000000..2a3b843
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0004-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch
@@ -0,0 +1,29 @@
+From 9b793d5b4adc5d8b3684e7f66943e236eae7c2db Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 20 Jan 2016 04:52:59 +0000
+Subject: [PATCH 4/4] include fcntl.h for O_* defines and fcntl() signature
+
+On glibc _somehow_ this header gets pulled in indirectly
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ libdaemon/server/daemon-server.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libdaemon/server/daemon-server.c b/libdaemon/server/daemon-server.c
+index d9d60d1..433d100 100644
+--- a/libdaemon/server/daemon-server.c
++++ b/libdaemon/server/daemon-server.c
+@@ -18,6 +18,7 @@
+ #include "daemon-server.h"
+ #include "daemon-log.h"
+ 
++#include <fcntl.h>
+ #include <dlfcn.h>
+ #include <errno.h>
+ #include <pthread.h>
+-- 
+2.7.0
+
-- 
2.7.0


