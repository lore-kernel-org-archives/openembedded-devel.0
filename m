Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.7453.1598942840751431880
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 23:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DpLFX24Z;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id p37so180357pgl.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 23:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pfpwe1Wyjsocu9P2mKgtiAymV3ciU7EowGeycHcVSnI=;
        b=DpLFX24ZNGACRCnZPGHJioh+H621MIQIbgSgq21VIx7OFrFt9QaRdaqrY2pNXqnWRG
         /08RYVq91lRFL67fOxm42ivoQSZ5fUBav797zemTs/H7vqGTo0sigKiwFgDh0aQHOlIq
         eqQnxebj7PY3yZOKMG7nxfbBsfE67kLVoSLuZuYL3NVBnNd2Ip4LqOhJGp4v4ntDh7ls
         /yE4ZOHP77mxqTnY36ZQC7K2u/W/p89bU/gJJoxCvdF4i2Kc1jVkHtuC0S1OVZPY7OxU
         ORR5jNanR9gV4OxvsZB4UccYQh+PHZ7BQv2NLCmoakh15vDiEFgYruDCiJFdqtL+wYpI
         chQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pfpwe1Wyjsocu9P2mKgtiAymV3ciU7EowGeycHcVSnI=;
        b=SljB0kCinxu0hAXQZ044/67I3A68w8FSqy9eKVDW50LUtac0eFttdwOiUKueYIqvLt
         8beO11wZa2MKYTGgiwIitKN2IUQCqpCgPnkXlUpIztfjdo69uO67KLxKGdazEugSIvVw
         0RwbcR+hvfKnbH29qjtBLdUIAXM3MX+od4V5KJUtv29LyKieBRqW/Vii11WvqYIcLqbT
         Y4hiCeOl1gEtf/u5CNOryXLfnv+DCjhv1osIvhvSumBN0JBX+eZ537Aq+qCRD6YU/35h
         exNUqsetM3LUOyIK3q3T5Rwb/TRfvz9pqTfpOHw4CIsyqVXERegVl4rAvCZfJk8VEdaB
         EMjQ==
X-Gm-Message-State: AOAM533dWfnbijGYgBmZ/1VCfZjyjvUalP9CueQYxKXdlBC8Jmal/Uwh
	wlkeYrysVV+Al4jsdUpZt221VITMzMTwxA==
X-Google-Smtp-Source: ABdhPJyQXT4X0EqZ7CPnN1UvKteuahgTKxg2Z3n3UZqO5WkD38wkTnL2/EXM9s6q+CFqT7qFvVTICw==
X-Received: by 2002:a05:6a00:2b1:: with SMTP id q17mr503619pfs.74.1598942839924;
        Mon, 31 Aug 2020 23:47:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id a13sm778384pgn.17.2020.08.31.23.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 23:47:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 2/5] packagegroup-meta-webserver: Update to include new recipes
Date: Mon, 31 Aug 2020 23:47:11 -0700
Message-Id: <20200901064714.2206751-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901064714.2206751-1-raj.khem@gmail.com>
References: <20200901064714.2206751-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Re-organise to have one entry per line

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroup-meta-webserver.bb            | 29 +++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
index f5d5debe11..e3e68582c1 100644
--- a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
+++ b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
@@ -19,20 +19,31 @@ RDEPENDS_packagegroup-meta-webserver = "\
 "
 
 RDEPENDS_packagegroup-meta-webserver-http = "\
-    nginx monkey hiawatha nostromo apache-websocket \
-    apache2 sthttpd \
+    apache-websocket \
+    apache2 \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "cherokee", "", d)} \
-    "
+    hiawatha \
+    monkey \
+    nginx \
+    nginx \
+    nostromo \
+    sthttpd \
+"
 
 RDEPENDS_packagegroup-meta-webserver-php = "\
-    phpmyadmin xdebug \
-    "
+    phpmyadmin \
+    xdebug \
+"
 
 RDEPENDS_packagegroup-meta-webserver-support = "\
-    spawn-fcgi fcgi \
-    "
+    spawn-fcgi \
+    fcgi \
+"
 
 RDEPENDS_packagegroup-meta-webserver-webadmin = "\
-    netdata webmin \
-    "
+    cockpit \
+    webmin \
+    netdata \
+"
+
 EXCLUDE_FROM_WORLD = "1"
-- 
2.28.0

