Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CF6C433FE
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 14:42:39 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.12683.1636036959172718091
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 07:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iMi9ssKM;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id e65so5599137pgc.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 07:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PRMImua14G/axac+ds+f/mezh3SrrBubufrYjK6W1yM=;
        b=iMi9ssKMOlGJlwoQjTaa6LT3sDuy6vD1DgvmbCqBOslbm6pWAMsrPCFwPfbpjq0xSI
         38p1YGOisuKKRBBdqKTToJ0+Fb33SpLNon3yHvhT+qN/UAC/LZoBP1V8IgabB1tfAlME
         YZNjwT53DF76IaxY/D99UGwMDXyRPWxILGEnTzQYR67CzwbwdZ7/z+/LCKYeRu9rXqfR
         O0bX/VmXYQl9pCDC8iQvVq+vnjCMZM7Razda7mUr9O9S+Rj9cqQcTjKVuEjIBFpO1r1H
         Qd3e3NnSCRzMpXhviQmcl8KtPxi/u7Pv8MDOs7RKqDR8EaAYOV2i9o2BmROYWq1BcPZr
         uMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PRMImua14G/axac+ds+f/mezh3SrrBubufrYjK6W1yM=;
        b=CZq09TTXB3wg6WY3mFF9+XFTQU3MuNnmCY9Lr6Iu02JFl7VVfzRWTVG6LmGahL/ajw
         j1/jyOIybA05Wm20NKH/fd7n9oj951WfVPn/u7LwWB9QwCRtVw3RC5d/5DJFZAEdsvSU
         ZM+H3EK83srczHwwXX3Y2x8FoDfp/d3scE2id7qGFwQgFUb6XBAROOjDTjtzdxSGiY+B
         ADxjDfS7zCaL02uuhShgVWNOo5d2xcwBRTUVvpJobqa3nB4sVnxUSjE5VxojsYtI8P7X
         junzU/ULxR41AwgR6kogTHw60jrJqaACaCUCY8vOu2bS1nTsH87q0nfWWeNGH+T2z4s+
         j9Pw==
X-Gm-Message-State: AOAM531BLORRqzZAElemz5zGZFtuIQF+oLVZ3fuzp3B2lneJ+hwGftxL
	FhCgGJa6RRyFW8+Vq9SaCRblBFrCu1c=
X-Google-Smtp-Source: 
 ABdhPJzq032DhrsRIsCfsakyrV3cL34WFUdFC1JATRjbYKlrfDivvzrG6QChcLFMkQiEU+w5Mq03tw==
X-Received: by 2002:a63:4624:: with SMTP id
 t36mr36653209pga.433.1636036958218;
        Thu, 04 Nov 2021 07:42:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 t4sm5445597pfj.13.2021.11.04.07.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 07:42:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] mdns: Upgrade to 1310.140.1
Date: Thu,  4 Nov 2021 07:42:32 -0700
Message-Id: <20211104144233.3225963-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Nov 2021 14:42:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93820

Fix build with musl while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-dns-sd-Include-missing-headers.patch | 41 +++++++++++++++++++
 ...{mdns_1310.40.42.bb => mdns_1310.140.1.bb} |  6 +--
 2 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/mdns/files/0001-dns-sd-Include-missing-headers.patch
 rename meta-networking/recipes-protocols/mdns/{mdns_1310.40.42.bb => mdns_1310.140.1.bb} (95%)

diff --git a/meta-networking/recipes-protocols/mdns/files/0001-dns-sd-Include-missing-headers.patch b/meta-networking/recipes-protocols/mdns/files/0001-dns-sd-Include-missing-headers.patch
new file mode 100644
index 0000000000..c743b3eddb
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/0001-dns-sd-Include-missing-headers.patch
@@ -0,0 +1,41 @@
+From ea442b57f7a9bcd41d5b5bd1cafde4dbe5685d41 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 4 Nov 2021 07:31:32 -0700
+Subject: [PATCH] dns-sd: Include missing headers
+
+Fixes build on Musl
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Clients/dns-sd.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+--- a/Clients/dns-sd.c
++++ b/Clients/dns-sd.c
+@@ -58,11 +58,13 @@
+ //#define TEST_NEW_CLIENTSTUB 1
+ 
+ #include <ctype.h>
++#include <stdarg.h>          // For va_args
+ #include <stdio.h>          // For stdout, stderr
+ #include <stdlib.h>         // For exit()
+ #include <string.h>         // For strlen(), strcpy()
+ #include <errno.h>          // For errno, EINTR
+ #include <time.h>
++#include <sys/param.h>      // For MIN
+ #include <sys/types.h>      // For u_char
+ #ifdef APPLE_OSX_mDNSResponder
+ #include <inttypes.h>       // For PRId64
+--- a/mDNSPosix/nss_mdns.c
++++ b/mDNSPosix/nss_mdns.c
+@@ -89,6 +89,9 @@
+ 
+ #include <dns_sd.h>
+ 
++#if !defined(NETDB_INTERNAL)
++#  define NETDB_INTERNAL (-1)
++#endif
+ 
+ //----------
+ // Public functions
diff --git a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb b/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
similarity index 95%
rename from meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
rename to meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
index c9bfef2d14..5c6d220200 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://developer.apple.com/networking/bonjour/"
 LICENSE = "Apache-2.0 & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
 
-COMPATIBLE_HOST:libc-musl = 'null'
+DEPENDS:append:libc-musl = " musl-nscd"
 
 RPROVIDES:${PN} += "libdns_sd.so"
 
@@ -21,9 +21,9 @@ SRC_URI = "https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${P
            file://0009-Fix-possible-NULL-dereference.patch;patchdir=.. \
            file://0010-Handle-errors-from-socket-calls.patch;patchdir=.. \
            file://0011-Change-a-dynamic-allocation-to-file-scope-variable.patch;patchdir=.. \
+           file://0001-dns-sd-Include-missing-headers.patch;patchdir=.. \
            "
-SRC_URI[md5sum] = "dfcfd4d7f29a56ec99e7df1d21db5e7b"
-SRC_URI[sha256sum] = "bea29e1616cd56ccb8f88c0fad2bcdc4031f4deb2d899c793e2f27a8384f0b34"
+SRC_URI[sha256sum] = "040f6495c18b9f0557bcf9e00cbcfc82b03405f5ba6963dc147730ca0ca90d6f"
 
 CVE_PRODUCT = "apple:mdnsresponder"
 
-- 
2.33.1


