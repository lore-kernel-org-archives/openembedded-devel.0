Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 13AF47862D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 06:44:40 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id v82so897428pgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 23:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JxmXCzUnu5pyfoVMgZasbVzVRdNfJ2WeuFbE50ZAqh0=;
	b=YbNqcieEfGNz4pkabmmTFl1Vr21YPzo4DLHnCtXt+75erkrtt5njXkr5/wZAMQDpEr
	pPS8+87AD9JwG4YEgE2akbRVv23jpRU0eDgkdk3V1pUUJNS1yvv3GO845/NxZCa5Rcgd
	q13AslaiMW+HRI87TSmCf+ex5IIdV56BU+7NbHQMslJMCoIs+395/8Gjaa29RBNdsrqr
	bXd2R/lVzRbypCSEyynCWiEXwXaTqGTd7IcXMkKf+XrVZsMoQIV1Ydr5tNl2YkvaYm2k
	1RoHCcQyYol0H+hDAoa+/wGSKRDYtTr7C5vLv/nUBhRtiKu7W/p0/Iqjb37Qb/JjbtW0
	TqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JxmXCzUnu5pyfoVMgZasbVzVRdNfJ2WeuFbE50ZAqh0=;
	b=q5lT+hFAHU4heu8JJWS79U3BTm1oADiM3pUYV+gVxuuCJgV4SMDFM8JeydPFyoTQHg
	x22afotKArm5KiUTzrSE/6LngaGY32QyqImLlra89J1GhzmDJYTSj12sENDgsBNfDbD+
	UxBTCKRKcpblMeC3wpa0KI4Pb05JyhaoX9PZQLjRr2WHI6Ffiv/x9C6hboPj2AW/fGKZ
	bmbdQoj/AZM++2l6fadUo7p0j+28Ry7wZu0PeBfh84dfghl2aDwqyipsag5kuz5aVaYH
	agLBrTivQcZ6amifMGl9OC8+34o2rnR5RgB35VDW6wFBxEIvWU/FEQRjFh9ykI02g+FI
	Ixeg==
X-Gm-Message-State: AHPjjUjY4V1i9oQD8OB/AsnhYH1cefVQBKRDCLUXtSVVz2JU078MNm3A
	/t185MLqY1rHsZTg
X-Google-Smtp-Source: AOwi7QBs+DTV4pgyr4ShxUodh20ukgrb6olvOiKwOByljwsKkoK2asY4L1puV19uq8kPLo2pmHo4vA==
X-Received: by 10.159.244.24 with SMTP id x24mr4929306plr.434.1505457881686;
	Thu, 14 Sep 2017 23:44:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id
	r11sm642470pfg.180.2017.09.14.23.44.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 23:44:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Sep 2017 23:44:30 -0700
Message-Id: <20170915064430.35932-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170915064430.35932-1-raj.khem@gmail.com>
References: <20170915064430.35932-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] breakpad: Upgrade to latest master
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
X-List-Received-Date: Fri, 15 Sep 2017 06:44:41 -0000

