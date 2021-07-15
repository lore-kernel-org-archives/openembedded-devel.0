Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.6840.1626350772102642315
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 05:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=NKbid31J;
 spf=pass (domain: ossystems.com.br, ip: 209.85.214.170, mailfrom: luan.rafael@ossystems.com.br)
Received: by mail-pl1-f170.google.com with SMTP id v14so3124377plg.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jul 2021 05:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/2TFbgxRpvgNnC6hquJZocAWvA+2dNGs5aGMcRMfk0w=;
        b=NKbid31Ji0TTslqQFKTcsK+yMO2/TT9fUUINE0DsS2n20+st0NgKQPOGpd++XU5r5K
         e7RnBysw4T90bV73V4G0UvLufsBOw38aQ1tF+mpe6tsr43gYMVoOkhTcmLtVrjeVYcME
         mbyi+7Puwk1CaidbfIzLUhqMRjOfBugo3rBeZNFRnh/HVIkpt7TwGGxbi8bsJcIHZ5pj
         7refSAfyNsbIzs2Dwk+8eijkOdHxig5xzXk/aBXx1G5Sz+xddY4jNMHsmoE1vJxzIaxE
         8OwHj0+QQJ4ekKrg57ZWhYNuz6dEnafwzo8xHFoILDgEmG1S3uzsqCH/dQBKtduCq6fo
         436w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/2TFbgxRpvgNnC6hquJZocAWvA+2dNGs5aGMcRMfk0w=;
        b=RQfWRJ5PNBPdX6zO14y16QDIeavhOTX7HrVP0ZQCTRZaR/koGOMjHTcEdSwDmOjos0
         1Q206WcevmtBKRoZ4V2TaHNWlTvVOkn6hoivY6TOGiTCPjT09kWJE6qR5qbxjNgAJbSS
         bPGhRvHxHpT5nx/Y0mkZ9+dXRMd9QjFgeZm6rApfJI7unK8PpIF4ycin4gerf+IQPdnd
         AA42FBtSViwgQh2wWVynoPkLWIEO+K9DefzJjIOaniM6PhnmlI4b6gKw9r+Gfr90BhqU
         J+SUn7YQ2NbADLwPEyQ5CJYTuTfObQtcn16mPq5+kj5svR9cvSR74+uYm7LlIim4Gm7X
         XFLg==
X-Gm-Message-State: AOAM533vln0uPOSLwI8EgRED968oTAg5NfAruiOzZg6CrUf+zKJWx4kC
	FqIipmkELoDyQvDx+Bz6ItCEtnm7NNxf/w==
X-Google-Smtp-Source: ABdhPJxsYg4l6Gpkt9gDZmQ1lbPxSiwBA4RZHG8yz6zkl9u3Gv41XozZEIMkKfIJfZW9bDyRDylzgA==
X-Received: by 2002:a17:902:d284:b029:12b:5280:2f94 with SMTP id t4-20020a170902d284b029012b52802f94mr3183031plc.69.1626350771143;
        Thu, 15 Jul 2021 05:06:11 -0700 (PDT)
Return-Path: <luan.rafael@ossystems.com.br>
Received: from luan.lab.ossystems (200-203-25-205.paemt700.dsl.brasiltelecom.net.br. [200.203.25.205])
        by smtp.gmail.com with ESMTPSA id b20sm6238208pfl.9.2021.07.15.05.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 05:06:10 -0700 (PDT)
