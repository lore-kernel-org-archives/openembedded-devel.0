Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.14556.1627188763655828327
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jul 2021 21:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L7CwH2Es;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so14878138pja.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jul 2021 21:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KUe/RIe0QaUZS3EWMG0I+yUki3m945tQMLMOf5h01Yc=;
        b=L7CwH2EsCBTWFalQ1yhH/Tp4LcIw5XIX7XeGqSYuYnzuVvri1Q5+dWFuZ4K7+yM/19
         7X8T+/g8d18crnU3JCPurzrLs2I5ScCbZtYF7GSDkSBtWJj4GGp7Xf43i6bzOhRusdJe
         Zw/zppDEqarUiGWofofgqNfrcfjytuU00XU3NQu0aoi0G8kEryFZ2rERtv6pjLP/4nGX
         +tjkcGRHKd9vCzj2OetgpD5Er0HT0fKR5atOO+PRB9PcfAuE5MybPIZ2ZAAgyTqsNG6M
         6hpFGQZln9q3xYFR95jJB26cxT39vBuy3IoBg1OObBiDzNiH9d67BgZ3FlHeSvzEHlhE
         CTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KUe/RIe0QaUZS3EWMG0I+yUki3m945tQMLMOf5h01Yc=;
        b=Tkp81yaG5cvJDil2uGD6H2As0LWrvmq5n82aUnq9LaWZOV1W05gz/QbWy4V0M+/04O
         uB93Ia9m48UWZodoy9xaIH9UqH7DFqQg0hF/p1j2o085fSnXdzyFrIk07M8Bgw9MAJ0d
         ke+flHpTkHoUY60icegXxHYMaQtoZ1duUa0sTOFxmUsJC6UYy/eExbyDN2yuzBBbqBTi
         0tqKAPZvZptihOWGO7fzFGc7My2RRHLiVESeVKB62elNTY863BdLSJarN/ekN5/J5iO+
         i8hDJSHkUq5WT1CvhFNSPL15c6OBLTFN1ZXp+Bq2bH6hVI/WWgg+lbbMlC7XXR87blHC
         vo7A==
X-Gm-Message-State: AOAM530st8Cq0sFEuel4Kz0NM6zQxJsXC9AfkRJkf8DDrZXWpw2PVXpR
	JzPi0rjSwtXEYjhe1RrtBB/JBu5qN4qdfA==
X-Google-Smtp-Source: ABdhPJyJT4wTgxDyjbvJvI0U8LeiX5VwXdLe57abRd274tnyRYMk9xerpVBRD+9ur6sY6bQ1k8ekeA==
X-Received: by 2002:a65:6187:: with SMTP id c7mr12163716pgv.349.1627188763144;
        Sat, 24 Jul 2021 21:52:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:d2f1:9af3:9c5d:7e26])
        by smtp.gmail.com with ESMTPSA id t10sm43368804pgv.52.2021.07.24.21.52.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:52:42 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 13/15] mariadb: update to 10.4.20
Date: Sat, 24 Jul 2021 21:52:19 -0700
Message-Id: <3434c737b6d363a4c45a24f7660ff4fc8ed2a677.1627164868.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627164868.git.akuster808@gmail.com>
References: <cover.1627164868.git.akuster808@gmail.com>
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

