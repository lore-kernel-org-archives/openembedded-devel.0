Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id AC808722FB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 05:34:22 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kq14so6147268pab.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 21:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IpBPiN0+uPmwYZn0HAEUUUt+QiiJObon9qu9skzzZdU=;
	b=n0D+uI/BzoLJEXKK0yDR0mVq9x17ad9vtWgfCXMeC4+wdapWXlpKF7fEvQFnCwUQXj
	ujTcKZZlvWoADpLp06mqDlDd97oZG7+EmI5XL97z8Fj/vn6pvKdnmqRYCiE/t4irn42d
	eK4Oj3h/UHPgbi3iFh8WlCPode1bblKqqdbb5w+ZK1zVKDZJBBeUjsPMirOi2yYMwAaX
	/QECXqHXyJ5HAhxChkt2/v9XTIDQ+1WuG9fl7H/UXQLrIoWUacJHyO3MNZoPCfcXZqQ6
	0bT/fvs1g+6F0letYMoMmA5YA7zWsB3Ql1or4kt+MXHRZM6L6df82+QKTBmD/REB/M2D
	utZA==
X-Received: by 10.68.69.81 with SMTP id c17mr63799019pbu.107.1417152862864;
	Thu, 27 Nov 2014 21:34:22 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id x10sm8696360pdr.11.2014.11.27.21.34.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Nov 2014 21:34:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Nov 2014 21:34:04 -0800
Message-Id: <1417152844-23643-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1417152844-23643-1-git-send-email-akuster808@gmail.com>
References: <1417152844-23643-1-git-send-email-akuster808@gmail.com>
Subject: [meta-networking][PATCH 2/2] New package: Netkit-ftp
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
X-List-Received-Date: Fri, 28 Nov 2014 05:34:22 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../netkit-ftp/files/Add_ARG_MAX_define.patch      | 28 +++++++++++++
 .../recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb   | 46 ++++++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-ftp/files/Add_ARG_MAX_define.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb

diff --git a/meta-networking/recipes-netkit/netkit-ftp/files/Add_ARG_MAX_define.patch b/meta-networking/recipes-netkit/netkit-ftp/files/Add_ARG_MAX_define.patch
new file mode 100644
index 0000000..5a47fd9
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-ftp/files/Add_ARG_MAX_define.patch
@@ -0,0 +1,28 @@
+This adds ARG_MAX define to be _SC_ARG_MAX
+
+Upstream-Status: Inappropriate.
+Most distros have their own verion for this fix.
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+Index: netkit-ftp-0.17/ftp/glob.c
+===================================================================
+--- netkit-ftp-0.17.orig/ftp/glob.c
++++ netkit-ftp-0.17/ftp/glob.c
+@@ -50,6 +50,7 @@ char glob_rcsid[] =
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <unistd.h>
+ 
+ #include "ftp_var.h"  /* for protos only */
+ #include "glob.h"
+@@ -57,6 +58,9 @@ char glob_rcsid[] =
+ #define	QUOTE 0200
+ #define	TRIM 0177
+ #define	eq(a,b)		(strcmp(a, b)==0)
++#ifndef ARG_MAX
++#define ARG_MAX (sysconf(_SC_ARG_MAX))
++#endif
+ #define	GAVSIZ		(ARG_MAX/6)
+ #define	isdir(d)	((d.st_mode & S_IFMT) == S_IFDIR)
diff --git a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
new file mode 100644
index 0000000..8bac049
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
@@ -0,0 +1,46 @@
+DESCRIPTION = "netkit-ft includes the ftp client."
+SECTION = "networking"
+HOMEPAGE="ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
+LICENSE = "BSD"
+
+LIC_FILES_CHKSUM = "file://ftp/ftp.c;beginline=2;endline=3;md5=2d40a75a50d83b8f6317b3f53db72bfa"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-ftp/netkit-ftp_${PV}.orig.tar.gz;name=archive \
+            ${DEBIAN_MIRROR}/main/n/netkit-ftp/netkit-ftp_${PV}-31.debian.tar.xz;name=patch31 \
+            file://Add_ARG_MAX_define.patch \
+"
+
+SRC_URI[archive.md5sum] = "94441610c9b86ef45c4c6ec609444060"
+SRC_URI[archive.sha256sum] = "61c913299b81a4671ff089aac821329f7db9bc111aa812993dd585798b700349"
+SRC_URI[patch31.md5sum] = "93d71e28ce70df69e080c7f90da63cac"
+SRC_URI[patch31.sha256sum] = "4edd46a32d70daa7ba00f0ebf0118dc5d17dff23d6e46aa21a2722be2e22d1c1"
+
+inherit autotools-brokensep
+
+do_configure () {
+    ./configure --prefix=${prefix}
+    echo "LDFLAGS=${LDFLAGS}" >> MCONFIG
+}
+
+BINMODE = "0755"
+MANMODE = "0644"
+
+do_install () {
+    install -d ${D}${bindir}
+    install -d ${D}${mandir}/man1
+    install -d ${D}${mandir}/man5
+
+    install -m${BINMODE} ${S}/ftp/ftp ${D}${bindir}
+    ln -sf ${D}${bindir}/ftp ${D}${bindir}/pftp
+    install -m${MANMODE} ${S}/ftp/ftp.1 ${D}${mandir}/man1
+    ln -sf ftp.1 ${D}${mandir}/man1/pftp.1
+    install -m${MANMODE} ${S}/ftp/netrc.5 ${D}${mandir}/man5
+}
+
+PACKAGES = "${PN} ${PN}-doc ${BPN}-dbg"
+FILES_${PN} = "${bindir}/*"
+FILES_${PN}-doc = "${mandir}"
+FILES_${PN}-dbg = "${prefix}/src/debug \
+            ${bindir}/.debug"
+
+RDEPENDS_${PN} = "readline"
-- 
1.9.1


