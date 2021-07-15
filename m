Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.1030.1626368453907949338
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 10:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CBCHKoWu;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id y4so6040335pfi.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jul 2021 10:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mVvXZ83iYyLs8LnTIxox2kYr6+WOQkcohmnzTxGDgAw=;
        b=CBCHKoWudq9tJ/TuZOzWExwzty4vAHkXRrdQKkG32v1S9EW/1GVhh0tY7CPrFAiocV
         7EC5Ms9wMzISx3aD5FE86KKxB2BKlePrhmRg7DPYVkeAknXaUIFJn/kTP5ltdpOlDybG
         NBFogmCIukAxFcTAu3EtmDsChm7ORMH8/YpJzHVFwA0Yo8m/ij+RMkW3WE1LhBs+o/Gf
         ppxW2Sxjz878yCugDlxffux7YqrWyS42pDH/moGpOfDGOrwMSb/SaasFvRyHEK8nTMcq
         jOIKU7I0maHWq5bw7mOt+ZEj3ENEB0V06kaeifEeSxZWDYfUA/e+eLN0OzllEd6gvLfa
         fh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mVvXZ83iYyLs8LnTIxox2kYr6+WOQkcohmnzTxGDgAw=;
        b=o2Vs21W3rxM3+j0zAFR3bv/ysJyhqC2/l1nriKNcxI9QOuVREbrS37T6MMAsAWRJm1
         Cg+JileceiCrYu8Kzh4pW7WJ+VF8ZiLiF+R33j6JlgjFc7Xk1nmSCJ+mrWhfl+M/S8Be
         5CLzzPIRomJDvOijxsRaALWDS/VW0zgC9xcuZEtwoiYNymQYiODXlO/0h7Ew/WWddscI
         Hf6fJ33el7JYjCbws+22duDiToGdegfn/4b/L9Z3sJnr5458INuWHQFQCzTOi8wAQybO
         AioAATZt992FDZW221lPnLfQGXIeyaVxMH9OLkAS8i9VBIQuSxsftjkxZAN+JlDSNVro
         zY4A==
X-Gm-Message-State: AOAM532HW6SW79YCcE7aTfpGBmdkoSeadNi1PGt/d1vfsQZv0S0ChLtI
	oYolVXKNQ++kiNdatvuqjXaLdt/5DdM=
X-Google-Smtp-Source: ABdhPJzkUTGldJn2cQf0YD6Ph2bUBXkbprD2ZWgd8zJFpXEsiDiMnhJWWYpwqRucJPigYOeHhp8djg==
X-Received: by 2002:a63:5505:: with SMTP id j5mr5638428pgb.250.1626368453336;
        Thu, 15 Jul 2021 10:00:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:bd64:b325:a706:6ef2])
        by smtp.gmail.com with ESMTPSA id d23sm5805563pjd.25.2021.07.15.10.00.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 10:00:52 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 7/7] sysbench: fix memory test
Date: Thu, 15 Jul 2021 10:00:42 -0700
Message-Id: <6a7ba8f7f210e04183fb64ab181520d817a34a11.1626359076.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626359076.git.akuster808@gmail.com>
References: <cover.1626359076.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>

In sysbench version 0.4, the tmp variable used by the memory test to
execute requests is optimized by the compiler. Caching mechanism reduces
the direct accesses to the memory increasing the transfer speed. This
leads to false timing estimations that considerably affect read and
also random write operations.

In sysbench version 1, this issue is fixed adding the volatile modifier
to the tmp variable. This prevents compiler optimizations forcing a direct
access to the memory.

The final result is a realistic transfer speed measurement.

Signed-off-by: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 59cce5ad1603c2975684ae15b639e0e3cd688c40)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...modifier-to-tmp-variable-in-memory-t.patch | 40 +++++++++++++++++++
 .../sysbench/sysbench_0.4.12.bb               |  4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch

diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch b/meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch
new file mode 100644
index 0000000000..d628e81b56
--- /dev/null
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch
@@ -0,0 +1,40 @@
+From c1ebf893e32a0a77e820484d48a903523fef7c1b Mon Sep 17 00:00:00 2001
+From: Vasily Tarasov <tarasov@vasily.name>
+Date: Fri, 10 Jun 2016 14:33:48 -0400
+Subject: [PATCH] Adding volatile modifier to tmp variable in memory test
+
+Issue explanation:
+
+./sysbench/sysbench --test=memory --num-threads=16 \
+		    --memory-block-size=268435456 \
+		    --memory-total-size=137438953472 \
+		    --memory-oper=read \
+		    --memory-access-mode=seq \
+		    --memory-scope=local run
+
+Without this commit the time to run the above command is 0.0004 seconds.
+With this commit the time is greater than 3 seconds.  Essentially,
+without the volatile modifier, the compiler optimizes read access so
+that no real access happens.
+
+Upstream-Status: Backport [part of v1.0.0 https://github.com/akopytov/sysbench/commit/8753cb93be4c0b81a20b704ced91e7a422da52b1]
+
+(cherry picked from commit 8753cb93be4c0b81a20b704ced91e7a422da52b1)
+Signed-off-by: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>
+---
+ sysbench/tests/memory/sb_memory.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysbench/tests/memory/sb_memory.c b/sysbench/tests/memory/sb_memory.c
+index 2e8998f..7d22bb9 100644
+--- a/sysbench/tests/memory/sb_memory.c
++++ b/sysbench/tests/memory/sb_memory.c
+@@ -244,7 +244,7 @@ sb_request_t memory_get_request(int tid)
+ int memory_execute_request(sb_request_t *sb_req, int thread_id)
+ {
+   sb_mem_request_t    *mem_req = &sb_req->u.mem_request;
+-  int                 tmp = 0;
++  volatile int        tmp = 0;
+   int                 idx; 
+   int                 *buf, *end;
+   log_msg_t           msg;
diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
index 708c71f4ff..d1725dddd6 100644
--- a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
@@ -8,7 +8,9 @@ inherit autotools
 
 # The project has moved from Sourceforge to Launchpad, to Github. Use the source tarball from
 # Launchpad until the next release is available from Github.
-SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/${BPN}_${PV}.orig.tar.gz"
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/${BPN}_${PV}.orig.tar.gz \
+           file://0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch \
+           "
 
 SRC_URI[md5sum] = "3a6d54fdd3fe002328e4458206392b9d"
 SRC_URI[sha256sum] = "83fa7464193e012c91254e595a89894d8e35b4a38324b52a5974777e3823ea9e"
-- 
2.25.1

