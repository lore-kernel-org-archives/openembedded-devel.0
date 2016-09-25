Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 71DC86022F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Sep 2016 20:01:41 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id l25so9966369pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Sep 2016 13:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=9aZyUFjv88yKuM2//akdakTnVsPfdp1kJvq+WM14l/A=;
	b=vGqhXXj9ielx1o6p0f/X5fxHb5r29KpXNvyjCL62UVrVQPHTs9MG5256gTxkkHFwtK
	bWOz3uw8UboXnbIeX8oqXnEi/yKy+kJuEtGl3jvo1nT9/ZMDoWS3FseRtodWYA6Tmhok
	pLQhZu9+yACDqa+sqwWxuTKlhtFWKtvHNa8u5niWKPuLPd2KSx50rHHcgQvGheJ0WK7s
	6RBUCa2oWGNYD8GX9pawZtQr9BlHqO4U1fumY7QNCadftjjJpmsDKwxVXEnsjDZQMpan
	PYqjpD2awSe0ox0GCgvGIDo12aaexxb6hb8dYwH2z1SckPibcdOSOzqfI/azbHJzUUb7
	QAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9aZyUFjv88yKuM2//akdakTnVsPfdp1kJvq+WM14l/A=;
	b=FlG3qjvZKnAmF/CACvbpvDv1bvg7Qu8DPS07/rI+uRgq3NZWd+g3CXAnJ3O/33xGZc
	C70zLmuDfvOPLDgc5EF1hJcri30qcqBBeFz/OfzABMAHcLm9qPqaASbT4FZIhQk4sEJF
	khFVT9oj8raXwcSKOZFhFC5W5W1DPevpqEjRSRLwvshzXFdJz6blkR2s+ziw5SIaugs5
	zyFsKtjdfqlOKjMb0QWLS2VEC94FE2G1J9HlX1twhx1LA5xZ10uvP9l+RgiDJyJHm69q
	OvjxHMa+lmQKh0OArkReVis+ItBYEB6IEvbs5UWLgBStHLzTPwKmrEtFUraGAXEeVces
	ZFSA==
X-Gm-Message-State: AE9vXwM+0Bjq5BUN8wQO7/HPe2Tk7HZ2dC0ar9LzM7qQtpi9JMgqPSwh4xItLIE7HrDHzwrF
X-Received: by 10.98.206.139 with SMTP id y133mr32169806pfg.7.1474833702801;
	Sun, 25 Sep 2016 13:01:42 -0700 (PDT)
Received: from localhost.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	d128sm11483155pfc.57.2016.09.25.13.01.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Sep 2016 13:01:41 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Sep 2016 01:31:34 +0530
Message-Id: <1474833694-31518-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH]] iscsitarget: resolve build error with linux kernel 4.8
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
X-List-Received-Date: Sun, 25 Sep 2016 20:01:47 -0000

The below changes in kernel source, triggered iscsitarget
build fail with linux kernel v4.8.

1. An extra 'flags' argument has been passed to vfs_readv/vfs_writev
   syscalls in v4.8. So, set this argument to "0" for now
   (as there is no real need for that).
   Ref: https://github.com/torvalds/linux/commit/793b80ef14af56d20c998265287648ad34239b6f
   Solves:
   -- snip --
TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/nthread.c: In function 'write_data':
TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/nthread.c:350:9: error: too few arguments to function 'vfs_writev'
   res = vfs_writev(file, (struct iovec __user *) iop, count, &off);
         ^~~~~~~~~~
   -- snip --

2. Redefine dropped PAGE_CACHE_* and page_cache_{get,release} definitions,
   as they have been dropped with v4.8
   Ref: https://github.com/torvalds/linux/commit/1fa64f198b9f8d6ec0f7aec7c18dc94684391140
   Solves:
   -- snip --
TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/param.c: In function 'sess_param_check':
TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/param.c:48:41: error: 'PAGE_CACHE_SIZE' undeclared (first use in this function)
       (u32) ((ISCSI_CONN_IOV_MAX - 1) * PAGE_CACHE_SIZE));
                                         ^
   -- snip --

