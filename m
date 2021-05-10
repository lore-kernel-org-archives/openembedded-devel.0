Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.30704.1620647055142750657
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 04:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RV0tybOI;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id g65so9002435wmg.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 May 2021 04:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g/Dccjv/prqNv1bmY44kpevZP4R5w2/VA/AiEDuYxho=;
        b=RV0tybOI0s5+OT7+3D0qXs7wCIWnDy7m2ufMn3vrTf2mgsmIdp7fQ3su3wxQ4HN73I
         6fATDwDSQRpzFywbYuJGemxFuRF4IssY6esk5ZaGLxIgSFRKNBEgoPkSCAVcwySavKT6
         7Yx/g0GXotVedS9j3pLh6+wkEi1riNJk+i2tLTDfsUHVwZULcS6dyCNV1NqSxi2aTx2Y
         AY6T754H5W+EoGVaIYRo5mEGoldbnryvJBGvusePDONekI3b9N1UaCapJ2jeIKDY56En
         IP1AlMQuw7OxmYEQE7zJrwWVwxKcWR8lZvNwhRYNv+26JF1MJdIEb2eI82mbQQymyUAm
         zFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g/Dccjv/prqNv1bmY44kpevZP4R5w2/VA/AiEDuYxho=;
        b=ek3vvvNhKGJ5z0q/wRBC5Uy5k9Uv7ZzzdvVKRCkSi3gEJZzEt3q4s9zTXtPmi4IdSb
         bOOV+MNx3lflw6R+BJtUxgT3vFj/vpj7MFlTSu9+P8Sx0TGeWYO5NHJHeegfp/MOV4gK
         c3e7CnBMYLg6TvvKTcHoRaODdxwSYaKd2WHV8KMp7rJws/LW44syF2nPM+n5Lgky9QO9
         W4Bu7Ao0Qy0sHlaG6oRMiQYW/UlK8k6Rs52ZDe6J6IQxJstZFY1VME/b2SnrK3kp0GBy
         +sVT7DhXFLIiBNqy0pDpGKmZCgsuuwkxxiQcNbug26sX7ev1PgibsXndrtnM7EbtQ/1l
         Ubvw==
X-Gm-Message-State: AOAM533M69XbTeAgP7mcc7pkoAGBf8RRttf2KyIaMJPzmbvyVhVBfUxJ
	daUzGTkexkYhaOtWms8pb8MZE2D7uAE=
X-Google-Smtp-Source: ABdhPJzYafHE4YJYcV9TzVjfES/fpoKVTOfQKGKuTn6+fToBMVqlrB6LW9gw6wCpOsyjQp3+H8q1Cg==
X-Received: by 2002:a1c:6a04:: with SMTP id f4mr24981744wmc.131.1620647053349;
        Mon, 10 May 2021 04:44:13 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f4fac346ac282ef7d435921.dip0.t-ipconnect.de. [2003:f0:7f4f:ac34:6ac2:82ef:7d43:5921])
        by smtp.gmail.com with ESMTPSA id r7sm3170425wmq.3.2021.05.10.04.44.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 04:44:12 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] mariadb: Fix configure
Date: Mon, 10 May 2021 13:44:04 +0200
Message-Id: <20210510114404.4039335-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Assume recent CMake upgrade made this pop up.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...onfigure-by-closing-IF-ELSE-properly.patch | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0002-Fix-configure-by-closing-IF-ELSE-properly.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 9833b2885..92e54d759 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -22,6 +22,7 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
            file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
            file://sys_futex.patch \
+           file://0002-Fix-configure-by-closing-IF-ELSE-properly.patch \
           "
 SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0002-Fix-configure-by-closing-IF-ELSE-properly.patch b/meta-oe/recipes-dbs/mysql/mariadb/0002-Fix-configure-by-closing-IF-ELSE-properly.patch
new file mode 100644
index 000000000..36c74d8f9
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0002-Fix-configure-by-closing-IF-ELSE-properly.patch
@@ -0,0 +1,35 @@
+From fdd08a8774265618668c7f24697e138587c47a16 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 10 May 2021 13:35:54 +0200
+Subject: [PATCH] Fix configure by closing IF ELSE properly
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+| CMake Error at libmariadb/cmake/ConnectorName.cmake:30 (ENDMACRO):
+|   Flow control statements are not properly nested.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ libmariadb/cmake/ConnectorName.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libmariadb/cmake/ConnectorName.cmake b/libmariadb/cmake/ConnectorName.cmake
+index b7bbbad..357b8ac 100644
+--- a/libmariadb/cmake/ConnectorName.cmake
++++ b/libmariadb/cmake/ConnectorName.cmake
+@@ -22,7 +22,7 @@ IF(CMAKE_SYSTEM_NAME MATCHES "Windows")
+     SET(MACHINE_NAME "x64")
+   ELSE()
+     SET(MACHINE_NAME "32")
+-  END()
++  ENDIF()
+ ENDIF()
+ 
+ SET(product_name "mysql-connector-c-${CPACK_PACKAGE_VERSION}-${PLATFORM_NAME}${CONCAT_SIGN}${MACHINE_NAME}")
+-- 
+2.30.2
+
-- 
2.30.2

