Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.44995.1585551078181174771
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 23:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ct0eIpXP;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id j17so13154798lfe.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2020 23:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uu09iaLjFU6Sf0AhP+SKXo1xIU66jQlBL9wlIvr3oH8=;
        b=Ct0eIpXPrfvEHTpJQPNDRUpX3nkAyW3Z79/sFw4b2Wz72bQngeUIwt7WRlXJWm9b3J
         tXgt1AOnkOzZmsRB6WVZqDHcNDbsHf8UgwsJ8tsdo3sQfODMeqQHOs4ER1CYnt2wyn4J
         hnkFZc7KCLzBXbaferYNAqQJovD4GS0It1xyb7QpsOmjYZIGwW8AYytC50x0WeYQccCa
         iKnRkh2sxS4P6focR4WXJo+YcTg/s/MqnyyDcKwLj/Q+7/uxKLBC53cEKAJhGZSdi4PS
         SCkEqdLsPaRLQUPAZEGwq1o7RiE6VfpXbloWSUVmVRYSIIwPvkNqBwKr3447Z9Te0u8U
         rqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uu09iaLjFU6Sf0AhP+SKXo1xIU66jQlBL9wlIvr3oH8=;
        b=C7hUcqzMFO535lOK/wejZWyt9FqNGGR0RdnutyjDaHgOJMFpnKdQpHxpWLQQYPZCT7
         kY/Vh+h95iuKg8sTok6OEzgxr7hZHcfOtwaYB+RPL7BWJx40sHlzurJMdh9LDaHmrG8z
         E5f3sYG1dUznQklv8qd6f/4dyd2jY9vngApj/MqMYYxq4X7VRTgTMcQ1Kcu17TUL5557
         3rsS41MR+WkErsQzkChOY/6xS0yv3soaFggkIGIl+oesiGA0ikIUFC19nbjFWvfWSzn/
         NayMU/4Y5FvCCmH8uLRYEifVWtNTXs/+sxM5ArtbNL/bBEEaJrwxWonjPdtoFlzDxwzf
         OwCA==
X-Gm-Message-State: AGi0PuaQq1QKIbaqnuMqUChTRSacdBof82wIoygVSLYoR1ShsswO3vf/
	HkbALSet0xq+4TVK1xCoxyPCZxLT
X-Google-Smtp-Source: APiQypIASvTQzl8shhyGA8sundqA/LYIb85ejPUNmnm5gnuc1RypkiZvTkTBkE5960KqYxu+Lhu+LQ==
X-Received: by 2002:a19:be94:: with SMTP id o142mr7045164lff.13.1585551075796;
        Sun, 29 Mar 2020 23:51:15 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id b193sm7228993lfd.74.2020.03.29.23.51.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 23:51:15 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java][zeus][PATCH] Revert "recipes: rename distro_features_check to features_check"
Date: Mon, 30 Mar 2020 08:51:00 +0200
Message-Id: <20200330065100.100833-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The corresponding changes in oe-core has not been backported to zeus.

This reverts commit d2e962a795e8713e5443659669842298453d938f.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 recipes-core/cacao/cacao_2d6f6c14daf9.bb      | 2 +-
 recipes-core/classpath/classpath_0.99.bb      | 2 +-
 recipes-core/jamvm/jamvm.inc                  | 2 +-
 recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-core/cacao/cacao_2d6f6c14daf9.bb b/recipes-core/cacao/cacao_2d6f6c14daf9.bb
index 0e50b68..6783894 100644
--- a/recipes-core/cacao/cacao_2d6f6c14daf9.bb
+++ b/recipes-core/cacao/cacao_2d6f6c14daf9.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/cacaovm-cacao-staging-${PV}"
 SRC_URI[md5sum] = "5157d0bb9eb1332f7a6b6186eaac01aa"
 SRC_URI[sha256sum] = "34b51d660d69c2a83225fd75eab5e1fac002fb5974cb4a74b7478baf923a76cd"
 
-inherit java autotools-brokensep update-alternatives pkgconfig features_check
+inherit java autotools-brokensep update-alternatives pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 REQUIRED_DISTRO_FEATURES_class-native := ""
diff --git a/recipes-core/classpath/classpath_0.99.bb b/recipes-core/classpath/classpath_0.99.bb
index 5b9d904..714503a 100644
--- a/recipes-core/classpath/classpath_0.99.bb
+++ b/recipes-core/classpath/classpath_0.99.bb
@@ -1,6 +1,6 @@
 require classpath.inc
 
-inherit features_check
+inherit distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index b03a5b9..d47b2f1 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -15,7 +15,7 @@ RPROVIDES_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
 
-inherit java autotools update-alternatives pkgconfig relative_symlinks features_check
+inherit java autotools update-alternatives pkgconfig relative_symlinks distro_features_check
 
 REQUIRED_DISTRO_FEATURES_class-target = "x11"
 
diff --git a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
index d774cc2..cb670cb 100644
--- a/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
+++ b/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 FILESPATH =. "${FILE_DIRNAME}/patches-openjdk-7:"
 
-inherit features_check
+inherit distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.25.1

