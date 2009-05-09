Received: from [74.125.44.156] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2arh-0000Ua-Tb
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:34 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1077916yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=QqabNtu0UZ2sM3U0jodRnJV9Eyw9Kb7JKsmE24iusb8=;
	b=xkCD0NjOxh+Gd9kRBgZMgKRMrVR/NVbeyhvv7tEPEiRtbJ30n1F3W4z+SpF5rHMgUd
	NvGtyoGnE7OFGgXp2Af9Nz0VOSmLR/vOF1v/wO7vY1dwdiOcmmXSyRVS4B+ophsk1KcO
	QEoqDM00Y2AiqNDvfUO6SW8Nz+7+70Q1LFLOs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=bulSqFXFzmG8s/IgrF5iZNgr/BKjvRqukMj1g74FcVvzSuTYy4ZVJDCYVyk5DPI0eD
	a5sE/KR9Kb2DKXl/eeSQNT4Y+iBLdctP/2UFrgQEm9ZUSWw6aImD2nSXVQOw5j9/MEgw
	TIrAaYPOEKoQ0V8Vom3pYmakDBoOMx5C0W7ro=
Received: by 10.100.166.13 with SMTP id o13mr8464387ane.103.1241830218353;
	Fri, 08 May 2009 17:50:18 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 5sm404593ywl.49.2009.05.08.17.50.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:17 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id E2B906101A6; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:30 -0300
Message-Id: <1241830239-5594-15-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-14-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-11-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-12-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-13-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-14-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 14/23] mtools: update to 4.0.10 since 3.9.11 was not available anymore
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 May 2009 00:56:34 -0000

During the updating we've also grabed two patches from Debian that
improves the stability of mtools in recent kernels. Those are:

 - plainio.patch
 - use-sg_io.patch

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini                     |   14 +----
 recipes/mtools/files/no-x11.patch      |   19 --------
 recipes/mtools/files/plainio.patch     |   13 +++++
 recipes/mtools/files/use-sg_io.patch   |   80 ++++++++++++++++++++++++++++++++
 recipes/mtools/mtools-native_3.9.11.bb |    7 ---
 recipes/mtools/mtools-native_4.0.10.bb |    7 +++
 recipes/mtools/mtools_3.9.11.bb        |   19 --------
 recipes/mtools/mtools_4.0.10.bb        |   20 ++++++++
 8 files changed, 123 insertions(+), 56 deletions(-)
 delete mode 100644 recipes/mtools/files/no-x11.patch
 create mode 100644 recipes/mtools/files/plainio.patch
 create mode 100644 recipes/mtools/files/use-sg_io.patch
 delete mode 100644 recipes/mtools/mtools-native_3.9.11.bb
 create mode 100644 recipes/mtools/mtools-native_4.0.10.bb
 delete mode 100644 recipes/mtools/mtools_3.9.11.bb
 create mode 100644 recipes/mtools/mtools_4.0.10.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 57a1e72..3ed00d8 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -16742,17 +16742,9 @@ sha256=0ae0d53ecafdaa9cac7c62aafe8898fe0f5df30ee128385a4895be552721d524
 md5=d5518b678bffb58ceeae898d950ee27e
 sha256=591597c0787822c9fd56c7a3da214e81edd3c98f32d16858221e02dfc0f63779
 
