Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355DEC6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 14:05:02 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.102549.1680617100159233042
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Apr 2023 07:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gXmYyHYg;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-544f7c176easo615198347b3.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680617099; x=1683209099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=72exzAZK/bs7lo2I9/QDO0R/SUKYjc3bwKngMbHPw0c=;
        b=gXmYyHYgBNTsHoPQz1qt2fwElnmFkcvpfUEoz1GFzFKTMnHc/xOnhzDrhz94LrpXJu
         DJwSCXXVm/RI8ZdHTTsEacf5Y35EnWn7jJ9NfONc9H3zcSl05H/IBjaQiKNKMZe/wbIk
         dhIHI9xGhjFfm+N1fsk/v2p1nBlddgv/oZ/95cxipR0LuPd1NmI2oMg22vInwkTJ8WV8
         ujZajPIQ3XFCsOK3dAcLmDr1dI7Z4PUJ9OBaBNaBqlEfkW7SwRTiG/kFaVAgXWp7lD70
         ntYATqmtONmZ+F5K+3ctRTJZaBVP/53rXJ++1UYjBMWJU/Fdqp7459tqpyfDGcAHK3/3
         Bndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680617099; x=1683209099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72exzAZK/bs7lo2I9/QDO0R/SUKYjc3bwKngMbHPw0c=;
        b=lDsz7AariidzCiWwDSYXS+kUDF306ccBpefSsfGin9nLarRcnnpsj8dI3EmA4KNtEI
         4nPyXiGFajR3jD1vs/C+UvAlyi7mkgAryRMffgk/UnEwYcOSO2yUFISi5q7w6ERxAA+U
         0S9lXiag3jS/XR52x0uq543cHZoUD35pY2K6cVZHIN7ugbFHByDgrxkekZSDXhbIY+8J
         0p8YAUYO87XSicw9ZMA6e5rp/CKPyg+R+z6uo2GOfi+rNdXiUmBK7VPnXslhL+FwyVvU
         /A+6aXSCEP4iN/KxHR5aXgNCGLoIz71Tu7qX3EfQHtxs748fMso8p/0KZ3DOqF5ZKKPu
         kerA==
X-Gm-Message-State: AAQBX9eh4NJ0HsBMrIy+UhfHr8YnGJmbRIMFod+bEsAaN9VS/49DhEiQ
	bFC66GOqYQ394+62UoRo8R6lG1pOzxOxSQ==
X-Google-Smtp-Source: AKy350YqA+gqwxonIw4Vrqm6//wiXE80qrWVB0fMWq1bfpzFm1wEoW12S6kxS3HW8YtAeuihG9Z6QQ==
X-Received: by 2002:a0d:da02:0:b0:549:29db:733b with SMTP id c2-20020a0dda02000000b0054929db733bmr2447575ywe.23.1680617098867;
        Tue, 04 Apr 2023 07:04:58 -0700 (PDT)
Received: from mvwork.mvista.com (99-157-111-72.lightspeed.tukrga.sbcglobal.net. [99.157.111.72])
        by smtp.gmail.com with ESMTPSA id s2-20020a814502000000b00545a08184e9sm3208896ywa.121.2023.04.04.07.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:04:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][dunfell][PATCH] mariadb: Update to latest lts 10.4.28
Date: Tue,  4 Apr 2023 10:02:57 -0400
Message-Id: <20230404140257.1850127-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 14:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101946

From: Armin Kuster <akuster@mvista.com>

Source: Mariadb.org
MR: 119595, 119604, 119613, 119622, 119631, 119640, 119649, 119658
Type: Security Fix
Disposition: Backport from mariadb.org
ChangeID: 2aacce87739247d98ee5b61d1b714930da961a30
Description:

This is a bug fix only update. Includes these CVES:
CVE-2022-32083
CVE-2022-32084
CVE-2022-32085
CVE-2022-32086
CVE-2022-32087
CVE-2022-32088
CVE-2022-32089
CVE-2022-32091

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../{mariadb-native_10.4.25.bb => mariadb-native_10.4.28.bb}    | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                           | 2 +-
 .../mysql/{mariadb_10.4.25.bb => mariadb_10.4.28.bb}            | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.25.bb => mariadb-native_10.4.28.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.25.bb => mariadb_10.4.28.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.4.25.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.4.28.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.4.25.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.4.28.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index e052c7691..e4eb48492 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -19,7 +19,7 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://CVE-2022-47015.patch \
           "
 
-SRC_URI[sha256sum] = "ff963c4e11bc06b775f66f2b1ddef184996208fb4b23cfdb50d95fb02eaa7ef8"
+SRC_URI[sha256sum] = "003fd23f3c6ee516176e1b62b0b43cdb6cdd3dcd4e30f855c1c5ab2baaf5a86c"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.4.25.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.4.28.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.4.25.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.4.28.bb
-- 
2.31.1


