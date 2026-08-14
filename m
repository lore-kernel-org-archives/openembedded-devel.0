Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEB0C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:49 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24518.1786747608186657575
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nXcXneMs;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1413893a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747607; x=1787352407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAxlWUguj6lrj9tRqjCnc3fWqbT3riCSp+llQRVc9cg=;
        b=nXcXneMs8ItxzrXgf6qjpzng52w1CJgWodKZLX6CVzp83DYH+XKD5wptGQQGpQl5iF
         uXDxO7f7f6cW24MzuICGtuQdZfhPyyjlnJEVL/p7SJtS0luy/Qyyq2x9jW7r7LxMKVUo
         d7dn1xKO3vK9E6hj+L9oJpV7tih6jBrYBH0ccDCoaLqgaNEQxB90CZ+SpYpsySIi6faN
         a8k4R0j9U5RfmmyXJXvzA4SkJ+6B+1b8eKv5ftteTGVRf15GE+ZGAKvZ3O998i1M93cZ
         nUjs8eZNAtKc4ECmvKz6q3HJTx9yGZKAyWNT4Fp/FdzCfcoY2hx3j0Q9NpEjZjHbLh+C
         DX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747607; x=1787352407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAxlWUguj6lrj9tRqjCnc3fWqbT3riCSp+llQRVc9cg=;
        b=Ite/GbyMeoG6eB/EYMFwtQLDCv6KcmgW4VKKCL8ErzURG9xUSn32bbEppqNT+AmZ8t
         alB+YpxGt5i9k2xyPbQkT6oftMYcydDhp6LRPezawgkUr52yJHykWv4KXehzOdnJ8Z9k
         rCLLNIyqYga0O7k1SgzpYuqsrBHFcg9izlQuAZQijWpuT1bMljLypGzCJVsWwUMP6znh
         itZcouFkFC5VSVABwjqusQTU/V045e8fzgNDjALLUhL9rpTy4rHfNPUe+8jTDTxMAfi1
         tfWf08koi2iSLbMlYlhaJTAdHtPRMEbAjhKc3Nmkj51YaSakPpH8y8yOPKDFtu1WehVy
         3GVw==
X-Gm-Message-State: AOJu0Yzpkp1QE/4a6tU7c/vWcRZv0xUczYoUMgQAja/DMfebk1bMoalU
	lmFkAeVn8VCWD/vl8xEfm267mT07v417MjAzpTd4WRP+6MYNLGaFV0LXu5vfqVaG
X-Gm-Gg: AR+sD10DWfHy4bR60MC4GMtbioxYlS/tizRIHpiEWj7Fz25OZj26mVe4QNwopiAsCh2
	YKEuKrT1LH/cYq5mv1Mek5qfQzN2obKqCtBcpxhMlXPoiN0raCBTI9aWRmWjAGB1bS8UKDmV+FZ
	TFJ7y9LPQQnEfcTs1FU/IimBO1ZGGDyUS7Cz86Bm9kEonLvueD8wirgfCl92NDSEEpYpNmCRV1M
	mIrOxpcG0stobRwKeayK9UgA4Em201ALVmdfQIzLs6BTXf9By9W3ztqU2D4IwNXjfA3a18iHCmT
	ar+abJQzX7YizBFOzxGo6fUvzQZN/1xGu7teO2GzUtTxZ6D/2aeYWT0O7+BwKp7jXJBfr09OkxL
	bE+OUe7ytV2Ni3J1zvE0lGKaEJa1VelXwyMUp89DfXBa/mrRDdPzLVJeKqlkn0y/BErFB8kd9hC
	iDGQBoIxTsYdeBVouxhWOVxixchk9Pt/vgBgbZUHrtmKtEpfbMooogQA4PSF3qHyYEPpvUFdT/O
	XSKVjzKoTVHUbGe26l5/nQ1yRy+cxoNmdkakIdiytxeTLracmeIr3TbviNy8T5tM/ripJeoqbiV
	LB12MM0PJTfyNvxkOQaVd/LnNhPkyykpaD8DvOX7/n5pCbveG+jhvTTCaEGTt+lUXxK2rCGxR4Q
	qmkHFd0PWmxXmspn67+9XoM2EqRBXF6fhQKuTHhQynpi4Fw==
X-Received: by 2002:a17:90b:3c4a:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-3933b6f15dbmr9849695a91.3.1786747607474;
        Fri, 14 Aug 2026 15:46:47 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 058/109] rocksdb: upgrade 10.10.1 -> 11.1.2
Date: Fri, 14 Aug 2026 15:44:44 -0700
Message-ID: <20260814224539.1523174-58-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129122

Major release; see upstream release notes for details.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../rocksdb/{rocksdb_10.10.1.bb => rocksdb_11.1.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/rocksdb/{rocksdb_10.10.1.bb => rocksdb_11.1.2.bb} (98%)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_10.10.1.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_11.1.2.bb
similarity index 98%
rename from meta-oe/recipes-dbs/rocksdb/rocksdb_10.10.1.bb
rename to meta-oe/recipes-dbs/rocksdb/rocksdb_11.1.2.bb
index 2d9dcf4a8d..3bc90d1e5e 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_10.10.1.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_11.1.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "4595a5e95ae8525c42e172a054435782b3479c57"
-SRCBRANCH = "10.10.fb"
+SRCREV = "3b446089141659fad25328c5ea3e7ed283df46e4"
+SRCBRANCH = "11.1.fb"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=https;tag=v${PV} \
            file://0001-cmake-Add-check-for-atomic-support.patch \

