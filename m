Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 24CA8608BE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 10:41:55 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id hn9so5176818wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 02:41:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wPijwgeidHU60xqf72jckbuzi0GGS8yaCC/woeaX61I=;
	b=gqDaqCu5a0ak4DxNw6puptbTWNhaz7G/CBYpKqCMUC/FTbeEHXPDH2wkdIrQYVP19j
	jFgGuOahum4LnBUjHG4SoRYeesiDeWIs2SadV1pg/P13vb/6QY/mxpD1PFk0jG48qlwC
	FGMhMLCS93Jl39NyBsuBuAG83CTQveEVQpSTtUQlAgEGqPu6GIVM7PQ6Mi5rUiANNDIw
	bBjkecMLuTDfzA6+vPFpS6yAiFdQJ8WiqTWk33uycGQv3/22TSkeot1RHLkV3CUB60v9
	vlxvCx/8QsRwT7mOS355ZHUlX4bla21B60CCwfCMCfNbzEysQM3hMlbFfDVI80nJGr4U
	4Low==
X-Gm-Message-State: ALoCoQlXPyAhBxYyMLu9yVYTYFJpZAz4B3U3SSAFDpdJto0IjOQYCIk/yKqSpJzyXXeBL/IrTWs/
X-Received: by 10.180.12.146 with SMTP id y18mr16178617wib.37.1386672114416;
	Tue, 10 Dec 2013 02:41:54 -0800 (PST)
Received: from localhost (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id cx3sm4598710wib.0.2013.12.10.02.41.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Dec 2013 02:41:53 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Dec 2013 11:41:40 +0100
Message-Id: <1386672101-30510-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-initramfs][PATCH 1/2] klibc 2.0.2: add support for Aarch64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Dec 2013 10:41:59 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 .../0001-syscalls-Fixup-some-syscalls.patch        | 111 ++++
 ...002-syscalls-Add-syscalls-needed-by-arm64.patch | 621 +++++++++++++++++++++
 .../0003-arm64-Introduce-arm64-support.patch       | 431 ++++++++++++++
 .../recipes-devtools/klibc/klibc_2.0.2.bb          |   6 +
 4 files changed, 1169 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/0001-syscalls-Fixup-some-syscalls.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/0002-syscalls-Add-syscalls-needed-by-arm64.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/0003-arm64-Introduce-arm64-support.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/0001-syscalls-Fixup-some-syscalls.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/0001-syscalls-Fixup-some-syscalls.patch
