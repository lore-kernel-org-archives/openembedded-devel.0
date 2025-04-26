Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F33C369D9
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 11:56:51 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.7492.1745668604658148639
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Apr 2025 04:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fPbIWSVG;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2963dc379so462169966b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 04:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745668603; x=1746273403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjkX9DjCxpFTdt6jUu4rt75IlXA55KKHhmvVQZL7+gg=;
        b=fPbIWSVGK5/z/ZS5/G+8fpxNrwcnCujjzvFU/reG3WanyA9JPjw13DhJ91W5h+r8nJ
         IZwjulJKrrrojGf++BDrhoD1zY9yjPue8eYHMZYJecKj2RSFbWPLvvddcZT73QBhM053
         3bVU4XR4VY9TvK/p/9TaqiFZ4ih/Z0HKDouQUumI6Sd0rLhNWGk+L993lTmra9ep8hUT
         73uOe6vpRXdV1COB5SJQb5CMCj1A4PGtPKicJo0XRTKyn9Th4Vs+WGQ0F1Lfe/2QOT1p
         Jhz7O8TKQV9YAROdBFLzxC/IA+C8T1lQ5zwH1+6oaMaQ6lEhEYdyZSBS2T06HqILdvb8
         iVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745668603; x=1746273403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjkX9DjCxpFTdt6jUu4rt75IlXA55KKHhmvVQZL7+gg=;
        b=ULjDsvqCZAnxLXkvgIMu9y+3U4VdQTV0OS9T2tddmC/eMGR6DoYLp9X7aDmQeDdeJd
         TahmstcxZQCUNhStl0HmsHylA4KTHyhv5EECjd7ndhW0WeRys0sEXmJztCxJTQZJTjGB
         zxabQ8Sj/nFZNj/mPCDYUVQOrcmWzXW84jgof5h5phJQre7P48UY3et8iLGulKdsURt7
         DbJ89DNf4ICGap3hVpezYWwZLNumcYxPiGo62nxdo0SFtAInurygCnORQVLQQNhOt6Vu
         g3d50lrKfNZ6TGCKd430k4Gso9GZ7uMSvp1Z7oHJ9bIf9xwiT0KYpha84Xto7fdDCQWl
         604g==
X-Gm-Message-State: AOJu0YyDmG/6Qg3QyI1YXMLYlRVsbDpp+wgM9yPZf0uPcsQWXq/RetAF
	VkE14qUdAEBT7pKPYwyoa43DDe0UVVlt9oZJtqDKpCBxc3aPnDkK/hF2BTUz
X-Gm-Gg: ASbGncsWn4vp+pnZ8wHhUBCntVYxTwPNYb1uusqWCqVZwJ9iw7Fnm6KNYgKfuSsL+eO
	yHcAs/4+9W+M6/juQwgkrdGwkis8mC6MsCWn7CKhZpdK+hMYSi4XUQExusSH0XvvJfEPm2yBoVn
	78IA7RL02QB7SLaiJaWLd7RSDt3AxZrKMKdrhz1N1WgjA0D2hWh2UkIMpOAD5L+dD6Li42oRNLJ
	phVuIfSsT0JAzH+ke5kmGe1sKSi8MhG27qgf3S9yGtUvbx56VwKxouoGpv+zDnswzlvF3nBzMoX
	VHp/PrCaaN4kVGD0OUgsHGde4em0hOozKTblfmRE6RIxCYJAawAVeJEYWbjbjItOaMnQ2mRIsA=
	=
X-Google-Smtp-Source: AGHT+IEQ9wO247q83wACWofNsKrww0uwfOkM8UNeoRDK6IfgktPh/OoQ53/cIiNHLsD3XYyGStzcMw==
X-Received: by 2002:a17:907:97c9:b0:acb:ba0f:4b0f with SMTP id a640c23a62f3a-ace8493baadmr219775166b.31.1745668602843;
        Sat, 26 Apr 2025 04:56:42 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6e4e69efsm278152266b.46.2025.04.26.04.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:56:42 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 5/8] xfstests: upgrade to 2025.03.30 to fix build with gcc-15
