Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 60A997545D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jul 2018 03:11:28 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id q11-v6so1329196oic.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jul 2018 20:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GT78axXDtL8X82FXu0UicuQ1bd8BHZMqsLUQnu1UHmA=;
	b=iyh1I1rfpD495Oit+QHERpQp0CFxUgggadWSgDZiLDLGHkb+P+5HKdiwRkn94KrdQv
	5jORJgVN9mq+9bcWp9Z4V7S4hG4xxiV1QMfEzvPXx5ycCC0u1igcr3ln9seJdWaroeUi
	/eGqdi7Vqo0/Ioz+q60tZhKEdKKW3cedMNuBAbBDm5sY+L4bIw0Y2mnCJUBQY5UO3qT/
	MOslbtlWa/8zbeujXUK6gBxulsQqEpeHQHUQBUKJcM3r41zCUjSWE/p957TUHOkF7phw
	qSbm/T2Nbk91N97h/9xS5FMn+I7CSiwMRyisfjnBUTLQRft4NhJjUHb+naPwkyr4sjEX
	ub8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GT78axXDtL8X82FXu0UicuQ1bd8BHZMqsLUQnu1UHmA=;
	b=Trgjr3TVXylE357zbWkeeKwxhrtQujjG+eES5/DCXzVlDLyufsIXOTgRK1XswxFqgF
	6svL5xnTeSXuqy2dJQuPM0aNgbmjJe3r9t0HyNBWC9IE6O0rgxtC8xr9AlwmDMvpLcvQ
	LznKR2oopVYHe9OdVg9NiiCSyw8Ji5Z8Sle7/EPQfY6H2fQ5Yqx2zUvhAeHJ7yeqAznN
	t9IpOr0wsUJlUhuazPdbmeYqr3qPaIvEDRBGBL/Z3meM2dHG78dgqxDUTDfXo08u/K72
	CgsBJ6MsEDexUCSxx22tFLaHD2RGKxUeXu4CMqu3byjmNBGZzu+sYw1tUie51mkNBE6m
	/Lhg==
X-Gm-Message-State: APt69E0RbXS+NDzHqaUJYLwAM5tMlf+riBRj97xIn+TJmVd35gwOu4U5
	+Ym4M+4kTXx2xFy31OEcpN7fhge3puju/1q/OdjEaA==
X-Google-Smtp-Source: AAOMgpf6TrpPFzd/N+yDgGHjy+dVB20b3hbTOBCo/o0AA01YWL3shMo/M/H1P8zVPj4Y57Gek910uzsdMvIaH2v7o3k=
X-Received: by 2002:aca:b7c3:: with SMTP id
	h186-v6mr12967605oif.54.1530933088888; 
	Fri, 06 Jul 2018 20:11:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:2b21:0:0:0:0:0 with HTTP;
	Fri, 6 Jul 2018 20:11:28 -0700 (PDT)
In-Reply-To: <c6e12a2d-318b-9a36-35a9-d1e2d4971632@gmail.com>
References: <1530898405-20569-1-git-send-email-jkrishnanjanappa@mvista.com>
	<c6e12a2d-318b-9a36-35a9-d1e2d4971632@gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Date: Sat, 7 Jul 2018 08:41:28 +0530
Message-ID: <CAD3vsf5bcX3-y+aW1Zgk_isxzAW_ePwoNVX_N_qgRCSe5wQvng@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH][master][sumo] iscsitarget: Remove recipe as it is no longer supported to build with linux kernel >= 4.14
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
X-List-Received-Date: Sat, 07 Jul 2018 03:11:28 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Armin,

On 07/06/2018 10:33 AM, Jagadeesh Krishnanjanappa wrote:
> > The upstream iscsitarget source does not have support to build
> > with Linux kernel >= 4.14, as the "struct bio" members has been updated
> > in the linux kernel v4.14 source. Requires major code change in
> > iscsitarget to support building later versions of Linux kernel.
> >
> > The Linux SCSI target framework (tgt) recipe present in meta-openstack
> > layer, can be used as a substitute to iscsitarget recipe and works fine
> > in our testing.
> Why not port the tft to meta-openembeded then ?
>
> Do you mean migrate tgt recipe from meta-openstack layer to
meta-networking layer?
If yes, I can submit the patch for that.

I wont remove blacklisted packages from a stable release. It will still
> work on kernels < 4.14  with is still in sumo core.
>
> Agree. Would it be taken for Thud (2.6) release?

Regards,
Jagadeesh


