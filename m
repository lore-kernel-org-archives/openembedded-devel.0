Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.1575.1586020391836111758
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id c9so10744746otl.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3YXnpPRU7bV+warlSPtKgeq60zyWtLUQeU+t2lNkLUw=;
        b=FuVT6VejPTrH0lfLNRwLbnH6z/QbDwrfIj/FAfIEcuodmF/1OtEOKkrec94X6zZ28M
         +Dpawu+tQvX70xsKQmwdx6Cy21J3m4zfsHp88UIZZRlKb5D+gGsOwpHMBfFWKh2iAnPD
         EDsefa2fWVGvdpmUYeF9gKzSPNR+H+jqWyWYA9oh/3H/jtYTGjaB4MPz+nM9HTt+cuHh
         4JsePt4bFdb2/w/8vp0ZU4Mk7axgSojGepa6MJd4PJsme/SbpTFMYAZ4HAxzCW77fvFh
         VMkYAA57E4rFV4EUuRoHBgLfccgYzW36tzm/5xMlkL+7wLn5k3llISlLRnyCm2Tq+al6
         eFlQ==
X-Gm-Message-State: AGi0PuYDl2U5YqTkRFZmfW3Gg+0F/u26eTjAGD+Z5M6YHIiVWxH/2gBM
	EZ69+eT/NO4qpxqM+F4+hL0eKLXA/u8=
X-Google-Smtp-Source: APiQypLzKXMNVEZcYIz/Shp1czEx2GZ0xMde4NZvK3YMGy4UKeGLNXI7XTyevl6y/LK900WLURbYYw==
X-Received: by 2002:a9d:62c2:: with SMTP id z2mr11750001otk.155.1586020390672;
        Sat, 04 Apr 2020 10:13:10 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:10 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 03/27] python-toml: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:27 -0400
Message-Id: <20200404171251.19823-3-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-toml.inc  | 10 ----------
 .../recipes-devtools/python/python3-toml_0.10.0.bb   | 12 ++++++++++--
 2 files changed, 10 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-toml.inc

diff --git a/meta-python/recipes-devtools/python/python-toml.inc b/meta-python/recipes-devtools/python/python-toml.inc
deleted file mode 100644
index a3b3dfc862..0000000000
--- a/meta-python/recipes-devtools/python/python-toml.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Python Library for Tom's Obvious, Minimal Language"
-HOMEPAGE = "https://github.com/uiri/toml"
-LICENSE = "MIT"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6d6012eea477117abf51c31262a152f8"
-
-SRC_URI[md5sum] = "63fffbe2d632865ec29cd69bfdf36682"
-SRC_URI[sha256sum] = "229f81c57791a41d65e399fc06bf0848bab550a9dfd5ed66df18ce5f05e73d5c"
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb b/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
index cebb41a533..5a7b04c9e0 100644
--- a/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
@@ -1,5 +1,13 @@
-inherit setuptools3
-require python-toml.inc
+SUMMARY = "Python Library for Tom's Obvious, Minimal Language"
+HOMEPAGE = "https://github.com/uiri/toml"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6d6012eea477117abf51c31262a152f8"
+
+SRC_URI[md5sum] = "63fffbe2d632865ec29cd69bfdf36682"
+SRC_URI[sha256sum] = "229f81c57791a41d65e399fc06bf0848bab550a9dfd5ed66df18ce5f05e73d5c"
+
+inherit pypi setuptools3
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-misc \
-- 
2.17.1

