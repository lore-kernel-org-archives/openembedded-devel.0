Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1US5FY-0008Ad-DU
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 14:44:45 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id F0313D2284
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 14:26:32 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 14:27:07 +0200
Message-Id: <1366115227-3072-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] v4l-utils: make it build for AArch64
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
X-List-Received-Date: Tue, 16 Apr 2013 12:44:57 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../recipes-multimedia/v4l2apps/files/openat.patch | 38 ++++++++++++++++++++++
 .../recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/files/openat.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/files/openat.patch b/meta-oe/recipes-multimedia/v4l2apps/files/openat.patch
new file mode 100644
index 0000000..6cbd528
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/files/openat.patch
@@ -0,0 +1,38 @@
+From ac8eb4d8e1c16b907e795da123a032869c77c56f Mon Sep 17 00:00:00 2001
+From: Riku Voipio <riku.voipio@linaro.org>
+Date: Tue, 22 Jan 2013 12:44:48 +0200
+Subject: [PATCH] libv4lsyscall-priv.h: use openat when available
+
+New architectures such as 64-Bit arm build kernels without legacy
+system calls - Such as the the no-at system calls. Thus, use
+SYS_openat whenever it is available.
+
+Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
+Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
+
+Upstream-status: backport
+---
+ lib/libv4lconvert/libv4lsyscall-priv.h |    5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/libv4lconvert/libv4lsyscall-priv.h b/lib/libv4lconvert/libv4lsyscall-priv.h
+index 2dac49a..cdd38bc 100644
+--- a/lib/libv4lconvert/libv4lsyscall-priv.h
++++ b/lib/libv4lconvert/libv4lsyscall-priv.h
+@@ -72,8 +72,13 @@ typedef off_t __off_t;
+ 
+ #ifndef CONFIG_SYS_WRAPPER
+ 
++#ifdef SYS_openat
++#define SYS_OPEN(file, oflag, mode) \
++	syscall(SYS_openat, AT_FDCWD, (const char *)(file), (int)(oflag), (mode_t)(mode))
++#else
+ #define SYS_OPEN(file, oflag, mode) \
+ 	syscall(SYS_open, (const char *)(file), (int)(oflag), (mode_t)(mode))
++#endif
+ #define SYS_CLOSE(fd) \
+ 	syscall(SYS_close, (int)(fd))
+ #define SYS_IOCTL(fd, cmd, arg) \
+-- 
+1.7.10.4
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
index 91a4ab8..c00f119 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
@@ -13,6 +13,7 @@ inherit autotools gettext
 PROVIDES = "libv4l"
 
 SRC_URI = "git://linuxtv.org/v4l-utils.git;protocol=git \
+           file://openat.patch \
 "
 # 54f16ca8183dd8ae8bf4ccc07949795aff0301f5 -> v0.8.8 tag
 SRCREV = "0298efdcd1153b8f719b9164548a3f0546f0cb7c"
-- 
1.8.1.2



