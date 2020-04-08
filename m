Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web12.3091.1586307260655028009
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 17:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RIXgaj81;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id f206so1607404pfa.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2020 17:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KqUkyCDj9ZOCBPY3N8vjvqQNTkrzlfS7Z5wzeX5GQoQ=;
        b=RIXgaj81SyDWa0lc1zMeSyEpzm4dtfYe/xo0zWtbh8/rUVrTUD/28bVZWRbr/9zR84
         sUJW0tmaIhAATZja0mlTBr5919PKd7vdzC+Pzg7fbRfwifs4L+ksDnVDE7LvrkQyectz
         CBLXVfPLP39lfZ29Scre7k6vEuAwfS/bpPuTSyUvN7xd3VT2UuwFMyWCObxbSj3IthmZ
         hbsSHxW99OY0f1kh5xzaxpFc57PSkmPAmjVPVZAB5UqvvmcATtTvaz2g0+38/4G9m9YX
         wpxqTTGPj+4Q/kpM+XNC3QvwW2wMNNkTdIm28cBfdW5Y98556rVfGvM0OZqZs2w+bkmv
         w0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KqUkyCDj9ZOCBPY3N8vjvqQNTkrzlfS7Z5wzeX5GQoQ=;
        b=T/aod6pdViv7Mg0paI9ID2kTqtzHsJ4iuXPanb96Plg0cv/ej+9urTywunGgFsivAq
         v/cLMgYZy9IeSMBJg6jUqTNpCk8RFMvFrntPQpdZ6MDvtLEA7d9kKHRUwr8H8trfeyXM
         rOB1uzxrBevfudAIYypExh7jIWPXME55GJC3xk+qwvQAGhTIt7L11zjlpg8c3uG8hLYd
         ad9NvhgppI91fIdBgDmuIZ+U7abxph/l/51bY8W08j7yhvOpCSDhDjnTJOZ6jhINBZY+
         W1GJT3qGgG0BMuE+OL7k8P6ctz0wT6WEcGOoaEK7Zpmclgk16IEn+swNybK0kFH039Db
         HvDA==
X-Gm-Message-State: AGi0PuYssnUznvcq9Q0Gj91VkrRid4HTT+Lw7au8asvsxSmwIBkCV+6q
	/Ybuwm7Wnf57JqQ9kPb3bZXxvzlUfQo=
X-Google-Smtp-Source: APiQypK3O6u8UZ9hoyNNmaIxLM4LZ5zKJJ3zcjCqxMVlinOU2Dqy5hBqpquSF2JIw1axrlnO+Clyvw==
X-Received: by 2002:a63:34c9:: with SMTP id b192mr3309057pga.275.1586307259554;
        Tue, 07 Apr 2020 17:54:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::493b])
        by smtp.gmail.com with ESMTPSA id 6sm14033844pgm.51.2020.04.07.17.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 17:54:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] proj: Update to 7.0.0 release
Date: Tue,  7 Apr 2020 17:54:33 -0700
Message-Id: <20200408005433.1405755-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add dependency on libtiff and curl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add curl packageconfig and tiff dependency

 .../proj/{proj_6.2.0.bb => proj_7.0.0.bb}                | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-navigation/proj/{proj_6.2.0.bb => proj_7.0.0.bb} (62%)

diff --git a/meta-oe/recipes-navigation/proj/proj_6.2.0.bb b/meta-oe/recipes-navigation/proj/proj_7.0.0.bb
similarity index 62%
rename from meta-oe/recipes-navigation/proj/proj_6.2.0.bb
rename to meta-oe/recipes-navigation/proj/proj_7.0.0.bb
index fa269d01b3..44674244ef 100644
--- a/meta-oe/recipes-navigation/proj/proj_6.2.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_7.0.0.bb
@@ -6,11 +6,14 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74d9aaec5fa0cd734341e8c4dc91b608"
 
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
-SRC_URI[md5sum] = "5cde556545828beaffbe50b1bb038480"
-SRC_URI[sha256sum] = "b300c0f872f632ad7f8eb60725edbf14f0f8f52db740a3ab23e7b94f1cd22a50"
+SRC_URI[sha256sum] = "ee0e14c1bd2f9429b1a28999240304c0342ed739ebaea3d4ff44c585b1097be8"
 
-DEPENDS = "sqlite3 sqlite3-native"
+DEPENDS = "sqlite3 sqlite3-native tiff"
 
 inherit autotools pkgconfig lib_package
 
+PACKAGECONFIG ?= "curl"
+
+PACKAGECONFIG[curl] = ",--without-curl,curl"
+
 FILES_${PN} += "${datadir}/proj"
-- 
2.26.0