Fix build with musl while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Turn-off-sign-compare-for-musl-libc.patch |  41 +++++
 ...-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch |  24 +++
 .../0001-lss-Match-syscalls-to-match-musl.patch    |  27 +++
 .../breakpad/0002-Avoid-using-basename.patch       |  29 +++
 ...nal.h-is-a-nonportable-alias-for-signal.h.patch |  26 +++
 .../breakpad/0003-Dont-include-stab.h.patch        |  63 +++++++
 ...nflict-between-musl-libc-dirent.h-and-lss.patch |  35 ++++
 ...cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch |  26 +++
 ...-Import-necessary-definitions-from-stab.h.patch | 199 +++++++++++++++++++++
 .../breakpad/0005-md2core-Replace-basename.patch   |  38 ++++
 meta-oe/recipes-devtools/breakpad/breakpad_git.bb  |  17 +-
 11 files changed, 520 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-Turn-off-sign-compare-for-musl-libc.patch
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-lss-Match-syscalls-to-match-musl.patch
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0002-Avoid-using-basename.patch
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0002-sys-signal.h-is-a-nonportable-alias-for-signal.h.patch
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0005-Import-necessary-definitions-from-stab.h.patch
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0005-md2core-Replace-basename.patch

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Turn-off-sign-compare-for-musl-libc.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Turn-off-sign-compare-for-musl-libc.patch
new file mode 100644
index 000000000..33bae1a37
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Turn-off-sign-compare-for-musl-libc.patch
@@ -0,0 +1,41 @@
+From ab8dcad25d0ac1f3a88814e78794e5d450de15ac Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 14 Sep 2017 23:12:51 -0700
+Subject: [PATCH 1/5] Turn off sign-compare for musl-libc
+
+Fix
+
+../../../../../../../workspace/sources/breakpad/src/client/linux/crash_generation/crash_generation_server.cc:234:14: error:                 comparison of integers of different signs: 'unsigned long' and 'int' [-Werror,-Wsign-compare]                                          hdr = CMSG_NXTHDR(&msg, hdr)) {                                                                                                             ^~~~~~~~~~~~~~~~~~~~~~
+/mnt/a/oe/build/tmp/work/cortexa7hf-neon-vfpv4-bec-linux-musleabi/breakpad/1_1.0+git999-r0/recipe-sysroot/usr/include/sys/socket.h:288:44: note:                                                                                                                                  expanded from macro 'CMSG_NXTHDR'                                                                                                       __CMSG_LEN(cmsg) + sizeof(struct cmsghdr) >= __MHDR_END(mhdr) - (unsigned char *)(cmsg) \                                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                                       1 error generated.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/client/linux/crash_generation/crash_generation_server.cc | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/client/linux/crash_generation/crash_generation_server.cc b/src/client/linux/crash_generation/crash_generation_server.cc
+index 2596afde..2faeb9e5 100644
+--- a/src/client/linux/crash_generation/crash_generation_server.cc
++++ b/src/client/linux/crash_generation/crash_generation_server.cc
+@@ -230,8 +230,18 @@ CrashGenerationServer::ClientEvent(short revents)
+   // Walk the control payload and extract the file descriptor and validated pid.
+   pid_t crashing_pid = -1;
+   int signal_fd = -1;
++#ifndef __GLIBC__
++  // In musl-libc, CMSG_NXTHDR typecasts char* to cmsghdr* which causes
++  // clang to throw sign-compare warning. This is to suppress the warning
++  // inline.
++  #pragma clang diagnostic push
++  #pragma clang diagnostic ignored "-Wsign-compare"
++#endif
+   for (struct cmsghdr *hdr = CMSG_FIRSTHDR(&msg); hdr;
+        hdr = CMSG_NXTHDR(&msg, hdr)) {
++#ifndef __GLIBC__
++  #pragma clang diagnostic pop
++#endif
+     if (hdr->cmsg_level != SOL_SOCKET)
+       continue;
+     if (hdr->cmsg_type == SCM_RIGHTS) {
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch
new file mode 100644
index 000000000..df007956b
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch
@@ -0,0 +1,24 @@
+From 68580cb62f77117be3164c52abae68f75e8e59a1 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sun, 1 Feb 2015 14:26:52 +0100
+Subject: [PATCH 1/3] include <sys/reg.h> to get __WORDSIZE on musl libc
+
+---
+ src/common/linux/elf_core_dump.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/common/linux/elf_core_dump.h b/src/common/linux/elf_core_dump.h
+index d03c7a88..02eb391c 100644
+--- a/src/common/linux/elf_core_dump.h
++++ b/src/common/linux/elf_core_dump.h
+@@ -36,6 +36,7 @@
+ #include <elf.h>
+ #include <link.h>
+ #include <stddef.h>
++#include <sys/reg.h>
+ 
+ #include "common/memory_range.h"
+ 
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-lss-Match-syscalls-to-match-musl.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-lss-Match-syscalls-to-match-musl.patch
new file mode 100644
index 000000000..da8633f31
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-lss-Match-syscalls-to-match-musl.patch
@@ -0,0 +1,27 @@
+From 5f7333e4f7b7485598bd71aa80967e1a16a7f901 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 14 Sep 2017 22:57:52 -0700
+Subject: [PATCH] lss: Match syscalls to match musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ linux_syscall_support.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/linux_syscall_support.h b/linux_syscall_support.h
+index cb3fac2..6894a77 100644
+--- a/linux_syscall_support.h
++++ b/linux_syscall_support.h
+@@ -793,6 +793,9 @@ struct kernel_statfs {
+ #define FUTEX_TRYLOCK_PI_PRIVATE  (FUTEX_TRYLOCK_PI | FUTEX_PRIVATE_FLAG)
+ #endif
+ 
++#ifndef __NR_fstatat
++#define __NR_fstatat __NR_fstatat64
++#endif
+ 
+ #if defined(__x86_64__)
+ #ifndef ARCH_SET_GS
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0002-Avoid-using-basename.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0002-Avoid-using-basename.patch
new file mode 100644
index 000000000..bc6282981
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0002-Avoid-using-basename.patch
@@ -0,0 +1,29 @@
+From 806964f852773e427fea82a7716d44ce3be4498c Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sun, 1 Feb 2015 14:27:32 +0100
+Subject: [PATCH 2/3] Avoid using basename
+
+---
+ src/common/linux/dump_symbols.cc | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/common/linux/dump_symbols.cc b/src/common/linux/dump_symbols.cc
+index d029ca14..6ac4a17b 100644
+--- a/src/common/linux/dump_symbols.cc
++++ b/src/common/linux/dump_symbols.cc
+@@ -881,9 +881,9 @@ const char* ElfArchitecture(const typename ElfClass::Ehdr* elf_header) {
+ // last slash, or the whole filename if there are no slashes.
+ string BaseFileName(const string &filename) {
+   // Lots of copies!  basename's behavior is less than ideal.
+-  char* c_filename = strdup(filename.c_str());
+-  string base = basename(c_filename);
+-  free(c_filename);
++  const char *c_filename = filename.c_str();
++  const char *p = strrchr(c_filename, '/');
++  string base = p ? p+1 : c_filename;
+   return base;
+ }
+ 
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0002-sys-signal.h-is-a-nonportable-alias-for-signal.h.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0002-sys-signal.h-is-a-nonportable-alias-for-signal.h.patch
new file mode 100644
index 000000000..cfd9a9b34
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0002-sys-signal.h-is-a-nonportable-alias-for-signal.h.patch
@@ -0,0 +1,26 @@
+From 15582e19c2545d5ffe8ff07f957d0ed602aeca74 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 14 Sep 2017 23:15:09 -0700
+Subject: [PATCH 2/5] <sys/signal.h> is a nonportable alias for <signal.h>
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/client/linux/handler/exception_handler.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
+index 05936d28..cca023fd 100644
+--- a/src/client/linux/handler/exception_handler.cc
++++ b/src/client/linux/handler/exception_handler.cc
+@@ -78,7 +78,7 @@
+ #include <sys/wait.h>
+ #include <unistd.h>
+ 
+-#include <sys/signal.h>
++#include <signal.h>
+ #include <sys/ucontext.h>
+ #include <sys/user.h>
+ #include <ucontext.h>
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch
new file mode 100644
index 000000000..980cda233
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch
@@ -0,0 +1,63 @@
+From 569af712da94637091080943f6a0d69ccb35864e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 14 Sep 2017 23:24:08 -0700
+Subject: [PATCH 3/5] Dont include stab.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/common/stabs_reader.cc          |  1 -
+ src/common/stabs_reader.h           | 12 +++++++++++-
+ src/common/stabs_reader_unittest.cc |  1 -
+ 3 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/src/common/stabs_reader.cc b/src/common/stabs_reader.cc
+index 6019fc7e..9562caab 100644
+--- a/src/common/stabs_reader.cc
++++ b/src/common/stabs_reader.cc
+@@ -34,7 +34,6 @@
+ #include "common/stabs_reader.h"
+ 
+ #include <assert.h>
+-#include <stab.h>
+ #include <string.h>
+ 
+ #include <string>
+diff --git a/src/common/stabs_reader.h b/src/common/stabs_reader.h
+index 98ee2dd5..9a23e25d 100644
+--- a/src/common/stabs_reader.h
++++ b/src/common/stabs_reader.h
+@@ -57,8 +57,18 @@
+ #include <mach-o/nlist.h>
+ #elif defined(HAVE_A_OUT_H)
+ #include <a.out.h>
++#else
++// Definitions from <stab.h> and <a.out.h> for systems which
++// do not have them
++#undef N_UNDF
++#define N_UNDF 0x0
++#define N_FUN 0x24
++#define N_SLINE 0x44
++#define N_SO 0x64
++#define N_LSYM 0x80
++#define N_BINCL 0x82
++#define N_SOL 0x84
+ #endif
+-
+ #include <string>
+ #include <vector>
+ 
+diff --git a/src/common/stabs_reader_unittest.cc b/src/common/stabs_reader_unittest.cc
+index a84da1c4..854ac420 100644
+--- a/src/common/stabs_reader_unittest.cc
++++ b/src/common/stabs_reader_unittest.cc
+@@ -33,7 +33,6 @@
+ 
+ #include <assert.h>
+ #include <errno.h>
+-#include <stab.h>
+ #include <stdarg.h>
+ #include <stdlib.h>
+ #include <string.h>
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch
new file mode 100644
index 000000000..851004704
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch
@@ -0,0 +1,35 @@
+From 7aa266545dabf9934ccd44d4fc836040497159be Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sun, 1 Feb 2015 13:41:08 +0100
+Subject: [PATCH 3/3] Fix conflict between musl libc <dirent.h> and lss
+
+Include <dirent.h> late to avoid the macro getdents64 in musl
+libc's <dirent.h> to conflict with linux_sycall_support.h.
+---
+ src/client/linux/crash_generation/crash_generation_server.cc | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/client/linux/crash_generation/crash_generation_server.cc b/src/client/linux/crash_generation/crash_generation_server.cc
+index 26c50a5c..2596afde 100644
+--- a/src/client/linux/crash_generation/crash_generation_server.cc
++++ b/src/client/linux/crash_generation/crash_generation_server.cc
+@@ -28,7 +28,6 @@
+ // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+ #include <assert.h>
+-#include <dirent.h>
+ #include <fcntl.h>
+ #include <limits.h>
+ #include <poll.h>
+@@ -49,6 +48,8 @@
+ #include "common/linux/guid_creator.h"
+ #include "common/linux/safe_readlink.h"
+ 
++#include <dirent.h>
++
+ static const char kCommandQuit = 'x';
+ 
+ namespace google_breakpad {
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch
new file mode 100644
index 000000000..60ab7a713
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch
@@ -0,0 +1,26 @@
+From 680f9590d19a6e35c7c5587e3f4d8194aab0fcd2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 14 Sep 2017 23:28:36 -0700
+Subject: [PATCH 4/5] elf_reader.cc: include <sys/reg.h> to get __WORDSIZE on
+ musl libc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/common/dwarf/elf_reader.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/common/dwarf/elf_reader.cc b/src/common/dwarf/elf_reader.cc
+index 4135a51a..bb58a5a1 100644
+--- a/src/common/dwarf/elf_reader.cc
++++ b/src/common/dwarf/elf_reader.cc
+@@ -33,6 +33,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/mman.h>
++#include <sys/reg.h>
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <string.h>
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0005-Import-necessary-definitions-from-stab.h.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0005-Import-necessary-definitions-from-stab.h.patch
new file mode 100644
index 000000000..80de8c684
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0005-Import-necessary-definitions-from-stab.h.patch
@@ -0,0 +1,199 @@
+From fa7a3b7312307acad0045549d5f306e7fd117804 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sun, 1 Feb 2015 14:34:44 +0100
+Subject: [PATCH 5/6] Import necessary definitions from stab.h
+
+---
+ configure.ac                        |   1 -
+ src/common/android/include/stab.h   | 100 ------------------------------------
+ src/common/common.gyp               |   1 -
+ src/common/stabs_reader.cc          |   1 -
+ src/common/stabs_reader.h           |  13 +++--
+ src/common/stabs_reader_unittest.cc |   1 -
+ 6 files changed, 10 insertions(+), 107 deletions(-)
+ delete mode 100644 src/common/android/include/stab.h
+
+diff --git a/configure.ac b/configure.ac
+index 2223920..0e55cd9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -73,7 +73,6 @@ AC_HEADER_STDC
+ AC_SYS_LARGEFILE
+ m4_include(m4/ax_pthread.m4)
+ AX_PTHREAD
+-AC_CHECK_HEADERS([a.out.h])
+ 
+ # Only build Linux client libs when compiling for Linux
+ case $host in
+diff --git a/src/common/android/include/stab.h b/src/common/android/include/stab.h
+deleted file mode 100644
+index cd92902..0000000
+--- a/src/common/android/include/stab.h
++++ /dev/null
+@@ -1,100 +0,0 @@
+-// Copyright (c) 2012, Google Inc.
+-// All rights reserved.
+-//
+-// Redistribution and use in source and binary forms, with or without
+-// modification, are permitted provided that the following conditions are
+-// met:
+-//
+-//     * Redistributions of source code must retain the above copyright
+-// notice, this list of conditions and the following disclaimer.
+-//     * Redistributions in binary form must reproduce the above
+-// copyright notice, this list of conditions and the following disclaimer
+-// in the documentation and/or other materials provided with the
+-// distribution.
+-//     * Neither the name of Google Inc. nor the names of its
+-// contributors may be used to endorse or promote products derived from
+-// this software without specific prior written permission.
+-//
+-// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+-// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+-// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+-// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+-// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+-// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+-// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+-// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+-// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+-// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+-// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+-
+-#ifndef GOOGLE_BREAKPAD_COMMON_ANDROID_INCLUDE_STAB_H
+-#define GOOGLE_BREAKPAD_COMMON_ANDROID_INCLUDE_STAB_H
+-
+-#include <sys/cdefs.h>
+-
+-#ifdef __BIONIC_HAVE_STAB_H
+-#include <stab.h>
+-#else
+-
+-#ifdef __cplusplus
+-extern "C" {
+-#endif  // __cplusplus
+-
+-#define _STAB_CODE_LIST       \
+-  _STAB_CODE_DEF(UNDF,0x00)   \
+-  _STAB_CODE_DEF(GSYM,0x20)   \
+-  _STAB_CODE_DEF(FNAME,0x22)  \
+-  _STAB_CODE_DEF(FUN,0x24)    \
+-  _STAB_CODE_DEF(STSYM,0x26)  \
+-  _STAB_CODE_DEF(LCSYM,0x28)  \
+-  _STAB_CODE_DEF(MAIN,0x2a)   \
+-  _STAB_CODE_DEF(PC,0x30)     \
+-  _STAB_CODE_DEF(NSYMS,0x32)  \
+-  _STAB_CODE_DEF(NOMAP,0x34)  \
+-  _STAB_CODE_DEF(OBJ,0x38)    \
+-  _STAB_CODE_DEF(OPT,0x3c)    \
+-  _STAB_CODE_DEF(RSYM,0x40)   \
+-  _STAB_CODE_DEF(M2C,0x42)    \
+-  _STAB_CODE_DEF(SLINE,0x44)  \
+-  _STAB_CODE_DEF(DSLINE,0x46) \
+-  _STAB_CODE_DEF(BSLINE,0x48) \
+-  _STAB_CODE_DEF(BROWS,0x48)  \
+-  _STAB_CODE_DEF(DEFD,0x4a)   \
+-  _STAB_CODE_DEF(EHDECL,0x50) \
+-  _STAB_CODE_DEF(MOD2,0x50)   \
+-  _STAB_CODE_DEF(CATCH,0x54)  \
+-  _STAB_CODE_DEF(SSYM,0x60)   \
+-  _STAB_CODE_DEF(SO,0x64)     \
+-  _STAB_CODE_DEF(LSYM,0x80)   \
+-  _STAB_CODE_DEF(BINCL,0x82)  \
+-  _STAB_CODE_DEF(SOL,0x84)    \
+-  _STAB_CODE_DEF(PSYM,0xa0)   \
+-  _STAB_CODE_DEF(EINCL,0xa2)  \
+-  _STAB_CODE_DEF(ENTRY,0xa4)  \
+-  _STAB_CODE_DEF(LBRAC,0xc0)  \
+-  _STAB_CODE_DEF(EXCL,0xc2)   \
+-  _STAB_CODE_DEF(SCOPE,0xc4)  \
+-  _STAB_CODE_DEF(RBRAC,0xe0)  \
+-  _STAB_CODE_DEF(BCOMM,0xe2)  \
+-  _STAB_CODE_DEF(ECOMM,0xe4)  \
+-  _STAB_CODE_DEF(ECOML,0xe8)  \
+-  _STAB_CODE_DEF(NBTEXT,0xf0) \
+-  _STAB_CODE_DEF(NBDATA,0xf2) \
+-  _STAB_CODE_DEF(NBBSS,0xf4)  \
+-  _STAB_CODE_DEF(NBSTS,0xf6)  \
+-  _STAB_CODE_DEF(NBLCS,0xf8)  \
+-  _STAB_CODE_DEF(LENG,0xfe)
+-
+-enum __stab_debug_code {
+-#define _STAB_CODE_DEF(x,y)  N_##x = y,
+-_STAB_CODE_LIST
+-#undef _STAB_CODE_DEF
+-};
+-
+-#ifdef __cplusplus
+-}  // extern "C"
+-#endif  // __cplusplus
+-
+-#endif  // __BIONIC_HAVE_STAB_H
+-
+-#endif  // GOOGLE_BREAKPAD_COMMON_ANDROID_INCLUDE_STAB_H
+diff --git a/src/common/common.gyp b/src/common/common.gyp
+index f01ede5..c49ff85 100644
+--- a/src/common/common.gyp
++++ b/src/common/common.gyp
+@@ -46,7 +46,6 @@
+         'android/include/elf.h',
+         'android/include/link.h',
+         'android/include/sgidefs.h',
+-        'android/include/stab.h',
+         'android/include/sys/procfs.h',
+         'android/include/sys/signal.h',
+         'android/include/sys/user.h',
+diff --git a/src/common/stabs_reader.cc b/src/common/stabs_reader.cc
+index 6019fc7..9562caa 100644
+--- a/src/common/stabs_reader.cc
++++ b/src/common/stabs_reader.cc
+@@ -34,7 +34,6 @@
+ #include "common/stabs_reader.h"
+ 
+ #include <assert.h>
+-#include <stab.h>
+ #include <string.h>
+ 
+ #include <string>
+diff --git a/src/common/stabs_reader.h b/src/common/stabs_reader.h
+index d89afc0..591f007 100644
+--- a/src/common/stabs_reader.h
++++ b/src/common/stabs_reader.h
+@@ -53,12 +53,19 @@
+ #include <config.h>
+ #endif
+ 
+-#ifdef HAVE_A_OUT_H
+-#include <a.out.h>
+-#endif
+ #ifdef HAVE_MACH_O_NLIST_H
+ #include <mach-o/nlist.h>
+ #endif
++// Definitions from <stab.h> and <a.out.h> for systems which
++// do not have them
++#undef N_UNDF
++#define N_UNDF 0x0
++#define N_FUN 0x24
++#define N_SLINE 0x44
++#define N_SO 0x64
++#define N_LSYM 0x80
++#define N_BINCL 0x82
++#define N_SOL 0x84
+ 
+ #include <string>
+ #include <vector>
+diff --git a/src/common/stabs_reader_unittest.cc b/src/common/stabs_reader_unittest.cc
+index a84da1c..854ac42 100644
+--- a/src/common/stabs_reader_unittest.cc
++++ b/src/common/stabs_reader_unittest.cc
+@@ -33,7 +33,6 @@
+ 
+ #include <assert.h>
+ #include <errno.h>
+-#include <stab.h>
+ #include <stdarg.h>
+ #include <stdlib.h>
+ #include <string.h>
+-- 
+2.0.5
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0005-md2core-Replace-basename.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0005-md2core-Replace-basename.patch
new file mode 100644
index 000000000..852c1ed2c
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0005-md2core-Replace-basename.patch
@@ -0,0 +1,38 @@
+From bbf2b5ed5d93b227df8aea5726727b48e29f6790 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 14 Sep 2017 23:35:40 -0700
+Subject: [PATCH 5/5] md2core: Replace basename()
+
+musl does not provide it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/tools/linux/md2core/minidump-2-core.cc | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/tools/linux/md2core/minidump-2-core.cc b/src/tools/linux/md2core/minidump-2-core.cc
+index 6a9e28eb..52b81c22 100644
+--- a/src/tools/linux/md2core/minidump-2-core.cc
++++ b/src/tools/linux/md2core/minidump-2-core.cc
+@@ -107,6 +107,9 @@ struct Options {
+ 
+ static void
+ Usage(int argc, const char* argv[]) {
++  const char *c_filename = argv[0];;
++  const char *p = strrchr(c_filename, '/');
++  const char *base = p ? p+1 : c_filename;
+   fprintf(stderr,
+           "Usage: %s [options] <minidump file>\n"
+           "\n"
+@@ -133,7 +136,7 @@ Usage(int argc, const char* argv[]) {
+           "             lookups to be done in this directory rather than the filesystem\n"
+           "             layout as it exists in the crashing image.  This path should end\n"
+           "             with a slash if it's a directory.  e.g. /var/lib/breakpad/\n"
+-          "", basename(argv[0]));
++          "", base);
+ }
+ 
+ static void
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index a4f149143..f30c62008 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -17,22 +17,29 @@ PE = "1"
 
 PV = "1.0+git${SRCPV}"
 
-SRCREV_FORMAT = "breakpad_glog_gtest_protobuf_lss_gyp"
+SRCREV_FORMAT = "breakpad_gtest_protobuf_lss_gyp"
 
-SRCREV_breakpad = "66856d617b6658ce09ef2bc1b15d457ab7b152b0"
-SRCREV_glog = "d8cb47f77d1c31779f3ff890e1a5748483778d6a"
+SRCREV_breakpad = "dea867e76f24e4a68395684b9d1cf24bcef82f20"
 SRCREV_gtest = "ec44c6c1675c25b9827aacd08c02433cccde7780"
 SRCREV_protobuf = "cb6dd4ef5f82e41e06179dcd57d3b1d9246ad6ac"
 SRCREV_lss = "a91633d172407f6c83dd69af11510b37afebb7f9"
-SRCREV_gyp = "e8ab0833a42691cd2184bd4c45d779e43821d3e0"
+SRCREV_gyp = "324dd166b7c0b39d513026fa52d6280ac6d56770"
 
 SRC_URI = "git://github.com/google/breakpad;name=breakpad \
-           git://github.com/google/glog.git;destsuffix=git/src/third_party/glog;name=glog \
            git://github.com/google/googletest.git;destsuffix=git/src/testing/gtest;name=gtest \
            git://github.com/google/protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf \
            git://chromium.googlesource.com/linux-syscall-support;protocol=https;destsuffix=git/src/third_party/lss;name=lss \
            git://chromium.googlesource.com/external/gyp;protocol=https;destsuffix=git/src/tools/gyp;name=gyp \
            file://0001-Replace-use-of-struct-ucontext-with-ucontext_t.patch \
+           file://0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch \
+           file://0002-Avoid-using-basename.patch \
+           file://0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch \
+           file://0001-Turn-off-sign-compare-for-musl-libc.patch \
+           file://0002-sys-signal.h-is-a-nonportable-alias-for-signal.h.patch \
+           file://0003-Dont-include-stab.h.patch \
+           file://0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch \
+           file://0005-md2core-Replace-basename.patch \
+           file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
 "
 S = "${WORKDIR}/git"
 
-- 
2.14.1


