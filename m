Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id C1BAB754FF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2018 22:17:36 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id n10-v6so11720746wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2018 15:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=V95sInDPLJSE3afqyHCxJLvBZwSQdgsa4yDJIQYXfEg=;
	b=UeiTxYDyekKMdHyj5B2XduSext2r23yr1sTg4Lwg7SZJfQXTmsNrcE5Vd5HLnkf+ID
	76Tcl8InO90xZlw4fRosBvIdedghmTcD8TcVHM+vThtitKcllF/FsinFN2rqtOGoUuPC
	kvXhDhEQhnxmNLUmNLI/FGsR2FE1LxRsjhMxYNIJaApCURVIfPBt9hxEumeBc7nuZLxC
	WE/4VOadmNozLu/1l695PuciK5tQjXEqtDhekIHbSMz0watpo2O8wTboCg0mgElMC4GI
	F+2q+RJ/x7z9s7DceCzIwmi4bzaJ83TkCqJB11qMckkAsfdNwulH+6D+mv7ibRCcU7cd
	1Kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=V95sInDPLJSE3afqyHCxJLvBZwSQdgsa4yDJIQYXfEg=;
	b=ZBnevTii7xJqXxqzbVDiQf1Fdh7TrsMeBD4nuLGlcBd7PbNTLMnVDvLYCRNFhyoLXv
	n1JZe5Tjw/MVNgBYKjI4UpV7Tg4lqg05zctcPny42Dfc+fZam4PbVUXxG1XqdpNVj876
	tiLKlbSKvm4dGzTOQ+TdVos2BHYQe81+KfJIx8Usc10fpuN2L4cWKHtM6rR5FzsR/S8v
	WPKvHsCv1sX2sxaX1uR8S41YvnFcSo/nV7j10Oxj0/iKb5A5T3WRUMo0HTYbnBgwzTYm
	CuZAQMp3GZ+duyTvesSMymaxC19eNF6MhM5zg389K3sK+oP4sUhBXNfOqngkynx2Bs6a
	uZGQ==
X-Gm-Message-State: ALKqPwfCgZkfpXIgTGgya+FKN/xTJfPWyxzjOUw0SzX06R92Tfx04tXU
	TucRbyPdSfJR3QWwiWyUhnWwtA==
X-Google-Smtp-Source: AB8JxZqoJtiZCd9nhVfHA601Xg1lavEW3VBUkW+6F4kqjaBj1e+kvS29qOOpvGMIpTC1k1UfgIeHpA==
X-Received: by 2002:a1c:f52:: with SMTP id 79-v6mr3855619wmp.24.1526249855819; 
	Sun, 13 May 2018 15:17:35 -0700 (PDT)
Received: from localhost.localdomain
	(host10-248-dynamic.0-87-r.retail.telecomitalia.it. [87.0.248.10])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm11555609wrk.46.2018.05.13.15.17.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 May 2018 15:17:35 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 May 2018 00:17:30 +0200
Message-Id: <1526249850-5448-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: upgrade from v. 2.0.2 to 2.0.17
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
X-List-Received-Date: Sun, 13 May 2018 22:17:37 -0000