3. Replace crypto_hash interfaces with crypto_ahash interfaces,
   Ref: https://github.com/torvalds/linux/commit/896545098777564212b9e91af4c973f094649aa7
   Ref: https://www.redhat.com/archives/dm-devel/2016-January/msg00244.html
   Solves:
   -- snip --
TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/digest.c: In function 'digest_init':
TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/digest.c:42:23: error: implicit declaration of function 'crypto_alloc_hash' [-Werror=implicit-function-declaration]
   conn->rx_hash.tfm = crypto_alloc_hash("crc32c", 0,
                       ^~~~~~~~~~~~~~~~~
TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/digest.c: In function 'digest_cleanup':
TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/digest.c:77:3: error: implicit declaration of function 'crypto_free_hash' [-Werror=implicit-function-declaration]
   crypto_free_hash(conn->tx_hash.tfm);
   ^~~~~~~~~~~~~~~~
   -- snip --

4. The earlier "rw" parameter has been set in "bi_rw" within
   bio structure, hence remove "rw" argument.
   Ref: https://github.com/torvalds/linux/commit/4e49ea4a3d276365bf7396c9b77b4d1d5923835a
   Solves:
-- snip --
TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/block-io.c:140:14: warning: passing argument 1 of 'submit_bio' makes pointer from integer without a cast [-Wint-conversion]
   submit_bio(rw, bio);
              ^~
-- snip --

5. The 'len' argument from sk_data_ready() callback has been removed in
   linux kernel v4.3 and above.
   Ref: https://github.com/torvalds/linux/commit/676d23690fb62b5d51ba5d659935e9f7d9da9f8e
   Solves:
-- snip --
TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c: In function 'iet_socket_bind':
TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c:143:38: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
  target->nthread_info.old_data_ready = conn->sock->sk->sk_data_ready;
                                      ^
TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c:144:32: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
  conn->sock->sk->sk_data_ready = iet_data_ready;
                                ^
-- snip --

6.
   A. The "size" argument has been dropped from sock_recvmsg syscall in v4.8,
      as all callers have it equal to msg_data_left(msg).
   B. 'struct user_msghdr' is being used for userland-side msghdr instead
      of 'struct msghdr', which is used for kernel-side msghdr in linux v3.19
      and above, so typecase it while calling sock_recvmsg syscall.
   Ref: https://github.com/torvalds/linux/commit/2da62906b1e298695e1bb725927041cd59942c98
        https://github.com/torvalds/linux/commit/666547ff591cebdedc4679bf6b1b3f3383a8dea3
   Solves:
   -- snip --
TOPDIR/tmp-glibc/work-shared/qemux86/kernel-source/include/linux/net.h:222:5: note: expected 'struct msghdr *' but argument is of type 'struct user_msghdr *'
 int sock_recvmsg(struct socket *sock, struct msghdr *msg, int flags);
     ^~~~~~~~~~~~
TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/nthread.c:129:8: error: too many arguments to function 'sock_recvmsg'
  res = sock_recvmsg(conn->sock, &msg, len, MSG_DONTWAIT | MSG_NOSIGNAL);
        ^~~~~~~~~~~~
   -- snip --

Detailed error log is at: http://errors.yoctoproject.org/Errors/Details/83334/

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 ...pdated_interfaces_of_linux_v4.8_and_above.patch | 525 +++++++++++++++++++++
 .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |   6 +-
 2 files changed, 527 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-extended/iscsitarget/files/build_with_updated_interfaces_of_linux_v4.8_and_above.patch

diff --git a/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_interfaces_of_linux_v4.8_and_above.patch b/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_interfaces_of_linux_v4.8_and_above.patch
new file mode 100644
index 0000000..e55c407
--- /dev/null
+++ b/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_interfaces_of_linux_v4.8_and_above.patch
@@ -0,0 +1,525 @@
+Resolve build error with linux kernel 4.8
+
+The below changes in kernel source, triggered iscsitarget
+build fail with linux kernel v4.8.
+
+1. An extra 'flags' argument has been passed to vfs_readv/vfs_writev
+   syscalls in v4.8. So, set this argument to "0" for now
+   (as there is no real need for that).
+   Ref: https://github.com/torvalds/linux/commit/793b80ef14af56d20c998265287648ad34239b6f
+   Solves:
+   -- snip --
+TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/nthread.c: In function 'write_data':
+TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/nthread.c:350:9: error: too few arguments to function 'vfs_writev'
+   res = vfs_writev(file, (struct iovec __user *) iop, count, &off);
+         ^~~~~~~~~~
+   -- snip --
+
+2. Redefine dropped PAGE_CACHE_* and page_cache_{get,release} definitions,
+   as they have been dropped with v4.8
+   Ref: https://github.com/torvalds/linux/commit/1fa64f198b9f8d6ec0f7aec7c18dc94684391140
+   Solves:
+   -- snip --
+TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/param.c: In function 'sess_param_check':
+TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/param.c:48:41: error: 'PAGE_CACHE_SIZE' undeclared (first use in this function)
+       (u32) ((ISCSI_CONN_IOV_MAX - 1) * PAGE_CACHE_SIZE));
+                                         ^
+   -- snip --
+
+3. Replace crypto_hash interfaces with crypto_ahash interfaces,
+   Ref: https://github.com/torvalds/linux/commit/896545098777564212b9e91af4c973f094649aa7
+   Ref: https://www.redhat.com/archives/dm-devel/2016-January/msg00244.html
+   Solves:
+   -- snip --
+TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/digest.c: In function 'digest_init':
+TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/digest.c:42:23: error: implicit declaration of function 'crypto_alloc_hash' [-Werror=implicit-function-declaration]
+   conn->rx_hash.tfm = crypto_alloc_hash("crc32c", 0,
+                       ^~~~~~~~~~~~~~~~~
+TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/digest.c: In function 'digest_cleanup':
+TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/digest.c:77:3: error: implicit declaration of function 'crypto_free_hash' [-Werror=implicit-function-declaration]
+   crypto_free_hash(conn->tx_hash.tfm);
+   ^~~~~~~~~~~~~~~~
+   -- snip --
+
+4. The earlier "rw" parameter has been set in "bi_rw" within
+   bio structure, hence remove "rw" argument.
+   Ref: https://github.com/torvalds/linux/commit/4e49ea4a3d276365bf7396c9b77b4d1d5923835a
+   Solves:
+-- snip --
+TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/block-io.c:140:14: warning: passing argument 1 of 'submit_bio' makes pointer from integer without a cast [-Wint-conversion]
+   submit_bio(rw, bio);
+              ^~
+-- snip --
+
+5. The 'len' argument from sk_data_ready() callback has been removed in
+   linux kernel v4.3 and above.
+   Ref: https://github.com/torvalds/linux/commit/676d23690fb62b5d51ba5d659935e9f7d9da9f8e
+   Solves:
+-- snip --
+TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c: In function 'iet_socket_bind':
+TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c:143:38: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
+  target->nthread_info.old_data_ready = conn->sock->sk->sk_data_ready;
+                                      ^
+TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c:144:32: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
+  conn->sock->sk->sk_data_ready = iet_data_ready;
+                                ^
+-- snip --
+
+6.
+   A. The "size" argument has been dropped from sock_recvmsg syscall in v4.8,
+      as all callers have it equal to msg_data_left(msg).
+   B. 'struct user_msghdr' is being used for userland-side msghdr instead
+      of 'struct msghdr', which is used for kernel-side msghdr in linux v3.19
+      and above, so typecase it while calling sock_recvmsg syscall.
+   Ref: https://github.com/torvalds/linux/commit/2da62906b1e298695e1bb725927041cd59942c98
+        https://github.com/torvalds/linux/commit/666547ff591cebdedc4679bf6b1b3f3383a8dea3
+   Solves:
+   -- snip --
+TOPDIR/tmp-glibc/work-shared/qemux86/kernel-source/include/linux/net.h:222:5: note: expected 'struct msghdr *' but argument is of type 'struct user_msghdr *'
+ int sock_recvmsg(struct socket *sock, struct msghdr *msg, int flags);
+     ^~~~~~~~~~~~
+TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/nthread.c:129:8: error: too many arguments to function 'sock_recvmsg'
+  res = sock_recvmsg(conn->sock, &msg, len, MSG_DONTWAIT | MSG_NOSIGNAL);
+        ^~~~~~~~~~~~
+   -- snip --
+
+Detailed error log is at: http://errors.yoctoproject.org/Errors/Details/83334/
+
+Upstream-Status: Pending
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+
+diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c iscsitarget-1.4.20.3+svn502/kernel/block-io.c
+--- iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c	2016-09-25 19:45:01.814641016 +0530
++++ iscsitarget-1.4.20.3+svn502/kernel/block-io.c	2016-09-25 19:47:59.666474094 +0530
+@@ -57,7 +57,6 @@ static int
+ blockio_make_request(struct iet_volume *volume, struct tio *tio, int rw)
+ {
+ 	struct blockio_data *bio_data = volume->private;
+-	struct request_queue *bdev_q = bdev_get_queue(bio_data->bdev);
+ 	struct tio_work *tio_work;
+ 	struct bio *tio_bio = NULL, *bio = NULL, *biotail = NULL;
+ 	struct blk_plug plug;
+@@ -69,6 +68,7 @@ blockio_make_request(struct iet_volume *
+ 	int err = 0;
+ 	loff_t ppos = tio->offset;	
+ #else	
++	struct request_queue *bdev_q = bdev_get_queue(bio_data->bdev);
+ 	int max_pages = 1;
+ 	int err = 0;
+ 
+@@ -102,7 +102,11 @@ blockio_make_request(struct iet_volume *
+ 		/* bi_sector is ALWAYS in units of 512 bytes */
+ 		bio->bi_iter.bi_sector = ppos >> 9;
+ 		bio->bi_bdev = bio_data->bdev;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++		bio->bi_end_io = (bio_end_io_t *) blockio_bio_endio;
++#else
+ 		bio->bi_end_io = blockio_bio_endio;
++#endif
+ 		bio->bi_private = tio_work;
+ 
+ 		if (tio_bio)
+@@ -137,7 +141,12 @@ blockio_make_request(struct iet_volume *
+ 		tio_bio = tio_bio->bi_next;
+ 		bio->bi_next = NULL;
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
++		submit_bio(bio);
++#else
+ 		submit_bio(rw, bio);
++#endif
+ 	}
+ 
+ 	blk_finish_plug(&plug);
+diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/conn.c iscsitarget-1.4.20.3+svn502/kernel/conn.c
+--- iscsitarget-1.4.20.3+svn502_org/kernel/conn.c	2016-09-25 19:45:01.774641057 +0530
++++ iscsitarget-1.4.20.3+svn502/kernel/conn.c	2016-09-25 19:47:59.666474094 +0530
+@@ -89,13 +89,21 @@ static void iet_state_change(struct sock
+ 	target->nthread_info.old_state_change(sk);
+ }
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
++static void iet_data_ready(struct sock *sk)
++#else
+ static void iet_data_ready(struct sock *sk, int len)
++#endif    
+ {
+ 	struct iscsi_conn *conn = sk->sk_user_data;
+ 	struct iscsi_target *target = conn->session->target;
+ 
+ 	nthread_wakeup(target);
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
++	target->nthread_info.old_data_ready(sk);
++#else
+ 	target->nthread_info.old_data_ready(sk, len);
++#endif
+ }
+ 
+ /*
+@@ -140,8 +148,14 @@ static void iet_socket_bind(struct iscsi
+ 	target->nthread_info.old_state_change = conn->sock->sk->sk_state_change;
+ 	conn->sock->sk->sk_state_change = iet_state_change;
+ 
++#if 0//LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	target->nthread_info.old_data_ready = (void (*) (struct sock *, int )) \
++						conn->sock->sk->sk_data_ready;
++	conn->sock->sk->sk_data_ready = (void (*) (struct sock *)) iet_data_ready;
++#else
+ 	target->nthread_info.old_data_ready = conn->sock->sk->sk_data_ready;
+ 	conn->sock->sk->sk_data_ready = iet_data_ready;
++#endif
+ 
+ 	target->nthread_info.old_write_space = conn->sock->sk->sk_write_space;
+ 	conn->sock->sk->sk_write_space = iet_write_space;
+diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/digest.c iscsitarget-1.4.20.3+svn502/kernel/digest.c
+--- iscsitarget-1.4.20.3+svn502_org/kernel/digest.c	2014-05-07 02:29:55.000000000 +0530
++++ iscsitarget-1.4.20.3+svn502/kernel/digest.c	2016-09-25 19:47:59.666474094 +0530
+@@ -30,6 +30,9 @@ void digest_alg_available(unsigned int *
+ int digest_init(struct iscsi_conn *conn)
+ {
+ 	int err = 0;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	struct crypto_ahash *tfm;
++#endif
+ 
+ 	if (!(conn->hdigest_type & DIGEST_ALL))
+ 		conn->hdigest_type = DIGEST_NONE;
+@@ -39,15 +42,40 @@ int digest_init(struct iscsi_conn *conn)
+ 
+ 	if (conn->hdigest_type & DIGEST_CRC32C ||
+ 	    conn->ddigest_type & DIGEST_CRC32C) {
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++		tfm = crypto_alloc_ahash("crc32c", 0, CRYPTO_ALG_ASYNC);
++		if (IS_ERR(tfm)) {
++			tfm = NULL;
++#else
+ 		conn->rx_hash.tfm = crypto_alloc_hash("crc32c", 0,
+ 						      CRYPTO_ALG_ASYNC);
+ 		conn->rx_hash.flags = 0;
+ 		if (IS_ERR(conn->rx_hash.tfm)) {
+ 			conn->rx_hash.tfm = NULL;
++#endif
+ 			err = -ENOMEM;
+ 			goto out;
+ 		}
+-
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++		conn->rx_hash = ahash_request_alloc(tfm, GFP_KERNEL);
++		if (!conn->rx_hash) {
++			pr_err("ahash_request_alloc() failed for conn->rx_hash\n");
++			crypto_free_ahash(tfm);
++			err = -ENOMEM;
++			goto out;
++		}
++		ahash_request_set_callback(conn->rx_hash, 0, NULL, NULL);
++		conn->tx_hash = ahash_request_alloc(tfm, GFP_KERNEL);
++		if(!conn->tx_hash) {
++			pr_err("ahash_request_alloc() failed for conn->tx_hash\n");
++			ahash_request_free(conn->rx_hash);
++			conn->rx_hash = NULL;
++			crypto_free_ahash(tfm);
++			err = -ENOMEM;
++			goto out;
++		}
++		ahash_request_set_callback(conn->tx_hash, 0, NULL, NULL);
++#else
+ 		conn->tx_hash.tfm = crypto_alloc_hash("crc32c", 0,
+ 						      CRYPTO_ALG_ASYNC);
+ 		conn->tx_hash.flags = 0;
+@@ -56,6 +84,7 @@ int digest_init(struct iscsi_conn *conn)
+ 			err = -ENOMEM;
+ 			goto out;
+ 		}
++#endif
+ 	}
+ 
+ out:
+@@ -73,10 +102,21 @@ out:
+  */
+ void digest_cleanup(struct iscsi_conn *conn)
+ {
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	ahash_request_free(conn->tx_hash);
++	if (conn->rx_hash) {
++		struct crypto_ahash *tfm;
++		tfm = crypto_ahash_reqtfm(conn->rx_hash);
++		ahash_request_free(conn->rx_hash);
++		crypto_free_ahash(tfm);
++	}
++
++#else
+ 	if (conn->tx_hash.tfm)
+ 		crypto_free_hash(conn->tx_hash.tfm);
+ 	if (conn->rx_hash.tfm)
+ 		crypto_free_hash(conn->rx_hash.tfm);
++#endif
+ }
+ 
+ /**
+@@ -160,8 +200,13 @@ static inline void __dbg_simulate_data_d
+ 	}
+ }
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++static void digest_header(struct ahash_request *hash, struct iscsi_pdu *pdu,
++			  u8 *crc)
++#else
+ static void digest_header(struct hash_desc *hash, struct iscsi_pdu *pdu,
+ 			  u8 *crc)
++#endif
+ {
+ 	struct scatterlist sg[2];
+ 	unsigned int nbytes = sizeof(struct iscsi_hdr);
+@@ -174,16 +219,27 @@ static void digest_header(struct hash_de
+ 		nbytes += pdu->ahssize;
+ 	}
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	crypto_ahash_init(hash);
++	ahash_request_set_crypt(hash, sg, crc, nbytes);
++	crypto_ahash_update(hash);
++	crypto_ahash_digest(hash);
++#else
+ 	crypto_hash_init(hash);
+ 	crypto_hash_update(hash, sg, nbytes);
+ 	crypto_hash_final(hash, crc);
++#endif
+ }
+ 
+ int digest_rx_header(struct iscsi_cmnd *cmnd)
+ {
+ 	u32 crc;
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	digest_header(cmnd->conn->rx_hash, &cmnd->pdu, (u8 *) &crc);
++#else
+ 	digest_header(&cmnd->conn->rx_hash, &cmnd->pdu, (u8 *) &crc);
++#endif
+ 	if (crc != cmnd->hdigest)
+ 		return -EIO;
+ 
+@@ -192,11 +248,20 @@ int digest_rx_header(struct iscsi_cmnd *
+ 
+ void digest_tx_header(struct iscsi_cmnd *cmnd)
+ {
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	digest_header(cmnd->conn->tx_hash, &cmnd->pdu, (u8 *) &cmnd->hdigest);
++#else
+ 	digest_header(&cmnd->conn->tx_hash, &cmnd->pdu, (u8 *) &cmnd->hdigest);
++#endif
+ }
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++static void digest_data(struct ahash_request *hash, struct iscsi_cmnd *cmnd,
++			struct tio *tio, u32 offset, u8 *crc)
++#else
+ static void digest_data(struct hash_desc *hash, struct iscsi_cmnd *cmnd,
+ 			struct tio *tio, u32 offset, u8 *crc)
++#endif
+ {
+ 	struct scatterlist *sg = cmnd->conn->hash_sg;
+ 	u32 size, length, npages;
+@@ -214,7 +279,11 @@ static void digest_data(struct hash_desc
+ 	BUG_ON(npages > ISCSI_CONN_IOV_MAX);
+ 
+ 	sg_init_table(sg, ARRAY_SIZE(cmnd->conn->hash_sg));
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	crypto_ahash_init(hash);
++#else
+ 	crypto_hash_init(hash);
++#endif
+ 
+ 	for (i = 0; size > 0; i++) {
+ 		length = min_t(u32, PAGE_CACHE_SIZE - offset, size);
+@@ -225,8 +294,14 @@ static void digest_data(struct hash_desc
+ 
+ 	sg_mark_end(&sg[i - 1]);
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	ahash_request_set_crypt(hash, sg, crc, nbytes);
++	crypto_ahash_update(hash);
++	crypto_ahash_digest(hash);
++#else
+ 	crypto_hash_update(hash, sg, nbytes);
+ 	crypto_hash_final(hash, crc);
++#endif
+ }
+ 
+ int digest_rx_data(struct iscsi_cmnd *cmnd)
+@@ -251,8 +326,11 @@ int digest_rx_data(struct iscsi_cmnd *cm
+ 		tio = cmnd->tio;
+ 		offset = 0;
+ 	}
+-
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	digest_data(cmnd->conn->rx_hash, cmnd, tio, offset, (u8 *) &crc);
++#else
+ 	digest_data(&cmnd->conn->rx_hash, cmnd, tio, offset, (u8 *) &crc);
++#endif
+ 
+ 	if (!cmnd->conn->read_overflow &&
+ 	    (cmnd_opcode(cmnd) != ISCSI_OP_PDU_REJECT)) {
+@@ -269,6 +347,11 @@ void digest_tx_data(struct iscsi_cmnd *c
+ 	struct iscsi_data_out_hdr *req = (struct iscsi_data_out_hdr *)&cmnd->pdu.bhs;
+ 
+ 	assert(tio);
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	digest_data(cmnd->conn->tx_hash, cmnd, tio,
++		    be32_to_cpu(req->buffer_offset), (u8 *) &cmnd->ddigest);
++#else
+ 	digest_data(&cmnd->conn->tx_hash, cmnd, tio,
+ 		    be32_to_cpu(req->buffer_offset), (u8 *) &cmnd->ddigest);
++#endif
+ }
+diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h iscsitarget-1.4.20.3+svn502/kernel/iscsi.h
+--- iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h	2016-09-25 19:45:01.734641099 +0530
++++ iscsitarget-1.4.20.3+svn502/kernel/iscsi.h	2016-09-25 19:47:59.666474094 +0530
+@@ -14,6 +14,7 @@
+ #include <linux/pagemap.h>
+ #include <linux/seq_file.h>
+ #include <linux/mm.h>
++#include <crypto/hash.h>
+ #include <linux/crypto.h>
+ #include <linux/scatterlist.h>
+ #include <net/sock.h>
+@@ -81,7 +82,11 @@ struct network_thread_info {
+ 	spinlock_t nthread_lock;
+ 
+ 	void (*old_state_change)(struct sock *);
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
++	void (*old_data_ready)(struct sock *);
++#else
+ 	void (*old_data_ready)(struct sock *, int);
++#endif
+ 	void (*old_write_space)(struct sock *);
+ };
+ 
+@@ -275,8 +280,13 @@ struct iscsi_conn {
+ 	u32 write_offset;
+ 	int write_state;
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	struct ahash_request *rx_hash;
++	struct ahash_request *tx_hash;
++#else
+ 	struct hash_desc rx_hash;
+ 	struct hash_desc tx_hash;
++#endif
+ 	struct scatterlist hash_sg[ISCSI_CONN_IOV_MAX];
+ };
+ 
+@@ -552,4 +562,10 @@ enum cmnd_flags {
+ #define PRODUCT_ID	"VIRTUAL-DISK"
+ #define PRODUCT_REV	"0"
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++#define PAGE_CACHE_SHIFT	PAGE_SHIFT
++#define PAGE_CACHE_SIZE	PAGE_SIZE
++#define PAGE_CACHE_MASK	PAGE_MASK
++#endif
++
+ #endif	/* __ISCSI_H__ */
+diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c iscsitarget-1.4.20.3+svn502/kernel/nthread.c
+--- iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c	2016-09-25 19:45:01.734641099 +0530
++++ iscsitarget-1.4.20.3+svn502/kernel/nthread.c	2016-09-25 19:47:59.666474094 +0530
+@@ -126,7 +126,12 @@ static int do_recv(struct iscsi_conn *co
+ 
+ 	oldfs = get_fs();
+ 	set_fs(get_ds());
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	res = sock_recvmsg(conn->sock, (struct msghdr *) &msg, \
++				MSG_DONTWAIT | MSG_NOSIGNAL);
++#else
+ 	res = sock_recvmsg(conn->sock, &msg, len, MSG_DONTWAIT | MSG_NOSIGNAL);
++#endif
+ 	set_fs(oldfs);
+ 
+ 	if (res <= 0) {
+@@ -347,7 +352,11 @@ static int write_data(struct iscsi_conn
+ 			;
+ 		oldfs = get_fs();
+ 		set_fs(KERNEL_DS);
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++		res = vfs_writev(file, (struct iovec __user *) iop, count, &off, 0);
++#else
+ 		res = vfs_writev(file, (struct iovec __user *) iop, count, &off);
++#endif
+ 		set_fs(oldfs);
+ 		dprintk(D_DATA, "%#Lx:%u: %d(%ld)\n",
+ 			(unsigned long long) conn->session->sid, conn->cid,
+@@ -478,7 +487,11 @@ static int tx_ddigest(struct iscsi_cmnd
+ 	iov.iov_base = (char *) (&cmnd->ddigest) + (sizeof(u32) - rest);
+ 	iov.iov_len = rest;
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	res = kernel_sendmsg(cmnd->conn->sock, (struct msghdr *) &msg, &iov, 1, rest);
++#else
+ 	res = kernel_sendmsg(cmnd->conn->sock, &msg, &iov, 1, rest);
++#endif
+ 
+ 	if (res > 0) {
+ 		cmnd->conn->write_size -= res;
+@@ -677,7 +690,12 @@ static void close_conn(struct iscsi_conn
+ 
+ 	write_lock_bh(&conn->sock->sk->sk_callback_lock);
+ 	conn->sock->sk->sk_state_change = target->nthread_info.old_state_change;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	conn->sock->sk->sk_data_ready = (void (*) (struct sock *)) \
++					target->nthread_info.old_data_ready;
++#else
+ 	conn->sock->sk->sk_data_ready = target->nthread_info.old_data_ready;
++#endif
+ 	conn->sock->sk->sk_write_space = target->nthread_info.old_write_space;
+ 	write_unlock_bh(&conn->sock->sk->sk_callback_lock);
+ 
+diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/volume.c iscsitarget-1.4.20.3+svn502/kernel/volume.c
+--- iscsitarget-1.4.20.3+svn502_org/kernel/volume.c	2016-09-25 19:45:01.734641099 +0530
++++ iscsitarget-1.4.20.3+svn502/kernel/volume.c	2016-09-25 19:47:59.666474094 +0530
+@@ -84,12 +84,25 @@ static int set_scsisn(struct iet_volume
+ /* Generate a MD5 hash of the target IQN and LUN number */
+ static void gen_scsiid(struct iet_volume *volume)
+ {
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	struct ahash_request *hash;
++	struct crypto_ahash *tfm;
++#else
+ 	struct hash_desc hash;
++#endif
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	tfm = crypto_alloc_ahash("md5", 0, CRYPTO_ALG_ASYNC);
++#else
+ 	hash.tfm = crypto_alloc_hash("md5", 0, CRYPTO_ALG_ASYNC);
+ 	hash.flags = 0;
++#endif
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++	if (!IS_ERR(tfm)) {
++#else
+ 	if (!IS_ERR(hash.tfm)) {
++#endif
+ 		struct scatterlist sg[2];
+ 		unsigned int nbytes = 0;
+ 
+@@ -102,11 +115,19 @@ static void gen_scsiid(struct iet_volume
+ 		sg_set_buf(&sg[1], &volume->lun, sizeof(volume->lun));
+ 		nbytes += sizeof(volume->lun);
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
++		crypto_ahash_init(hash);
++		ahash_request_set_crypt(hash, sg, volume->scsi_id, nbytes);
++		crypto_ahash_update(hash);
++		crypto_ahash_digest(hash);
++		crypto_free_ahash(tfm);
++#else
+ 		crypto_hash_init(&hash);
+ 		crypto_hash_update(&hash, sg, nbytes);
+ 		crypto_hash_final(&hash, volume->scsi_id);
+ 
+ 		crypto_free_hash(hash.tfm);
++#endif
+ 	} else {
+ 		/* If no MD5 available set ID to TID and LUN */
+ 		memcpy(volume->scsi_id, &volume->target->tid,
diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
index 4b5622b..7279bc6 100644
--- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
+++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
@@ -12,7 +12,8 @@ SRC_URI = "http://ftp.heanet.ie/mirrors/ubuntu/pool/universe/i/${BPN}/${BPN}_${P
            file://use-kernel-makefile-to-get-kernel-version.patch \
            file://fix-errors-observed-with-linux-3.19-and-greater.patch \
            file://access-sk_v6_daddr-iff-IPV6-defined.patch \
-           file://build_with_updated_bio_struct_of_linux_v4.3_and_above.patch"
+           file://build_with_updated_bio_struct_of_linux_v4.3_and_above.patch \
+           file://build_with_updated_interfaces_of_linux_v4.8_and_above.patch"
 
 SRC_URI[md5sum] = "ef9bc823bbabd3c772208c00d5f2d089"
 SRC_URI[sha256sum] = "d3196ccb78a43266dce28587bfe30d8ab4db7566d7bce96057dfbb84100babb5"
@@ -56,6 +57,3 @@ FILES_${PN} += "${sbindir} \
 
 RDEPENDS_${PN} = "kernel-module-iscsi-trgt"
 RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
-
-# http://errors.yoctoproject.org/Errors/Details/83334/
-PNBLACKLIST[iscsitarget] ?= "BROKEN: not compatible with default kernel version 4.8"
-- 
2.7.4


