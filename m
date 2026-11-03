Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13030.1793717615135795085
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 06:53:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=I1Pyl7Fm;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so36375815e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 06:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793717613; x=1794322413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+G4FaipDcfkIMy2+9llwoLNlOQ0uiyaIYQfEA2p1Aw=;
        b=I1Pyl7FmdfE/+P10CWLYHKfhkWJXjep98NWaWWTLynfBbawcgwIkuE8qXYDv6qC9fc
         r67fgRK1TasJe3gmOAEjULMR16ZooBm2Nya+wxV1+IKXV7VUE38mXus1YzWMrH/7k4UI
         NqTUZGoat4GmpARDaZ3iEsiNy6ELYSd8cIoRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717613; x=1794322413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+G4FaipDcfkIMy2+9llwoLNlOQ0uiyaIYQfEA2p1Aw=;
        b=p/jOSTsDfINPuRj9muyg3LhgpjHx8SeDAsNUpOUswq5unk7G8/xyLVQrEd+iGoj8t3
         Q9A5j/jhuXrYyKDjAgEXgFWWYZDXKqiT0X88bxrNqTcIybWAweYb5E5qY1iu3QAktdV4
         Furb0S3+DnPMs3RBJV+syBgkkofTjUa78mImaSfUhNGHpMErtogZEtZWbCvrcKRc9vxC
         ksbsROdGCCVQJlOutHv1wuisgJHTqaKWKqRAXEOV7Af11m7seqBjo/t93VL2N5Ni5p9t
         mylcGYV4KnsBOsA+fEgGvSsJizlP1QH5WgwTRS9j6CO418ugokaPrL65Ti2Ee1XUoLh8
         xpVQ==
X-Gm-Message-State: APuU4Z8XLxdoyrhTB0eOSwPTaCA9y1vi8Zw0dz7NCGC4mXqztMCYvCCF
	oXGYZq6Nwk9oeWxofyjn0WavnssXm4RVKxPdUGCf5phVEHxUYmLn7+Ar6Ha7HyYsNozcvDiI1ls
	2v/10
X-Gm-Gg: AYBFou0QgRfnefskHiXLk5YtZnYPuvcZRTzuKjOiUrFs6DlqXEEtojc20AlYsXkZ4jC
	VEfnKQqmj8jcQ5aPuMngVUq3tP5yXgFo4w4iCAxHoMywJEaVtCfpcvUxVfwIzJxyM5GbLCd1o9w
	uh5W3qTbDLbJCFiq8mDOV+g3x29yBQVnpZa+89P2IOickZqEOVkD8OUsXOoMpq7WkBqmQTAzWdt
	aLlbxt1Jmt3HwRctAbGjuUP602Ez9zlfVgHy/I7NCppDkHw0VMKcBn1DzWkvGs5QcWyggFh5eUb
	Va4vLWM36WTzS1Qno6XvQ2ILww9V5TefDvB+51fv7JIMBx0yJQon/wgZGo7vWT4JwKijx4mAIHi
	A7HrRIdv5j1ifbxSwi0MbZd4fyfF7DZLw3L+ZBorKKZSXHaLoFoQpoCoo+RM2zpmZnz59LAQ4F8
	itJDRY7IEM7sZJdC555CPXPHqu2Xuof0NGmmXp0ZAQBdFCwdmkkVcd/aw8vAxOKd6LNeU5x9Jcm
	SQagbkt0exLceZBLf7MBmMICAFtkcav2DlHzPQfiI+KpHJ8bcvJSiEsJnQuHKTcCF9EUVcndFKZ
	uu6LK/f9w0IJPJecpWtpCG5lynAOCnefmbp4lBxLpNbf2fjErJ2SYHseTraaQV2LKFezDRo1dcn
	5Yz5br57J7iNKTQXJzHBV9sZkqaYFbkubdhJDg5lIwOhr/i+30lcN0g==
X-Received: by 2002:a05:600c:6099:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4ac185bc1d2mr284294735e9.26.1793717613321;
        Tue, 03 Nov 2026 06:53:33 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm94336685e9.15.2026.11.03.06.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:53:31 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-filesystems][PATCH 1/3] xfsprogs: Upgrade 7.2.0 -> 7.2.1
Date: Tue,  3 Nov 2026 16:53:26 +0200
Message-ID: <20261103145328.1973965-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 14:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131791
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.2.1:

