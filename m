Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id E9B8B71E1A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 08:25:00 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id 14so21913828pgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 00:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6GqGhH8sFzdq112K5UA4h1twSpGYok3bAeaTTl9GoC8=;
	b=KslnUiyXZje7PEdqSv1pHAUZTEwZnLFKypNHEV6Xc8VXH1DpE5g3tsj4nZQdpOdDhk
	0oiS7czVM6ijxRMdH7zIAo1MM1jF/HZ3rxpLE4qzCCbLKLQ7OMSmdLDgBt9JK5g2tyjD
	DLWTTdFvwHw4007Np3dSDWmy5FNqMpSeJoZDOvxsRgi56zh4x+RTrjZWY882d1eEVe2N
	P7DM0WrLWhtdxOqPzjsYKPFZAlbfXNPk9nUi3vMRwGLEZYHAHQuKo6+M6/jnoXfZaxFe
	SVMGHrpJcPh7OfLS95kQfq+oPCftGtjgPrAzyeW9p2zcqVLAMjGlCFIlvlfaMbe4poIY
	46uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6GqGhH8sFzdq112K5UA4h1twSpGYok3bAeaTTl9GoC8=;
	b=eYxRTR95+EN5K5Lqk/6X0FsSYcTFc8gDigUbLsKleyrKJLbumdgOIi6vnLJ5U1MOhv
	LVVDHpi40XHJB/6cchOsA91SLxMmH6XBAslLoNtvxMDkuwoYGoNaxVDnGyRmLELYOn5Y
	U++uYQ7zzbYQG6t/CFZYge5yCWIAuA8dZJR4kkkoqvPMXI1/yJ2cwqgIfrGXNdyFvzfn
	p85XLxDkZ8P2ni62TSOdZUonfqSucEewc0ivrlih1BQp3N2w6NVNX0wCNR48G6ljrrNP
	ju4LiXrUExluK6M9pJYSI67PlyuQVb7k82eupvuusBfaLdfQAFPbC+hCLZavERnYZv4O
	IViA==
X-Gm-Message-State: AIkVDXI8pKEalnjgwym9yT9EyU4IR4vYPSIStQfFYaPrJ3QhlBvgQewYywasv+KZ5PeIifUv
X-Received: by 10.84.236.4 with SMTP id q4mr19818479plk.110.1484900700152;
	Fri, 20 Jan 2017 00:25:00 -0800 (PST)
Received: from jkrishnanjanappa-VPCEB26FG.mvista.com
	([2405:204:5007:e8ac:71f6:873f:d195:7323])
	by smtp.gmail.com with ESMTPSA id
	m14sm14543283pgn.19.2017.01.20.00.24.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 00:24:59 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jan 2017 13:54:37 +0530
Message-Id: <1484900677-11893-3-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484900677-11893-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1484900677-11893-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [meta-networking][PATCH 3/3] iscsitarget: update patch to contain changes required to build with only linux v4.8 and above
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
X-List-Received-Date: Fri, 20 Jan 2017 08:25:01 -0000

1. Removes lines related "LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)",
   as they are included in recent
   build_with_updated_bio_struct_of_linux_v4.3_and_above.patch.

2. Updated incorrect "#if 0//LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)" line.

3. Updated patch to have in compliance with recent
   build_with_updated_bio_struct_of_linux_v4.3_and_above.patch.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 ...pdated_interfaces_of_linux_v4.8_and_above.patch | 96 ++++++----------------
 1 file changed, 23 insertions(+), 73 deletions(-)

diff --git a/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_interfaces_of_linux_v4.8_and_above.patch b/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_interfaces_of_linux_v4.8_and_above.patch
index e55c407..e508a5e 100644
--- a/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_interfaces_of_linux_v4.8_and_above.patch
+++ b/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_interfaces_of_linux_v4.8_and_above.patch
@@ -90,25 +90,9 @@ Upstream-Status: Pending
 Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
 
 diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c iscsitarget-1.4.20.3+svn502/kernel/block-io.c
---- iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c	2016-09-25 19:45:01.814641016 +0530
-+++ iscsitarget-1.4.20.3+svn502/kernel/block-io.c	2016-09-25 19:47:59.666474094 +0530
-@@ -57,7 +57,6 @@ static int
- blockio_make_request(struct iet_volume *volume, struct tio *tio, int rw)
- {
- 	struct blockio_data *bio_data = volume->private;
--	struct request_queue *bdev_q = bdev_get_queue(bio_data->bdev);
- 	struct tio_work *tio_work;
- 	struct bio *tio_bio = NULL, *bio = NULL, *biotail = NULL;
- 	struct blk_plug plug;
-@@ -69,6 +68,7 @@ blockio_make_request(struct iet_volume *
- 	int err = 0;
- 	loff_t ppos = tio->offset;	
- #else	
-+	struct request_queue *bdev_q = bdev_get_queue(bio_data->bdev);
- 	int max_pages = 1;
- 	int err = 0;
- 
-@@ -102,7 +102,11 @@ blockio_make_request(struct iet_volume *
+--- iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c	2017-01-19 20:19:27.400507354 -0800
++++ iscsitarget-1.4.20.3+svn502/kernel/block-io.c	2017-01-19 20:32:22.977988593 -0800
+@@ -104,7 +104,11 @@ blockio_make_request(struct iet_volume *
  		/* bi_sector is ALWAYS in units of 512 bytes */
  		bio->bi_iter.bi_sector = ppos >> 9;
  		bio->bi_bdev = bio_data->bdev;
@@ -120,7 +104,7 @@ diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c iscsitarget-1.4.20
  		bio->bi_private = tio_work;
  
  		if (tio_bio)
-@@ -137,7 +141,12 @@ blockio_make_request(struct iet_volume *
+@@ -139,7 +143,12 @@ blockio_make_request(struct iet_volume *
  		tio_bio = tio_bio->bi_next;
  		bio->bi_next = NULL;
  
@@ -134,36 +118,14 @@ diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c iscsitarget-1.4.20
  
  	blk_finish_plug(&plug);
 diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/conn.c iscsitarget-1.4.20.3+svn502/kernel/conn.c
---- iscsitarget-1.4.20.3+svn502_org/kernel/conn.c	2016-09-25 19:45:01.774641057 +0530
-+++ iscsitarget-1.4.20.3+svn502/kernel/conn.c	2016-09-25 19:47:59.666474094 +0530
-@@ -89,13 +89,21 @@ static void iet_state_change(struct sock
- 	target->nthread_info.old_state_change(sk);
- }
- 
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
-+static void iet_data_ready(struct sock *sk)
-+#else
- static void iet_data_ready(struct sock *sk, int len)
-+#endif    
- {
- 	struct iscsi_conn *conn = sk->sk_user_data;
- 	struct iscsi_target *target = conn->session->target;
- 
- 	nthread_wakeup(target);
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
-+	target->nthread_info.old_data_ready(sk);
-+#else
- 	target->nthread_info.old_data_ready(sk, len);
-+#endif
- }
- 
- /*
-@@ -140,8 +148,14 @@ static void iet_socket_bind(struct iscsi
+--- iscsitarget-1.4.20.3+svn502_org/kernel/conn.c	2017-01-19 20:19:27.400507354 -0800
++++ iscsitarget-1.4.20.3+svn502/kernel/conn.c	2017-01-19 20:32:22.978988614 -0800
+@@ -148,8 +148,14 @@ static void iet_socket_bind(struct iscsi
  	target->nthread_info.old_state_change = conn->sock->sk->sk_state_change;
  	conn->sock->sk->sk_state_change = iet_state_change;
  
-+#if 0//LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
-+	target->nthread_info.old_data_ready = (void (*) (struct sock *, int )) \
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	target->nthread_info.old_data_ready = (void (*) (struct sock *)) \
 +						conn->sock->sk->sk_data_ready;
 +	conn->sock->sk->sk_data_ready = (void (*) (struct sock *)) iet_data_ready;
 +#else
@@ -174,8 +136,8 @@ diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/conn.c iscsitarget-1.4.20.3+s
  	target->nthread_info.old_write_space = conn->sock->sk->sk_write_space;
  	conn->sock->sk->sk_write_space = iet_write_space;
 diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/digest.c iscsitarget-1.4.20.3+svn502/kernel/digest.c
---- iscsitarget-1.4.20.3+svn502_org/kernel/digest.c	2014-05-07 02:29:55.000000000 +0530
-+++ iscsitarget-1.4.20.3+svn502/kernel/digest.c	2016-09-25 19:47:59.666474094 +0530
+--- iscsitarget-1.4.20.3+svn502_org/kernel/digest.c	2014-05-06 13:59:55.000000000 -0700
++++ iscsitarget-1.4.20.3+svn502/kernel/digest.c	2017-01-19 20:32:22.978988614 -0800
 @@ -30,6 +30,9 @@ void digest_alg_available(unsigned int *
  int digest_init(struct iscsi_conn *conn)
  {
@@ -374,8 +336,8 @@ diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/digest.c iscsitarget-1.4.20.3
 +#endif
  }
 diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h iscsitarget-1.4.20.3+svn502/kernel/iscsi.h
---- iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h	2016-09-25 19:45:01.734641099 +0530
-+++ iscsitarget-1.4.20.3+svn502/kernel/iscsi.h	2016-09-25 19:47:59.666474094 +0530
+--- iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h	2017-01-19 20:19:27.400507354 -0800
++++ iscsitarget-1.4.20.3+svn502/kernel/iscsi.h	2017-01-19 20:32:22.979988634 -0800
 @@ -14,6 +14,7 @@
  #include <linux/pagemap.h>
  #include <linux/seq_file.h>
@@ -384,19 +346,7 @@ diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h iscsitarget-1.4.20.3+
  #include <linux/crypto.h>
  #include <linux/scatterlist.h>
  #include <net/sock.h>
-@@ -81,7 +82,11 @@ struct network_thread_info {
- 	spinlock_t nthread_lock;
- 
- 	void (*old_state_change)(struct sock *);
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
-+	void (*old_data_ready)(struct sock *);
-+#else
- 	void (*old_data_ready)(struct sock *, int);
-+#endif
- 	void (*old_write_space)(struct sock *);
- };
- 
-@@ -275,8 +280,13 @@ struct iscsi_conn {
+@@ -275,8 +276,13 @@ struct iscsi_conn {
  	u32 write_offset;
  	int write_state;
  
@@ -410,7 +360,7 @@ diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h iscsitarget-1.4.20.3+
  	struct scatterlist hash_sg[ISCSI_CONN_IOV_MAX];
  };
  
-@@ -552,4 +562,10 @@ enum cmnd_flags {
+@@ -552,4 +558,10 @@ enum cmnd_flags {
  #define PRODUCT_ID	"VIRTUAL-DISK"
  #define PRODUCT_REV	"0"
  
@@ -422,9 +372,9 @@ diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h iscsitarget-1.4.20.3+
 +
  #endif	/* __ISCSI_H__ */
 diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c iscsitarget-1.4.20.3+svn502/kernel/nthread.c
---- iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c	2016-09-25 19:45:01.734641099 +0530
-+++ iscsitarget-1.4.20.3+svn502/kernel/nthread.c	2016-09-25 19:47:59.666474094 +0530
-@@ -126,7 +126,12 @@ static int do_recv(struct iscsi_conn *co
+--- iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c	2017-01-19 20:19:27.276504928 -0800
++++ iscsitarget-1.4.20.3+svn502/kernel/nthread.c	2017-01-19 20:32:22.979988634 -0800
+@@ -155,7 +155,12 @@ static int do_recv(struct iscsi_conn *co
  
  	oldfs = get_fs();
  	set_fs(get_ds());
@@ -437,7 +387,7 @@ diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c iscsitarget-1.4.20.
  	set_fs(oldfs);
  
  	if (res <= 0) {
-@@ -347,7 +352,11 @@ static int write_data(struct iscsi_conn
+@@ -376,7 +381,11 @@ static int write_data(struct iscsi_conn
  			;
  		oldfs = get_fs();
  		set_fs(KERNEL_DS);
@@ -449,7 +399,7 @@ diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c iscsitarget-1.4.20.
  		set_fs(oldfs);
  		dprintk(D_DATA, "%#Lx:%u: %d(%ld)\n",
  			(unsigned long long) conn->session->sid, conn->cid,
-@@ -478,7 +487,11 @@ static int tx_ddigest(struct iscsi_cmnd
+@@ -503,7 +512,11 @@ static int tx_ddigest(struct iscsi_cmnd
  	iov.iov_base = (char *) (&cmnd->ddigest) + (sizeof(u32) - rest);
  	iov.iov_len = rest;
  
@@ -461,7 +411,7 @@ diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c iscsitarget-1.4.20.
  
  	if (res > 0) {
  		cmnd->conn->write_size -= res;
-@@ -677,7 +690,12 @@ static void close_conn(struct iscsi_conn
+@@ -702,7 +715,12 @@ static void close_conn(struct iscsi_conn
  
  	write_lock_bh(&conn->sock->sk->sk_callback_lock);
  	conn->sock->sk->sk_state_change = target->nthread_info.old_state_change;
@@ -475,8 +425,8 @@ diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c iscsitarget-1.4.20.
  	write_unlock_bh(&conn->sock->sk->sk_callback_lock);
  
 diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/volume.c iscsitarget-1.4.20.3+svn502/kernel/volume.c
---- iscsitarget-1.4.20.3+svn502_org/kernel/volume.c	2016-09-25 19:45:01.734641099 +0530
-+++ iscsitarget-1.4.20.3+svn502/kernel/volume.c	2016-09-25 19:47:59.666474094 +0530
+--- iscsitarget-1.4.20.3+svn502_org/kernel/volume.c	2017-01-19 20:19:27.276504928 -0800
++++ iscsitarget-1.4.20.3+svn502/kernel/volume.c	2017-01-19 20:32:22.979988634 -0800
 @@ -84,12 +84,25 @@ static int set_scsisn(struct iet_volume
  /* Generate a MD5 hash of the target IQN and LUN number */
  static void gen_scsiid(struct iet_volume *volume)
-- 
2.7.4


