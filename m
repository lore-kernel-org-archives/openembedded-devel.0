Return-Path: <mike.looijmans@topic.nl>
Received: from smtp01.mail.online.nl (smtp01.mail.online.nl [194.134.25.71])
	by mail.openembedded.org (Postfix) with ESMTP id 02EE477038
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Apr 2016 08:22:18 +0000 (UTC)
Received: from localhost.localdomain (s55969068.adsl.online.nl
	[85.150.144.104])
	by smtp01.mail.online.nl (Postfix) with ESMTP id 1FF6B40008;
	Sat,  2 Apr 2016 10:22:14 +0200 (CEST)
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Apr 2016 10:22:11 +0200
Message-Id: <1459585331-22707-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] waf-cross-answers: Fix faulty link cross-answers-mipsel.txt
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
X-List-Received-Date: Sat, 02 Apr 2016 08:22:20 -0000

Apparently something was wrong in the patch "waf-cross-answers:
Add cross-answers-mipsel.txt". and it created a dead symlink.
Solve it by just copying the cross-answers-mips.txt instead of
linking it.

Fixes: 0898fb01ccea229cb0c64796b62f20a7c596ac0b

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 .../waf-cross-answers/cross-answers-mipsel.txt     | 40 +++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)
 mode change 120000 => 100644 meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt

diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
deleted file mode 120000
index 59b4337..0000000
--- a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
+++ /dev/null
@@ -1 +0,0 @@
-cross-answers-mips.txt
diff --git a/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
new file mode 100644
index 0000000..18bfa02
--- /dev/null
+++ b/meta-networking/files/waf-cross-answers/cross-answers-mipsel.txt
@@ -0,0 +1,39 @@
+Checking uname sysname type: "Linux"
+Checking uname version type: "# Wed May 20 10:34:39 UTC 2015"
+Checking simple C program: "hello world"
+rpath library support: OK
+-Wl,--version-script support: OK
+Checking getconf LFS_CFLAGS: NO
+Checking correct behavior of strtoll: NO
+Checking for working strptime: OK
+Checking for C99 vsnprintf: "1"
+Checking for HAVE_SHARED_MMAP: OK
+Checking for HAVE_MREMAP: OK
+Checking for HAVE_SECURE_MKSTEMP: OK
+Checking for HAVE_IFACE_GETIFADDRS: NO
+Checking for HAVE_IFACE_IFCONF: NO
+Checking for HAVE_IFACE_IFREQ: NO
+Checking for large file support without additional flags: NO
+Checking for -D_FILE_OFFSET_BITS=64: OK
+Checking for HAVE_INCOHERENT_MMAP: NO
+Checking value of NSIG: "128"
+Checking value of _NSIG: "128"
+Checking value of SIGRTMAX: "127"
+Checking value of SIGRTMIN: "34"
+Checking whether the WRFILE -keytab is supported: OK
+Checking for kernel change notify support: OK
+Checking for Linux kernel oplocks: OK
+Checking for kernel share modes: OK
+Checking whether POSIX capabilities are available: OK
+Checking if can we convert from CP850 to UCS-2LE: OK
+Checking if can we convert from UTF-8 to UCS-2LE: OK
+vfs_fileid checking for statfs() and struct statfs.f_fsid: OK
+Checking whether we can use Linux thread-specific credentials: OK
+Checking whether fcntl locking is available: OK
+Checking for the maximum value of the 'time_t' type: NO
+Checking whether the realpath function allows a NULL argument: OK
+Checking for ftruncate extend: OK
+getcwd takes a NULL argument: OK
+Checking for small off_t: NO
+Checking whether blkcnt_t is 32 bit: NO
+Checking whether blkcnt_t is 64 bit: OK
-- 
2.1.4


