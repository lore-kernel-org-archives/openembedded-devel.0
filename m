Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id BC806766D8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 13:29:41 +0000 (UTC)
Received: by wijp11 with SMTP id p11so166020006wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 06:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YZjBjfz7t3jO+tI6e0o4IP1q3yw7zki767A4Snn8fgo=;
	b=V5/CMgNkk3JnkXQP7PXKY2Epp+ztUqSPjsBp+QTY8UwYvdgFbCy5t7Is7J7gN3OnrK
	nFs57V6iXDspXmg3rTpYLf0Aizu44OvWbJ8xQPfxHu0PgNyk8uJMe5WeML231oyKzWZT
	IVXHTf6hfdCKyRMIayqRTcQbYdpsdRAY+mVA2iHpaz2QHsoIhH7lpzb3Gm6S+vkfOO+o
	OXMKhfDlfuwmQIObGQaflGeEUAmTgMBYAuvlcvwS8zDWsnEa2WZkVcjYqK0/xXa67WgA
	EuWS4q0CBOMgWCgI+DGeI/Ik2l5+4HOACcvwngbl612Xs47oqLcz6MLdT3csNtW6pMiJ
	yluw==
X-Received: by 10.180.96.162 with SMTP id dt2mr21478405wib.60.1445866179951;
	Mon, 26 Oct 2015 06:29:39 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s127sm2092222wmb.8.2015.10.26.06.29.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Oct 2015 06:29:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 26 Oct 2015 14:29:50 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151026132950.GE2554@jama>
References: <1440611069-20869-1-git-send-email-jkrishnanjanappa@mvista.com>
MIME-Version: 1.0
In-Reply-To: <1440611069-20869-1-git-send-email-jkrishnanjanappa@mvista.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Mon, 26 Oct 2015 13:29:42 -0000
X-Groupsio-MsgNum: 58026
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Content-Disposition: inline

--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2015 at 11:14:29PM +0530, Jagadeesh Krishnanjanappa wrote:
> iSCSI Enterprise Target is aimed to develop an
> open source iSCSI target with professional features,
> that works well in enterprise environment under real
> workload, and is scalable and versatile enough to meet the
> challenge of future storage needs and developments.

Fails to build in world:
http://errors.yoctoproject.org/Errors/Details/21028/

>=20
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  ...rors-observed-with-linux-3.19-and-greater.patch | 198 +++++++++++++++=
++++++
>  ...use-kernel-makefile-to-get-kernel-version.patch |  67 +++++++
>  .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  62 +++++++
>  3 files changed, 327 insertions(+)
>  create mode 100644 meta-networking/recipes-extended/iscsitarget/files/fi=
x-errors-observed-with-linux-3.19-and-greater.patch
>  create mode 100644 meta-networking/recipes-extended/iscsitarget/files/us=
e-kernel-makefile-to-get-kernel-version.patch
>  create mode 100644 meta-networking/recipes-extended/iscsitarget/iscsitar=
get_1.4.20.3+svn502.bb
>=20
> diff --git a/meta-networking/recipes-extended/iscsitarget/files/fix-error=
s-observed-with-linux-3.19-and-greater.patch b/meta-networking/recipes-exte=
nded/iscsitarget/files/fix-errors-observed-with-linux-3.19-and-greater.patch
> new file mode 100644
> index 0000000..6878ca2
> --- /dev/null
> +++ b/meta-networking/recipes-extended/iscsitarget/files/fix-errors-obser=
ved-with-linux-3.19-and-greater.patch
> @@ -0,0 +1,198 @@
> +Fix build errors with linux kernel v3.19 and above
> +
> +Below errors came up while building iscsitarget for=20
> +qemux86-64 (and others) because,
> +1. 'struct user_msghdr' is being used for userland-side msghdr instead
> +of 'struct msghdr', which is used for kernel-side msghdr in linux v3.19
> +and above.
> +
> +error snippet:
> +-- snip --
> +| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux=
/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/iscsi.c:=
 In function 'cmnd_skip_pdu':
> +| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux=
/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/iscsi.c:=
492:16: error: 'struct msghdr' has no member named 'msg_iov'
> +|   conn->read_msg.msg_iov =3D conn->read_iov;
> +-- CUT --
> +
> +Reference:
> +https://github.com/torvalds/linux/commit/666547ff591cebdedc4679bf6b1b3f3=
383a8dea3
> +
> +2. 'SERVICE_ACTION_IN' has been renamed to SERVICE_ACTION_IN_16 in linux=
 v3.19
