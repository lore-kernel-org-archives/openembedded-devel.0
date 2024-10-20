Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CA0D3C92A
	for <webhook@archiver.kernel.org>; Sun, 20 Oct 2024 15:08:51 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.26116.1729436929606498617
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Oct 2024 08:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FFLSIV+q;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7eab7622b61so2630202a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Oct 2024 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729436928; x=1730041728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XiDdyNhvzFUdd5ud36ekFEXFTLRQNHj9F/qRC9v5Wgs=;
        b=FFLSIV+qFdUPifx6y0V327KF3EQB681yQtxGtx8wk1MqQAYDTvsHqU2yfA35+SYnyO
         47otv/5niw9AbIPg5ZC44lORAFLkHOJhFzhyEQmHiyUBSNnN3+L+3OuZ8e6rk29WRRQZ
         D7DK5eg4ZZX1oCRgy/r/h0jV42H8kS2CvCntOVH4Y01C2qXsGARuSW6H6HxnP0xmlMto
         qKx0eLDWDA+sb/+dA7ewxF4XUkhTWs2AWQo67n8ElsGwae1oNNVFy0VUQwtkw1LrYgZv
         ewWnkm0HIFPlfg/dSqtSX0JD3oiX33jl7Xc9aoN/S9gzvgM5qEA+tYEmr7HPa+Ibg0xc
         TvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729436928; x=1730041728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XiDdyNhvzFUdd5ud36ekFEXFTLRQNHj9F/qRC9v5Wgs=;
        b=tithdnrJDzFt1HCYifXDoB3nBNvNdcXhX90ID3SRJkNPrLAkRN6VsIeg84Z4+n0+gs
         v8/M3tvjyU5pIZTgPiANs1qHi1MdKioB2qOEdwuhnF1uOFePDPJ6hdvD3+OMp5Qq8hVn
         6jmrH9zOromCPq4D0tiCKXL74+KQGkNL0n6k+e9ZDNul3sA/Jh1BYp8tY2lBgorxZ31D
         roVUqLp3HmfIGs0k/9KzHodM0dWHYntronFeziQe1CA+Nw53C8pibesknu2BD7KoNbSS
         7HMaw1XHIo9mM3B7/Y/FJBe0wCym4inEQXGK26Syz3K8WD8MqYcL5Zp1gF+T/1yPABPU
         uuAw==
X-Gm-Message-State: AOJu0YxPAp6lB5wyrAiqrDzVSOXahu7Ds+BTgBagnmd2L7X3I5JckfqR
	1cywvYuwDodfVfBSH/S/nikzSk7JiUJSGU6n/gzQouoA8NhFGLtA6JJIF/jJ
X-Google-Smtp-Source: AGHT+IHYfrJ77R9AUyvprCv5bCT+5ILT3gW2Yt7ul4fmqqDIZ7w36VlHt27jDqr36WjzgtItZx8u1w==
X-Received: by 2002:a17:90a:e649:b0:2e2:b8d7:4bd1 with SMTP id 98e67ed59e1d1-2e561a00d2bmr10939565a91.30.1729436928426;
        Sun, 20 Oct 2024 08:08:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::2fbb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad516275sm1609369a91.55.2024.10.20.08.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 08:08:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v3] snapper: add recipe
Date: Sun, 20 Oct 2024 08:08:43 -0700
Message-ID: <20241020150843.1068181-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Oct 2024 15:08:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113067

From: Markus Volk <f_l_k@t-online.de>

Snapper is a tool for Linux file system snapshot management. Apart from
the obvious creation and deletion of snapshots it can compare snapshots
and revert differences between them. In simple terms, this allows root
and non-root users to view older versions of files and revert changes.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: More fixes for musl

 ...x-types.h-for-__u16-__u32-__u64-type.patch | 30 ++++++++++++++
 ...002-Use-statvfs-instead-of-statvfs64.patch | 37 +++++++++++++++++
 .../recipes-support/snapper/snapper_0.11.2.bb | 41 +++++++++++++++++++
 3 files changed, 108 insertions(+)
 create mode 100644 meta-oe/recipes-support/snapper/snapper/0001-Include-linux-types.h-for-__u16-__u32-__u64-type.patch
 create mode 100644 meta-oe/recipes-support/snapper/snapper/0002-Use-statvfs-instead-of-statvfs64.patch
 create mode 100644 meta-oe/recipes-support/snapper/snapper_0.11.2.bb

