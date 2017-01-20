Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0CF71E12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 08:24:53 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id 189so20887984pfu.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 00:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zU0BFKpxDdt9It1WE9SA/2tsoyR95XktVQ5bP7ZlscI=;
	b=mlXS78YD2hPTYs1sxT1mzsBf90BrNrD50SIcSS/QYo/XU3Hy68corPmjpouMeO9b3g
	23r6uq2T95TesYdwoyuZ+2S4PPN4nl9MyqZ5K9TvLurXwQRPxtx/FNSNgY0sdhpxRzEc
	oIxUQEDBPN2TFCwZrlBRUBXMOZXK1nqFTjv9ZrHGa9UnJblObm+TAyDuYbuycWBxsB3L
	PDTMtZdhSJmdIZdOhQ2Tz88u3DXoRny7/GSE2oieAgtPo0dsFvYGwzpcNnOCtv1e2wUJ
	Y47WtrJV3GvvYeTt5kA29UlfVN8pmZWvx1uRJgdlH6RA/o+xPKzzvJSu2/LiEbuXYtzF
	fJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zU0BFKpxDdt9It1WE9SA/2tsoyR95XktVQ5bP7ZlscI=;
	b=d1F2v2Nu77OpEQHsJgr0hGplHMxWAdbs3s2x7/LQ+IQdsjIu+NRG7W6YSMQsyMXjyT
	GeruSa+gj1TtEo+woU4oE5c8iVhRG7OECKcbYpLOK5R18nyhsFwBeTehYEL93H0WWDc0
	tzVC91XRspwjh/GUqy7QefFBIYHPXDC0Bnqi9uvVUnRX0p+rub6GGv7OJYU4q/WWbkz/
	1K29NetvE61obz3fbrFNCU78jRCTFaX1nkjAOMyR8E1024yLsZ5Ax2qP1v5nF2tystY1
	ZMiweHZNnxc4j9DjAKbXOrcI5D//70/gcVQa2RrXVGnW2MLdJ02loEROc0xgY4q0R747
	wlJQ==
X-Gm-Message-State: AIkVDXKBI/P7M2ZwbwGyeLvpia9rLjYFl9NLoESINK/uSXZapUiUeSwGuhLQ4ky2AcJumYmj
X-Received: by 10.99.145.68 with SMTP id l65mr15578728pge.12.1484900693963;
	Fri, 20 Jan 2017 00:24:53 -0800 (PST)
Received: from jkrishnanjanappa-VPCEB26FG.mvista.com
	([2405:204:5007:e8ac:71f6:873f:d195:7323])
	by smtp.gmail.com with ESMTPSA id
	m14sm14543283pgn.19.2017.01.20.00.24.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 00:24:53 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jan 2017 13:54:36 +0530
Message-Id: <1484900677-11893-2-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484900677-11893-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1484900677-11893-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [meta-networking][PATCH 2/3] iscsitarget: use upstream to build with linux kernel >= 4.3
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
X-List-Received-Date: Fri, 20 Jan 2017 08:24:54 -0000

1. The original patch is at
   http://launchpadlibrarian.net/227478885/iscsitarget_1.4.20.3+svn502-2ubuntu2_1.4.20.3+svn502-2ubuntu3.diff.gz,
   those changes were taken using #ifs to allow compilation of iscsitarget
   package with kernel versions < 4.3.

2. It helps to maintain the patches in future, when iscsitarget is updated.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 ...pdated_bio_struct_of_linux_v4.3_and_above.patch | 123 +++++++++++++--------
 1 file changed, 78 insertions(+), 45 deletions(-)

diff --git a/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_bio_struct_of_linux_v4.3_and_above.patch b/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_bio_struct_of_linux_v4.3_and_above.patch
index 0e8b792..bce38ba 100644
--- a/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_bio_struct_of_linux_v4.3_and_above.patch
+++ b/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_bio_struct_of_linux_v4.3_and_above.patch
@@ -1,75 +1,108 @@
-1. test_bit was used to return true boolean value, if
-   BIO_UPTODATE bit of bio->bi_flags is set. But the same
-   job can be done by checking bio->bi_error, implemented in
-   linux kernel 4.3 and above. If bio->bi_error is set, then 
-   it denotes error.
+Description: Fix source to compile with 4.3+ kernels
+  commit 4246a0b63bd8f56a1469b12eafeb875b1041a451
+    block: add a bi_error field to struct bio
+  -> Removes BIO_UPTODATE and error argument to bio_endio.
+  commit b54ffb73cadcdcff9cc1ae0e11f502407e3e2e4c
+    block: remove bio_get_nr_vecs()
+  -> Removed that call (always use BIO_MAX_PAGES)
+  commit 676d23690fb62b5d51ba5d659935e9f7d9da9f8e
+    net: Fix use after free by removing length arg from sk_data_ready callbacks.
+  -> Removes len argument from sk_data_ready() callback.
+Author: Stefan Bader <stefan.bader@canonical.com>
 
-Ref: https://github.com/torvalds/linux/commit/4246a0b63bd8f56a1469b12eafeb875b1041a451
+The original patch is at http://launchpadlibrarian.net/227478885/iscsitarget_1.4.20.3+svn502-2ubuntu2_1.4.20.3+svn502-2ubuntu3.diff.gz,
+those changes were taken using #ifs to allow compilation of iscsitarget 
+package with kernel versions < 4.3.
 
