Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.12399.1607820106621941240
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Dec 2020 16:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bne5aMKH;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id r4so6685057pls.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Dec 2020 16:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jhbfl0TRPa1xWm8EamuFHWEwZveXuPjqGmwwGPW9r3Y=;
        b=bne5aMKH5oWHPKd8gYVeFHAdiU+l+4WfVjxNtujYfFK3nLJCyPCLaexiXF4hRP0a0X
         wN2L9/OBbTp4Sa9eDWf50iCf7R6j942WSTuwIAC9YLOzDjLmkWnB1Jt2GBP+GT7JahUJ
         r4ei+fjE0Apd/QYHOf1NP/UHYRkjHZRhWEk3i3pl/V9QO3KOJMCPVXm2iU8zz/P7S0fD
         e1s0hsKJVduBhNRhgVPMGTI6OKHZPgrvXP/tP1oxXbNOywB3SHF/dApfDWQ8lC0NJnFb
         kDu7o0zbbQgmsJW0R0z1FJwr9zVTA0krep0RTjrPevjp+EQB9w3Nz+GFzX2XjSPqcm1r
         cMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jhbfl0TRPa1xWm8EamuFHWEwZveXuPjqGmwwGPW9r3Y=;
        b=RWMqi2IwO73yoR3CoVXHasq/yiwLH6fmpth4CAEzNJLA0AmfYBMu03IJm2aGsCO2LQ
         IjRFc3u3hWWZ0gmkAMBmB6eF4rBCsltSgI+J7Mqnuu45xl0ndOHYyWm4OAQKJaNl362a
         IINPaogiXAqnMa/ryTdz6LygGXH6UKsxmbmK7kHDqaJ/GiH/QVvOuo8zaTX++Q4y4NAj
         HEQ7e8QhyixY89VLm279Dboh3qo5BOiq6tB4vLj3luKQ7OHJ3kT5XnftyoIXwfpV1A9/
         GAl0xCTPqthqz/bnUxiBoijP2kDo+WELcN3BhpV2em8L0H3vrp5w3jH8iwDKgrBCqHiR
         j9WA==
X-Gm-Message-State: AOAM5306BnKhiVb5a0H9d4O670qysUR65GgF3LJA1dMhuh+UQ1yude9r
	UBXDogjZYxrFyqrAAwOIjnc5NmWJhD8iRw==
X-Google-Smtp-Source: ABdhPJxa1Lu15edUwFv3GQct+edZqZCY8NLs6dLFjzR3STBZcUz7ohXCxHU2cu/c8FtNIif9v7g44A==
X-Received: by 2002:a17:902:6a87:b029:da:e253:dd6a with SMTP id n7-20020a1709026a87b02900dae253dd6amr16910525plk.81.1607820105841;
        Sat, 12 Dec 2020 16:41:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5bf5])
        by smtp.gmail.com with ESMTPSA id o123sm8503469pfd.197.2020.12.12.16.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 16:41:45 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH v2] networkmanager: Fix reallocarray check in meson and configure
Date: Sat, 12 Dec 2020 16:41:43 -0800
Message-Id: <20201213004143.3509533-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Also fix the check in autotools configure.ac

 .../fix_reallocarray_check.patch              | 27 +++++++++++++++++++
 .../networkmanager/networkmanager_1.22.14.bb  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
new file mode 100644
index 0000000000..0a8de54106
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
@@ -0,0 +1,27 @@
+reallocarray() is coming from stdlib.h which maybe indirectly included
+by malloc.h but not on all libc implementations
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/meson.build
++++ b/meson.build
+@@ -114,7 +114,7 @@ config_h.set10('HAVE_GETRANDOM', use_sys
+ # FIXME secure_getenv check is not useful?
+ config_h.set('HAVE_SECURE_GETENV', cc.has_function('secure_getenv'))
+ config_h.set('HAVE___SECURE_GETENV', cc.has_function('__secure_getenv'))
+-config_h.set10('HAVE_DECL_REALLOCARRAY', cc.has_function('reallocarray', prefix: '#include <malloc.h>'))
++config_h.set10('HAVE_DECL_REALLOCARRAY', cc.has_function('reallocarray', prefix: '#include <stdlib.h>'))
+ config_h.set10('HAVE_DECL_EXPLICIT_BZERO', cc.has_function('explicit_bzero', prefix: '#include <string.h>'))
+ config_h.set10('HAVE_DECL_MEMFD_CREATE', cc.has_function('memfd_create', prefix: '#include <sys/mman.h>'))
+ 
+--- a/configure.ac
++++ b/configure.ac
+@@ -82,7 +82,7 @@ AC_CHECK_DECLS([
+ AC_CHECK_DECLS([
+ 	reallocarray],
+ 	[], [], [[
+-#include <malloc.h>
++#include <stdlib.h>
+ ]])
+ 
+ AC_CHECK_DECLS([
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
index 2613076a7e..aa8ab899bb 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
@@ -27,6 +27,7 @@ SRC_URI = " \
     file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
     file://0001-install-firewalld-to-var-libdir-rather-than-hardcod-.patch \
+    file://fix_reallocarray_check.patch \
 "
 SRC_URI_append_libc-musl = " \
     file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
-- 
2.29.2