diff --git a/meta-oe/recipes-support/snapper/snapper/0001-Include-linux-types.h-for-__u16-__u32-__u64-type.patch b/meta-oe/recipes-support/snapper/snapper/0001-Include-linux-types.h-for-__u16-__u32-__u64-type.patch
new file mode 100644
index 0000000000..ec8594629e
--- /dev/null
+++ b/meta-oe/recipes-support/snapper/snapper/0001-Include-linux-types.h-for-__u16-__u32-__u64-type.patch
@@ -0,0 +1,30 @@
+From d103eaeae169708ca567f092182a89b79e5ab9db Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Oct 2024 07:52:33 -0700
+Subject: [PATCH 1/2] Include linux/types.h for __u16/__u32/__u64 type
+
+This header is included indirectly with glibc but when using musl
+it ends up with compilation failure
+
+BcachefsUtils.cc:85:20: error: use of undeclared identifier '__u32'
+   85 |             args.dirfd = (__u32) fddst;
+      |                           ^
+
+Upstream-Status: Submitted [https://github.com/openSUSE/snapper/pull/945]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ snapper/BcachefsUtils.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/snapper/BcachefsUtils.cc b/snapper/BcachefsUtils.cc
+index e9163ffb..1d328a78 100644
+--- a/snapper/BcachefsUtils.cc
++++ b/snapper/BcachefsUtils.cc
+@@ -24,6 +24,7 @@
+ 
+ #include <cstring>
+ #include <cerrno>
++#include <linux/types.h>
+ #include <sys/stat.h>
+ #include <sys/ioctl.h>
+ 
diff --git a/meta-oe/recipes-support/snapper/snapper/0002-Use-statvfs-instead-of-statvfs64.patch b/meta-oe/recipes-support/snapper/snapper/0002-Use-statvfs-instead-of-statvfs64.patch
new file mode 100644
index 0000000000..b915fda257
--- /dev/null
+++ b/meta-oe/recipes-support/snapper/snapper/0002-Use-statvfs-instead-of-statvfs64.patch
@@ -0,0 +1,37 @@
+From 0b39f4484553c796cb300fb4933ea314e91d913b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Oct 2024 07:55:23 -0700
+Subject: [PATCH 2/2] Use statvfs instead of statvfs64
+
+when using LFS64 these functions are same and also
+on 64bit systems they are same. musl is using 64bit off_t
+by default and does not define LFS64 variants of these functions
+and it ends up in build errors
+
+Taken from Alpine Linux: [https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/testing/snapper/statvfs64.patch]
+
+Upstream-Status: Submitted [https://github.com/openSUSE/snapper/pull/945]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ snapper/FileUtils.cc | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/snapper/FileUtils.cc b/snapper/FileUtils.cc
+index d4034279..4c8578a1 100644
+--- a/snapper/FileUtils.cc
++++ b/snapper/FileUtils.cc
+@@ -387,9 +387,9 @@ namespace snapper
+     std::pair<unsigned long long, unsigned long long>
+     SDir::statvfs() const
+     {
+-	struct statvfs64 fsbuf;
+-	if (fstatvfs64(dirfd, &fsbuf) != 0)
+-	    SN_THROW(IOErrorException(sformat("statvfs64 failed path:%s errno:%d (%s)", base_path.c_str(),
++	struct statvfs fsbuf;
++	if (fstatvfs(dirfd, &fsbuf) != 0)
++	    SN_THROW(IOErrorException(sformat("statvfs failed path:%s errno:%d (%s)", base_path.c_str(),
+ 					      errno, stringerror(errno).c_str())));
+ 
+ 	// f_bavail is used (not f_bfree) since df seems to do the
diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
new file mode 100644
index 0000000000..840c607309
--- /dev/null
+++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Snapper is a tool for Linux file system snapshot management"
+HOMEPAGE = "https://github.com/openSUSE/snapper"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "acl boost btrfs-tools dbus e2fsprogs json-c libxml2 lvm2 ncurses zlib"
+
+# Build separation is slightly broken
+inherit autotools-brokensep pkgconfig gettext
+
+SRC_URI = " \
+    git://github.com/openSUSE/snapper.git;protocol=https;branch=master \
+    file://0001-Include-linux-types.h-for-__u16-__u32-__u64-type.patch \
+    file://0002-Use-statvfs-instead-of-statvfs64.patch \
+"
+SRCREV = "6c603565f36e9996d85045c8012cd04aba5f3708"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "--disable-zypp"
+
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'api-documentation systemd pam', d)}"
+PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd"
+PACKAGECONFIG[api-documentation] = "--enable-doc,--disable-doc,libxslt-native docbook-xsl-stylesheets-native"
+
+# Avoid HOSTTOOLS path in binaries
+export DIFFBIN = "${bindir}/diff"
+export RMBIN = "${bindir}/rm"
+export TOUCHBIN = "${bindir}/touch"
+export CPBIN = "${bindir}/cp"
+
+
+do_install:append() {
+	install -d ${D}${sysconfdir}/sysconfig
+	install -m0644 ${S}/data/default-config ${D}${sysconfdir}/sysconfig/snapper
+}
+
+FILES:${PN} += "${libdir}/pam_snapper ${libdir}/systemd ${libdir}/security ${datadir}"
+# bash is needed for the testsuite
+RDEPENDS:${PN} = "bash diffutils util-linux util-linux-mount"

