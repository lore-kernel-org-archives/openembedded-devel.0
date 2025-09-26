Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A32CAC5BE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:32 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.18524.1758896370591157300
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iWFIuEet;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62fca01f0d9so4185857a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896369; x=1759501169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8Qb2SA8akqMH8yneCA9wva7blPcpRBetYH9IcXw5sQ=;
        b=iWFIuEetFUETFYkp68EsWTn9hVIdYX4As2rLxsrCe9fFeyajG8b8mCQX6/h1LeqsVI
         u6nfNc4rYAd0JUQq6Q8Ebz2XBzjrbhVeYQnLhfrVc17iu3C4kBqckpqPBvbHbw5wZDZv
         IuxWSFe2IihlbXsGw+1hDWZwKTPderHM9uBVCPjaHTETdkvzGHO8DwEdgTGBDtR5ZFi5
         BvfX60gxInhwCUfZYYKgDpX6ptAKd7x9CsCGHjUpuSkU2cmqxFOCa7EwE86AgbzGI5PD
         23Jc3H12sgPYGPsBk1rOKUUl3TxYOa8MU7NVDUv08t+/HR+8STj5mswEEoGQ7T7BRLS9
         jqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896369; x=1759501169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8Qb2SA8akqMH8yneCA9wva7blPcpRBetYH9IcXw5sQ=;
        b=e5ub/+RlUQKq9GgVBxdRLWkoMmw2nyJD8Tq2aM57G2B1Gx6lqUy4MbvQ4AyYUDfVPL
         VfhqxVsuuN2AX2bOMgjhSFK5zzZqlympzFkWTpdhrzCHlb+M6LQ4H0j5vuxv1MZL88ir
         mtz0ktFvm/xryHzh4zSY0WM5M3MpDZrL4UezhMo6GM+lNrh0tqysHKSovr9IPn0PTpgu
         C9NAsyShF4V9gDpJupfXo/BuL1c+RDu+QfWtw6VRIGG29Y8v57A+qQaP5X8pfX66+DNv
         V92xVbDNKYEGd6OCTK1UTqGy8Jq+0MQ2KNdhs4pHDeFJ3HnDIXsZ/kX13JkHToicSKZL
         5LBA==
X-Gm-Message-State: AOJu0Yzk06gdhAPqvavOKHCgSfsjV3bA3KjrUTu8w+GHvGdWQrE9ThWm
	bDhmztzi7hF2edZR2cfZ1MasnE7xIDy7aLW0gxmRv5RAA7GVeDs/H4VfqOwCyw==
X-Gm-Gg: ASbGncsQm2UNXcDAcMYyjmihmP1/Tyz0VjFyw0+safcgRcruI7QDruGe7BQppyf2GL7
	VF3aWkuiGTKtX5xaJYUteXDy250Yk5Kx0mRNseUEaY7BQtw4ZBVXOP91jazFcoPQnG6Sq+83XMB
	H4ZubRqSqlzCDe9DkduMiMRNU21mBuoccDBwTFfjKM41RhFKdy+dG1uJHE3qrBVa/so8E71rBfm
	htwZvzQYXL2rROLrxgtSI5OculYVuMxraH3v3OMlW5QD3CSAvQeGjLOoPUKwnylY587uxkwq+xR
	BJIdcaGJQpJyC0XaFHS9vaxTifPe8KDxb9q75wEcyErpcBqFa9TcFaN/9Ls9aER1xY72A+0E3OL
	Hq1bmHcsHueRTv0EiehFc
X-Google-Smtp-Source: AGHT+IE21LQWG1wOB96gPfTQ+R5fOALoVh9uHCZt0/iF3dm8umj+yOF/6cAMhQat9dAGDiGZl6jW1g==
X-Received: by 2002:a05:6402:3458:b0:633:2031:6de3 with SMTP id 4fb4d7f45d1cf-6349f6d69b5mr5550010a12.0.1758896368759;
        Fri, 26 Sep 2025 07:19:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 07/20] pure-ftpd: upgrade 1.0.51 -> 1.0.52
Date: Fri, 26 Sep 2025 16:19:06 +0200
Message-ID: <20250926141919.2010846-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119916

From: Wang Mingyu <wangmy@fujitsu.com>

nostrip.patch
refreshed for 1.0.52

License-Update: Copyright year updated to 2024

Changelog:
==========
 - The QUIT command is now accepted during a transfer.
 - The server can be built with --with-minimal again.
 - Fixed an out of bounds read in the MLSD command.
 - Larger mmap()ed pages are used on aarch64.
 - Improved compatibility with HPUX
 - Improved OpenSSL API compatibility
 - Improved compatibility with OpenWall Linux
 - Improved compatibility with Netfilter

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fac6357f60463b80cfa2e348804a587f343481ff)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch      | 7 +++----
 .../pure-ftpd/{pure-ftpd_1.0.51.bb => pure-ftpd_1.0.52.bb} | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-daemons/pure-ftpd/{pure-ftpd_1.0.51.bb => pure-ftpd_1.0.52.bb} (81%)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
index 32d714f6f4..90244cf096 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/nostrip.patch
@@ -1,4 +1,4 @@
-From 79fd22c0def26eba130db98e312bb00fec32ac0a Mon Sep 17 00:00:00 2001
+From ed60c2ad3a7ed9762fcb6a304c7f60544606baef Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Tue, 4 Aug 2015 03:07:01 +0200
 Subject: [PATCH] Don't mess with CFLAGS and LDFLAGS when --with-minimal is
@@ -10,16 +10,15 @@ Upstream-Status: Inappropriate [config]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-
 ---
  configure.ac | 2 --
  1 file changed, 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 695ce68..0f28b55 100644
+index e578b2b..3874124 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -414,8 +414,6 @@ AC_ARG_WITH(minimal,
+@@ -415,8 +415,6 @@ AC_ARG_WITH(minimal,
      AC_DEFINE(NO_FTP_USERS)
      AC_DEFINE(WITHOUT_ASCII)    
      AC_DEFINE(BORING_MODE)
diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.51.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
similarity index 81%
rename from meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.51.bb
rename to meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
index 6f03f73db5..1ce3c468b7 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.51.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Pure-FTPd is a free (BSD license), secure, production-quality and
 HOMEPAGE = "http://www.pureftpd.org/project/pure-ftpd"
 SECTION = "net"
 LICENSE = "0BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=194bc994ad6bbd4ff5a021082fe52156"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5138d4a8a877b32de6a78cf7e9e99c25"
 
 DEPENDS = "libcap virtual/crypt"
 
@@ -11,7 +11,7 @@ SRC_URI = "http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${PV}.t
            file://0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch \
            file://nostrip.patch \
 "
-SRC_URI[sha256sum] = "4160f66b76615eea2397eac4ea3f0a146b7928207b79bc4cc2f99ad7b7bd9513"
+SRC_URI[sha256sum] = "1126f3a95856d08889ff89703cb1aa9ec9924d939d154e96904c920f05dc3c74"
 
 inherit autotools
 

