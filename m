Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 35B2471E1D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 08:24:48 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id 189so20887417pfu.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 00:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=obE2mc77N6veinc6peuztMX4eKHgEyarTl5A0rHivCs=;
	b=Pj4c/9n9ZY8U5t/M0J8l3xPyeYLetzyhxv/aPfXFZtjYTE2QaP0SnpTQD3gxcpKIIO
	L9vokqnWH3GmCZOxBCbLwUAUsVmTKk5mlG3+Fg8TbyXlle3AdxwIFih1ucREzXxkR8xD
	7ZWy18WJ5CrWwCu+poabMQEvpuEwbyRmSkN2GnOPaR1BVh6uBx/9Oqpvtd1Oe5aHZKg+
	CReTJB+Ixx6fW9k8y6genxLKV4lF/sHI9FB08l3xPTlIl47bcd7PMNfWwnOLho0Eeogr
	fmrystffYho00jYj9WZIH/i7GEjD8qIOieGIb5gVej3K3cieVBnVRb4+HymJGFN46Xx9
	ltpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=obE2mc77N6veinc6peuztMX4eKHgEyarTl5A0rHivCs=;
	b=MemB3rfCs9PKxL0PYtNa8jl4Ywz6Na6tWKnjnq2kcz6h40LT9urnbnnvjhJLFrQKQ7
	sH5fmAVGhk4dFC1SG003HekigtWKjhF/4Whb+p2GDRUkWLJ1jsaixI8yDOO6ZN1+93Bq
	QZZVYlevZ++j9oedmt0/I+dWp1X60KuGWA/yxYsvj19eMYziOodh+1MdIgVXcLkyr7Ns
	cWILHJP/Mk3PsCJQDJ75gvmrPGsT3OD1bFpVdYlPbzJGhCCBxwcfZnw5xvDzxSrgK6hE
	TJbKHgQryV/Q0hrSc5z5PnG7xDLTXsRebSV3m1WFmYIBfI7EGO7IHtSLuLw19D6qN2ia
	SgZA==
X-Gm-Message-State: AIkVDXLB2uKtCf/4ZWJtoIM/YgCfgBamQLqX87KD9iRe+Xqs1X1zwOU8rRgA2hXg/fxb6grb
X-Received: by 10.99.215.5 with SMTP id d5mr15181242pgg.51.1484900688683;
	Fri, 20 Jan 2017 00:24:48 -0800 (PST)
Received: from jkrishnanjanappa-VPCEB26FG.mvista.com
	([2405:204:5007:e8ac:71f6:873f:d195:7323])
	by smtp.gmail.com with ESMTPSA id
	m14sm14543283pgn.19.2017.01.20.00.24.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 00:24:47 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jan 2017 13:54:35 +0530
Message-Id: <1484900677-11893-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH 1/3] iscsitarget: fix inconsistent crash while login to iscsi target from initiator
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
X-List-Received-Date: Fri, 20 Jan 2017 08:24:49 -0000

This patch fixes below inconsistent crash when trying to login to iSCSI target
server, observed with linux kernel v4.1.

