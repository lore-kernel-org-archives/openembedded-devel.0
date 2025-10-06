Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F90CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 16:59:59 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.817.1759769997950554291
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 09:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eYVxx8iZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so7736182a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 09:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759769996; x=1760374796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MnGZJHNHsLZZC+uNmLsIQdmbVidBgLoU3RQQa6gI+2Y=;
        b=eYVxx8iZbEJ+i07+HTuvuemXn6fEXKYL/Azlwhi3cCRljZY9+5BWy1W6316bJ6aZXT
         ZDC/W27blvMDN65I7s2OGAEK/TfUTXbdMpyXS+zNN5NdGwSJeUWbMEhUTaZyL5IDKZwA
         O383NGQgl5TawaLKjlC7Fm2kWtQq7vHdAgkdEsQeILrD85dwbVJ8Pq0S6ChXOt7Qkgzd
         jjffr32ej/drKjFev88kjFvo/0zcinsoMkXs3GbFr5Sw15T6GuxgbbcOP5rKAsM7PUjp
         r2k676bcnPqjw0gUe6UsxI3bvdlbQWKGbvS27o1e8eUzS6H5nJJhB/q3p4n6iKgkAUd+
         XGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769996; x=1760374796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnGZJHNHsLZZC+uNmLsIQdmbVidBgLoU3RQQa6gI+2Y=;
        b=ufNTmvnNjWbDwusyaixoEifPtDTEgOPRHUqKxtGJfNG2QDYVFQY+3cqWtdq5sLzDtP
         217m1WqhDbvaZR54IGR9N+BfMsMThD+e0GfEIBQctykyCJXINW+mJi+yqAWB12bFiGl6
         MhVjB12Pvh/Ab97j0Znr8t5vg6C9dsMvjGvSP/TqBO9kA6fGFu7xZW67CHcEMj7xU7YA
         82USqwzpd1jtdluKwAkPhchbGeos6kcVGPhDLp4ZqDYJHaik05CPuhMYLlNigaXlnati
         MklIx27kJ40Yr2mXV7xCY1M5SycXrNBQxQkmKXKkaZ4wFnBD/ch5jfFCRLr2oypREQnp
         SDGA==
X-Gm-Message-State: AOJu0Yw6HFYUu48DOOMYy4UJTz3Zsd3QcsJ/Ah2KoY3DCKW9kB77kCcK
	85y8aGBYyRXqYsy9XZi47UguJvdfGv5WcHPuCHdOzQUkxNxMIsoRydmhk5BZhw==
X-Gm-Gg: ASbGncsYV+bgYTClrK/RbCzJL6vPn7Y3mWytMEcad1NNdI1N/s90gHGoiVNBh1gMvcr
	nsbciPM7hWx8l7oMQ/vrCUCGUlMUzREQpReXD3mpKc7+F/K2dKJznmV9aRSuiTj3nh9RjOssZsW
	vmYQgs4bBZjee2ZJ93QNVPhBZty425kD8R2b+POh2wmr1O7v/Q/tiDT6PR9w6Z53rnJLCCihqe2
	jqRKnsQScJlrXw304VO7WZWuDYYYfiC9E5tFOLV2tVLU4th9uXg0gJWWhSIaQyJ17s4yddin8M8
	N73eGfX+mpsjdcoKdkrppaoHYo7J8D5c12U/7yI+koNgAA5jEWiM+fo0ioiPGnGFghvKJUnD5ec
	mqchctZEZzlXcsIoxAPqb34mXxM6vT5A0IO6kRRuujGw4
X-Google-Smtp-Source: AGHT+IERPvAWcm+V04dBkYwtJFaNxPBc85Vqe1zzqZDelACsMOvz1UmIyrkv3apu5lW65xO6C0jbgw==
X-Received: by 2002:a05:6402:1e91:b0:639:710b:6957 with SMTP id 4fb4d7f45d1cf-639710b6bb8mr10349125a12.27.1759769995962;
        Mon, 06 Oct 2025 09:59:55 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788110de2sm10617866a12.35.2025.10.06.09.59.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:59:55 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] hdf5: upgrade 1.14.4-3 -> 1.14.6
Date: Mon,  6 Oct 2025 18:59:54 +0200
Message-ID: <20251006165954.472656-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 16:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120304

This upgrade contains fixes for the following vulnerabilities:
CVE-2025-2912, CVE-2025-2913, CVE-2025-2914, CVE-2025-2915, CVE-2025-2923,
CVE-2025-2924, CVE-2025-2925, CVE-2025-2926, CVE-2025-6269, CVE-2025-6270,
CVE-2025-6516

Changelog: https://github.com/HDFGroup/hdf5/blob/hdf5_1_14_6/release_docs/RELEASE.txt

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../hdf5/files/0001-cmake-remove-build-flags.patch          | 6 +++---
 .../hdf5/{hdf5_1.14.4-3.bb => hdf5_1.14.6.bb}               | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/hdf5/{hdf5_1.14.4-3.bb => hdf5_1.14.6.bb} (91%)

diff --git a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
index 0d016ccb4c..77e77d88f6 100644
--- a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
+++ b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
@@ -10,13 +10,13 @@ Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- config/cmake/libhdf5.settings.cmake.in | 18 +++++++++---------
+ src/libhdf5.settings.cmake.in | 18 +++++++++---------
  1 file changed, 9 insertions(+), 9 deletions(-)
 
 diff --git a/config/cmake/libhdf5.settings.cmake.in b/config/cmake/libhdf5.settings.cmake.in
 index deb07ed..6f255c4 100644
---- a/config/cmake/libhdf5.settings.cmake.in
-+++ b/config/cmake/libhdf5.settings.cmake.in
+--- a/src/libhdf5.settings.cmake.in
++++ b/src/libhdf5.settings.cmake.in
 @@ -23,23 +23,23 @@ Linking Options:
  ----------------
                        Libraries: @BUILD_NAME_EXT@
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
similarity index 91%
rename from meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
rename to meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
index edaf5710e1..974007a3e9 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
@@ -12,11 +12,11 @@ inherit cmake siteinfo qemu multilib_header multilib_script
 DEPENDS += "qemu-native zlib"
 
 SRC_URI = " \
-    https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.14/hdf5-1.14.4/src/${BPN}-${PV}.tar.gz \
+    https://support.hdfgroup.org/releases/hdf5/v1_14/v1_14_6/downloads/${BPN}-${PV}.tar.gz \
     file://0002-Remove-suffix-shared-from-shared-library-name.patch \
     file://0001-cmake-remove-build-flags.patch \
 "
-SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
+SRC_URI[sha256sum] = "e4defbac30f50d64e1556374aa49e574417c9e72c6b1de7a4ff88c4b1bea6e9b"
 
 FILES:${PN} += "${libdir}/libhdf5.settings ${datadir}/*"
 

