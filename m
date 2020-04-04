Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.8634.1586006959762280918
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 06:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id r19so10350792otn.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 06:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Zxqo5icRwxQL3g1Udc3E3EG262LvWgTUeIpeIqFqiec=;
        b=PCxSyZzVN+eQeGDbRXfKzhgUOgzZHJfGTnn6yjRI51uOsIqKm6Tfj0d7JelY9DjF2I
         o1eVTxZbb17+qthUhCImTFenc/fDmR6TvrqxPHoYF5Yn2RO9ZDqt6LZw6O89Pz1cMTLH
         m3f1BcNO98oGaH+CUBUu9bqRgceKhMjtdt+8e35DBzQIZgGr3DaAEUDbmZCywZHON+sL
         /WJiy+PWObGK0vHIlTL4Zg5aX6u+nrNi5YpdsQkEBB07+En4OtVCyKSft/ZdrXM0y+1M
         ilSOx0QVApUAyLOgBO9VcfTZukPiWT0obXGDOSFh2NAHJC/SqEqdwvzCMKwwm3voXZ93
         h2mA==
X-Gm-Message-State: AGi0Pubp6E4Rj1RclDWhuYkLDj1u25GJUjyOO01tExqN14yxR0jVA+K5
	z3lj0b72S/YdPgoZ0RJ2aeosEwHXZfM=
X-Google-Smtp-Source: APiQypJcggc5Pgl6Hl5/X+IE4Y5mS0Q+W/n/freyeFMoVIaN6Qnng+lhQfIUyifgQagZ/ozn63Nwbg==
X-Received: by 2002:a4a:aece:: with SMTP id v14mr10440715oon.48.1586006958606;
        Sat, 04 Apr 2020 06:29:18 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id t17sm2813013oof.43.2020.04.04.06.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 06:29:17 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 10/11] python-twofish: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 09:28:45 -0400
Message-Id: <20200404132846.16832-10-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404132846.16832-1-derek@asterius.io>
References: <20200404132846.16832-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-twofish.inc    | 13 -------------
 .../python/python3-twofish_0.3.0.bb               | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-twofish.inc

diff --git a/meta-python/recipes-devtools/python/python-twofish.inc b/meta-python/recipes-devtools/python/python-twofish.inc
deleted file mode 100644
index 79ab285e55..0000000000
--- a/meta-python/recipes-devtools/python/python-twofish.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Bindings for the Twofish implementation by Niels Ferguson"
-DESCRIPTION = "Bindings for the Twofish implementation by Niels Ferguson\
- libtwofish-dev."
-HOMEPAGE = "http://github.com/keybase/python-twofish"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=33a63abf6d7567b1689d8ce69f00e43b"
-
-SRC_URI[md5sum] = "d7d22f16dc4ffa0e3ae2200654033abe"
-SRC_URI[sha256sum] = "b09d8bb50d33b23ff34cafb1f9209f858f752935c6a5c901efb92a41acb830fa"
-
-inherit pypi
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb b/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
index 7b8eb2ef0f..94fb71090e 100644
--- a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
@@ -1,4 +1,15 @@
-require python-twofish.inc
-inherit setuptools3
+SUMMARY = "Bindings for the Twofish implementation by Niels Ferguson"
+DESCRIPTION = "Bindings for the Twofish implementation by Niels Ferguson\
+ libtwofish-dev."
+HOMEPAGE = "http://github.com/keybase/python-twofish"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=33a63abf6d7567b1689d8ce69f00e43b"
 
 SRC_URI += "file://0001-Fix-missing-return-statements-in-module-stubs.patch"
+
+SRC_URI[md5sum] = "d7d22f16dc4ffa0e3ae2200654033abe"
+SRC_URI[sha256sum] = "b09d8bb50d33b23ff34cafb1f9209f858f752935c6a5c901efb92a41acb830fa"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

