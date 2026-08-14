Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D4AC5DF76
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:45:57 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24346.1786747556112393800
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GNrKpqy6;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso857603a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747555; x=1787352355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDCrQSkAqfoYUbgu33i2ASGOQ42RB3pG/fnCJb5EVBo=;
        b=GNrKpqy6qWHLTXqRMruZ0bp0bS2AIfo9VTW5IaC9RT4OOFPA+IzAEcufqOorc4s9NB
         hqxbsnPuL1teTo0ii6vPkI57dKqr0oUMhJ3xSrzfEErmOshpgbeZdrIh8SqY+iid8Y8s
         0ETGO+QxbsxoUx1uKLIjdW4fuvvmQcwMPjtT/bSQFXulKJGYtm0fNnLxOpiDUm3y8TqC
         PJa0PnDoWgQNIwmQSrQnnLzDAhkWntWF3M85Y69e5eGyFTUdPmDybZjmi+ahO8f07eSx
         0KaWx7w8ON1+Kx42Ev5YLyBbFxspkqqw6MEdE+mdh8cihMf8oRJKMKpQy+1zqUiOI44S
         5tPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747555; x=1787352355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jDCrQSkAqfoYUbgu33i2ASGOQ42RB3pG/fnCJb5EVBo=;
        b=lYzoN6jgYPv08NZ0Ma96DcAA0RVDog29lgA2Zc4erBwWz1xd5p3tWAWDH1ELi0+aOs
         wSP6Xsyh3DPQBB2MHLzUDUCpxI7jOAerDrcm1MoiYqy6ScOq29gyPpSnx4ejoa/qcSIV
         g1K6BOJyNRykAbKvAx17Vcbp0YwuyzJGKy/lPGrAU3UhC2lYImE/5hsmvGXEywupwXbr
         HtZd4FS8GKPvjkZRDtPLYnONfUfljn2tsDVzBJlr1mt9poiqolKOVc/J9POjUtKCdv/P
         nrXfyz9dlLlHApoj9Wc/99nsGzYI3so4tanln/ZggxXKUoM7eX+UpSVLZHRquQ0gqIKo
         DRbQ==
X-Gm-Message-State: AOJu0YzvDMjtuKJDrz9HDHrNhe+y5yi2Uo+xekM1jE0cDQaggr8ZATn4
	W+TcagL2xnmmLGhbs7kJNCev+Z5/8sVkQoEG93uQg+aK53Gf1hDHz/ZuTAQQQWyb
X-Gm-Gg: AR+sD11jrKWAD9a4hjYJ+Z8ZirGD+fUBIqLoDXUa0KAV2lIoDls9wWwuBBAIXpqVOGF
	Jsjv7Rxs7wN3ouEQiWgYaj0zoPqB+5IQ8LS6fMBpjb1TPK4QnaonvqhHwoWe3Bbsd5/xPyr7m6P
	TyNc0r9FyrUzfC3sgRs5yIs2k3aYna7smHyfGEQvSYoo/m/DAesaU5PVJnJUJ4TWZs+t3VB17Df
	N2gljwtNc9sQfwOrhibTvCuUVRA9tI9/v5c2fkWgCvDhFXM+8AUWvQAShL4QYFWdqb3Bp0g28VU
	MoefYl7ezZ3dDNWVb4n9TxrpvZ98ayXxrIrjzpoorLqIPR+NKqgCy2xkJX2yECO7FWtrE7+qu6/
	90GZsq6UpqW6+EZd/kcQ3MS2Re7MnbaPYdiCiKTHsl5dxXzagwcFn4e5osBWYG80EgTUAsAhyw2
	+9tXuzYzC6/TUPIYhGxpZOF/8QQX04HwPvPtaa0i7x0kgp8iof/bF3LUxDVU0g+Q4IlHaNSjhzE
	HwIREQEiMgQFUVchDhFfC3/bthg+IyWApdVZMWHYPk00SYcLSXm+xZ9nT3vWvhanwoyPAMKifDt
	L3WoskLNsqIuwEVsi/N/rQJPpejvl0ASL4UdAhE9KBmzLPD7RQ9DZOo4WL8FkS+Jng1GCXf3rAQ
	ks9if2nSQDsIxrm0ld1doG1VFb9Ixj8uQwQnyqcm0d7VS+PT8u9s=
X-Received: by 2002:a05:6a21:4cca:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3cc71a256bfmr11129720637.13.1786747555193;
        Fri, 14 Aug 2026 15:45:55 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:45:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 011/109] toybox: upgrade 0.8.13 -> 0.8.14
Date: Fri, 14 Aug 2026 15:43:57 -0700
Message-ID: <20260814224539.1523174-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:45:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129075

