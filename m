Return-Path: <kelefa.sane@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4C0C369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 11:58:42 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.48092.1744631921519139614
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Apr 2025 04:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vpDzQyMm;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: kelefa.sane@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so34228595e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 04:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744631919; x=1745236719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/YCq5iyHwchMgDIrNXJKeavA7ShIUVFPeRMFimi9K0o=;
        b=vpDzQyMmUzoWSTOSq2ZtEwgcLf5xaPnf3/gsOLHT0Jr6zOOZ4a8jAhRq5d1Esgd43x
         yhwsnC1oNH1bhSFSo93C3H3A3mwdQXeaKilAoSBH0D0uYnkM2owb4Vw+Nyner+yPQPM6
         QbUKI2+vgpHHkx/h1ghgSSBE4j2JOXdF61gGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744631919; x=1745236719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/YCq5iyHwchMgDIrNXJKeavA7ShIUVFPeRMFimi9K0o=;
        b=tDdv7GZyfl/EHipTAoQSBm/d4OqqupYd65pnmOLBgzTSDwGcX4JRhbanjaQm6tXHsa
         +wDkwzsWvLgCzO29i0VaHW/irqhFz5XB3Kw1vnNlLJb5eJD1F/AgkIcE4eLYLnQWxueC
         eaBmYUIjg5z/0g0bWdIQ3rCgT0XWoKwtIxETligfcSyo8W3Kr8HMwmQVMHyVQ/CKf1wK
         BG3VL0WgD42UGgx/q9dDkGnCD+1hEmlS+gI6CNyPhEMHJjB8uD8xIsE4ZIe6Y4PdtU8i
         LybhU0ifkyaLHCvhWpcOiM+1shM+7JVGvs+DYfJ8aHgExOt4K33dpsVMdWzgpAX0rKJI
         6QBQ==
X-Gm-Message-State: AOJu0YxSNIWi/U8NAPDQwPD7u+ZVGtA2xA0cQDr/IOEdyuRaGy/UMDJx
	AEQBfcFRZ8Mhz71Yi3QGBFnxmfhr8HQuy6+91hU6BtOJEdcGfCACC6UrLcqBBSZHy9HyNudfSzA
	g
X-Gm-Gg: ASbGncu9YPz06P1Zdws3SNmA+e6WRcXPpw8YoHu5PPwDmupcPn+ADVRmeFQgLix4+4S
	BINjLEudHgrq6PbnI0cKJCs9NiIfrQx7lh4OxRkos1EOxMv+NKg1LDHJCpWFD5H/RQmmcPWyI97
	nag+IXbcpkhBZcp8qhwcNwy5mWTAsOiSupBiyBW8KaRl9FFtazPHBFfYI++E6UoyEaHTes8uGKi
	L2ltrI4My17CtMK2gMT5rxEiWXSbk+AM2Z6lWfR4d59P8xXH5/oAFzGXkzl/CibZD/VJYliBSMZ
	mR4BLgCAt8Ehro4Ll1S/Tp6YkRxuZlLVC3Y1Rw2NkbpG/4Wh9P59FuLot6XkmkWRVrA/qP1pMN7
	/+exNGGs5eMonFIDOKmWzRe+7Z5GURsxB4XKwsBYqYRAE0MHDhuFLeh8c3J4PVBM=
X-Google-Smtp-Source: AGHT+IFKgDQo6v8DbM38KjVT+7qAZeGl+to2q8tlAAmWnVx/hU2MNwc/fINMHcddM7o8gZWhHMkdLg==
X-Received: by 2002:a05:600c:3b9f:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-43f3a94de29mr106471775e9.14.1744631919400;
        Mon, 14 Apr 2025 04:58:39 -0700 (PDT)
Received: from FRSMI24-OUB.daviel.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20b6f6c1sm86695635e9.3.2025.04.14.04.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:58:39 -0700 (PDT)
From: kelefa.sane@smile.fr
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>
Subject: [meta-oe][PATCH] multipath-tool: Fix reproducibility issue on libdmmp docs/man pages
Date: Mon, 14 Apr 2025 13:58:36 +0200
Message-ID: <20250414115836.13712-1-kelefa.sane@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 11:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116851

From: Kéléfa Sané <kelefa.sane@smile.fr>

Reproducibility test reveal different timestamp values in docs/man
pages. The root cause is due to the makefile target rule which update
the timestamp not always beeing executed, depending on the order, the
target (dmmp_strerror.3) and prerequisite (libdmmp.h) are written on the
disk during the clone of the repo.

Update recipe to set the KBUILD_BUILD_TIMESTAMP to reproducible
timestamp (SOURCE_DATE_EPOCH).

Signed-off-by: Kéléfa Sané <kelefa.sane@smile.fr>
---
 ...ile-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch | 29 +++++++++++++
 ...-Add-target-docs-man-dmmp_strerror.3.patch | 41 +++++++++++++++++++
 .../multipath-tools/multipath-tools_0.11.1.bb |  3 ++
 3 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0013-libdmmp-Makefile-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0014-libdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0013-libdmmp-Makefile-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch b/meta-oe/recipes-support/multipath-tools/files/0013-libdmmp-Makefile-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch
