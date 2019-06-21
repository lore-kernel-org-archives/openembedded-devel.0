Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 06CE07E8CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 22:14:25 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id 16so7240577ljv.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 15:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AXU8Xm95xb22p5g4rQhy8T1Z4sp0H850aTkx+02Breo=;
	b=Ny1SXnjJHUlrGac2dePPMOxbhBoqN/7W6p4xSUFmWLnIHCidUAAsDSlakXEMmgKM4s
	N4UBD7Tsdb2TBXSwZOG8hGm9hqmDySRAbXxiM2JoeGZze+LfBpPnu03H9xVmtk9VEFkb
	Z5xgJLq291BCc1rHn4XwY7fiXBoCB/LiwfpVvDlfcuWW/VZSD7ti7Fqul9HjKR77SCrA
	hntwaqpphwWlboYH6/aCDEMsbfOvFF4i5+aIlIIQxDqdj51e3TmksjOu9GFd3ddxLUOW
	Xy/qqIKZP1ZKTShqt0r15cyHjfgNVEQfyZu/g8XxVxnXSH+UuHsEkXiMAti/H7Wmi4HX
	kksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AXU8Xm95xb22p5g4rQhy8T1Z4sp0H850aTkx+02Breo=;
	b=f76nvZkjjZgBKVQh3pb/HGKTpzd9kRaoaIlfsZIc+J8SUeUe9sQqDNei7tKrf3Lv6y
	rokTnaC3jtkrdB0vUpTN9y7Byvg9SIInB1hUqM8lKSDsbW54tvVJaQolNCnMPxU21p9J
	PdfwOPPcl2Je5N6b/iEabnrIPOtdK6MMefH2xIazvau0G+7O9jdSlMSQvATqGfKtfKf1
	kIHnvO3kZ/NPnCP1gFXDMmAAHmBt6WrwMNR3+aozp3+AaFzgyJ9RrPXudhd661FEohhs
	HLuKmd7LhqAip4cek0WkjcDVEPcA90YFOVCzdJxt7KXh5QIp/GpPP78LzGKJHgWoGYuY
	pVwQ==
X-Gm-Message-State: APjAAAW9WNCnO/QFLLqCK+maquVMK/E1ER0CdL7fdVWlzZuy198TZWLD
	ln/B4M7Yqz9N6cPSo9IVcxk4FRoteqg=
X-Google-Smtp-Source: APXvYqweM9Tkm1xnBPiOnN5uiYeB/H9zRMLh0oog03WRau5MnsIoylc7T8mB6zRJxR9jAh3nVQd/pQ==
X-Received: by 2002:a2e:b003:: with SMTP id y3mr40983569ljk.72.1561155266444; 
	Fri, 21 Jun 2019 15:14:26 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id 25sm554664ljv.40.2019.06.21.15.14.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 15:14:26 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jun 2019 00:14:22 +0200
Message-Id: <20190621221422.13592-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621221422.13592-1-open.source@oleksandr-kravchuk.com>
References: <20190621221422.13592-1-open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking 2/2] drbd: update to 9.0.18-1
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
X-List-Received-Date: Fri, 21 Jun 2019 22:14:26 -0000

Removed patch was upstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...fix-use-M-don-t-forget-addprefix-obj.patch | 79 -------------------
 .../{drbd_9.0.17-1.bb => drbd_9.0.18-1.bb}    |  5 +-
 2 files changed, 2 insertions(+), 82 deletions(-)
 delete mode 100644 meta-networking/recipes-support/drbd/drbd/0001-drbd-kbuild-fix-use-M-don-t-forget-addprefix-obj.patch
 rename meta-networking/recipes-support/drbd/{drbd_9.0.17-1.bb => drbd_9.0.18-1.bb} (77%)

