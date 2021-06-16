Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.295.1623866380663978264
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 10:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bOuvIrpy;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id w31so2627545pga.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jun 2021 10:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BhEzjEucB+L/pPp/LU/z3CBjLBo61xNOV9tmU7zf+sY=;
        b=bOuvIrpyCTQiVaovsN7Ia8ovX7qzrLmypyn+KW59N3xLQxLlikd5zPys6nq96whWsd
         x6HOamVGsxUqQwuChOySlIlhcYovttrBY4UYnBl4aKRByL9Ry8LqLZy89y3yG+fEm52O
         SCG+m/v9mIs7QK8Let7lz5sP0ZeheJu5IQXnjxm4VEifYACS4q1EyouhpOzrRYYJHFea
         Ph1b06s9JcnHasA4TWm8qougXpAExVWDD22e4SwjUFYyEEiDRVbWv8XDcmV6vSjx75sN
         oVatwoEQOk8DljNWRyFMpK0hYCck6EhES+bGwdCGK1bCGLFh9YEwolKsE7j0YLOthMgJ
         bMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BhEzjEucB+L/pPp/LU/z3CBjLBo61xNOV9tmU7zf+sY=;
        b=ZulKeRXbwe6A1UPsYbF1WrrP5r9bknnVcgAKbKkQnz8K9wgzlFX19qr6dEaSd/1OzQ
         TwcapAM+Qg4dbPHmPkM8rqxAWj/BYwdww7s7ODQG8z4GF6oOThSNYa6VLeSG1/h/8Eou
         QkrJ+MFqGwcAjs9Nic4V4UOMma5nGSAuYUPOv/96G8bOuC/cdlKJEudDK10genIOvBiT
         VNAUxyID703nrjLSWI7Twmq+ynwpj3L6jLAM2/ELHKJnoTs3l7I624KlxpxU1XNkqakh
         ryrifOAexo7GNqZX5FqJXXBVxr3jSAOKopryA/dus4c+8nhzQDLXzT3zW+T71D4DWctT
         3RuA==
X-Gm-Message-State: AOAM533pvhXvPh2g09KeRzxY5zp7WwIjDxfjQCmzyldM6ez8+dLEQhmO
	KkoDQ1RsgB3Mfp1PZ5wIz/vxtJB+HNCUCg==
X-Google-Smtp-Source: ABdhPJwXLcNzy2SObOP7oLFae1KkLC0/K36XKoveRRh+UtmKjzWD/+yfxtOs0t46j9PXPxqWk9+0ow==
X-Received: by 2002:a63:5a4b:: with SMTP id k11mr773277pgm.289.1623866379735;
        Wed, 16 Jun 2021 10:59:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id y7sm2872982pfy.153.2021.06.16.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:59:39 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/9] libpfm4: Upgrade to 4.11.0
Date: Wed, 16 Jun 2021 10:59:29 -0700
Message-Id: <20210616175937.323664-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a patch to fix compiler error with latest clang compiler

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ..._examples-Remove-unused-sum-variable.patch | 44 +++++++++++++++++++
 .../{libpfm4_4.10.1.bb => libpfm4_4.11.0.bb}  |  6 +--
 2 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/libpfm/libpfm4/0002-perf_examples-Remove-unused-sum-variable.patch
 rename meta-oe/recipes-kernel/libpfm/{libpfm4_4.10.1.bb => libpfm4_4.11.0.bb} (87%)

diff --git a/meta-oe/recipes-kernel/libpfm/libpfm4/0002-perf_examples-Remove-unused-sum-variable.patch b/meta-oe/recipes-kernel/libpfm/libpfm4/0002-perf_examples-Remove-unused-sum-variable.patch
new file mode 100644
index 0000000000..e85ca96fc3
--- /dev/null
+++ b/meta-oe/recipes-kernel/libpfm/libpfm4/0002-perf_examples-Remove-unused-sum-variable.patch
@@ -0,0 +1,44 @@
+From 0b2f611a95f3c93454453892bbe021ad2815925d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Jun 2021 17:35:26 -0700
+Subject: [PATCH] perf_examples: Remove unused 'sum' variable
+
+Fixes
+self_smpl_multi.c:144:19: error: variable 'sum' set but not used [-Werror,-Wunused-but-set-variable]
+        unsigned long x, sum;
+                         ^
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ perf_examples/self_smpl_multi.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/perf_examples/self_smpl_multi.c b/perf_examples/self_smpl_multi.c
+index 391fa61..75b45e0 100644
+--- a/perf_examples/self_smpl_multi.c
++++ b/perf_examples/self_smpl_multi.c
+@@ -141,7 +141,7 @@ void
+ do_cycles(void)
+ {
+ 	struct timeval start, last, now;
+-	unsigned long x, sum;
++	unsigned long x;
+ 
+ 	gettimeofday(&start, NULL);
+ 	last = start;
+@@ -150,15 +150,12 @@ do_cycles(void)
+ 	iter[myid] = 0;
+ 
+ 	do {
+-
+-		sum = 1;
+ 		for (x = 1; x < 250000; x++) {
+ 			/* signal pending to private queue because of
+ 			 * pthread_kill(), i.e., tkill()
+ 			 */
+ 			if ((x % 5000) == 0)
+ 				pthread_kill(pthread_self(), SIGUSR1);
+-			sum += x;
+ 		}
+ 		iter[myid]++;
+ 
diff --git a/meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb b/meta-oe/recipes-kernel/libpfm/libpfm4_4.11.0.bb
similarity index 87%
rename from meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb
rename to meta-oe/recipes-kernel/libpfm/libpfm4_4.11.0.bb
index ff56d48043..da7d3a49ea 100644
--- a/meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb
+++ b/meta-oe/recipes-kernel/libpfm/libpfm4_4.11.0.bb
@@ -14,9 +14,9 @@ COMPATIBLE_HOST = "powerpc64"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/perfmon2/${BPN}/libpfm-${PV}.tar.gz \
            file://0001-Include-poll.h-instead-of-sys-poll.h.patch \
-          "
-SRC_URI[md5sum] = "d8f66cb9bfa7e1434434e0de6409db5b"
-SRC_URI[sha256sum] = "c61c575378b5c17ccfc5806761e4038828610de76e2e34fac9f7fa73ba844b49"
+           file://0002-perf_examples-Remove-unused-sum-variable.patch \
+           "
+SRC_URI[sha256sum] = "5da5f8872bde14b3634c9688d980f68bda28b510268723cc12973eedbab9fecc"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/perfmon2/files/libpfm4/"
 
-- 
2.32.0

