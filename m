Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id A278875524
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:58:53 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id a2so3719595pff.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+qzOTGtw71Hc8LeVSR0yC90zgWMeJQqpuKyqGO+MIRQ=;
	b=ZNdREKJaKD4fYnPZVpTdvZUoSc0Ljv6sYM7bWS9JTWWar80aLJ4IyLNgkENqDLyYsQ
	lvihk9ycRFzdoR/VpJ8HA+qe0VCHHM1bPFc5BlatmSU7ROSxd6CrNptDIKaXLhA3hgqP
	B/hMfNRptQ6gB2JGhH4pB4Mp/B6rsae4oD9OC30D5d6emQXw/qP714BFKPnghnvhGQgZ
	XvoO/UYZKH7Xahel5n7kNwCd6CkfJY4gWvDEFhzghoExTDNG3mWbj7slh1LvgsF6SsM5
	SxWNshzRKgZ7nRdJ2xmu3W+Zpl37Q+SNs/mBd06XJNIt3WIbHhtxWQZdRIyxDRWfEMAB
	c5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+qzOTGtw71Hc8LeVSR0yC90zgWMeJQqpuKyqGO+MIRQ=;
	b=fT15DV5VA70QAZF6+TSRdRkYRz2DaYdN9lmyMzkhQMr+/S6G8Ro2Ls5EBOUp+K9pi1
	CXKZGUKZKqUqzw6nO2HJWLza6bjdMU5m6UEjlkSCNo0WnLIrTgYzi5ISeGMfP+9ZoQ9+
	DFWmwHI3fHtmfGF6M31gi8mLDJesSx1j14LJL8J94b9YShLn22ju67HFgFDgcgrjaxTz
	iiEklXJB9AIMzXpcwFR2PedJyGHyrThfOP7i9Vr3+50wLQXp2Qs/+3xsijA7Bn8ES2ji
	iY2mI6d6YX6YshRXI7sR8/SzwllcAtIkQmZYsBAcXpjrkhFxep4u0nbw2j/6CaQMUH26
	3xbA==
X-Gm-Message-State: AElRT7EfVUR1hJHx4LLfOZTaEofHb4gRjV+5aUN/py7Y1r+dhtICpdA0
	yVOlwdrNzkI+dw8RTO8xK1g=
X-Google-Smtp-Source: AIpwx48OPcL0CQ20nPdh/+Ml/gxddQZMks9/whjMxffqaCO7RIAaJgULf5ohw2lUlV9C9EJnNYHevA==
X-Received: by 10.101.100.212 with SMTP id t20mr22474341pgv.112.1523170734745; 
	Sat, 07 Apr 2018 23:58:54 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.58.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:58:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:15 -0700
Message-Id: <1523170729-26321-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 03/37] stress-ng: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:58:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
patching file stress-fcntl.c
Hunk #1 succeeded at 415 with fuzz 2 (offset 2 lines).

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-Several-changes-to-fix-musl-build.patch   | 24 ++++++++++------------
 .../0002-stress-fcntl-fix-build-for-musl.patch     | 14 ++++++-------
 2 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
index f90e704..d604f86 100644
--- a/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
+++ b/meta-oe/recipes-test/stress-ng/stress-ng/0001-Several-changes-to-fix-musl-build.patch
@@ -1,4 +1,4 @@
-From d50203b233cb8820bf83b6651c2a8487e0db1fcf Mon Sep 17 00:00:00 2001
+From 784dcd09d3f266e271d007f4fd257e85036872ca Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
 Date: Tue, 17 Oct 2017 10:13:20 -0500
 Subject: [PATCH] Several changes to fix musl build
@@ -21,6 +21,7 @@ Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
 Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
 
 Upstream-status: Pending
+
 ---
  cache.c            |  4 ++++
  stress-madvise.c   |  1 +
@@ -28,13 +29,13 @@ Upstream-status: Pending
  stress-pty.c       | 18 ------------------
  stress-resources.c |  1 -
  stress-stackmmap.c |  2 +-
- 8 files changed, 9 insertions(+), 23 deletions(-)
+ 6 files changed, 7 insertions(+), 21 deletions(-)
 
 diff --git a/cache.c b/cache.c
-index e01fad0..27870ee 100644
+index fbf7674..936c1ff 100644
 --- a/cache.c
 +++ b/cache.c
