Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1675377BDF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:01 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 81so18579617pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qsb0dxpM6K+bBpr9Hn8CF6o1BbIokOXWUpq5nTw2J7I=;
	b=B1f37h9+peUOztn7eZnal6H+qevWl7dAhV2JLG4c941QB6FaKWb6w8+YCiGGazuR5r
	IxhLzAITBXZ2CT2yhFE4lxrAztv81VVC93PetQ1X3BQhQaTWYu7rEgiuqykIqyE6Vy6R
	Q7gw7RKTNo5Y/ssNzvltA++k6ZvTNpohv3qNCIKJ1yfe5tZCq8NddTk4vWBIiMQ/iA8U
	xGszbHxghy/CmMx4CB2Tr+a8vCISVQrcSOLPRDUmdGchQFtbEiJL8iNAtyhCXPl87Jg7
	q70U+4X7DS4+0bS1Ps6dTmwjsOLHkDoR3AERiQA8C+LduHeKkRnsV+i2CKegpfSz0mzW
	bMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qsb0dxpM6K+bBpr9Hn8CF6o1BbIokOXWUpq5nTw2J7I=;
	b=alN2Kxs88FmEh9Ru43u9xAi6rd9e0Wfwfe6AVMHXGjzedzerKHdUBBWA+UvnpPkfbS
	31x8u6nywkv5tT/mpGFiso50nTPB5T3s5NApC2xnJCleIa1VjpTwWpJLkvdG9EICty6o
	FK2Fx3ROrj0kD++p3PMnbWlE5O87rBokKnrljX+dZXB2+4FUrPrB3+bAwZDxNASAPCEP
	lig7OAune/aK5x5tGKSES3mWjuETyj3CUfnQokRv9Pm9NGyriuXqt+VRyTZhkunizogQ
	QqNhJ0gC/diGLX41fuHxhp5J+zAN7AEL//K4W0jiPOcnB/xeV1I8lXVitx1dDFTZJmRN
	slPg==
X-Gm-Message-State: AFeK/H2OnKd63V7eiE1NLsaUbIBiRHpuP7Neflppuo+PYGGswsUF2I6g71I6wq644QhrGw==
X-Received: by 10.99.185.91 with SMTP id v27mr4162307pgo.65.1490978583046;
	Fri, 31 Mar 2017 09:43:03 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:10 -0700
Message-Id: <20170331164247.5052-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/43] lvm2: Fix patch errors found with musl
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:02 -0000

The patches had syntax errors which are only
visible when using musl libs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lvm2/0001-implement-libc-specific-reopen_stream.patch  | 14 +++++++-------
 .../lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch   | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reopen_stream.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reopen_stream.patch
index f09fd76b3..b6a7f1a92 100644
--- a/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reopen_stream.patch
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-implement-libc-specific-reopen_stream.patch
@@ -1,7 +1,7 @@
-From ede7976da9431573b0104dbcfe91a32c02dbea13 Mon Sep 17 00:00:00 2001
+From e3103459416616d3b8508e7176e897b0ae6c90f2 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Tue, 25 Oct 2016 11:49:40 +0000
-Subject: [PATCH 1/4] implement libc specific reopen_stream
+Subject: [PATCH] implement libc specific reopen_stream
 
 musl defines stdin/stdio/stderr as constant types which means
 we can not assign to them as we are doing here but works ok with glibc
@@ -13,15 +13,15 @@ http://git.alpinelinux.org/cgit/aports/tree/main/lvm2/fix-stdio-usage.patch
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
-Upstream-Status: Pending
+
+%% original patch: 0001-implement-libc-specific-reopen_stream.patch
 ---
  lib/log/log.c      | 6 ++++++
  tools/lvmcmdline.c | 6 +++---
  2 files changed, 9 insertions(+), 3 deletions(-)
 
 diff --git a/lib/log/log.c b/lib/log/log.c
-index c933154..638839d 100644
+index c933154..3581084 100644
 --- a/lib/log/log.c
 +++ b/lib/log/log.c
 @@ -161,6 +161,7 @@ static void _check_and_replace_standard_log_streams(FILE *old_stream, FILE *new_
@@ -38,7 +38,7 @@ index c933154..638839d 100644
  }
 +#else
 +{
-+	return (freopen(NULL, mode, *stream) != NULL)
++	return (freopen(NULL, mode, *stream) != NULL);
 +}
 +#endif
  
@@ -76,5 +76,5 @@ index 9a4deb7..f1f18e6 100644
  		       strerror(errno));
  		return 0;
 -- 
-2.9.3
+2.12.0
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch b/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
index 5baafab3e..ef385099f 100644
--- a/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
+++ b/meta-oe/recipes-support/lvm2/lvm2/0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
@@ -1,20 +1,20 @@
-From 8706a6d33753d8b2cf5bb2a12bd6880b371ce337 Mon Sep 17 00:00:00 2001
+From 3ae9c0b607ec33fb07f32a41e9d28cc9068dd39a Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Tue, 25 Oct 2016 11:52:44 +0000
-Subject: [PATCH 2/4] Guard use of mallinfo() with __GLIBC__
+Subject: [PATCH] Guard use of mallinfo() with __GLIBC__
 
 This API is glibc-only
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
-Upstream-Status: Pending
+
+%% original patch: 0002-Guard-use-of-mallinfo-with-__GLIBC__.patch
 ---
  lib/mm/memlock.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/mm/memlock.c b/lib/mm/memlock.c
-index da90144..c1bf8fb 100644
+index da90144..f34f890 100644
 --- a/lib/mm/memlock.c
 +++ b/lib/mm/memlock.c
 @@ -150,7 +150,7 @@ static void _touch_memory(void *mem, size_t size)
@@ -22,10 +22,10 @@ index da90144..c1bf8fb 100644
  static void _allocate_memory(void)
  {
 -#ifndef VALGRIND_POOL
-+#ifndef VALGRIND_POOL && defined(__GLIBC__)
++#if !defined(VALGRIND_POOL) && defined(__GLIBC__)
  	void *stack_mem;
  	struct rlimit limit;
  	int i, area = 0, missing = _size_malloc_tmp, max_areas = 32, hblks;
 -- 
-2.9.3
+2.12.0
 
-- 
2.12.1