> +and above.
> +
> +error snippet:
> +-- snip --
> +| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux=
/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/iscsi.c:=
 In function 'scsi_cmnd_start':
> +| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux=
/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/iscsi.c:=
989:7: error: 'SERVICE_ACTION_IN' undeclared (first use in this function)
> +|   case SERVICE_ACTION_IN:
> +-- CUT --
> +
> +Reference:
> +https://github.com/torvalds/linux/commit/eb846d9f147455e4e5e1863bfb5e319=
74bb69b7c
> +
> +3. In linux v3.19 and above, f_dentry member has been removed from=20
> +'struct file' structure.
> +
> +error snippet:
> +-- snip --
> +| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux=
/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c: =
In function 'iet_socket_bind':
> +| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux=
/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c:1=
30:34: error: 'struct file' has no member named 'f_dentry'
> +|   conn->sock =3D SOCKET_I(conn->file->f_dentry->d_inode);
> +-- CUT --
> +
> +new helper function file_inode(file) should be used instead.
> +
> +References:
> +1. https://github.com/torvalds/linux/commit/78d28e651f97866d608d9b41f8ad=
291e65d47dd5
> +2. https://github.com/torvalds/linux/commit/496ad9aa8ef448058e36ca7a787c=
61f2e63f0f54
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> +
> +--- iscsitarget-1.4.20.3+svn502_org/kernel/conn.c	2015-08-24 16:13:26.48=
1924679 +0530
> ++++ iscsitarget-1.4.20.3+svn502/kernel/conn.c	2015-08-24 17:27:06.897653=
698 +0530
> +@@ -127,7 +127,11 @@ static void iet_socket_bind(struct iscsi
> +=20
> + 	dprintk(D_GENERIC, "%llu\n", (unsigned long long) session->sid);
> +=20
> ++#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0)
> ++	conn->sock =3D SOCKET_I(file_inode(conn->file));
> ++#else
> + 	conn->sock =3D SOCKET_I(conn->file->f_dentry->d_inode);
> ++#endif /* LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0) */
> + 	conn->sock->sk->sk_user_data =3D conn;
> +=20
> + 	write_lock_bh(&conn->sock->sk->sk_callback_lock);
> +--- iscsitarget-1.4.20.3+svn502_org/kernel/file-io.c	2015-08-24 16:13:26=
=2E481924679 +0530
> ++++ iscsitarget-1.4.20.3+svn502/kernel/file-io.c	2015-08-24 17:30:54.390=
131100 +0530
> +@@ -69,7 +69,11 @@ static int fileio_make_request(struct ie
> + static int fileio_sync(struct iet_volume *lu, struct tio *tio)
> + {
> + 	struct fileio_data *p =3D lu->private;
> ++#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0)
> ++	struct inode *inode =3D file_inode(p->filp);
> ++#else
> + 	struct inode *inode =3D p->filp->f_dentry->d_inode;
> ++#endif /* LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0) */
> + 	struct address_space *mapping =3D inode->i_mapping;
> + 	loff_t ppos, count;
> + 	int res;
> +@@ -213,7 +217,11 @@ static int fileio_attach(struct iet_volu
> + 		eprintk("%d\n", err);
> + 		goto out;
> + 	}
> ++#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0)
> ++	inode =3D file_inode(p->filp);
> ++#else
> + 	inode =3D p->filp->f_dentry->d_inode;
> ++#endif /* LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0) */
> +=20
> + 	if (S_ISREG(inode->i_mode))
> + 		;
> +--- iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.c	2015-08-24 16:13:26.4=
81924679 +0530
> ++++ iscsitarget-1.4.20.3+svn502/kernel/iscsi.c	2015-08-24 17:33:50.95049=
0156 +0530
> +@@ -986,7 +986,11 @@ static void scsi_cmnd_start(struct iscsi
> + 		set_cmnd_lunit(req);
> +=20
> + 	switch (req_hdr->scb[0]) {
> ++#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0)
> ++	case SERVICE_ACTION_IN_16:
> ++#else
> + 	case SERVICE_ACTION_IN:
> ++#endif /* LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0) */
> + 		if ((req_hdr->scb[1] & 0x1f) !=3D 0x10)
> + 			goto error;
> + 	case INQUIRY:
> +--- iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h	2015-08-24 16:13:26.4=
81924679 +0530
> ++++ iscsitarget-1.4.20.3+svn502/kernel/iscsi.h	2015-08-24 17:35:31.35469=
0051 +0530
> +@@ -257,7 +257,11 @@ struct iscsi_conn {
> + 	struct timer_list nop_timer;
> +=20
> + 	struct iscsi_cmnd *read_cmnd;
> ++#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0)
> ++	struct user_msghdr read_msg;
> ++#else
> + 	struct msghdr read_msg;
> ++#endif /* LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0) */
> + 	struct iovec read_iov[ISCSI_CONN_IOV_MAX];
> + 	u32 read_size;
> + 	u32 read_overflow;
> +--- iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c	2015-08-24 16:13:26=
=2E481924679 +0530
> ++++ iscsitarget-1.4.20.3+svn502/kernel/nthread.c	2015-08-24 17:41:56.187=
428925 +0530
> +@@ -80,8 +80,11 @@ static int is_data_available(struct iscs
> + 	set_fs(oldfs);
> + 	return (res >=3D 0) ? avail : res;
> + }
> +-
> ++#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0)
> ++static void forward_iov(struct user_msghdr *msg, int len)
> ++#else
> + static void forward_iov(struct msghdr *msg, int len)
> ++#endif /* LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0) */
> + {
> + 	while (msg->msg_iov->iov_len <=3D len) {
> + 		len -=3D msg->msg_iov->iov_len;
> +@@ -96,7 +99,11 @@ static void forward_iov(struct msghdr *m
> + static int do_recv(struct iscsi_conn *conn, int state)
> + {
> + 	mm_segment_t oldfs;
> ++#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0)
> ++	struct user_msghdr msg;
> ++#else
> + 	struct msghdr msg;
> ++#endif /* LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0) */
> + 	struct iovec iov[ISCSI_CONN_IOV_MAX];
> + 	int i, len, res;
> +=20
> +@@ -461,7 +468,11 @@ static void exit_tx(struct iscsi_conn *c
> + static int tx_ddigest(struct iscsi_cmnd *cmnd, int state)
> + {
> + 	int res, rest =3D cmnd->conn->write_size;
> ++#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0)
> ++	struct user_msghdr msg =3D {.msg_flags =3D MSG_NOSIGNAL | MSG_DONTWAIT=
};
> ++#else
> + 	struct msghdr msg =3D {.msg_flags =3D MSG_NOSIGNAL | MSG_DONTWAIT};
> ++#endif /* LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0) */
> + 	struct kvec iov;
> +=20
> + 	iov.iov_base =3D (char *) (&cmnd->ddigest) + (sizeof(u32) - rest);
> +--- iscsitarget-1.4.20.3+svn502_org/kernel/target_disk.c	2015-08-24 16:1=
3:26.481924679 +0530
> ++++ iscsitarget-1.4.20.3+svn502/kernel/target_disk.c	2015-08-24 17:43:42=
=2E167625159 +0530
> +@@ -606,7 +606,11 @@ static int disk_execute_cmnd(struct iscs
> + 	case REQUEST_SENSE:
> + 		send_data_rsp(cmnd, build_request_sense_response);
> + 		break;
> ++#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0)
> ++	case SERVICE_ACTION_IN_16:
> ++#else
> + 	case SERVICE_ACTION_IN:
> ++#endif /* LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0) */=09
> + 		send_data_rsp(cmnd, build_service_action_in_response);
> + 		break;
> + 	case READ_6:
> +--- iscsitarget-1.4.20.3+svn502_org/kernel/volume.c	2015-08-24 16:13:26.=
477924674 +0530
> ++++ iscsitarget-1.4.20.3+svn502/kernel/volume.c	2015-08-24 18:28:15.6970=
74780 +0530
> +@@ -398,7 +398,11 @@ int is_volume_reserved(struct iet_volume
> + 		case READ_CAPACITY:
> + 			/* allowed commands when reserved */
> + 			break;
> ++#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0)		=09
> ++		case SERVICE_ACTION_IN_16:
> ++#else
> + 		case SERVICE_ACTION_IN:
> ++#endif /* LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0) */
> + 			if ((scb[1] & 0x1F) =3D=3D 0x10)
> + 				break;
> + 			/* fall through */
> +@@ -465,7 +469,11 @@ int is_volume_reserved(struct iet_volume
> + 		if (excl_access_ro && !registered)
> + 			err =3D -EBUSY;
> + 		break;
> ++#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0)
> ++	case SERVICE_ACTION_IN_16:
> ++#else
> + 	case SERVICE_ACTION_IN:
> ++#endif /* LINUX_VERSION_CODE >=3D KERNEL_VERSION(3, 19, 0) */
> + 		if ((scb[1] & 0x1F) =3D=3D 0x10)
> + 			break;
> + 		/* fall through */
> diff --git a/meta-networking/recipes-extended/iscsitarget/files/use-kerne=
l-makefile-to-get-kernel-version.patch b/meta-networking/recipes-extended/i=
scsitarget/files/use-kernel-makefile-to-get-kernel-version.patch
> new file mode 100644
> index 0000000..95bd047
> --- /dev/null
> +++ b/meta-networking/recipes-extended/iscsitarget/files/use-kernel-makef=
ile-to-get-kernel-version.patch
> @@ -0,0 +1,67 @@
> +Get linux kernel version from Makefile of kernel source
> +
> +We get below messages while building iscsitarget,
> +
> +-- snip --
> +x86_64-poky-linux-gcc: error:
> +/CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work-shared/qemux86-64/kerne=
l-source/include/linux/version.h:
> +No such file or directory
> +x86_64-poky-linux-gcc: fatal error: no input files
> +compilation terminated.
> +/bin/sh: line 0: [: too many arguments
> +/bin/sh: line 0: [: too many arguments
> +/bin/sh: line 0: [: too many arguments
> +/bin/sh: line 0: [: too many arguments
> +/bin/sh: line 0: [: too many arguments
> +/bin/sh: line 0: [: too many arguments
> +/bin/sh: line 0: [: too many arguments
> +/bin/sh: line 0: [: too many arguments
> +/bin/sh: line 0: [: too many arguments
> +/bin/sh: line 0: [: too many arguments
> +/bin/sh: line 0: [: too many arguments
> +/bin/sh: line 0: [: too many arguments
> +-- CUT --
> +
> +These messages are due to absence of include/linux/version.h file in=20
> +kernel source directory and failed to compute linux kernel version.
> +So, use kernel source Makefile ( i.e $(KSRC)/Makefile) to find out=20
> +actual kernel version.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> +
> +--- iscsitarget-1.4.20.3+svn499_org/Makefile	2014-01-27 00:00:45.0000000=
00 +0530
> ++++ iscsitarget-1.4.20.3+svn499/Makefile	2015-07-23 10:44:47.013600285 +=
0530
> +@@ -18,27 +18,11 @@ ifeq ($(KSRC),)
> + endif
> +=20
> +=20
> +-ifneq ($(wildcard $(KSRC)/include/generated/utsrelease.h),)
> +-	VERSION_FILE :=3D $(KSRC)/include/generated/utsrelease.h
> +-else
> +-  ifneq ($(wildcard $(KSRC)/include/linux/utsrelease.h),)
> +-	  VERSION_FILE :=3D $(KSRC)/include/linux/utsrelease.h
> +-  else
> +-	  VERSION_FILE :=3D $(KSRC)/include/linux/version.h
> +-  endif
> +-endif
> +-
> +-KVER :=3D $(shell $(CC) $(CFLAGS) $(LDFLAGS) -E -dM $(VERSION_FILE) | \
> +-	grep UTS_RELEASE | awk '{ print $$3 }' | sed 's/\"//g')
> +-
> + KMOD :=3D /lib/modules/$(KVER)/extra
> +-
> +-KMAJ :=3D $(shell echo $(KVER) | \
> +-	sed -e 's/^\([0-9][0-9]*\)\.[0-9][0-9]*\.[0-9][0-9]*.*/\1/')
> +-KMIN :=3D $(shell echo $(KVER) | \
> +-	sed -e 's/^[0-9][0-9]*\.\([0-9][0-9]*\)\.[0-9][0-9]*.*/\1/')
> +-KREV :=3D $(shell echo $(KVER) | \
> +-	sed -e 's/^[0-9][0-9]*\.[0-9][0-9]*\.\([0-9][0-9]*\).*/\1/')
> ++KMAJ :=3D $(shell cat $(KSRC)/Makefile | grep ^VERSION | gawk -F " " '{=
 print $$NF }')
> ++KMIN :=3D $(shell cat $(KSRC)/Makefile | grep ^PATCHLEVEL | gawk -F " "=
 '{ print $$NF }')
> ++KREV :=3D $(shell cat $(KSRC)/Makefile | grep ^SUBLEVEL | gawk -F " " '=
{ print $$NF }')
> ++KVER :=3D ${KMAJ}.${KMIN}.${KREV}
> +=20
> + kver_eq =3D $(shell [ $(KMAJ) -eq $(1) -a $(KMIN) -eq $(2) -a $(KREV) -=
eq $(3) ] && \
> + 	echo 1 || echo 0)
> diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4=
=2E20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarge=
t_1.4.20.3+svn502.bb
> new file mode 100644
> index 0000000..c96810b
> --- /dev/null
> +++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+s=
vn502.bb
> @@ -0,0 +1,62 @@
> +DESCRIPTION =3D "iSCSI Enterprise Target is aimed to develop an \
> +               open source iSCSI target with professional features, \
> +               that works well in enterprise environment under real \
> +               workload, and is scalable and versatile enough to meet th=
e \
> +               challenge of future storage needs and developments."
> +HOMEPAGE =3D "http://iscsitarget.sourceforge.net/"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6e233eda45c807aa29aeaa6d94bc4=
8a2"
> +DEPENDS =3D "openssl virtual/kernel"
> +
> +SRC_URI =3D "http://ftp.heanet.ie/mirrors/ubuntu/pool/universe/i/${BPN}/=
${BPN}_${PV}.orig.tar.gz \
> +           file://use-kernel-makefile-to-get-kernel-version.patch \
> +           file://fix-errors-observed-with-linux-3.19-and-greater.patch \
> +	  "
> +SRC_URI[md5sum] =3D "ef9bc823bbabd3c772208c00d5f2d089"
> +SRC_URI[sha256sum] =3D "d3196ccb78a43266dce28587bfe30d8ab4db7566d7bce960=
57dfbb84100babb5"
> +
> +inherit module-base
> +
> +# Add make_scripts task to create kernel scripts
> +addtask make_scripts after do_patch before do_compile
> +
> +do_configure[noexec] =3D "1"
> +
> +# make_scripts requires kernel source directory to create
> +# kernel scripts
> +do_make_scripts[depends] +=3D "virtual/kernel:do_shared_workdir"
> +
> +# Make sure we don't have race condition against "make scripts"
> +do_make_scripts[lockfiles] =3D "${TMPDIR}/kernel-scripts.lock"
> +
> +do_compile() {
> +    oe_runmake KSRC=3D${STAGING_KERNEL_DIR} CFLAGS=3D'${CFLAGS}' LDFLAGS=
=3D'' \
> +    CC=3D"${CC}" V=3D1
> +}
> +
> +do_install() {
> +    # Module
> +    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/iscsi
> +    install -m 0644 kernel/iscsi_trgt.ko \
> +    ${D}/lib/modules/${KERNEL_VERSION}/kernel/iscsi/iscsi_trgt.ko
> +   =20
> +    # Userspace utilities
> +    install -d ${D}${sbindir}
> +    install -m 0755 usr/ietd ${D}${sbindir}/ietd
> +    install -m 0755 usr/ietadm ${D}${sbindir}/ietadm
> +   =20
> +    # Config files, init scripts
> +    mkdir -p ${D}${sysconfdir}/iet
> +    install -m 0644 etc/ietd.conf ${D}/${sysconfdir}/iet/ietd.conf
> +    install -m 0644 etc/initiators.allow ${D}${sysconfdir}/iet/initiator=
s.allow
> +    install -m 0644 etc/targets.allow ${D}${sysconfdir}/iet/targets.allow
> +    mkdir -p ${D}${sysconfdir}/init.d
> +    install -m 0755 etc/initd/initd ${D}${sysconfdir}/init.d/iscsi-target
> +    install -m 0644 etc/initiators.deny ${D}${sysconfdir}/iet/initiators=
=2Edeny
> +}
> +
> +FILES_${PN} +=3D "${sbindir} \
> +                /lib \
> +                ${sysconfdir}"
> +
> +RRECOMMENDS_${PN} =3D "kernel-module-crc32c kernel-module-libcrc32c"
> --=20
> 1.8.2.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYuKs4ACgkQN1Ujt2V2gByB5ACfVdc1Mdu6MTDnF0qoyeBaHtTM
lHIAn3fZfhoshnBRGu7iGIlLFwLw3cc7
=1uK3
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--
