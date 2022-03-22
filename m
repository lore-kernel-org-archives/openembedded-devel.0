Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634B9C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 18:46:45 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.14041.1647974804494319423
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TX1BH7Sv;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id i11so15560132plr.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lfASXCIIqp60hr95ygmtA4w+mWlTtfUuO0+CzgY59xQ=;
        b=TX1BH7Sv+UnBWj4kqsREJZyk9gUDu/y5QJeBtqSQk3BPY1o+/jRsboH8CixVJMbDKd
         qJLQgibznr1SRmSCk5QsW/BVs7N2Lc5Ex1SuWHa/8yya2NSQ7NcuUnZ7P7V6cP8snRDz
         UUVNNZLtbUA1zkqYKVlETWVS7zIA1/vaJrjkMuXSTMvXPRFfy6tSbKhFaojyH1bxNx8a
         /LPtVg+v60zMjGmrIuvvoezClN0kY8uisc7GfKzcqYTqQSsYjuLl2T3+96EDkt+ohTn4
         qe933+ZFRw+4Hx+WBUiLh1IAkizidMnOa5BFx/aSqwYo+4A3Y7igwAh41lQGX7Dvkhys
         2+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lfASXCIIqp60hr95ygmtA4w+mWlTtfUuO0+CzgY59xQ=;
        b=eYMzX0HJYzh/yoNyZd2xPBYVLNnBuFd3c5WC1UIF2xffCwb4DqgRyHbGWv6Ekdu9Cp
         cpfLt7wDHTDB9YJYBo3i0MNGw/RCcyQVvwA0JO9dwUo1/sn1jEvT4+4de/cIFc1/whgS
         DGDtP81JCzFMgD3nfq++5kakVU9XkII1j27bq1CVAaUx5wLpePAODfpS8FSYLqMjUcWh
         yYpyu69X0kX1CEYxfWhPL8NOZELHMo6NevZc/250exSYBD9jM7IOjamPncrGfol+y0rJ
         A3A48PNNzb6AgDYvrdhFCnMaEWPn1Z1OaC9PsfJcKFaj5CeTCvEPluSpky5uBKgvDF/8
         p7cA==
X-Gm-Message-State: AOAM533Byq2qoul8+rq43KuYfzZZFLSETFPVyw6unjz+DvVo1xS2y2Rk
	2+/sjpzsqvTaDRqSAN3VeSoMc95BrvmcaA==
X-Google-Smtp-Source: 
 ABdhPJyqwejbGnBmhD2e80Dxy2hKAG3hGZfJ6Ja0+LtDJ0DZd3EulGCdxf7A7ZLtmquUxBFNYiM5Rw==
X-Received: by 2002:a17:902:ce8b:b0:154:42e2:924e with SMTP id
 f11-20020a170902ce8b00b0015442e2924emr15412074plg.138.1647974803602;
        Tue, 22 Mar 2022 11:46:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 p26-20020a63951a000000b003826aff3e41sm8188993pgd.33.2022.03.22.11.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 11:46:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mariadb: Add missing dependency on lzo
Date: Tue, 22 Mar 2022 11:46:40 -0700
Message-Id: <20220322184640.115748-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 18:46:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96152

Fixes
TOPDIR/build/tmp/work/mips32r2-yoe-linux/mariadb/10.7.3-r0/recipe-sysroot-native/usr/bin/mips-yoe-linux/mips-yoe-linux-ld.bfd: TOPDIR/build/tmp/work/mips32r2-yoe-linux/mariadb/10.7.3-r0/recipe-sysroot-native/usr/lib/liblzo2.so: error adding symbols: file in wrong format

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb
index 16ecb0493e..8667417b12 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb
@@ -3,7 +3,7 @@ require mariadb.inc
 inherit qemu
 
 DEPENDS += "qemu-native bison-native boost libpcre2 curl openssl ncurses \
-            zlib libaio libedit libevent libxml2 gnutls fmt"
+            zlib libaio libedit libevent libxml2 gnutls fmt lzo"
 
 PROVIDES += "mysql5 libmysqlclient"
 
-- 
2.35.1


