Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B366C433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 01:14:38 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.1346.1648343676506757405
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 18:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q6gGhzlp;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id b130so8069654pga.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 18:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2E3LpLQepDqNf6gDJgWCYDfK58/ydMnDJo7/6mkQyaM=;
        b=q6gGhzlpypxZz2bUKDMeHQrlyOYwClcavb9g9bpzMzHjwJhpx17o2qBPBY5nMuwLVW
         aC0hH3Dzr7DMu0LCcb0H/zMK8ljvj2D0ubyoa/ZEEzRZlNQzyUWUeRK6QxEljWVhVl2o
         GplxHs56qlkCo46KHCTz5Awm/BhFMQJ6xJmbxOMObjRmwtdlzi8VCBd+wWK5IH35FnZ0
         4flLBWlJi/S29LfckxaKs0KRXYElUlbvKXUCbdFxi7usK1w5DhP0uc7AKc6wQ9klEOZF
         LSyL4igywOgNCfCfudN9Yx/iBaIXzoV3F20Ys5n13NlRhRZm3nssHQeuYa+EXrycW+AS
         dOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2E3LpLQepDqNf6gDJgWCYDfK58/ydMnDJo7/6mkQyaM=;
        b=st2sXhX1AyJAaY5fEvEmpMNoLh7FQc4+enxZ44JIo7GySjWl/5st3qNYgkKgej5DNH
         0aTIK8F1tFZv5jr7was/ZVG0wUAn+UGSAfuB6oDRZ1o1NdAjqxMQpG58cleX52ukkjQi
         tyn72QrVpEvyvkd+ktfp99pPOoTlqGI7W4YArvzo5O9rfJKAlIOBa1+3ZQQ5cFMzDF4R
         1f+hZUN+7/r5SEey+Kxf+cvK7RAZuc3/0MVW8WoFE3ZyFJckrYl+HNY/PzERaK/3wdn4
         aJ1/suXSRAuWudXvbzOqkZRCTkWggaskSCLCntYF9xjTLLIxK1cC0qhydp8PB9zjIu8t
         Dfsw==
X-Gm-Message-State: AOAM533K1Yhr1PhWKRc326rZaZ3U0vTJE8JQouAlV/nZ+vIGI8+BbRIG
	kUn1ol462m1EjDCaPruFkRxMOO46O3U=
X-Google-Smtp-Source: 
 ABdhPJyTXf9yvIaFoYlUDBNVZS/Q50MEQgJpdlY3CS1nz+BhzbFzFqx9BZ80HNgfyq2u+BF7AxhfvQ==
X-Received: by 2002:a05:6a00:711:b0:4fa:daf1:94c1 with SMTP id
 17-20020a056a00071100b004fadaf194c1mr16575214pfl.52.1648343675456;
        Sat, 26 Mar 2022 18:14:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 b1-20020a17090aa58100b001bcb7bad374sm16525147pjq.17.2022.03.26.18.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 18:14:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/6] rocksdb: Exclude on ppc/musl
Date: Sat, 26 Mar 2022 18:14:27 -0700
Message-Id: <20220327011432.555592-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Mar 2022 01:14:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96216

Needs porting

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb              | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index a74fe0e9d0..6e001ce1f3 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -223,6 +223,7 @@ RDEPENDS:packagegroup-meta-oe-dbs ="\
     soci \
     sqlite \
 "
+RDEPENDS:packagegroup-meta-oe-dbs:remove:libc-musl:powerpc = "rocksdb"
 
 RDEPENDS:packagegroup-meta-oe-dbs-python2 ="\
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'mysql-python', '', d), "", d)} \
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
index 205ae1dfc9..2ad2d38a53 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -52,3 +52,7 @@ do_install:append() {
 }
 
 LDFLAGS:append:riscv64 = " -pthread"
+
+# Need toku_time_now() implemented for ppc/musl
+# see utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
+COMPATIBLE_HOST:libc-musl:powerpc = "null"
-- 
2.35.1