new file mode 100644
index 000000000..4cca7decb
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0013-libdmmp-Makefile-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch
@@ -0,0 +1,29 @@
+From bcb052a8dadbd0a837986b1e15924b469fc59edc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>
+Date: Thu, 3 Apr 2025 10:08:49 +0200
+Subject: [PATCH] libdmmp/Makefile: Fix KBUILD_BUILD_TIMESTAMP usage
+
+Add missing $ (Makefile need to escape '$' as '$$')
+
+Upstream-Status: Submitted [https://lore.kernel.org/dm-devel/20250404122902.2750036-1-sofiane.hamam@smile.fr/]
+
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
+Signed-off-by: Kelefa Sane <kelefa.sane@smile.fr>
+---
+ libdmmp/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libdmmp/Makefile b/libdmmp/Makefile
+index 172ba045..7e0e2509 100644
+--- a/libdmmp/Makefile
++++ b/libdmmp/Makefile
+@@ -74,7 +74,7 @@ doc: docs/man/dmmp_strerror.3
+ docs/man/dmmp_strerror.3:	$(HEADERS)
+ 	$(Q)TEMPFILE=$(shell mktemp); \
+ 	cat $^ | perl docs/doc-preclean.pl >$$TEMPFILE; \
+-	[ "$KBUILD_BUILD_TIMESTAMP" ] || \
++	[ "$$KBUILD_BUILD_TIMESTAMP" ] || \
+ 	    KBUILD_BUILD_TIMESTAMP=`git log -n1 --pretty=%cd --date=iso -- $^`; \
+ 	export KBUILD_BUILD_TIMESTAMP; \
+ 	LC_ALL=C \
diff --git a/meta-oe/recipes-support/multipath-tools/files/0014-libdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch b/meta-oe/recipes-support/multipath-tools/files/0014-libdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch
new file mode 100644
index 000000000..aad46c229
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0014-libdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch
@@ -0,0 +1,41 @@
+From 6e231d887c20b2139db75e6dc6c20107273aaacd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>
+Date: Thu, 3 Apr 2025 10:25:30 +0200
+Subject: [PATCH] libdmmp/Makefile: Add target docs/man/dmmp_strerror.3 to
+ .PHONY list
+
+When cloning git repos, depending on the order of written to the disk, target
+docs/man/dmmp_strerror.3 is more recent that the prerequisite
+libdmmp/libdmmp.h this leads to a non reproducible behavior:
+Sometimes, the timestamps are updated in the man pages, sometimes not.
+
+Upstream-Status: Denied
+
+https://lore.kernel.org/dm-devel/72355f1d0984647e91f8c50f1c2295071af49e33.camel@suse.com/
+The patch has been rejected by upstream, who will update the timestamps of the 
+manpages with a new commit.
+In order to be reproducible without having a random result, forcing the target
+rebuild by adding it to .PHONY is the more acceptable solution, the alternative
+would have been to use the make -B option which consider all target has
+obsolete and rebuild them all, which is less efficient.
+
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
+Signed-off-by: Kelefa Sane <kelefa.sane@smile.fr>
+---
+ libdmmp/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libdmmp/Makefile b/libdmmp/Makefile
+index 7e0e2509..187bcb8c 100644
+--- a/libdmmp/Makefile
++++ b/libdmmp/Makefile
+@@ -20,7 +20,7 @@ CFLAGS += $(LIB_CFLAGS) -fvisibility=hidden
+ LIBDEPS += $(shell $(PKG_CONFIG) --libs json-c) -L$(mpathcmddir) -lmpathcmd -lpthread
+ 
+ all: $(LIBS) doc
+-.PHONY:	doc clean install uninstall check speed_test dep_clean
++.PHONY:	doc clean install uninstall check speed_test dep_clean docs/man/dmmp_strerror.3
+ 
+ $(LIBS): $(OBJS)
+ 	$(Q)$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ -o $@ $(OBJS) $(LIBDEPS)
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
index 3037d0da8..3443175d2 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
@@ -45,6 +45,8 @@ SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=st
            file://0011-fix-bug-of-do_compile-and-do_install.patch \
            file://0012-add-explicit-dependency-on-libraries.patch \
            file://0001-libmpathutils-uxsock.c-Include-string.h-for-memcpy.patch \
+           file://0013-libdmmp-Makefile-Fix-KBUILD_BUILD_TIMESTAMP-usage.patch \
+           file://0014-libdmmp-Makefile-Add-target-docs-man-dmmp_strerror.3.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ec28527f3d544b51ceb0e1907d0bf3f"
@@ -83,6 +85,7 @@ EXTRA_OEMAKE = 'MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} \
                 modulesloaddir=${sysconfdir}/modules-load.d \
                 tmpfilesdir=${sysconfdir}/tmpfiles.d \
                 ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "SYSTEMD=216", "", d)} \
+                KBUILD_BUILD_TIMESTAMP="$(date -u -d "@$SOURCE_DATE_EPOCH" +"%Y-%m-%d %H:%M:%S +0000")" \
                '
 
 do_install() {