From: "Luan Rafael Carneiro" <luan.rafael@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Luan Rafael Carneiro <luan.rafael@ossystems.com.br>
Subject: [meta-oe][PATCH] libwebsockets: Update 4.2.0 -> 4.2.1
Date: Thu, 15 Jul 2021 09:05:58 -0300
Message-Id: <20210715120558.182141-1-luan.rafael@ossystems.com.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the library to the 4.2.1 stable release.
This commit includes following changes:

    8a580b59 v4.2.1
    e90f005a vhost: listen: protect listen port transfer between
    041baf93 mbedtls: sessions: clean session on bail path
    4038a7d4 windows: align plat insert socket POLLIN handling to linux
    a310e16f socks5: cast for mingw3 nonposix recv args
    439651fa openssl: manage _GNU_SOURCE better
    c042ba8c mqtt: handle NULL mqtt publish metadata
    04761c4b event libs: glib: use glib.h specifically
    599d318a mqtt: coverity: help coverity see we wont have an mqtt role wsi without mqtt member allocated
    bae99f63 tls: add option to serialize ssl handshake
    ff1b8ed0 tls: fix inbalanced tls restrict borrow/return calls
    ad3901d0 raw-proxy: fix role bind flag
    4bc8b1a4 extpoll: clean up test server for Wconversion in extpoll parts
    eeea000c dns: handle EAI_NONAME as fatal
    9e5acc05 minimal: hcmulti: modernize startup to use OPERATIONAL
    55533f96 netlink: hold in COLDPLUG until we actually have some routing table contents
    fa1a7040 sspc: close: differentiate between ss and sspc at final wsi close
    3f0fef17 gcc: gcc8 only recognizes fallthu
    e319b15b minimal: ws client spam: modernize with pvo and cancel service after interrupted
    ea4d8008 service: fix casts for EXTERNAL_POLL
    aea9d0ce tls-sessions: remove no stash warning
    10c1b882 ss: check destroy null policy
    e4aa3ece ss: check serialize null policy
    4141a68f ss: avoid null ss policy on req tx len
    de8185db ss: avoid null ss policy on req tx
    526310df ss: h1: log dereferences NULL
    7a283eba minimal: htt-client: send user agent and accept
    3d13468e ctest: do not reuse ctest-ssp path
    e3da2a3b android: getnameinfo uses nonstandard size_t
    8398ef79 getifaddrs: casts for android
    02ae95fa non-windows: explicit cast vaarg to mode_t
    7c3c179e win32: client: just do WIN32 check
    4c8195df windows: only conceal mode_t on windows
    0ba8df6e threadpool: disassociate wsi on close
    94c50618 tls: mbedtls: fix cast for dump helper
    d896d401 freertos: check for forcing each time around service loop
    cd87bc1c cmake: tls: use CHECK_SYMBOL_EXISTS
    da17f018 plugin: post: check unexpected write after protocol unbind
    1c935dff clean: else became a NOP
    896a2e09 strexp: handle NULL better
    aa090fc2 cygwin: include in unix type socket init
    58a34cb0 examples: embedded: keep loop running on WROVER
    85f772f2 OSX: Fixed can't find clock_gettime
    014aa77e core-net: Remove unused variable
    e1ef2301 ss: h2: handle zero length COLON_PATH for metadata
    0557e919 sspc: handle nonexistent metadata cleanly
    07bef6b8 coverity: ntp from blob: handle blob missing
    2f9ed48d coverity: report problem in hpack_dynamic_size() to parent
    d155970b coverity: h->cwsi must be valid if we are handling rx on it
    2d97e343 ss: split out blob into own minimal example
    c3dd4d05 ss: sspc: handle destroy for client_connect and request_tx

Signed-off-by: Luan Rafael Carneiro <luan.rafael@ossystems.com.br>
---
 ...0001-core-net-Remove-unused-variable.patch | 54 -------------------
 ...ockets_4.2.0.bb => libwebsockets_4.2.1.bb} |  6 +--
 2 files changed, 2 insertions(+), 58 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-core-net-Remove-unused-variable.patch
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.2.0.bb => libwebsockets_4.2.1.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-core-net-Remove-unused-variable.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-core-net-Remove-unused-variable.patch
deleted file mode 100644
index d648c284b..000000000
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/0001-core-net-Remove-unused-variable.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From cfa40cc1c2df6c64fb53bb4a2a56eb09e3e1309c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 4 Jun 2021 18:21:58 -0700
-Subject: [PATCH] core-net: Remove unused variable
-
-variable 'n' is being set but it is not used anywhere, latest clang is
-able to detect this and flags it
-
-Fixes
-
-lib/core-net/route.c:41:6: error: variable 'n' set but not used [-Werror,-Wunused-but-set-variable]
-|         int n = 0;
-|             ^
-
-Upstream-Status: Submitted [https://github.com/warmcat/libwebsockets/pull/2320]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/core-net/route.c | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/lib/core-net/route.c b/lib/core-net/route.c
-index efe08ba1..6be93d62 100644
---- a/lib/core-net/route.c
-+++ b/lib/core-net/route.c
-@@ -38,23 +38,22 @@ void
- _lws_routing_entry_dump(lws_route_t *rou)
- {
- 	char sa[48], fin[192], *end = &fin[sizeof(fin)];
--	int n = 0;
- 
- 	if (rou->dest.sa4.sin_family) {
- 		lws_sa46_write_numeric_address(&rou->dest, sa, sizeof(sa));
--		n += lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
-+		lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
- 				  "dst: %s/%d, ", sa, rou->dest_len);
- 	}
- 
- 	if (rou->src.sa4.sin_family) {
- 		lws_sa46_write_numeric_address(&rou->src, sa, sizeof(sa));
--		n += lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
-+		lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
- 				  "src: %s/%d, ", sa, rou->src_len);
- 	}
- 
- 	if (rou->gateway.sa4.sin_family) {
- 		lws_sa46_write_numeric_address(&rou->gateway, sa, sizeof(sa));
--		n += lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
-+		lws_snprintf(fin, lws_ptr_diff_size_t(end, fin),
- 				  "gw: %s, ", sa);
- 	}
- 
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.1.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.0.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.1.bb
index 18b72ae8f..685aebee5 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.0.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.1.bb
@@ -6,10 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c8bea43a2eb5d713c338819a0be07797"
 DEPENDS = "zlib"
 
 S = "${WORKDIR}/git"
-SRCREV = "4b6a7982b6833c8ccac1f35caaf9e8ccc605ff9a"
-SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.2-stable \
-           file://0001-core-net-Remove-unused-variable.patch \
-          "
+SRCREV = "8a580b59b23d204ca72028370e97a8f6aa0c9202"
+SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.2-stable"
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1

