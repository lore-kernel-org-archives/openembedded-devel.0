Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A6CC4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 03:24:51 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.94635.1670988282362404759
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Dec 2022 19:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P3ZXPdj5;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d15so2010567pls.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Dec 2022 19:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iP7JHEuE1KJ+OKFqpKA6VGRCQIgqK0QLESNwy6MPt54=;
        b=P3ZXPdj5SOj9/SNNwq1r3wiFNzHb+mEEy6BSfJIV3/AP9y+qLvC4I3QdnNl6rnQU4/
         gyz2fxInQ8lH7swZCUvBmZcFNJNKwp0ldvLF86f95LgFK7gxXEeowlf3e9sJ+mIfe22e
         Jmjd599ilPPVbHAhGqEy39i4XoYxMKiJyk9JvowTesVheqLv6/pFlZNPTFF/ACUycaZU
         G9a7OhrSvqxkHXTpPUoWQ9Ccc3CE38szQblOnp4MpOPb8XXuVhcYl8ZmyISQrEjbu28V
         wFTwfU5oh8qlCTFkJTqMlsBTkLI23gK6SFuRbkQKXG8uPHZJT4UY+iDNQ2GjXFMrqDE+
         Kiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iP7JHEuE1KJ+OKFqpKA6VGRCQIgqK0QLESNwy6MPt54=;
        b=EiMYOb8YvDrMECSbIe3fQ8LrG0JgdFOQQNW8S8q1AMmnONRdRXayeSWOY0KWmmbBMa
         xoF8W0uY4o3W1e55tb2PGQBccJ4CLZ9JIFFUfvkHA1loJQ5qEg1hbbAUL2ApxRTY5L9d
         o5mx6n2W+F+DcwmE+1Qjv4NkMEYM28l+ipHGhAGrDqHfRQ7ObsXtrVDGayBz7rKsM7Hn
         DvNTTK5bNgnEA58WCNe/5/il6+YMEFOFT6JLpBjfg7KyFJnoOlPHBHZCzAGTYC4VwJUz
         ITAt781J0SYtZIcSfMuVQkpbbptCmIVie4W2o8EGT731drC4q078vRpS6uoqvKuZjdtf
         pZBA==
X-Gm-Message-State: ANoB5pkjEoiGpiXgMsITZTQD5gmKpKUKh80Kt0KfVkvQEjRPUU7UrhRb
	lk+m7MTLbsmkHEb9WnXFfqpH7TINhe8=
X-Google-Smtp-Source: AA0mqf5sj4jxBQ4ymE2Q7yFc0PWZJHu3Hf7a5GOYBvdzPAnv0IIEcdjqRQLCaz52OSvDWdLdMTdZWA==
X-Received: by 2002:a17:90a:fa7:b0:21a:3fc:e104 with SMTP id 36-20020a17090a0fa700b0021a03fce104mr23504284pjz.12.1670988281387;
        Tue, 13 Dec 2022 19:24:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id ls14-20020a17090b350e00b00218b32f6a9esm258076pjb.18.2022.12.13.19.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 19:24:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mariadb: Upgrade to 10.11.1
Date: Tue, 13 Dec 2022 19:24:38 -0800
Message-Id: <20221214032438.669110-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Dec 2022 03:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100072

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{mariadb-native_10.8.3.bb => mariadb-native_10.11.1.bb}    | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                          | 3 +--
 .../mysql/{mariadb_10.8.3.bb => mariadb_10.11.1.bb}            | 0
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.8.3.bb => mariadb-native_10.11.1.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.8.3.bb => mariadb_10.11.1.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.8.3.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.1.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.8.3.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.1.bb
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


