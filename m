Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.1125.1626884759384157534
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jul 2021 09:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wt5vr36i;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id p5-20020a17090a8685b029015d1a9a6f1aso1209199pjn.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jul 2021 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KUe/RIe0QaUZS3EWMG0I+yUki3m945tQMLMOf5h01Yc=;
        b=Wt5vr36i4uuDS3Olx3sI9v2zBb4rUQZMO7puY+6wb2VRt49Ky6aQUsOxXYf8cSy6Af
         +obNzzPtEzLCMl/Ww4LlKL4aF0xgoWi3t9NrIBv+1V29BEdKCe/tyoR4GMUkDd6Ui1j6
         so5UW4u4bOQ6grIohexhHla4p1cc/tTiLSou1uS76GAWlEFgUOgHiGvbCQlDuZI4MVLS
         hU81jqLppd3FGgsN/+lWtUz4xcLwcM+y0TGCMHo1EEONuPf+32d+0sxJ7RVOsr6nMFqm
         0btsu85hNIyP4q9MsVYBCbzuIqTldC6OuDLHg2uyrUCmA18R77fgRm7Cls51ag0AssoW
         jhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KUe/RIe0QaUZS3EWMG0I+yUki3m945tQMLMOf5h01Yc=;
        b=tXXYh59b+4fDAoB6VKW6gHGF2yCGDqfQkEjiwtVHRm6aWHdx7aJsCmP9RC1YE9RUvF
         a6wk8mD2T4MLRfM2WKkPplrWjS2SW+spcs++ikBdri1xd7n/zaFw9r0SLifrF/OhRH7Z
         hBsGBdW5X2/0JSHmqQnsl4bguN+hQJUqkDbc7H+upVLkst227uJaqbJ/mi3NwfK0xk2T
         xUa03XmbkZ9h37Nu6nqL1B3fxipZfsRLUf0ZBh+pnEcz1JXV0+h6EOI57UBqC7g9qghq
         fs1v0g0MqZp1ExMU0claBPYjG3wDMIfjWU/hpIUHycFUY6lWJJ/Y8R3+UBSnX65+C58Z
         xBgw==
X-Gm-Message-State: AOAM532hiJHhMA6JMx10N9suirksyjoETlv2fk09/BdeqHY6Xp7fu7zp
	1lO/GK1naIq0ETdU0YWWXNWK3wYqHQE=
X-Google-Smtp-Source: ABdhPJzobk/lBuueL1LmHubma+PibmNxLsXHvLh0qqEHlOIdxxXriYKDZKEwmVUvhWf2csx0mVfINA==
X-Received: by 2002:a17:902:b210:b029:11a:bf7b:1a83 with SMTP id t16-20020a170902b210b029011abf7b1a83mr28144763plr.84.1626884758748;
        Wed, 21 Jul 2021 09:25:58 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:246c:f330:abd1:7add])
        by smtp.gmail.com with ESMTPSA id h17sm27150568pfh.192.2021.07.21.09.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 09:25:58 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][dunfell][PATCH] mariadb: update to 10.4.20
Date: Wed, 21 Jul 2021 09:25:56 -0700
Message-Id: <20210721162556.603193-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: mariadb.org
MR: 109670, 110757, 110768
Type: Security Fix
Disposition: Backport from mariadb
ChangeID: 82a82ba3623ff39ca17443d0117d36bcee73e612
Description:

LTS version

https://mariadb.com/kb/en/mariadb-10420-release-notes/
CVE-2021-2166: MariaDB 10.4.19
CVE-2021-2154: MariaDB 10.4.19
CVE-2021-27928: MariaDB 10.4.18

Signed-off-by: Armin kuster <akuster@mvista.com>
---
 .../{mariadb-native_10.4.17.bb => mariadb-native_10.4.20.bb}  | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                         | 4 ++--
 .../mysql/{mariadb_10.4.17.bb => mariadb_10.4.20.bb}          | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.17.bb => mariadb-native_10.4.20.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.17.bb => mariadb_10.4.20.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.4.17.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.4.20.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.4.17.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.4.20.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 9f7203c40d..0fb0c95ec3 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
           "
-SRC_URI[md5sum] = "e8193b9cd008b6d7f177f5a5c44c7a9f"
-SRC_URI[sha256sum] = "a7b104e264311cd46524ae546ff0c5107978373e4a01cf7fd8a241454548d16e"
+SRC_URI[md5sum] = "c3bc7a3eca3b0bbae5748f7b22a55c0c"
+SRC_URI[sha256sum] = "87d5e29ee1f18de153266ec658138607703ed2a05b3ffb1f89091d33f4abf545"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.4.17.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.4.20.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.4.17.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.4.20.bb
-- 
2.25.1

