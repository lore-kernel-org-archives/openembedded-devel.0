Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 13DBA7503B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 23:08:15 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id y11-v6so3573136wrd.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2018 16:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HzbVUZKvUiHRtTGaXHwexuNsDjRBR7irsb0I47bKZ9s=;
	b=q6EAaJr71VoEsGLhryAlaQtGD6Fhk3B8EoGqN8/cL1ZTo21sR55SgADYJvzKN+x9Ol
	jtNcrr9y5yAdlFg9Eo2IhQLbvyWT6vTbhDgnPvKVS3ZRfJz5rD26Gl66t+QIZGLeuxC4
	PKbc+g9EIfY8DMsh+iCg4WqCUtF66igVYh7kVCdNDGnzmFdI4CE/rj1s/ku8DNKyK0+l
	NtmjxVmiEg5Cb6mjhfx+nxAT5j9cYO7CLrHQWeWS7gvncMZwcOelzOp+ty6zQiZKQEDd
	QSt4go8WIoDy4MyXerfVJ6FHkCORToYw0dSPzYes6N67GpyIBtUCn8JKAE5xUATxPnZ/
	XVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HzbVUZKvUiHRtTGaXHwexuNsDjRBR7irsb0I47bKZ9s=;
	b=BPl4XzDM59aDDYWGGEAQblvnnGzJLcspERBL0CZ/5yMBjwvkoGF4rtgVdUQiAYVz64
	u2kbMn9uacZjZOTOzdzxbkFGmykyt4Cb/Mb6kvder43vM7Xdah5iOLUzXJlfErs7uOZl
	87iimzr+LO6l4NvLY/AjiFzHEE4gRVflj5/Nx/I8kE8jQfgZLeR41/RqhHYo6YREUKNw
	9X4QCp2Ke7VYYeid3UCpLQsisa1KDHLnG3bVTM+4PM12SQw2HtsW6rKWgNeonf4ZFLhQ
	ZB++zFbe0kth1Jq59Tlpx/mQN3KzX6S6JUTHqhL5hCRqDtKLuixH0gWgtiR+Bu1bpL/r
	tioA==
X-Gm-Message-State: ABuFfojevhMNdA+OuKD45oPre+kZCK3+phkGjzYFW95VT4f1UpOuUoqp
	auS0Rs85zP6kmyyLYExoruD4fGIR
X-Google-Smtp-Source: ACcGV61JdeU/qkFv3yumrTSC9vaU7wyM2y7jMffBnHiG0vmbEhW231Ml046+JQ5W6nYpdm+AaEWknw==
X-Received: by 2002:a5d:4306:: with SMTP id
	h6-v6mr17075075wrq.189.1539126496205; 
	Tue, 09 Oct 2018 16:08:16 -0700 (PDT)
Received: from localhost.localdomain
	(host71-72-dynamic.117-80-r.retail.telecomitalia.it. [80.117.72.71])
	by smtp.gmail.com with ESMTPSA id
	b71-v6sm18959573wma.13.2018.10.09.16.08.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Oct 2018 16:08:15 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Oct 2018 01:08:10 +0200
Message-Id: <1539126490-16602-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] klibc-static-utils: really fix build for x86 with security flags enabled
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
X-List-Received-Date: Tue, 09 Oct 2018 23:08:16 -0000

