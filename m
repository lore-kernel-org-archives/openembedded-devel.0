Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D209CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 13:58:03 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.17532.1758635877531725769
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 06:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WRthmkyk;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62ecd3c21d3so8861838a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758635876; x=1759240676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vCllTDLKGX0Wzp8eBP+/l0/CZSmnxR4cF/hvFc92Ob8=;
        b=WRthmkykaTwaL63cgn3Z007l1bfZNNllMFVMGqyoEyMBLvxLsRmBRwIOq6QcESxuCd
         PPXLIuI5N6wosH56f7G+vlOyxiCw7SolT7B+M6q5bpcysF2KZjS7tLHJWLjl3ZT5R3nZ
         MBFAxHeGtr3VIdVqfOBvFQPYMrAcPnB1s14Zb+93OrTib7SKfmQ31zZ6ejdUs+RA48J0
         Rt29PQntxBgcm1OKgX2ARReTmee+1+Vl66pfasvB3I6Bd1aoSVeO6eCLiQy9arObLI46
         jVPtUBjHiIlagBf16LsPkQ7paMDF7Bh+wnA4SfyEeU3QZKqu3htzuE8hKDqFPnwnczVB
         hoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758635876; x=1759240676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vCllTDLKGX0Wzp8eBP+/l0/CZSmnxR4cF/hvFc92Ob8=;
        b=S4sHRGJv73ecx8bfxLdujooAd7lOmXIqei+pDg3JiHa6wAvCFpfyxfWA/HZHrnkB/F
         fm4GpElQjSZtySrpx1zDmbAlAAI5FERon2favOqiIzZ2Ek8Aq+5rGurEhUcmOXJOp6RR
         S8RCpTE6RnPuDblMaNCnJs11yen6CDERe9eDXdttosbcpmwCUYUjETuByLpCnyQA14UY
         naAq9gBVBbmOnbrLkJHsDy3tJtwdYnx8cdd7eV5oGb2lZkOhFcFL7VAQAv49UUMS4abA
         KOvVS8xGZbOP1Qk6PrZSyIf3YwX3bmVNYPoIfTkgjhIBGYBOk/BnU3Mh7DGyHDgMe94l
         BgxQ==
X-Gm-Message-State: AOJu0Yyql2x0rCL1RzFf2TwonIf9JB8BtZ6l573iIng2xeNyOfTaAX2g
	i1a3LRw4a0p9es+mW+SKxTUP/L5D2mao33Psj9hbSRf7L2NbRPLSj58TLso/gA==
X-Gm-Gg: ASbGncs6AVWHJ4Qpj5BzfwOARqpxIZqq7ttP3YO2yRHw1kcUUEu6Pd0I1U/VLGekzYf
	p+ksy3FFVNdvB2TzUlNHcrxL+Ep0cYP3b7mgGQ/1UkPSqbYxC9tkD199e7d9xkb1DTW9LK3qzgE
	WK6LCwLmaJEvBssZbHoapSLzQKlHgkFyGI42qhC9ZjOpNMT2C89NZAqETheX5lNQYpiTTlhOnVf
	H0FM9CkvurhE9VEVXDDDkaPfCT6yFXrD3q4BFMR7yfmeYPX6+rrzOZQIbDHeAwU+H+ajfeVJQ+5
	VN7uOv92FR+eojQFSc5okgJYnGiG5z1qdW6h29+C110mUWsSPKrXMx+r9XFLuDHRMiv92bV+NWO
	rrGqYwj/1bf59vS1XYK87VndA6yaWkFA=
X-Google-Smtp-Source: AGHT+IEuxAx5Yw5fKG2ggv4nD+FqwD4oWhFQayJNBxFhwCNaywg4zsoS1TTRNuomaUvFZUazL//ptQ==
X-Received: by 2002:a05:6402:3202:b0:62e:ed71:601a with SMTP id 4fb4d7f45d1cf-6346782c64dmr2387086a12.36.1758635875604;
        Tue, 23 Sep 2025 06:57:55 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5cfa6e7sm10663592a12.8.2025.09.23.06.57.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 06:57:55 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] fatresize: upgrade 1.1.0 -> 1.1.0-3
Date: Tue, 23 Sep 2025 15:57:54 +0200
Message-ID: <20250923135754.1086969-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 13:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119714

Drop a patch that has been incorporated in this release.

Shortlog:
d/control: Update maintainer email
Add changelog entry for previous commit
Apply wrap-and-sort -at
configure: Do not add -D_FILE_OFFSET_BITS to CFLAGS
Clarify changelog entry
releasing package fatresize version 1.1.0-2
Ignore debian/files
Bump debhelper from old 12 to 13.
Build-depend on pkgconf rather than pkg-config
releasing package fatresize version 1.1.0-3

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...not-add-D_FILE_OFFSET_BITS-to-CFLAGS.patch | 34 -------------------
 .../fatresize/fatresize_1.1.0.bb              |  8 ++---
 2 files changed, 4 insertions(+), 38 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/fatresize/fatresize/0001-configure-Do-not-add-D_FILE_OFFSET_BITS-to-CFLAGS.patch

diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize/0001-configure-Do-not-add-D_FILE_OFFSET_BITS-to-CFLAGS.patch b/meta-filesystems/recipes-utils/fatresize/fatresize/0001-configure-Do-not-add-D_FILE_OFFSET_BITS-to-CFLAGS.patch
deleted file mode 100644
index d0ecdcba4e..0000000000
--- a/meta-filesystems/recipes-utils/fatresize/fatresize/0001-configure-Do-not-add-D_FILE_OFFSET_BITS-to-CFLAGS.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 69647e5d393a52ed3892eccc172ee750d6aaa45d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 30 Dec 2022 21:08:25 -0800
-Subject: [PATCH] configure: Do not add -D_FILE_OFFSET_BITS to CFLAGS
-
-AC_SYS_LARGEFILE macro is in use and this will add a definition for
-_FILE_OFFSET_BITS in generated config.h which is already included as
-first include file in fatresize.c hence its not required to be added via
-CFLAGS, this also fixes a case when -D_FILE_OFFSET_BITS=64 is passed via
-CC from environment, where the autoconf macros set
-ac_cv_sys_file_offset_bits=no and that means we will have
--D_FILE_OFFSET_BITS=no added to CFLAGS which messes up builds.
-
-Upstream-Status: Submitted [https://salsa.debian.org/parted-team/fatresize/-/merge_requests/3]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index d6e6cb2..4dcec28 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -29,7 +29,6 @@ AC_CHECK_FUNCS([memset strtoll])
- 
- # Check for LFS
- AC_SYS_LARGEFILE
--CFLAGS="$CFLAGS -D_FILE_OFFSET_BITS=${ac_cv_sys_file_offset_bits}"
- 
- dnl libparted
- # hack
--- 
-2.39.0
-
diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
index 7f90bfd666..fc18b2cef8 100644
--- a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
+++ b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
@@ -3,12 +3,12 @@ SECTION = "console/tools"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https;branch=master \
+PV = "1.1.0-3"
+
+SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https;branch=master;tag=debian/${PV} \
            file://0001-build-Do-not-build-.sgml-file.patch \
-           file://0001-configure-Do-not-add-D_FILE_OFFSET_BITS-to-CFLAGS.patch \
           "
-SRCREV = "12da22087de2ec43f0fe5af1237389e94619c483"
-
+SRCREV = "7494fba0f14f706c17b9d89ae273efd113c944ca"
 
 DEPENDS = "parted"
 

