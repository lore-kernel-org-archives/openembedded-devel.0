Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.680.1794421091327239199
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 10:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0PT2DfNQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37071c0f42aso5898675eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 10:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421091; x=1795025891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJrROAvnU4qZBnJAJ9E4aNnDeWjSBRpP8sduqLKTZOw=;
        b=0PT2DfNQUGx7CtvJa65MzR67vnn3qD9mh+KrBe5q8mhNbsKOYrzxWXfmGjWYKg4PPT
         hanlSzJNUnTtB8P/2Pnv6ebx6L1b6TyKVp51O6kips6ajGFYkxhc+2F5TBTQYKTsSwvT
         nmSdeCJh/xgEAmeB3RRNkOoo5jB2Q0BkXDQ1hH7VSq8KFpxfaYDNlN6dn/6RNEyYqw28
         zEIgeHj/Kw//DGai5EFrYxqh9u3wil5Ed/I2ZQf/domeEFs0LDucrGPWMQd5Ra5SZ+Oy
         Qu6GH65zlHyF1FB/krN5dOV5lBuQrEoTNGFmN4aX0pA9h15HH5zKNREhRfVpKPxvWWlH
         Svkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421091; x=1795025891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJrROAvnU4qZBnJAJ9E4aNnDeWjSBRpP8sduqLKTZOw=;
        b=CeSgCCF6HCM7niSO7LtSkkghiSYNjGdIa6hOtl2fMo35zVe+KpQAUc+VRUo4KP5SBB
         BML8BqlerC4X1wYwp8ZJInERhYt88MHm52kt5Zu3Oi3cFUyqguup7ZuUf8oftrTpO1Uy
         PCKPYRIaN0sXAE4IpVMMzhMkU09xurEJ+YrorI0abLLukdckkzglX7DfGZnyLD6sZVzE
         ScBtgShnuwW8YNErJ5RtMbrSK+AqPXFqf3wzYwHfQIsroIGbVNdlzk8VZIslAhEy3qF+
         xGVAHcDwgbLTuQGRBfo9pqMtxrdj5PqedGXyx/gvPBsizdaUNZzqHOPn5ymQKcye/qwy
         /ZmA==
X-Gm-Message-State: APuU4Z/JN+Jy0iizPOULpxncblV6NvAWLxkln451/a/GxC/kOyFnsqoB
	7Wsz/TxvzanqSo1wf7bzbbLUKY89ePyrtp2rcgINulye1obFpefnsL9NdjMBYsy4KT0=
X-Gm-Gg: AYBFou3yP+NKzjq9vCoBGrcgxl2tRXxErsCdn7WbkkkKCFSI8lhvV34mUld0a0B7EMN
	TZF9GdpJll8UW+K2GevhPDIF39ZxZc83v3W+p4sADTpbx+/Q/lxX3xekcRXFygrRGhCLgZgK1ge
	YrOhOCdYtCa2EZ1cVXc6yBpBZFdpLuB8R9NtK+OrvETRyds4gUIvV3c6Qgragte247wPuZSpPI7
	RLfCukNnZObUSBm+1sUFvJHgkVl9f4ODE7eAT3z310k9PQ4ugjnthnraAKWA0MGAhypPPSAgQYT
	xWmsT/4M6ureMMAsUJYy+yUzcBEnj0s58R+kC0K1HZLVWD5GVPECdM3xltSy8XbubnUoakphkPK
	TrQtwrp0OxM26cuddVhsCzHi3DXoAPLAblLM8M08tT0RI7g+4JHvDE7XlNrMvgQf3l1Z602UK8u
	VdPkGAEAuOrJj/h2q1Cq2ybDeferCGI8Ox66AsGHoKxNnZNsXvntN9QYuTghxserFB59994KWkq
	jy+UFOiB2RvxhXc9UTEPhxzq+nPyeBFzKK+/uN8zF9TcXm3JsRs/n9EUFqqZZVXRi9JfCWKEf1z
	/i/bS7trSLKwpy3FD8FcfD7kXH7Ut1uTt5TLO9VogyOD3J5mI5daCV5ZQ8fxhoi8Q/1MWqEVJQT
	CeVKzSib3ss4u1D09gWMGzhH3Vy4jkgtsPuWSpgjBakYydVPOJoQhWolihg5PueQyPJXjiXXoba
	WjzL+4wVW1BXprO6pG5jR97FVqhWsX3YJ1KpJtshAAZLFpDAMmzoLpKyScyknl6QN5QWs6g09mq
	KrIrD2I6nis9+vfb/6ifN7l4vTryZFExbdts5fM/cHCBCRtn7C8xqRDOjkDX0c810GI+KvwtJe+
	CmQ5
X-Received: by 2002:a05:7301:904:b0:375:7be3:1bbd with SMTP id 5a478bee46e88-37686278c60mr3436119eec.23.1794421090421;
        Wed, 11 Nov 2026 10:18:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060c4b6sm18363976eec.15.2026.11.11.10.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:18:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] libhugetlbfs: Fix linking tests with lld