> - armin
> >
> > Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > ---
> >  ...vent-netlink_ack-now-requires-4-arguments.patch |  40 --
> >  .../access-sk_v6_daddr-iff-IPV6-defined.patch      |  28 --
> >  ...pdated_bio_struct_of_linux_v4.3_and_above.patch | 108 -----
> >  ...pdated_interfaces_of_linux_v4.8_and_above.patch | 475
> ---------------------
> >  .../fix-call-trace-of-ahash-API-calling.patch      |  85 ----
> >  ...rors-observed-with-linux-3.19-and-greater.patch | 327 --------------
> >  ...use-kernel-makefile-to-get-kernel-version.patch |  67 ---
> >  .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  64 ---
> >  8 files changed, 1194 deletions(-)
> >  delete mode 100644 meta-networking/recipes-extended/iscsitarget/files/
> 0001-kernel-event-netlink_ack-now-requires-4-arguments.patch
> >  delete mode 100644 meta-networking/recipes-extended/iscsitarget/files/
> access-sk_v6_daddr-iff-IPV6-defined.patch
> >  delete mode 100644 meta-networking/recipes-extended/iscsitarget/files/
> build_with_updated_bio_struct_of_linux_v4.3_and_above.patch
> >  delete mode 100644 meta-networking/recipes-extended/iscsitarget/files/
> build_with_updated_interfaces_of_linux_v4.8_and_above.patch
> >  delete mode 100644 meta-networking/recipes-extended/iscsitarget/files/
> fix-call-trace-of-ahash-API-calling.patch
> >  delete mode 100644 meta-networking/recipes-extended/iscsitarget/files/
> fix-errors-observed-with-linux-3.19-and-greater.patch
> >  delete mode 100644 meta-networking/recipes-extended/iscsitarget/files/
> use-kernel-makefile-to-get-kernel-version.patch
> >  delete mode 100644 meta-networking/recipes-extended/iscsitarget/
> iscsitarget_1.4.20.3+svn502.bb
> >
> > diff --git a/meta-networking/recipes-extended/iscsitarget/files/
> 0001-kernel-event-netlink_ack-now-requires-4-arguments.patch
> b/meta-networking/recipes-extended/iscsitarget/files/
> 0001-kernel-event-netlink_ack-now-requires-4-arguments.patch
> > deleted file mode 100644
> > index 4426d35..0000000
> > --- a/meta-networking/recipes-extended/iscsitarget/files/
> 0001-kernel-event-netlink_ack-now-requires-4-arguments.patch
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -From cbc5f8151017f45231b75a826f18354a81c287c4 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sat, 26 Aug 2017 07:52:59 -0700
> > -Subject: [PATCH] kernel/event: netlink_ack() now requires 4 arguments
> > -
> > -see https://patchwork.kernel.org/patch/9670181/
> > -
> > -event.c:32:4: error: too few arguments to function 'netlink_ack'
> > -|     netlink_ack(skb, nlh, 0);
> > -|     ^~~~~~~~~~~
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - kernel/event.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -Index: iscsitarget-1.4.20.3+svn502/kernel/event.c
> > -===================================================================
> > ---- iscsitarget-1.4.20.3+svn502.orig/kernel/event.c
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/event.c
> > -@@ -6,6 +6,7 @@
> > -  * Some functions are based on audit code.
> > -  */
> > -
> > -+#include <linux/version.h>
> > - #include <linux/module.h>
> > - #include <net/tcp.h>
> > - #include "iet_u.h"
> > -@@ -29,7 +30,11 @@ static void event_recv_skb(struct sk_buf
> > -             ietd_pid = NETLINK_CB(skb).portid;
> > -             WARN_ON(ietd_pid == 0);
> > -             if (nlh->nlmsg_flags & NLM_F_ACK)
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0)
> > -+                    netlink_ack(skb, nlh, 0, NULL);
> > -+#else
> > -                     netlink_ack(skb, nlh, 0);
> > -+#endif
> > -             skb_pull(skb, rlen);
> > -     }
> > - }
> > diff --git a/meta-networking/recipes-extended/iscsitarget/files/
> access-sk_v6_daddr-iff-IPV6-defined.patch b/meta-networking/recipes-
> extended/iscsitarget/files/access-sk_v6_daddr-iff-IPV6-defined.patch
> > deleted file mode 100644
> > index 4444234..0000000
> > --- a/meta-networking/recipes-extended/iscsitarget/files/
> access-sk_v6_daddr-iff-IPV6-defined.patch
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -The element skc_v6_daddr (in struct sock_common) is defined in
> > -kernel source only when CONFIG_IPV6 is enabled. Hence, access
> > -sk_v6_daddr element (i.e __sk_common.skc_v6_daddr) only when
> CONFIG_IPV6
> > -is defined; to fix below error in world build:
> > -
> > --- snip --
> > -/home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/
> qemux86/kernel-source/include/net/sock.h:330:33: error: 'struct
> sock_common' has no member named 'skc_v6_daddr'
> > --- CUT --
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > -
> > ---- iscsitarget-1.4.20.3+svn502_org/kernel/conn.c    2015-12-29
> 21:57:50.547932217 -0800
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/conn.c        2015-12-29
> 22:47:25.254657627 -0800
> > -@@ -46,10 +46,12 @@ void conn_info_show(struct seq_file *seq
> > -                     snprintf(buf, sizeof(buf),
> > -                              "%pI4", &inet_sk(sk)->inet_daddr);
> > -                     break;
> > -+#if defined(CONFIG_IPV6)
> > -             case AF_INET6:
> > -                     snprintf(buf, sizeof(buf), "[%pI6]",
> > -                              &(sk)->sk_v6_daddr);
> > -                     break;
> > -+#endif /* defined(CONFIG_IPV6) */
> > -             default:
> > -                     break;
> > -             }
> > diff --git a/meta-networking/recipes-extended/iscsitarget/files/
> build_with_updated_bio_struct_of_linux_v4.3_and_above.patch
> b/meta-networking/recipes-extended/iscsitarget/files/
> build_with_updated_bio_struct_of_linux_v4.3_and_above.patch
> > deleted file mode 100644
> > index bce38ba..0000000
> > --- a/meta-networking/recipes-extended/iscsitarget/files/
> build_with_updated_bio_struct_of_linux_v4.3_and_above.patch
> > +++ /dev/null
> > @@ -1,108 +0,0 @@
> > -Description: Fix source to compile with 4.3+ kernels
> > -  commit 4246a0b63bd8f56a1469b12eafeb875b1041a451
> > -    block: add a bi_error field to struct bio
> > -  -> Removes BIO_UPTODATE and error argument to bio_endio.
> > -  commit b54ffb73cadcdcff9cc1ae0e11f502407e3e2e4c
> > -    block: remove bio_get_nr_vecs()
> > -  -> Removed that call (always use BIO_MAX_PAGES)
> > -  commit 676d23690fb62b5d51ba5d659935e9f7d9da9f8e
> > -    net: Fix use after free by removing length arg from sk_data_ready
> callbacks.
> > -  -> Removes len argument from sk_data_ready() callback.
> > -Author: Stefan Bader <stefan.bader@canonical.com>
> > -
> > -The original patch is at http://launchpadlibrarian.net/
> 227478885/iscsitarget_1.4.20.3+svn502-2ubuntu2_1.4.20.3+
> svn502-2ubuntu3.diff.gz,
> > -those changes were taken using #ifs to allow compilation of iscsitarget
> > -package with kernel versions < 4.3.
> > -
> > -Upstream-Status: Submitted [http://launchpadlibrarian.
> net/227478885/iscsitarget_1.4.20.3+svn502-2ubuntu2_1.4.20.3+
> svn502-2ubuntu3.diff.gz]
> > -
> > -Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > -
> > -diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c
> iscsitarget-1.4.20.3+svn502/kernel/block-io.c
> > ---- iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c
> 2014-05-06 13:59:55.000000000 -0700
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/block-io.c    2017-01-19
> 00:46:28.263951115 -0800
> > -@@ -29,14 +29,23 @@ struct tio_work {
> > -     struct completion tio_complete;
> > - };
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
> > -+static void blockio_bio_endio(struct bio *bio)
> > -+#else
> > - static void blockio_bio_endio(struct bio *bio, int error)
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */
> > - {
> > -     struct tio_work *tio_work = bio->bi_private;
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
> > -+    if (bio->bi_error)
> > -+            atomic_set(&tio_work->error, bio->bi_error);
> > -+#else
> > -     error = test_bit(BIO_UPTODATE, &bio->bi_flags) ? error : -EIO;
> > -
> > -     if (error)
> > -             atomic_set(&tio_work->error, error);
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */
> > -
> > -     /* If last bio signal completion */
> > -     if (atomic_dec_and_test(&tio_work->bios_remaining))
> > -@@ -61,14 +70,20 @@ blockio_make_request(struct iet_volume *
> > -     u32 size = tio->size;
> > -     u32 tio_index = 0;
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
> > -+    int max_pages = bdev_q ? BIO_MAX_PAGES : 1;
> > -+#else
> > -     int max_pages = 1;
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */
> > -     int err = 0;
> > -
> > -     loff_t ppos = tio->offset;
> > -
> > -+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 3, 0)
> > -     /* Calculate max_pages for bio_alloc (memory saver) */
> > -     if (bdev_q)
> > -             max_pages = bio_get_nr_vecs(bio_data->bdev);
> > -+#endif /* LINUX_VERSION_CODE < KERNEL_VERSION(4, 3, 0) */
> > -
> > -     tio_work = kzalloc(sizeof (*tio_work), GFP_KERNEL);
> > -     if (!tio_work)
> > -diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/conn.c
> iscsitarget-1.4.20.3+svn502/kernel/conn.c
> > ---- iscsitarget-1.4.20.3+svn502_org/kernel/conn.c    2017-01-19
> 00:39:09.737117778 -0800
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/conn.c        2017-01-19
> 00:52:30.037223901 -0800
> > -@@ -89,13 +89,21 @@ static void iet_state_change(struct sock
> > -     target->nthread_info.old_state_change(sk);
> > - }
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
> > -+static void iet_data_ready(struct sock *sk)
> > -+#else
> > - static void iet_data_ready(struct sock *sk, int len)
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */
> > - {
> > -     struct iscsi_conn *conn = sk->sk_user_data;
> > -     struct iscsi_target *target = conn->session->target;
> > -
> > -     nthread_wakeup(target);
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
> > -+    target->nthread_info.old_data_ready(sk);
> > -+#else
> > -     target->nthread_info.old_data_ready(sk, len);
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */
> > - }
> > -
> > - /*
> > -diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h
> iscsitarget-1.4.20.3+svn502/kernel/iscsi.h
> > ---- iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h   2014-05-06
> 13:59:55.000000000 -0700
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/iscsi.h       2017-01-19
> 00:48:02.102837260 -0800
> > -@@ -81,7 +81,11 @@ struct network_thread_info {
> > -     spinlock_t nthread_lock;
> > -
> > -     void (*old_state_change)(struct sock *);
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
> > -+    void (*old_data_ready)(struct sock *);
> > -+#else
> > -     void (*old_data_ready)(struct sock *, int);
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */
> > -     void (*old_write_space)(struct sock *);
> > - };
> > -
> > diff --git a/meta-networking/recipes-extended/iscsitarget/files/
> build_with_updated_interfaces_of_linux_v4.8_and_above.patch
> b/meta-networking/recipes-extended/iscsitarget/files/
> build_with_updated_interfaces_of_linux_v4.8_and_above.patch
> > deleted file mode 100644
> > index e508a5e..0000000
> > --- a/meta-networking/recipes-extended/iscsitarget/files/
> build_with_updated_interfaces_of_linux_v4.8_and_above.patch
> > +++ /dev/null
> > @@ -1,475 +0,0 @@
> > -Resolve build error with linux kernel 4.8
> > -
> > -The below changes in kernel source, triggered iscsitarget
> > -build fail with linux kernel v4.8.
> > -
> > -1. An extra 'flags' argument has been passed to vfs_readv/vfs_writev
> > -   syscalls in v4.8. So, set this argument to "0" for now
> > -   (as there is no real need for that).
> > -   Ref: https://github.com/torvalds/linux/commit/
> 793b80ef14af56d20c998265287648ad34239b6f
> > -   Solves:
> > -   -- snip --
> > -TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3
> +svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/nthread.c: In function
> 'write_data':
> > -TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3
> +svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/nthread.c:350:9: error: too
> few arguments to function 'vfs_writev'
> > -   res = vfs_writev(file, (struct iovec __user *) iop, count, &off);
> > -         ^~~~~~~~~~
> > -   -- snip --
> > -
> > -2. Redefine dropped PAGE_CACHE_* and page_cache_{get,release}
> definitions,
> > -   as they have been dropped with v4.8
> > -   Ref: https://github.com/torvalds/linux/commit/
> 1fa64f198b9f8d6ec0f7aec7c18dc94684391140
> > -   Solves:
> > -   -- snip --
> > -TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3
> +svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/param.c: In function
> 'sess_param_check':
> > -TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3
> +svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/param.c:48:41: error:
> 'PAGE_CACHE_SIZE' undeclared (first use in this function)
> > -       (u32) ((ISCSI_CONN_IOV_MAX - 1) * PAGE_CACHE_SIZE));
> > -                                         ^
> > -   -- snip --
> > -
> > -3. Replace crypto_hash interfaces with crypto_ahash interfaces,
> > -   Ref: https://github.com/torvalds/linux/commit/
> 896545098777564212b9e91af4c973f094649aa7
> > -   Ref: https://www.redhat.com/archives/dm-devel/2016-
> January/msg00244.html
> > -   Solves:
> > -   -- snip --
> > -TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3
> +svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/digest.c: In function
> 'digest_init':
> > -TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3
> +svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/digest.c:42:23: error:
> implicit declaration of function 'crypto_alloc_hash'
> [-Werror=implicit-function-declaration]
> > -   conn->rx_hash.tfm = crypto_alloc_hash("crc32c", 0,
> > -                       ^~~~~~~~~~~~~~~~~
> > -TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3
> +svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/digest.c: In function
> 'digest_cleanup':
> > -TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3
> +svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/digest.c:77:3: error:
> implicit declaration of function 'crypto_free_hash'
> [-Werror=implicit-function-declaration]
> > -   crypto_free_hash(conn->tx_hash.tfm);
> > -   ^~~~~~~~~~~~~~~~
> > -   -- snip --
> > -
> > -4. The earlier "rw" parameter has been set in "bi_rw" within
> > -   bio structure, hence remove "rw" argument.
> > -   Ref: https://github.com/torvalds/linux/commit/
> 4e49ea4a3d276365bf7396c9b77b4d1d5923835a
> > -   Solves:
> > --- snip --
> > -TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3
> +svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/block-io.c:140:14: warning:
> passing argument 1 of 'submit_bio' makes pointer from integer without a
> cast [-Wint-conversion]
> > -   submit_bio(rw, bio);
> > -              ^~
> > --- snip --
> > -
> > -5. The 'len' argument from sk_data_ready() callback has been removed in
> > -   linux kernel v4.3 and above.
> > -   Ref: https://github.com/torvalds/linux/commit/
> 676d23690fb62b5d51ba5d659935e9f7d9da9f8e
> > -   Solves:
> > --- snip --
> > -TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3
> +svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c: In function
> 'iet_socket_bind':
> > -TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3
> +svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c:143:38: error:
> assignment from incompatible pointer type [-Werror=incompatible-pointer-
> types]
> > -  target->nthread_info.old_data_ready = conn->sock->sk->sk_data_ready;
> > -                                      ^
> > -TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3
> +svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c:144:32: error:
> assignment from incompatible pointer type [-Werror=incompatible-pointer-
> types]
> > -  conn->sock->sk->sk_data_ready = iet_data_ready;
> > -                                ^
> > --- snip --
> > -
> > -6.
> > -   A. The "size" argument has been dropped from sock_recvmsg syscall in
> v4.8,
> > -      as all callers have it equal to msg_data_left(msg).
> > -   B. 'struct user_msghdr' is being used for userland-side msghdr
> instead
> > -      of 'struct msghdr', which is used for kernel-side msghdr in linux
> v3.19
> > -      and above, so typecase it while calling sock_recvmsg syscall.
> > -   Ref: https://github.com/torvalds/linux/commit/
> 2da62906b1e298695e1bb725927041cd59942c98
> > -        https://github.com/torvalds/linux/commit/
> 666547ff591cebdedc4679bf6b1b3f3383a8dea3
> > -   Solves:
> > -   -- snip --
> > -TOPDIR/tmp-glibc/work-shared/qemux86/kernel-source/include/linux/net.h:222:5:
> note: expected 'struct msghdr *' but argument is of type 'struct
> user_msghdr *'
> > - int sock_recvmsg(struct socket *sock, struct msghdr *msg, int flags);
> > -     ^~~~~~~~~~~~
> > -TOPDIR/tmp-glibc/work/qemux86-oe-linux/iscsitarget/1.4.20.3
> +svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/nthread.c:129:8: error: too
> many arguments to function 'sock_recvmsg'
> > -  res = sock_recvmsg(conn->sock, &msg, len, MSG_DONTWAIT |
> MSG_NOSIGNAL);
> > -        ^~~~~~~~~~~~
> > -   -- snip --
> > -
> > -Detailed error log is at: http://errors.yoctoproject.
> org/Errors/Details/83334/
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > -
> > -diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c
> iscsitarget-1.4.20.3+svn502/kernel/block-io.c
> > ---- iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c
> 2017-01-19 20:19:27.400507354 -0800
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/block-io.c    2017-01-19
> 20:32:22.977988593 -0800
> > -@@ -104,7 +104,11 @@ blockio_make_request(struct iet_volume *
> > -             /* bi_sector is ALWAYS in units of 512 bytes */
> > -             bio->bi_iter.bi_sector = ppos >> 9;
> > -             bio->bi_bdev = bio_data->bdev;
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+            bio->bi_end_io = (bio_end_io_t *) blockio_bio_endio;
> > -+#else
> > -             bio->bi_end_io = blockio_bio_endio;
> > -+#endif
> > -             bio->bi_private = tio_work;
> > -
> > -             if (tio_bio)
> > -@@ -139,7 +143,12 @@ blockio_make_request(struct iet_volume *
> > -             tio_bio = tio_bio->bi_next;
> > -             bio->bi_next = NULL;
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+            bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
> > -+            submit_bio(bio);
> > -+#else
> > -             submit_bio(rw, bio);
> > -+#endif
> > -     }
> > -
> > -     blk_finish_plug(&plug);
> > -diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/conn.c
> iscsitarget-1.4.20.3+svn502/kernel/conn.c
> > ---- iscsitarget-1.4.20.3+svn502_org/kernel/conn.c    2017-01-19
> 20:19:27.400507354 -0800
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/conn.c        2017-01-19
> 20:32:22.978988614 -0800
> > -@@ -148,8 +148,14 @@ static void iet_socket_bind(struct iscsi
> > -     target->nthread_info.old_state_change = conn->sock->sk->sk_state_
> change;
> > -     conn->sock->sk->sk_state_change = iet_state_change;
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    target->nthread_info.old_data_ready = (void (*) (struct sock *)) \
> > -+
> conn->sock->sk->sk_data_ready;
> > -+    conn->sock->sk->sk_data_ready = (void (*) (struct sock *))
> iet_data_ready;
> > -+#else
> > -     target->nthread_info.old_data_ready =
> conn->sock->sk->sk_data_ready;
> > -     conn->sock->sk->sk_data_ready = iet_data_ready;
> > -+#endif
> > -
> > -     target->nthread_info.old_write_space = conn->sock->sk->sk_write_
> space;
> > -     conn->sock->sk->sk_write_space = iet_write_space;
> > -diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/digest.c
> iscsitarget-1.4.20.3+svn502/kernel/digest.c
> > ---- iscsitarget-1.4.20.3+svn502_org/kernel/digest.c  2014-05-06
> 13:59:55.000000000 -0700
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/digest.c      2017-01-19
> 20:32:22.978988614 -0800
> > -@@ -30,6 +30,9 @@ void digest_alg_available(unsigned int *
> > - int digest_init(struct iscsi_conn *conn)
> > - {
> > -     int err = 0;
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    struct crypto_ahash *tfm;
> > -+#endif
> > -
> > -     if (!(conn->hdigest_type & DIGEST_ALL))
> > -             conn->hdigest_type = DIGEST_NONE;
> > -@@ -39,15 +42,40 @@ int digest_init(struct iscsi_conn *conn)
> > -
> > -     if (conn->hdigest_type & DIGEST_CRC32C ||
> > -         conn->ddigest_type & DIGEST_CRC32C) {
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+            tfm = crypto_alloc_ahash("crc32c", 0, CRYPTO_ALG_ASYNC);
> > -+            if (IS_ERR(tfm)) {
> > -+                    tfm = NULL;
> > -+#else
> > -             conn->rx_hash.tfm = crypto_alloc_hash("crc32c", 0,
> > -                                                   CRYPTO_ALG_ASYNC);
> > -             conn->rx_hash.flags = 0;
> > -             if (IS_ERR(conn->rx_hash.tfm)) {
> > -                     conn->rx_hash.tfm = NULL;
> > -+#endif
> > -                     err = -ENOMEM;
> > -                     goto out;
> > -             }
> > --
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+            conn->rx_hash = ahash_request_alloc(tfm, GFP_KERNEL);
> > -+            if (!conn->rx_hash) {
> > -+                    pr_err("ahash_request_alloc() failed for
> conn->rx_hash\n");
> > -+                    crypto_free_ahash(tfm);
> > -+                    err = -ENOMEM;
> > -+                    goto out;
> > -+            }
> > -+            ahash_request_set_callback(conn->rx_hash, 0, NULL, NULL);
> > -+            conn->tx_hash = ahash_request_alloc(tfm, GFP_KERNEL);
> > -+            if(!conn->tx_hash) {
> > -+                    pr_err("ahash_request_alloc() failed for
> conn->tx_hash\n");
> > -+                    ahash_request_free(conn->rx_hash);
> > -+                    conn->rx_hash = NULL;
> > -+                    crypto_free_ahash(tfm);
> > -+                    err = -ENOMEM;
> > -+                    goto out;
> > -+            }
> > -+            ahash_request_set_callback(conn->tx_hash, 0, NULL, NULL);
> > -+#else
> > -             conn->tx_hash.tfm = crypto_alloc_hash("crc32c", 0,
> > -                                                   CRYPTO_ALG_ASYNC);
> > -             conn->tx_hash.flags = 0;
> > -@@ -56,6 +84,7 @@ int digest_init(struct iscsi_conn *conn)
> > -                     err = -ENOMEM;
> > -                     goto out;
> > -             }
> > -+#endif
> > -     }
> > -
> > - out:
> > -@@ -73,10 +102,21 @@ out:
> > -  */
> > - void digest_cleanup(struct iscsi_conn *conn)
> > - {
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    ahash_request_free(conn->tx_hash);
> > -+    if (conn->rx_hash) {
> > -+            struct crypto_ahash *tfm;
> > -+            tfm = crypto_ahash_reqtfm(conn->rx_hash);
> > -+            ahash_request_free(conn->rx_hash);
> > -+            crypto_free_ahash(tfm);
> > -+    }
> > -+
> > -+#else
> > -     if (conn->tx_hash.tfm)
> > -             crypto_free_hash(conn->tx_hash.tfm);
> > -     if (conn->rx_hash.tfm)
> > -             crypto_free_hash(conn->rx_hash.tfm);
> > -+#endif
> > - }
> > -
> > - /**
> > -@@ -160,8 +200,13 @@ static inline void __dbg_simulate_data_d
> > -     }
> > - }
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+static void digest_header(struct ahash_request *hash, struct iscsi_pdu
> *pdu,
> > -+                      u8 *crc)
> > -+#else
> > - static void digest_header(struct hash_desc *hash, struct iscsi_pdu
> *pdu,
> > -                       u8 *crc)
> > -+#endif
> > - {
> > -     struct scatterlist sg[2];
> > -     unsigned int nbytes = sizeof(struct iscsi_hdr);
> > -@@ -174,16 +219,27 @@ static void digest_header(struct hash_de
> > -             nbytes += pdu->ahssize;
> > -     }
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    crypto_ahash_init(hash);
> > -+    ahash_request_set_crypt(hash, sg, crc, nbytes);
> > -+    crypto_ahash_update(hash);
> > -+    crypto_ahash_digest(hash);
> > -+#else
> > -     crypto_hash_init(hash);
> > -     crypto_hash_update(hash, sg, nbytes);
> > -     crypto_hash_final(hash, crc);
> > -+#endif
> > - }
> > -
> > - int digest_rx_header(struct iscsi_cmnd *cmnd)
> > - {
> > -     u32 crc;
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    digest_header(cmnd->conn->rx_hash, &cmnd->pdu, (u8 *) &crc);
> > -+#else
> > -     digest_header(&cmnd->conn->rx_hash, &cmnd->pdu, (u8 *) &crc);
> > -+#endif
> > -     if (crc != cmnd->hdigest)
> > -             return -EIO;
> > -
> > -@@ -192,11 +248,20 @@ int digest_rx_header(struct iscsi_cmnd *
> > -
> > - void digest_tx_header(struct iscsi_cmnd *cmnd)
> > - {
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    digest_header(cmnd->conn->tx_hash, &cmnd->pdu, (u8 *)
> &cmnd->hdigest);
> > -+#else
> > -     digest_header(&cmnd->conn->tx_hash, &cmnd->pdu, (u8 *)
> &cmnd->hdigest);
> > -+#endif
> > - }
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+static void digest_data(struct ahash_request *hash, struct iscsi_cmnd
> *cmnd,
> > -+                    struct tio *tio, u32 offset, u8 *crc)
> > -+#else
> > - static void digest_data(struct hash_desc *hash, struct iscsi_cmnd
> *cmnd,
> > -                     struct tio *tio, u32 offset, u8 *crc)
> > -+#endif
> > - {
> > -     struct scatterlist *sg = cmnd->conn->hash_sg;
> > -     u32 size, length, npages;
> > -@@ -214,7 +279,11 @@ static void digest_data(struct hash_desc
> > -     BUG_ON(npages > ISCSI_CONN_IOV_MAX);
> > -
> > -     sg_init_table(sg, ARRAY_SIZE(cmnd->conn->hash_sg));
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    crypto_ahash_init(hash);
> > -+#else
> > -     crypto_hash_init(hash);
> > -+#endif
> > -
> > -     for (i = 0; size > 0; i++) {
> > -             length = min_t(u32, PAGE_CACHE_SIZE - offset, size);
> > -@@ -225,8 +294,14 @@ static void digest_data(struct hash_desc
> > -
> > -     sg_mark_end(&sg[i - 1]);
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    ahash_request_set_crypt(hash, sg, crc, nbytes);
> > -+    crypto_ahash_update(hash);
> > -+    crypto_ahash_digest(hash);
> > -+#else
> > -     crypto_hash_update(hash, sg, nbytes);
> > -     crypto_hash_final(hash, crc);
> > -+#endif
> > - }
> > -
> > - int digest_rx_data(struct iscsi_cmnd *cmnd)
> > -@@ -251,8 +326,11 @@ int digest_rx_data(struct iscsi_cmnd *cm
> > -             tio = cmnd->tio;
> > -             offset = 0;
> > -     }
> > --
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    digest_data(cmnd->conn->rx_hash, cmnd, tio, offset, (u8 *) &crc);
> > -+#else
> > -     digest_data(&cmnd->conn->rx_hash, cmnd, tio, offset, (u8 *) &crc);
> > -+#endif
> > -
> > -     if (!cmnd->conn->read_overflow &&
> > -         (cmnd_opcode(cmnd) != ISCSI_OP_PDU_REJECT)) {
> > -@@ -269,6 +347,11 @@ void digest_tx_data(struct iscsi_cmnd *c
> > -     struct iscsi_data_out_hdr *req = (struct iscsi_data_out_hdr
> *)&cmnd->pdu.bhs;
> > -
> > -     assert(tio);
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    digest_data(cmnd->conn->tx_hash, cmnd, tio,
> > -+                be32_to_cpu(req->buffer_offset), (u8 *)
> &cmnd->ddigest);
> > -+#else
> > -     digest_data(&cmnd->conn->tx_hash, cmnd, tio,
> > -                 be32_to_cpu(req->buffer_offset), (u8 *)
> &cmnd->ddigest);
> > -+#endif
> > - }
> > -diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h
> iscsitarget-1.4.20.3+svn502/kernel/iscsi.h
> > ---- iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h   2017-01-19
> 20:19:27.400507354 -0800
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/iscsi.h       2017-01-19
> 20:32:22.979988634 -0800
> > -@@ -14,6 +14,7 @@
> > - #include <linux/pagemap.h>
> > - #include <linux/seq_file.h>
> > - #include <linux/mm.h>
> > -+#include <crypto/hash.h>
> > - #include <linux/crypto.h>
> > - #include <linux/scatterlist.h>
> > - #include <net/sock.h>
> > -@@ -275,8 +276,13 @@ struct iscsi_conn {
> > -     u32 write_offset;
> > -     int write_state;
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    struct ahash_request *rx_hash;
> > -+    struct ahash_request *tx_hash;
> > -+#else
> > -     struct hash_desc rx_hash;
> > -     struct hash_desc tx_hash;
> > -+#endif
> > -     struct scatterlist hash_sg[ISCSI_CONN_IOV_MAX];
> > - };
> > -
> > -@@ -552,4 +558,10 @@ enum cmnd_flags {
> > - #define PRODUCT_ID  "VIRTUAL-DISK"
> > - #define PRODUCT_REV "0"
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+#define PAGE_CACHE_SHIFT    PAGE_SHIFT
> > -+#define PAGE_CACHE_SIZE     PAGE_SIZE
> > -+#define PAGE_CACHE_MASK     PAGE_MASK
> > -+#endif
> > -+
> > - #endif      /* __ISCSI_H__ */
> > -diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c
> iscsitarget-1.4.20.3+svn502/kernel/nthread.c
> > ---- iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c 2017-01-19
> 20:19:27.276504928 -0800
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/nthread.c     2017-01-19
> 20:32:22.979988634 -0800
> > -@@ -155,7 +155,12 @@ static int do_recv(struct iscsi_conn *co
> > -
> > -     oldfs = get_fs();
> > -     set_fs(get_ds());
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    res = sock_recvmsg(conn->sock, (struct msghdr *) &msg, \
> > -+                            MSG_DONTWAIT | MSG_NOSIGNAL);
> > -+#else
> > -     res = sock_recvmsg(conn->sock, &msg, len, MSG_DONTWAIT |
> MSG_NOSIGNAL);
> > -+#endif
> > -     set_fs(oldfs);
> > -
> > -     if (res <= 0) {
> > -@@ -376,7 +381,11 @@ static int write_data(struct iscsi_conn
> > -                     ;
> > -             oldfs = get_fs();
> > -             set_fs(KERNEL_DS);
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+            res = vfs_writev(file, (struct iovec __user *) iop, count,
> &off, 0);
> > -+#else
> > -             res = vfs_writev(file, (struct iovec __user *) iop, count,
> &off);
> > -+#endif
> > -             set_fs(oldfs);
> > -             dprintk(D_DATA, "%#Lx:%u: %d(%ld)\n",
> > -                     (unsigned long long) conn->session->sid, conn->cid,
> > -@@ -503,7 +512,11 @@ static int tx_ddigest(struct iscsi_cmnd
> > -     iov.iov_base = (char *) (&cmnd->ddigest) + (sizeof(u32) - rest);
> > -     iov.iov_len = rest;
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    res = kernel_sendmsg(cmnd->conn->sock, (struct msghdr *) &msg,
> &iov, 1, rest);
> > -+#else
> > -     res = kernel_sendmsg(cmnd->conn->sock, &msg, &iov, 1, rest);
> > -+#endif
> > -
> > -     if (res > 0) {
> > -             cmnd->conn->write_size -= res;
> > -@@ -702,7 +715,12 @@ static void close_conn(struct iscsi_conn
> > -
> > -     write_lock_bh(&conn->sock->sk->sk_callback_lock);
> > -     conn->sock->sk->sk_state_change = target->nthread_info.old_
> state_change;
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    conn->sock->sk->sk_data_ready = (void (*) (struct sock *)) \
> > -+                                    target->nthread_info.old_data_
> ready;
> > -+#else
> > -     conn->sock->sk->sk_data_ready = target->nthread_info.old_data_
> ready;
> > -+#endif
> > -     conn->sock->sk->sk_write_space = target->nthread_info.old_
> write_space;
> > -     write_unlock_bh(&conn->sock->sk->sk_callback_lock);
> > -
> > -diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/volume.c
> iscsitarget-1.4.20.3+svn502/kernel/volume.c
> > ---- iscsitarget-1.4.20.3+svn502_org/kernel/volume.c  2017-01-19
> 20:19:27.276504928 -0800
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/volume.c      2017-01-19
> 20:32:22.979988634 -0800
> > -@@ -84,12 +84,25 @@ static int set_scsisn(struct iet_volume
> > - /* Generate a MD5 hash of the target IQN and LUN number */
> > - static void gen_scsiid(struct iet_volume *volume)
> > - {
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    struct ahash_request *hash;
> > -+    struct crypto_ahash *tfm;
> > -+#else
> > -     struct hash_desc hash;
> > -+#endif
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    tfm = crypto_alloc_ahash("md5", 0, CRYPTO_ALG_ASYNC);
> > -+#else
> > -     hash.tfm = crypto_alloc_hash("md5", 0, CRYPTO_ALG_ASYNC);
> > -     hash.flags = 0;
> > -+#endif
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+    if (!IS_ERR(tfm)) {
> > -+#else
> > -     if (!IS_ERR(hash.tfm)) {
> > -+#endif
> > -             struct scatterlist sg[2];
> > -             unsigned int nbytes = 0;
> > -
> > -@@ -102,11 +115,19 @@ static void gen_scsiid(struct iet_volume
> > -             sg_set_buf(&sg[1], &volume->lun, sizeof(volume->lun));
> > -             nbytes += sizeof(volume->lun);
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -+            crypto_ahash_init(hash);
> > -+            ahash_request_set_crypt(hash, sg, volume->scsi_id, nbytes);
> > -+            crypto_ahash_update(hash);
> > -+            crypto_ahash_digest(hash);
> > -+            crypto_free_ahash(tfm);
> > -+#else
> > -             crypto_hash_init(&hash);
> > -             crypto_hash_update(&hash, sg, nbytes);
> > -             crypto_hash_final(&hash, volume->scsi_id);
> > -
> > -             crypto_free_hash(hash.tfm);
> > -+#endif
> > -     } else {
> > -             /* If no MD5 available set ID to TID and LUN */
> > -             memcpy(volume->scsi_id, &volume->target->tid,
> > diff --git a/meta-networking/recipes-extended/iscsitarget/files/
> fix-call-trace-of-ahash-API-calling.patch b/meta-networking/recipes-
> extended/iscsitarget/files/fix-call-trace-of-ahash-API-calling.patch
> > deleted file mode 100644
> > index c996834..0000000
> > --- a/meta-networking/recipes-extended/iscsitarget/files/
> fix-call-trace-of-ahash-API-calling.patch
> > +++ /dev/null
> > @@ -1,85 +0,0 @@
> > -The previous build_with_updated_interfaces_
> of_linux_v4.8_and_above.patch
> > -does not alloc struct ahash_request before using it. This will cause the
> > -kernel call trace below when calling gen_scsiid on kernel 4.8 or later
> > -version.
> > -
> > -This patch normalizes the calling of ahash API according to the example
> > -in kernel doc Documentation/crypto/api-intro.txt.
> > -
> > -BUG: unable to handle kernel NULL pointer dereference at
> 0000000000000020
> > -IP: [<ffffffffa0008d45>] volume_add+0x625/0x7f0 [iscsi_trgt]
> > -PGD dd77067 PUD dd7c067 PMD 0
> > -Oops: 0000 [#1] PREEMPT SMP
> > -Modules linked in: iscsi_trgt(O)
> > -CPU: 0 PID: 350 Comm: ietd Tainted: G           O
> 4.8.12-yocto-standard #1
> > -Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> rel-1.9.3-0-ge2fc41e-prebuilt.qemu-project.org 04/01/2014
> > -task: ffff88000dfe2c00 task.stack: ffff88000de88000
> > -RIP: 0010:[<ffffffffa0008d45>]  [<ffffffffa0008d45>]
> volume_add+0x625/0x7f0 [iscsi_trgt]
> > -RSP: 0018:ffff88000de8bd90  EFLAGS: 00000206
> > -RAX: 000000000000ddfa RBX: ffff88000ddd1d78 RCX: ffffea0000000000
> > -RDX: 0000000000000600 RSI: 0000000000000000 RDI: ffff88000ddd1c14
> > -RBP: ffff88000de8be38 R08: ffff88000de44180 R09: ffff88000de8bdd0
> > -R10: 000000000000002c R11: 0000000000000000 R12: ffff88000ddfa600
> > -R13: 0000000000000000 R14: 0000000000000000 R15: ffff88000de92200
> > -FS:  00007f767548b700(0000) GS:ffff88000fc00000(0000)
> knlGS:0000000000000000
> > -CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > -CR2: 0000000000000020 CR3: 000000000dd2d000 CR4: 00000000000006f0
> > -Stack:
> > - ffff88000de8bdd0 ffff88000dc1b3d0 ffff88000ddfa650 ffff88000ddfa660
> > - ffff88000df8f000 ffff88000ddd1c00 ffff88000de44180 0000000000000000
> > - ffffea0000377440 0000000f00000c14 0000000000000000 0000000000000000
> > -Call Trace:
> > - [<ffffffffa0006547>] ioctl+0x217/0x390 [iscsi_trgt]
> > - [<ffffffff81192574>] do_vfs_ioctl+0x94/0x5c0
> > - [<ffffffff8117ff73>] ? vfs_read+0xf3/0x120
> > - [<ffffffff81192b19>] SyS_ioctl+0x79/0x90
> > - [<ffffffff8191a45b>] entry_SYSCALL_64_fastpath+0x13/0x8f
> > -Code: 4c 01 e0 0f 82 a2 01 00 00 48 b9 00 00 00 80 ff 77 00 00 48 01
> > -c8 45 31 f6 48 b9 00 00 00 00 00 ea ff ff 89 54 24 68 48 c1 e8 0c <49>
> > -8b 56 20 4c 89 44 24 20 4c 89 f7 48 c1 e0 06 c7 44 24 6c 04
> > -RIP  [<ffffffffa0008d45>] volume_add+0x625/0x7f0 [iscsi_trgt]
> > - RSP <ffff88000de8bd90>
> > -CR2: 0000000000000020
> > -end trace cd2016297df21635 ]
> > -ietd_response_recv 200 0 -5
> > -Input/output error.
> > -
> > -Upstream-Status: Pending [This patch is based on the previous one which
> > -has not been merged upstream.]
> > -
> > -Signed-off-by: Zhe He <zhe.he@windriver.com>
> > -
> > ---- iscsitarget-1.4.20.3+svn502_orig/kernel/volume.c 2017-01-18
> 08:57:56.752187402 +0800
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/volume.c      2017-01-18
> 09:02:44.164195234 +0800
> > -@@ -93,13 +93,14 @@ static void gen_scsiid(struct iet_volume
> > -
> > - #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > -     tfm = crypto_alloc_ahash("md5", 0, CRYPTO_ALG_ASYNC);
> > -+    hash = ahash_request_alloc(tfm, GFP_ATOMIC);
> > - #else
> > -     hash.tfm = crypto_alloc_hash("md5", 0, CRYPTO_ALG_ASYNC);
> > -     hash.flags = 0;
> > - #endif
> > -
> > - #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > --    if (!IS_ERR(tfm)) {
> > -+    if (tfm && !IS_ERR(tfm)) {
> > - #else
> > -     if (!IS_ERR(hash.tfm)) {
> > - #endif
> > -@@ -116,10 +117,13 @@ static void gen_scsiid(struct iet_volume
> > -             nbytes += sizeof(volume->lun);
> > -
> > - #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0)
> > --            crypto_ahash_init(hash);
> > -+            ahash_request_set_callback(hash, 0, NULL, NULL);
> > -             ahash_request_set_crypt(hash, sg, volume->scsi_id, nbytes);
> > --            crypto_ahash_update(hash);
> > -             crypto_ahash_digest(hash);
> > -+            crypto_ahash_init(hash);
> > -+            crypto_ahash_update(hash);
> > -+            crypto_ahash_final(hash);
> > -+            ahash_request_free(hash);
> > -             crypto_free_ahash(tfm);
> > - #else
> > -             crypto_hash_init(&hash);
> > diff --git a/meta-networking/recipes-extended/iscsitarget/files/
> fix-errors-observed-with-linux-3.19-and-greater.patch
> b/meta-networking/recipes-extended/iscsitarget/files/
> fix-errors-observed-with-linux-3.19-and-greater.patch
> > deleted file mode 100644
> > index 1e6a1d6..0000000
> > --- a/meta-networking/recipes-extended/iscsitarget/files/
> fix-errors-observed-with-linux-3.19-and-greater.patch
> > +++ /dev/null
> > @@ -1,327 +0,0 @@
> > -Description: Fix source to compile on 3.19 kernels
> > -Author: Stefan Bader <stefan.bader@canonical.com>
> > -Forward: no
> > -
> > -Fixes below inconsistent crash when trying to login to iSCSI target
> > -server, observed with linux kernel v4.1.
> > -
> > --- snip --
> > -CPU: 1 PID: 29883 Comm: istd1 Tainted: G           O
> 4.1.35-rt40-yocto-standard #1
> > -Hardware name: To be filled by O.E.M. To be filled by O.E.M./Larne CRB,
> BIOS 4.6.5.4 09/18/2014
> > -task: ffff88020f1f30c0 ti: ffff8800d7f3c000 task.ti: ffff8800d7f3c000
> > -RIP: 0010:[<ffffffff8140d1ae>]  [<ffffffff8140d1ae>]
> copy_to_iter+0x3e/0x280
> > -RSP: 0018:ffff8800d7f3f728  EFLAGS: 00010246
> > -RAX: 00000000d7f3f928 RBX: 0000000000000030 RCX: 0000000000000030
> > -RDX: ffff8800d7f3f900 RSI: 0000000000000030 RDI: ffff8800d1501e82
> > -RBP: ffff8800d7f3f768 R08: 00000000c127d467 R09: 0000000000000000
> > -R10: ffff88020f29e118 R11: 0000000000000004 R12: ffff8800d7f3f900
> > -R13: 0000000000000030 R14: 0000000000000001 R15: 0000000000000246
> > -FS:  00007f86f9c4c700(0000) GS:ffff88021ec80000(0000)
> knlGS:00000000f7733700
> > -CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > -CR2: 000000000000024e CR3: 00000000d38b0000 CR4: 00000000000406e0
> > -Stack:
> > -ffff880214f14ec0 ffff8800d1501e82 ffff8800d7f3f748 0000000000000030
> > -ffff88020f122500 0000000000000030 0000000000000000 0000000000000030
> > -ffff8800d7f3f7c8 ffffffff81806981 ffff8800d7f3f798 ffffffff8105d72a
> > -Call Trace:
> > -[<ffffffff81806981>] skb_copy_datagram_iter+0x71/0x2b0
> > -[<ffffffff8105d72a>] ? __local_bh_enable_ip+0x4a/0xb0
> > -[<ffffffff8186c9c0>] tcp_recvmsg+0x5e0/0xbb0
> > -[<ffffffff81898ded>] inet_recvmsg+0x8d/0xb0
> > -[<ffffffff817f49f3>] sock_recvmsg+0x13/0x20
> > -[<ffffffffa01655c3>] do_recv+0xe3/0x1f0 [iscsi_trgt]
> > -[<ffffffff81153097>] ? __mod_zone_page_state+0x77/0xb0
> > -[<ffffffff81417613>] ? __this_cpu_preempt_check+0x13/0x20
> > -[<ffffffff81153097>] ? __mod_zone_page_state+0x77/0xb0
> > -[<ffffffff8140fed5>] ? find_next_bit+0x15/0x30
> > -[<ffffffff813fa8e0>] ? cpumask_next_and+0x30/0x50
> > -[<ffffffff8113f785>] ? __alloc_pages_nodemask+0x165/0x980
> > -[<ffffffff8107e370>] ? preempt_count_add+0xd0/0xf0
> > -[<ffffffff8195da8b>] ? _raw_spin_lock+0x1b/0x60
> > -[<ffffffff8109cfa8>] ? cpuacct_charge+0x58/0x70
> > -[<ffffffff81089039>] ? update_curr+0xb9/0x190
> > -[<ffffffff81417613>] ? __this_cpu_preempt_check+0x13/0x20
> > -[<ffffffff8112b43f>] ? __perf_event_task_sched_in+0x4f/0x90
> > -[<ffffffff8195dbbd>] ? _raw_spin_unlock_irq+0x1d/0x40
> > -[<ffffffff8107e223>] ? finish_task_switch+0x63/0xe0
> > -[<ffffffff81959e3b>] ? __schedule+0x38b/0x980
> > -[<ffffffff8107e370>] ? preempt_count_add+0xd0/0xf0
> > -[<ffffffffa0165c65>] istd+0x4d5/0x1390 [iscsi_trgt]
> > -[<ffffffff81959e3b>] ? __schedule+0x38b/0x980
> > -[<ffffffffa0165790>] ? nthread_wakeup+0x40/0x40 [iscsi_trgt]
> > -[<ffffffffa0165790>] ? nthread_wakeup+0x40/0x40 [iscsi_trgt]
> > -[<ffffffff8107748b>] kthread+0xbb/0xe0
> > -[<ffffffff81950000>] ? wireless_dev_seq_show+0x100/0x180
> > -[<ffffffff810773d0>] ? kthread_worker_fn+0x170/0x170
> > -[<ffffffff8195e7a2>] ret_from_fork+0x42/0x70
> > -[<ffffffff810773d0>] ? kthread_worker_fn+0x170/0x170
> > -Code: 5a 10 48 89 7d c8 48 39 f3 48 0f 47 de 48 85 db 0f 84 6f 01 00 00
> 8b 02 49 89
> > -d4 4c 8b 72 08 4c 8b 7a 18 a8 04 0f 85 a2 00 00 00 <4d> 8b 6f 08 4d 29
> f5 49 39 dd 4c 0f 47 eb a8 02 0f 85 5c 01 00
> > -RSP <ffff8800d7f3f728>
> > -CR2: 000000000000024e
> > -------------[ cut here ]------------
> > --- snip --
> > -
> > -The original patch is at
> > -http://launchpadlibrarian.net/218100509/iscsitarget_1.4.
> 20.3+svn499-0ubuntu2_1.4.20.3+svn499-0ubuntu2.1.diff.gz,
> > -those changes were taken using #ifs, inorder to allow compilation of
> > -iscsitarget package with linux kernels < 3.19.
> > -
> > -Upstream-Status: Submitted [http://launchpadlibrarian.
> net/218100509/iscsitarget_1.4.20.3+svn499-0ubuntu2_1.4.20.3+
> svn499-0ubuntu2.1.diff.gz]
> > -
> > -Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > -
> > -diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/conn.c
> iscsitarget-1.4.20.3+svn502/kernel/conn.c
> > ---- iscsitarget-1.4.20.3+svn502_org/kernel/conn.c    2017-01-18
> 22:27:02.713167436 -0800
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/conn.c        2017-01-18
> 23:13:11.909214379 -0800
> > -@@ -129,7 +129,11 @@ static void iet_socket_bind(struct iscsi
> > -
> > -     dprintk(D_GENERIC, "%llu\n", (unsigned long long) session->sid);
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > -+    conn->sock = SOCKET_I(file_inode(conn->file));
> > -+#else
> > -     conn->sock = SOCKET_I(conn->file->f_dentry->d_inode);
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > -     conn->sock->sk->sk_user_data = conn;
> > -
> > -     write_lock_bh(&conn->sock->sk->sk_callback_lock);
> > -diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/file-io.c
> iscsitarget-1.4.20.3+svn502/kernel/file-io.c
> > ---- iscsitarget-1.4.20.3+svn502_org/kernel/file-io.c 2014-05-06
> 13:59:55.000000000 -0700
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/file-io.c     2017-01-18
> 23:54:38.505717079 -0800
> > -@@ -69,7 +69,11 @@ static int fileio_make_request(struct ie
> > - static int fileio_sync(struct iet_volume *lu, struct tio *tio)
> > - {
> > -     struct fileio_data *p = lu->private;
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > -+    struct inode *inode = file_inode(p->filp);
> > -+#else
> > -     struct inode *inode = p->filp->f_dentry->d_inode;
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > -     struct address_space *mapping = inode->i_mapping;
> > -     loff_t ppos, count;
> > -     int res;
> > -@@ -213,7 +217,11 @@ static int fileio_attach(struct iet_volu
> > -             eprintk("%d\n", err);
> > -             goto out;
> > -     }
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > -+    inode = file_inode(p->filp);
> > -+#else
> > -     inode = p->filp->f_dentry->d_inode;
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > -
> > -     if (S_ISREG(inode->i_mode))
> > -             ;
> > -diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.c
> iscsitarget-1.4.20.3+svn502/kernel/iscsi.c
> > ---- iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.c   2014-05-06
> 13:59:55.000000000 -0700
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/iscsi.c       2017-01-18
> 23:37:36.462970326 -0800
> > -@@ -489,8 +489,12 @@ static void cmnd_skip_pdu(struct iscsi_c
> > -     }
> > -     conn->read_iov[i].iov_base = addr;
> > -     conn->read_iov[i].iov_len = size;
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > -+    iov_iter_init(&conn->read_msg.msg_iter, READ, conn->read_iov,
> ++i, conn->read_size);
> > -+#else
> > -     conn->read_msg.msg_iov = conn->read_iov;
> > -     conn->read_msg.msg_iovlen = ++i;
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > - }
> > -
> > - static void iscsi_cmnd_reject(struct iscsi_cmnd *req, int reason)
> > -@@ -718,7 +722,9 @@ static int cmnd_recv_pdu(struct iscsi_co
> > -     idx = offset >> PAGE_CACHE_SHIFT;
> > -     offset &= ~PAGE_CACHE_MASK;
> > -
> > -+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0)
> > -     conn->read_msg.msg_iov = conn->read_iov;
> > -+#endif      /* LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0) */
> > -     conn->read_size = size = (size + 3) & -4;
> > -     conn->read_overflow = 0;
> > -
> > -@@ -730,16 +736,25 @@ static int cmnd_recv_pdu(struct iscsi_co
> > -             conn->read_iov[i].iov_base =  addr + offset;
> > -             if (offset + size <= PAGE_CACHE_SIZE) {
> > -                     conn->read_iov[i].iov_len = size;
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > -+                    iov_iter_init(&conn->read_msg.msg_iter, READ,
> conn->read_iov, ++i, conn->read_size);
> > -+#else
> > -                     conn->read_msg.msg_iovlen = ++i;
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > -                     break;
> > -             }
> > -             conn->read_iov[i].iov_len = PAGE_CACHE_SIZE - offset;
> > -             size -= conn->read_iov[i].iov_len;
> > -             offset = 0;
> > -             if (++i >= ISCSI_CONN_IOV_MAX) {
> > -+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0)
> > -                     conn->read_msg.msg_iovlen = i;
> > -+#endif /* LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0) */
> > -                     conn->read_overflow = size;
> > -                     conn->read_size -= size;
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > -+                    iov_iter_init(&conn->read_msg.msg_iter, READ,
> conn->read_iov, i, conn->read_size);
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > -                     break;
> > -             }
> > -
> > -@@ -918,7 +933,9 @@ static int nop_out_start(struct iscsi_co
> > -
> > -     if ((size = cmnd->pdu.datasize)) {
> > -             size = (size + 3) & -4;
> > -+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0)
> > -             conn->read_msg.msg_iov = conn->read_iov;
> > -+#endif /* LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0) */
> > -             if (cmnd->pdu.bhs.itt != cpu_to_be32(ISCSI_RESERVED_TAG))
> {
> > -                     struct tio *tio;
> > -                     int pg_cnt = get_pgcnt(size);
> > -@@ -946,7 +963,11 @@ static int nop_out_start(struct iscsi_co
> > -             }
> > -             assert(!size);
> > -             conn->read_overflow = size;
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > -+            iov_iter_init(&conn->read_msg.msg_iter, READ,
> conn->read_iov, i, conn->read_size);
> > -+#else
> > -             conn->read_msg.msg_iovlen = i;
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > -     }
> > -
> > - out:
> > -@@ -986,7 +1007,11 @@ static void scsi_cmnd_start(struct iscsi
> > -             set_cmnd_lunit(req);
> > -
> > -     switch (req_hdr->scb[0]) {
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > -+    case SERVICE_ACTION_IN_16:
> > -+#else
> > -     case SERVICE_ACTION_IN:
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > -             if ((req_hdr->scb[1] & 0x1f) != 0x10)
> > -                     goto error;
> > -     case INQUIRY:
> > -diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c
> iscsitarget-1.4.20.3+svn502/kernel/nthread.c
> > ---- iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c 2014-05-06
> 13:59:55.000000000 -0700
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/nthread.c     2017-01-18
> 23:45:03.291033881 -0800
> > -@@ -42,9 +42,14 @@ static inline void iscsi_conn_init_read(
> > -     len = (len + 3) & -4; // XXX ???
> > -     conn->read_iov[0].iov_base = data;
> > -     conn->read_iov[0].iov_len = len;
> > -+#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0)
> > -     conn->read_msg.msg_iov = conn->read_iov;
> > -     conn->read_msg.msg_iovlen = 1;
> > -+#endif /* LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0) */
> > -     conn->read_size = (len + 3) & -4;
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > -+    iov_iter_init(&conn->read_msg.msg_iter, READ, conn->read_iov, 1,
> conn->read_size);
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > - }
> > -
> > - static void iscsi_conn_read_ahs(struct iscsi_conn *conn, struct
> iscsi_cmnd *cmnd)
> > -@@ -83,14 +88,31 @@ static int is_data_available(struct iscs
> > -
> > - static void forward_iov(struct msghdr *msg, int len)
> > - {
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > -+    struct iovec *iov;
> > -+
> > -+    while (msg->msg_iter.iov->iov_len <= len) {
> > -+            len -= msg->msg_iter.iov->iov_len;
> > -+            msg->msg_iter.iov++;
> > -+            msg->msg_iter.nr_segs--;
> > -+    }
> > -+#else
> > -     while (msg->msg_iov->iov_len <= len) {
> > -             len -= msg->msg_iov->iov_len;
> > -             msg->msg_iov++;
> > -             msg->msg_iovlen--;
> > -     }
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > -+    /* XXX: discards const ... */
> > -+    iov = msg->msg_iter.iov;
> > -+    iov->iov_base = (char *) msg->msg_iter.iov->iov_base + len;
> > -+    iov->iov_len -= len;
> > -+#else
> > -     msg->msg_iov->iov_base = (char *) msg->msg_iov->iov_base + len;
> > -     msg->msg_iov->iov_len -= len;
> > -+#endif      /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > - }
> > -
> > - static int do_recv(struct iscsi_conn *conn, int state)
> > -@@ -98,6 +120,9 @@ static int do_recv(struct iscsi_conn *co
> > -     mm_segment_t oldfs;
> > -     struct msghdr msg;
> > -     struct iovec iov[ISCSI_CONN_IOV_MAX];
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > -+    size_t iovlen = ISCSI_CONN_IOV_MAX;
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > -     int i, len, res;
> > -
> > -     if (!test_bit(CONN_ACTIVE, &conn->state)) {
> > -@@ -110,12 +135,23 @@ static int do_recv(struct iscsi_conn *co
> > -             goto out;
> > -     }
> > -
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > -+    if (conn->read_msg.msg_iter.nr_segs < iovlen)
> > -+            iovlen = conn->read_msg.msg_iter.nr_segs;
> > -+
> > -+    for (i = 0, len = 0; i < iovlen; i++) {
> > -+            iov[i] = conn->read_msg.msg_iter.iov[i];
> > -+            len += iov[i].iov_len;
> > -+    }
> > -+    iov_iter_init(&msg.msg_iter, READ, iov, iovlen, len);
> > -+#else
> > -     msg.msg_iov = iov;
> > -     msg.msg_iovlen = min_t(size_t, conn->read_msg.msg_iovlen,
> ISCSI_CONN_IOV_MAX);
> > -     for (i = 0, len = 0; i < msg.msg_iovlen; i++) {
> > -             iov[i] = conn->read_msg.msg_iov[i];
> > -             len += iov[i].iov_len;
> > -     }
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > -
> > -     oldfs = get_fs();
> > -     set_fs(get_ds());
> > -diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/target_disk.c
> iscsitarget-1.4.20.3+svn502/kernel/target_disk.c
> > ---- iscsitarget-1.4.20.3+svn502_org/kernel/target_disk.c
>  2014-05-06 13:59:55.000000000 -0700
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/target_disk.c 2017-01-18
> 23:45:51.451010417 -0800
> > -@@ -606,7 +606,11 @@ static int disk_execute_cmnd(struct iscs
> > -     case REQUEST_SENSE:
> > -             send_data_rsp(cmnd, build_request_sense_response);
> > -             break;
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > -+    case SERVICE_ACTION_IN_16:
> > -+#else
> > -     case SERVICE_ACTION_IN:
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > -             send_data_rsp(cmnd, build_service_action_in_response);
> > -             break;
> > -     case READ_6:
> > -diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/volume.c
> iscsitarget-1.4.20.3+svn502/kernel/volume.c
> > ---- iscsitarget-1.4.20.3+svn502_org/kernel/volume.c  2014-05-06
> 13:59:55.000000000 -0700
> > -+++ iscsitarget-1.4.20.3+svn502/kernel/volume.c      2017-01-18
> 23:47:07.957561600 -0800
> > -@@ -398,7 +398,11 @@ int is_volume_reserved(struct iet_volume
> > -             case READ_CAPACITY:
> > -                     /* allowed commands when reserved */
> > -                     break;
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > -+            case SERVICE_ACTION_IN_16:
> > -+#else
> > -             case SERVICE_ACTION_IN:
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > -                     if ((scb[1] & 0x1F) == 0x10)
> > -                             break;
> > -                     /* fall through */
> > -@@ -465,7 +469,11 @@ int is_volume_reserved(struct iet_volume
> > -             if (excl_access_ro && !registered)
> > -                     err = -EBUSY;
> > -             break;
> > -+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > -+    case SERVICE_ACTION_IN_16:
> > -+#else
> > -     case SERVICE_ACTION_IN:
> > -+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > -             if ((scb[1] & 0x1F) == 0x10)
> > -                     break;
> > -             /* fall through */
> > diff --git a/meta-networking/recipes-extended/iscsitarget/files/
> use-kernel-makefile-to-get-kernel-version.patch b/meta-networking/recipes-
> extended/iscsitarget/files/use-kernel-makefile-to-get-kernel-version.patch
> > deleted file mode 100644
> > index 95bd047..0000000
> > --- a/meta-networking/recipes-extended/iscsitarget/files/
> use-kernel-makefile-to-get-kernel-version.patch
> > +++ /dev/null
> > @@ -1,67 +0,0 @@
> > -Get linux kernel version from Makefile of kernel source
> > -
> > -We get below messages while building iscsitarget,
> > -
> > --- snip --
> > -x86_64-poky-linux-gcc: error:
> > -/CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work-shared/
> qemux86-64/kernel-source/include/linux/version.h:
> > -No such file or directory
> > -x86_64-poky-linux-gcc: fatal error: no input files
> > -compilation terminated.
> > -/bin/sh: line 0: [: too many arguments
> > -/bin/sh: line 0: [: too many arguments
> > -/bin/sh: line 0: [: too many arguments
> > -/bin/sh: line 0: [: too many arguments
> > -/bin/sh: line 0: [: too many arguments
> > -/bin/sh: line 0: [: too many arguments
> > -/bin/sh: line 0: [: too many arguments
> > -/bin/sh: line 0: [: too many arguments
> > -/bin/sh: line 0: [: too many arguments
> > -/bin/sh: line 0: [: too many arguments
> > -/bin/sh: line 0: [: too many arguments
> > -/bin/sh: line 0: [: too many arguments
> > --- CUT --
> > -
> > -These messages are due to absence of include/linux/version.h file in
> > -kernel source directory and failed to compute linux kernel version.
> > -So, use kernel source Makefile ( i.e $(KSRC)/Makefile) to find out
> > -actual kernel version.
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > -
> > ---- iscsitarget-1.4.20.3+svn499_org/Makefile 2014-01-27
> 00:00:45.000000000 +0530
> > -+++ iscsitarget-1.4.20.3+svn499/Makefile     2015-07-23
> 10:44:47.013600285 +0530
> > -@@ -18,27 +18,11 @@ ifeq ($(KSRC),)
> > - endif
> > -
> > -
> > --ifneq ($(wildcard $(KSRC)/include/generated/utsrelease.h),)
> > --    VERSION_FILE := $(KSRC)/include/generated/utsrelease.h
> > --else
> > --  ifneq ($(wildcard $(KSRC)/include/linux/utsrelease.h),)
> > --      VERSION_FILE := $(KSRC)/include/linux/utsrelease.h
> > --  else
> > --      VERSION_FILE := $(KSRC)/include/linux/version.h
> > --  endif
> > --endif
> > --
> > --KVER := $(shell $(CC) $(CFLAGS) $(LDFLAGS) -E -dM $(VERSION_FILE) | \
> > --    grep UTS_RELEASE | awk '{ print $$3 }' | sed 's/\"//g')
> > --
> > - KMOD := /lib/modules/$(KVER)/extra
> > --
> > --KMAJ := $(shell echo $(KVER) | \
> > --    sed -e 's/^\([0-9][0-9]*\)\.[0-9][0-9]*\.[0-9][0-9]*.*/\1/')
> > --KMIN := $(shell echo $(KVER) | \
> > --    sed -e 's/^[0-9][0-9]*\.\([0-9][0-9]*\)\.[0-9][0-9]*.*/\1/')
> > --KREV := $(shell echo $(KVER) | \
> > --    sed -e 's/^[0-9][0-9]*\.[0-9][0-9]*\.\([0-9][0-9]*\).*/\1/')
> > -+KMAJ := $(shell cat $(KSRC)/Makefile | grep ^VERSION | gawk -F " " '{
> print $$NF }')
> > -+KMIN := $(shell cat $(KSRC)/Makefile | grep ^PATCHLEVEL | gawk -F " "
> '{ print $$NF }')
> > -+KREV := $(shell cat $(KSRC)/Makefile | grep ^SUBLEVEL | gawk -F " " '{
> print $$NF }')
> > -+KVER := ${KMAJ}.${KMIN}.${KREV}
> > -
> > - kver_eq = $(shell [ $(KMAJ) -eq $(1) -a $(KMIN) -eq $(2) -a $(KREV)
> -eq $(3) ] && \
> > -     echo 1 || echo 0)
> > diff --git a/meta-networking/recipes-extended/iscsitarget/
> iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-
> extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
> > deleted file mode 100644
> > index 5d13591..0000000
> > --- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
> svn502.bb
> > +++ /dev/null
> > @@ -1,64 +0,0 @@
> > -DESCRIPTION = "iSCSI Enterprise Target is aimed to develop an \
> > -               open source iSCSI target with professional features, \
> > -               that works well in enterprise environment under real \
> > -               workload, and is scalable and versatile enough to meet
> the \
> > -               challenge of future storage needs and developments."
> > -HOMEPAGE = "http://iscsitarget.sourceforge.net/"
> > -LICENSE = "GPLv2"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=6e233eda45c807aa29aeaa6d94bc48
> a2"
> > -DEPENDS = "openssl virtual/kernel"
> > -
> > -SRC_URI = "http://ftp.heanet.ie/mirrors/ubuntu/pool/universe/i/${BPN}/
> ${BPN}_${PV}.orig.tar.gz \
> > -           file://use-kernel-makefile-to-get-kernel-version.patch \
> > -           file://fix-errors-observed-with-linux-3.19-and-greater.patch
> \
> > -           file://access-sk_v6_daddr-iff-IPV6-defined.patch \
> > -           file://build_with_updated_bio_struct_of_linux_v4.3_and_above.patch
> \
> > -           file://build_with_updated_interfaces_of_linux_v4.8_and_above.patch
> \
> > -           file://fix-call-trace-of-ahash-API-calling.patch \
> > -           file://0001-kernel-event-netlink_ack-now-requires-4-arguments.patch
> \
> > -           "
> > -
> > -SRC_URI[md5sum] = "ef9bc823bbabd3c772208c00d5f2d089"
> > -SRC_URI[sha256sum] = "d3196ccb78a43266dce28587bfe30d
> 8ab4db7566d7bce96057dfbb84100babb5"
> > -
> > -inherit module
> > -
> > -do_configure[noexec] = "1"
> > -
> > -# make_scripts requires kernel source directory to create
> > -# kernel scripts
> > -do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
> > -
> > -do_compile() {
> > -    oe_runmake KSRC=${STAGING_KERNEL_DIR} LDFLAGS='' V=1 kernel
> > -    oe_runmake KSRC=${STAGING_KERNEL_DIR} usr
> > -}
> > -
> > -do_install() {
> > -    # Module
> > -    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/iscsi
> > -    install -m 0644 kernel/iscsi_trgt.ko \
> > -    ${D}/lib/modules/${KERNEL_VERSION}/kernel/iscsi/iscsi_trgt.ko
> > -
> > -    # Userspace utilities
> > -    install -d ${D}${sbindir}
> > -    install -m 0755 usr/ietd ${D}${sbindir}/ietd
> > -    install -m 0755 usr/ietadm ${D}${sbindir}/ietadm
> > -
> > -    # Config files, init scripts
> > -    mkdir -p ${D}${sysconfdir}/iet
> > -    install -m 0644 etc/ietd.conf ${D}/${sysconfdir}/iet/ietd.conf
> > -    install -m 0644 etc/initiators.allow ${D}${sysconfdir}/iet/
> initiators.allow
> > -    install -m 0644 etc/targets.allow ${D}${sysconfdir}/iet/targets.
> allow
> > -    mkdir -p ${D}${sysconfdir}/init.d
> > -    install -m 0755 etc/initd/initd ${D}${sysconfdir}/init.d/
> iscsi-target
> > -    install -m 0644 etc/initiators.deny ${D}${sysconfdir}/iet/
> initiators.deny
> > -}
> > -
> > -FILES_${PN} += "${sbindir} \
> > -                ${sysconfdir}"
> > -
> > -RDEPENDS_${PN} = "kernel-module-iscsi-trgt"
> > -RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
> > -
> > -PNBLACKLIST[iscsitarget] = "error: implicit declaration of function
> 'init_timer'; did you mean 'init_timers'?; 4.15 kernel issues"
>
>