new file mode 100644
index 0000000..c80b171
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/0001-syscalls-Fixup-some-syscalls.patch
@@ -0,0 +1,111 @@
+From 131489114132a4199b6b1240c67439ba584fb8fa Mon Sep 17 00:00:00 2001
+From: Steve Capper <steve.capper@linaro.org>
+Date: Wed, 6 Nov 2013 16:37:08 +0000
+Subject: [PATCH 1/3] syscalls: Fixup some syscalls
+
+mknodat and mkdirat contain a spurious repeated parameter, linkat
+is missing the final int flags parameter, symlinkat has the first
+two parameters transposed, and fchmodat is missing the flags
+parameter and is declared in the wrong header.
+
+Also declarations are missing for utimensat and fchownat.
+
+This patch fixes up these syscall declarations.
+
+Originally-by: Neil Williams <codehelp@debian.org>
+Originally-by: Anil Singhar <anil.singhar@linaro.org>
+Signed-off-by: Steve Capper <steve.capper@linaro.org>
+
+Upstream-status: Submitted
+
+---
+ usr/include/sys/stat.h | 4 +++-
+ usr/include/unistd.h   | 8 ++++----
+ usr/klibc/SYSCALLS.def | 8 ++++----
+ 3 files changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/usr/include/sys/stat.h b/usr/include/sys/stat.h
+index 4850429..c4b378e 100644
+--- a/usr/include/sys/stat.h
++++ b/usr/include/sys/stat.h
+@@ -69,8 +69,10 @@ __extern int fstatat(int, const char *, struct stat *, int);
+ __extern int lstat(const char *, struct stat *);
+ __extern mode_t umask(mode_t);
+ __extern int mknod(const char *, mode_t, dev_t);
+-__extern int mknodat(int, const char *, const char *, mode_t, dev_t);
++__extern int mknodat(int, const char *, mode_t, dev_t);
+ __extern int mkfifo(const char *, mode_t);
++__extern int utimensat(int, const char *, const struct timespec *, int);
++__extern int fchmodat(int, const char *, mode_t, int);
+ 
+ __extern_inline int mkfifo(const char *__p, mode_t __m)
+ {
+diff --git a/usr/include/unistd.h b/usr/include/unistd.h
+index f0e19c2..6c08d4e 100644
+--- a/usr/include/unistd.h
++++ b/usr/include/unistd.h
+@@ -61,28 +61,28 @@ __extern int setfsuid(uid_t);
+ __extern int access(const char *, int);
+ __extern int faccessat(int, const char *, int, int);
+ __extern int link(const char *, const char *);
+-__extern int linkat(int, const char *, int, const char *);
++__extern int linkat(int, const char *, int, const char *, int);
+ __extern int unlink(const char *);
+ __extern int unlinkat(int, const char *, int);
+ __extern int chdir(const char *);
+ __extern int fchdir(int);
+ __extern int chmod(const char *, mode_t);
+ __extern int fchmod(int, mode_t);
+-__extern int fchmodat(int, const char *, mode_t);
+ __extern int mkdir(const char *, mode_t);
+-__extern int mkdirat(int, const char *, const char *, mode_t);
++__extern int mkdirat(int, const char *, mode_t);
+ __extern int rmdir(const char *);
+ __extern int pipe(int *);
+ __extern int pipe2(int *, int);
+ __extern int chroot(const char *);
+ __extern int symlink(const char *, const char *);
+-__extern int symlinkat(int, const char *, const char *);
++__extern int symlinkat(const char *, int, const char *);
+ __extern int readlink(const char *, char *, size_t);
+ __extern int readlinkat(int, const char *, char *, size_t);
+ __extern int chown(const char *, uid_t, gid_t);
+ __extern int fchown(int, uid_t, gid_t);
+ __extern int lchown(const char *, uid_t, gid_t);
+ __extern char *getcwd(char *, size_t);
++__extern int fchownat(int, const char *, uid_t, gid_t, int);
+ 
+ /* Also in <fcntl.h> */
+ #ifndef _KLIBC_IN_OPEN_C
+diff --git a/usr/klibc/SYSCALLS.def b/usr/klibc/SYSCALLS.def
+index 9b07aa2..55d8e36 100644
+--- a/usr/klibc/SYSCALLS.def
++++ b/usr/klibc/SYSCALLS.def
+@@ -109,7 +109,7 @@ int swapoff(const char *);
+ int access(const char *, int);
+ int faccessat(int, const char *, int, int);
+ int link(const char *, const char *);
+-<?> int linkat(int, const char *, int, const char *);
++<?> int linkat(int, const char *, int, const char *, int);
+ int unlink(const char *);
+ <?> int unlinkat(int, const char *, int);
+ int chdir(const char *);
+@@ -117,12 +117,12 @@ int fchdir(int);
+ int rename(const char *, const char *);
+ <?> int renameat(int, const char *, int, const char *);
+ int mknod(const char *, mode_t, dev_t);
+-<?> int mknodat(int, const char *, const char *, mode_t, dev_t);
++<?> int mknodat(int, const char *, mode_t, dev_t);
+ int chmod(const char *, mode_t);
+ int fchmod(int, mode_t);
+-<?> int fchmodat(int, const char *, mode_t);
++<?> int fchmodat(int, const char *, mode_t, int);
+ int mkdir(const char *, mode_t);
+-<?> int mkdirat(int, const char *, const char *, mode_t);
++<?> int mkdirat(int, const char *, mode_t);
+ int rmdir(const char *);
+ <!alpha,ia64,mips,mips64,sh,sparc,sparc64> int pipe(int *);
+ int pipe2(int *, int);
+-- 
+1.8.4.2
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/0002-syscalls-Add-syscalls-needed-by-arm64.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/0002-syscalls-Add-syscalls-needed-by-arm64.patch
new file mode 100644
index 0000000..3a0b0fe
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/0002-syscalls-Add-syscalls-needed-by-arm64.patch
@@ -0,0 +1,621 @@
+From f7acda1b953dd185e756f614aa858127cf6992ec Mon Sep 17 00:00:00 2001
+From: Steve Capper <steve.capper@linaro.org>
+Date: Wed, 6 Nov 2013 16:07:33 +0000
+Subject: [PATCH 2/3] syscalls: Add syscalls needed by arm64
+
+arm64 uses generic syscalls, and does not include the "noat",
+"noflags", and "deprecated" syscalls.
+i.e. __ARCH_WANT_SYSCALL_{NO_AT|NO_FLAGS|DEPRECATED}
+
+This patch adds the syscalls needed for klibc to run on arm64.
+
+Originally-by: Neil Williams <codehelp@debian.org>
+Originally-by: Anil Singhar <anil.singhar@linaro.org>
+Signed-off-by: Steve Capper <steve.capper@linaro.org>
+
+Upstream-status: Submitted
+
+---
+ usr/klibc/Kbuild       |  3 +++
+ usr/klibc/SYSCALLS.def | 39 ++++++++++++++++++++-------------------
+ usr/klibc/access.c     | 12 ++++++++++++
+ usr/klibc/chmod.c      | 13 +++++++++++++
+ usr/klibc/chown.c      | 12 ++++++++++++
+ usr/klibc/dup2.c       | 11 +++++++++++
+ usr/klibc/lchown.c     | 12 ++++++++++++
+ usr/klibc/link.c       | 12 ++++++++++++
+ usr/klibc/lstat.c      | 14 ++++++++++++++
+ usr/klibc/mkdir.c      | 14 ++++++++++++++
+ usr/klibc/mknod.c      | 14 ++++++++++++++
+ usr/klibc/open.c       | 29 +++++++++++++++++++++++++++--
+ usr/klibc/pipe.c       | 11 +++++++++++
+ usr/klibc/poll.c       | 21 +++++++++++++++++++++
+ usr/klibc/readlink.c   | 12 ++++++++++++
+ usr/klibc/rename.c     | 11 +++++++++++
+ usr/klibc/rmdir.c      | 12 ++++++++++++
+ usr/klibc/select.c     | 34 ++++++++++++++++++++++++++++++++++
+ usr/klibc/stat.c       | 14 ++++++++++++++
+ usr/klibc/symlink.c    | 12 ++++++++++++
+ usr/klibc/unlink.c     | 12 ++++++++++++
+ usr/klibc/utimes.c     | 20 ++++++++++++++++++++
+ 22 files changed, 323 insertions(+), 21 deletions(-)
+ create mode 100644 usr/klibc/access.c
+ create mode 100644 usr/klibc/chmod.c
+ create mode 100644 usr/klibc/chown.c
+ create mode 100644 usr/klibc/dup2.c
+ create mode 100644 usr/klibc/lchown.c
+ create mode 100644 usr/klibc/link.c
+ create mode 100644 usr/klibc/lstat.c
+ create mode 100644 usr/klibc/mkdir.c
+ create mode 100644 usr/klibc/mknod.c
+ create mode 100644 usr/klibc/pipe.c
+ create mode 100644 usr/klibc/poll.c
+ create mode 100644 usr/klibc/readlink.c
+ create mode 100644 usr/klibc/rename.c
+ create mode 100644 usr/klibc/rmdir.c
+ create mode 100644 usr/klibc/select.c
+ create mode 100644 usr/klibc/stat.c
+ create mode 100644 usr/klibc/symlink.c
+ create mode 100644 usr/klibc/unlink.c
+ create mode 100644 usr/klibc/utimes.c
+
+diff --git a/usr/klibc/Kbuild b/usr/klibc/Kbuild
+index 2bef9ca..40d43c7 100644
+--- a/usr/klibc/Kbuild
++++ b/usr/klibc/Kbuild
+@@ -58,6 +58,9 @@ klib-y += vsnprintf.o snprintf.o vsprintf.o sprintf.o \
+ 	  inet/inet_ntoa.o inet/inet_aton.o inet/inet_addr.o \
+ 	  inet/inet_ntop.o inet/inet_pton.o inet/bindresvport.o \
+ 	  send.o recv.o \
++	  access.o chmod.o chown.o dup2.o mknod.o poll.o rename.o stat.o \
++	  lchown.o link.o rmdir.o unlink.o utimes.o lstat.o mkdir.o \
++	  readlink.o select.o symlink.o pipe.o \
+ 	  ctype/isalnum.o ctype/isalpha.o ctype/isascii.o \
+ 	  ctype/isblank.o ctype/iscntrl.o ctype/isdigit.o \
+ 	  ctype/isgraph.o ctype/islower.o ctype/isprint.o \
+diff --git a/usr/klibc/SYSCALLS.def b/usr/klibc/SYSCALLS.def
+index 55d8e36..12f57ac 100644
+--- a/usr/klibc/SYSCALLS.def
++++ b/usr/klibc/SYSCALLS.def
+@@ -106,34 +106,34 @@ int swapoff(const char *);
+ /*
+  * Inode-related system calls
+  */
+-int access(const char *, int);
++<?> int access(const char *, int);
+ int faccessat(int, const char *, int, int);
+-int link(const char *, const char *);
++<?> int link(const char *, const char *);
+ <?> int linkat(int, const char *, int, const char *, int);
+-int unlink(const char *);
++<?> int unlink(const char *);
+ <?> int unlinkat(int, const char *, int);
+ int chdir(const char *);
+ int fchdir(int);
+-int rename(const char *, const char *);
++<?> int rename(const char *, const char *);
+ <?> int renameat(int, const char *, int, const char *);
+-int mknod(const char *, mode_t, dev_t);
++<?> int mknod(const char *, mode_t, dev_t);
+ <?> int mknodat(int, const char *, mode_t, dev_t);
+-int chmod(const char *, mode_t);
++<?> int chmod(const char *, mode_t);
+ int fchmod(int, mode_t);
+ <?> int fchmodat(int, const char *, mode_t, int);
+-int mkdir(const char *, mode_t);
++<?> int mkdir(const char *, mode_t);
+ <?> int mkdirat(int, const char *, mode_t);
+-int rmdir(const char *);
+-<!alpha,ia64,mips,mips64,sh,sparc,sparc64> int pipe(int *);
++<?> int rmdir(const char *);
++<?!alpha,ia64,mips,mips64,sh,sparc,sparc64> int pipe(int *);
+ int pipe2(int *, int);
+ mode_t umask(mode_t);
+ int chroot(const char *);
+-int symlink(const char *, const char *);
++<?> int symlink(const char *, const char *);
+ <?> int symlinkat(const char *, int, const char *);
+-int readlink(const char *, char *, size_t);
++<?> int readlink(const char *, char *, size_t);
+ <?> int readlinkat(int, const char *, char *, int);
+-<!ppc64> int stat64,stat::stat(const char *, struct stat *);
+-<!ppc64> int lstat64,lstat::lstat(const char *, struct stat *);
++<?!ppc64> int stat64,stat::stat(const char *, struct stat *);
++<?!ppc64> int lstat64,lstat::lstat(const char *, struct stat *);
+ <!ppc64> int fstat64,fstat::fstat(int, struct stat *);
+ <ppc64> int stat::stat(const char *, struct stat *);
+ <ppc64> int lstat::lstat(const char *, struct stat *);
+@@ -141,14 +141,15 @@ int readlink(const char *, char *, size_t);
+ /* XXX: Is this right?! */
+ <?> int fstatat64,newfstatat,fstatat::fstatat(int, const char *, struct stat *, int);
+ int getdents64,getdents::getdents(unsigned int, struct dirent *, unsigned int);
+-int chown32,chown::chown(const char *, uid_t, gid_t);
++<?> int chown32,chown::chown(const char *, uid_t, gid_t);
+ int fchown32,fchown::fchown(int, uid_t, gid_t);
+ <?> int fchownat(int, const char *, uid_t, gid_t, int);
+-int lchown32,lchown::lchown(const char *, uid_t, gid_t);
++<?> int lchown32,lchown::lchown(const char *, uid_t, gid_t);
+ int getcwd::__getcwd(char *, size_t);
+ <?> int utime(const char *, const struct utimbuf *);
+ <?> int utimes(const char *, const struct timeval *);
+ <?> int futimesat(int, const char *, const struct timeval *);
++<?> int utimensat(int, const char *, const struct timespec *, int);
+ <?> int inotify_init();
+ <?> int inotify_add_watch(int, const char *, __u32);
+ <?> int inotify_rm_watch(int, __u32);
+@@ -158,7 +159,7 @@ int getcwd::__getcwd(char *, size_t);
+  */
+ <!i386,m68k,64> int open::__open(const char *, int, mode_t);
+ <?!i386,m68k,64> int openat::__openat(int, const char *, int, mode_t);
+-<64> int open(const char *, int, mode_t);
++<?64> int open(const char *, int, mode_t);
+ <64> int openat(int, const char *, int, mode_t);
+ ssize_t read(int, void *, size_t);
+ ssize_t write(int, const void *, size_t);
+@@ -166,14 +167,14 @@ int close(int);
+ <64> off_t lseek(int, off_t, int);
+ <32> int _llseek::__llseek(int, unsigned long, unsigned long, off_t *, int);
+ int dup(int);
+-int dup2(int, int);
++<?> int dup2(int, int);
+ int dup3(int, int, int);
+ <i386> int fcntl64@varadic::fcntl(int, int, unsigned long);
+ <ppc64> int fcntl(int, int, unsigned long);
+ <!i386,ppc64> int fcntl64,fcntl::fcntl(int, int, unsigned long);
+ int ioctl(int, int, void *);
+ int flock(int, int);
+-int _newselect,select::select(int, fd_set *, fd_set *, fd_set *, struct timeval *);
++<?> int _newselect,select::select(int, fd_set *, fd_set *, fd_set *, struct timeval *);
+ #if defined(__NR_pselect) && !_KLIBC_USE_RT_SIG
+ int pselect(int, fd_set *, fd_set *, fd_set *, const struct timespec *, const sigset_t *);
+ #elif defined(__NR_pselect7)
+@@ -181,7 +182,7 @@ int pselect7::__pselect7(int, fd_set *, fd_set *, fd_set *, struct timespec *, c
+ #elif defined(__NR_pselect6)
+ int pselect6::__pselect6(int, fd_set *, fd_set *, fd_set *, struct timespec *, const struct __pselect6 *);
+ #endif
+-int poll(struct pollfd *, nfds_t, long);
++<?> int poll(struct pollfd *, nfds_t, long);
+ <?> int ppoll::__ppoll(struct pollfd *, nfds_t, struct timespec *, const sigset_t *, size_t);
+ int fsync(int);
+ int fdatasync,fsync::fdatasync(int);
+diff --git a/usr/klibc/access.c b/usr/klibc/access.c
+new file mode 100644
+index 0000000..0f24856
+--- /dev/null
++++ b/usr/klibc/access.c
+@@ -0,0 +1,12 @@
++#include <fcntl.h>
++#include <unistd.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_access
++
++int access(const char *pathname, int mode)
++{
++	return faccessat(AT_FDCWD, pathname, mode, 0);
++}
++
++#endif  /* __NR_access */
+diff --git a/usr/klibc/chmod.c b/usr/klibc/chmod.c
+new file mode 100644
+index 0000000..b5129e6
+--- /dev/null
++++ b/usr/klibc/chmod.c
+@@ -0,0 +1,13 @@
++#include <fcntl.h>
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_chmod
++
++int chmod(const char *path, mode_t mode)
++{
++	return fchmodat(AT_FDCWD, path, mode, 0);
++}
++
++#endif  /* __NR_chmod */
+diff --git a/usr/klibc/chown.c b/usr/klibc/chown.c
+new file mode 100644
+index 0000000..089cfc5
+--- /dev/null
++++ b/usr/klibc/chown.c
+@@ -0,0 +1,12 @@
++#include <fcntl.h>
++#include <unistd.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_chown
++
++int chown(const char *path, uid_t owner, gid_t group)
++{
++	return fchownat(AT_FDCWD, path, owner, group, 0);
++}
++
++#endif  /* __NR_chown  */
+diff --git a/usr/klibc/dup2.c b/usr/klibc/dup2.c
+new file mode 100644
+index 0000000..67e2171
+--- /dev/null
++++ b/usr/klibc/dup2.c
+@@ -0,0 +1,11 @@
++#include <unistd.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_dup2
++
++int dup2(int fd, int fd2)
++{
++	return dup3(fd, fd2, 0);
++}
++
++#endif /* __NR_dup2 */
+diff --git a/usr/klibc/lchown.c b/usr/klibc/lchown.c
+new file mode 100644
+index 0000000..9a9e1e1
+--- /dev/null
++++ b/usr/klibc/lchown.c
+@@ -0,0 +1,12 @@
++#include <fcntl.h>
++#include <unistd.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_lchown
++
++int lchown(const char *path, uid_t owner, gid_t group)
++{
++	return fchownat(AT_FDCWD, path, owner, group, AT_SYMLINK_NOFOLLOW);
++}
++
++#endif /* __NR_lchown */
+diff --git a/usr/klibc/link.c b/usr/klibc/link.c
+new file mode 100644
+index 0000000..1d4b70e
+--- /dev/null
++++ b/usr/klibc/link.c
+@@ -0,0 +1,12 @@
++#include <fcntl.h>
++#include <unistd.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_link
++
++int link(const char *oldpath, const char *newpath)
++{
++	return linkat(AT_FDCWD, oldpath, AT_FDCWD, newpath, 0);
++}
++
++#endif  /* __NR_link */
+diff --git a/usr/klibc/lstat.c b/usr/klibc/lstat.c
+new file mode 100644
+index 0000000..3288a33
+--- /dev/null
++++ b/usr/klibc/lstat.c
+@@ -0,0 +1,14 @@
++#include <fcntl.h>
++#include <unistd.h>
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_lstat
++
++int lstat(const char *path, struct stat *buf)
++{
++	return fstatat(AT_FDCWD, path, buf, AT_SYMLINK_NOFOLLOW);
++}
++
++#endif  /* __NR_lstat  */
+diff --git a/usr/klibc/mkdir.c b/usr/klibc/mkdir.c
+new file mode 100644
+index 0000000..27673e3
+--- /dev/null
++++ b/usr/klibc/mkdir.c
+@@ -0,0 +1,14 @@
++#include <fcntl.h>
++#include <sys/stat.h>
++#include <sys/types.h>
++#include <unistd.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_mkdir
++
++int mkdir(const char *pathname, mode_t mode)
++{
++	return mkdirat(AT_FDCWD, pathname, mode);
++}
++
++#endif /* __NR_mkdir */
+diff --git a/usr/klibc/mknod.c b/usr/klibc/mknod.c
+new file mode 100644
+index 0000000..727505f
+--- /dev/null
++++ b/usr/klibc/mknod.c
+@@ -0,0 +1,14 @@
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <fcntl.h>
++#include <unistd.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_mknod
++
++int mknod(const char *pathname, mode_t mode, dev_t dev)
++{
++	return mknodat(AT_FDCWD, pathname, mode, dev);
++}
++
++#endif  /* __NR_mknod  */
+diff --git a/usr/klibc/open.c b/usr/klibc/open.c
+index 126f6db..5305c3d 100644
+--- a/usr/klibc/open.c
++++ b/usr/klibc/open.c
+@@ -3,14 +3,39 @@
+  *
+  * On 32-bit platforms we need to pass O_LARGEFILE to the open()
+  * system call, to indicate that we're 64-bit safe.
++ *
++ * For 64 bit systems without the open syscall, pass straight
++ * through into openat.
+  */
+ 
+ #define _KLIBC_IN_OPEN_C
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <bitsize.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_open
++#if _BITSIZE == 32
++
++extern int __openat(int, const char *, int, mode_t);
++
++int open(const char *pathname, int flags, mode_t mode)
++{
++	return __openat(AT_FDCWD, pathname, flags | O_LARGEFILE, mode);
++}
++
++#else
++
++__extern int openat(int, const char *, int, ...);
++
++int open(const char *pathname, int flags, mode_t mode)
++{
++	return openat(AT_FDCWD, pathname, flags, mode);
++}
++
++#endif /* _BITSIZE == 32 */
+ 
+-#if _BITSIZE == 32 && !defined(__i386__) && !defined(__m68k__)
++#elif _BITSIZE == 32 && !defined(__i386__) && !defined(__m68k__)
+ 
+ extern int __open(const char *, int, mode_t);
+ 
+@@ -19,4 +44,4 @@ int open(const char *pathname, int flags, mode_t mode)
+ 	return __open(pathname, flags | O_LARGEFILE, mode);
+ }
+ 
+-#endif
++#endif /* __NR_open */
+diff --git a/usr/klibc/pipe.c b/usr/klibc/pipe.c
+new file mode 100644
+index 0000000..dfaed9e
+--- /dev/null
++++ b/usr/klibc/pipe.c
+@@ -0,0 +1,11 @@
++#include <unistd.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_pipe
++
++int pipe(int pipefd[2])
++{
++	return pipe2(pipefd, 0);
++}
++
++#endif  /* __NR_pipe */
+diff --git a/usr/klibc/poll.c b/usr/klibc/poll.c
+new file mode 100644
+index 0000000..69da693
+--- /dev/null
++++ b/usr/klibc/poll.c
+@@ -0,0 +1,21 @@
++#include <errno.h>
++#include <sys/poll.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_poll
++
++int poll (struct pollfd *fds, nfds_t nfds, long timeout)
++{
++	struct timespec timeout_ts;
++	struct timespec *timeout_ts_p = NULL;
++
++	if (timeout >= 0) {
++		timeout_ts.tv_sec = timeout / 1000;
++		timeout_ts.tv_nsec = (timeout % 1000) * 1000000;
++		timeout_ts_p = &timeout_ts;
++	}
++
++	return ppoll(fds, nfds, timeout_ts_p, 0);
++}
++
++#endif /* __NR_poll */
+diff --git a/usr/klibc/readlink.c b/usr/klibc/readlink.c
+new file mode 100644
+index 0000000..0e67442
+--- /dev/null
++++ b/usr/klibc/readlink.c
+@@ -0,0 +1,12 @@
++#include <fcntl.h>
++#include <unistd.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_readlink
++
++int readlink(const char *path, char *buf, size_t bufsiz)
++{
++	return readlinkat(AT_FDCWD, path, buf, bufsiz);
++}
++
++#endif /* __NR_readlink */
+diff --git a/usr/klibc/rename.c b/usr/klibc/rename.c
+new file mode 100644
+index 0000000..587c26f
+--- /dev/null
++++ b/usr/klibc/rename.c
+@@ -0,0 +1,11 @@
++#include <fcntl.h>
++#include <stdio.h>
++
++#ifndef __NR_rename
++
++int rename(const char *oldpath, const char *newpath)
++{
++	return renameat(AT_FDCWD, oldpath, AT_FDCWD, newpath);
++}
++
++#endif /* __NR_rename */
+diff --git a/usr/klibc/rmdir.c b/usr/klibc/rmdir.c
+new file mode 100644
+index 0000000..94ae5f2
+--- /dev/null
++++ b/usr/klibc/rmdir.c
+@@ -0,0 +1,12 @@
++#include <fcntl.h>
++#include <unistd.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_rmdir
++
++int rmdir(const char *pathname)
++{
++	return unlinkat(AT_FDCWD, pathname, AT_REMOVEDIR);
++}
++
++#endif /* __NR_rmdir */
+diff --git a/usr/klibc/select.c b/usr/klibc/select.c
+new file mode 100644
+index 0000000..e416794
+--- /dev/null
++++ b/usr/klibc/select.c
+@@ -0,0 +1,34 @@
++#include <sys/time.h>
++#include <sys/types.h>
++#include <sys/select.h>
++#include <errno.h>
++#include <sys/syscall.h>
++
++#if !defined(__NR_select) && !defined(__NR__newselect)
++
++struct __pselect6;
++__extern int __pselect6(int, fd_set *, fd_set *, fd_set *,
++                        const struct timespec *, const struct __pselect6 *);
++
++int select(int nfds, fd_set *readfds, fd_set *writefds,
++			fd_set *exceptfds, struct timeval *timeout)
++{
++	int result;
++	struct timespec ts;
++
++	if (timeout) {
++		ts.tv_sec = timeout->tv_sec;
++		ts.tv_nsec = timeout->tv_usec * 1000;
++	}
++
++	result = __pselect6(nfds, readfds, writefds, exceptfds, &ts, NULL);
++
++	if (timeout) {
++		timeout->tv_sec = ts.tv_sec;
++		timeout->tv_usec = ts.tv_nsec / 1000;
++	}
++
++	return result;
++}
++
++#endif
+diff --git a/usr/klibc/stat.c b/usr/klibc/stat.c
+new file mode 100644
+index 0000000..65063b0
+--- /dev/null
++++ b/usr/klibc/stat.c
+@@ -0,0 +1,14 @@
++#include <fcntl.h>
++#include <unistd.h>
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_stat
++
++int stat(const char *path, struct stat *buf)
++{
++	return fstatat(AT_FDCWD, path, buf, 0);
++}
++
++#endif /* __NR_stat */
+diff --git a/usr/klibc/symlink.c b/usr/klibc/symlink.c
+new file mode 100644
+index 0000000..080394f
+--- /dev/null
++++ b/usr/klibc/symlink.c
+@@ -0,0 +1,12 @@
++#include <fcntl.h>
++#include <unistd.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_symlink
++
++int symlink(const char *oldpath, const char *newpath)
++{
++	return symlinkat(oldpath, AT_FDCWD, newpath);
++}
++
++#endif /* __NR_symlink */
+diff --git a/usr/klibc/unlink.c b/usr/klibc/unlink.c
+new file mode 100644
+index 0000000..6dfe66c
+--- /dev/null
++++ b/usr/klibc/unlink.c
+@@ -0,0 +1,12 @@
++#include <fcntl.h>
++#include <unistd.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_unlink
++
++int unlink(const char *pathname)
++{
++	return unlinkat(AT_FDCWD, pathname, 0);
++}
++
++#endif  /* __NR_unlink */
+diff --git a/usr/klibc/utimes.c b/usr/klibc/utimes.c
+new file mode 100644
+index 0000000..fd378a6
+--- /dev/null
++++ b/usr/klibc/utimes.c
+@@ -0,0 +1,20 @@
++#include <fcntl.h>
++#include <sys/time.h>
++#include <sys/stat.h>
++#include <sys/syscall.h>
++
++#ifndef __NR_utimes
++
++int utimes(const char *file, const struct timeval tvp[2])
++{
++	struct timespec ts[2];
++
++	if (tvp) {
++		ts->tv_sec = tvp->tv_sec;
++		ts->tv_nsec = tvp->tv_usec * 1000;
++	}
++
++	return utimensat(AT_FDCWD, file, &ts[0], 0);
++}
++
++#endif /* __NR_utimes */
+-- 
+1.8.4.2
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/0003-arm64-Introduce-arm64-support.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/0003-arm64-Introduce-arm64-support.patch
new file mode 100644
index 0000000..f0426c8
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/0003-arm64-Introduce-arm64-support.patch
@@ -0,0 +1,431 @@
+From 7a4ccb45e823e465e5e8a3787bc6269fa9538d3c Mon Sep 17 00:00:00 2001
+From: Steve Capper <steve.capper@linaro.org>
+Date: Wed, 6 Nov 2013 16:30:27 +0000
+Subject: [PATCH 3/3] arm64: Introduce arm64 support
+
+Based on work by Neil Williams (codehelp@debian.org) and Anil Singhar
+(anil.singhar@linaro.org), this patch introduces arm64 support.
+
+Originally-by: Neil Williams <codehelp@debian.org>
+Originally-by: Anil Singhar <anil.singhar@linaro.org>
+Signed-off-by: Steve Capper <steve.capper@linaro.org>
+
+Upstream-status: Submitted
+
+---
+ Makefile                                  |  3 +-
+ usr/include/arch/arm64/klibc/archconfig.h | 17 +++++++++++
+ usr/include/arch/arm64/klibc/archsetjmp.h | 22 +++++++++++++++
+ usr/include/arch/arm64/klibc/archsignal.h | 14 +++++++++
+ usr/include/arch/arm64/klibc/archstat.h   | 29 +++++++++++++++++++
+ usr/include/arch/arm64/klibc/asmmacros.h  | 11 ++++++++
+ usr/klibc/README.klibc                    |  1 +
+ usr/klibc/SYSCALLS.def                    |  2 +-
+ usr/klibc/arch/arm64/Kbuild               |  7 +++++
+ usr/klibc/arch/arm64/MCONFIG              | 23 +++++++++++++++
+ usr/klibc/arch/arm64/crt0.S               | 19 +++++++++++++
+ usr/klibc/arch/arm64/setjmp.S             | 47 +++++++++++++++++++++++++++++++
+ usr/klibc/arch/arm64/syscall.S            | 25 ++++++++++++++++
+ usr/klibc/arch/arm64/sysstub.ph           | 25 ++++++++++++++++
+ usr/klibc/arch/arm64/vfork.S              | 34 ++++++++++++++++++++++
+ 15 files changed, 277 insertions(+), 2 deletions(-)
+ create mode 100644 usr/include/arch/arm64/klibc/archconfig.h
+ create mode 100644 usr/include/arch/arm64/klibc/archsetjmp.h
+ create mode 100644 usr/include/arch/arm64/klibc/archsignal.h
+ create mode 100644 usr/include/arch/arm64/klibc/archstat.h
+ create mode 100644 usr/include/arch/arm64/klibc/asmmacros.h
+ create mode 100644 usr/klibc/arch/arm64/Kbuild
+ create mode 100644 usr/klibc/arch/arm64/MCONFIG
+ create mode 100644 usr/klibc/arch/arm64/crt0.S
+ create mode 100644 usr/klibc/arch/arm64/setjmp.S
+ create mode 100644 usr/klibc/arch/arm64/syscall.S
+ create mode 100644 usr/klibc/arch/arm64/sysstub.ph
+ create mode 100644 usr/klibc/arch/arm64/vfork.S
+
+diff --git a/Makefile b/Makefile
+index 0a3ee69..a7da622 100644
+--- a/Makefile
++++ b/Makefile
+@@ -30,7 +30,8 @@ export OBJDUMP  := $(KLIBCROSS)objdump
+ 
+ NOSTDINC_FLAGS := -nostdlib -nostdinc -isystem $(shell $(CC) -print-file-name=include)
+ 
+-ARCH	          := $(shell uname -m | sed -e s/i.86/i386/ -e s/parisc64/parisc/ -e s/sun4u/sparc64/ -e s/arm.*/arm/ -e s/sa110/arm/ -e s/sh.*/sh/)
++ARCH	          := $(shell uname -m | sed -e s/i.86/i386/ -e s/parisc64/parisc/ -e s/sun4u/sparc64/ -e s/arm.*/arm/ -e s/sa110/arm/ \
++			-e s/aarch64.*/arm64/ -e s/sh.*/sh/)
+ export KLIBCARCH  ?= $(ARCH)
+ export KLIBCARCHDIR := $(shell echo $(KLIBCARCH) | sed -e s/s390x/s390/)
+ 
+diff --git a/usr/include/arch/arm64/klibc/archconfig.h b/usr/include/arch/arm64/klibc/archconfig.h
+new file mode 100644
+index 0000000..5e2004b
+--- /dev/null
++++ b/usr/include/arch/arm64/klibc/archconfig.h
+@@ -0,0 +1,17 @@
++/*
++ * include/arch/arm64/klibc/archconfig.h
++ *
++ * See include/klibc/sysconfig.h for the options that can be set in
++ * this file.
++ *
++ */
++
++#ifndef _KLIBC_ARCHCONFIG_H
++#define _KLIBC_ARCHCONFIG_H
++
++/* Use rt_* signals */
++#define _KLIBC_USE_RT_SIG 1
++#define _KLIBC_NO_MMU 0
++#define _KLIBC_REAL_VFORK 1
++
++#endif				/* _KLIBC_ARCHCONFIG_H */
+diff --git a/usr/include/arch/arm64/klibc/archsetjmp.h b/usr/include/arch/arm64/klibc/archsetjmp.h
+new file mode 100644
+index 0000000..edc3312
+--- /dev/null
++++ b/usr/include/arch/arm64/klibc/archsetjmp.h
+@@ -0,0 +1,22 @@
++/*
++ * arch/arm64/include/klibc/archsetjmp.h
++ */
++
++#ifndef _KLIBC_ARCHSETJMP_H
++#define _KLIBC_ARCHSETJMP_H
++
++/*
++ * x19-x28 are callee saved, also save fp, lr, sp.
++ * d8-d15 are unused as we specify -mgeneral-regs-only as a build flag.
++ */
++
++struct __jmp_buf {
++	uint64_t __x19, __x20, __x21, __x22;
++	uint64_t __x23, __x24, __x25, __x26;
++	uint64_t __x27, __x28, __x29, __x30;
++	uint64_t __sp;
++};
++
++typedef struct __jmp_buf jmp_buf[1];
++
++#endif				/* _SETJMP_H */
+diff --git a/usr/include/arch/arm64/klibc/archsignal.h b/usr/include/arch/arm64/klibc/archsignal.h
+new file mode 100644
+index 0000000..94e6bc8
+--- /dev/null
++++ b/usr/include/arch/arm64/klibc/archsignal.h
+@@ -0,0 +1,14 @@
++/*
++ * arch/arm64/include/klibc/archsignal.h
++ *
++ * Architecture-specific signal definitions
++ *
++ */
++
++#ifndef _KLIBC_ARCHSIGNAL_H
++#define _KLIBC_ARCHSIGNAL_H
++
++#include <asm/signal.h>
++/* No special stuff for this architecture */
++
++#endif
+diff --git a/usr/include/arch/arm64/klibc/archstat.h b/usr/include/arch/arm64/klibc/archstat.h
+new file mode 100644
+index 0000000..a1a3e79
+--- /dev/null
++++ b/usr/include/arch/arm64/klibc/archstat.h
+@@ -0,0 +1,29 @@
++#ifndef _KLIBC_ARCHSTAT_H
++#define _KLIBC_ARCHSTAT_H
++
++#include <klibc/stathelp.h>
++
++struct stat {
++          unsigned long   st_dev;         /* Device.  */
++          unsigned long   st_ino;         /* File serial number.  */
++          unsigned int    st_mode;        /* File mode.  */
++          unsigned int    st_nlink;       /* Link count.  */
++          unsigned int    st_uid;         /* User ID of the file's owner.  */
++          unsigned int    st_gid;         /* Group ID of the file's group. */
++          unsigned long   st_rdev;        /* Device number, if device.  */
++          unsigned long   __pad1;
++          long            st_size;        /* Size of file, in bytes.  */
++          int             st_blksize;     /* Optimal block size for I/O.  */
++          int             __pad2;
++          long            st_blocks;      /* Number 512-byte blocks allocated. */
++          long            st_atime;       /* Time of last access.  */
++          unsigned long   st_atime_nsec;
++          long            st_mtime;       /* Time of last modification.  */
++          unsigned long   st_mtime_nsec;
++          long            st_ctime;       /* Time of last status change.  */
++          unsigned long   st_ctime_nsec;
++          unsigned int    __unused4;
++          unsigned int    __unused5;
++  };
++
++#endif
+diff --git a/usr/include/arch/arm64/klibc/asmmacros.h b/usr/include/arch/arm64/klibc/asmmacros.h
+new file mode 100644
+index 0000000..c298f66
+--- /dev/null
++++ b/usr/include/arch/arm64/klibc/asmmacros.h
+@@ -0,0 +1,11 @@
++/*
++ * usr/include/arch/arm64/klibc/asmmacros.h
++ *
++ * Assembly macros used by arm64 system call stubs
++ */
++
++#ifndef _KLIBC_ASMMACROS_H
++#define _KLIBC_ASMMACROS_H
++
++
++#endif /* _KLIBC_ASMMACROS_H */
+diff --git a/usr/klibc/README.klibc b/usr/klibc/README.klibc
+index 7de5fea..c72ae47 100644
+--- a/usr/klibc/README.klibc
++++ b/usr/klibc/README.klibc
+@@ -36,6 +36,7 @@ b) If you're cross-compiling, you need to set KLIBCARCH to the
+    arm-thumb:	 Untested
+    arm:		 Working
+    arm26:	 Not yet ported
++   arm64:	 Working
+    avr32:	 Not yet ported
+    cris:	 Working
+    h8300:	 Not yet ported
+diff --git a/usr/klibc/SYSCALLS.def b/usr/klibc/SYSCALLS.def
+index 12f57ac..41cfa17 100644
+--- a/usr/klibc/SYSCALLS.def
++++ b/usr/klibc/SYSCALLS.def
+@@ -21,7 +21,7 @@ void _exit,exit::_exit(int);
+ <?!ia64> pid_t clone::__clone(unsigned long, void *);
+ <?ia64> pid_t clone::__clone2(unsigned long, void *, void *);
+ # if ! _KLIBC_NO_MMU
+-<!sparc,sparc64,ia64> pid_t fork();
++<!sparc,sparc64,ia64,arm64> pid_t fork();
+ <sparc,sparc64> pid_t fork@forkish();
+ #endif
+ #if _KLIBC_REAL_VFORK
+diff --git a/usr/klibc/arch/arm64/Kbuild b/usr/klibc/arch/arm64/Kbuild
+new file mode 100644
+index 0000000..f8643b5
+--- /dev/null
++++ b/usr/klibc/arch/arm64/Kbuild
+@@ -0,0 +1,7 @@
++
++# klibc files for arm64
++#
++
++klib-y := setjmp.o syscall.o vfork.o
++always  := crt0.o
++targets := crt0.o
+diff --git a/usr/klibc/arch/arm64/MCONFIG b/usr/klibc/arch/arm64/MCONFIG
+new file mode 100644
+index 0000000..82664a7
+--- /dev/null
++++ b/usr/klibc/arch/arm64/MCONFIG
+@@ -0,0 +1,23 @@
++# -*- makefile -*-
++#
++# arch/arm64/MCONFIG
++#
++# Special rules for this architecture.  Note that this is actually
++# included from the main Makefile, and that pathnames should be
++# accordingly.
++#
++
++CPU_ARCH ?= armv8-a
++CPU_TUNE ?= generic
++
++KLIBCOPTFLAGS += -g -Os -march=$(CPU_ARCH) -mtune=$(CPU_TUNE)
++KLIBCBITSIZE  = 64
++KLIBCREQFLAGS += -fno-exceptions -mgeneral-regs-only
++
++# Extra linkflags when building the shared version of the library
++# This address needs to be reachable using normal inter-module
++# calls, and work on the memory models for this architecture
++
++# On arm64, binaries are normally loaded at 4MB. Place klibc.so
++# a little before that at 2MB to prevent overlap.
++KLIBCSHAREDFLAGS = -Ttext 0x0200000
+diff --git a/usr/klibc/arch/arm64/crt0.S b/usr/klibc/arch/arm64/crt0.S
+new file mode 100644
+index 0000000..0b2dd32
+--- /dev/null
++++ b/usr/klibc/arch/arm64/crt0.S
+@@ -0,0 +1,19 @@
++#
++# arch/arm64/crt0.S
++#
++# void _start(void)
++# {
++#    __libc_init(elf_structure, atexit_ptr);
++# }
++#
++
++	.text
++	.balign 8
++	.type _start,#function
++	.globl _start
++
++_start:
++	mov	x0, sp
++	mov	x1, #0
++	bl	__libc_init
++	.size _start,.-_start
+diff --git a/usr/klibc/arch/arm64/setjmp.S b/usr/klibc/arch/arm64/setjmp.S
+new file mode 100644
+index 0000000..13ab99d
+--- /dev/null
++++ b/usr/klibc/arch/arm64/setjmp.S
+@@ -0,0 +1,47 @@
++#
++# arch/arm64/setjmp.S
++#
++# setjmp/longjmp for arm64
++#
++
++#include <klibc/asmmacros.h>
++
++# we specify -mgeneral-regs-only as a build flag thus do not need to
++# save d8-d15
++
++	.text
++	.balign 8
++	.globl setjmp
++	.type setjmp, #function
++setjmp:
++	mov	x1, sp
++	stp	x19, x20, [x0, #0]
++	stp	x21, x22, [x0, #16]
++	stp	x23, x24, [x0, #32]
++	stp	x25, x26, [x0, #48]
++	stp	x27, x28, [x0, #64]
++	stp	x29, x30, [x0, #80]
++	str	x1,       [x0, #96]
++	mov	x0, #0 			/* set the return value of setjmp */
++	br	x30
++	.size setjmp,.-setjmp
++
++	.text
++	.balign 8
++	.globl longjmp
++	.type longjmp, #function
++longjmp:
++	ldp	x19, x20, [x0, #0]
++	ldp	x21, x22, [x0, #16]
++	ldp	x23, x24, [x0, #32]
++	ldp	x25, x26, [x0, #48]
++	ldp	x27, x28, [x0, #64]
++	ldp	x29, x30, [x0, #80]
++	ldr	x2,	  [x0, #96]
++	mov	sp, x2
++	mov	x0, x1
++	cbnz	x1, 1f
++	mov	x0, #1
++1:
++	br	x30
++	.size longjmp,.-longjmp
+diff --git a/usr/klibc/arch/arm64/syscall.S b/usr/klibc/arch/arm64/syscall.S
+new file mode 100644
+index 0000000..3ce91fb
+--- /dev/null
++++ b/usr/klibc/arch/arm64/syscall.S
+@@ -0,0 +1,25 @@
++/*
++ * arch/arm64/syscall.S
++ *
++ * System call common handling - if the return
++ * value from the system call is negative, then
++ * extract the magnitude and return it as errno and
++ * return -1, if the return value is 0 that is
++ * success case.
++ */
++
++	.type	__syscall_common,#function
++	.globl  __syscall_common
++	.balign 8
++
++__syscall_common:
++	cmp	x0, #0x0
++	b.ge	2f
++	neg	x0, x0
++	ldr	x8, 1f
++	str	x0, [x8]
++	mov	x0, #-1
++2:
++	ret
++1:
++	.dword	errno
+diff --git a/usr/klibc/arch/arm64/sysstub.ph b/usr/klibc/arch/arm64/sysstub.ph
+new file mode 100644
+index 0000000..47cbfd9
+--- /dev/null
++++ b/usr/klibc/arch/arm64/sysstub.ph
+@@ -0,0 +1,25 @@
++# -*- perl -*-
++#
++# arch/arm64/sysstub.ph
++#
++# Script to generate system call stubs
++#
++
++sub make_sysstub($$$$$@) {
++    my($outputdir, $fname, $type, $sname, $stype, @args) = @_;
++
++    open(OUT, '>', "${outputdir}/${fname}.S");
++    print  OUT "#include <asm/unistd.h>\n";
++    print  OUT "#include <klibc/asmmacros.h>\n";
++    print  OUT "	.text\n";
++    print  OUT "	.type	${fname}, #function\n";
++    print  OUT "	.globl	${fname}\n";
++    print  OUT "	.balign	8\n";
++    print  OUT "${fname}:\n";
++    print  OUT "	mov w8,__NR_${sname}\n";
++    print  OUT "	svc	0\n";
++    print  OUT "	b	__syscall_common\n";
++    print  OUT "	.size	${fname},.-${fname}\n";
++}
++
++1;
+diff --git a/usr/klibc/arch/arm64/vfork.S b/usr/klibc/arch/arm64/vfork.S
+new file mode 100644
+index 0000000..494326c
+--- /dev/null
++++ b/usr/klibc/arch/arm64/vfork.S
+@@ -0,0 +1,34 @@
++/*
++ * arch/arm64/vfork.S
++ *
++ * vfork - a system call which must not use the stack.
++ */
++
++#include <klibc/asmmacros.h>
++#include <asm/unistd.h>
++
++	.type	vfork,#function
++	.globl	vfork
++	.balign	8
++
++vfork:
++	/* Prepare for the system call */
++        /* 1. Push the function pointer and argument location
++              on to the child process stack */
++        /* 2. Gather the Flags */
++        /* New sp is already in x1.  */
++        mov     x0, #0x4111     /* CLONE_VM | CLONE_VFORK | SIGCHLD */
++        mov     x1, sp
++        mov     w8,__NR_clone
++        svc     0
++        cmp     x0, #0x0
++        b.ge    2f
++        neg     x0, x0
++        ldr     x8, 1f
++        str     x0, [x8]
++        mov     x0, #-1
++2:
++        ret
++1:
++        .dword   errno
++        .size   vfork,.-vfork
+-- 
+1.8.4.2
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb
index 4244cf2..7d1eabe 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb
@@ -22,4 +22,10 @@ FILES_libklibc-dev = "${libdir}/klibc.so \
                       ${libdir}/klibc/include/* \
 "
 require klibc.inc
+
+SRC_URI += "file://0001-syscalls-Fixup-some-syscalls.patch \
+            file://0002-syscalls-Add-syscalls-needed-by-arm64.patch \
+            file://0003-arm64-Introduce-arm64-support.patch \
+           "
+
 SUMMARY = "klibc, a small C library for use with initramfs"
-- 
1.8.4.2


