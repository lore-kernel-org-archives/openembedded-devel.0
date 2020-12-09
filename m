Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web08.8720.1607528726516914434
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Dec 2020 07:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I3IQ+CEK;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: wickbergster@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id y19so3664406lfa.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Dec 2020 07:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qt/9984SY0OFxYrRj4sDiElho8cbr88bbLTTeroO/PM=;
        b=I3IQ+CEKr31rQT/ZzUQbKh24z2f3Bl6/T42yGTJ+z3OcOS2gNI58qLaXgcMkSFgX98
         sZIvJILJGSqzpsrU5iPntUaHHpXUyro7NcPb7Znn+cu9hvamqEMzERzJBDuO2ZfP9NCG
         Z5+esg0oO7ljkNSu7BsIqtB8MOw+bOFfWjYrF85bnHtKXHs41e2K7P8m5/lzqLLVVpPP
         vKWFP/ckXEXEt+2X51KMzjy3Gi00jfrxwVbTS1LQixcCGZpNq5ffP894gCrAfgMNqrMS
         UfFSqbqIAjCGi22KTrYH0KdoM2/cLMB495pCplZzSzKlTt9QwLfaYoP9utJv/0KHxDGn
         WNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qt/9984SY0OFxYrRj4sDiElho8cbr88bbLTTeroO/PM=;
        b=efUQG9GsJNOeY4YiKWiZCoUnzVhE4c/gSeuobK8KIHPnzqZ7l6lfB/EX+KUR0Km4GG
         iI6KyyPvNpMRdkB4FlLOiHTaqmHXFso0um3NwQRD/eAU2oQIiAVLYBJN0+b41JGFAatH
         qeNGtVRKwB+r0hbdfPlflVGl5jYuL2fnZr9hEmHAHYLHat4UKFnUE82lQjt0chKHPSH0
         FFvTnQQtibmiheRJnbdZGVkgeA8lMC+jAq9UyjrOgD6wpS4wjyzyE0i05p4EEkaX2fda
         SMLWz9w6E8LBNK5sg7g5aTt8k9es6wwD0U+YlJVteBoXXwSGHPmjYEPB1996RBqUa2oT
         O/Gg==
X-Gm-Message-State: AOAM532s2QLxGK0sePf/FvRvmaTwqcY0QWA/FSqWNpjnGnNGM9IfHIdB
	jTl0Tk3G/LVhXkTT0IJlgf6UJxeimLw=
X-Google-Smtp-Source: ABdhPJzE8onwiNuFRJJL74tTGZNYWE1xtnx64LSXMA59S1HnC5k/vNiM7EfpFik0P1QEjA1qyAVMwg==
X-Received: by 2002:ac2:4d14:: with SMTP id r20mr1105089lfi.226.1607528724293;
        Wed, 09 Dec 2020 07:45:24 -0800 (PST)
Return-Path: <wickbergster@gmail.com>
Received: from localhost.localdomain (dyn-13-cust157.netit.se. [85.89.70.157])
        by smtp.gmail.com with ESMTPSA id d12sm273372ljl.111.2020.12.09.07.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 07:45:23 -0800 (PST)
From: "Alexander Vickberg" <wickbergster@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Vickberg <wickbergster@gmail.com>
Subject: [meta-networking][PATCH] mbedtls: upgrade to 2.24.0
Date: Wed,  9 Dec 2020 16:44:38 +0100
Message-Id: <20201209154437.660870-1-wickbergster@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Download archives are no longer updated so fetch from Github. Add build
fix from upstream. The file LICENSE now contains the full Apache 2.0
license text.

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
---
 ...orrect-EOF-check-in-ssl_context_info.patch | 57 +++++++++++++++++++
 .../{mbedtls_2.16.6.bb => mbedtls_2.24.0.bb}  | 10 ++--
 2 files changed, 63 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/fix-incorrect-EOF-check-in-ssl_context_info.patch
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.16.6.bb => mbedtls_2.24.0.bb} (83%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/fix-incorrect-EOF-check-in-ssl_context_info.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/fix-incorrect-EOF-check-in-ssl_context_info.patch
new file mode 100644
index 000000000..836fce91e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/fix-incorrect-EOF-check-in-ssl_context_info.patch
@@ -0,0 +1,57 @@
+From d696e7d91e42a190d06760279d2e396392143454 Mon Sep 17 00:00:00 2001
+From: Nayna Jain <nayna@linux.ibm.com>
+Date: Thu, 13 Aug 2020 19:17:53 +0000
+Subject: [PATCH] programs/ssl: Fix incorrect EOF check in ssl_context_info.c
+
+In `read_next_b64_code()`, the result of fgetc() is stored into a char,
+but later compared against EOF, which is generally -1.  On platforms
+where char is unsigned, this generates a compiler warning/error that the
+comparison will never be true (causing a build failure).  The value will
+never match, with the function ultimately bailing with a "Too many bad
+symbols are detected" error.
+
+On platforms with signed char, EOF is detected, but a file containing a
+0xFF character will causes a premature end of file exit of the loop.
+
+Fix this by changing the result to an int.
+
+Fixes #3794.
+
+Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
+Signed-off-by: David Brown <david.brown@linaro.org>
+---
+ ChangeLog.d/bugfix_3794.txt     | 4 ++++
+ programs/ssl/ssl_context_info.c | 4 ++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+ create mode 100644 ChangeLog.d/bugfix_3794.txt
+
+diff --git a/ChangeLog.d/bugfix_3794.txt b/ChangeLog.d/bugfix_3794.txt
+new file mode 100644
+index 0000000000..a483ea76ae
+--- /dev/null
++++ b/ChangeLog.d/bugfix_3794.txt
+@@ -0,0 +1,4 @@
++Bugfix
++  * Fix handling of EOF against 0xff bytes and on platforms with
++    unsigned chars.  Fixes a build failure on platforms where char is
++    unsigned.  Fixes #3794.
+diff --git a/programs/ssl/ssl_context_info.c b/programs/ssl/ssl_context_info.c
+index df8819a804..d109c1e6f7 100644
+--- a/programs/ssl/ssl_context_info.c
++++ b/programs/ssl/ssl_context_info.c
+@@ -377,13 +377,13 @@ size_t read_next_b64_code( uint8_t **b64, size_t *max_len )
+     int valid_balance = 0;  /* balance between valid and invalid characters */
+     size_t len = 0;
+     char pad = 0;
+-    char c = 0;
++    int c = 0;
+ 
+     while( EOF != c )
+     {
+         char c_valid = 0;
+ 
+-        c = (char) fgetc( b64_file );
++        c = fgetc( b64_file );
+ 
+         if( pad > 0 )
+         {
diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.24.0.bb
similarity index 83%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.24.0.bb
index 8e4b6c86c..e3a016956 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.24.0.bb
@@ -18,13 +18,15 @@ understand what the code does. It features:                          \
 HOMEPAGE = "https://tls.mbed.org/"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=302d50a6369f5f22efdb674db908167a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SECTION = "libs"
 
-SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
-SRC_URI[md5sum] = "1f629a43c166de2eca808f3e30aa961d"
-SRC_URI[sha256sum] = "66455e23a6190a30142cdc1113f7418158839331a9d8e6b0778631d077281770"
+S = "${WORKDIR}/git"
+SRCREV = "523f0554b6cdc7ace5d360885c3f5bbcc73ec0e8"
+SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=development \
+           file://fix-incorrect-EOF-check-in-ssl_context_info.patch \
+"
 
 inherit cmake
 
-- 
2.25.1

