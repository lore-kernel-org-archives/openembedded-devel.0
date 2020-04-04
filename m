Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.6591.1586035570220439077
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 14:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id a6so11251830otb.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 14:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=goy40NuA14fWkCrGByKN4/6impGm7LQD4OBBShogcro=;
        b=b/bnyZg+j949IQuOY+XvDD5ajw/ieHSCLwQBtJdbpYG979GO2P5IkB/ggM7ipLyl4T
         4eJFKcqlJGlcJeyhn4Pg5HhdX6oSlOC0hJT+9uxGVBfxXHmGWvvZB6kjU9sLcUu6E8j0
         rJYExdWih+stRH3Lp4dWhCcDfcjfUeqM5wSzQGymgOChwkzn0VbxZJRlRQJb3T95Opbi
         +Iv5yrEZTSRMVXmktTJES+rLJYcyehBAcvWyjX1WeWggbxT3GYHvMfltJtX+8U1IQz4w
         ms96EYxDT+l3TGm54tQbahROxzT0L8irEtalEkdjQsYHKPqCqZQiRbkUl82N4Hzg0m99
         JSmQ==
X-Gm-Message-State: AGi0PuYiiiM2mM+A6nmQDzRBv42zbxDR0CDeVd8PKVi0QYMqlcaMcsjK
	DOdZQvUpDC0WBjw3D8f4rURidEslnMc=
X-Google-Smtp-Source: APiQypK7h+XnX+BT/GH4knW2KK3ze8PqHxmtf/K6vz5a3i3BMV2eAkxvppM8tYehsvSCPHKbTsOZ7Q==
X-Received: by 2002:a4a:8041:: with SMTP id y1mr11636013oof.65.1586035569313;
        Sat, 04 Apr 2020 14:26:09 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id g72sm3183470otg.79.2020.04.04.14.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 14:26:08 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 3/5] python-pystache: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 17:25:58 -0400
Message-Id: <20200404212600.25018-3-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404212600.25018-1-derek@asterius.io>
References: <20200404212600.25018-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pystache.inc => python3-pystache_0.5.4.bb}   | 2 ++
 1 file changed, 2 insertions(+)
 rename meta-python/recipes-devtools/python/{python-pystache.inc => python3-pystache_0.5.4.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python-pystache.inc b/meta-python/recipes-devtools/python/python3-pystache_0.5.4.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python-pystache.inc
rename to meta-python/recipes-devtools/python/python3-pystache_0.5.4.bb
index 6dbc99f530..feb4986109 100644
--- a/meta-python/recipes-devtools/python/python-pystache.inc
+++ b/meta-python/recipes-devtools/python/python3-pystache_0.5.4.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb4417802c56384aac71b34505528a60"
 SRC_URI[md5sum] = "485885e67a0f6411d5252e69b20a35ca"
 SRC_URI[sha256sum] = "f7bbc265fb957b4d6c7c042b336563179444ab313fb93a719759111eabd3b85a"
 
+inherit pypi setuptools3
+
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-netserver \
 "
-- 
2.17.1