- xfs_healer: fail earlier on non-xfs filesystems
- xfs_healer: correct xfd_ API usage
- man: fix alignment of the rtstart field in ioctl_xfs_fsgeometry.2
- xfs_quota: fix XFS_GETQSTAT parameter pointer
- mkfs: allow disabling quota flags
- xfs_scrub: terminate systemd services if the sysadmin unmounts
- man/xfs_rtgroup_geometry: add rg_writepointer field description
- xfs_io: report rg_writepointer in report rg_info()

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-include-xfs-linux.h-after-sys-mman.h.patch |  2 +-
 ...-Use-AC_SYS_LARGERFILE-autoconf-macro.patch |  4 ++--
 ...3-doc-man-support-reproducible-builds.patch |  2 +-
 .../files/remove_flags_from_build_flags.patch  | 18 +++++++++++++-----
 .../{xfsprogs_7.2.0.bb => xfsprogs_7.2.1.bb}   |  2 +-
 5 files changed, 18 insertions(+), 10 deletions(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_7.2.0.bb => xfsprogs_7.2.1.bb} (96%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0001-include-include-xfs-linux.h-after-sys-mman.h.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0001-include-include-xfs-linux.h-after-sys-mman.h.patch
index d9aa309607..d12cfb0f23 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/0001-include-include-xfs-linux.h-after-sys-mman.h.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0001-include-include-xfs-linux.h-after-sys-mman.h.patch
@@ -1,4 +1,4 @@
-From 04a4272a36f6b2a1ad30a10fcf36a4a1c68a5449 Mon Sep 17 00:00:00 2001
+From c5094241f03db82d045d3e49d866344376f5dc35 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 23 Aug 2018 05:33:57 +0000
 Subject: [PATCH] include include/xfs/linux.h after <sys/mman.h>
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0002-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0002-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch
index d62ad022c3..89fb64f568 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/0002-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0002-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch
@@ -1,4 +1,4 @@
-From 471bbf39f6b9104d39f0b9c8d4a64328dd5ae58e Mon Sep 17 00:00:00 2001
+From cc533b0399eda7c8800e32284124ec918beeed29 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 21 Dec 2022 17:40:11 -0800
 Subject: [PATCH] configure: Use AC_SYS_LARGERFILE autoconf macro
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index a8b8f7d..f8caa73 100644
+index 7825b1f..d5dc4ff 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -18,6 +18,9 @@ AC_PROG_INSTALL
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0003-doc-man-support-reproducible-builds.patch b/meta-filesystems/recipes-utils/xfsprogs/files/0003-doc-man-support-reproducible-builds.patch
index fed3f3451a..276a5718e3 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/0003-doc-man-support-reproducible-builds.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/0003-doc-man-support-reproducible-builds.patch
@@ -1,4 +1,4 @@
-From a2d78f6716157d6e1e94d9864e351887d74d0b30 Mon Sep 17 00:00:00 2001
+From 94997f2d7bf759664c8dec517798b0aed06aadf1 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@eng.windriver.com>
 Date: Tue, 18 Nov 2025 01:04:27 -0800
 Subject: [PATCH] doc/man: support reproducible builds
diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch b/meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch
index 9ea2a4f188..fb7eb9ef3e 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/remove_flags_from_build_flags.patch
@@ -1,10 +1,18 @@
+From 4e8c159d08421060827f9f6c034456632c21b292 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Sep 2017 19:15:50 -0700
+Subject: [PATCH] xfsprogs: Upgrade to 4.12.0
+
 Upstream-Status: Pending
+---
+ include/builddefs.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: xfsprogs-6.18.0/include/builddefs.in
-===================================================================
---- xfsprogs-6.18.0.orig/include/builddefs.in
-+++ xfsprogs-6.18.0/include/builddefs.in
-@@ -180,7 +180,7 @@ SANITIZER_CXXFLAGS = $(SANITIZER_CFLAGS)
+diff --git a/include/builddefs.in b/include/builddefs.in
+index acdbc5c..d968474 100644
+--- a/include/builddefs.in
++++ b/include/builddefs.in
+@@ -197,7 +197,7 @@ SANITIZER_CXXFLAGS = $(SANITIZER_CFLAGS)
  GCXXFLAGS = $(GCFLAGS)
  PCXXFLAGS = $(PCFLAGS)
  
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.2.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.2.1.bb
similarity index 96%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.2.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.2.1.bb
index 64f0da8ebf..9c4602d450 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.2.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_7.2.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0003-doc-man-support-reproducible-builds.patch \
            "
 
-SRC_URI[sha256sum] = "501dfa363cd8e19997a4a1a71f70ded88241b45e9db233e8875c23b80520cc83"
+SRC_URI[sha256sum] = "c45f5fd81fdebcdae61938fcfdff86c9960b39fc89a06df633730d93876cd27d"
 
 inherit autotools-brokensep pkgconfig
 
-- 
2.47.3

