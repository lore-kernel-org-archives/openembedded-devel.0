Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1B53374700
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 07:29:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41511347"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jun 2018 15:29:55 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id DE01F4B41EE0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 15:29:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 26 Jun 2018 15:29:54 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 16 Jun 2018 10:07:34 -0700
Message-ID: <1529168854-6402-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.27]
X-yoursite-MailScanner-ID: DE01F4B41EE0.A0A9D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] waf-cross-answers: Added file for arm bigendian which for aarch64BE multilib.
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
X-List-Received-Date: Tue, 26 Jun 2018 07:29:55 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../waf-cross-answers/cross-answers-armeb.txt      | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-networking/files/waf-cross-answers/cross-answers-armeb.txt

diff --git a/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
new file mode 100644
index 0000000..a5cd998
--- /dev/null
+++ b/meta-networking/files/waf-cross-answers/cross-answers-armeb.txt
@@ -0,0 +1,40 @@
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
+Checking value of NSIG: "65"
+Checking value of _NSIG: "65"
+Checking value of SIGRTMAX: "64"
+Checking value of SIGRTMIN: "34"
+Checking whether the WRFILE -keytab is supported: OK
+Checking for kernel change notify support: OK
+Checking for Linux kernel oplocks: OK
+Checking for kernel share modes: OK
+Checking whether POSIX capabilities are available: OK
+Checking if can we convert from CP850 to UCS-2LE: OK
+Checking if can we convert from UTF-8 to UCS-2LE: OK
+vfs_fileid checking for statfs() and struct statfs.f_fsid: OK
+Checking whether we can use Linux thread-specific credentials with 32-bit system calls: OK
+Checking whether fcntl locking is available: OK
+Checking for the maximum value of the 'time_t' type: NO
+Checking whether the realpath function allows a NULL argument: OK
+Checking for ftruncate extend: OK
+getcwd takes a NULL argument: OK
+Checking for small off_t: NO
+Checking whether blkcnt_t is 32 bit: NO
+Checking whether blkcnt_t is 64 bit: OK
+Checking whether fcntl lock supports open file description locks: OK
-- 
1.9.1




