Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55A8D5AE41
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 08:54:08 +0000 (UTC)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2354.1765616041863148790
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Dec 2025 00:54:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dpN/3gv9;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-11b6bc976d6so2486891c88.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 00:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765616041; x=1766220841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fHu28AdUCN0Lj+FUYf1LqkGUPOQ4P4byOefBWwFvOAs=;
        b=dpN/3gv9vpPDEt9W04FVYK59y1+kkyEUZPOrssuFov8qZsANZIppdiHUMjeo6CwVAw
         KYz0M/PmOBH5eYDHuw+IvYY3GYHxALwpNqhfIsEuNQlvlD9EZ5QZXehKekrbQ1l7RA6k
         LgVvsdRM5sdKR4zLsRleqUDzFrZz8onHLnhIlejJq/IvHdJ5z26+JaXgNbmhoBLWSQ92
         4tyMzk+AKu+xeEALNpFUeKBQG8Lsv5jMJAKOCA08XnEUg/GMUDmfRf7wbm2K3K9Ewqm3
         UK/nwd8QhPmQODkgqP6KVHFnmdpI++5hcneWeYDAtx8XDaKQEo4Op2FousEf244C8BNa
         GUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765616041; x=1766220841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHu28AdUCN0Lj+FUYf1LqkGUPOQ4P4byOefBWwFvOAs=;
        b=Mpui5EYn6p/a+uYE0v3MgUe5yUwl4R0RAISMgN/5QXYmuTRVlkyJTq7DQ2Zf3Ma7y3
         QQhb8qriGfjIwpmLu/LnnX74c9Wyko+IK44YCtYHBK7CmMyxjUyfBKjVrFayDiNbb/S/
         YV6bKfCKfDDwgWNQhKJ3X8Lqdg7OfTTk1E6cna6E8ZVfbPKx/LacEH9b79CJ/+H0DkY5
         R1dsWdoqQ6AxANdXN17kpByNAQUrjkBuEv29OwU1gBXBJm+jJhctYcSMz1JmVicfwwzt
         0Tw4ra2h24csFdOkI1lx9FBV1/0eAFTdWyt51oRn/xlN5K6M+Z1GEhwZHkAPB5a1SiMr
         x9UQ==
X-Gm-Message-State: AOJu0YyB7PXaGPpo9QtcrK0/v9PLoOdzvDdQTntGPTx7Fxzl0a4Cl+j/
	JlRO6w9G2YlPli9FLwZ4jBpVWXB/nHDo4RwSiCLfJrU/PBmQFqmIwRdKXcaJzQHx
X-Gm-Gg: AY/fxX7mZbZRj2BxR8aweq8IbLK1DSQ7qS3RvxKwTgeZF8s03Ac8af4Tj1lx1cbKl+7
	3ckHDp1IKx9IZym/Rs8X5UiyzHMMxqH+OlBGiEIqNWdqAJ8ONA7njvlWvA+dZe/JXFfuwLVgZ36
	tx8Ha6ZskI/3/O0iqCPiB4qALFLOm+VCRTcKSF4X0Lf4A3Kg/2nMK15Y3xbekRfeIJbx1jsPAip
	3LtjS4uxuHQOWe6U8ZYNa2awNd6Xe86bwivMw/jq6g12xtVQf6rhtZDATPxuqZdg78Nk5sipsNY
	tdTHjzBiqmu6EMv8pfKp4JKfsH7y2uDguFoJkExqK6hlGNNB+on51HxaU/SFXWzTpU3Ocvv7cgf
	dMQi35AGETqkqjwYNeVOsotLlGaxIJf5f2LkmPwsvbx1BCSfMBv5NBSewYiDRmQ6ofTzj/eu+My
	9N+wO8crg9vKOi1t3PQPpWUNQ9nvCe6Ug1Ai/7rdmHPgcWkCwKV+SMLSPYD3hw5AkgG2YwFxCSA
	bpKNwLoXGE12kEbNsO1kBBI5Z9ZPhgC
X-Google-Smtp-Source: AGHT+IHIZ9rB8pTMosuOAeqHOkdlXkh53C5Y9hV8w2212aos6knG/gVb+iRSkCeQkHlOwbK43L2DwQ==
X-Received: by 2002:a05:7022:4406:b0:11e:3e9:3e94 with SMTP id a92af1059eb24-11f2edf902emr5559348c88.25.1765616040678;
        Sat, 13 Dec 2025 00:54:00 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b46f5sm24537579c88.5.2025.12.13.00.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 00:53:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [layers][PATCH 1/2] packagegroups: Remove packages not yet ported onto riscv32
Date: Sat, 13 Dec 2025 00:53:57 -0800
Message-ID: <20251213085358.958063-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 08:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122637

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packageconfigs/packagegroup-meta-filesystems.bb            | 2 ++
 .../recipes-core/packagegroups/packagegroup-meta-networking.bb | 2 ++
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb     | 3 ++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
index 40f851364d..3a4b87a206 100644
--- a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
+++ b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
@@ -33,6 +33,8 @@ RDEPENDS:packagegroup-meta-filesystems = "\
     sshfs-fuse \
 "

+RDEPENDS:packagegroup-meta-filesystems:remove:riscv32 = "smbnetfs"
+
 RDEPENDS:packagegroup-meta-filesystems-support = "\
     fuse3 \
     fuse \
diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 1fa95dcc8e..cc0445aaed 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -68,6 +68,7 @@ RDEPENDS:packagegroup-meta-networking-connectivity = "\
 "

 RDEPENDS:packagegroup-meta-networking-connectivity:remove:libc-musl = "rdist"
+RDEPENDS:packagegroup-meta-networking-connectivity:remove:riscv32 = "samba"

 RDEPENDS:packagegroup-meta-networking-daemons = "\
     atftp \
@@ -246,6 +247,7 @@ RDEPENDS:packagegroup-meta-networking-support = "\
 "
 RDEPENDS:packagegroup-meta-networking-support:remove:mipsarch = "memcached"
 RDEPENDS:packagegroup-meta-networking-support:remove:riscv64 = "memcached"
+RDEPENDS:packagegroup-meta-networking-support:remove:riscv32 = "memcached"
 RDEPENDS:packagegroup-meta-networking-support:remove:libc-musl = "ypbind-mt"

 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index d873a7b817..50b897181f 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -212,6 +212,7 @@ RDEPENDS:packagegroup-meta-oe-dbs = "\
     soci \
 "
 RDEPENDS:packagegroup-meta-oe-dbs:remove:libc-musl:powerpc = "rocksdb"
+RDEPENDS:packagegroup-meta-oe-dbs:remove:riscv32 = "influxdb"

 RDEPENDS:packagegroup-meta-oe-devtools = "\
     abseil-cpp \
@@ -311,7 +312,7 @@ RDEPENDS:packagegroup-meta-oe-devtools:remove:powerpc = "android-tools breakpad
 RDEPENDS:packagegroup-meta-oe-devtools:remove:powerpc64 = "android-tools breakpad lshw luajit ply uftrace"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:powerpc64le = "android-tools breakpad lshw luajit ply uftrace"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:riscv64 = "breakpad concurrencykit lshw ltrace luajit nodejs ply"
-RDEPENDS:packagegroup-meta-oe-devtools:remove:riscv32 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
+RDEPENDS:packagegroup-meta-oe-devtools:remove:riscv32 = "android-tools breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:libc-musl:riscv32 = "php"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:aarch64 = "concurrencykit"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:x86 = "ply"