Date: Wed, 11 Nov 2026 10:18:07 -0800
Message-ID: <20261111181807.2376884-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 18:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132132
Content-Type: text/plain; charset="utf-8"

ld.hugetlbfs runs $LD as the real linker and adds the GNU ld only
-Ttext-segment option for --hugetlbfs-align links on arm/aarch64, i386 and
ppc64. Now that LD is ld.lld this fails with

  ld.lld: error: -Ttext-segment is not supported. Use --image-base if you intend to set the base address

Teach ld.hugetlbfs to use --image-base when the linker is LLD.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ld.hugetlbfs-Use-image-base-with-LLD.patch | 57 +++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_2.24.bb         |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0016-ld.hugetlbfs-Use-image-base-with-LLD.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0016-ld.hugetlbfs-Use-image-base-with-LLD.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0016-ld.hugetlbfs-Use-image-base-with-LLD.patch
new file mode 100644
index 0000000000..01e8702a13
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0016-ld.hugetlbfs-Use-image-base-with-LLD.patch
@@ -0,0 +1,57 @@
+From 49b8283544ae5c897f4cf186e174f98a9dc6e1c6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 11 Nov 2026 07:56:45 -0800
+Subject: [PATCH] ld.hugetlbfs: Use --image-base with LLD
+
+LLD does not implement the GNU ld -Ttext-segment option and errors out:
+
+  ld.lld: error: -Ttext-segment is not supported. Use --image-base if you intend to set the base address
+
+which breaks linking the --hugetlbfs-align testcases when LD is lld. Detect
+LLD and pass the equivalent --image-base instead. LLD reads the value with
+base auto-detection, so emit the address with a 0x prefix, which GNU ld also
+accepts.
+
+Upstream-Status: Submitted [https://github.com/libhugetlbfs/libhugetlbfs/pull/118]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ ld.hugetlbfs | 16 +++++++++++-----
+ 1 file changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/ld.hugetlbfs b/ld.hugetlbfs
+index d4a6306..11db0cf 100755
+--- a/ld.hugetlbfs
++++ b/ld.hugetlbfs
+@@ -126,6 +126,12 @@ armelf*_linux_eabi|aarch64elf*|aarch64linux*)
+ 	SLICE_SIZE=$HPAGE_SIZE ;;
+ esac
+
++# LLD does not implement -Ttext-segment, --image-base is its equivalent
++TEXTSEG="-Ttext-segment="
++if ${LD} --version 2>/dev/null | grep -q "^LLD"; then
++	TEXTSEG="--image-base="
++fi
++
+ if [ "$HTLB_ALIGN" == "slice" ]; then
+ 	HTLBOPTS="-zcommon-page-size=$SLICE_SIZE -zmax-page-size=$SLICE_SIZE"
+ 	HTLBOPTS="$HTLBOPTS -lhugetlbfs"
+@@ -134,13 +140,13 @@ if [ "$HTLB_ALIGN" == "slice" ]; then
+ 	# otherwise it will be NULL.
+ 	case "$EMU" in
+ 	armelf*_linux_eabi|aarch64elf*|aarch64linux*)
+-		printf -v TEXTADDR "%x" "$SLICE_SIZE"
+-		HTLBOPTS="$HTLBOPTS -Ttext-segment=$TEXTADDR" ;;
+-	elf_i386)		HTLBOPTS="$HTLBOPTS -Ttext-segment=0x08000000" ;;
++		printf -v TEXTADDR "0x%x" "$SLICE_SIZE"
++		HTLBOPTS="$HTLBOPTS ${TEXTSEG}$TEXTADDR" ;;
++	elf_i386)		HTLBOPTS="$HTLBOPTS ${TEXTSEG}0x08000000" ;;
+ 	elf64ppc|elf64lppc)
+ 		if [ "$MMU_TYPE" == "Hash" ] ; then
+-			printf -v TEXTADDR "%x" "$SLICE_SIZE"
+-			HTLBOPTS="$HTLBOPTS -Ttext-segment=$TEXTADDR"
++			printf -v TEXTADDR "0x%x" "$SLICE_SIZE"
++			HTLBOPTS="$HTLBOPTS ${TEXTSEG}$TEXTADDR"
+ 		fi ;;
+ 	esac
+ fi
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
index dd2fbbc7cd..f1a68afb9d 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
@@ -26,6 +26,7 @@ SRC_URI = " \
     file://0013-elflink.c-include-libgen.h-for-basename.patch \
     file://0014-tests-Add-ldflags-to-linker-commandline-for-libheaps.patch \
     file://0015-support-reproducible-builds.patch \
+    file://0016-ld.hugetlbfs-Use-image-base-with-LLD.patch \
 "

 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
