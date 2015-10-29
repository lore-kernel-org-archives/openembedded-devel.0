Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 36BE475A38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 14:35:50 +0000 (UTC)
Received: by lbbes7 with SMTP id es7so29910642lbb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 07:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=TE50w0mPf54nWvpxtMkIRmtqlF/xu0XdUANNwSfcLjw=;
	b=Qd7ZGvHO8Fc/RMYVFAbD2+73m+BqbjQcyLKjMr319QbewQArK3WMN8T64ynG+15eyF
	PCtNanLKIHErHJMoQg9hpFJ1xwKbxSsKHX7PX+ebtCGFP5udH9dYEoslqQJaJNatWeWz
	o5xYc0yIBtcY9Ow9d9hvsErsfsU3Hb98xaO9kOnMSTxqul9ADJ3YU/xdRPhOQxTNYDZM
	EsAWG5Q3xf1WCQ0RZsF3h8aPcetMnJUUfShET+aKyspuR9p1vhhJarVP83/dyBfSQy7P
	QK34B/3BDOp7aK1KH3FiexRQozyy7brznmM3fsWzNyn1Gt64817sjiJv18aaWeOgJ0LH
	vwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=TE50w0mPf54nWvpxtMkIRmtqlF/xu0XdUANNwSfcLjw=;
	b=k9ALZzPOi3wJAKf3TOjHfif9SfY4ufGOulZwEy2+lrxj4aQNfO8CChacbeP5fbEyEq
	hUkYRN1A6loyf6xw+Gn2JcehUZ+Zuxozf1C7pt5e5TFSvoQ8wIL0Ye47uTeMNGrIoCFH
	nVDXu1ocq4V1qG+MoG2txI2hvVuD+fnBRRmfXJOus9D5XBajGcpxAr5UTd/y0TgxrJrY
	Lu8YGvfWFwTXeR/f8Z14Mn3Gixd1LtuxOm2cdoQKxrgvfN8bOG8LES16r81V8OYXQGBt
	27G5xQVJ0sag88eunbR8hlRX/sbe50Izti97lv8bJJ5dE9bOjJ2W8XRbfR+T2o6bo6ZZ
	NKbg==
X-Gm-Message-State: ALoCoQk68bPqe5qIm+liBipC3bhsOJUNJcWDVlx17ztuRMToxbVYn6psc0UIJvFAzcf/55bNADw7
MIME-Version: 1.0
X-Received: by 10.112.168.37 with SMTP id zt5mr1187750lbb.44.1446129349152;
	Thu, 29 Oct 2015 07:35:49 -0700 (PDT)
Received: by 10.114.184.199 with HTTP; Thu, 29 Oct 2015 07:35:48 -0700 (PDT)
In-Reply-To: <20151026132950.GE2554@jama>
References: <1440611069-20869-1-git-send-email-jkrishnanjanappa@mvista.com>
	<20151026132950.GE2554@jama>
Date: Thu, 29 Oct 2015 20:05:48 +0530
Message-ID: <CAD3vsf7ELFBMfK4Y8ST=oXB4uJRczyJMfZjfQ6FFjuoP4k1bzg@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] iscsitarget: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Oct 2015 14:35:53 -0000
X-Groupsio-MsgNum: 58145
Content-Type: multipart/mixed; boundary=001a11c33d0828628005233f3a87

--001a11c33d0828628005233f3a87
Content-Type: text/plain; charset=UTF-8

Hi,

>
> Fails to build in world:
> http://errors.yoctoproject.org/Errors/Details/21028/


I am unable reproduce this failure. Below are the steps followed,

1. Download the latest poky.
   git clone http://git.yoctoproject.org/git/poky

2. Add meta-networking layer.

3. "bitbake iscsitarget"

Attaching success log for reference,  which has been built for qemux86
machine.

May be related to http://sourceforge.net/p/scst/mailman/message/32568332/

Let me know how it can be reproduced.

Regards,
Jagadeesh