This version does support aarch64.
Ad klibc-specific patchset and track the git repository
to get the (many) fixes for the warnings.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../kexec-tools-klibc-2.0.2/arm_crashdump.patch    |  12 --
 .../kexec-tools-klibc-2.0.2/cflags_static.patch    |  11 --
 .../fix-out-of-tree-build.patch                    |  54 --------
 .../kexec-tools-klibc-2.0.2/ifdown_errno.patch     |  11 --
 .../kexec-tools-klibc-2.0.2/kexec-elf-rel.patch    |  61 ---------
 .../kexec-tools-klibc-2.0.2/kexec-syscall.patch    |  44 ------
 .../kexec-tools-klibc-2.0.2/ppc__lshrdi3.patch     |  18 ---
 .../kexec-tools-klibc-2.0.2/purgatory_flags.patch  |  21 ---
 .../kexec-tools-klibc-2.0.2/purgatory_string.patch |   9 --
 .../kexec/kexec-tools-klibc-2.0.2/sha256.patch     |  13 --
 .../sysconf_nrprocessors.patch                     |  13 --
 .../kexec-tools-klibc-2.0.2/x86_basename.patch     |  14 --
 .../kexec-tools-klibc-2.0.2/x86_kexec_test.patch   |  13 --
 .../kexec/kexec-tools-klibc-2.0.2/x86_sys_io.patch |  21 ---
 .../kexec-tools-klibc-2.0.2/x86_vfscanf.patch      |  27 ----
 .../0001-force-static-build.patch                  |  25 ++++
 ...e-order-of-headers-to-fix-build-for-musl.patch} |  17 ++-
 .../0003-kexec-elf-rel-use-our-elf.h.patch         |  92 +++++++++++++
 ...4-kexec-elf-exec.c-replace-with-our-err.h.patch |  30 ++++
 ...lf.c-work-around-for-sysconf-_SC_NPROCESS.patch | 134 ++++++++++++++++++
 ...all.h-work-around-missing-syscall-wrapper.patch |  49 +++++++
 .../0007-kexec.c-add-guard-around-ENOTSUP.patch    |  37 +++++
 .../0008-kexec.c-replace-mising-BLKGETSIZE64.patch |  32 +++++
 ...mcore-dmesg.c-work-around-missing-imaxdiv.patch |  57 ++++++++
 .../0010-fs2dt.c-work-around-missing-getline.patch |  47 +++++++
 .../0011-purgatory-Makefile-adapt-to-klcc.patch    |  43 ++++++
 ...tory-string.c-avoid-inclusion-of-string.h.patch |  31 +++++
 ...3-sha256.h-avoid-inclusion-of-sys-types.h.patch |  36 +++++
 .../0014-add-if_nameindex-from-musl.patch          | 152 +++++++++++++++++++++
 .../0015-vmcore-dmesg-fix-warning.patch            |  29 ++++
 .../arm64-crashdump-arm64.c-fix-warning.patch      |  34 +++++
 ..._kexec-image-header.h-add-missing-le64toh.patch |  40 ++++++
 ...4_purgatory-Makefile-remove-unknown-flags.patch |  51 +++++++
 .../kexec/kexec-tools-klibc/arm_crashdump.patch    |  31 +++++
 ...c-purgatory-Makefile-remove-unknown-flags.patch |  34 +++++
 ...4-purgatory-Makefile-remove-unknown-flags.patch |  33 +++++
 .../kexec/kexec-tools-klibc/x86_basename.patch     |  30 ++++
 .../kexec/kexec-tools-klibc/x86_kexec_test.patch   |  30 ++++
 .../kexec/kexec-tools-klibc/x86_sys_io.patch       |  36 +++++
 .../kexec/kexec-tools-klibc/x86_vfscanf.patch      |  43 ++++++
 .../kexec/kexec-tools-klibc_2.0.2.bb               |  69 ----------
 .../recipes-kernel/kexec/kexec-tools-klibc_git.bb  |  92 +++++++++++++
 42 files changed, 1256 insertions(+), 420 deletions(-)
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/arm_crashdump.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/cflags_static.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/fix-out-of-tree-build.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ifdown_errno.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-elf-rel.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-syscall.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ppc__lshrdi3.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_flags.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_string.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sha256.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sysconf_nrprocessors.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_basename.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_kexec_test.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_sys_io.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0001-force-static-build.patch
 rename meta-initramfs/recipes-kernel/kexec/{kexec-tools-klibc-2.0.2/0001-Adjust-the-order-of-headers-to-fix-build-for-musl.patch => kexec-tools-klibc/0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch} (64%)
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0003-kexec-elf-rel-use-our-elf.h.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0004-kexec-elf-exec.c-replace-with-our-err.h.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0005-crashdump-elf.c-work-around-for-sysconf-_SC_NPROCESS.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0007-kexec.c-add-guard-around-ENOTSUP.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0008-kexec.c-replace-mising-BLKGETSIZE64.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0009-vmcore-dmesg.c-work-around-missing-imaxdiv.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0010-fs2dt.c-work-around-missing-getline.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0012-purgatory-string.c-avoid-inclusion-of-string.h.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0013-sha256.h-avoid-inclusion-of-sys-types.h.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64-crashdump-arm64.c-fix-warning.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_kexec-image-header.h-add-missing-le64toh.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_purgatory-Makefile-remove-unknown-flags.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc-purgatory-Makefile-remove-unknown-flags.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86-64-purgatory-Makefile-remove-unknown-flags.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_basename.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_kexec_test.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_sys_io.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_vfscanf.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/arm_crashdump.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/arm_crashdump.patch
deleted file mode 100644
index 0ff61e5..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/arm_crashdump.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- a/kexec/arch/arm/crashdump-arm.c
-+++ b/kexec/arch/arm/crashdump-arm.c
-@@ -20,7 +20,7 @@
-  * along with this program; if not, write to the Free Software
-  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-  */
--#include <elf.h>
-+#include "../../../include/elf.h"
- #include <errno.h>
- #include <stdio.h>
- #include <stdlib.h>
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/cflags_static.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/cflags_static.patch
deleted file mode 100644
index 35100a3..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/cflags_static.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -46,7 +46,7 @@
- # where necessary.
- CPPFLAGS	= @CPPFLAGS@ -I$(srcdir)/include -I$(srcdir)/util_lib/include \
-			-Iinclude/
--CFLAGS		= @CFLAGS@ -fno-strict-aliasing -Wall -Wstrict-prototypes
-+CFLAGS		= @CFLAGS@ -static -fno-strict-aliasing -Wall -Wstrict-prototypes
- PURGATORY_EXTRA_CFLAGS = @PURGATORY_EXTRA_CFLAGS@
- ASFLAGS		= @ASFLAGS@
- LDFLAGS		= @LDFLAGS@
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/fix-out-of-tree-build.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/fix-out-of-tree-build.patch
deleted file mode 100644
index ccbb24d..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/fix-out-of-tree-build.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 37737527725e465833be649101c4a6f8352c5d5e Mon Sep 17 00:00:00 2001
-From: Tyler Hall <tylerwhall@gmail.com>
-Date: Tue, 7 Feb 2012 18:50:05 -0500
-Subject: Fix out-of-tree build
-
-Use automatic variables for prerequisites when copying man pages and
-include a makefile relative to $(srcdir).
-
-Backported to 2.0.2-klibc
-
-Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
-Signed-off-by: Simon Horman <horms@verge.net.au>
-
-diff --git a/kdump/Makefile b/kdump/Makefile
-index 1e2b72c..5dfa928 100644
---- a/kdump/Makefile
-+++ b/kdump/Makefile
-@@ -22,7 +22,7 @@ $(KDUMP): $(KDUMP_OBJS)
- 
- $(KDUMP_MANPAGE): kdump/kdump.8
- 	$(MKDIR) -p     $(MANDIR)/man8
--	cp kdump/kdump.8 $(KDUMP_MANPAGE)
-+	cp $^ $(KDUMP_MANPAGE)
- echo::
- 	@echo "KDUMP_SRCS $(KDUMP_SRCS)"
- 	@echo "KDUMP_DEPS $(KDUMP_DEPS)"
-diff --git a/kexec/Makefile b/kexec/Makefile
-index 2137cab..8c815b5 100644
---- a/kexec/Makefile
-+++ b/kexec/Makefile
-@@ -82,7 +82,7 @@ $(KEXEC): CPPFLAGS+=-I$(srcdir)/kexec/arch/$(ARCH)/include
- 
- $(KEXEC_MANPAGE): kexec/kexec.8
- 	@$(MKDIR) -p     $(MANDIR)/man8
--	cp kexec/kexec.8 $(KEXEC_MANPAGE)
-+	cp $^ $(KEXEC_MANPAGE)
- echo::
- 	@echo "KEXEC_SRCS $(KEXEC_SRCS)"
- 	@echo "KEXEC_DEPS $(KEXEC_DEPS)"
-diff --git a/kexec/arch/ppc/Makefile b/kexec/arch/ppc/Makefile
-index 3dba7cf..41242a5 100644
---- a/kexec/arch/ppc/Makefile
-+++ b/kexec/arch/ppc/Makefile
-@@ -1,7 +1,7 @@
- #
- # kexec ppc (linux booting linux)
- #
--include kexec/arch/ppc/libfdt/Makefile.libfdt
-+include $(srcdir)/kexec/arch/ppc/libfdt/Makefile.libfdt
- 
- ppc_KEXEC_SRCS =  kexec/arch/ppc/kexec-ppc.c
- ppc_KEXEC_SRCS += kexec/arch/ppc/kexec-elf-ppc.c
-
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ifdown_errno.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ifdown_errno.patch
deleted file mode 100644
index 7f8cddd..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ifdown_errno.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/kexec/ifdown.c
-+++ b/kexec/ifdown.c
-@@ -14,7 +14,7 @@
- #include <sys/ioctl.h>
- #include <sys/socket.h>
- #include <sys/time.h>
--#include <sys/errno.h>
-+#include <errno.h>
- 
- #include <net/if.h>
- #include <netinet/in.h>
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-elf-rel.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-elf-rel.patch
deleted file mode 100644
index c666afc..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-elf-rel.patch
+++ /dev/null
@@ -1,61 +0,0 @@
---- a/kexec/kexec-elf-rel.c
-+++ b/kexec/kexec-elf-rel.c
-@@ -4,7 +4,7 @@
- #include <stdio.h>
- #include <errno.h>
- #include <stdlib.h>
--#include "elf.h"
-+#include "../include/elf.h"
- #include <boot/elf_boot.h>
- #include "kexec.h"
- #include "kexec-elf.h"
-
---- a/kexec/arch/arm/kexec-elf-rel-arm.c
-+++ b/kexec/arch/arm/kexec-elf-rel-arm.c
-@@ -1,5 +1,5 @@
- #include <stdio.h>
--#include <elf.h>
-+#include "../../../include/elf.h"
- #include "../../kexec.h"
- #include "../../kexec-elf.h"
- 
-
---- a/kexec/arch/i386/kexec-elf-rel-x86.c
-+++ b/kexec/arch/i386/kexec-elf-rel-x86.c
-@@ -1,5 +1,5 @@
- #include <stdio.h>
--#include <elf.h>
-+#include "../../../include/elf.h"
- #include "../../kexec.h"
- #include "../../kexec-elf.h"
- 
-
---- a/kexec/arch/ppc/kexec-elf-rel-ppc.c
-+++ b/kexec/arch/ppc/kexec-elf-rel-ppc.c
-@@ -1,5 +1,5 @@
- #include <stdio.h>
--#include <elf.h>
-+#include "../../../include/elf.h"
- #include "../../kexec.h"
- #include "../../kexec-elf.h"
- 
-
---- a/kexec/arch/ppc64/kexec-elf-rel-ppc64.c
-+++ b/kexec/arch/ppc64/kexec-elf-rel-ppc64.c
-@@ -1,5 +1,5 @@
- #include <stdio.h>
--#include <elf.h>
-+#include "../../../include/elf.h"
- #include <string.h>
- #include "../../kexec.h"
- #include "../../kexec-elf.h"
-
---- a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-+++ b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-@@ -1,5 +1,5 @@
- #include <stdio.h>
--#include <elf.h>
-+#include "../../../include/elf.h"
- #include "../../kexec.h"
- #include "../../kexec-elf.h"
- 
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-syscall.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-syscall.patch
deleted file mode 100644
index 081de1b..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-syscall.patch
+++ /dev/null
@@ -1,44 +0,0 @@
---- a/kexec/kexec-syscall.h
-+++ b/kexec/kexec-syscall.h
-@@ -2,7 +2,7 @@
- #define KEXEC_SYSCALL_H
- 
- #define __LIBRARY__
--#include <syscall.h>
-+/*#include <syscall.h>*/
- #include <sys/syscall.h>
- #include <unistd.h>
- 
-@@ -23,6 +23,7 @@
- #define LINUX_REBOOT_CMD_KEXEC		0x45584543
- 
- #ifndef __NR_kexec_load
-+/*
- #ifdef __i386__
- #define __NR_kexec_load		283
- #endif
-@@ -61,19 +62,21 @@
- #ifndef __NR_kexec_load
- #error Unknown processor architecture.  Needs a kexec_load syscall number.
- #endif
-+*/
- #endif /*ifndef __NR_kexec_load*/
- 
- struct kexec_segment;
--
-+/*
- static inline long kexec_load(void *entry, unsigned long nr_segments,
- 			struct kexec_segment *segments, unsigned long flags)
- {
- 	return (long) syscall(__NR_kexec_load, entry, nr_segments, segments, flags);
- }
--
-+*/
- static inline long kexec_reboot(void)
- {
--	return (long) syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, LINUX_REBOOT_CMD_KEXEC, 0);
-+	//return (long) syscall(__NR_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, LINUX_REBOOT_CMD_KEXEC, 0);
-+	return __reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2, LINUX_REBOOT_CMD_KEXEC, 0);
- }
- 
- 
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ppc__lshrdi3.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ppc__lshrdi3.patch
deleted file mode 100644
index 56cdfb0..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ppc__lshrdi3.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- a/purgatory/arch/ppc/crt.S
-+++ b/purgatory/arch/ppc/crt.S
-@@ -249,6 +249,7 @@
-  *
-  */
- 
-+/* already defined in misc.S
- _GLOBAL(__lshrdi3)
- 	subfic	6,5,32
- 	srw	4,4,5	# LSW = count > 31 ? 0 : LSW >> count
-@@ -259,5 +260,7 @@
- 	srw	3,3,5	# MSW = MSW >> count
- 	or	4,4,7	# LSW |= t2
- 	blr
-+*/
-+
- #endif
- #endif
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_flags.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_flags.patch
deleted file mode 100644
index 41fc116..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_flags.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- a/purgatory/Makefile
-+++ b/purgatory/Makefile
-@@ -47,7 +47,7 @@
- $(PURGATORY): CC=$(TARGET_CC)
- $(PURGATORY): CFLAGS+=$(PURGATORY_EXTRA_CFLAGS) \
-		      $($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
--		      -Os -fno-builtin -ffreestanding
-+		      -Os -fno-builtin -ffreestanding -nostdinc
- 
- $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
-			-I$(srcdir)/purgatory/include \
-@@ -61,7 +61,8 @@
- 
- $(PURGATORY): $(PURGATORY_OBJS)
-	$(MKDIR) -p $(@D)
--	$(CC) $(LDFLAGS) -o $@ $^
-+#	$(CC) $(LDFLAGS) -o $@ $^
-+	$(LD) $(LDFLAGS) -o $@ $^
- 
- #	$(LD) $(LDFLAGS) $(EXTRA_LDFLAGS) --no-undefined -e purgatory_start -r -o $@ $(PURGATORY_OBJS) $(UTIL_LIB)
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_string.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_string.patch
deleted file mode 100644
index 5710561..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_string.patch
+++ /dev/null
@@ -1,9 +0,0 @@
---- a/purgatory/string.c
-+++ b/purgatory/string.c
-@@ -1,5 +1,5 @@
- #include <stddef.h>
--#include <string.h>
-+/* #include <string.h> */
- 
- size_t strnlen(const char *s, size_t max)
- {
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sha256.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sha256.patch
deleted file mode 100644
index 85bf7aa..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sha256.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- a/util_lib/include/sha256.h
-+++ b/util_lib/include/sha256.h
-@@ -1,7 +1,8 @@
- #ifndef SHA256_H
- #define SHA256_H
- 
--#include <sys/types.h>
-+//#include <sys/types.h>
-+#include <stddef.h>
- #include <stdint.h>
- 
- typedef struct
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sysconf_nrprocessors.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sysconf_nrprocessors.patch
deleted file mode 100644
index 04a97e6..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sysconf_nrprocessors.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- a/kexec/crashdump-elf.c
-+++ b/kexec/crashdump-elf.c
-@@ -47,7 +47,8 @@
-	if (xen_present())
-		nr_cpus = xen_get_nr_phys_cpus();
-	else
--		nr_cpus = sysconf(_SC_NPROCESSORS_CONF);
-+		/*nr_cpus = sysconf(_SC_NPROCESSORS_CONF);*/
-+		nr_cpus = 1;
- 
-	if (nr_cpus < 0) {
-		return -1;
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_basename.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_basename.patch
deleted file mode 100644
index 77a1c01..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_basename.patch
+++ /dev/null
@@ -1,14 +0,0 @@
---- a/kexec/arch/i386/x86-linux-setup.c
-+++ b/kexec/arch/i386/x86-linux-setup.c
-@@ -280,9 +280,9 @@ static int add_edd_entry(struct x86_linu
-	memset(edd_info, 0, sizeof(struct edd_info));
- 
- 	/* extract the device number */
--	if (sscanf(basename(sysfs_name), "int13_dev%hhx", &devnum) != 1) {
-+	if (sscanf(strrchr(sysfs_name,'/') + 1, "int13_dev%hhx", &devnum) != 1) {
- 		fprintf(stderr, "Invalid format of int13_dev dir "
--				"entry: %s\n", basename(sysfs_name));
-+				"entry: %s\n", strrchr(sysfs_name,'/') + 1);
- 		return -1;
- 	}
- 
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_kexec_test.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_kexec_test.patch
deleted file mode 100644
index 9500bd6..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_kexec_test.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -106,8 +106,8 @@
- 
- MAN_PAGES:= kexec/kexec.8
- MAN_PAGES+= kdump/kdump.8
--BINARIES_i386:=  $(SBINDIR)/kexec $(PKGLIBDIR)/kexec_test
--BINARIES_x86_64:=$(SBINDIR)/kexec $(PKGLIBDIR)/kexec_test
-+BINARIES_i386:=  $(SBINDIR)/kexec
-+BINARIES_x86_64:=$(SBINDIR)/kexec
- BINARIES:=$(SBINDIR)/kexec $(SBINDIR)/kdump $(BINARIES_$(ARCH))
- 
- TARGETS:=$(BINARIES) $(MAN_PAGES)
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_sys_io.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_sys_io.patch
deleted file mode 100644
index a497c9a..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_sys_io.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- a/purgatory/arch/i386/pic.c
-+++ b/purgatory/arch/i386/pic.c
-@@ -16,7 +16,7 @@
-  * along with this program; if not, write to the Free Software
-  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-  */
--#include <sys/io.h>
-+#include "include/arch/io.h"
- #include <purgatory.h>
- #include "purgatory-x86.h"
- 
-
---- a/purgatory/arch/i386/vga.c
-+++ b/purgatory/arch/i386/vga.c
-@@ -1,4 +1,4 @@
--#include <sys/io.h>
-+#include "include/arch/io.h"
- #include <purgatory.h>
- #include "purgatory-x86.h"
- 
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch
deleted file mode 100644
index cad6951..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch
+++ /dev/null
@@ -1,27 +0,0 @@
---- a/kexec/arch/i386/x86-linux-setup.c
-+++ b/kexec/arch/i386/x86-linux-setup.c
-@@ -176,6 +176,8 @@ static int file_scanf(const char *dir, c
- 	FILE *fp;
- 	int retno;
- 	char filename[PATH_MAX];
-+	long line_size = MAX_LINE;
-+	char *line;
- 
- 	snprintf(filename, PATH_MAX, "%s/%s", dir, file);
- 	filename[PATH_MAX-1] = 0;
-@@ -186,7 +188,14 @@ static int file_scanf(const char *dir, c
- 	}
- 
- 	va_start(argptr, scanf_line);
--	retno = vfscanf(fp, scanf_line, argptr);
-+
-+	line = xmalloc(sizeof(line) * line_size);
-+	while(fgets(line, sizeof(line), fp) != NULL ) {
-+		line_size += MAX_LINE;
-+		line = xrealloc(line,line_size);
-+	}
-+	retno = vsscanf(line, scanf_line, argptr);
-+
- 	va_end(argptr);
- 
- 	fclose(fp);
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0001-force-static-build.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0001-force-static-build.patch
new file mode 100644
index 0000000..4744e7a
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0001-force-static-build.patch
@@ -0,0 +1,25 @@
+From d6af515cfcc8185f423860f80ff28719975b701f Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Wed, 11 Apr 2018 22:51:00 +0200
+Subject: [PATCH] force static build
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 54c206f..79188d8 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -47,7 +47,7 @@ TARGET_CFLAGS	= @TARGET_CFLAGS@
+ # where necessary.
+ CPPFLAGS	= @CPPFLAGS@ -I$(srcdir)/include -I$(srcdir)/util_lib/include \
+ 			-Iinclude/ $($(ARCH)_CPPFLAGS)
+-CFLAGS		= @CFLAGS@ -fno-strict-aliasing -Wall -Wstrict-prototypes
++CFLAGS		= @CFLAGS@ -static -fno-strict-aliasing -Wall -Wstrict-prototypes
+ PURGATORY_EXTRA_CFLAGS = @PURGATORY_EXTRA_CFLAGS@
+ ASFLAGS		= @ASFLAGS@ $($(ARCH)_ASFLAGS)
+ LDFLAGS		= @LDFLAGS@
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/0001-Adjust-the-order-of-headers-to-fix-build-for-musl.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch
similarity index 64%
rename from meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/0001-Adjust-the-order-of-headers-to-fix-build-for-musl.patch
rename to meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch
index a7600b3..1d96a2b 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/0001-Adjust-the-order-of-headers-to-fix-build-for-musl.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch
@@ -1,30 +1,29 @@
-From 86b962e7c0de43b20b6210d059e4855ce87078bc Mon Sep 17 00:00:00 2001
+From 0976d2d5be1ed44c2324b609c7d16c1e93181c4b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Jul 2017 16:20:08 -0700
 Subject: [PATCH] Adjust the order of headers to fix build for musl
 
 Fixes
-kexec/ifdown.c:33:16: error: storage size of 'ifc' isn't known
+ kexec/ifdown.c:33:16: error: storage size of 'ifc' isn't known
 
+Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  kexec/ifdown.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/kexec/ifdown.c b/kexec/ifdown.c
-index 2215798..e13f777 100644
+index 9679ad7..82c6141 100644
 --- a/kexec/ifdown.c
 +++ b/kexec/ifdown.c
 @@ -16,8 +16,8 @@ char *v_ifdown = "@(#)ifdown.c  1.11  02-Jun-1998  miquels@cistron.nl";
+ #include <sys/socket.h>
  #include <sys/time.h>
- #include <errno.h>
  
 -#include <net/if.h>
  #include <netinet/in.h>
 +#include <net/if.h>
  
- #define MAX_IFS	64
- 
--- 
-2.13.2
-
+ /*
+  *  First, we find all shaper devices and down them. Then we
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0003-kexec-elf-rel-use-our-elf.h.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0003-kexec-elf-rel-use-our-elf.h.patch
new file mode 100644
index 0000000..ae9e7bb
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0003-kexec-elf-rel-use-our-elf.h.patch
@@ -0,0 +1,92 @@
+From 7f91875d65778154709e4fa0ccb23f3b2a98b0dc Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Wed, 11 Apr 2018 22:51:00 +0200
+Subject: [PATCH] kexec-elf-rel: use our elf.h
+
+Fix:
+
+ kexec-elf-rel.c: In function 'elf_rel_load':
+ kexec-elf-rel.c:386:39: error: 'STT_NOTYPE' undeclared
+
+and similar.
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ kexec/arch/arm/kexec-elf-rel-arm.c       | 2 +-
+ kexec/arch/i386/kexec-elf-rel-x86.c      | 2 +-
+ kexec/arch/ppc/kexec-elf-rel-ppc.c       | 2 +-
+ kexec/arch/ppc64/kexec-elf-rel-ppc64.c   | 2 +-
+ kexec/arch/x86_64/kexec-elf-rel-x86_64.c | 2 +-
+ kexec/kexec-elf-rel.c                    | 2 +-
+ 6 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/kexec/arch/arm/kexec-elf-rel-arm.c b/kexec/arch/arm/kexec-elf-rel-arm.c
+index a939cf4..2551dc0 100644
+--- a/kexec/arch/arm/kexec-elf-rel-arm.c
++++ b/kexec/arch/arm/kexec-elf-rel-arm.c
+@@ -1,5 +1,5 @@
+ #include <stdio.h>
+-#include <elf.h>
++#include "../../../include/elf.h"
+ #include "../../kexec.h"
+ #include "../../kexec-elf.h"
+ 
+diff --git a/kexec/arch/i386/kexec-elf-rel-x86.c b/kexec/arch/i386/kexec-elf-rel-x86.c
+index 55a214e..e7583d1 100644
+--- a/kexec/arch/i386/kexec-elf-rel-x86.c
++++ b/kexec/arch/i386/kexec-elf-rel-x86.c
+@@ -1,5 +1,5 @@
+ #include <stdio.h>
+-#include <elf.h>
++#include "../../../include/elf.h"
+ #include "../../kexec.h"
+ #include "../../kexec-elf.h"
+ 
+diff --git a/kexec/arch/ppc/kexec-elf-rel-ppc.c b/kexec/arch/ppc/kexec-elf-rel-ppc.c
+index 1acbd86..a60c66c 100644
+--- a/kexec/arch/ppc/kexec-elf-rel-ppc.c
++++ b/kexec/arch/ppc/kexec-elf-rel-ppc.c
+@@ -1,5 +1,5 @@
+ #include <stdio.h>
+-#include <elf.h>
++#include "../../../include/elf.h"
+ #include "../../kexec.h"
+ #include "../../kexec-elf.h"
+ 
+diff --git a/kexec/arch/ppc64/kexec-elf-rel-ppc64.c b/kexec/arch/ppc64/kexec-elf-rel-ppc64.c
+index 5f8e3f2..765bf6e 100644
+--- a/kexec/arch/ppc64/kexec-elf-rel-ppc64.c
++++ b/kexec/arch/ppc64/kexec-elf-rel-ppc64.c
+@@ -1,5 +1,5 @@
+ #include <stdio.h>
+-#include <elf.h>
++#include "../../../include/elf.h"
+ #include <string.h>
+ #include "../../kexec.h"
+ #include "../../kexec-elf.h"
+diff --git a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
+index 7fdde73..cd5d729 100644
+--- a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
++++ b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
+@@ -1,5 +1,5 @@
+ #include <stdio.h>
+-#include <elf.h>
++#include "../../../include/elf.h"
+ #include "../../kexec.h"
+ #include "../../kexec-elf.h"
+ 
+diff --git a/kexec/kexec-elf-rel.c b/kexec/kexec-elf-rel.c
+index 9a6e63d..a856636 100644
+--- a/kexec/kexec-elf-rel.c
++++ b/kexec/kexec-elf-rel.c
+@@ -4,7 +4,7 @@
+ #include <stdio.h>
+ #include <errno.h>
+ #include <stdlib.h>
+-#include "elf.h"
++#include "../include/elf.h"
+ #include <boot/elf_boot.h>
+ #include "kexec.h"
+ #include "kexec-elf.h"
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0004-kexec-elf-exec.c-replace-with-our-err.h.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0004-kexec-elf-exec.c-replace-with-our-err.h.patch
new file mode 100644
index 0000000..1080e8b
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0004-kexec-elf-exec.c-replace-with-our-err.h.patch
@@ -0,0 +1,30 @@
+From 8b9da93ac9a4ea79ae953f80f6fe6e4f080341f2 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Tue, 17 Apr 2018 10:57:23 +0200
+Subject: [PATCH] kexec-elf-exec.c: replace with our elf.h
+
+Fix
+
+ kexec-elf-exec.c: In function 'elf_exec_load':
+ error: 'EM_AARCH64' undeclared
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ kexec/kexec-elf-exec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kexec/kexec-elf-exec.c b/kexec/kexec-elf-exec.c
+index a9329ac..0dd0700 100644
+--- a/kexec/kexec-elf-exec.c
++++ b/kexec/kexec-elf-exec.c
+@@ -4,7 +4,7 @@
+ #include <stdio.h>
+ #include <errno.h>
+ #include <stdlib.h>
+-#include "elf.h"
++#include "../include/elf.h"
+ #include <boot/elf_boot.h>
+ #include "kexec.h"
+ #include "kexec-elf.h"
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0005-crashdump-elf.c-work-around-for-sysconf-_SC_NPROCESS.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0005-crashdump-elf.c-work-around-for-sysconf-_SC_NPROCESS.patch
new file mode 100644
index 0000000..4f7506d
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0005-crashdump-elf.c-work-around-for-sysconf-_SC_NPROCESS.patch
@@ -0,0 +1,134 @@
+From 1cfee75d9662c3382bb7cb8f1c952333837598ae Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Wed, 18 Apr 2018 02:21:30 +0200
+Subject: [PATCH] crashdump-elf.c: work around for _SC_NPROCESSORS_CONF
+
+klibc sysconf lacks this so the implementation
+of Linus Torvalds was taken (simplified):
+
+https://sourceware.org/ml/libc-alpha/2011-06/msg00079.html
+
+Have fun reding the thread!
+
+Fix
+
+ crashdump-elf.c:117:21: error: '_SC_NPROCESSORS_CONF' undeclared
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ kexec/crashdump-elf.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 92 insertions(+)
+
+diff --git a/kexec/crashdump-elf.c b/kexec/crashdump-elf.c
+index b8bb686..7e6767c 100644
+--- a/kexec/crashdump-elf.c
++++ b/kexec/crashdump-elf.c
+@@ -25,6 +25,94 @@ do {									\
+ } while(0)
+ #endif
+ 
++#ifdef __KLIBC__
++#ifndef KLIBC_SYSFS_CPU_H
++#define KLIBC_SYSFS_CPU_H
++
++
++static int __get_sysfs_cpus(const char *path);
++int __get_nprocs (void);
++int __get_nprocs_conf (void);
++
++
++
++static int __get_sysfs_cpus(const char *path)
++{
++	FILE *file;
++	int nr_cpus = 0;
++	int prev = -1;
++	char *p;
++	char line[10];
++
++
++	file = fopen(path, "r");
++	if (!file)
++		return -1;
++	for (;;) {
++		char sep;
++		int cpu;
++		int n;
++
++		/* int n = fscanf(file, "%u%c", &cpu, &sep); */
++		p = fgets(line, sizeof(line), file);
++		if (p == NULL)
++			return -1;
++		else
++			n = sscanf(line, "%u%c", &cpu, &sep);
++
++		if (n <= 0)
++			break;
++
++		/* EOF == EOLN */
++		if (n == 1)
++			sep = '\n';
++
++		/* Was the previous CPU a range? */
++		if (prev >= 0) {
++			nr_cpus += cpu - prev + 1;
++			prev = -1;
++		} else if (sep == '-')
++			prev = cpu;
++		else
++		nr_cpus++;
++
++		if (sep == '\n')
++			break;
++	}
++	fclose(file);
++	return nr_cpus;
++}
++
++int __get_nprocs ()
++{
++	long ret;
++	static int cached = -1;
++
++	ret = cached;
++	if (ret < 0)
++	{
++		ret = __get_sysfs_cpus("/sys/devices/system/cpu/online");
++		cached = ret;
++	}
++	return ret;
++}
++
++int __get_nprocs_conf ()
++{
++	long ret;
++	static int cached = -1;
++
++	ret = cached;
++	if (ret < 0)
++	{
++		ret = __get_sysfs_cpus("/sys/devices/system/cpu/possible");
++		cached = ret;
++	}
++	return ret;
++}
++#endif
++#endif
++
+ /* Prepares the crash memory headers and stores in supplied buffer. */
+ int FUNC(struct kexec_info *info,
+ 	 struct crash_elf_info *elf_info,
+@@ -46,7 +134,11 @@ int FUNC(struct kexec_info *info,
+ 	if (xen_present())
+ 		nr_cpus = xen_get_nr_phys_cpus();
+ 	else
++#ifndef __KLIBC__
+ 		nr_cpus = sysconf(_SC_NPROCESSORS_CONF);
++#else
++		nr_cpus = __get_nprocs_conf();
++#endif
+ 
+ 	if (nr_cpus < 0) {
+ 		return -1;
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch
new file mode 100644
index 0000000..4a8968b
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch
@@ -0,0 +1,49 @@
+From e6aa1f18dc44dc71be3ceada2a96383d22454399 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Thu, 19 Apr 2018 00:25:01 +0200
+Subject: [PATCH] kexec-syscall.h: work around missing syscall() wrapper
+
+Fix
+
+ kexec-syscall.h: In function 'kexec_load':
+ kexec-syscall.h:80:16: warning: implicit declaration of function 'syscall'
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ kexec/kexec-syscall.h | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/kexec/kexec-syscall.h b/kexec/kexec-syscall.h
+index 33638c2..6b633e4 100644
+--- a/kexec/kexec-syscall.h
++++ b/kexec/kexec-syscall.h
+@@ -77,7 +77,11 @@ struct kexec_segment;
+ static inline long kexec_load(void *entry, unsigned long nr_segments,
+ 			struct kexec_segment *segments, unsigned long flags)
+ {
++#ifndef __KLIBC__
+ 	return (long) syscall(__NR_kexec_load, entry, nr_segments, segments, flags);
++#else
++	return (long) kexec_load(entry, nr_segments, segments, flags);
++#endif
+ }
+ 
+ static inline int is_kexec_file_load_implemented(void) {
+@@ -90,8 +94,12 @@ static inline long kexec_file_load(int kernel_fd, int initrd_fd,
+ 			unsigned long cmdline_len, const char *cmdline_ptr,
+ 			unsigned long flags)
+ {
++#ifndef __KLIBC__
+ 	return (long) syscall(__NR_kexec_file_load, kernel_fd, initrd_fd,
+ 				cmdline_len, cmdline_ptr, flags);
++#else
++	return -1;
++#endif
+ }
+ 
+ #define KEXEC_ON_CRASH		0x00000001
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0007-kexec.c-add-guard-around-ENOTSUP.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0007-kexec.c-add-guard-around-ENOTSUP.patch
new file mode 100644
index 0000000..3d44683
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0007-kexec.c-add-guard-around-ENOTSUP.patch
@@ -0,0 +1,37 @@
+From e6bd7a1bcfbd3e54efc81fbd7d60d915f9af0632 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Tue, 17 Apr 2018 11:35:14 +0200
+Subject: [PATCH] kexec.c: add guard around ENOTSUP
+
+Fix
+
+ kexec.c: In function 'main':
+ kexec.c:1515:11: error: 'ENOTSUP' undeclared
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ kexec/kexec.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/kexec/kexec.c b/kexec/kexec.c
+index 313d9fe..b5a8a1e 100644
+--- a/kexec/kexec.c
++++ b/kexec/kexec.c
+@@ -1501,6 +1501,7 @@ int main(int argc, char *argv[])
+ 					 */
+ 				case -EINVAL:
+ 				case -ENOEXEC:
++#ifndef __KLIBC__
+ 					 /*
+ 					  * ENOTSUP can be unsupported image
+ 					  * type or unsupported PE signature
+@@ -1513,6 +1514,7 @@ int main(int argc, char *argv[])
+ 					  * kernel bug
+ 					  */
+ 				case -ENOTSUP:
++#endif
+ 					do_kexec_file_syscall = 0;
+ 					break;
+ 			}
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0008-kexec.c-replace-mising-BLKGETSIZE64.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0008-kexec.c-replace-mising-BLKGETSIZE64.patch
new file mode 100644
index 0000000..cfc51cf
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0008-kexec.c-replace-mising-BLKGETSIZE64.patch
@@ -0,0 +1,32 @@
+From 12c7b09c3152f2b3475d081691a26bd1a5633256 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Tue, 17 Apr 2018 11:38:42 +0200
+Subject: [PATCH] kexec.c: replace missing BLKGETSIZE64
+
+Fix
+
+ kexec.c: In function 'slurp_file_generic':
+ kexec.c:564:19: error: 'BLKGETSIZE64' undeclared
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ kexec/kexec.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/kexec/kexec.c b/kexec/kexec.c
+index b5a8a1e..7842f8b 100644
+--- a/kexec/kexec.c
++++ b/kexec/kexec.c
+@@ -54,6 +54,10 @@
+ #define KEXEC_LOADED_PATH "/sys/kernel/kexec_loaded"
+ #define KEXEC_CRASH_LOADED_PATH "/sys/kernel/kexec_crash_loaded"
+ 
++#ifndef BLKGETSIZE64
++#define BLKGETSIZE64	_IOR(0x12,114,size_t)
++#endif
++
+ unsigned long long mem_min = 0;
+ unsigned long long mem_max = ULONG_MAX;
+ static unsigned long kexec_flags = 0;
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0009-vmcore-dmesg.c-work-around-missing-imaxdiv.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0009-vmcore-dmesg.c-work-around-missing-imaxdiv.patch
new file mode 100644
index 0000000..df980b1
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0009-vmcore-dmesg.c-work-around-missing-imaxdiv.patch
@@ -0,0 +1,57 @@
+From ad598a71ffff6f86462211f252ac0c7b5de53869 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Tue, 17 Apr 2018 13:14:12 +0200
+Subject: [PATCH] vmcore-dmesg.c: work around missing imaxdiv()
+
+Convert to integer arithmetic for klibc.
+
+Fix
+
+ vmcore-dmesg.c: In function 'dump_dmesg_structured':
+ vmcore-dmesg.c:578:2: error: unknown type name 'imaxdiv_t'
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ vmcore-dmesg/vmcore-dmesg.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/vmcore-dmesg/vmcore-dmesg.c b/vmcore-dmesg/vmcore-dmesg.c
+index e340ef4..1b27b71 100644
+--- a/vmcore-dmesg/vmcore-dmesg.c
++++ b/vmcore-dmesg/vmcore-dmesg.c
+@@ -575,8 +575,11 @@ static void dump_dmesg_structured(int fd)
+ 	ssize_t ret;
+ 	char *msg;
+ 	uint16_t text_len;
++#ifndef __KLIBC__
+ 	imaxdiv_t imaxdiv_sec, imaxdiv_usec;
+-
++#else
++	int64_t imaxdiv_sec, imaxdiv_usec;
++#endif
+ 	if (!log_buf_vaddr) {
+ 		fprintf(stderr, "Missing the log_buf symbol\n");
+ 		exit(60);
+@@ -645,12 +648,20 @@ static void dump_dmesg_structured(int fd)
+ 			exit(65);
+ 		}
+ 		ts_nsec = struct_val_u64(buf, log_offset_ts_nsec);
++#ifndef __KLIBC__
+ 		imaxdiv_sec = imaxdiv(ts_nsec, 1000000000);
+ 		imaxdiv_usec = imaxdiv(imaxdiv_sec.rem, 1000);
+ 
+ 		len += sprintf(out_buf + len, "[%5llu.%06llu] ",
+ 			(long long unsigned int)imaxdiv_sec.quot,
+ 			(long long unsigned int)imaxdiv_usec.quot);
++#else
++		imaxdiv_sec = ts_nsec / 1000000000;
++		imaxdiv_usec = (ts_nsec % 1000000000) / 1000;
++		len += sprintf(out_buf + len, "[%5llu.%06llu] ",
++			(long long unsigned int)imaxdiv_sec,
++			(long long unsigned int)imaxdiv_usec);
++#endif
+ 
+ 		/* escape non-printable characters */
+ 		text_len = struct_val_u16(buf, log_offset_text_len);
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0010-fs2dt.c-work-around-missing-getline.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0010-fs2dt.c-work-around-missing-getline.patch
new file mode 100644
index 0000000..cff1485
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0010-fs2dt.c-work-around-missing-getline.patch
@@ -0,0 +1,47 @@
+From edefda702d906d472ee7a675f6b506d5cfca7ac8 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Tue, 17 Apr 2018 13:48:25 +0200
+Subject: [PATCH] fs2dt.c: work around missing getline()
+
+This simple case can be rewrtten with fgets()
+
+Fix
+
+ fs2dt.c: In function 'dt_copy_old_root_param':
+ fs2dt.c:541:6: warning: implicit declaration of function 'getline'
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ kexec/fs2dt.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/kexec/fs2dt.c b/kexec/fs2dt.c
+index 07a5e2f..d635636 100644
+--- a/kexec/fs2dt.c
++++ b/kexec/fs2dt.c
+@@ -531,6 +531,9 @@ static void dt_copy_old_root_param(void)
+ 	char *last_cmdline = NULL;
+ 	char *p, *old_param;
+ 	size_t len = 0;
++#ifdef __KLIBC__
++	char buf[512];
++#endif
+ 
+ 	strcpy(filename, pathname);
+ 	strcat(filename, "bootargs");
+@@ -538,8 +541,13 @@ static void dt_copy_old_root_param(void)
+ 	if (!fp)
+ 		return;
+ 
++#ifndef __KLIBC__
+ 	if (getline(&last_cmdline, &len, fp) == -1)
+ 		die("unable to read %s\n", filename);
++#else
++	last_cmdline = fgets(buf, 200, fp);
++	last_cmdline[strlen(last_cmdline) - 1] = '\0';
++#endif
+ 
+ 	p = strstr(last_cmdline, "root=");
+ 	if (p) {
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
new file mode 100644
index 0000000..0ae2be7
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
@@ -0,0 +1,43 @@
+From fa3844ce6ce95f2db142b6c77f077b3e704d4f6f Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Tue, 17 Apr 2018 19:12:14 +0200
+Subject: [PATCH] purgatory Makefile: adapt to klcc
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ purgatory/Makefile | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/purgatory/Makefile b/purgatory/Makefile
+index 49ce80a..da36075 100644
+--- a/purgatory/Makefile
++++ b/purgatory/Makefile
+@@ -47,7 +47,7 @@ purgatory/sha256.o: $(srcdir)/util_lib/sha256.c
+ $(PURGATORY): CC=$(TARGET_CC)
+ $(PURGATORY): CFLAGS+=$(PURGATORY_EXTRA_CFLAGS) \
+ 		      $($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+-		      -Os -fno-builtin -ffreestanding \
++		      -Os -fno-builtin -ffreestanding -nostdinc \
+ 		      -fno-zero-initialized-in-bss \
+ 		      -fno-PIC -fno-PIE -fno-stack-protector
+ 
+@@ -59,13 +59,14 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+ 			-Iinclude \
+ 			-I$(shell $(CC) -print-file-name=include)
+ $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
+-			-Wl,--no-undefined -nostartfiles -nostdlib \
++			--no-undefined -nostartfiles -nostdlib \
+ 			-nodefaultlibs -e purgatory_start -r \
+-			-Wl,-Map=$(PURGATORY_MAP)
++			-Map=$(PURGATORY_MAP)
+ 
+ $(PURGATORY): $(PURGATORY_OBJS)
+ 	$(MKDIR) -p $(@D)
+-	$(CC) $(CFLAGS) $(LDFLAGS) -o $@.sym $^
++#	$(CC) $(CFLAGS) -o $@.sym $^
++	$(LD) $(LDFLAGS) -o $@.sym $^
+ #	$(LD) $(LDFLAGS) $(EXTRA_LDFLAGS) --no-undefined -e purgatory_start -r -o $@ $(PURGATORY_OBJS) $(UTIL_LIB)
+ 	$(STRIP) --strip-debug -o $@ $@.sym
+ 
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0012-purgatory-string.c-avoid-inclusion-of-string.h.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0012-purgatory-string.c-avoid-inclusion-of-string.h.patch
new file mode 100644
index 0000000..20934da
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0012-purgatory-string.c-avoid-inclusion-of-string.h.patch
@@ -0,0 +1,31 @@
+From 2d2ad16f9328a7cbb3f5b8479ae93eb923a0727f Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Thu, 19 Apr 2018 00:28:14 +0200
+Subject: [PATCH] purgatory/string.c: avoid inclusion of string.h
+
+Fix
+
+ purgatory/string.c:39:5: error: conflicting types for 'memcmp'
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ purgatory/string.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/purgatory/string.c b/purgatory/string.c
+index f06c460..c5e978a 100644
+--- a/purgatory/string.c
++++ b/purgatory/string.c
+@@ -1,5 +1,7 @@
+ #include <stddef.h>
++#ifndef __KLIBC__
+ #include <string.h>
++#endif
+ 
+ size_t strnlen(const char *s, size_t max)
+ {
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0013-sha256.h-avoid-inclusion-of-sys-types.h.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0013-sha256.h-avoid-inclusion-of-sys-types.h.patch
new file mode 100644
index 0000000..5d1664f
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0013-sha256.h-avoid-inclusion-of-sys-types.h.patch
@@ -0,0 +1,36 @@
+From ec6000b9f287e62cb0746e26cfa4372c7ea528f4 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Thu, 19 Apr 2018 23:26:43 +0200
+Subject: [PATCH] sha256.h: avoid inclusion of sys/types.h
+
+Fix
+
+ purgatory/printf.c:2:10: fatal error: limits.h:
+ No such file or directory
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ util_lib/include/sha256.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/util_lib/include/sha256.h b/util_lib/include/sha256.h
+index 467fb22..40fd3ed 100644
+--- a/util_lib/include/sha256.h
++++ b/util_lib/include/sha256.h
+@@ -1,7 +1,11 @@
+ #ifndef SHA256_H
+ #define SHA256_H
+ 
++#ifndef __KLIBC__
+ #include <sys/types.h>
++#else
++#include <stddef.h>
++#endif
+ #include <stdint.h>
+ 
+ typedef struct
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch
new file mode 100644
index 0000000..ad21266
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0014-add-if_nameindex-from-musl.patch
@@ -0,0 +1,152 @@
+From b15e9610b4ab52c381e712241d50dea96d50d873 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Wed, 2 May 2018 23:14:19 +0200
+Subject: [PATCH 14/14] add if_nameindex from musl
+
+Taken from musl, minimal changes.
+klibc lacks struct and func
+
+Fix
+
+ ifdown.o: In function `ifdown':
+ ifdown.c (.text+0x30): undefined reference to `if_nameindex'
+
+While there add klibc-specific guard and include sys/types.h
+to fix :
+
+ /kexec/if_nameindex.c:2:
+ /usr/lib/klibc/include/linux/types.h:22:0:
+ warning: "__bitwise" redefined
+ #define __bitwise __bitwise__
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ kexec/Makefile       |  2 +-
+ kexec/if_nameindex.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++
+ kexec/if_nameindex.h | 15 ++++++++++++
+ kexec/ifdown.c       |  3 +++
+ 4 files changed, 83 insertions(+), 1 deletion(-)
+ create mode 100644 kexec/if_nameindex.c
+ create mode 100644 kexec/if_nameindex.h
+
+diff --git a/kexec/Makefile b/kexec/Makefile
+index 4db84d8..fb7520b 100644
+--- a/kexec/Makefile
++++ b/kexec/Makefile
+@@ -11,7 +11,7 @@ KEXEC_SRCS = $(KEXEC_SRCS_base)
+ KEXEC_GENERATED_SRCS =
+ 
+ KEXEC_SRCS_base += kexec/kexec.c
+-KEXEC_SRCS_base += kexec/ifdown.c
++KEXEC_SRCS_base += kexec/if_nameindex kexec/ifdown.c
+ KEXEC_SRCS_base += kexec/kexec-elf.c
+ KEXEC_SRCS_base += kexec/kexec-elf-exec.c
+ KEXEC_SRCS_base += kexec/kexec-elf-core.c
+diff --git a/kexec/if_nameindex.c b/kexec/if_nameindex.c
+new file mode 100644
+index 0000000..e586e41
+--- /dev/null
++++ b/kexec/if_nameindex.c
+@@ -0,0 +1,64 @@
++#define _GNU_SOURCE
++#ifdef __KLIBC__
++#include <sys/types.h>
++#endif
++#include <netinet/in.h>
++#include <net/if.h>
++#include <stdlib.h>
++#include <sys/socket.h>
++#include <sys/ioctl.h>
++#include <errno.h>
++#include <sys/syscall.h>
++#include <stdio.h>
++#ifdef __KLIBC__
++#include "if_nameindex.h"
++#endif
++
++static void *do_nameindex(int s, size_t n)
++{
++	size_t i, len, k;
++	struct ifconf conf;
++	struct if_nameindex *idx;
++
++	idx = malloc(n * (sizeof(struct if_nameindex)+sizeof(struct ifreq)));
++	if (!idx) return 0;
++
++	conf.ifc_buf = (void *)&idx[n];
++	conf.ifc_len = len = n * sizeof(struct ifreq);
++	if (ioctl(s, SIOCGIFCONF, &conf) < 0) {
++		free(idx);
++		return 0;
++	}
++	if (conf.ifc_len == len) {
++		free(idx);
++		return (void *)-1;
++	}
++
++	n = conf.ifc_len / sizeof(struct ifreq);
++	for (i=k=0; i<n; i++) {
++		if (ioctl(s, SIOCGIFINDEX, &conf.ifc_req[i]) < 0) {
++			k++;
++			continue;
++		}
++		idx[i-k].if_index = conf.ifc_req[i].ifr_ifindex;
++		idx[i-k].if_name = conf.ifc_req[i].ifr_name;
++	}
++	idx[i-k].if_name = 0;
++	idx[i-k].if_index = 0;
++
++	return idx;
++}
++
++struct if_nameindex *if_nameindex()
++{
++	size_t n;
++	void *p = 0;
++	int s = socket(AF_UNIX, SOCK_DGRAM, 0);
++	if (s>=0) {
++		for (n=0; (p=do_nameindex(s, n)) == (void *)-1; n++);
++/*		__syscall(SYS_close, s); */
++		close(s);
++	}
++	errno = ENOBUFS;
++	return p;
++}
+diff --git a/kexec/if_nameindex.h b/kexec/if_nameindex.h
+new file mode 100644
+index 0000000..1725fbd
+--- /dev/null
++++ b/kexec/if_nameindex.h
+@@ -0,0 +1,15 @@
++#ifndef _NET_IF__NAMEINDEX_H
++#define _NET_IF_NAMEINDEX_H
++
++struct if_nameindex
++{
++    unsigned int if_index;
++    char *if_name;
++};
++
++unsigned int if_nametoindex (const char *);
++char *if_indextoname (unsigned int, char *);
++struct if_nameindex *if_nameindex (void);
++void if_freenameindex (struct if_nameindex *);
++
++#endif
+diff --git a/kexec/ifdown.c b/kexec/ifdown.c
+index 82c6141..cc3ca9f 100644
+--- a/kexec/ifdown.c
++++ b/kexec/ifdown.c
+@@ -18,6 +18,9 @@ char *v_ifdown = "@(#)ifdown.c  1.11  02-Jun-1998  miquels@cistron.nl";
+ 
+ #include <netinet/in.h>
+ #include <net/if.h>
++#ifdef __KLIBC__
++#include "if_nameindex.h"
++#endif
+ 
+ /*
+  *  First, we find all shaper devices and down them. Then we
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch
new file mode 100644
index 0000000..0b88b94
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0015-vmcore-dmesg-fix-warning.patch
@@ -0,0 +1,29 @@
+From 3294266c6a875c5009065c1ae5d0b86200c4147c Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sun, 29 Apr 2018 00:52:31 +0200
+Subject: [PATCH 6/6] vmcore-dmesg: fix warning
+
+ # define __bitwise
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ vmcore-dmesg/vmcore-dmesg.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/vmcore-dmesg/vmcore-dmesg.c b/vmcore-dmesg/vmcore-dmesg.c
+index e340ef4..91e4789 100644
+--- a/vmcore-dmesg/vmcore-dmesg.c
++++ b/vmcore-dmesg/vmcore-dmesg.c
+@@ -2,6 +2,9 @@
+ #define _GNU_SOURCE
+ #define _LARGEFILE_SOURCE 1
+ #define _FILE_OFFSET_BITS 64
++#ifdef __KLIBC__
++#include <sys/types.h>
++#endif
+ #include <endian.h>
+ #include <byteswap.h>
+ #include <stdio.h>
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64-crashdump-arm64.c-fix-warning.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64-crashdump-arm64.c-fix-warning.patch
new file mode 100644
index 0000000..24be4dd
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64-crashdump-arm64.c-fix-warning.patch
@@ -0,0 +1,34 @@
+From 6f69f489a442b3a192e4c08748ee8c4d31c75dae Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sun, 29 Apr 2018 00:46:16 +0200
+Subject: [PATCH 5/6] arm64: crashdump-arm64.c: fix warning
+
+                 from ../git/kexec/kexec.h:6,
+                 from ../git/kexec/arch/arm64/crashdump-arm64.c:18:
+/tmp/build/tmp-musl/work/aarch64-oe-linux-musl/kexec-tools-klibc/0.6+gitAUTOINC+
+0481e9ed61-r0/recipe-sysroot/usr/lib/klibc/include/klibc/compiler.h:144:0: warni
+ng: "__bitwise" redefined
+ # define __bitwise
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ kexec/arch/arm64/crashdump-arm64.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/kexec/arch/arm64/crashdump-arm64.c b/kexec/arch/arm64/crashdump-arm64.c
+index 4fd7aa8..890d88f 100644
+--- a/kexec/arch/arm64/crashdump-arm64.c
++++ b/kexec/arch/arm64/crashdump-arm64.c
+@@ -13,6 +13,9 @@
+ #define _GNU_SOURCE
+ 
+ #include <errno.h>
++#ifdef __KLIBC__
++#include <sys/types.h>
++#endif
+ #include <linux/elf.h>
+ 
+ #include "kexec.h"
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_kexec-image-header.h-add-missing-le64toh.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_kexec-image-header.h-add-missing-le64toh.patch
new file mode 100644
index 0000000..7decbac
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_kexec-image-header.h-add-missing-le64toh.patch
@@ -0,0 +1,40 @@
+From af7d06a753a4c377b7ffe587da67a6ba56048bea Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Thu, 19 Apr 2018 10:47:17 +0200
+Subject: [PATCH 2/2] kexec/arm64: image-header.h: add macro for le64toh
+
+Fix
+
+ kexec-arm64.c:(.text+0x370): undefined reference to `le64toh'
+ kexec-arm64.c:(.text+0x380): undefined reference to `le64toh'
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ kexec/arch/arm64/image-header.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/kexec/arch/arm64/image-header.h b/kexec/arch/arm64/image-header.h
+index 158d411..10ed2d6 100644
+--- a/kexec/arch/arm64/image-header.h
++++ b/kexec/arch/arm64/image-header.h
+@@ -8,6 +8,15 @@
+ #include <endian.h>
+ #include <stdint.h>
+ 
++#ifdef __KLIBC__
++#if __BYTE_ORDER == __LITTLE_ENDIAN
++#define le64toh(x) (x)
++#endif
++#if __BYTE_ORDER == __BIG_ENDIAN
++#define le64toh(x) __bswap_64(x)
++#endif
++#endif
++
+ /**
+  * struct arm64_image_header - arm64 kernel image header.
+  *
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_purgatory-Makefile-remove-unknown-flags.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_purgatory-Makefile-remove-unknown-flags.patch
new file mode 100644
index 0000000..f87f433
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_purgatory-Makefile-remove-unknown-flags.patch
@@ -0,0 +1,51 @@
+From 1ceca8645dbe2780e1b8993c80de772993fe3053 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Thu, 19 Apr 2018 10:43:34 +0200
+Subject: [PATCH 1/2] purgatory/arm64: Makefile: remove unknown flags for arm64
+
+Fix
+
+ | aarch64-oe-linux-musl-ld: unrecognised emulation mode: cmodel=large
+ | Supported emulations: aarch64linux aarch64elf aarch64elf32
+   aarch64elf32b aarch64elfb armelf armelfb aarch64linuxb aarch64linux32
+  aarch64linux32b armelfb_linux_eabi armelf_linux_eabi
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ purgatory/arch/arm64/Makefile | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/purgatory/arch/arm64/Makefile b/purgatory/arch/arm64/Makefile
+index 636abea..ddc9461 100644
+--- a/purgatory/arch/arm64/Makefile
++++ b/purgatory/arch/arm64/Makefile
+@@ -1,13 +1,13 @@
+ 
+-arm64_PURGATORY_EXTRA_CFLAGS = \
+-	-mcmodel=large \
+-	-fno-PIC \
+-	-fno-stack-protector \
+-	-fno-asynchronous-unwind-tables \
+-	-Wundef \
+-	-Werror-implicit-function-declaration \
+-	-Wdeclaration-after-statement \
+-	-Werror=implicit-int \
+-	-Werror=strict-prototypes
++#arm64_PURGATORY_EXTRA_CFLAGS = \
++#	-mcmodel=large \
++#	-fno-PIC \
++#	-fno-stack-protector \
++#	-fno-asynchronous-unwind-tables \
++#	-Wundef \
++#	-Werror-implicit-function-declaration \
++#	-Wdeclaration-after-statement \
++#	-Werror=implicit-int \
++#	-Werror=strict-prototypes
+ 
+ arm64_PURGATORY_SRCS += \
+ 	purgatory/arch/arm64/entry.S \
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump.patch
new file mode 100644
index 0000000..9596263
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm_crashdump.patch
@@ -0,0 +1,31 @@
+From 6dae4752a53973c152b3e91e8a4ca74a486dae8b Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Wed, 11 Apr 2018 22:51:00 +0200
+Subject: [PATCH] use our elf.h header
+
+Fix
+
+ kexec/arch/arm/crashdump-arm.c:70:13: error: 'EM_ARM' undeclared here
+ (not in a function); did you mean 'EM_860'?
+    .machine = EM_ARM,
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ kexec/arch/arm/crashdump-arm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-arm.c
+index daa4788..2530b29 100644
+--- a/kexec/arch/arm/crashdump-arm.c
++++ b/kexec/arch/arm/crashdump-arm.c
+@@ -21,7 +21,7 @@
+  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+ #include <limits.h>
+-#include <elf.h>
++#include "../../../include/elf.h"
+ #include <errno.h>
+ #include <stdio.h>
+ #include <stdlib.h>
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc-purgatory-Makefile-remove-unknown-flags.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc-purgatory-Makefile-remove-unknown-flags.patch
new file mode 100644
index 0000000..c3b2071
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/powerpc-purgatory-Makefile-remove-unknown-flags.patch
@@ -0,0 +1,34 @@
+From 709dfe457c07aa0275f3da14634cbce5cf1029dc Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Thu, 19 Apr 2018 19:26:53 +0200
+Subject: [PATCH 3/3] powerpc/purgatory: Makefile: remove unknown flags for
+ powerpc
+
+Fix
+
+ powerpc-oe-linux-musl-ld: unrecognised emulation mode: soft-float
+ Supported emulations: elf32ppclinux elf32ppc elf32ppcsim elf32lppclinux
+                       elf32lppc elf32lppcsim elf64ppc elf64lppc
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ purgatory/arch/ppc/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/purgatory/arch/ppc/Makefile b/purgatory/arch/ppc/Makefile
+index c85c58a..cd44a16 100644
+--- a/purgatory/arch/ppc/Makefile
++++ b/purgatory/arch/ppc/Makefile
+@@ -7,7 +7,7 @@ ppc_PURGATORY_SRCS += purgatory/arch/ppc/misc.S
+ ppc_PURGATORY_SRCS += purgatory/arch/ppc/purgatory-ppc.c
+ ppc_PURGATORY_SRCS += purgatory/arch/ppc/console-ppc.c
+ 
+-ppc_PURGATORY_EXTRA_CFLAGS += -msoft-float
++#ppc_PURGATORY_EXTRA_CFLAGS += -msoft-float
+ 
+ dist += purgatory/arch/ppc/Makefile $(ppc_PURGATORY_SRCS)		\
+ 	purgatory/arch/ppc/purgatory-ppc.h purgatory/arch/ppc/ppc_asm.h
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86-64-purgatory-Makefile-remove-unknown-flags.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86-64-purgatory-Makefile-remove-unknown-flags.patch
new file mode 100644
index 0000000..f1db757
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86-64-purgatory-Makefile-remove-unknown-flags.patch
@@ -0,0 +1,33 @@
+From 9453599fd833794fb5d87cab2622de286144ed54 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Wed, 18 Apr 2018 22:30:17 +0200
+Subject: [PATCH 6/6] purgatory: Makefile: remove unknown flags
+
+Fix
+
+ x86_64-oe-linux-musl-ld: unrecognised emulation mode: cmodel=large
+ Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu
+                       i386linux elf_l1om elf_k1om
+ ../kexec-tools-2.0.17-rc1/purgatory/Makefile:67:
+ recipe for target 'purgatory/purgatory.ro' failed
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ purgatory/arch/x86_64/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/purgatory/arch/x86_64/Makefile b/purgatory/arch/x86_64/Makefile
+index 7300937..38f0bf3 100644
+--- a/purgatory/arch/x86_64/Makefile
++++ b/purgatory/arch/x86_64/Makefile
+@@ -23,4 +23,4 @@ x86_64_PURGATORY_SRCS += purgatory/arch/i386/console-x86.c
+ x86_64_PURGATORY_SRCS += purgatory/arch/i386/vga.c
+ x86_64_PURGATORY_SRCS += purgatory/arch/i386/pic.c
+ 
+-x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
++#x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_basename.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_basename.patch
new file mode 100644
index 0000000..0d0ed23
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_basename.patch
@@ -0,0 +1,30 @@
+From 5f47c30759684cea9a7a409646686c1a358b78ac Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Wed, 11 Apr 2018 22:51:05 +0200
+Subject: [PATCH] replace basename() with sscanf()
+
+klibc lacks basename()
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ kexec/arch/i386/x86-linux-setup.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/kexec/arch/i386/x86-linux-setup.c b/kexec/arch/i386/x86-linux-setup.c
+index 6c7d260..7850083 100644
+--- a/kexec/arch/i386/x86-linux-setup.c
++++ b/kexec/arch/i386/x86-linux-setup.c
+@@ -304,9 +304,9 @@ static int add_edd_entry(struct x86_linux_param_header *real_mode,
+ 	memset(edd_info, 0, sizeof(struct edd_info));
+ 
+ 	/* extract the device number */
+-	if (sscanf(basename(sysfs_name), "int13_dev%hhx", &devnum) != 1) {
++	if (sscanf(strrchr(sysfs_name,'/') + 1, "int13_dev%hhx", &devnum) != 1) {
+ 		fprintf(stderr, "Invalid format of int13_dev dir "
+-				"entry: %s\n", basename(sysfs_name));
++				"entry: %s\n", strrchr(sysfs_name,'/') + 1);
+ 		return -1;
+ 	}
+ 
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_kexec_test.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_kexec_test.patch
new file mode 100644
index 0000000..b7d7c10
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_kexec_test.patch
@@ -0,0 +1,30 @@
+From 9de68ec5af8db2eff352f12da28145fe5e96244d Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Wed, 11 Apr 2018 22:51:05 +0200
+Subject: [PATCH] do not build test
+
+The purpose of this recipe is to build the smallest
+binaries. kexek klibc-static for armv5 is around 86 KiB
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 79188d8..953c141 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -178,8 +178,8 @@ PSRCS:=$(foreach s, $(SRCS), $(PACKAGE_NAME)-$(PACKAGE_VERSION)/$(s))
+ PGSRCS:=$(foreach s, $(GENERATED_SRCS), $(PACKAGE_NAME)-$(PACKAGE_VERSION)/$(s))
+ 
+ MAN_PAGES:=$(KEXEC_MANPAGE) $(KDUMP_MANPAGE) $(VMCORE_DMESG_MANPAGE)
+-BINARIES_i386:=$(KEXEC_TEST)
+-BINARIES_x86_64:=$(KEXEC_TEST)
++BINARIES_i386:=$(SBINDIR)/kexec
++BINARIES_x86_64:=$(SBINDIR)/kexec
+ BINARIES:=$(KEXEC) $(KDUMP) $(VMCORE_DMESG) $(BINARIES_$(ARCH))
+ 
+ TARGETS:=$(BINARIES) $(MAN_PAGES)
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_sys_io.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_sys_io.patch
new file mode 100644
index 0000000..493f298
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_sys_io.patch
@@ -0,0 +1,36 @@
+From a992ee014efacdc98d5658be9930dcab0eaadfd7 Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Wed, 11 Apr 2018 22:51:04 +0200
+Subject: [PATCH] i386: replace with our io.h
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ purgatory/arch/i386/pic.c | 2 +-
+ purgatory/arch/i386/vga.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/purgatory/arch/i386/pic.c b/purgatory/arch/i386/pic.c
+index c23c459..c5f7046 100644
+--- a/purgatory/arch/i386/pic.c
++++ b/purgatory/arch/i386/pic.c
+@@ -16,7 +16,7 @@
+  * along with this program; if not, write to the Free Software
+  * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+-#include <sys/io.h>
++#include "include/arch/io.h"
+ #include <purgatory.h>
+ #include "purgatory-x86.h"
+ 
+diff --git a/purgatory/arch/i386/vga.c b/purgatory/arch/i386/vga.c
+index e65976c..d079d96 100644
+--- a/purgatory/arch/i386/vga.c
++++ b/purgatory/arch/i386/vga.c
+@@ -1,4 +1,4 @@
+-#include <sys/io.h>
++#include "include/arch/io.h"
+ #include <purgatory.h>
+ #include "purgatory-x86.h"
+ 
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_vfscanf.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_vfscanf.patch
new file mode 100644
index 0000000..2f0ad2e
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86_vfscanf.patch
@@ -0,0 +1,43 @@
+From 423c3f6f41fe04f4512e2a97a130f072d53dd4cf Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Wed, 11 Apr 2018 22:51:05 +0200
+Subject: [PATCH] x86-linux-setup.c: replace vfscanf() with vsscanf()
+
+klibc lacks vfscanf()
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+---
+ kexec/arch/i386/x86-linux-setup.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/kexec/arch/i386/x86-linux-setup.c b/kexec/arch/i386/x86-linux-setup.c
+index 7850083..e190356 100644
+--- a/kexec/arch/i386/x86-linux-setup.c
++++ b/kexec/arch/i386/x86-linux-setup.c
+@@ -200,6 +200,8 @@ static int file_scanf(const char *dir, const char *file, const char *scanf_line,
+ 	FILE *fp;
+ 	int retno;
+ 	char filename[PATH_MAX];
++	long line_size = MAX_LINE;
++	char *line;
+ 
+ 	snprintf(filename, PATH_MAX, "%s/%s", dir, file);
+ 	filename[PATH_MAX-1] = 0;
+@@ -210,7 +212,14 @@ static int file_scanf(const char *dir, const char *file, const char *scanf_line,
+ 	}
+ 
+ 	va_start(argptr, scanf_line);
+-	retno = vfscanf(fp, scanf_line, argptr);
++
++	line = xmalloc(sizeof(line) * line_size);
++	while(fgets(line, sizeof(line), fp) != NULL ) {
++		line_size += MAX_LINE;
++		line = xrealloc(line,line_size);
++	}
++	retno = vsscanf(line, scanf_line, argptr);
++
+ 	va_end(argptr);
+ 
+ 	fclose(fp);
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
deleted file mode 100644
index 2e27033..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
+++ /dev/null
@@ -1,69 +0,0 @@
-# the binaries are statically linked against klibc
-SUMMARY = "Kexec tools, statically compiled against klibc"
-AUTHOR = "Eric Biederman"
-HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kexec/"
-SECTION = "kernel/userland"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
-                    file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
-DEPENDS = "zlib xz"
-
-PR = "r1"
-
-inherit klibc autotools
-
-FILESPATH =. "${FILE_DIRNAME}/kexec-tools-${PV}:"
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz"
-
-SRC_URI += " \
-            file://kexec-elf-rel.patch \
-            file://kexec-syscall.patch \
-            file://cflags_static.patch  \
-            file://ifdown_errno.patch  \
-            file://purgatory_flags.patch \
-            file://purgatory_string.patch \
-            file://sha256.patch \
-            file://sysconf_nrprocessors.patch \
-            file://fix-out-of-tree-build.patch \
-            file://0001-Adjust-the-order-of-headers-to-fix-build-for-musl.patch \
-            "
-
-SRC_URI[md5sum] = "92eff93b097475b7767f8c98df84408a"
-SRC_URI[sha256sum] = "09e180ff36dee087182cdc939ba6c6917b6adbb5fc12d589f31fd3659b6471f2"
-
-SRC_URI_append_arm = " file://arm_crashdump.patch"
-SRC_URI_append_powerpc = " file://ppc__lshrdi3.patch"
-SRC_URI_append_x86 = " file://x86_sys_io.patch file://x86_basename.patch file://x86_vfscanf.patch file://x86_kexec_test.patch"
-SRC_URI_append_x86-64 = " file://x86_sys_io.patch file://x86_basename.patch file://x86_vfscanf.patch file://x86_kexec_test.patch"
-
-S = "${WORKDIR}/kexec-tools-${PV}"
-
-EXTRA_OECONF += "--without-zlib --without-lzma --without-xen"
-
-CFLAGS += "-I${STAGING_DIR_HOST}${libdir}/klibc/include -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
-CFLAGS_x86-64 += "-I${STAGING_DIR_HOST}${libdir}/klibc/include -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
-
-do_compile_prepend() {
-    # Remove the prepackaged config.h from the source tree as it overrides
-    # the same file generated by configure and placed in the build tree
-    rm -f ${S}/include/config.h
-
-    # Remove the '*.d' file to make sure the recompile is OK
-    for dep in `find ${B} -type f -name '*.d'`; do
-        dep_no_d="`echo $dep | sed 's#.d$##'`"
-        # Remove file.d when there is a file.o
-        if [ -f "$dep_no_d.o" ]; then
-            rm -f $dep
-        fi
-    done
-}
-
-PACKAGES =+ "kexec-klibc kdump-klibc"
-
-FILES_kexec-klibc = "${sbindir}/kexec"
-FILES_kdump-klibc = "${sbindir}/kdump"
-
-INSANE_SKIP_${PN} = "arch"
-
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-(linux|freebsd.*)'
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
new file mode 100644
index 0000000..14edec2
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -0,0 +1,92 @@
+# the binaries are statically linked against klibc
+SUMMARY = "Kexec tools, statically compiled against klibc"
+AUTHOR = "Eric Biederman"
+HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kexec/"
+SECTION = "kernel/userland"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
+                    file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
+PV = "2.0.17+git${SRCPV}"
+
+DEPENDS = "zlib xz"
+
+inherit klibc autotools
+
+SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git"
+SRCREV = "0481e9ed61ef80b3d851bb96b0c70a3d4a112c8b"
+
+BUILD_PATCHES = "file://0001-force-static-build.patch \
+                 file://0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch"
+
+KLIBC_PATCHES += " \
+            file://0003-kexec-elf-rel-use-our-elf.h.patch \
+            file://0004-kexec-elf-exec.c-replace-with-our-err.h.patch \
+            file://0005-crashdump-elf.c-work-around-for-sysconf-_SC_NPROCESS.patch \
+            file://0006-kexec-syscall.h-work-around-missing-syscall-wrapper.patch \
+            file://0007-kexec.c-add-guard-around-ENOTSUP.patch \
+            file://0008-kexec.c-replace-mising-BLKGETSIZE64.patch \
+            file://0009-vmcore-dmesg.c-work-around-missing-imaxdiv.patch \
+            file://0010-fs2dt.c-work-around-missing-getline.patch \
+            file://0011-purgatory-Makefile-adapt-to-klcc.patch \
+            file://0012-purgatory-string.c-avoid-inclusion-of-string.h.patch \
+            file://0013-sha256.h-avoid-inclusion-of-sys-types.h.patch \
+            file://0014-add-if_nameindex-from-musl.patch \
+            file://0015-vmcore-dmesg-fix-warning.patch"
+
+WARNING_FIXES = ""
+
+SRC_URI += "${BUILD_PATCHES} ${KLIBC_PATCHES} ${WARNING_FIXES}"
+
+SRC_URI_append_arm = " file://arm_crashdump.patch"
+
+SRC_URI_append_x86 = " file://x86_sys_io.patch file://x86_basename.patch \
+                       file://x86_vfscanf.patch file://x86_kexec_test.patch"
+
+SRC_URI_append_x86-64 = " file://x86_sys_io.patch file://x86_basename.patch \
+                          file://x86_vfscanf.patch file://x86_kexec_test.patch \
+                          file://x86-64-purgatory-Makefile-remove-unknown-flags.patch"
+
+SRC_URI_append_aarch64 = " file://arm64_purgatory-Makefile-remove-unknown-flags.patch \
+                           file://arm64_kexec-image-header.h-add-missing-le64toh.patch \
+                           file://arm64-crashdump-arm64.c-fix-warning.patch"
+
+SRC_URI_append_powerpc = " file://powerpc-purgatory-Makefile-remove-unknown-flags.patch"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "--without-zlib --without-lzma --without-xen"
+
+# fix purgatory/printf.c:2:10: fatal error: limits.h: No such file or directory
+# fix include/limits.h:42:10: fatal error: bitsize/limits.h: No such file or directory
+COMMON_CFLAGS += "-I${STAGING_DIR_HOST}${libdir}/klibc/include -I${S}/purgatory/include"
+CFLAGS_x86_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
+CFLAGS_x86-64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
+CFLAGS_arm_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
+CFLAGS_aarch64_append = "${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
+CFLAGS_mips_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
+CFLAGS_mips64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
+CFLAGS_powerpc_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
+
+do_compile_prepend() {
+    # Remove the prepackaged config.h from the source tree as it overrides
+    # the same file generated by configure and placed in the build tree
+    rm -f ${S}/include/config.h
+
+    # Remove the '*.d' file to make sure the recompile is OK
+    for dep in `find ${B} -type f -name '*.d'`; do
+        dep_no_d="`echo $dep | sed 's#.d$##'`"
+        # Remove file.d when there is a file.o
+        if [ -f "$dep_no_d.o" ]; then
+            rm -f $dep
+        fi
+    done
+}
+
+PACKAGES =+ "kexec-klibc kdump-klibc"
+
+FILES_kexec-klibc = "${sbindir}/kexec"
+FILES_kdump-klibc = "${sbindir}/kdump"
+
+INSANE_SKIP_${PN} = "arch"
+
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-(linux|freebsd.*)'
-- 
2.7.4