-[http://mtools.linux.lu/mtools-3.9.11.tar.gz]
-md5=3c0ae05b0d98a5d3bd06d3d72fcaf80d
-sha256=3415d425d37338aa4e18e7d60147db23cfbe6192565c697f201f44426665ce42
-
-[http://folks.o-hand.com/richard/poky/sources/mtools-3.9.9.tar.gz]
-md5=3e68b857b4e1f3a6521d1dfefbd30a36
-sha256=af083a73425d664d4607ef6c6564fd9319a0e47ee7c105259a45356cb834690e
-
-[http://mtools.linux.lu/mtools-3.9.9.tar.gz]
-md5=3e68b857b4e1f3a6521d1dfefbd30a36
-sha256=af083a73425d664d4607ef6c6564fd9319a0e47ee7c105259a45356cb834690e
+[http://ftp.gnu.org/gnu/mtools/mtools-4.0.10.tar.bz2]
+md5=750c2beba968a5d46dbaae24551a82b9
+sha256=860fee13acb39365bd28763070e24011ea55f381f96714d2841937525aa02ded
 
 [http://downloads.sourceforge.net/mtpaint/mtpaint-3.02.tar.bz2]
 md5=828013176f135fc24ffdf16a011c51e6
diff --git a/recipes/mtools/files/no-x11.patch b/recipes/mtools/files/no-x11.patch
deleted file mode 100644
index 300f43f..0000000
--- a/recipes/mtools/files/no-x11.patch
+++ /dev/null
@@ -1,19 +0,0 @@
----
- Makefile.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- mtools-3.9.9.orig/Makefile.in
-+++ mtools-3.9.9/Makefile.in
-@@ -128,11 +128,11 @@ X_EXTRA_LIBS = @X_EXTRA_LIBS@
- X_PRE_LIBS = @X_PRE_LIBS@
- CFLAGS = $(CPPFLAGS) $(DEFS) $(MYCFLAGS) -I. @extraincludedir@ -I@srcdir@ $(USERCFLAGS) 
- CXXFLAGS  = $(CPPFLAGS) $(DEFS) $(MYCXXFLAGS) -I. @extraincludedir@ -I@srcdir@ $(USERCFLAGS) 
- LINK      = $(CC) $(LDFLAGS) $(USERLDFLAGS) @extralibdir@
- ALLLIBS   = $(USERLDLIBS) $(MACHDEPLIBS) $(SHLIB) $(LIBS)
--X_LDFLAGS = $(X_EXTRA_LIBS) $(X_LIBS) $(X_PRE_LIBS) -lXau -lX11 $(LIBS) 
-+X_LDFLAGS = $(X_EXTRA_LIBS) $(X_LIBS) $(X_PRE_LIBS) $(LIBS)
- X_CCFLAGS = $(X_CFLAGS) $(CFLAGS)
- 
- all:    mtools $(LINKS) mkmanifest @FLOPPYD@
- 
- %.o: %.c
diff --git a/recipes/mtools/files/plainio.patch b/recipes/mtools/files/plainio.patch
new file mode 100644
index 0000000..b4bd1d6
--- /dev/null
+++ b/recipes/mtools/files/plainio.patch
@@ -0,0 +1,13 @@
+01_plainio.dpatch by Martin Pitt <mpitt@debian.org>
+Fixes garbage output of mtype under certain circumstances; closes #217413
+
+--- mtools-3.9.9/plain_io.c	2003-02-16 17:18:58.000000000 +0100
++++ mtools-3.9.9/plain_io.c	2004-01-14 00:56:11.000000000 +0100
+@@ -524,6 +524,7 @@
+ 		printOom();
+ 		return 0;
+ 	}
++    memset((void*)This, 0, sizeof(SimpleFile_t));
+ 	This->scsi_sector_size = 512;
+ 	This->seekable = 1;
+ #ifdef OS_hpux
diff --git a/recipes/mtools/files/use-sg_io.patch b/recipes/mtools/files/use-sg_io.patch
new file mode 100644
index 0000000..33867de
--- /dev/null
+++ b/recipes/mtools/files/use-sg_io.patch
@@ -0,0 +1,80 @@
+08.scsi.c.dpatch by Thomas Richter <thor@mail.math.tu-berlin.de>
+#393878 mzip unreliable on 2.6.18
+
+--- mtools-3.9.10/scsi.c	2002-11-02 13:09:28.000000000 +0100
++++ mtools-3.9.10/scsi.c	2006-10-17 21:11:01.000000000 +0200
+@@ -37,12 +37,7 @@
+ #endif
+ 
+ #ifdef OS_linux
+-#define SCSI_IOCTL_SEND_COMMAND 1
+-struct scsi_ioctl_command {
+-    int  inlen;
+-    int  outlen;
+-    char cmd[5008];
+-};
++#include <scsi/sg.h>
+ #endif
+ 
+ #ifdef _SCO_DS
+--- mtools-3.9.10/scsi.c	2007-05-26 19:02:56.000000000 +1000
++++ mtools-3.9.10/scsi.c	2008-04-08 20:30:16.000000000 +1000
+@@ -148,37 +148,33 @@ int scsi_cmd(int fd, unsigned char *cdb,
+ 	return 0;
+ 	
+ #elif defined OS_linux
+-	struct scsi_ioctl_command my_scsi_cmd;
++	struct sg_io_hdr scsi_cmd;
+ 
++	/*
++	** Init the command
++	*/
++	memset(&scsi_cmd,0,sizeof(scsi_cmd));
++	scsi_cmd.interface_id    = 'S';
++	scsi_cmd.dxfer_direction = (mode == SCSI_IO_READ)?(SG_DXFER_FROM_DEV):(SG_DXFER_TO_DEV);
++	scsi_cmd.cmd_len         = cmdlen;
++	scsi_cmd.mx_sb_len       = 0;
++	scsi_cmd.dxfer_len       = len;
++	scsi_cmd.dxferp          = data;
++	scsi_cmd.cmdp            = cdb;
++	scsi_cmd.timeout         = ~0; /* where is MAX_UINT defined??? */
++
++#if DEBUG
++	printf("CMD(%d): %02x%02x%02x%02x%02x%02x %sdevice\n",cmdlen,cdb[0],cdb[1],cdb[2],cdb[3],cdb[4],cdb[5],
++		(mode==SCSI_IO_READ)?("<-"):("->"));
++	printf("DATA   : len = %d\n",len);
++#endif
+ 
+-	memcpy(my_scsi_cmd.cmd, cdb, cmdlen);        /* copy command */
+-
+-	switch (mode) {
+-		case SCSI_IO_READ:
+-			my_scsi_cmd.inlen = 0;
+-			my_scsi_cmd.outlen = len;
+-			break;
+-		case SCSI_IO_WRITE:
+-			my_scsi_cmd.inlen = len;
+-			my_scsi_cmd.outlen = 0;
+-			memcpy(my_scsi_cmd.cmd + cmdlen,data,len);
+-			break;
+-	}
+-	
+-	if (ioctl(fd, SCSI_IOCTL_SEND_COMMAND, &my_scsi_cmd) < 0) {
++	if (ioctl(fd, SG_IO,&scsi_cmd) < 0) {
+ 		perror("scsi_io");
+ 		return -1;
+ 	}
+ 	
+-	switch (mode) {
+-		case SCSI_IO_READ:
+-			memcpy(data, &my_scsi_cmd.cmd[0], len);
+-			break;
+-		case SCSI_IO_WRITE:
+-			break;
+-    }
+-
+-	return 0;  /* where to get scsi status? */
++	return 0;
+ 
+ #elif (defined _SCO_DS) && (defined SCSIUSERCMD)
+ 	struct scsicmd my_scsi_cmd;
diff --git a/recipes/mtools/mtools-native_3.9.11.bb b/recipes/mtools/mtools-native_3.9.11.bb
deleted file mode 100644
index c82f740..0000000
--- a/recipes/mtools/mtools-native_3.9.11.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# mtools-native OE build file
-# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require mtools_${PV}.bb
-
-inherit autotools native
diff --git a/recipes/mtools/mtools-native_4.0.10.bb b/recipes/mtools/mtools-native_4.0.10.bb
new file mode 100644
index 0000000..c82f740
--- /dev/null
+++ b/recipes/mtools/mtools-native_4.0.10.bb
@@ -0,0 +1,7 @@
+# mtools-native OE build file
+# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+require mtools_${PV}.bb
+
+inherit autotools native
diff --git a/recipes/mtools/mtools_3.9.11.bb b/recipes/mtools/mtools_3.9.11.bb
deleted file mode 100644
index 4d1822f..0000000
--- a/recipes/mtools/mtools_3.9.11.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-# mtools OE build file
-# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-DESCRIPTION="Mtools is a collection of utilities for accessing MS-DOS disks from Unix without mounting them."
-HOMEPAGE="http://mtools.linux.lu"
-LICENSE="GPL"
-PR = "r4"
-
-SRC_URI="http://mtools.linux.lu/mtools-${PV}.tar.gz \
-	file://m486.patch;patch=1 \
-	file://mtools-makeinfo.patch;patch=1 \
-	file://no-x11.patch;patch=1"
-
-S = "${WORKDIR}/mtools-${PV}"
-
-inherit autotools
-
-EXTRA_OECONF = "--without-x"
diff --git a/recipes/mtools/mtools_4.0.10.bb b/recipes/mtools/mtools_4.0.10.bb
new file mode 100644
index 0000000..5b7f0cd
--- /dev/null
+++ b/recipes/mtools/mtools_4.0.10.bb
@@ -0,0 +1,20 @@
+# mtools OE build file
+# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
+# Copyright (C) 2009, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+DESCRIPTION="Mtools is a collection of utilities for accessing MS-DOS disks from Unix without mounting them."
+HOMEPAGE="http://mtools.linux.lu"
+LICENSE="GPL"
+
+SRC_URI="http://ftp.gnu.org/gnu/mtools/mtools-${PV}.tar.bz2 \
+	file://m486.patch;patch=1 \
+	file://mtools-makeinfo.patch;patch=1 \
+	file://plainio.patch;patch=1 \
+	file://use-sg_io.patch;patch=1"
+
+S = "${WORKDIR}/mtools-${PV}"
+
+inherit autotools
+
+EXTRA_OECONF = "--without-x"
-- 
1.6.3.rc1.51.gea0b7