-It solves below build error:
--- snip --
-iscsitarget-1.4.20.3+svn502/kernel/block-io.c:40:19: error: 'BIO_UPTODATE' undeclared (first use in this function)
-   error = test_bit(BIO_UPTODATE, &bio->bi_flags) ? error : -EIO;
--- CUT --
-
-2. bio can always be filled to a maximum value of BIO_MAX_PAGES, 
-   so no need to check for min value for linux kernel 4.3 and above.
-
-Ref: https://github.com/torvalds/linux/commit/b54ffb73cadcdcff9cc1ae0e11f502407e3e2e4c
-
-It solves below build error:
--- snip --
-iscsitarget-1.4.20.3+svn502/kernel/block-io.c:80:15: error: implicit declaration of function 'bio_get_nr_vecs' [-Werror=implicit-function-declaration]
-    max_pages = bio_get_nr_vecs(bio_data->bdev);
--- CUT --
-
-Upstream-Status: Pending
+Upstream-Status: Submitted [http://launchpadlibrarian.net/227478885/iscsitarget_1.4.20.3+svn502-2ubuntu2_1.4.20.3+svn502-2ubuntu3.diff.gz]
 
 Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
 
 diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c iscsitarget-1.4.20.3+svn502/kernel/block-io.c
---- iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c	2016-04-01 09:07:12.891810059 +0530
-+++ iscsitarget-1.4.20.3+svn502/kernel/block-io.c	2016-04-01 09:15:59.076469313 +0530
-@@ -33,7 +33,11 @@ static void blockio_bio_endio(struct bio
+--- iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c	2014-05-06 13:59:55.000000000 -0700
++++ iscsitarget-1.4.20.3+svn502/kernel/block-io.c	2017-01-19 00:46:28.263951115 -0800
+@@ -29,14 +29,23 @@ struct tio_work {
+ 	struct completion tio_complete;
+ };
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
++static void blockio_bio_endio(struct bio *bio)
++#else
+ static void blockio_bio_endio(struct bio *bio, int error)
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */
  {
  	struct tio_work *tio_work = bio->bi_private;
  
 +#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
-+	error = bio->bi_error ? -EIO : error;
++	if (bio->bi_error)
++		atomic_set(&tio_work->error, bio->bi_error);
 +#else
  	error = test_bit(BIO_UPTODATE, &bio->bi_flags) ? error : -EIO;
-+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */	
  
  	if (error)
  		atomic_set(&tio_work->error, error);
-@@ -61,6 +65,10 @@ blockio_make_request(struct iet_volume *
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */
+ 
+ 	/* If last bio signal completion */
+ 	if (atomic_dec_and_test(&tio_work->bios_remaining))
+@@ -61,14 +70,20 @@ blockio_make_request(struct iet_volume *
  	u32 size = tio->size;
  	u32 tio_index = 0;
  
 +#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
-+	int err = 0;
-+	loff_t ppos = tio->offset;	
-+#else	
++	int max_pages = bdev_q ? BIO_MAX_PAGES : 1;
++#else
  	int max_pages = 1;
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */
  	int err = 0;
  
-@@ -69,6 +77,7 @@ blockio_make_request(struct iet_volume *
+ 	loff_t ppos = tio->offset;
+ 
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 3, 0)
  	/* Calculate max_pages for bio_alloc (memory saver) */
  	if (bdev_q)
  		max_pages = bio_get_nr_vecs(bio_data->bdev);
-+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */
++#endif /* LINUX_VERSION_CODE < KERNEL_VERSION(4, 3, 0) */
  
  	tio_work = kzalloc(sizeof (*tio_work), GFP_KERNEL);
  	if (!tio_work)
-@@ -80,7 +89,11 @@ blockio_make_request(struct iet_volume *
+diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/conn.c iscsitarget-1.4.20.3+svn502/kernel/conn.c
+--- iscsitarget-1.4.20.3+svn502_org/kernel/conn.c	2017-01-19 00:39:09.737117778 -0800
++++ iscsitarget-1.4.20.3+svn502/kernel/conn.c	2017-01-19 00:52:30.037223901 -0800
+@@ -89,13 +89,21 @@ static void iet_state_change(struct sock
+ 	target->nthread_info.old_state_change(sk);
+ }
  
- 	/* Main processing loop, allocate and fill all bios */
- 	while (size && tio_index < tio->pg_cnt) {
 +#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
-+		bio = bio_alloc(GFP_KERNEL, BIO_MAX_PAGES);
-+#else    		
- 		bio = bio_alloc(GFP_KERNEL, min(max_pages, BIO_MAX_PAGES));
-+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */		
- 		if (!bio) {
- 			err = -ENOMEM;
- 			goto out;
++static void iet_data_ready(struct sock *sk)
++#else
+ static void iet_data_ready(struct sock *sk, int len)
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */
+ {
+ 	struct iscsi_conn *conn = sk->sk_user_data;
+ 	struct iscsi_target *target = conn->session->target;
+ 
+ 	nthread_wakeup(target);
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
++	target->nthread_info.old_data_ready(sk);
++#else
+ 	target->nthread_info.old_data_ready(sk, len);
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */
+ }
+ 
+ /*
+diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h iscsitarget-1.4.20.3+svn502/kernel/iscsi.h
+--- iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h	2014-05-06 13:59:55.000000000 -0700
++++ iscsitarget-1.4.20.3+svn502/kernel/iscsi.h	2017-01-19 00:48:02.102837260 -0800
+@@ -81,7 +81,11 @@ struct network_thread_info {
+ 	spinlock_t nthread_lock;
+ 
+ 	void (*old_state_change)(struct sock *);
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
++	void (*old_data_ready)(struct sock *);
++#else
+ 	void (*old_data_ready)(struct sock *, int);
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */
+ 	void (*old_write_space)(struct sock *);
+ };
+ 
-- 
2.7.4