> >
> > Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > ---
> >  ...rors-observed-with-linux-3.19-and-greater.patch | 198
> +++++++++++++++++++++
> >  ...use-kernel-makefile-to-get-kernel-version.patch |  67 +++++++
> >  .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  62 +++++++
> >  3 files changed, 327 insertions(+)
> >  create mode 100644
> meta-networking/recipes-extended/iscsitarget/files/fix-errors-observed-with-linux-3.19-and-greater.patch
> >  create mode 100644
> meta-networking/recipes-extended/iscsitarget/files/use-kernel-makefile-to-get-kernel-version.patch
> >  create mode 100644
> meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
> svn502.bb
> >
> > diff --git
> a/meta-networking/recipes-extended/iscsitarget/files/fix-errors-observed-with-linux-3.19-and-greater.patch
> b/meta-networking/recipes-extended/iscsitarget/files/fix-errors-observed-with-linux-3.19-and-greater.patch
> > new file mode 100644
> > index 0000000..6878ca2
> > --- /dev/null
> > +++
> b/meta-networking/recipes-extended/iscsitarget/files/fix-errors-observed-with-linux-3.19-and-greater.patch
> > @@ -0,0 +1,198 @@
> > +Fix build errors with linux kernel v3.19 and above
> > +
> > +Below errors came up while building iscsitarget for
> > +qemux86-64 (and others) because,
> > +1. 'struct user_msghdr' is being used for userland-side msghdr instead
> > +of 'struct msghdr', which is used for kernel-side msghdr in linux v3.19
> > +and above.
> > +
> > +error snippet:
> > +-- snip --
> > +|
> /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/
> 1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/iscsi.c: In
> function 'cmnd_skip_pdu':
> > +|
> /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/
> 1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/iscsi.c:492:16:
> error: 'struct msghdr' has no member named 'msg_iov'
> > +|   conn->read_msg.msg_iov = conn->read_iov;
> > +-- CUT --
> > +
> > +Reference:
> > +
> https://github.com/torvalds/linux/commit/666547ff591cebdedc4679bf6b1b3f3383a8dea3
> > +
> > +2. 'SERVICE_ACTION_IN' has been renamed to SERVICE_ACTION_IN_16 in
> linux v3.19
> > +and above.
> > +
> > +error snippet:
> > +-- snip --
> > +|
> /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/
> 1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/iscsi.c: In
> function 'scsi_cmnd_start':
> > +|
> /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/
> 1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/iscsi.c:989:7:
> error: 'SERVICE_ACTION_IN' undeclared (first use in this function)
> > +|   case SERVICE_ACTION_IN:
> > +-- CUT --
> > +
> > +Reference:
> > +
> https://github.com/torvalds/linux/commit/eb846d9f147455e4e5e1863bfb5e31974bb69b7c
> > +
> > +3. In linux v3.19 and above, f_dentry member has been removed from
> > +'struct file' structure.
> > +
> > +error snippet:
> > +-- snip --
> > +|
> /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/
> 1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c: In function
> 'iet_socket_bind':
> > +|
> /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/
> 1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c:130:34:
> error: 'struct file' has no member named 'f_dentry'
> > +|   conn->sock = SOCKET_I(conn->file->f_dentry->d_inode);
> > +-- CUT --
> > +
> > +new helper function file_inode(file) should be used instead.
> > +
> > +References:
> > +1.
> https://github.com/torvalds/linux/commit/78d28e651f97866d608d9b41f8ad291e65d47dd5
> > +2.
> https://github.com/torvalds/linux/commit/496ad9aa8ef448058e36ca7a787c61f2e63f0f54
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > +
> > +--- iscsitarget-1.4.20.3+svn502_org/kernel/conn.c    2015-08-24
> 16:13:26.481924679 +0530
> > ++++ iscsitarget-1.4.20.3+svn502/kernel/conn.c        2015-08-24
> 17:27:06.897653698 +0530
> > +@@ -127,7 +127,11 @@ static void iet_socket_bind(struct iscsi
> > +
> > +     dprintk(D_GENERIC, "%llu\n", (unsigned long long) session->sid);
> > +
> > ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > ++    conn->sock = SOCKET_I(file_inode(conn->file));
> > ++#else
> > +     conn->sock = SOCKET_I(conn->file->f_dentry->d_inode);
> > ++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > +     conn->sock->sk->sk_user_data = conn;
> > +
> > +     write_lock_bh(&conn->sock->sk->sk_callback_lock);
> > +--- iscsitarget-1.4.20.3+svn502_org/kernel/file-io.c 2015-08-24
> 16:13:26.481924679 +0530
> > ++++ iscsitarget-1.4.20.3+svn502/kernel/file-io.c     2015-08-24
> 17:30:54.390131100 +0530
> > +@@ -69,7 +69,11 @@ static int fileio_make_request(struct ie
> > + static int fileio_sync(struct iet_volume *lu, struct tio *tio)
> > + {
> > +     struct fileio_data *p = lu->private;
> > ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > ++    struct inode *inode = file_inode(p->filp);
> > ++#else
> > +     struct inode *inode = p->filp->f_dentry->d_inode;
> > ++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > +     struct address_space *mapping = inode->i_mapping;
> > +     loff_t ppos, count;
> > +     int res;
> > +@@ -213,7 +217,11 @@ static int fileio_attach(struct iet_volu
> > +             eprintk("%d\n", err);
> > +             goto out;
> > +     }
> > ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > ++    inode = file_inode(p->filp);
> > ++#else
> > +     inode = p->filp->f_dentry->d_inode;
> > ++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > +
> > +     if (S_ISREG(inode->i_mode))
> > +             ;
> > +--- iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.c   2015-08-24
> 16:13:26.481924679 +0530
> > ++++ iscsitarget-1.4.20.3+svn502/kernel/iscsi.c       2015-08-24
> 17:33:50.950490156 +0530
> > +@@ -986,7 +986,11 @@ static void scsi_cmnd_start(struct iscsi
> > +             set_cmnd_lunit(req);
> > +
> > +     switch (req_hdr->scb[0]) {
> > ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > ++    case SERVICE_ACTION_IN_16:
> > ++#else
> > +     case SERVICE_ACTION_IN:
> > ++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > +             if ((req_hdr->scb[1] & 0x1f) != 0x10)
> > +                     goto error;
> > +     case INQUIRY:
> > +--- iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h   2015-08-24
> 16:13:26.481924679 +0530
> > ++++ iscsitarget-1.4.20.3+svn502/kernel/iscsi.h       2015-08-24
> 17:35:31.354690051 +0530
> > +@@ -257,7 +257,11 @@ struct iscsi_conn {
> > +     struct timer_list nop_timer;
> > +
> > +     struct iscsi_cmnd *read_cmnd;
> > ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > ++    struct user_msghdr read_msg;
> > ++#else
> > +     struct msghdr read_msg;
> > ++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > +     struct iovec read_iov[ISCSI_CONN_IOV_MAX];
> > +     u32 read_size;
> > +     u32 read_overflow;
> > +--- iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c 2015-08-24
> 16:13:26.481924679 +0530
> > ++++ iscsitarget-1.4.20.3+svn502/kernel/nthread.c     2015-08-24
> 17:41:56.187428925 +0530
> > +@@ -80,8 +80,11 @@ static int is_data_available(struct iscs
> > +     set_fs(oldfs);
> > +     return (res >= 0) ? avail : res;
> > + }
> > +-
> > ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > ++static void forward_iov(struct user_msghdr *msg, int len)
> > ++#else
> > + static void forward_iov(struct msghdr *msg, int len)
> > ++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > + {
> > +     while (msg->msg_iov->iov_len <= len) {
> > +             len -= msg->msg_iov->iov_len;
> > +@@ -96,7 +99,11 @@ static void forward_iov(struct msghdr *m
> > + static int do_recv(struct iscsi_conn *conn, int state)
> > + {
> > +     mm_segment_t oldfs;
> > ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > ++    struct user_msghdr msg;
> > ++#else
> > +     struct msghdr msg;
> > ++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > +     struct iovec iov[ISCSI_CONN_IOV_MAX];
> > +     int i, len, res;
> > +
> > +@@ -461,7 +468,11 @@ static void exit_tx(struct iscsi_conn *c
> > + static int tx_ddigest(struct iscsi_cmnd *cmnd, int state)
> > + {
> > +     int res, rest = cmnd->conn->write_size;
> > ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > ++    struct user_msghdr msg = {.msg_flags = MSG_NOSIGNAL |
> MSG_DONTWAIT};
> > ++#else
> > +     struct msghdr msg = {.msg_flags = MSG_NOSIGNAL | MSG_DONTWAIT};
> > ++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > +     struct kvec iov;
> > +
> > +     iov.iov_base = (char *) (&cmnd->ddigest) + (sizeof(u32) - rest);
> > +--- iscsitarget-1.4.20.3+svn502_org/kernel/target_disk.c     2015-08-24
> 16:13:26.481924679 +0530
> > ++++ iscsitarget-1.4.20.3+svn502/kernel/target_disk.c 2015-08-24
> 17:43:42.167625159 +0530
> > +@@ -606,7 +606,11 @@ static int disk_execute_cmnd(struct iscs
> > +     case REQUEST_SENSE:
> > +             send_data_rsp(cmnd, build_request_sense_response);
> > +             break;
> > ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > ++    case SERVICE_ACTION_IN_16:
> > ++#else
> > +     case SERVICE_ACTION_IN:
> > ++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > +             send_data_rsp(cmnd, build_service_action_in_response);
> > +             break;
> > +     case READ_6:
> > +--- iscsitarget-1.4.20.3+svn502_org/kernel/volume.c  2015-08-24
> 16:13:26.477924674 +0530
> > ++++ iscsitarget-1.4.20.3+svn502/kernel/volume.c      2015-08-24
> 18:28:15.697074780 +0530
> > +@@ -398,7 +398,11 @@ int is_volume_reserved(struct iet_volume
> > +             case READ_CAPACITY:
> > +                     /* allowed commands when reserved */
> > +                     break;
> > ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > ++            case SERVICE_ACTION_IN_16:
> > ++#else
> > +             case SERVICE_ACTION_IN:
> > ++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > +                     if ((scb[1] & 0x1F) == 0x10)
> > +                             break;
> > +                     /* fall through */
> > +@@ -465,7 +469,11 @@ int is_volume_reserved(struct iet_volume
> > +             if (excl_access_ro && !registered)
> > +                     err = -EBUSY;
> > +             break;
> > ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
> > ++    case SERVICE_ACTION_IN_16:
> > ++#else
> > +     case SERVICE_ACTION_IN:
> > ++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
> > +             if ((scb[1] & 0x1F) == 0x10)
> > +                     break;
> > +             /* fall through */
> > diff --git
> a/meta-networking/recipes-extended/iscsitarget/files/use-kernel-makefile-to-get-kernel-version.patch
> b/meta-networking/recipes-extended/iscsitarget/files/use-kernel-makefile-to-get-kernel-version.patch
> > new file mode 100644
> > index 0000000..95bd047
> > --- /dev/null
> > +++
> b/meta-networking/recipes-extended/iscsitarget/files/use-kernel-makefile-to-get-kernel-version.patch
> > @@ -0,0 +1,67 @@
> > +Get linux kernel version from Makefile of kernel source
> > +
> > +We get below messages while building iscsitarget,
> > +
> > +-- snip --
> > +x86_64-poky-linux-gcc: error:
> >
> +/CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work-shared/qemux86-64/kernel-source/include/linux/version.h:
> > +No such file or directory
> > +x86_64-poky-linux-gcc: fatal error: no input files
> > +compilation terminated.
> > +/bin/sh: line 0: [: too many arguments
> > +/bin/sh: line 0: [: too many arguments
> > +/bin/sh: line 0: [: too many arguments
> > +/bin/sh: line 0: [: too many arguments
> > +/bin/sh: line 0: [: too many arguments
> > +/bin/sh: line 0: [: too many arguments
> > +/bin/sh: line 0: [: too many arguments
> > +/bin/sh: line 0: [: too many arguments
> > +/bin/sh: line 0: [: too many arguments
> > +/bin/sh: line 0: [: too many arguments
> > +/bin/sh: line 0: [: too many arguments
> > +/bin/sh: line 0: [: too many arguments
> > +-- CUT --
> > +
> > +These messages are due to absence of include/linux/version.h file in
> > +kernel source directory and failed to compute linux kernel version.
> > +So, use kernel source Makefile ( i.e $(KSRC)/Makefile) to find out
> > +actual kernel version.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > +
> > +--- iscsitarget-1.4.20.3+svn499_org/Makefile 2014-01-27
> 00:00:45.000000000 +0530
> > ++++ iscsitarget-1.4.20.3+svn499/Makefile     2015-07-23
> 10:44:47.013600285 +0530
> > +@@ -18,27 +18,11 @@ ifeq ($(KSRC),)
> > + endif
> > +
> > +
> > +-ifneq ($(wildcard $(KSRC)/include/generated/utsrelease.h),)
> > +-    VERSION_FILE := $(KSRC)/include/generated/utsrelease.h
> > +-else
> > +-  ifneq ($(wildcard $(KSRC)/include/linux/utsrelease.h),)
> > +-      VERSION_FILE := $(KSRC)/include/linux/utsrelease.h
> > +-  else
> > +-      VERSION_FILE := $(KSRC)/include/linux/version.h
> > +-  endif
> > +-endif
> > +-
> > +-KVER := $(shell $(CC) $(CFLAGS) $(LDFLAGS) -E -dM $(VERSION_FILE) | \
> > +-    grep UTS_RELEASE | awk '{ print $$3 }' | sed 's/\"//g')
> > +-
> > + KMOD := /lib/modules/$(KVER)/extra
> > +-
> > +-KMAJ := $(shell echo $(KVER) | \
> > +-    sed -e 's/^\([0-9][0-9]*\)\.[0-9][0-9]*\.[0-9][0-9]*.*/\1/')
> > +-KMIN := $(shell echo $(KVER) | \
> > +-    sed -e 's/^[0-9][0-9]*\.\([0-9][0-9]*\)\.[0-9][0-9]*.*/\1/')
> > +-KREV := $(shell echo $(KVER) | \
> > +-    sed -e 's/^[0-9][0-9]*\.[0-9][0-9]*\.\([0-9][0-9]*\).*/\1/')
> > ++KMAJ := $(shell cat $(KSRC)/Makefile | grep ^VERSION | gawk -F " " '{
> print $$NF }')
> > ++KMIN := $(shell cat $(KSRC)/Makefile | grep ^PATCHLEVEL | gawk -F " "
> '{ print $$NF }')
> > ++KREV := $(shell cat $(KSRC)/Makefile | grep ^SUBLEVEL | gawk -F " " '{
> print $$NF }')
> > ++KVER := ${KMAJ}.${KMIN}.${KREV}
> > +
> > + kver_eq = $(shell [ $(KMAJ) -eq $(1) -a $(KMIN) -eq $(2) -a $(KREV)
> -eq $(3) ] && \
> > +     echo 1 || echo 0)
> > diff --git
> a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
> svn502.bb
> b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
> svn502.bb
> > new file mode 100644
> > index 0000000..c96810b
> > --- /dev/null
> > +++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
> svn502.bb
> > @@ -0,0 +1,62 @@
> > +DESCRIPTION = "iSCSI Enterprise Target is aimed to develop an \
> > +               open source iSCSI target with professional features, \
> > +               that works well in enterprise environment under real \
> > +               workload, and is scalable and versatile enough to meet
> the \
> > +               challenge of future storage needs and developments."
> > +HOMEPAGE = "http://iscsitarget.sourceforge.net/"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=6e233eda45c807aa29aeaa6d94bc48a2"
> > +DEPENDS = "openssl virtual/kernel"
> > +
> > +SRC_URI = "
> http://ftp.heanet.ie/mirrors/ubuntu/pool/universe/i/${BPN}/${BPN}_${PV}.orig.tar.gz
> \
> > +           file://use-kernel-makefile-to-get-kernel-version.patch \
> > +           file://fix-errors-observed-with-linux-3.19-and-greater.patch
> \
> > +       "
> > +SRC_URI[md5sum] = "ef9bc823bbabd3c772208c00d5f2d089"
> > +SRC_URI[sha256sum] =
> "d3196ccb78a43266dce28587bfe30d8ab4db7566d7bce96057dfbb84100babb5"
> > +
> > +inherit module-base
> > +
> > +# Add make_scripts task to create kernel scripts
> > +addtask make_scripts after do_patch before do_compile
> > +
> > +do_configure[noexec] = "1"
> > +
> > +# make_scripts requires kernel source directory to create
> > +# kernel scripts
> > +do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
> > +
> > +# Make sure we don't have race condition against "make scripts"
> > +do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
> > +
> > +do_compile() {
> > +    oe_runmake KSRC=${STAGING_KERNEL_DIR} CFLAGS='${CFLAGS}' LDFLAGS=''
> \
> > +    CC="${CC}" V=1
> > +}
> > +
> > +do_install() {
> > +    # Module
> > +    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/iscsi
> > +    install -m 0644 kernel/iscsi_trgt.ko \
> > +    ${D}/lib/modules/${KERNEL_VERSION}/kernel/iscsi/iscsi_trgt.ko
> > +
> > +    # Userspace utilities
> > +    install -d ${D}${sbindir}
> > +    install -m 0755 usr/ietd ${D}${sbindir}/ietd
> > +    install -m 0755 usr/ietadm ${D}${sbindir}/ietadm
> > +
> > +    # Config files, init scripts
> > +    mkdir -p ${D}${sysconfdir}/iet
> > +    install -m 0644 etc/ietd.conf ${D}/${sysconfdir}/iet/ietd.conf
> > +    install -m 0644 etc/initiators.allow
> ${D}${sysconfdir}/iet/initiators.allow
> > +    install -m 0644 etc/targets.allow
> ${D}${sysconfdir}/iet/targets.allow
> > +    mkdir -p ${D}${sysconfdir}/init.d
> > +    install -m 0755 etc/initd/initd
> ${D}${sysconfdir}/init.d/iscsi-target
> > +    install -m 0644 etc/initiators.deny
> ${D}${sysconfdir}/iet/initiators.deny
> > +}
> > +
> > +FILES_${PN} += "${sbindir} \
> > +                /lib \
> > +                ${sysconfdir}"
> > +
> > +RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
> > --
> > 1.8.2.3
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

--001a11c33d0828628005233f3a87
Content-Type: application/octet-stream; name="log.do_compile"
Content-Disposition: attachment; filename="log.do_compile"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_igcc047r1

REVCVUc6IEV4ZWN1dGluZyBzaGVsbCBmdW5jdGlvbiBkb19jb21waWxlCk5PVEU6IG1ha2UgLWog
NCAtZSBNQUtFRkxBR1M9IEtTUkM9L29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxkL3RtcC93
b3JrLXNoYXJlZC9xZW11eDg2L2tlcm5lbC1zb3VyY2UgQ0ZMQUdTPSAtTzIgLXBpcGUgLWcgLWZl
bGltaW5hdGUtdW51c2VkLWRlYnVnLXR5cGVzIExERkxBR1M9IENDPWk1ODYtcG9reS1saW51eC1n
Y2MgIC1tMzIgLW1hcmNoPWk1ODYgLS1zeXNyb290PS9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9i
dWlsZC90bXAvc3lzcm9vdHMvcWVtdXg4NiBWPTEKbWFrZSAtQyB1c3IKbWFrZSAtQyAvb3B0L3dv
cmtfamFnYWRlZXNoL3Bva3kvYnVpbGQvdG1wL3dvcmstc2hhcmVkL3FlbXV4ODYva2VybmVsLXNv
dXJjZSBTVUJESVJTPS9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAvd29yay9xZW11
eDg2LXBva3ktbGludXgvaXNjc2l0YXJnZXQvMS40LjIwLjMrc3ZuNTAyLXIwL2lzY3NpdGFyZ2V0
LTEuNC4yMC4zK3N2bjUwMi9rZXJuZWwgbW9kdWxlcwptYWtlWzFdOiBFbnRlcmluZyBkaXJlY3Rv
cnkgYC9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAvd29yay1zaGFyZWQvcWVtdXg4
Ni9rZXJuZWwtc291cmNlJwptYWtlWzFdOiBFbnRlcmluZyBkaXJlY3RvcnkgYC9vcHQvd29ya19q
YWdhZGVlc2gvcG9reS9idWlsZC90bXAvd29yay9xZW11eDg2LXBva3ktbGludXgvaXNjc2l0YXJn
ZXQvMS40LjIwLjMrc3ZuNTAyLXIwL2lzY3NpdGFyZ2V0LTEuNC4yMC4zK3N2bjUwMi91c3InCmk1
ODYtcG9reS1saW51eC1nY2MgIC1tMzIgLW1hcmNoPWk1ODYgLS1zeXNyb290PS9vcHQvd29ya19q
YWdhZGVlc2gvcG9reS9idWlsZC90bXAvc3lzcm9vdHMvcWVtdXg4NiAtTzIgLXBpcGUgLWcgLWZl
bGltaW5hdGUtdW51c2VkLWRlYnVnLXR5cGVzIC1PMiAtZm5vLWlubGluZSAtV2FsbCAtV3N0cmlj
dC1wcm90b3R5cGVzIC1JLi4vaW5jbHVkZSAtRF9HTlVfU09VUkNFICAgIC1jIC1vIGlldGQubyBp
ZXRkLmMKaTU4Ni1wb2t5LWxpbnV4LWdjYyAgLW0zMiAtbWFyY2g9aTU4NiAtLXN5c3Jvb3Q9L29w
dC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxkL3RtcC9zeXNyb290cy9xZW11eDg2IC1PMiAtcGlw
ZSAtZyAtZmVsaW1pbmF0ZS11bnVzZWQtZGVidWctdHlwZXMgLU8yIC1mbm8taW5saW5lIC1XYWxs
IC1Xc3RyaWN0LXByb3RvdHlwZXMgLUkuLi9pbmNsdWRlIC1EX0dOVV9TT1VSQ0UgICAgLWMgLW8g
aXNjc2lkLm8gaXNjc2lkLmMKaXNjc2lkLmM6IEluIGZ1bmN0aW9uICd0ZXh0X3NjYW5fbG9naW4n
Ogppc2NzaWQuYzoyOTA6ODogd2FybmluZzogdmFyaWFibGUgJ2Vycicgc2V0IGJ1dCBub3QgdXNl
ZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KICAgIGludCBlcnI7CiAgICAgICAgXgppNTg2
LXBva3ktbGludXgtZ2NjICAtbTMyIC1tYXJjaD1pNTg2IC0tc3lzcm9vdD0vb3B0L3dvcmtfamFn
YWRlZXNoL3Bva3kvYnVpbGQvdG1wL3N5c3Jvb3RzL3FlbXV4ODYgLU8yIC1waXBlIC1nIC1mZWxp
bWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtTzIgLWZuby1pbmxpbmUgLVdhbGwgLVdzdHJpY3Qt
cHJvdG90eXBlcyAtSS4uL2luY2x1ZGUgLURfR05VX1NPVVJDRSAgICAtYyAtbyBjb25uLm8gY29u
bi5jCmk1ODYtcG9reS1saW51eC1nY2MgIC1tMzIgLW1hcmNoPWk1ODYgLS1zeXNyb290PS9vcHQv
d29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAvc3lzcm9vdHMvcWVtdXg4NiAtTzIgLXBpcGUg
LWcgLWZlbGltaW5hdGUtdW51c2VkLWRlYnVnLXR5cGVzIC1PMiAtZm5vLWlubGluZSAtV2FsbCAt
V3N0cmljdC1wcm90b3R5cGVzIC1JLi4vaW5jbHVkZSAtRF9HTlVfU09VUkNFICAgIC1jIC1vIHNl
c3Npb24ubyBzZXNzaW9uLmMKaTU4Ni1wb2t5LWxpbnV4LWdjYyAgLW0zMiAtbWFyY2g9aTU4NiAt
LXN5c3Jvb3Q9L29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxkL3RtcC9zeXNyb290cy9xZW11
eDg2IC1PMiAtcGlwZSAtZyAtZmVsaW1pbmF0ZS11bnVzZWQtZGVidWctdHlwZXMgLU8yIC1mbm8t
aW5saW5lIC1XYWxsIC1Xc3RyaWN0LXByb3RvdHlwZXMgLUkuLi9pbmNsdWRlIC1EX0dOVV9TT1VS
Q0UgICAgLWMgLW8gdGFyZ2V0Lm8gdGFyZ2V0LmMKbWFrZVsyXTogRW50ZXJpbmcgZGlyZWN0b3J5
IGAvb3B0L3dvcmtfamFnYWRlZXNoL3Bva3kvYnVpbGQvdG1wL3dvcmstc2hhcmVkL3FlbXV4ODYv
a2VybmVsLWJ1aWxkLWFydGlmYWN0cycKICBDQyBbTV0gIC9vcHQvd29ya19qYWdhZGVlc2gvcG9r
eS9idWlsZC90bXAvd29yay9xZW11eDg2LXBva3ktbGludXgvaXNjc2l0YXJnZXQvMS40LjIwLjMr
c3ZuNTAyLXIwL2lzY3NpdGFyZ2V0LTEuNC4yMC4zK3N2bjUwMi9rZXJuZWwvdGlvLm8KaTU4Ni1w
b2t5LWxpbnV4LWdjYyAgLW0zMiAtbWFyY2g9aTU4NiAtLXN5c3Jvb3Q9L29wdC93b3JrX2phZ2Fk
ZWVzaC9wb2t5L2J1aWxkL3RtcC9zeXNyb290cy9xZW11eDg2IC1PMiAtcGlwZSAtZyAtZmVsaW1p
bmF0ZS11bnVzZWQtZGVidWctdHlwZXMgLU8yIC1mbm8taW5saW5lIC1XYWxsIC1Xc3RyaWN0LXBy
b3RvdHlwZXMgLUkuLi9pbmNsdWRlIC1EX0dOVV9TT1VSQ0UgICAgLWMgLW8gbWVzc2FnZS5vIG1l
c3NhZ2UuYwppNTg2LXBva3ktbGludXgtZ2NjICAtbTMyIC1tYXJjaD1pNTg2IC0tc3lzcm9vdD0v
b3B0L3dvcmtfamFnYWRlZXNoL3Bva3kvYnVpbGQvdG1wL3N5c3Jvb3RzL3FlbXV4ODYgLU8yIC1w
aXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtTzIgLWZuby1pbmxpbmUgLVdh
bGwgLVdzdHJpY3QtcHJvdG90eXBlcyAtSS4uL2luY2x1ZGUgLURfR05VX1NPVVJDRSAgICAtYyAt
byBjdGxkZXYubyBjdGxkZXYuYwpJbiBmaWxlIGluY2x1ZGVkIGZyb20gL29wdC93b3JrX2phZ2Fk
ZWVzaC9wb2t5L2J1aWxkL3RtcC93b3JrLXNoYXJlZC9xZW11eDg2L2tlcm5lbC1zb3VyY2UvaW5j
bHVkZS9saW51eC9zY2hlZC5oOjE3OjAsCiAgICAgICAgICAgICAgICAgZnJvbSAvb3B0L3dvcmtf
amFnYWRlZXNoL3Bva3kvYnVpbGQvdG1wL3dvcmstc2hhcmVkL3FlbXV4ODYva2VybmVsLXNvdXJj
ZS9pbmNsdWRlL2xpbnV4L2Jsa2Rldi5oOjQsCiAgICAgICAgICAgICAgICAgZnJvbSAvb3B0L3dv
cmtfamFnYWRlZXNoL3Bva3kvYnVpbGQvdG1wL3dvcmsvcWVtdXg4Ni1wb2t5LWxpbnV4L2lzY3Np
dGFyZ2V0LzEuNC4yMC4zK3N2bjUwMi1yMC9pc2NzaXRhcmdldC0xLjQuMjAuMytzdm41MDIva2Vy
bmVsL2lzY3NpLmg6MTEsCiAgICAgICAgICAgICAgICAgZnJvbSAvb3B0L3dvcmtfamFnYWRlZXNo
L3Bva3kvYnVpbGQvdG1wL3dvcmsvcWVtdXg4Ni1wb2t5LWxpbnV4L2lzY3NpdGFyZ2V0LzEuNC4y
MC4zK3N2bjUwMi1yMC9pc2NzaXRhcmdldC0xLjQuMjAuMytzdm41MDIva2VybmVsL3Rpby5jOjc6
Ci9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAvd29yay9xZW11eDg2LXBva3ktbGlu
dXgvaXNjc2l0YXJnZXQvMS40LjIwLjMrc3ZuNTAyLXIwL2lzY3NpdGFyZ2V0LTEuNC4yMC4zK3N2
bjUwMi9rZXJuZWwvdGlvLmM6IEluIGZ1bmN0aW9uICd0aW9fYWRkX2RhdGEnOgovb3B0L3dvcmtf
amFnYWRlZXNoL3Bva3kvYnVpbGQvdG1wL3dvcmstc2hhcmVkL3FlbXV4ODYva2VybmVsLXNvdXJj
ZS9pbmNsdWRlL2xpbnV4L2tlcm5lbC5oOjcyMzoxNzogd2FybmluZzogY29tcGFyaXNvbiBvZiBk
aXN0aW5jdCBwb2ludGVyIHR5cGVzIGxhY2tzIGEgY2FzdAogICh2b2lkKSAoJl9taW4xID09ICZf
bWluMik7ICBcCiAgICAgICAgICAgICAgICAgXgovb3B0L3dvcmtfamFnYWRlZXNoL3Bva3kvYnVp
bGQvdG1wL3dvcmsvcWVtdXg4Ni1wb2t5LWxpbnV4L2lzY3NpdGFyZ2V0LzEuNC4yMC4zK3N2bjUw
Mi1yMC9pc2NzaXRhcmdldC0xLjQuMjAuMytzdm41MDIva2VybmVsL3Rpby5jOjc1OjI1OiBub3Rl
OiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ21pbicKICBjb25zdCBzaXplX3QgdG9fY29weSA9IG1p
bih0aW8tPnBnX2NudCAqIFBBR0VfU0laRSAtIGl0ZXItPnNpemUsIGxlbik7CiAgICAgICAgICAg
ICAgICAgICAgICAgICBeCi9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAvd29yay1z
aGFyZWQvcWVtdXg4Ni9rZXJuZWwtc291cmNlL2luY2x1ZGUvbGludXgva2VybmVsLmg6NzIzOjE3
OiB3YXJuaW5nOiBjb21wYXJpc29uIG9mIGRpc3RpbmN0IHBvaW50ZXIgdHlwZXMgbGFja3MgYSBj
YXN0CiAgKHZvaWQpICgmX21pbjEgPT0gJl9taW4yKTsgIFwKICAgICAgICAgICAgICAgICBeCi9v
cHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAvd29yay9xZW11eDg2LXBva3ktbGludXgv
aXNjc2l0YXJnZXQvMS40LjIwLjMrc3ZuNTAyLXIwL2lzY3NpdGFyZ2V0LTEuNC4yMC4zK3N2bjUw
Mi9rZXJuZWwvdGlvLmM6ODI6MTg6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyAnbWluJwog
ICBzaXplX3QgY2h1bmsgPSBtaW4oUEFHRV9TSVpFIC0gaXRlci0+cGdfb2ZmLCByZXNpZHVhbCk7
CiAgICAgICAgICAgICAgICAgIF4KaTU4Ni1wb2t5LWxpbnV4LWdjYyAgLW0zMiAtbWFyY2g9aTU4
NiAtLXN5c3Jvb3Q9L29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxkL3RtcC9zeXNyb290cy9x
ZW11eDg2IC1PMiAtcGlwZSAtZyAtZmVsaW1pbmF0ZS11bnVzZWQtZGVidWctdHlwZXMgLU8yIC1m
bm8taW5saW5lIC1XYWxsIC1Xc3RyaWN0LXByb3RvdHlwZXMgLUkuLi9pbmNsdWRlIC1EX0dOVV9T
T1VSQ0UgICAgLWMgLW8gbG9nLm8gbG9nLmMKICBDQyBbTV0gIC9vcHQvd29ya19qYWdhZGVlc2gv
cG9reS9idWlsZC90bXAvd29yay9xZW11eDg2LXBva3ktbGludXgvaXNjc2l0YXJnZXQvMS40LjIw
LjMrc3ZuNTAyLXIwL2lzY3NpdGFyZ2V0LTEuNC4yMC4zK3N2bjUwMi9rZXJuZWwvaXNjc2kubwpp
NTg2LXBva3ktbGludXgtZ2NjICAtbTMyIC1tYXJjaD1pNTg2IC0tc3lzcm9vdD0vb3B0L3dvcmtf
amFnYWRlZXNoL3Bva3kvYnVpbGQvdG1wL3N5c3Jvb3RzL3FlbXV4ODYgLU8yIC1waXBlIC1nIC1m
ZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtTzIgLWZuby1pbmxpbmUgLVdhbGwgLVdzdHJp
Y3QtcHJvdG90eXBlcyAtSS4uL2luY2x1ZGUgLURfR05VX1NPVVJDRSAgICAtYyAtbyBjaGFwLm8g
Y2hhcC5jCmk1ODYtcG9reS1saW51eC1nY2MgIC1tMzIgLW1hcmNoPWk1ODYgLS1zeXNyb290PS9v
cHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAvc3lzcm9vdHMvcWVtdXg4NiAtTzIgLXBp
cGUgLWcgLWZlbGltaW5hdGUtdW51c2VkLWRlYnVnLXR5cGVzIC1PMiAtZm5vLWlubGluZSAtV2Fs
bCAtV3N0cmljdC1wcm90b3R5cGVzIC1JLi4vaW5jbHVkZSAtRF9HTlVfU09VUkNFICAgIC1jIC1v
IGV2ZW50Lm8gZXZlbnQuYwppNTg2LXBva3ktbGludXgtZ2NjICAtbTMyIC1tYXJjaD1pNTg2IC0t
c3lzcm9vdD0vb3B0L3dvcmtfamFnYWRlZXNoL3Bva3kvYnVpbGQvdG1wL3N5c3Jvb3RzL3FlbXV4
ODYgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtTzIgLWZuby1p
bmxpbmUgLVdhbGwgLVdzdHJpY3QtcHJvdG90eXBlcyAtSS4uL2luY2x1ZGUgLURfR05VX1NPVVJD
RSAgICAtYyAtbyBwYXJhbS5vIHBhcmFtLmMKcGFyYW0uYzogSW4gZnVuY3Rpb24gJ21pbmltdW1f
Y2hlY2tfdmFsJzoKcGFyYW0uYzo5NTo2OiB3YXJuaW5nOiB2YXJpYWJsZSAnZXJyJyBzZXQgYnV0
IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQogIGludCBlcnIgPSAwOwogICAg
ICBeCnBhcmFtLmM6IEluIGZ1bmN0aW9uICdtYXhpbXVtX2NoZWNrX3ZhbCc6CnBhcmFtLmM6MTA3
OjY6IHdhcm5pbmc6IHZhcmlhYmxlICdlcnInIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1
dC1zZXQtdmFyaWFibGVdCiAgaW50IGVyciA9IDA7CiAgICAgIF4KaTU4Ni1wb2t5LWxpbnV4LWdj
YyAgLW0zMiAtbWFyY2g9aTU4NiAtLXN5c3Jvb3Q9L29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1
aWxkL3RtcC9zeXNyb290cy9xZW11eDg2IC1PMiAtcGlwZSAtZyAtZmVsaW1pbmF0ZS11bnVzZWQt
ZGVidWctdHlwZXMgLU8yIC1mbm8taW5saW5lIC1XYWxsIC1Xc3RyaWN0LXByb3RvdHlwZXMgLUku
Li9pbmNsdWRlIC1EX0dOVV9TT1VSQ0UgICAgLWMgLW8gcGxhaW4ubyBwbGFpbi5jCmk1ODYtcG9r
eS1saW51eC1nY2MgIC1tMzIgLW1hcmNoPWk1ODYgLS1zeXNyb290PS9vcHQvd29ya19qYWdhZGVl
c2gvcG9reS9idWlsZC90bXAvc3lzcm9vdHMvcWVtdXg4NiAtTzIgLXBpcGUgLWcgLWZlbGltaW5h
dGUtdW51c2VkLWRlYnVnLXR5cGVzIC1PMiAtZm5vLWlubGluZSAtV2FsbCAtV3N0cmljdC1wcm90
b3R5cGVzIC1JLi4vaW5jbHVkZSAtRF9HTlVfU09VUkNFICAgIC1jIC1vIGlzbnMubyBpc25zLmMK
ICBDQyBbTV0gIC9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAvd29yay9xZW11eDg2
LXBva3ktbGludXgvaXNjc2l0YXJnZXQvMS40LjIwLjMrc3ZuNTAyLXIwL2lzY3NpdGFyZ2V0LTEu
NC4yMC4zK3N2bjUwMi9rZXJuZWwvbnRocmVhZC5vCmk1ODYtcG9reS1saW51eC1nY2MgIC1tMzIg
LW1hcmNoPWk1ODYgLS1zeXNyb290PS9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAv
c3lzcm9vdHMvcWVtdXg4NiAtTzIgLXBpcGUgLWcgLWZlbGltaW5hdGUtdW51c2VkLWRlYnVnLXR5
cGVzIC1PMiAtZm5vLWlubGluZSAtV2FsbCAtV3N0cmljdC1wcm90b3R5cGVzIC1JLi4vaW5jbHVk
ZSAtRF9HTlVfU09VUkNFICAgIC1jIC1vIG1kNS5vIG1kNS5jCmk1ODYtcG9reS1saW51eC1nY2Mg
IC1tMzIgLW1hcmNoPWk1ODYgLS1zeXNyb290PS9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWls
ZC90bXAvc3lzcm9vdHMvcWVtdXg4NiAtTzIgLXBpcGUgLWcgLWZlbGltaW5hdGUtdW51c2VkLWRl
YnVnLXR5cGVzIC1PMiAtZm5vLWlubGluZSAtV2FsbCAtV3N0cmljdC1wcm90b3R5cGVzIC1JLi4v
aW5jbHVkZSAtRF9HTlVfU09VUkNFICAgIC1jIC1vIHNoYTEubyBzaGExLmMKL29wdC93b3JrX2ph
Z2FkZWVzaC9wb2t5L2J1aWxkL3RtcC93b3JrL3FlbXV4ODYtcG9reS1saW51eC9pc2NzaXRhcmdl
dC8xLjQuMjAuMytzdm41MDItcjAvaXNjc2l0YXJnZXQtMS40LjIwLjMrc3ZuNTAyL2tlcm5lbC9u
dGhyZWFkLmM6IEluIGZ1bmN0aW9uICdkb19yZWN2JzoKL29wdC93b3JrX2phZ2FkZWVzaC9wb2t5
L2J1aWxkL3RtcC93b3JrL3FlbXV4ODYtcG9reS1saW51eC9pc2NzaXRhcmdldC8xLjQuMjAuMytz
dm41MDItcjAvaXNjc2l0YXJnZXQtMS40LjIwLjMrc3ZuNTAyL2tlcm5lbC9udGhyZWFkLmM6MTI5
OjMzOiB3YXJuaW5nOiBwYXNzaW5nIGFyZ3VtZW50IDIgb2YgJ3NvY2tfcmVjdm1zZycgZnJvbSBp
bmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQog
IHJlcyA9IHNvY2tfcmVjdm1zZyhjb25uLT5zb2NrLCAmbXNnLCBsZW4sIE1TR19ET05UV0FJVCB8
IE1TR19OT1NJR05BTCk7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIC9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAvd29yay1z
aGFyZWQvcWVtdXg4Ni9rZXJuZWwtc291cmNlL2luY2x1ZGUvbGludXgvc2tidWZmLmg6Mjk6MCwK
ICAgICAgICAgICAgICAgICBmcm9tIC9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAv
d29yay1zaGFyZWQvcWVtdXg4Ni9rZXJuZWwtc291cmNlL2luY2x1ZGUvbGludXgvaWZfZXRoZXIu
aDoyMywKICAgICAgICAgICAgICAgICBmcm9tIC9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWls
ZC90bXAvd29yay1zaGFyZWQvcWVtdXg4Ni9rZXJuZWwtc291cmNlL2luY2x1ZGUvdWFwaS9saW51
eC9ldGh0b29sLmg6MTcsCiAgICAgICAgICAgICAgICAgZnJvbSAvb3B0L3dvcmtfamFnYWRlZXNo
L3Bva3kvYnVpbGQvdG1wL3dvcmstc2hhcmVkL3FlbXV4ODYva2VybmVsLXNvdXJjZS9pbmNsdWRl
L2xpbnV4L2V0aHRvb2wuaDoxNiwKICAgICAgICAgICAgICAgICBmcm9tIC9vcHQvd29ya19qYWdh
ZGVlc2gvcG9reS9idWlsZC90bXAvd29yay1zaGFyZWQvcWVtdXg4Ni9rZXJuZWwtc291cmNlL2lu
Y2x1ZGUvbGludXgvbmV0ZGV2aWNlLmg6NDIsCiAgICAgICAgICAgICAgICAgZnJvbSAvb3B0L3dv
cmtfamFnYWRlZXNoL3Bva3kvYnVpbGQvdG1wL3dvcmstc2hhcmVkL3FlbXV4ODYva2VybmVsLXNv
dXJjZS9pbmNsdWRlL25ldC9zb2NrLmg6NTEsCiAgICAgICAgICAgICAgICAgZnJvbSAvb3B0L3dv
cmtfamFnYWRlZXNoL3Bva3kvYnVpbGQvdG1wL3dvcmsvcWVtdXg4Ni1wb2t5LWxpbnV4L2lzY3Np
dGFyZ2V0LzEuNC4yMC4zK3N2bjUwMi1yMC9pc2NzaXRhcmdldC0xLjQuMjAuMytzdm41MDIva2Vy
bmVsL2lzY3NpLmg6MTksCiAgICAgICAgICAgICAgICAgZnJvbSAvb3B0L3dvcmtfamFnYWRlZXNo
L3Bva3kvYnVpbGQvdG1wL3dvcmsvcWVtdXg4Ni1wb2t5LWxpbnV4L2lzY3NpdGFyZ2V0LzEuNC4y
MC4zK3N2bjUwMi1yMC9pc2NzaXRhcmdldC0xLjQuMjAuMytzdm41MDIva2VybmVsL250aHJlYWQu
YzoxNjoKL29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxkL3RtcC93b3JrLXNoYXJlZC9xZW11
eDg2L2tlcm5lbC1zb3VyY2UvaW5jbHVkZS9saW51eC9uZXQuaDoyMTU6NTogbm90ZTogZXhwZWN0
ZWQgJ3N0cnVjdCBtc2doZHIgKicgYnV0IGFyZ3VtZW50IGlzIG9mIHR5cGUgJ3N0cnVjdCB1c2Vy
X21zZ2hkciAqJwogaW50IHNvY2tfcmVjdm1zZyhzdHJ1Y3Qgc29ja2V0ICpzb2NrLCBzdHJ1Y3Qg
bXNnaGRyICptc2csIHNpemVfdCBzaXplLAogICAgIF4KL29wdC93b3JrX2phZ2FkZWVzaC9wb2t5
L2J1aWxkL3RtcC93b3JrL3FlbXV4ODYtcG9reS1saW51eC9pc2NzaXRhcmdldC8xLjQuMjAuMytz
dm41MDItcjAvaXNjc2l0YXJnZXQtMS40LjIwLjMrc3ZuNTAyL2tlcm5lbC9udGhyZWFkLmM6IElu
IGZ1bmN0aW9uICd0eF9kZGlnZXN0JzoKL29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxkL3Rt
cC93b3JrL3FlbXV4ODYtcG9reS1saW51eC9pc2NzaXRhcmdldC8xLjQuMjAuMytzdm41MDItcjAv
aXNjc2l0YXJnZXQtMS40LjIwLjMrc3ZuNTAyL2tlcm5lbC9udGhyZWFkLmM6NDgxOjQxOiB3YXJu
aW5nOiBwYXNzaW5nIGFyZ3VtZW50IDIgb2YgJ2tlcm5lbF9zZW5kbXNnJyBmcm9tIGluY29tcGF0
aWJsZSBwb2ludGVyIHR5cGUgWy1XaW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCiAgcmVzID0g
a2VybmVsX3NlbmRtc2coY21uZC0+Y29ubi0+c29jaywgJm1zZywgJmlvdiwgMSwgcmVzdCk7CiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgpJbiBmaWxlIGluY2x1ZGVk
IGZyb20gL29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxkL3RtcC93b3JrLXNoYXJlZC9xZW11
eDg2L2tlcm5lbC1zb3VyY2UvaW5jbHVkZS9saW51eC9za2J1ZmYuaDoyOTowLAogICAgICAgICAg
ICAgICAgIGZyb20gL29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxkL3RtcC93b3JrLXNoYXJl
ZC9xZW11eDg2L2tlcm5lbC1zb3VyY2UvaW5jbHVkZS9saW51eC9pZl9ldGhlci5oOjIzLAogICAg
ICAgICAgICAgICAgIGZyb20gL29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxkL3RtcC93b3Jr
LXNoYXJlZC9xZW11eDg2L2tlcm5lbC1zb3VyY2UvaW5jbHVkZS91YXBpL2xpbnV4L2V0aHRvb2wu
aDoxNywKICAgICAgICAgICAgICAgICBmcm9tIC9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWls
ZC90bXAvd29yay1zaGFyZWQvcWVtdXg4Ni9rZXJuZWwtc291cmNlL2luY2x1ZGUvbGludXgvZXRo
dG9vbC5oOjE2LAogICAgICAgICAgICAgICAgIGZyb20gL29wdC93b3JrX2phZ2FkZWVzaC9wb2t5
L2J1aWxkL3RtcC93b3JrLXNoYXJlZC9xZW11eDg2L2tlcm5lbC1zb3VyY2UvaW5jbHVkZS9saW51
eC9uZXRkZXZpY2UuaDo0MiwKICAgICAgICAgICAgICAgICBmcm9tIC9vcHQvd29ya19qYWdhZGVl
c2gvcG9reS9idWlsZC90bXAvd29yay1zaGFyZWQvcWVtdXg4Ni9rZXJuZWwtc291cmNlL2luY2x1
ZGUvbmV0L3NvY2suaDo1MSwKICAgICAgICAgICAgICAgICBmcm9tIC9vcHQvd29ya19qYWdhZGVl
c2gvcG9reS9idWlsZC90bXAvd29yay9xZW11eDg2LXBva3ktbGludXgvaXNjc2l0YXJnZXQvMS40
LjIwLjMrc3ZuNTAyLXIwL2lzY3NpdGFyZ2V0LTEuNC4yMC4zK3N2bjUwMi9rZXJuZWwvaXNjc2ku
aDoxOSwKICAgICAgICAgICAgICAgICBmcm9tIC9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWls
ZC90bXAvd29yay9xZW11eDg2LXBva3ktbGludXgvaXNjc2l0YXJnZXQvMS40LjIwLjMrc3ZuNTAy
LXIwL2lzY3NpdGFyZ2V0LTEuNC4yMC4zK3N2bjUwMi9rZXJuZWwvbnRocmVhZC5jOjE2Ogovb3B0
L3dvcmtfamFnYWRlZXNoL3Bva3kvYnVpbGQvdG1wL3dvcmstc2hhcmVkL3FlbXV4ODYva2VybmVs
LXNvdXJjZS9pbmNsdWRlL2xpbnV4L25ldC5oOjI2Mzo1OiBub3RlOiBleHBlY3RlZCAnc3RydWN0
IG1zZ2hkciAqJyBidXQgYXJndW1lbnQgaXMgb2YgdHlwZSAnc3RydWN0IHVzZXJfbXNnaGRyICon
CiBpbnQga2VybmVsX3NlbmRtc2coc3RydWN0IHNvY2tldCAqc29jaywgc3RydWN0IG1zZ2hkciAq
bXNnLCBzdHJ1Y3Qga3ZlYyAqdmVjLAogICAgIF4KL29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1
aWxkL3RtcC93b3JrL3FlbXV4ODYtcG9reS1saW51eC9pc2NzaXRhcmdldC8xLjQuMjAuMytzdm41
MDItcjAvaXNjc2l0YXJnZXQtMS40LjIwLjMrc3ZuNTAyL2tlcm5lbC9udGhyZWFkLmM6IEluIGZ1
bmN0aW9uICdjbG9zZV9jb25uJzoKL29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxkL3RtcC93
b3JrL3FlbXV4ODYtcG9reS1saW51eC9pc2NzaXRhcmdldC8xLjQuMjAuMytzdm41MDItcjAvaXNj
c2l0YXJnZXQtMS40LjIwLjMrc3ZuNTAyL2tlcm5lbC9udGhyZWFkLmM6NjgwOjMyOiB3YXJuaW5n
OiBhc3NpZ25tZW50IGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBbLVdpbmNvbXBhdGli
bGUtcG9pbnRlci10eXBlc10KICBjb25uLT5zb2NrLT5zay0+c2tfZGF0YV9yZWFkeSA9IHRhcmdl
dC0+bnRocmVhZF9pbmZvLm9sZF9kYXRhX3JlYWR5OwogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4KaTU4Ni1wb2t5LWxpbnV4LWdjYyAgLW0zMiAtbWFyY2g9aTU4NiAtLXN5c3Jvb3Q9
L29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxkL3RtcC9zeXNyb290cy9xZW11eDg2ICBpZXRk
Lm8gaXNjc2lkLm8gY29ubi5vIHNlc3Npb24ubyB0YXJnZXQubyBtZXNzYWdlLm8gY3RsZGV2Lm8g
bG9nLm8gY2hhcC5vIGV2ZW50Lm8gcGFyYW0ubyBwbGFpbi5vIGlzbnMubyBtZDUubyBzaGExLm8g
LW8gaWV0ZCAKaTU4Ni1wb2t5LWxpbnV4LWdjYyAgLW0zMiAtbWFyY2g9aTU4NiAtLXN5c3Jvb3Q9
L29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxkL3RtcC9zeXNyb290cy9xZW11eDg2IC1PMiAt
cGlwZSAtZyAtZmVsaW1pbmF0ZS11bnVzZWQtZGVidWctdHlwZXMgLU8yIC1mbm8taW5saW5lIC1X
YWxsIC1Xc3RyaWN0LXByb3RvdHlwZXMgLUkuLi9pbmNsdWRlIC1EX0dOVV9TT1VSQ0UgICAgLWMg
LW8gaWV0YWRtLm8gaWV0YWRtLmMKICBDQyBbTV0gIC9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9i
dWlsZC90bXAvd29yay9xZW11eDg2LXBva3ktbGludXgvaXNjc2l0YXJnZXQvMS40LjIwLjMrc3Zu
NTAyLXIwL2lzY3NpdGFyZ2V0LTEuNC4yMC4zK3N2bjUwMi9rZXJuZWwvd3RocmVhZC5vCmk1ODYt
cG9reS1saW51eC1nY2MgIC1tMzIgLW1hcmNoPWk1ODYgLS1zeXNyb290PS9vcHQvd29ya19qYWdh
ZGVlc2gvcG9reS9idWlsZC90bXAvc3lzcm9vdHMvcWVtdXg4NiAgaWV0YWRtLm8gcGFyYW0ubyAt
byBpZXRhZG0KbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgYC9vcHQvd29ya19qYWdhZGVlc2gv
cG9reS9idWlsZC90bXAvd29yay9xZW11eDg2LXBva3ktbGludXgvaXNjc2l0YXJnZXQvMS40LjIw
LjMrc3ZuNTAyLXIwL2lzY3NpdGFyZ2V0LTEuNC4yMC4zK3N2bjUwMi91c3InCiAgQ0MgW01dICAv
b3B0L3dvcmtfamFnYWRlZXNoL3Bva3kvYnVpbGQvdG1wL3dvcmsvcWVtdXg4Ni1wb2t5LWxpbnV4
L2lzY3NpdGFyZ2V0LzEuNC4yMC4zK3N2bjUwMi1yMC9pc2NzaXRhcmdldC0xLjQuMjAuMytzdm41
MDIva2VybmVsL2NvbmZpZy5vCiAgQ0MgW01dICAvb3B0L3dvcmtfamFnYWRlZXNoL3Bva3kvYnVp
bGQvdG1wL3dvcmsvcWVtdXg4Ni1wb2t5LWxpbnV4L2lzY3NpdGFyZ2V0LzEuNC4yMC4zK3N2bjUw
Mi1yMC9pc2NzaXRhcmdldC0xLjQuMjAuMytzdm41MDIva2VybmVsL2RpZ2VzdC5vCiAgQ0MgW01d
ICAvb3B0L3dvcmtfamFnYWRlZXNoL3Bva3kvYnVpbGQvdG1wL3dvcmsvcWVtdXg4Ni1wb2t5LWxp
bnV4L2lzY3NpdGFyZ2V0LzEuNC4yMC4zK3N2bjUwMi1yMC9pc2NzaXRhcmdldC0xLjQuMjAuMytz
dm41MDIva2VybmVsL2Nvbm4ubwovb3B0L3dvcmtfamFnYWRlZXNoL3Bva3kvYnVpbGQvdG1wL3dv
cmsvcWVtdXg4Ni1wb2t5LWxpbnV4L2lzY3NpdGFyZ2V0LzEuNC4yMC4zK3N2bjUwMi1yMC9pc2Nz
aXRhcmdldC0xLjQuMjAuMytzdm41MDIva2VybmVsL2Nvbm4uYzogSW4gZnVuY3Rpb24gJ2lldF9z
b2NrZXRfYmluZCc6Ci9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAvd29yay9xZW11
eDg2LXBva3ktbGludXgvaXNjc2l0YXJnZXQvMS40LjIwLjMrc3ZuNTAyLXIwL2lzY3NpdGFyZ2V0
LTEuNC4yMC4zK3N2bjUwMi9rZXJuZWwvY29ubi5jOjE0MTozODogd2FybmluZzogYXNzaWdubWVu
dCBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XaW5jb21wYXRpYmxlLXBvaW50ZXIt
dHlwZXNdCiAgdGFyZ2V0LT5udGhyZWFkX2luZm8ub2xkX2RhdGFfcmVhZHkgPSBjb25uLT5zb2Nr
LT5zay0+c2tfZGF0YV9yZWFkeTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeCi9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAvd29yay9xZW11eDg2LXBva3kt
bGludXgvaXNjc2l0YXJnZXQvMS40LjIwLjMrc3ZuNTAyLXIwL2lzY3NpdGFyZ2V0LTEuNC4yMC4z
K3N2bjUwMi9rZXJuZWwvY29ubi5jOjE0MjozMjogd2FybmluZzogYXNzaWdubWVudCBmcm9tIGlu
Y29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XaW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCiAg
Y29ubi0+c29jay0+c2stPnNrX2RhdGFfcmVhZHkgPSBpZXRfZGF0YV9yZWFkeTsKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeCiAgQ0MgW01dICAvb3B0L3dvcmtfamFnYWRlZXNoL3Bv
a3kvYnVpbGQvdG1wL3dvcmsvcWVtdXg4Ni1wb2t5LWxpbnV4L2lzY3NpdGFyZ2V0LzEuNC4yMC4z
K3N2bjUwMi1yMC9pc2NzaXRhcmdldC0xLjQuMjAuMytzdm41MDIva2VybmVsL3Nlc3Npb24ubwog
IENDIFtNXSAgL29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxkL3RtcC93b3JrL3FlbXV4ODYt
cG9reS1saW51eC9pc2NzaXRhcmdldC8xLjQuMjAuMytzdm41MDItcjAvaXNjc2l0YXJnZXQtMS40
LjIwLjMrc3ZuNTAyL2tlcm5lbC90YXJnZXQubwogIENDIFtNXSAgL29wdC93b3JrX2phZ2FkZWVz
aC9wb2t5L2J1aWxkL3RtcC93b3JrL3FlbXV4ODYtcG9reS1saW51eC9pc2NzaXRhcmdldC8xLjQu
MjAuMytzdm41MDItcjAvaXNjc2l0YXJnZXQtMS40LjIwLjMrc3ZuNTAyL2tlcm5lbC92b2x1bWUu
bwogIENDIFtNXSAgL29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxkL3RtcC93b3JrL3FlbXV4
ODYtcG9reS1saW51eC9pc2NzaXRhcmdldC8xLjQuMjAuMytzdm41MDItcjAvaXNjc2l0YXJnZXQt
MS40LjIwLjMrc3ZuNTAyL2tlcm5lbC9pb3R5cGUubwogIENDIFtNXSAgL29wdC93b3JrX2phZ2Fk
ZWVzaC9wb2t5L2J1aWxkL3RtcC93b3JrL3FlbXV4ODYtcG9reS1saW51eC9pc2NzaXRhcmdldC8x
LjQuMjAuMytzdm41MDItcjAvaXNjc2l0YXJnZXQtMS40LjIwLjMrc3ZuNTAyL2tlcm5lbC9maWxl
LWlvLm8KICBDQyBbTV0gIC9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAvd29yay9x
ZW11eDg2LXBva3ktbGludXgvaXNjc2l0YXJnZXQvMS40LjIwLjMrc3ZuNTAyLXIwL2lzY3NpdGFy
Z2V0LTEuNC4yMC4zK3N2bjUwMi9rZXJuZWwvbnVsbC1pby5vCiAgQ0MgW01dICAvb3B0L3dvcmtf
amFnYWRlZXNoL3Bva3kvYnVpbGQvdG1wL3dvcmsvcWVtdXg4Ni1wb2t5LWxpbnV4L2lzY3NpdGFy
Z2V0LzEuNC4yMC4zK3N2bjUwMi1yMC9pc2NzaXRhcmdldC0xLjQuMjAuMytzdm41MDIva2VybmVs
L3RhcmdldF9kaXNrLm8KICBDQyBbTV0gIC9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90
bXAvd29yay9xZW11eDg2LXBva3ktbGludXgvaXNjc2l0YXJnZXQvMS40LjIwLjMrc3ZuNTAyLXIw
L2lzY3NpdGFyZ2V0LTEuNC4yMC4zK3N2bjUwMi9rZXJuZWwvZXZlbnQubwogIENDIFtNXSAgL29w
dC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxkL3RtcC93b3JrL3FlbXV4ODYtcG9reS1saW51eC9p
c2NzaXRhcmdldC8xLjQuMjAuMytzdm41MDItcjAvaXNjc2l0YXJnZXQtMS40LjIwLjMrc3ZuNTAy
L2tlcm5lbC9wYXJhbS5vCiAgQ0MgW01dICAvb3B0L3dvcmtfamFnYWRlZXNoL3Bva3kvYnVpbGQv
dG1wL3dvcmsvcWVtdXg4Ni1wb2t5LWxpbnV4L2lzY3NpdGFyZ2V0LzEuNC4yMC4zK3N2bjUwMi1y
MC9pc2NzaXRhcmdldC0xLjQuMjAuMytzdm41MDIva2VybmVsL2Jsb2NrLWlvLm8KICBDQyBbTV0g
IC9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAvd29yay9xZW11eDg2LXBva3ktbGlu
dXgvaXNjc2l0YXJnZXQvMS40LjIwLjMrc3ZuNTAyLXIwL2lzY3NpdGFyZ2V0LTEuNC4yMC4zK3N2
bjUwMi9rZXJuZWwvdWEubwogIENDIFtNXSAgL29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxk
L3RtcC93b3JrL3FlbXV4ODYtcG9reS1saW51eC9pc2NzaXRhcmdldC8xLjQuMjAuMytzdm41MDIt
cjAvaXNjc2l0YXJnZXQtMS40LjIwLjMrc3ZuNTAyL2tlcm5lbC9wZXJzaXN0Lm8KICBMRCBbTV0g
IC9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAvd29yay9xZW11eDg2LXBva3ktbGlu
dXgvaXNjc2l0YXJnZXQvMS40LjIwLjMrc3ZuNTAyLXIwL2lzY3NpdGFyZ2V0LTEuNC4yMC4zK3N2
bjUwMi9rZXJuZWwvaXNjc2lfdHJndC5vCiAgQnVpbGRpbmcgbW9kdWxlcywgc3RhZ2UgMi4KICBN
T0RQT1NUIDEgbW9kdWxlcwogIENDICAgICAgL29wdC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxk
L3RtcC93b3JrL3FlbXV4ODYtcG9reS1saW51eC9pc2NzaXRhcmdldC8xLjQuMjAuMytzdm41MDIt
cjAvaXNjc2l0YXJnZXQtMS40LjIwLjMrc3ZuNTAyL2tlcm5lbC9pc2NzaV90cmd0Lm1vZC5vCiAg
TEQgW01dICAvb3B0L3dvcmtfamFnYWRlZXNoL3Bva3kvYnVpbGQvdG1wL3dvcmsvcWVtdXg4Ni1w
b2t5LWxpbnV4L2lzY3NpdGFyZ2V0LzEuNC4yMC4zK3N2bjUwMi1yMC9pc2NzaXRhcmdldC0xLjQu
MjAuMytzdm41MDIva2VybmVsL2lzY3NpX3RyZ3Qua28KbWFrZVsyXTogTGVhdmluZyBkaXJlY3Rv
cnkgYC9vcHQvd29ya19qYWdhZGVlc2gvcG9reS9idWlsZC90bXAvd29yay1zaGFyZWQvcWVtdXg4
Ni9rZXJuZWwtYnVpbGQtYXJ0aWZhY3RzJwptYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSBgL29w
dC93b3JrX2phZ2FkZWVzaC9wb2t5L2J1aWxkL3RtcC93b3JrLXNoYXJlZC9xZW11eDg2L2tlcm5l
bC1zb3VyY2UnCkRFQlVHOiBTaGVsbCBmdW5jdGlvbiBkb19jb21waWxlIGZpbmlzaGVkCg==

--001a11c33d0828628005233f3a87--
