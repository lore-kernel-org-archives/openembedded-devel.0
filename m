Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.40637.1585528305915423998
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 17:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e2W6Ezut;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id i13so7759650pfe.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2020 17:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iSRy/2dmJLCbqPtTp0y/U6yJ9iDF+qWndxXlHXpRCMQ=;
        b=e2W6EzutV0+mK8RuySLcKnWBoEVu5ERv7RSnIe2Zd0YvbghuIC/6Ku0/TaVLqLzA9o
         BAr61vmEvJ3aAFh3kqDL51yT/XCMiz1ILo3Kgz0zdkybk59axSI46zPu5dLA3i43jqzJ
         8g5oO1U6vmSkmsroaKBl1VMHaN4Y16Z2/L57BU/jA9Rn0RKWy5BuUL4FzulHnURRNHPV
         iW5lw5SSn6FODDntH6cfuFxmGBQegf6jlBOEkkG7Y7vkYqM7m0qb7uIk/I+WjsPO0Bh0
         ksEK3rw6viC70vmrME7I+PyCBk+ubk2UQyysRymsQamdyoZR8iqnuk16Q//VJDtut1tM
         OpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iSRy/2dmJLCbqPtTp0y/U6yJ9iDF+qWndxXlHXpRCMQ=;
        b=n7zlTySjwrdM8QEiBbIjvIK4MK721ON+5AZQu9oD1ymZZEkzT3NQ8FHQK5OnJeEBQi
         5JKAOK1fOoq563/ZYSSnax6qAO8g7v17U1sa22Lfgo5yacB3hT5Qn2gVfNbEObCM1drH
         u2Ld34eDpPSjjsHKCK+1wAZer4AFXd3YJLRD+oha+K8j9lOwGuwWETA3e/71DKF0D3Ry
         Ww9MQl6jZVm9wKpOq2B0lISX9KEpghJi6oboQVmnHiy8nsTkLp39wyCq1+529jDR2lf+
         Va/dJkHnKk+DQYNRgCdYUwOrlw1onUJz8l98wlPqHkldDZ/ywx1YQw45H0mXaYlgak/g
         V7lA==
X-Gm-Message-State: ANhLgQ2cLBFsZmVz7+I63uKKxLcBl50iXpQzIBNOxOwQLjsZp+WmiKdn
	oKEhZacNloFEsFwRhyGT9sn41EQpIIw=
X-Google-Smtp-Source: ADFU+vuvn0dj6y/ALQTG0D4DkNBDDaIf9EFa167OSK4mkDKknjx7kiDfAt3+uZCQSlx33s17iey7Hw==
X-Received: by 2002:a63:8948:: with SMTP id v69mr10285778pgd.318.1585528305029;
        Sun, 29 Mar 2020 17:31:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49c5])
        by smtp.gmail.com with ESMTPSA id i13sm4662317pfa.113.2020.03.29.17.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 17:31:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/6] tbb: Ensure that install does not race
Date: Sun, 29 Mar 2020 17:31:53 -0700
Message-Id: <20200330003155.1670457-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330003155.1670457-1-raj.khem@gmail.com>
References: <20200330003155.1670457-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes

install: will not overwrite just-created 'TOPDIR/build/tmp/work/core2-64-yoe-linux/tbb/20170412+AUTOINC+a2cfdfe946-r0/image/usr/lib/libtbbmalloc_proxy.so' with 'TOPDIR/build/tmp/work/core2-64-yoe-linux/tbb/20170412+AUTOINC+a2cfdfe946-r0/git/build/linux_x86_64_gcc_cc4_release/libtbbmalloc_proxy.so'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/tbb/tbb.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/tbb/tbb.bb b/meta-oe/recipes-support/tbb/tbb.bb
index f870104015..911139b0da 100644
--- a/meta-oe/recipes-support/tbb/tbb.bb
+++ b/meta-oe/recipes-support/tbb/tbb.bb
@@ -27,11 +27,14 @@ do_compile() {
 }
 
 do_install() {
-    install -d ${D}${includedir} ${D}${libdir}/pkgconfig
+    install -d ${D}${includedir} ${D}${libdir}
     rm ${S}/include/tbb/index.html -f
     cp -R --no-dereference --preserve=mode,links -v ${S}/include/tbb ${D}${includedir}
-    install -m 0755 ${B}/build/linux_*_release/lib*.so* ${D}${libdir}
-    install -m 0644 ${WORKDIR}/tbb.pc ${D}${libdir}/pkgconfig
+    for f in ${B}/build/linux_*_release/lib*.so*
+    do
+        install -Dm 0755 $f ${D}${libdir}/
+    done
+    install -Dm 0644 ${WORKDIR}/tbb.pc ${D}${libdir}/pkgconfig/tbb.pc
 }
 
 # fails with thumb enabled:
-- 
2.26.0