Upstream reworked the build plumbing in this release: most of the kconfig
machinery moved out of kconfig/Makefile into scripts/genconfig.sh and
scripts/kconfig.c, and the defconfig/allyesconfig/allnoconfig/randconfig
targets are now thin wrappers around genconfig.sh. As part of that
cleanup (commit 228cb983) the rules that build the host-side kconfig
frontends lost their $(HOSTCC) and were hardcoded to "cc", which breaks
cross builds where only an explicit HOSTCC is exported and no "cc" is on
PATH. Add a patch restoring $(HOSTCC) there; the rest of the recipe needs
no changes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...HOSTCC-to-build-the-config-frontends.patch | 44 +++++++++++++++++++
 .../{toybox_0.8.13.bb => toybox_0.8.14.bb}    |  6 ++-
 2 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-core/toybox/toybox/0001-kconfig-use-HOSTCC-to-build-the-config-frontends.patch
 rename meta-oe/recipes-core/toybox/{toybox_0.8.13.bb => toybox_0.8.14.bb} (95%)

diff --git a/meta-oe/recipes-core/toybox/toybox/0001-kconfig-use-HOSTCC-to-build-the-config-frontends.patch b/meta-oe/recipes-core/toybox/toybox/0001-kconfig-use-HOSTCC-to-build-the-config-frontends.patch
new file mode 100644
index 0000000000..7d909dd3d2
--- /dev/null
+++ b/meta-oe/recipes-core/toybox/toybox/0001-kconfig-use-HOSTCC-to-build-the-config-frontends.patch
@@ -0,0 +1,44 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 4 Aug 2026 00:00:00 -0700
+Subject: [PATCH] kconfig: use HOSTCC to build the config frontends
+
+Commit 228cb983 ("Simplify build dependencies, shrink Makefile, move more
+config plumbing over to new stuff") replaced $(HOSTCC) with a hardcoded
+"cc" in the rules that build kconfig/conf and kconfig/mconf.
+
+These are build-host programs, so they have to be compiled with the host
+compiler the build system provides. When cross compiling in an
+environment that only exports an explicit HOSTCC (and has no "cc" in
+PATH), "make oldconfig" fails with:
+
+  cc -o kconfig/conf kconfig/conf.c kconfig/zconf.tab.c ...
+  make: cc: No such file or directory
+  make: *** [kconfig/Makefile:43: kconfig/conf] Error 127
+
+The top level Makefile already exports HOSTCC, and scripts/portability.sh
+uses $HOSTCC for the other host-side helpers, so honour it here too.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+diff --git a/kconfig/Makefile b/kconfig/Makefile
+index 1331434..842d6a2 100644
+--- a/kconfig/Makefile
++++ b/kconfig/Makefile
+@@ -35,12 +35,12 @@ SHIPPED = kconfig/zconf.tab.c kconfig/lex.zconf.c kconfig/zconf.hash.c
+ gen_config.h: .config
+ 
+ kconfig/mconf: $(SHIPPED)
+-	cc -o $@ kconfig/mconf.c kconfig/zconf.tab.c \
++	$(HOSTCC) -o $@ kconfig/mconf.c kconfig/zconf.tab.c \
+ 		kconfig/lxdialog/*.c -lcurses -DCURSES_LOC="<ncurses.h>" \
+ 		-DKBUILD_NO_NLS=1 -DPROJECT_NAME=\"$(KCONFIG_PROJECT)\"
+ 
+ kconfig/conf: $(SHIPPED)
+-	cc -o $@ kconfig/conf.c kconfig/zconf.tab.c -DKBUILD_NO_NLS=1 \
++	$(HOSTCC) -o $@ kconfig/conf.c kconfig/zconf.tab.c -DKBUILD_NO_NLS=1 \
+ 		-DPROJECT_NAME=\"$(KCONFIG_PROJECT)\"
+ 
+ clean::
diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.13.bb b/meta-oe/recipes-core/toybox/toybox_0.8.14.bb
similarity index 95%
rename from meta-oe/recipes-core/toybox/toybox_0.8.13.bb
rename to meta-oe/recipes-core/toybox/toybox_0.8.14.bb
index 6a5a155ba5..80ad89d4e7 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.13.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.14.bb
@@ -7,8 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 
 inherit cml1 update-alternatives
 
-SRC_URI = "https://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "9d4c124d7d731a2db399f6278baa2b42c2e3511f610c6ad30cc3f1a52581334b"
+SRC_URI = "https://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
+           file://0001-kconfig-use-HOSTCC-to-build-the-config-frontends.patch \
+           "
+SRC_URI[sha256sum] = "827e4cdfd69f5da973e00e2a59b30b3c9857fb7fae74c362fd0b4f96be7929b0"
 
 SECTION = "base"
 