Date: Sat, 26 Apr 2025 13:56:20 +0200
Message-ID: <20250426115623.2732743-5-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426115623.2732743-1-martin.jansa@gmail.com>
References: <20250426115623.2732743-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Apr 2025 11:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117146

From: Martin Jansa <martin.jansa@gmail.com>

* switched to gnu11 in:
  https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/commit/?id=77aab5c2bfc9135fde66c17286ca4be87b417f39

* add one more commit to unionmount-testsuite
  https://github.com/amir73il/unionmount-testsuite/commit/c6ab621ac19f2b96d34cd98f244e611750e2bb23

* fixes:
  http://errors.yoctoproject.org/Errors/Details/852985/

* add pkgconfig used since:
  https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/commit/?id=1ba4f6f4bcd2aaef18e9549da89c3f0976f3fd01
  to fix:
  http://errors.yoctoproject.org/Errors/Details/852995/

  configure:15434: error: possibly undefined macro: AC_DEFINE
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
  configure:15435: error: possibly undefined macro: AC_DEFINE_UNQUOTED

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...-detached_mounts_propagation-and-remove-sys-moun.patch | 8 ++++----
 .../{xfstests_2024.03.03.bb => xfstests_2025.03.30.bb}    | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2024.03.03.bb => xfstests_2025.03.30.bb} (92%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch
index e823297343..9fdf69ff46 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch
@@ -1,4 +1,4 @@
-From 79c4715a46b80653eb98b61731c094c85e969220 Mon Sep 17 00:00:00 2001
+From 340e708f79b824816aacfa74e330d8acdafc5129 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Aug 2022 13:33:05 -0700
 Subject: [PATCH] Drop detached_mounts_propagation and remove sys/mount.h from
@@ -17,15 +17,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index e7442487..970f087a 100644
+index 6ac72b36..5472ba66 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -33,7 +33,7 @@ LINUX_TARGETS = xfsctl bstat t_mtab getdevicesize preallo_rw_pattern_reader \
+@@ -34,7 +34,7 @@ LINUX_TARGETS = xfsctl bstat t_mtab getdevicesize preallo_rw_pattern_reader \
  	dio-invalidate-cache stat_test t_encrypted_d_revalidate \
  	attr_replace_test swapon mkswap t_attr_corruption t_open_tmpfiles \
  	fscrypt-crypt-util bulkstat_null_ocount splice-test chprojid_fail \
 -	detached_mounts_propagation ext4_resize t_readdir_3 splice2pipe \
 +	ext4_resize t_readdir_3 splice2pipe \
- 	uuid_ioctl t_snapshot_deleted_subvolume
+ 	uuid_ioctl t_snapshot_deleted_subvolume fiemap-fault min_dio_alignment
  
  EXTRA_EXECS = dmerror fill2attr fill2fs fill2fs_check scaleread.sh \
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2025.03.30.bb
similarity index 92%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2025.03.30.bb
index 86f5b29bf0..94d37c03a9 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2025.03.30.bb
@@ -2,11 +2,11 @@ SUMMARY = "File system QA test suite"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038"
 
-SRCREV = "088e5bd4cb6d7295612430a56ae84ff5c8f54730"
-SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
+SRCREV = "b59671d2b894040bd355ddbf1ff03285607de16f"
+SRCREV_unionmount = "c6ab621ac19f2b96d34cd98f244e611750e2bb23"
 SRCREV_FORMAT = "default_unionmount"
 
-SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master \
+SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;tag=v${PV} \
            git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite \
            file://0001-add-missing-FTW_-macros-when-not-available-in-libc.patch \
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
@@ -17,7 +17,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master \
 S = "${WORKDIR}/git"
 
 # brokensep because m4/package_globals.m4 calls ". ./VERSION" (and that's not the only issue)
-inherit autotools-brokensep useradd
+inherit autotools-brokensep useradd pkgconfig
 
 DEPENDS += "xfsprogs acl"
 RDEPENDS:${PN} += "\