-@@ -27,6 +27,10 @@ typedef struct {
+@@ -28,6 +28,10 @@ typedef struct {
  
  #include <glob.h>
  
@@ -46,10 +47,10 @@ index e01fad0..27870ee 100644
  #define SYS_CPU_PREFIX               "/sys/devices/system/cpu"
  #define GLOB_PATTERN SYS_CPU_PREFIX  "/cpu[0-9]*"
 diff --git a/stress-madvise.c b/stress-madvise.c
-index 43ea454..2e1f8ee 100644
+index 9e71e11..ddf8d2d 100644
 --- a/stress-madvise.c
 +++ b/stress-madvise.c
-@@ -141,6 +141,7 @@ static int stress_random_advise(const args_t *args)
+@@ -147,6 +147,7 @@ static int stress_random_advise(const args_t *args)
  #if defined(MADV_SOFT_OFFLINE)
  	if (advise == MADV_SOFT_OFFLINE) {
  		static int soft_offline_count;
@@ -58,7 +59,7 @@ index 43ea454..2e1f8ee 100644
  		/* ..and minimize number of soft offline pages */
  		if ((soft_offline_count >= NUM_SOFT_OFFLINE_MAX) ||
 diff --git a/stress-malloc.c b/stress-malloc.c
-index 8dbe5cc..f505f32 100644
+index a46b8c6..427827a 100644
 --- a/stress-malloc.c
 +++ b/stress-malloc.c
 @@ -99,7 +99,7 @@ int stress_malloc(const args_t *args)
@@ -71,7 +72,7 @@ index 8dbe5cc..f505f32 100644
  		(void)mallopt(M_MMAP_THRESHOLD, (int)malloc_threshold);
  #endif
 diff --git a/stress-pty.c b/stress-pty.c
-index 8c3edf8..518f118 100644
+index 1bd1fbd..b1fe573 100644
 --- a/stress-pty.c
 +++ b/stress-pty.c
 @@ -26,7 +26,6 @@
@@ -114,7 +115,7 @@ index 8c3edf8..518f118 100644
  			if (ioctl(ptys[i].slave, TIOCGLCKTRMIOS, &ios) < 0)
  				pr_fail_err("ioctl TIOCGLCKTRMIOS on slave pty");
 diff --git a/stress-resources.c b/stress-resources.c
-index 182e176..880433d 100644
+index 958c99a..af79abd 100644
 --- a/stress-resources.c
 +++ b/stress-resources.c
 @@ -31,7 +31,6 @@
@@ -126,7 +127,7 @@ index 182e176..880433d 100644
  #endif
  #if defined(HAVE_LIB_PTHREAD) && defined(__linux__)
 diff --git a/stress-stackmmap.c b/stress-stackmmap.c
-index e1378e2..00d1268 100644
+index 9c83a69..2984f09 100644
 --- a/stress-stackmmap.c
 +++ b/stress-stackmmap.c
 @@ -24,7 +24,7 @@
@@ -138,6 +139,3 @@ index e1378e2..00d1268 100644
  
  #include <ucontext.h>
  
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-for-musl.patch b/meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-for-musl.patch
index 8263401..ed3287e 100644
--- a/meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-for-musl.patch
+++ b/meta-oe/recipes-test/stress-ng/stress-ng/0002-stress-fcntl-fix-build-for-musl.patch
@@ -1,4 +1,4 @@
-From 7be4680930e2867cefd5c8fe27a4ae81a4ae2628 Mon Sep 17 00:00:00 2001
+From faadbc147394cea9278bc2494f33e3521d88e742 Mon Sep 17 00:00:00 2001
 From: Tim Orling <timothy.t.orling@linux.intel.com>
 Date: Tue, 9 Jan 2018 18:38:45 -0800
 Subject: [PATCH] stress-fcntl: fix build for musl
@@ -6,22 +6,20 @@ Subject: [PATCH] stress-fcntl: fix build for musl
 Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
 
 Upstream-status: Pending
+
 ---
  stress-fcntl.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/stress-fcntl.c b/stress-fcntl.c
-index b7eade2..9fa5c38 100644
+index 2ea867b..e91b345 100644
 --- a/stress-fcntl.c
 +++ b/stress-fcntl.c
-@@ -413,6 +413,7 @@ ofd_lock_abort:	{ /* Nowt */ }
- 
- #if defined(F_GET_FILE_RW_HINT) && defined(F_SET_FILE_RW_HINT)
+@@ -415,6 +415,7 @@ ofd_lock_abort:	{ /* Nowt */ }
+ #if (defined(F_GET_FILE_RW_HINT) && defined(F_SET_FILE_RW_HINT)) | \
+     (defined(F_GET_RW_HINT) && defined(F_SET_RW_HINT))
  	{
 +		int ret;
  		size_t i;
  		unsigned long hint;
  		static const unsigned long hints[] = {
--- 
-2.14.3
-
-- 
2.7.4