-- snip --
CPU: 1 PID: 29883 Comm: istd1 Tainted: G           O    4.1.35-rt40-yocto-standard #1
Hardware name: To be filled by O.E.M. To be filled by O.E.M./Larne CRB, BIOS 4.6.5.4 09/18/2014
task: ffff88020f1f30c0 ti: ffff8800d7f3c000 task.ti: ffff8800d7f3c000
RIP: 0010:[<ffffffff8140d1ae>]  [<ffffffff8140d1ae>] copy_to_iter+0x3e/0x280
RSP: 0018:ffff8800d7f3f728  EFLAGS: 00010246
RAX: 00000000d7f3f928 RBX: 0000000000000030 RCX: 0000000000000030
RDX: ffff8800d7f3f900 RSI: 0000000000000030 RDI: ffff8800d1501e82
RBP: ffff8800d7f3f768 R08: 00000000c127d467 R09: 0000000000000000
R10: ffff88020f29e118 R11: 0000000000000004 R12: ffff8800d7f3f900
R13: 0000000000000030 R14: 0000000000000001 R15: 0000000000000246
FS:  00007f86f9c4c700(0000) GS:ffff88021ec80000(0000) knlGS:00000000f7733700
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000000024e CR3: 00000000d38b0000 CR4: 00000000000406e0
Stack:
ffff880214f14ec0 ffff8800d1501e82 ffff8800d7f3f748 0000000000000030
ffff88020f122500 0000000000000030 0000000000000000 0000000000000030
ffff8800d7f3f7c8 ffffffff81806981 ffff8800d7f3f798 ffffffff8105d72a
Call Trace:
[<ffffffff81806981>] skb_copy_datagram_iter+0x71/0x2b0
[<ffffffff8105d72a>] ? __local_bh_enable_ip+0x4a/0xb0
[<ffffffff8186c9c0>] tcp_recvmsg+0x5e0/0xbb0
[<ffffffff81898ded>] inet_recvmsg+0x8d/0xb0
[<ffffffff817f49f3>] sock_recvmsg+0x13/0x20
[<ffffffffa01655c3>] do_recv+0xe3/0x1f0 [iscsi_trgt]
[<ffffffff81153097>] ? __mod_zone_page_state+0x77/0xb0
[<ffffffff81417613>] ? __this_cpu_preempt_check+0x13/0x20
[<ffffffff81153097>] ? __mod_zone_page_state+0x77/0xb0
[<ffffffff8140fed5>] ? find_next_bit+0x15/0x30
[<ffffffff813fa8e0>] ? cpumask_next_and+0x30/0x50
[<ffffffff8113f785>] ? __alloc_pages_nodemask+0x165/0x980
[<ffffffff8107e370>] ? preempt_count_add+0xd0/0xf0
[<ffffffff8195da8b>] ? _raw_spin_lock+0x1b/0x60
[<ffffffff8109cfa8>] ? cpuacct_charge+0x58/0x70
[<ffffffff81089039>] ? update_curr+0xb9/0x190
[<ffffffff81417613>] ? __this_cpu_preempt_check+0x13/0x20
[<ffffffff8112b43f>] ? __perf_event_task_sched_in+0x4f/0x90
[<ffffffff8195dbbd>] ? _raw_spin_unlock_irq+0x1d/0x40
[<ffffffff8107e223>] ? finish_task_switch+0x63/0xe0
[<ffffffff81959e3b>] ? __schedule+0x38b/0x980
[<ffffffff8107e370>] ? preempt_count_add+0xd0/0xf0
[<ffffffffa0165c65>] istd+0x4d5/0x1390 [iscsi_trgt]
[<ffffffff81959e3b>] ? __schedule+0x38b/0x980
[<ffffffffa0165790>] ? nthread_wakeup+0x40/0x40 [iscsi_trgt]
[<ffffffffa0165790>] ? nthread_wakeup+0x40/0x40 [iscsi_trgt]
[<ffffffff8107748b>] kthread+0xbb/0xe0
[<ffffffff81950000>] ? wireless_dev_seq_show+0x100/0x180
[<ffffffff810773d0>] ? kthread_worker_fn+0x170/0x170
[<ffffffff8195e7a2>] ret_from_fork+0x42/0x70
[<ffffffff810773d0>] ? kthread_worker_fn+0x170/0x170
Code: 5a 10 48 89 7d c8 48 39 f3 48 0f 47 de 48 85 db 0f 84 6f 01 00 00 8b 02 49 89
d4 4c 8b 72 08 4c 8b 7a 18 a8 04 0f 85 a2 00 00 00 <4d> 8b 6f 08 4d 29 f5 49 39 dd 4c 0f 47 eb a8 02 0f 85 5c 01 00
RSP <ffff8800d7f3f728>
CR2: 000000000000024e
------------[ cut here ]------------
-- snip --

The original patch is at
http://launchpadlibrarian.net/218100509/iscsitarget_1.4.20.3+svn499-0ubuntu2_1.4.20.3+svn499-0ubuntu2.1.diff.gz,
those changes were taken using #ifs, inorder to allow compilation of
iscsitarget package with linux kernels < 3.19.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 ...rors-observed-with-linux-3.19-and-greater.patch | 313 +++++++++++++++------
 1 file changed, 221 insertions(+), 92 deletions(-)

