Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.6592.1586035571131074851
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 14:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id g23so11293516otq.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 14:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5tOtqmkCnatzLdDUcqmz2ZaSF2S9Eao3XcRDQitjoZI=;
        b=GfsjqHDgKnLveqcjMsFRPIOxuWPTKjuq+I713yZUX/sK/C6JkWc9Lqbt7IIQ//nnGr
         ZaE6OXtzjJPwQz1LMThRR+iEDiD5VfGw3OlXO0tx0/lEaD7Y2IYVui0hg89duCX6ii4H
         t2kWLzlxSOpxbKNuawOoBaLs1uX/2zFokusQO687jhW6TICUmxyl4xzZfWZKV15yTUKM
         wf3wUX6DOgJ5TP694gxSnv7EPRxKIGJKpY532PrhdOPliYeiJCJxtX6RzGNRBms71OoJ
         7hVk8/5DBUIlio0e7ehQus0q6PfWuV2UOR9K6Gouf9BvLCu4TFLBSuBghabf30u78DKi
         VXeA==
X-Gm-Message-State: AGi0PuZp61HiNH/N7PltD39uzsEKi+GaXaufjmZjSGP0MkchOv14CYcA
	94UcBv/f+KGKen6v1BardLGtZnTTOog=
X-Google-Smtp-Source: APiQypJgcLjxA3fi2NG+C/PyRriyBbjZ8DKGMqr0OkojGi/ltV/iY61iekxnslIK6bpISU7XZ4V6WQ==
X-Received: by 2002:a4a:e047:: with SMTP id v7mr11743115oos.49.1586035570197;
        Sat, 04 Apr 2020 14:26:10 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id g72sm3183470otg.79.2020.04.04.14.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 14:26:09 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 4/5] python-pysql: Remove package incorporated into standard library in python 3
Date: Sat,  4 Apr 2020 17:25:59 -0400
Message-Id: <20200404212600.25018-4-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404212600.25018-1-derek@asterius.io>
References: <20200404212600.25018-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-pysqlite.inc                 | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pysqlite.inc

diff --git a/meta-python/recipes-devtools/python/python-pysqlite.inc b/meta-python/recipes-devtools/python/python-pysqlite.inc
deleted file mode 100644
index 884556570d..0000000000
--- a/meta-python/recipes-devtools/python/python-pysqlite.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "DB-API 2.0 interface for SQLite 3.x"
-HOMEPAGE = "http://github.com/ghaering/pysqlite"
-LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=28ad4f115e06c88bd737372a453369d8"
-
-SRC_URI[md5sum] = "033f17b8644577715aee55e8832ac9fc"
-SRC_URI[sha256sum] = "17d3335863e8cf8392eea71add33dab3f96d060666fe68ab7382469d307f4490"
-
-inherit pypi
-
-DEPENDS += "${PYTHON_PN}-pip"
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-datetime \
-    sqlite3 \
-"
-
-FILES_${PN}-doc += "${datadir}"
-- 
2.17.1