diff --git a/meta-networking/recipes-support/drbd/drbd/0001-drbd-kbuild-fix-use-M-don-t-forget-addprefix-obj.patch b/meta-networking/recipes-support/drbd/drbd/0001-drbd-kbuild-fix-use-M-don-t-forget-addprefix-obj.patch
deleted file mode 100644
index fbf94d513..000000000
--- a/meta-networking/recipes-support/drbd/drbd/0001-drbd-kbuild-fix-use-M-don-t-forget-addprefix-obj.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-Upstream-Status: Backport [https://github.com/LINBIT/drbd-9.0/commit/46e8e3f]
-
-Backport patch to fix compile errors:
-
-|   LD [M]  /home/kkang/buildarea/Yocto/build/tmp/work/qemux86_64-poky-linux/drbd/9.0.17-1-r0/drbd-9.0.17-1/drbd/drbd.o
-| x86_64-poky-linux-ld.bfd: cannot find .../tmp/work/qemux86_64-poky-linux/drbd/9.0.17-1-r0/drbd-9.0.17-1/drbd/drbd_bitmap.o: No such file or directory
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 46e8e3fc31b651fb56ea38134dcf14382fc43000 Mon Sep 17 00:00:00 2001
-From: Lars Ellenberg <lars.ellenberg@linbit.com>
-Date: Wed, 3 Apr 2019 10:57:46 +0200
-Subject: [PATCH] drbd: kbuild fix: use M=; don't forget addprefix $(obj)
-
-Kernel build started to warn about using SUBDIRS instead of M,
-and we don't support "very old" kernels anymore anyways.
-
-Our list of dependencies for drbd_buildtag.c needs to depend on the
-actual files $(obj)/*.o resulting from the build,
-not on just the list of *.o names.
-
-This apparently also fixes a build failure in opensuse build service for
-tumbleweed when using make-4.2.1-7.5 against kernel 5.0.5-something.
----
- drbd/Kbuild   | 11 +++++------
- drbd/Makefile |  4 +---
- 2 files changed, 6 insertions(+), 9 deletions(-)
-
-diff --git a/drbd/Kbuild b/drbd/Kbuild
-index 285f7a81..99228029 100644
---- a/drbd/Kbuild
-+++ b/drbd/Kbuild
-@@ -1,4 +1,5 @@
--obj-m := drbd.o drbd_transport_tcp.o
-+obj-m += drbd.o drbd_transport_tcp.o
-+# obj-$(CONFIG_BLK_DEV_DRBD)     += drbd.o drbd_transport_tcp.o
- 
- clean-files := compat.h $(wildcard .config.$(KERNELVERSION).timestamp)
- 
-@@ -56,10 +57,8 @@ ifndef DISABLE_KREF_DEBUGGING_HERE
-       drbd-y += kref_debug.o drbd_kref_debug.o
- endif
- 
--$(patsubst %,$(obj)/%,$(drbd-y)): $(obj)/compat.h
--$(patsubst %,$(obj)/%,drbd_transport_tcp.o): $(obj)/compat.h
--
--obj-$(CONFIG_BLK_DEV_DRBD)     += drbd.o
-+$(addprefix $(obj)/,$(drbd-y)): $(obj)/compat.h
-+$(obj)/drbd_transport_tcp.o: $(obj)/compat.h
- 
- # ======================================================================
- 
-@@ -124,7 +123,7 @@ endif
- # and not in e.g. dash. I'm too lazy to fix it to be compatible.
- SHELL=/bin/bash
- 
--$(obj)/drbd_buildtag.c: $(filter-out drbd_buildtag.o,$(drbd-y))
-+$(obj)/drbd_buildtag.c: $(addprefix $(obj)/,$(filter-out drbd_buildtag.o,$(drbd-y)))
- 	@$(kecho) '  GEN     $@ $(echo-why)'
- 	@set -e; exec > $@.new;							\
- 	echo -e "/* automatically generated. DO NOT EDIT. */";			\
-diff --git a/drbd/Makefile b/drbd/Makefile
-index 5f768fc6..f9e8792a 100644
---- a/drbd/Makefile
-+++ b/drbd/Makefile
-@@ -102,9 +102,7 @@ else
- 
-   kbuild:
- 	@rm -f .drbd_kernelrelease*
--    # previous to 2.6.6 (suse: 2.6.5-dunno), this should be:
--	$(MAKE) -C $(KDIR)  $(if $(O),O=$(O),) SUBDIRS=$(DRBDSRC) $(ARCH_UM) modules
--# $(MAKE) -C $(KDIR) M=$(DRBDSRC) $(ARCH_UM) modules
-+	$(MAKE) -C $(KDIR)  $(if $(O),O=$(O),) M=$(DRBDSRC) $(ARCH_UM) modules
- 	-mv .drbd_kernelrelease.new .drbd_kernelrelease
- 	@echo -n "Memorizing module configuration ... "
- 	@config=$$( (for x in $(KDIR)/.config $(O)/.config ; do \
--- 
-2.20.0
-
diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.17-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.18-1.bb
similarity index 77%
rename from meta-networking/recipes-support/drbd/drbd_9.0.17-1.bb
rename to meta-networking/recipes-support/drbd/drbd_9.0.18-1.bb
index 1eada269c..6fb621a1f 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.17-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.18-1.bb
@@ -10,11 +10,10 @@ DEPENDS = "virtual/kernel"
 
 SRC_URI = "http://www.linbit.com/downloads/drbd/9.0/drbd-${PV}.tar.gz \
            file://check_existence_of_modules_before_installing.patch \
-           file://0001-drbd-kbuild-fix-use-M-don-t-forget-addprefix-obj.patch \
            "
 
-SRC_URI[md5sum] = "ae8d5030760b2820a4b3e250447890a0"
-SRC_URI[sha256sum] = "86dd6cc0fdc8123056a3bb67a634cd7ba62a7b05b23caab9995cce7730891da8"
+SRC_URI[md5sum] = "f2e6eaa92861252af0b564f0100f1859"
+SRC_URI[sha256sum] = "d6b4188ed01d8555c78b04b5e31532d5990ca98bf063230f3e949ee8a7338d58"
 
 inherit module
 
-- 
2.17.1