There were some shared binaries built together with the static ones and this
was leading to the infamous:

 i586-oe-linux-musl-ld.bfd: discarded output section: `.got.plt'

Fix this by purging the Kbuild files.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...static-utils-do-not-build-shared-binaries.patch | 213 +++++++++++++++++++++
 .../klibc/klibc-static-utils_2.0.4.bb              |   2 +
 2 files changed, 215 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-static-utils-do-not-build-shared-binaries.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-static-utils-do-not-build-shared-binaries.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-static-utils-do-not-build-shared-binaries.patch
new file mode 100644
index 0000000..2f7cd35
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-static-utils-do-not-build-shared-binaries.patch
@@ -0,0 +1,213 @@
+From c034dceae17b7d8d437871afe5eba55a55434222 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Wed, 10 Oct 2018 00:48:31 +0200
+Subject: [PATCH] klibc-static-utils: do not build shared binaries
+
+We were building some shared utilities and this was leading to linker errors
+for x86 with security flags enabled.
+
+Fix
+ i586-oe-linux-musl-ld.bfd: discarded output section: `.got.plt'
+
+Upstream-Status: Inappropriate [Embedded Specific]
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ usr/dash/Kbuild           | 6 +-----
+ usr/kinit/Kbuild          | 4 +---
+ usr/kinit/fstype/Kbuild   | 4 +---
+ usr/kinit/ipconfig/Kbuild | 4 +---
+ usr/kinit/nfsmount/Kbuild | 4 +---
+ usr/kinit/resume/Kbuild   | 5 +----
+ usr/kinit/run-init/Kbuild | 5 +----
+ usr/utils/Kbuild          | 7 ++-----
+ 8 files changed, 9 insertions(+), 30 deletions(-)
+
+diff --git a/usr/dash/Kbuild b/usr/dash/Kbuild
+index 1a6920a..b3a4e64 100644
+--- a/usr/dash/Kbuild
++++ b/usr/dash/Kbuild
+@@ -25,12 +25,8 @@ gen-h-files := builtins.h nodes.h syntax.h token.h
+ 
+ static-y := sh
+ 
+-# The shared binary
+-shared-y    := sh.shared
+-sh.shared-y := $(sh-y)
+-
+ # For cleaning
+-targets := sh sh.g sh.shared sh.shared.g $(gen-o-files)
++targets := sh sh.g $(gen-o-files)
+ 
+ # explicit dependency for all generated files
+ $(addprefix $(obj)/, $(sh-y)): $(addprefix $(obj)/, $(gen-h-files))
+diff --git a/usr/kinit/Kbuild b/usr/kinit/Kbuild
+index f7fdccd..8db06ab 100644
+--- a/usr/kinit/Kbuild
++++ b/usr/kinit/Kbuild
+@@ -18,8 +18,6 @@ kinit-y  += fstype/
+ kinit-y  += resume/
+ 
+ static-y := kinit
+-shared-y := kinit.shared
+-kinit.shared-y := $(kinit-y)
+ 
+ # Additional include paths files
+ KLIBCCFLAGS += -I$(srctree)/$(src)/fstype \
+@@ -29,7 +27,7 @@ KLIBCCFLAGS += -I$(srctree)/$(src)/fstype \
+  	       -I$(srctree)/$(src)/run-init
+ 
+ # Cleaning
+-targets += kinit kinit.g kinit.shared kinit.shared.g
++targets += kinit kinit.g
+ subdir- := fstype ipconfig nfsmount resume run-init
+ 
+ 
+diff --git a/usr/kinit/fstype/Kbuild b/usr/kinit/fstype/Kbuild
+index 367611d..8d453ea 100644
+--- a/usr/kinit/fstype/Kbuild
++++ b/usr/kinit/fstype/Kbuild
+@@ -3,7 +3,6 @@
+ #
+ 
+ static-y := static/fstype
+-shared-y := shared/fstype
+ 
+ # common .o files
+ objs := main.o fstype.o
+@@ -16,8 +15,7 @@ lib-y := $(objs)
+ 
+ # .o files used to built executables
+ static/fstype-y := $(objs)
+-shared/fstype-y := $(objs)
+ 
+ # Cleaning
+-clean-dirs := static shared
++clean-dirs := static
+ 
+diff --git a/usr/kinit/ipconfig/Kbuild b/usr/kinit/ipconfig/Kbuild
+index eb1d472..ef87e7e 100644
+--- a/usr/kinit/ipconfig/Kbuild
++++ b/usr/kinit/ipconfig/Kbuild
+@@ -3,7 +3,6 @@
+ #
+ 
+ static-y := static/ipconfig
+-shared-y := shared/ipconfig
+ 
+ # common .o files
+ objs := main.o netdev.o packet.o
+@@ -22,8 +21,7 @@ lib-y := $(objs)
+ 
+ # .o files used to built executables
+ static/ipconfig-y := $(objs)
+-shared/ipconfig-y := $(objs)
+ 
+ # Cleaning
+-clean-dirs := static shared
++clean-dirs := static
+ 
+diff --git a/usr/kinit/nfsmount/Kbuild b/usr/kinit/nfsmount/Kbuild
+index ba31708..01bedce 100644
+--- a/usr/kinit/nfsmount/Kbuild
++++ b/usr/kinit/nfsmount/Kbuild
+@@ -4,7 +4,6 @@
+ 
+ static-y := static/nfsmount
+ #FIXME - build is broken static-y := dummypmap
+-shared-y := shared/nfsmount
+ 
+ objs := main.o mount.o portmap.o dummypmap.o sunrpc.o
+ 
+@@ -13,7 +12,6 @@ lib-y := $(objs)
+ 
+ # .o files used for executables
+ static/nfsmount-y := $(objs)
+-shared/nfsmount-y := $(objs)
+ 
+ # dummypmap uses a single .o file (rename src file?)
+ dummypmap-y := dummypmap_test.o
+@@ -21,5 +19,5 @@ dummypmap-y := dummypmap_test.o
+ # TODO - do we want a stripped version
+ # TODO - do we want the static.g + shared.g directories?
+ 
+-clean-dirs := static shared
++clean-dirs := static
+ 
+diff --git a/usr/kinit/resume/Kbuild b/usr/kinit/resume/Kbuild
+index c1342e1..15b9590 100644
+--- a/usr/kinit/resume/Kbuild
++++ b/usr/kinit/resume/Kbuild
+@@ -3,7 +3,6 @@
+ #
+ 
+ static-y := static/resume
+-shared-y := shared/resume
+ 
+ # common .o files
+ objs := resume.o resumelib.o
+@@ -20,9 +19,7 @@ KLIBCCFLAGS += -I$(srctree)/$(src)/..
+ # .o files used to built executables
+ static/resume-y   := $(objs)
+ static/resume-lib := ../lib.a
+-shared/resume-y   := $(objs)
+-shared/resume-lib := ../lib.a
+ 
+ # Cleaning
+-clean-dirs := static shared
++clean-dirs := static
+ 
+diff --git a/usr/kinit/run-init/Kbuild b/usr/kinit/run-init/Kbuild
+index c153b0a..a1ea834 100644
+--- a/usr/kinit/run-init/Kbuild
++++ b/usr/kinit/run-init/Kbuild
+@@ -3,7 +3,6 @@
+ #
+ 
+ static-y := static/run-init
+-shared-y := shared/run-init
+ 
+ # common .o files
+ objs := run-init.o runinitlib.o
+@@ -24,9 +23,7 @@ KLIBCCFLAGS += -I$(srctree)/$(src)/..
+ # .o files used to built executables
+ static/run-init-y   := $(objs)
+ static/run-init-lib := ../lib.a
+-shared/run-init-y   := $(objs)
+-shared/run-init-lib := ../lib.a
+ 
+ # Cleaning
+-clean-dirs := static shared
++clean-dirs := static
+ 
+diff --git a/usr/utils/Kbuild b/usr/utils/Kbuild
+index 67d9486..1573363 100644
+--- a/usr/utils/Kbuild
++++ b/usr/utils/Kbuild
+@@ -7,7 +7,6 @@ progs += true false sleep ln mv nuke minips cat ls losetup
+ progs += uname halt kill readlink cpio sync dmesg
+ 
+ static-y := $(addprefix static/, $(progs))
+-shared-y := $(addprefix shared/, $(progs))
+ 
+ # The binary is placed in a subdir, so we need to tell kbuild this
+ static/chroot-y     := chroot.o
+@@ -62,13 +61,11 @@ static/losetup-y    := losetup.o
+ shared/losetup-y    := losetup.o
+ 
+ # Additionally linked targets
+-always := static/reboot static/poweroff shared/reboot shared/poweroff
++always := static/reboot static/poweroff
+ 
+ $(obj)/static/reboot $(obj)/static/poweroff: $(obj)/static/halt
+ 	$(call cmd,ln)
+-$(obj)/shared/reboot $(obj)/shared/poweroff: $(obj)/shared/halt
+-	$(call cmd,ln)
+ 
+ # Clean deletes the static and shared dir
+-clean-dirs := static shared
++clean-dirs := static
+ 
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb
index 35e17b2..1677863 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb
@@ -11,6 +11,8 @@ KLIBC_UTILS_PKGNAME = "klibc-static-utils"
 require klibc-utils.inc
 require klibc.inc
 
+SRC_URI += "file://0001-klibc-static-utils-do-not-build-shared-binaries.patch"
+
 # avoid textrel if linking with -pie
 SECURITY_CFLAGS = ""
 SECURITY_LDFLAGS = ""
-- 
2.7.4


