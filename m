Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.7498.1622857171296137551
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jun 2021 18:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UVuUQ2uc;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id n12so9189283pgs.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jun 2021 18:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fsNlOx3OtgABDHvwszodR13LYyyNhe8bjwpKbw4aczg=;
        b=UVuUQ2ucIIMALPaDWLc0XVSaNHTe5Pv3BBtfN93zTLHqWj8VCIfkLJ5HGybUesDIB2
         GjWdHqLx6wi/8Sjm8CAWSR6xvz3PQUDeV7czf9cPqsQQ+6yAhtw4a0VGA+45Q+7zLRsV
         WB4jkJ0AeOjaFGVITmERx1Q5qM+4RDppCE5JUWQCs+bkkpk9QWy8R2R/o0cU9rer2zCo
         yzDV65o9Hh10TfJIwx6jAeBzxo+PKOR7e6MUYyGv3+YKIsT62iRvaXT6GV9nzZ1A/wV1
         ywmsfhTpiAlPmVAXc82x0M9ogOLB8QI34BHVi98ArINGPodOzwZWh7931mypXGsNvxG3
         92BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fsNlOx3OtgABDHvwszodR13LYyyNhe8bjwpKbw4aczg=;
        b=YLUwCbbONKsyvqk5xVvKorY/XzYa6/vYId2w0DkCi6THsv4U3HEq5QVaRB1yn5SKlf
         eEspKBxXpZJjvzPx010xDDUgAGtxTj7EknqIjmI4r6yaETlMz4ZiHcylH61OoMcvsEd4
         MiIOLF95E6xIHaRpH9BTzEzRiG43BBOhv60WXkl7kJxN8Xbcgw3jcyaY+gGRAqciy/2n
         YkgmZnPsflu7cf4ryI8f0JnUMvCRpf8mBtQKgRaVcYljTYZfw0xbfed0Tn1x6YsZCxUW
         hlaSz0TwMuu9bjsETGzsKhE9QxHFDN6H8T6FFl4zfNNVSkDuKNXBsn+YiFlyjkTJ7JLu
         mXXw==
X-Gm-Message-State: AOAM533sDO+BlpPHh38RucU2a9/S3QjdbJWw7tfXt9D/VSfCXi/J0s4R
	ytWGb5qCVEHbsh/Z0OL0VloRQxQ6BncVvA==
X-Google-Smtp-Source: ABdhPJz0f/UnyeJ2ci1zjhBs7RoZgxV/HxJjKuPPeUqDgqdu12fCdslGENBJLIeOgV7EJFU4XO61JA==
X-Received: by 2002:a63:6841:: with SMTP id d62mr7647106pgc.7.1622857170250;
        Fri, 04 Jun 2021 18:39:30 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id 15sm2654433pfv.1.2021.06.04.18.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 18:39:29 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 5/5] libwebsockets: Update to latest on v4.2-stable
Date: Fri,  4 Jun 2021 18:39:27 -0700
Message-Id: <20210605013927.983056-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused variable which is flagged by clang

License-Update: copy secondary license texts into LICENSE as a convenience

Add Apache-2.0 as well since lib/tls/mbedtls/wrapper is using it

[1] https://github.com/warmcat/libwebsockets/commit/a12d5ebed672a28c16484d983885474be606cc21#diff-c693279643b8cd5d248172d9c22cb7cf4ed163a3c98c8a3f69c2717edd3eacb7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Document License changes

 ...0001-core-net-Remove-unused-variable.patch | 54 +++++++++++++++++++
 .../libwebsockets/libwebsockets_4.2.0.bb      | 10 ++--
 2 files changed, 60 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-core-net-Remove-unused-variable.patch

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-core-net-Remove-unused-variable.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-core-net-Remove-unused-variable.patch
new file mode 100644
index 0000000000..d648c284b5
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-core-net-Remove-unused-variable.patch
@@ -0,0 +1,54 @@
+From cfa40cc1c2df6c64fb53bb4a2a56eb09e3e1309c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 Jun 2021 18:21:58 -0700
+Subject: [PATCH] core-net: Remove unused variable
+
+variable 'n' is being set but it is not used anywhere, latest clang is
+able to detect this and flags it
+
+Fixes
+
+lib/core-net/route.c:41:6: error: variable 'n' set but not used [-Werror,-Wunused-but-set-variable]
+|         int n = 0;
+|             ^
+
+Upstream-Status: Submitted [https://github.com/warmcat/libwebsockets/pull/2320]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/core-net/route.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/lib/core-net/route.c b/lib/core-net/route.c
+index efe08ba1..6be93d62 100644
+--- a/lib/core-net/route.c
++++ b/lib/core-net/route.c
+@@ -38,23 +38,22 @@ void
+ _lws_routing_entry_dump(lws_route_t *rou)
+ {
+ 	char sa[48], fin[192], *end = &fin[sizeof(fin)];
+-	int n = 0;
+ 
+ 	if (rou->dest.sa4.sin_family) {
+ 		lws_sa46_write_numeric_address(&rou->dest, sa, sizeof(sa));
+-		n += lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
++		lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
+ 				  "dst: %s/%d, ", sa, rou->dest_len);
+ 	}
+ 
+ 	if (rou->src.sa4.sin_family) {
+ 		lws_sa46_write_numeric_address(&rou->src, sa, sizeof(sa));
+-		n += lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
++		lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
+ 				  "src: %s/%d, ", sa, rou->src_len);
+ 	}
+ 
+ 	if (rou->gateway.sa4.sin_family) {
+ 		lws_sa46_write_numeric_address(&rou->gateway, sa, sizeof(sa));
+-		n += lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
++		lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
+ 				  "gw: %s, ", sa);
+ 	}
+ 
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.0.bb
index 89c98fec02..18b72ae8f5 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.0.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.0.bb
@@ -1,13 +1,15 @@
 SUMMARY = "Canonical libwebsockets.org websocket library"
 HOMEPAGE = "https://libwebsockets.org/"
-LICENSE = "MIT & Zlib & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8c47b078124308a4e1354e8d59f606b7"
+LICENSE = "MIT & Zlib & BSD-3-Clause & Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c8bea43a2eb5d713c338819a0be07797"
 
 DEPENDS = "zlib"
 
 S = "${WORKDIR}/git"
-SRCREV = "1367c11e1ee44d9e19daa50e1d015365bae17354"
-SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.2-stable"
+SRCREV = "4b6a7982b6833c8ccac1f35caaf9e8ccc605ff9a"
+SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.2-stable \
+           file://0001-core-net-Remove-unused-variable.patch \
+          "
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.31.1

