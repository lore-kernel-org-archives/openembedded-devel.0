Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AE0C4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 06:34:53 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.96461.1670999690028302887
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Dec 2022 22:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FNEmYN8P;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id w26so3777949pfj.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Dec 2022 22:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++89gqmdyqkPu2jVXiNPmMn/BJ2F7exjGjI6VjsHVgE=;
        b=FNEmYN8PAXU5KTSl5PwbNep1MDGryeYwAaQlbf9G/FvEhvcpzFjNSHjCwn99agsrvp
         X/EIlq9yOE2evE6escVwx3LKegzGqmai35Grtrvoug5IOtyep+Eb+Sn/hl3fRla6HdSZ
         d1afdQs9KNvyVmPjvigq8KT52d9zqlwPDLM7KKfDxGWkvU/yPBNXMwrlLUcIE1Hqreb4
         lurRP4zYs2vOtek5XyLXyN3OjNayLdPmndhE3Jxj8Pki9v+s54Yo6OmqfBuVKQnbQqBt
         Nqu16+Zihr0qxhZvhZlzYTT40twgpwS25qeD7TcIKuNY4A1aTr77YvuCggDGo5F0DTh7
         Mm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++89gqmdyqkPu2jVXiNPmMn/BJ2F7exjGjI6VjsHVgE=;
        b=stdwsVHDj/rTTBcQZsYJLdcEJA2OLbbdiLYgkfoxRVPmj4BiTX4iZs/ii+SVI5IG+5
         VLiLVicuAGYILqnAbQLLP5mPND9kQlfux3ox4xOYdvEEfY0L5YIJ/KrIKEaDpTeo4dbY
         7Qix0RNRzLcvjsL4K3kerZbfbbCcIxjiDouPHNISTBVC/KeqAkguvaPnf3KFKqjjvF8x
         BO1zeqIsDQsfJBf+yoARTYjshfnp68RFZX2YGzBT9CgKs4ixAp8evydWObhvrbvH1nGd
         6gIhWlG2ioLdapm7u18LENxoCB2HG0uSMnYyBRgo66I/y9TeCA8FEw0dBv5sm26TErN9
         zF9A==
X-Gm-Message-State: ANoB5plciR42fU6j7mdeNOh0JPuv3LmhJjo5scl8crR4I8lga6wAm0ur
	Ez+3nkZIuWJJeFUKU/+5fnsAjgEmaMs=
X-Google-Smtp-Source: AA0mqf7s55M4epfbcGiNXTd7CILBKVN+TnUqMvZvcRdJS5yGZG44LB0EiCxVJd48STS/P/l/UVd3TQ==
X-Received: by 2002:aa7:982d:0:b0:575:bef5:1a54 with SMTP id q13-20020aa7982d000000b00575bef51a54mr22075784pfl.34.1670999689101;
        Tue, 13 Dec 2022 22:34:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id f125-20020a623883000000b00575d90636dcsm8661015pfa.6.2022.12.13.22.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 22:34:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] mariadb: Upgrade to 10.11.1
Date: Tue, 13 Dec 2022 22:34:46 -0800
Message-Id: <20221214063446.1834812-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 06:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100075

Install uca-dump in native case, which is needed by target mariadb build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{mariadb-native_10.8.3.bb => mariadb-native_10.11.1.bb}    | 1 +
 meta-oe/recipes-dbs/mysql/mariadb.inc                          | 3 +--
 .../mysql/{mariadb_10.8.3.bb => mariadb_10.11.1.bb}            | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.8.3.bb => mariadb-native_10.11.1.bb} (90%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.8.3.bb => mariadb_10.11.1.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.8.3.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.1.bb
similarity index 90%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.8.3.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.1.bb
index 17a06349b0..578357b480 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb-native_10.8.3.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.1.bb
@@ -18,5 +18,6 @@ do_install() {
     install -m 0755 sql/gen_lex_token ${D}${bindir}/
     install -m 0755 extra/comp_err ${D}${bindir}/
     install -m 0755 scripts/comp_sql ${D}${bindir}/
+    install -m 0755 strings/uca-dump ${D}${bindir}/
 }
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 2ef0d1aa3b..1a7cce2ea1 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -23,8 +23,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
-
-SRC_URI[sha256sum] = "887eadc55176ac1ead1fccfc89ade4b5990ef192745ad4dcd879acb41c050892"
+SRC_URI[sha256sum] = "ffacf84e74daf249ad64b9573d79a4e882f66b004614f8b33bfcb14a8e25da1d"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.8.3.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.1.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.8.3.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.1.bb
-- 
2.39.0


