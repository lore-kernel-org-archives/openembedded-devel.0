Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5566C433EF
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 22:07:24 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.905.1653602837727435845
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 15:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=htjwLoIp;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 cs3-20020a17090af50300b001e0808b5838so2804382pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 15:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OGbCMTJYPisakL0RYAOdzpO8jo0admHj5Nr3hS4ibSs=;
        b=htjwLoIplyTcveNLUCoS54rQWJ2JdNoA2E9GfSsM6XUdIl2wImMRCLjoGd9nLOPdMv
         uNtAbW90Fv6oTDL9mm16NkoqVbik/gItxNT57WQLom5bgcos6AMh5VzCi4MpMZmT42Ut
         Bl+h4MVkAf5VriJUkOY/5P1wqTVkYGTbaIVDjx48DQ8hxfwPsYcbXNmN8l4REALnUzS8
         pKqVYPXaBu0s2I5GwmGBNbIWpt/88kXAl/M9wLLbsqPr+E4D++Vmen0JUGyGvN0NC9rr
         7AMFba5ySUp5xGTOftrfexqLgwLpVyQ70OPXSb6C2YVVhbp2vVBDXD5437UGB+Z0XKeI
         p/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OGbCMTJYPisakL0RYAOdzpO8jo0admHj5Nr3hS4ibSs=;
        b=5NIp1Q6QAL2KpRu8TCiyqjMaiK4C8ZnvGPmgBadZbbNlYpXEf/YPq0WZm+bpynLbHb
         s1wFgHetOo6kmMhpMlduZsENk3POBmSjuCbZtDYLk8YMY3m8aMWiTG2vltsIvrj952ts
         ksaH0uVAFbi5gM9nSah4J70P8jRorHEVR4Lsm9owppZMaakEDBTW29VjNUM2BWuAPu0C
         zWBcLCS6l7gqBJaDf4a5CLhnxauNk63T3SCuP9JS7IYvMd/0l231SlppfKsqLr9MrpeN
         ADPP9dibK0hyL1nSmMpH762l2joCQysZ6GZOZ6HX4A+SVYCfPYryrpHnEcxZ84L5DxMl
         hORQ==
X-Gm-Message-State: AOAM532oaw3ZyfcBCtzEqtZj6lfp055GbDsE+Z6wTVCNcvyOvWuvtOMB
	l3ihw48pQS0gQkBDN/VGYJ5X9GkQ2itoKg==
X-Google-Smtp-Source: 
 ABdhPJxWx4/+i23BKFj6Td7ELvhWfJlvvK0LjwWmK/GTD75uwaRorZYz2FWQljGBHxhk1uE1xx8+0w==
X-Received: by 2002:a17:90a:d3d3:b0:1df:3b6f:d073 with SMTP id
 d19-20020a17090ad3d300b001df3b6fd073mr4711326pjw.18.1653602836821;
        Thu, 26 May 2022 15:07:16 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:c5c:7325:b02a:1f3c])
        by smtp.gmail.com with ESMTPSA id
 x3-20020a170902820300b001618383483fsm2043575pln.224.2022.05.26.15.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 15:07:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][dunfell][PATCH] mariadb: update to 10.4.25
Date: Thu, 26 May 2022 15:07:14 -0700
Message-Id: <20220526220714.1942548-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 May 2022 22:07:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97281

Source: mariadb.org
MR: 117530, 117522, 117514, 117506, 117497, 117489, 117481, 117473, 117465, 117457, 117449, 117380, 117364, 117356, 117336, 117212, 117204, 117196, 117180, 117188, 117169, 117161, 117441, 117372
Type: Security Fix
Disposition: Backport from mariagdb.org
ChangeID: 8bf787570ebe8503d2974af92e17b505e70440e5
Description:

LTS version, bug fix only.

Include these CVES:
CVE-2022-27458
CVE-2022-27457
CVE-2022-27456
CVE-2022-27455
CVE-2022-27452
CVE-2022-27451
CVE-2022-27449
CVE-2022-27448
CVE-2022-27447
CVE-2022-27446
CVE-2022-27445
CVE-2022-27444
CVE-2022-27387
CVE-2022-27386
CVE-2022-27385
CVE-2022-27384
CVE-2022-27383
CVE-2022-27382
CVE-2022-27381
CVE-2022-27380
CVE-2022-27379
CVE-2022-27378
CVE-2022-27377
CVE-2022-27376

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../{mariadb-native_10.4.24.bb => mariadb-native_10.4.25.bb}  | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                         | 4 ++--
 .../mysql/{mariadb_10.4.24.bb => mariadb_10.4.25.bb}          | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.24.bb => mariadb-native_10.4.25.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.24.bb => mariadb_10.4.25.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.4.24.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.4.25.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.4.24.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.4.25.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 9aca7371af..565f4d5613 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -17,8 +17,8 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://0001-disable-ucontext-on-musl.patch \
            file://fix-arm-atomic.patch \
           "
-SRC_URI[md5sum] = "af39316a6803d13f84fb586635598036"
-SRC_URI[sha256sum] = "fe975551b37f095640ea5e380eb896a37e331caf113dbe5d05564714338df846"
+
+SRC_URI[sha256sum] = "ff963c4e11bc06b775f66f2b1ddef184996208fb4b23cfdb50d95fb02eaa7ef8"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.4.24.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.4.25.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.4.24.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.4.25.bb
-- 
2.25.1


