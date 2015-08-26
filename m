Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id C3D7D76DEB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 17:44:36 +0000 (UTC)
Received: by pabzx8 with SMTP id zx8so76811682pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 10:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IDNEEsQTmR7RrXeAKawkL//+UXLW8qfYod1a5qSAiyc=;
	b=ZS+0/PGEdHM0XU557SzzBJUq5oCTNv9T6pn/MM3Yc+I19hPChMz7TkAQMQedqWdlB+
	lJSFJNGCNj0KbmMW8Vv/dh+YAim5UVTV0O/KK4lhVli8QL59T9vX7OdCerZYkoaUdQgT
	CKPQ0kKmI50hKDjJM63+yTX88DLBAglxONwaK62KyW51OzTgJWvivwycnuxq6aIX7r9r
	kBnbL4Oj7BPOJmQSLtXZcvITSsGZmKXJ3M7isQP8kuP48eNFEYT2m5aK+wJJPq8s4YkH
	LUzA3dZ03GKI2FEM/UkSoW9kpZFkRyNAQ0iOy5pQtZzLX0kG26wYObt1Igi+diq9CCF2
	ob1A==
X-Gm-Message-State: ALoCoQn2KQh92EnnoVKM8/D0Ki9gvYFjoanbkyX35IIJuZ/L7i2BXJh0UqVSUyeNwb0J+y9fyyDS
X-Received: by 10.68.111.3 with SMTP id ie3mr72391725pbb.63.1440611076632;
	Wed, 26 Aug 2015 10:44:36 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	j1sm12740979pde.48.2015.08.26.10.44.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Aug 2015 10:44:36 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Aug 2015 23:14:29 +0530
Message-Id: <1440611069-20869-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] iscsitarget: add new recipe
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
X-List-Received-Date: Wed, 26 Aug 2015 17:44:37 -0000

iSCSI Enterprise Target is aimed to develop an
open source iSCSI target with professional features,
that works well in enterprise environment under real
workload, and is scalable and versatile enough to meet the
challenge of future storage needs and developments.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 ...rors-observed-with-linux-3.19-and-greater.patch | 198 +++++++++++++++++++++
 ...use-kernel-makefile-to-get-kernel-version.patch |  67 +++++++
 .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  62 +++++++
 3 files changed, 327 insertions(+)
 create mode 100644 meta-networking/recipes-extended/iscsitarget/files/fix-errors-observed-with-linux-3.19-and-greater.patch
 create mode 100644 meta-networking/recipes-extended/iscsitarget/files/use-kernel-makefile-to-get-kernel-version.patch
 create mode 100644 meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb

diff --git a/meta-networking/recipes-extended/iscsitarget/files/fix-errors-observed-with-linux-3.19-and-greater.patch b/meta-networking/recipes-extended/iscsitarget/files/fix-errors-observed-with-linux-3.19-and-greater.patch
new file mode 100644
index 0000000..6878ca2
--- /dev/null
+++ b/meta-networking/recipes-extended/iscsitarget/files/fix-errors-observed-with-linux-3.19-and-greater.patch
@@ -0,0 +1,198 @@
+Fix build errors with linux kernel v3.19 and above
+
+Below errors came up while building iscsitarget for 
+qemux86-64 (and others) because,
+1. 'struct user_msghdr' is being used for userland-side msghdr instead
+of 'struct msghdr', which is used for kernel-side msghdr in linux v3.19
+and above.
+
+error snippet:
+-- snip --
+| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/iscsi.c: In function 'cmnd_skip_pdu':
+| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/iscsi.c:492:16: error: 'struct msghdr' has no member named 'msg_iov'
+|   conn->read_msg.msg_iov = conn->read_iov;
+-- CUT --
+
+Reference:
+https://github.com/torvalds/linux/commit/666547ff591cebdedc4679bf6b1b3f3383a8dea3
+
+2. 'SERVICE_ACTION_IN' has been renamed to SERVICE_ACTION_IN_16 in linux v3.19
+and above.
+
+error snippet:
+-- snip --
+| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/iscsi.c: In function 'scsi_cmnd_start':
+| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/iscsi.c:989:7: error: 'SERVICE_ACTION_IN' undeclared (first use in this function)
+|   case SERVICE_ACTION_IN:
+-- CUT --
+
+Reference:
+https://github.com/torvalds/linux/commit/eb846d9f147455e4e5e1863bfb5e31974bb69b7c
+
+3. In linux v3.19 and above, f_dentry member has been removed from 
+'struct file' structure.
+
+error snippet:
+-- snip --
+| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c: In function 'iet_socket_bind':
+| /CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work/qemux86_64-poky-linux/iscsitarget/1.4.20.3+svn502-r0/iscsitarget-1.4.20.3+svn502/kernel/conn.c:130:34: error: 'struct file' has no member named 'f_dentry'
+|   conn->sock = SOCKET_I(conn->file->f_dentry->d_inode);
+-- CUT --
+
+new helper function file_inode(file) should be used instead.
+
+References:
+1. https://github.com/torvalds/linux/commit/78d28e651f97866d608d9b41f8ad291e65d47dd5
+2. https://github.com/torvalds/linux/commit/496ad9aa8ef448058e36ca7a787c61f2e63f0f54
+
+Upstream-Status: Pending
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+
+--- iscsitarget-1.4.20.3+svn502_org/kernel/conn.c	2015-08-24 16:13:26.481924679 +0530
++++ iscsitarget-1.4.20.3+svn502/kernel/conn.c	2015-08-24 17:27:06.897653698 +0530
+@@ -127,7 +127,11 @@ static void iet_socket_bind(struct iscsi
+ 
+ 	dprintk(D_GENERIC, "%llu\n", (unsigned long long) session->sid);
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
++	conn->sock = SOCKET_I(file_inode(conn->file));
++#else
+ 	conn->sock = SOCKET_I(conn->file->f_dentry->d_inode);
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
+ 	conn->sock->sk->sk_user_data = conn;
+ 
+ 	write_lock_bh(&conn->sock->sk->sk_callback_lock);
+--- iscsitarget-1.4.20.3+svn502_org/kernel/file-io.c	2015-08-24 16:13:26.481924679 +0530
++++ iscsitarget-1.4.20.3+svn502/kernel/file-io.c	2015-08-24 17:30:54.390131100 +0530
+@@ -69,7 +69,11 @@ static int fileio_make_request(struct ie
+ static int fileio_sync(struct iet_volume *lu, struct tio *tio)
+ {
+ 	struct fileio_data *p = lu->private;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
++	struct inode *inode = file_inode(p->filp);
++#else
+ 	struct inode *inode = p->filp->f_dentry->d_inode;
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
+ 	struct address_space *mapping = inode->i_mapping;
+ 	loff_t ppos, count;
+ 	int res;
+@@ -213,7 +217,11 @@ static int fileio_attach(struct iet_volu
+ 		eprintk("%d\n", err);
+ 		goto out;
+ 	}
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
++	inode = file_inode(p->filp);
++#else
+ 	inode = p->filp->f_dentry->d_inode;
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
+ 
+ 	if (S_ISREG(inode->i_mode))
+ 		;
+--- iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.c	2015-08-24 16:13:26.481924679 +0530
++++ iscsitarget-1.4.20.3+svn502/kernel/iscsi.c	2015-08-24 17:33:50.950490156 +0530
+@@ -986,7 +986,11 @@ static void scsi_cmnd_start(struct iscsi
+ 		set_cmnd_lunit(req);
+ 
+ 	switch (req_hdr->scb[0]) {
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
++	case SERVICE_ACTION_IN_16:
++#else
+ 	case SERVICE_ACTION_IN:
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
+ 		if ((req_hdr->scb[1] & 0x1f) != 0x10)
+ 			goto error;
+ 	case INQUIRY:
+--- iscsitarget-1.4.20.3+svn502_org/kernel/iscsi.h	2015-08-24 16:13:26.481924679 +0530
++++ iscsitarget-1.4.20.3+svn502/kernel/iscsi.h	2015-08-24 17:35:31.354690051 +0530
+@@ -257,7 +257,11 @@ struct iscsi_conn {
+ 	struct timer_list nop_timer;
+ 
+ 	struct iscsi_cmnd *read_cmnd;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
++	struct user_msghdr read_msg;
++#else
+ 	struct msghdr read_msg;
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
+ 	struct iovec read_iov[ISCSI_CONN_IOV_MAX];
+ 	u32 read_size;
+ 	u32 read_overflow;
+--- iscsitarget-1.4.20.3+svn502_org/kernel/nthread.c	2015-08-24 16:13:26.481924679 +0530
++++ iscsitarget-1.4.20.3+svn502/kernel/nthread.c	2015-08-24 17:41:56.187428925 +0530
+@@ -80,8 +80,11 @@ static int is_data_available(struct iscs
+ 	set_fs(oldfs);
+ 	return (res >= 0) ? avail : res;
+ }
+-
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
++static void forward_iov(struct user_msghdr *msg, int len)
++#else
+ static void forward_iov(struct msghdr *msg, int len)
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
+ {
+ 	while (msg->msg_iov->iov_len <= len) {
+ 		len -= msg->msg_iov->iov_len;
+@@ -96,7 +99,11 @@ static void forward_iov(struct msghdr *m
+ static int do_recv(struct iscsi_conn *conn, int state)
+ {
+ 	mm_segment_t oldfs;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
++	struct user_msghdr msg;
++#else
+ 	struct msghdr msg;
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
+ 	struct iovec iov[ISCSI_CONN_IOV_MAX];
+ 	int i, len, res;
+ 
+@@ -461,7 +468,11 @@ static void exit_tx(struct iscsi_conn *c
+ static int tx_ddigest(struct iscsi_cmnd *cmnd, int state)
+ {
+ 	int res, rest = cmnd->conn->write_size;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
++	struct user_msghdr msg = {.msg_flags = MSG_NOSIGNAL | MSG_DONTWAIT};
++#else
+ 	struct msghdr msg = {.msg_flags = MSG_NOSIGNAL | MSG_DONTWAIT};
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
+ 	struct kvec iov;
+ 
+ 	iov.iov_base = (char *) (&cmnd->ddigest) + (sizeof(u32) - rest);
+--- iscsitarget-1.4.20.3+svn502_org/kernel/target_disk.c	2015-08-24 16:13:26.481924679 +0530
++++ iscsitarget-1.4.20.3+svn502/kernel/target_disk.c	2015-08-24 17:43:42.167625159 +0530
+@@ -606,7 +606,11 @@ static int disk_execute_cmnd(struct iscs
+ 	case REQUEST_SENSE:
+ 		send_data_rsp(cmnd, build_request_sense_response);
+ 		break;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
++	case SERVICE_ACTION_IN_16:
++#else
+ 	case SERVICE_ACTION_IN:
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */	
+ 		send_data_rsp(cmnd, build_service_action_in_response);
+ 		break;
+ 	case READ_6:
+--- iscsitarget-1.4.20.3+svn502_org/kernel/volume.c	2015-08-24 16:13:26.477924674 +0530
++++ iscsitarget-1.4.20.3+svn502/kernel/volume.c	2015-08-24 18:28:15.697074780 +0530
+@@ -398,7 +398,11 @@ int is_volume_reserved(struct iet_volume
+ 		case READ_CAPACITY:
+ 			/* allowed commands when reserved */
+ 			break;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)			
++		case SERVICE_ACTION_IN_16:
++#else
+ 		case SERVICE_ACTION_IN:
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
+ 			if ((scb[1] & 0x1F) == 0x10)
+ 				break;
+ 			/* fall through */
+@@ -465,7 +469,11 @@ int is_volume_reserved(struct iet_volume
+ 		if (excl_access_ro && !registered)
+ 			err = -EBUSY;
+ 		break;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0)
++	case SERVICE_ACTION_IN_16:
++#else
+ 	case SERVICE_ACTION_IN:
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0) */
+ 		if ((scb[1] & 0x1F) == 0x10)
+ 			break;
+ 		/* fall through */
diff --git a/meta-networking/recipes-extended/iscsitarget/files/use-kernel-makefile-to-get-kernel-version.patch b/meta-networking/recipes-extended/iscsitarget/files/use-kernel-makefile-to-get-kernel-version.patch
new file mode 100644
index 0000000..95bd047
--- /dev/null
+++ b/meta-networking/recipes-extended/iscsitarget/files/use-kernel-makefile-to-get-kernel-version.patch
@@ -0,0 +1,67 @@
+Get linux kernel version from Makefile of kernel source
+
+We get below messages while building iscsitarget,
+
+-- snip --
+x86_64-poky-linux-gcc: error:
+/CGE7_SHDD/project_yocto_1.8/poky/build/tmp/work-shared/qemux86-64/kernel-source/include/linux/version.h:
+No such file or directory
+x86_64-poky-linux-gcc: fatal error: no input files
+compilation terminated.
+/bin/sh: line 0: [: too many arguments
+/bin/sh: line 0: [: too many arguments
+/bin/sh: line 0: [: too many arguments
+/bin/sh: line 0: [: too many arguments
+/bin/sh: line 0: [: too many arguments
+/bin/sh: line 0: [: too many arguments
+/bin/sh: line 0: [: too many arguments
+/bin/sh: line 0: [: too many arguments
+/bin/sh: line 0: [: too many arguments
+/bin/sh: line 0: [: too many arguments
+/bin/sh: line 0: [: too many arguments
+/bin/sh: line 0: [: too many arguments
+-- CUT --
+
+These messages are due to absence of include/linux/version.h file in 
+kernel source directory and failed to compute linux kernel version.
+So, use kernel source Makefile ( i.e $(KSRC)/Makefile) to find out 
+actual kernel version.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+
+--- iscsitarget-1.4.20.3+svn499_org/Makefile	2014-01-27 00:00:45.000000000 +0530
++++ iscsitarget-1.4.20.3+svn499/Makefile	2015-07-23 10:44:47.013600285 +0530
+@@ -18,27 +18,11 @@ ifeq ($(KSRC),)
+ endif
+ 
+ 
+-ifneq ($(wildcard $(KSRC)/include/generated/utsrelease.h),)
+-	VERSION_FILE := $(KSRC)/include/generated/utsrelease.h
+-else
+-  ifneq ($(wildcard $(KSRC)/include/linux/utsrelease.h),)
+-	  VERSION_FILE := $(KSRC)/include/linux/utsrelease.h
+-  else
+-	  VERSION_FILE := $(KSRC)/include/linux/version.h
+-  endif
+-endif
+-
+-KVER := $(shell $(CC) $(CFLAGS) $(LDFLAGS) -E -dM $(VERSION_FILE) | \
+-	grep UTS_RELEASE | awk '{ print $$3 }' | sed 's/\"//g')
+-
+ KMOD := /lib/modules/$(KVER)/extra
+-
+-KMAJ := $(shell echo $(KVER) | \
+-	sed -e 's/^\([0-9][0-9]*\)\.[0-9][0-9]*\.[0-9][0-9]*.*/\1/')
+-KMIN := $(shell echo $(KVER) | \
+-	sed -e 's/^[0-9][0-9]*\.\([0-9][0-9]*\)\.[0-9][0-9]*.*/\1/')
+-KREV := $(shell echo $(KVER) | \
+-	sed -e 's/^[0-9][0-9]*\.[0-9][0-9]*\.\([0-9][0-9]*\).*/\1/')
++KMAJ := $(shell cat $(KSRC)/Makefile | grep ^VERSION | gawk -F " " '{ print $$NF }')
++KMIN := $(shell cat $(KSRC)/Makefile | grep ^PATCHLEVEL | gawk -F " " '{ print $$NF }')
++KREV := $(shell cat $(KSRC)/Makefile | grep ^SUBLEVEL | gawk -F " " '{ print $$NF }')
++KVER := ${KMAJ}.${KMIN}.${KREV}
+ 
+ kver_eq = $(shell [ $(KMAJ) -eq $(1) -a $(KMIN) -eq $(2) -a $(KREV) -eq $(3) ] && \
+ 	echo 1 || echo 0)
diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
new file mode 100644
index 0000000..c96810b
--- /dev/null
+++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
@@ -0,0 +1,62 @@
+DESCRIPTION = "iSCSI Enterprise Target is aimed to develop an \
+               open source iSCSI target with professional features, \
+               that works well in enterprise environment under real \
+               workload, and is scalable and versatile enough to meet the \
+               challenge of future storage needs and developments."
+HOMEPAGE = "http://iscsitarget.sourceforge.net/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6e233eda45c807aa29aeaa6d94bc48a2"
+DEPENDS = "openssl virtual/kernel"
+
+SRC_URI = "http://ftp.heanet.ie/mirrors/ubuntu/pool/universe/i/${BPN}/${BPN}_${PV}.orig.tar.gz \
+           file://use-kernel-makefile-to-get-kernel-version.patch \
+           file://fix-errors-observed-with-linux-3.19-and-greater.patch \
+	  "
+SRC_URI[md5sum] = "ef9bc823bbabd3c772208c00d5f2d089"
+SRC_URI[sha256sum] = "d3196ccb78a43266dce28587bfe30d8ab4db7566d7bce96057dfbb84100babb5"
+
+inherit module-base
+
+# Add make_scripts task to create kernel scripts
+addtask make_scripts after do_patch before do_compile
+
+do_configure[noexec] = "1"
+
+# make_scripts requires kernel source directory to create
+# kernel scripts
+do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
+
+# Make sure we don't have race condition against "make scripts"
+do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
+
+do_compile() {
+    oe_runmake KSRC=${STAGING_KERNEL_DIR} CFLAGS='${CFLAGS}' LDFLAGS='' \
+    CC="${CC}" V=1
+}
+
+do_install() {
+    # Module
+    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/iscsi
+    install -m 0644 kernel/iscsi_trgt.ko \
+    ${D}/lib/modules/${KERNEL_VERSION}/kernel/iscsi/iscsi_trgt.ko
+    
+    # Userspace utilities
+    install -d ${D}${sbindir}
+    install -m 0755 usr/ietd ${D}${sbindir}/ietd
+    install -m 0755 usr/ietadm ${D}${sbindir}/ietadm
+    
+    # Config files, init scripts
+    mkdir -p ${D}${sysconfdir}/iet
+    install -m 0644 etc/ietd.conf ${D}/${sysconfdir}/iet/ietd.conf
+    install -m 0644 etc/initiators.allow ${D}${sysconfdir}/iet/initiators.allow
+    install -m 0644 etc/targets.allow ${D}${sysconfdir}/iet/targets.allow
+    mkdir -p ${D}${sysconfdir}/init.d
+    install -m 0755 etc/initd/initd ${D}${sysconfdir}/init.d/iscsi-target
+    install -m 0644 etc/initiators.deny ${D}${sysconfdir}/iet/initiators.deny
+}
+
+FILES_${PN} += "${sbindir} \
+                /lib \
+                ${sysconfdir}"
+
+RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
-- 
1.8.2.3