diff --git a/meta-networking/recipes-extended/iscsitarget/files/fix-errors-observed-with-linux-3.19-and-greater.patch b/meta-networking/recipes-extended/iscsitarget/files/fix-errors-observed-with-linux-3.19-and-greater.patch
index 6878ca2..1e6a1d6 100644
--- a/meta-networking/recipes-extended/iscsitarget/files/fix-errors-observed-with-linux-3.19-and-greater.patch
+++ b/meta-networking/recipes-extended/iscsitarget/files/fix-errors-observed-with-linux-3.19-and-greater.patch
@@ -1,57 +1,80 @@
-Fix build errors with linux kernel v3.19 and above
+Description: Fix source to compile on 3.19 kernels
+Author: Stefan Bader <stefan.bader@canonical.com>
+Forward: no
 
-Below errors came up while building iscsitarget for 
-qemux86-64 (and others) because,
-1. 'struct user_msghdr' is being used for userland-side msghdr instead
-of 'struct msghdr', which is used for kernel-side msghdr in linux v3.19
-and above.
+Fixes below inconsistent crash when trying to login to iSCSI target
+server, observed with linux kernel v4.1.
 
-error snippet:
 -- snip --
-| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/iscsi.c: In function 'cmnd_skip_pdu':
-| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/iscsi.c:492:16: error: 'struct msghdr' has no member named 'msg_iov'
-|   conn->read_msg.msg_iov = conn->read_iov;
--- CUT --
-
-Reference:
-https://github.com/torvalds/linux/commit/666547ff591cebdedc4679bf6b1b3f3383a8dea3
-
-2. 'SERVICE_ACTION_IN' has been renamed to SERVICE_ACTION_IN_16 in linux v3.19
-and above.
-
-error snippet:
--- snip --
-| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/iscsi.c: In function 'scsi_cmnd_start':
-| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/iscsi.c:989:7: error: 'SERVICE_ACTION_IN' undeclared (first use in this function)
-|   case SERVICE_ACTION_IN:
--- CUT --
-
-Reference:
-https://github.com/torvalds/linux/commit/eb846d9f147455e4e5e1863bfb5e31974bb69b7c
-
-3. In linux v3.19 and above, f_dentry member has been removed from 
-'struct file' structure.
-
-error snippet:
+CPU: 1 PID: 29883 Comm: istd1 Tainted: G           O    4.1.35-rt40-yocto-standard #1
+Hardware name: To be filled by O.E.M. To be filled by O.E.M./Larne CRB, BIOS 4.6.5.4 09/18/2014
+task: ffff88020f1f30c0 ti: ffff8800d7f3c000 task.ti: ffff8800d7f3c000
+RIP: 0010:[<ffffffff8140d1ae>]  [<ffffffff8140d1ae>] copy_to_iter+0x3e/0x280
+RSP: 0018:ffff8800d7f3f728  EFLAGS: 00010246
+RAX: 00000000d7f3f928 RBX: 0000000000000030 RCX: 0000000000000030
+RDX: ffff8800d7f3f900 RSI: 0000000000000030 RDI: ffff8800d1501e82
+RBP: ffff8800d7f3f768 R08: 00000000c127d467 R09: 0000000000000000
+R10: ffff88020f29e118 R11: 0000000000000004 R12: ffff8800d7f3f900
+R13: 0000000000000030 R14: 0000000000000001 R15: 0000000000000246
+FS:  00007f86f9c4c700(0000) GS:ffff88021ec80000(0000) knlGS:00000000f7733700
+CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+CR2: 000000000000024e CR3: 00000000d38b0000 CR4: 00000000000406e0
+Stack:
+ffff880214f14ec0 ffff8800d1501e82 ffff8800d7f3f748 0000000000000030
+ffff88020f122500 0000000000000030 0000000000000000 0000000000000030
+ffff8800d7f3f7c8 ffffffff81806981 ffff8800d7f3f798 ffffffff8105d72a
+Call Trace:
+[<ffffffff81806981>] skb_copy_datagram_iter+0x71/0x2b0
+[<ffffffff8105d72a>] ? __local_bh_enable_ip+0x4a/0xb0
+[<ffffffff8186c9c0>] tcp_recvmsg+0x5e0/0xbb0
+[<ffffffff81898ded>] inet_recvmsg+0x8d/0xb0
+[<ffffffff817f49f3>] sock_recvmsg+0x13/0x20
+[<ffffffffa01655c3>] do_recv+0xe3/0x1f0 [iscsi_trgt]
+[<ffffffff81153097>] ? __mod_zone_page_state+0x77/0xb0
+[<ffffffff81417613>] ? __this_cpu_preempt_check+0x13/0x20
+[<ffffffff81153097>] ? __mod_zone_page_state+0x77/0xb0
+[<ffffffff8140fed5>] ? find_next_bit+0x15/0x30
+[<ffffffff813fa8e0>] ? cpumask_next_and+0x30/0x50
+[<ffffffff8113f785>] ? __alloc_pages_nodemask+0x165/0x980
+[<ffffffff8107e370>] ? preempt_count_add+0xd0/0xf0
+[<ffffffff8195da8b>] ? _raw_spin_lock+0x1b/0x60
+[<ffffffff8109cfa8>] ? cpuacct_charge+0x58/0x70
+[<ffffffff81089039>] ? update_curr+0xb9/0x190
+[<ffffffff81417613>] ? __this_cpu_preempt_check+0x13/0x20
+[<ffffffff8112b43f>] ? __perf_event_task_sched_in+0x4f/0x90
+[<ffffffff8195dbbd>] ? _raw_spin_unlock_irq+0x1d/0x40
+[<ffffffff8107e223>] ? finish_task_switch+0x63/0xe0
+[<ffffffff81959e3b>] ? __schedule+0x38b/0x980
+[<ffffffff8107e370>] ? preempt_count_add+0xd0/0xf0
+[<ffffffffa0165c65>] istd+0x4d5/0x1390 [iscsi_trgt]
+[<ffffffff81959e3b>] ? __schedule+0x38b/0x980
+[<ffffffffa0165790>] ? nthread_wakeup+0x40/0x40 [iscsi_trgt]
+[<ffffffffa0165790>] ? nthread_wakeup+0x40/0x40 [iscsi_trgt]
+[<ffffffff8107748b>] kthread+0xbb/0xe0
+[<ffffffff81950000>] ? wireless_dev_seq_show+0x100/0x180
+[<ffffffff810773d0>] ? kthread_worker_fn+0x170/0x170
+[<ffffffff8195e7a2>] ret_from_fork+0x42/0x70
+[<ffffffff810773d0>] ? kthread_worker_fn+0x170/0x170
+Code: 5a 10 48 89 7d c8 48 39 f3 48 0f 47 de 48 85 db 0f 84 6f 01 00 00 8b 02 49 89
+d4 4c 8b 72 08 4c 8b 7a 18 a8 04 0f 85 a2 00 00 00 <4d> 8b 6f 08 4d 29 f5 49 39 dd 4c 0f 47 eb a8 02 0f 85 5c 01 00 
+RSP <ffff8800d7f3f728>
+CR2: 000000000000024e
+------------[ cut here ]------------
 -- snip --
-| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c: In function 'iet_socket_bind':
-| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c:130:34: error: 'struct file' has no member named 'f_dentry'
-|   conn->sock = SOCKET_I(conn->file->f_dentry->d_inode);
--- CUT --
-
-new helper function file_inode(file) should be used instead.
 
-References:
-1. https://github.com/torvalds/linux/commit/78d28e651f97866d608d9b41f8ad291e65d47dd5
-2. https://github.com/torvalds/linux/commit/496ad9aa8ef448058e36ca7a787c61f2e63f0f54
+The original patch is at
+http://launchpadlibrarian.net/218100509/iscsitarget_1.4.20.3+svn499-0ubuntu2_1.4.20.3+svn499-0ubuntu2.1.diff.gz,
+those changes were taken using #ifs, inorder to allow compilation of 
+iscsitarget package with linux kernels < 3.19.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [http://launchpadlibrarian.net/218100509/iscsitarget_1.4.20.3+svn499-0ubuntu2_1.4.20.3+svn499-0ubuntu2.1.diff.gz]
 
 Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
 
---- iscsitarget-1.4.20.3+svn502_org/kernel/conn.c	2015-08-24 16:13:26.481924679 +0530
-+++ iscsitarget-1.4.20.3+svn502/kernel/conn.c	2015-08-24 17:27:06.897653698 +0530
-@@ -127,7 +127,11 @@ static void iet_socket_bind(struct iscsi
+diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/conn.c iscsitarget-1.4.20.3+svn502/kernel/conn.c
+--- iscsitarget-1.4.20.3+svn502_org/kernel/conn.c	2017-01-18 22:27:02.713167436 -0800
++++ iscsitarget-1.4.20.3+svn502/kernel/conn.c	2017-01-18 23:13:11.909214379 -0800
+@@ -129,7 +129,11 @@ static void iet_socket_bind(struct iscsi
  
  	dprintk(D_GENERIC, "%llu\n", (unsigned long long) session->sid);
  
@@ -63,8 +86,9 @@ Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
  	conn->sock->sk->sk_user_data = conn;
  
  	write_lock_bh(&conn->sock->sk->sk_callback_lock);
---- iscsitarget-1.4.20.3+svn502_org/kernel/file-io.c	2015-08-24 16:13:26.481924679 +0530
-+++ iscsitarget-1.4.20.3+svn502/kernel/file-io.c	2015-08-24 17:30:54.390131100 +0530
+diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/file-io.c iscsitarget-1.4.20.3+svn502/kernel/file-io.c
+--- iscsitarget-1.4.20.3+svn502_org/kernel/file-io.c	2014-05-06 13:59:55.000000000 -0700
++++ iscsitarget-1.4.20.3+svn502/kernel/file-io.c	2017-01-18 23:54:38.505717079 -0800
 @@ -69,7 +69,11 @@ static int fileio_make_request(struct ie
  static int fileio_sync(struct iet_volume *lu, struct tio *tio)
  {
@@ -89,9 +113,81 @@ Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
  
  	if (S_ISREG(inode->i_mode))
  		;
---- iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.c	2015-08-24 16:13:26.481924679 +0530
-+++ iscsitarget-1.4.20.3+svn502/kernel/iscsi.c	2015-08-24 17:33:50.950490156 +0530
-@@ -986,7 +986,11 @@ static void scsi_cmnd_start(struct iscsi
+diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.c iscsitarget-1.4.20.3+svn502/kernel/iscsi.c
+--- iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.c	2014-05-06 13:59:55.000000000 -0700
++++ iscsitarget-1.4.20.3+svn502/kernel/iscsi.c	2017-01-18 23:37:36.462970326 -0800
+@@ -489,8 +489,12 @@ static void cmnd_skip_pdu(struct iscsi_c
+ 	}
+ 	conn->read_iov[i].iov_base = addr;
+ 	conn->read_iov[i].iov_len = size;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
++	iov_iter_init(&conn->read_msg.msg_iter, READ, conn->read_iov, ++i, conn->read_size);
++#else
+ 	conn->read_msg.msg_iov = conn->read_iov;
+ 	conn->read_msg.msg_iovlen = ++i;
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
+ }
+ 
+ static void iscsi_cmnd_reject(struct iscsi_cmnd *req, int reason)
+@@ -718,7 +722,9 @@ static int cmnd_recv_pdu(struct iscsi_co
+ 	idx = offset >> PAGE_CACHE_SHIFT;
+ 	offset &= ~PAGE_CACHE_MASK;
+ 
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0)
+ 	conn->read_msg.msg_iov = conn->read_iov;
++#endif	/* LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0) */
+ 	conn->read_size = size = (size + 3) & -4;
+ 	conn->read_overflow = 0;
+ 
+@@ -730,16 +736,25 @@ static int cmnd_recv_pdu(struct iscsi_co
+ 		conn->read_iov[i].iov_base =  addr + offset;
+ 		if (offset + size <= PAGE_CACHE_SIZE) {
+ 			conn->read_iov[i].iov_len = size;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
++			iov_iter_init(&conn->read_msg.msg_iter, READ, conn->read_iov, ++i, conn->read_size);
++#else
+ 			conn->read_msg.msg_iovlen = ++i;
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
+ 			break;
+ 		}
+ 		conn->read_iov[i].iov_len = PAGE_CACHE_SIZE - offset;
+ 		size -= conn->read_iov[i].iov_len;
+ 		offset = 0;
+ 		if (++i >= ISCSI_CONN_IOV_MAX) {
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0)
+ 			conn->read_msg.msg_iovlen = i;
++#endif /* LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0) */
+ 			conn->read_overflow = size;
+ 			conn->read_size -= size;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
++			iov_iter_init(&conn->read_msg.msg_iter, READ, conn->read_iov, i, conn->read_size);
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
+ 			break;
+ 		}
+ 
+@@ -918,7 +933,9 @@ static int nop_out_start(struct iscsi_co
+ 
+ 	if ((size = cmnd->pdu.datasize)) {
+ 		size = (size + 3) & -4;
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0)
+ 		conn->read_msg.msg_iov = conn->read_iov;
++#endif /* LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0) */
+ 		if (cmnd->pdu.bhs.itt != cpu_to_be32(ISCSI_RESERVED_TAG)) {
+ 			struct tio *tio;
+ 			int pg_cnt = get_pgcnt(size);
+@@ -946,7 +963,11 @@ static int nop_out_start(struct iscsi_co
+ 		}
+ 		assert(!size);
+ 		conn->read_overflow = size;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
++		iov_iter_init(&conn->read_msg.msg_iter, READ, conn->read_iov, i, conn->read_size);
++#else
+ 		conn->read_msg.msg_iovlen = i;
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
+ 	}
+ 
+ out:
+@@ -986,7 +1007,11 @@ static void scsi_cmnd_start(struct iscsi
  		set_cmnd_lunit(req);
  
  	switch (req_hdr->scb[0]) {
@@ -103,61 +199,93 @@ Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
  		if ((req_hdr->scb[1] & 0x1f) != 0x10)
  			goto error;
  	case INQUIRY:
---- iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h	2015-08-24 16:13:26.481924679 +0530
-+++ iscsitarget-1.4.20.3+svn502/kernel/iscsi.h	2015-08-24 17:35:31.354690051 +0530
-@@ -257,7 +257,11 @@ struct iscsi_conn {
- 	struct timer_list nop_timer;
- 
- 	struct iscsi_cmnd *read_cmnd;
+diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c iscsitarget-1.4.20.3+svn502/kernel/nthread.c
+--- iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c	2014-05-06 13:59:55.000000000 -0700
++++ iscsitarget-1.4.20.3+svn502/kernel/nthread.c	2017-01-18 23:45:03.291033881 -0800
+@@ -42,9 +42,14 @@ static inline void iscsi_conn_init_read(
+ 	len = (len + 3) & -4; // XXX ???
+ 	conn->read_iov[0].iov_base = data;
+ 	conn->read_iov[0].iov_len = len;
++#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0)
+ 	conn->read_msg.msg_iov = conn->read_iov;
+ 	conn->read_msg.msg_iovlen = 1;
++#endif /* LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0) */
+ 	conn->read_size = (len + 3) & -4;
 +#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
-+	struct user_msghdr read_msg;
-+#else
- 	struct msghdr read_msg;
++	iov_iter_init(&conn->read_msg.msg_iter, READ, conn->read_iov, 1, conn->read_size);
 +#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
- 	struct iovec read_iov[ISCSI_CONN_IOV_MAX];
- 	u32 read_size;
- 	u32 read_overflow;
---- iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c	2015-08-24 16:13:26.481924679 +0530
-+++ iscsitarget-1.4.20.3+svn502/kernel/nthread.c	2015-08-24 17:41:56.187428925 +0530
-@@ -80,8 +80,11 @@ static int is_data_available(struct iscs
- 	set_fs(oldfs);
- 	return (res >= 0) ? avail : res;
  }
--
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
-+static void forward_iov(struct user_msghdr *msg, int len)
-+#else
+ 
+ static void iscsi_conn_read_ahs(struct iscsi_conn *conn, struct iscsi_cmnd *cmnd)
+@@ -83,14 +88,31 @@ static int is_data_available(struct iscs
+ 
  static void forward_iov(struct msghdr *msg, int len)
-+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
  {
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
++	struct iovec *iov;
++
++	while (msg->msg_iter.iov->iov_len <= len) {
++		len -= msg->msg_iter.iov->iov_len;
++		msg->msg_iter.iov++;
++		msg->msg_iter.nr_segs--;
++	}
++#else
  	while (msg->msg_iov->iov_len <= len) {
  		len -= msg->msg_iov->iov_len;
-@@ -96,7 +99,11 @@ static void forward_iov(struct msghdr *m
- static int do_recv(struct iscsi_conn *conn, int state)
- {
- 	mm_segment_t oldfs;
+ 		msg->msg_iov++;
+ 		msg->msg_iovlen--;
+ 	}
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
+ 
 +#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
-+	struct user_msghdr msg;
++	/* XXX: discards const ... */
++	iov = msg->msg_iter.iov;
++	iov->iov_base = (char *) msg->msg_iter.iov->iov_base + len;
++	iov->iov_len -= len;
 +#else
+ 	msg->msg_iov->iov_base = (char *) msg->msg_iov->iov_base + len;
+ 	msg->msg_iov->iov_len -= len;
++#endif	/* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
+ }
+ 
+ static int do_recv(struct iscsi_conn *conn, int state)
+@@ -98,6 +120,9 @@ static int do_recv(struct iscsi_conn *co
+ 	mm_segment_t oldfs;
  	struct msghdr msg;
-+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
  	struct iovec iov[ISCSI_CONN_IOV_MAX];
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
++	size_t iovlen = ISCSI_CONN_IOV_MAX;
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
  	int i, len, res;
  
-@@ -461,7 +468,11 @@ static void exit_tx(struct iscsi_conn *c
- static int tx_ddigest(struct iscsi_cmnd *cmnd, int state)
- {
- 	int res, rest = cmnd->conn->write_size;
+ 	if (!test_bit(CONN_ACTIVE, &conn->state)) {
+@@ -110,12 +135,23 @@ static int do_recv(struct iscsi_conn *co
+ 		goto out;
+ 	}
+ 
 +#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
-+	struct user_msghdr msg = {.msg_flags = MSG_NOSIGNAL | MSG_DONTWAIT};
++	if (conn->read_msg.msg_iter.nr_segs < iovlen)
++		iovlen = conn->read_msg.msg_iter.nr_segs;
++
++	for (i = 0, len = 0; i < iovlen; i++) {
++		iov[i] = conn->read_msg.msg_iter.iov[i];
++		len += iov[i].iov_len;
++	}
++	iov_iter_init(&msg.msg_iter, READ, iov, iovlen, len);
 +#else
- 	struct msghdr msg = {.msg_flags = MSG_NOSIGNAL | MSG_DONTWAIT};
+ 	msg.msg_iov = iov;
+ 	msg.msg_iovlen = min_t(size_t, conn->read_msg.msg_iovlen, ISCSI_CONN_IOV_MAX);
+ 	for (i = 0, len = 0; i < msg.msg_iovlen; i++) {
+ 		iov[i] = conn->read_msg.msg_iov[i];
+ 		len += iov[i].iov_len;
+ 	}
 +#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
- 	struct kvec iov;
  
- 	iov.iov_base = (char *) (&cmnd->ddigest) + (sizeof(u32) - rest);
---- iscsitarget-1.4.20.3+svn502_org/kernel/target_disk.c	2015-08-24 16:13:26.481924679 +0530
-+++ iscsitarget-1.4.20.3+svn502/kernel/target_disk.c	2015-08-24 17:43:42.167625159 +0530
+ 	oldfs = get_fs();
+ 	set_fs(get_ds());
+diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/target_disk.c iscsitarget-1.4.20.3+svn502/kernel/target_disk.c
+--- iscsitarget-1.4.20.3+svn502_org/kernel/target_disk.c	2014-05-06 13:59:55.000000000 -0700
++++ iscsitarget-1.4.20.3+svn502/kernel/target_disk.c	2017-01-18 23:45:51.451010417 -0800
 @@ -606,7 +606,11 @@ static int disk_execute_cmnd(struct iscs
  	case REQUEST_SENSE:
  		send_data_rsp(cmnd, build_request_sense_response);
@@ -166,17 +294,18 @@ Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
 +	case SERVICE_ACTION_IN_16:
 +#else
  	case SERVICE_ACTION_IN:
-+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */	
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
  		send_data_rsp(cmnd, build_service_action_in_response);
  		break;
  	case READ_6:
---- iscsitarget-1.4.20.3+svn502_org/kernel/volume.c	2015-08-24 16:13:26.477924674 +0530
-+++ iscsitarget-1.4.20.3+svn502/kernel/volume.c	2015-08-24 18:28:15.697074780 +0530
+diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/volume.c iscsitarget-1.4.20.3+svn502/kernel/volume.c
+--- iscsitarget-1.4.20.3+svn502_org/kernel/volume.c	2014-05-06 13:59:55.000000000 -0700
++++ iscsitarget-1.4.20.3+svn502/kernel/volume.c	2017-01-18 23:47:07.957561600 -0800
 @@ -398,7 +398,11 @@ int is_volume_reserved(struct iet_volume
  		case READ_CAPACITY:
  			/* allowed commands when reserved */
  			break;
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)			
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
 +		case SERVICE_ACTION_IN_16:
 +#else
  		case SERVICE_ACTION_IN:
-- 
2.7.4


