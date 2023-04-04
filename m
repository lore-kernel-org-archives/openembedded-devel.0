Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B117FC761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 19:22:03 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.111597.1680636121048994389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Apr 2023 12:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=BECQ/Q4w;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id f4-20020a9d0384000000b0069fab3f4cafso17902121otf.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 12:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680636120; x=1683228120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fL1A3Fj9mTYPHulqI62oIJETZJsXnpllkTJpMGvZYV4=;
        b=BECQ/Q4wvX1Jf0kJ4nRS5WeR3XfLBcQMMvhHusQz21iiYD1RajMSesMJXUeXgySi0L
         6gmsoY7fd6EOmYwMuljDlohTH17wO4k/PnZK/cRvEqlsEcDClZVxNa+iavF1+AtOqXvz
         yenUFSJ1fzzyfVX59eMma5ajjFHvePmFHZcGqjp+i/389k1QcYzIL7oss+f2hfjV6zLk
         vfv6UXo8vacNd6UHbw3Scd8XNZ930EWp3+5U7rJivzmuvpPzhieFrNp7iZ5Hdkieblyf
         j4Tu3YONN8JsohTtcLUFeAgCJQgnsR2k7dtpjsSbSDToOZHDqgXasZ8u0AdvM8xnYhzJ
         vUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680636120; x=1683228120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fL1A3Fj9mTYPHulqI62oIJETZJsXnpllkTJpMGvZYV4=;
        b=V6MR2qNWCekHuhj2FCasH/hjo1S/b2/ZtXPm077pxFED1Fv/zpCnEdLODhBoy/18f8
         AdSKI+235bwN4DeKdJjjVGJjQI/PPwsV0bCUIrrJbwHkbtKflSRE54bJassBXk80bth2
         S+S5UKtT7jrVSmCf5SvMP/3QB1GLxTNueQ5OXkMqtqOlFOwp2zDXFJrzwtDgt8vzsEHf
         99pDnMc14QSaMNvw6Yf2f2WgOUfoz/0DJstZQGSN0Ut3it9JoUC0P3VXp/ObRq4JZzyr
         yGyZUaqmM2kmikVPS0HmNl8NW5OkjrqiVWa6fXpjYBhr4VghHBNMTu3wjLHsGq+7f4GO
         cuLQ==
X-Gm-Message-State: AAQBX9dbEViplfiLe2b+D+aAOhircvqTRkOrtz2IvaUT4698hL15ENDD
	3WbK9c7HKWbDQrcXb05fw8gF6LXJ48jZ/g==
X-Google-Smtp-Source: AKy350ZwNArAfVzrCFE/M76nzvl8y5V6NYU621ugQpN2QcQaQNWEgXOsBPn0aO8qkejvblNyCndOIQ==
X-Received: by 2002:a9d:734d:0:b0:69f:b0f:21e9 with SMTP id l13-20020a9d734d000000b0069f0b0f21e9mr1985682otk.9.1680636119998;
        Tue, 04 Apr 2023 12:21:59 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:36a4:266a:a865:5f55])
        by smtp.gmail.com with ESMTPSA id w20-20020a056830145400b00690e783b729sm5940789otp.52.2023.04.04.12.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 12:21:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][dunfell][v2][PATCH] mariadb: Update to latest lts 10.4.28
Date: Tue,  4 Apr 2023 15:21:58 -0400
Message-Id: <20230404192158.407074-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 19:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101949

From: Armin Kuster <akuster@mvista.com>

Source: Mariadb.org
MR: 119595, 119604, 119613, 119622, 119631, 119640, 119649, 119658, 119573
Type: Security Fix
Disposition: Backport from mariadb.org
ChangeID: 2aacce87739247d98ee5b61d1b714930da961a30
Description:

This is a bug fix only update. Includes these CVES:
CVE-2022-32081
CVE-2022-32083
CVE-2022-32084
CVE-2022-32085
CVE-2022-32086
CVE-2022-32087
CVE-2022-32088
CVE-2022-32089
CVE-2022-32091

Signed-off-by: Armin Kuster <akuster@mvista.com>

--
V2]
Missed on CVE reference.
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
index e052c7691e..e4eb48492a 100644
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
2.25.1


