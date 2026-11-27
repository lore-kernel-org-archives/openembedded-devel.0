Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8125.1795739799355788488
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FAFTq6iN;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f0458cc9easo59789155ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739799; x=1796344599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POnIzNngDsQxOeJXI5/3g9KQ8iz/zverX42Ma7bcPBU=;
        b=FAFTq6iNHLRRpnmauL0x7WjZf8G4yQfeX7fs//CDjezT/Pze7kkcXTqRH4SYqKFi05
         zwDJqAbBOvBeqxCHwxhdMaNLe/9Wq8VxyyDjTA6Op+lq+1p3XREyiCaaHb2AJXZJ7fnF
         5eE0719PnUQx8Jo//pN0qwz1JykGnLFnoCbpTM81GOh08BPrtPkU9fT6+V1uqDKXTdQX
         9wvD/ohXEGdyr1XVp4Q3iYFXtEq7R4WvmLGLHLVR9yJk4u/1VFgf10aNiZwP44wSPg+Z
         DzMEliPJIZY9ZrgmjrWqVgh9daTdJmPcQgReRJqzagN9yUWBA1r/fGQieim7aN1+SMv8
         ENSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739799; x=1796344599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=POnIzNngDsQxOeJXI5/3g9KQ8iz/zverX42Ma7bcPBU=;
        b=14fjDL7UfEDZ24T4yvah4dp3Vp0hg0DgCuIh4+cWeyV4xYHTIrTsEqXysaqMqaNQ/A
         x26aUiji6ZtwlFrXwH1P6OcydkoAx8qTSqhcY0UJYXkeUxaSYx2XZdRROrTwtcE5/k/T
         s+sWbUJpVTCeNcWCGQ06CY4IA7fZiujpcVCTpZCiLIF6RxiE0YhVELg5ryfAHKXAiTgJ
         uFzF5dROFzBdv6FAjSb15wI7Aw0pk0Y9twyysmCjpmwqbAcmkzAY9tQbxLk32nzAwFz9
         PvwUQmLzYS30n/ZnPY4znUzaSXzyg1NgO5HJla7pPgNs7ZcDYzv89ppDtZ/u9lxrtpIZ
         /bgQ==
X-Gm-Message-State: APuU4Z9/KMZZ7PnRzV8pFS052xCSpLIb56y1rgz4EefBka9MYhlfrpYM
	NbBHeaTi9ZERlwHmYoH2AcUGwl/LVsO6y43+/D923LrzaFyTFR1AABclP3xfCUJx
X-Gm-Gg: AZFdTZdHZDiBqX+lZR33vz4NFxAAbjieIGTGGPWSuKBYHz1l98BfklVoIIlgzhDDIUA
	e+mHizmCvVys+VQOQqkp41Cix0AawD249NHDBfkfGuqhsHFQERWH98beJ7m7Kfd6sdR1KDDEVlR
	hZtXgd6fx51jQ/aoH3ekB6Bm1WfykMkba0sjH+vRrla/6sxE9PEbU7zN4O0aubG/xVotraRl8Ur
	Yppjfu/dQr062kmmkV/2TiVnv8rE70jTglHcXf7U18owavrOuIWai8871z5roe76SIAQmXWqT3Z
	YoMZACrQ1/oRIInax3gAHHZSS3IB/+FlOSO2vsElHdJsDE5FWB3JeeVIWqMIkmUqX+QFiP7nWA8
	PFAlwl+k4s5UwlBBSpaFm7BlJoWqtNrogab3TMQevXuTLs0xpChqpmyb2mJ4l1uqu/YlAlGlRtt
	PYmWQBLfPDkLMJpIXBsx5lCHQ9hGQx5xCZeEku/mEWKPYex8dJCC+QjNMvitBHWN0dORPFjFJfV
	sQNafF9fyCYfxJlz3FHjL4edGi/0tw3D0TQLMujEb94JQVapp/ilcV+IOjVlLVrPhRSnTndZRFq
	SIcgGRyd1AM/pfDVYlGU0gsSwLNjXv4F75ecre5P9fOohv6xJBP1c5gA6B355WSU9nKLGreqaxD
	vcVcn/aQRajEh4Jn+mwSZTADnsGcfC6iZ76KSJkp/3gFQTUSd5ADS3Dsvx1KRqssOvnEwpmMYHO
	VzDmH06z1mD5uBSNf+bcqNIiu+FQs8UUsbFCFiIBJvn4orTCm0pzUQbnOXAUDIyrI5ENKGgDz6G
	tnU4KfpYb+ZdycJnvYb9PZxwK644AMHyTmvyqatHglmljVtLdqxUJJTweXjEf1we7v2qx2hcCBO
	ehmv
X-Received: by 2002:a17:903:38c8:b0:2ef:f555:6312 with SMTP id d9443c01a7336-2f03f20362bmr251679765ad.58.1795739798519;
        Thu, 26 Nov 2026 16:36:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 28/39] redis: upgrade 8.10.3 -> 8.12.0
Date: Thu, 26 Nov 2026 16:35:32 -0800
Message-ID: <20261127003543.2167775-29-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133198
Content-Type: text/plain; charset="utf-8"

8.12 adds compressed bitmaps (CRoaring integrated into the core),
a B+ tree encoding for large sorted sets, set member expiration
(SEXPIRE, STTL, ...), BLESS, ZMOVE/BZMOVE/ZMOVEMEMBER and
BITRANGEINTARRAY. It also fixes a TLS session resumption issue
across listeners/changed settings and many replication, AOF,
cluster slot migration and module crash bugs.

The bundled CRoaring dependency is new, so build it with the other
bundled deps before the server. The deps/Makefile hunk of the lua
Makefile patch is dropped as upstream now uses "AR?=ar". Add an
upstream version check based on the release listing.

The top-level install target is now an alias for deploy, which also
builds and installs the bundled modules (redisbloom, redisearch,
redisjson, redistimeseries). Install the core binaries with
src/Makefile's install target instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...0001-hiredis-use-default-CC-if-it-is-set.patch |  0
 ...akefile-to-use-environment-build-setting.patch | 15 +--------------
 .../0003-hack-to-force-use-of-libc-malloc.patch   |  0
 .../0004-src-Do-not-reset-FINAL_LIBS.patch        |  0
 ..._SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |  0
 ...e-do-not-build-the-test-modules-from-all.patch |  0
 .../init-redis-server                             |  0
 .../{redis-8.10.3 => redis-8.12.0}/redis.conf     |  0
 .../{redis-8.10.3 => redis-8.12.0}/redis.service  |  0
 .../redis/{redis_8.10.3.bb => redis_8.12.0.bb}    | 10 +++++++---
 10 files changed, 8 insertions(+), 17 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (77%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.3 => redis-8.12.0}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_8.10.3.bb => redis_8.12.0.bb} (92%)

diff --git a/meta-oe/recipes-extended/redis/redis-8.10.3/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-8.12.0/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.3/0001-hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-8.12.0/0001-hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.3/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-8.12.0/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 77%
rename from meta-oe/recipes-extended/redis/redis-8.10.3/0002-lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-8.12.0/0002-lua-update-Makefile-to-use-environment-build-setting.patch
index f1b59ad0a1..71cefb83b5 100644
--- a/meta-oe/recipes-extended/redis/redis-8.10.3/0002-lua-update-Makefile-to-use-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis-8.12.0/0002-lua-update-Makefile-to-use-environment-build-setting.patch
@@ -21,23 +21,10 @@ Reworked for 8.0.0
 Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
 
 ---
- deps/Makefile         |  1 -
  deps/lua/Makefile     |  1 -
  deps/lua/src/Makefile | 16 ++++++----------
- 3 files changed, 6 insertions(+), 12 deletions(-)
+ 2 files changed, 6 insertions(+), 11 deletions(-)
 
-diff --git a/deps/Makefile b/deps/Makefile
-index 5593e0c..d71265a 100644
---- a/deps/Makefile
-+++ b/deps/Makefile
-@@ -101,7 +101,6 @@ endif
- # lua's Makefile defines AR="ar rcu", which is unusual, and makes it more
- # challenging to cross-compile lua (and redis).  These defines make it easier
- # to fit redis into cross-compilation environments, which typically set AR.
--AR=ar
- ARFLAGS=rc
- 
- lua: .make-prerequisites
 diff --git a/deps/lua/Makefile b/deps/lua/Makefile
 index 209a132..72f4b2b 100644
 --- a/deps/lua/Makefile
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.3/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-8.12.0/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.3/0003-hack-to-force-use-of-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-8.12.0/0003-hack-to-force-use-of-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.3/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-8.12.0/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.3/0004-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-8.12.0/0004-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.3/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-8.12.0/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.3/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
rename to meta-oe/recipes-extended/redis/redis-8.12.0/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.3/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch b/meta-oe/recipes-extended/redis/redis-8.12.0/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.3/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch
rename to meta-oe/recipes-extended/redis/redis-8.12.0/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.3/init-redis-server b/meta-oe/recipes-extended/redis/redis-8.12.0/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.3/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-8.12.0/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.3/redis.conf b/meta-oe/recipes-extended/redis/redis-8.12.0/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.3/redis.conf
rename to meta-oe/recipes-extended/redis/redis-8.12.0/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.3/redis.service b/meta-oe/recipes-extended/redis/redis-8.12.0/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.3/redis.service
rename to meta-oe/recipes-extended/redis/redis-8.12.0/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_8.10.3.bb b/meta-oe/recipes-extended/redis/redis_8.12.0.bb
similarity index 92%
rename from meta-oe/recipes-extended/redis/redis_8.10.3.bb
rename to meta-oe/recipes-extended/redis/redis_8.12.0.bb
index 5cf8e6fdbb..44cf3cd252 100644
--- a/meta-oe/recipes-extended/redis/redis_8.10.3.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.12.0.bb
@@ -17,7 +17,10 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-src-Makefile-do-not-build-the-test-modules-from-all.patch \
           "
-SRC_URI[sha256sum] = "edde778f6bdee7581e42fc139ca9e07e2822212092f7501f99989656e3629d02"
+SRC_URI[sha256sum] = "b0100a879b2d45dc97d8fda941127609d648f8913008db1b65a2f72a8ae36c8b"
+
+UPSTREAM_CHECK_URI = "https://download.redis.io/releases/"
+UPSTREAM_CHECK_REGEX = "redis-(?P<pver>\d+\.\d+\.\d+)\.tar"
 
 RPROVIDES:${PN} = "virtual-redis"
 
@@ -54,7 +57,7 @@ TARGET_LDFLAGS:append = " ${DEBUG_PREFIX_MAP}"
 CFLAGS += "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH_NO_INLINE_HINTS', '', d)}"
 
 do_compile:prepend() {
-    oe_runmake -C deps hdr_histogram fpconv hiredis lua linenoise
+    oe_runmake -C deps hdr_histogram fpconv hiredis lua linenoise croaring
 }
 
 # 8.10.0's default "all"/"build" goal also builds the bundled modules
@@ -66,7 +69,8 @@ do_compile() {
 }
 
 do_install() {
-    oe_runmake install PREFIX=${D}${prefix}
+    # The top-level install is now "deploy", which also builds and installs the modules
+    oe_runmake -C src install PREFIX=${D}${prefix}
     install -d ${D}/${sysconfdir}/redis
     install -m 0644 ${UNPACKDIR}/redis.conf ${D}/${sysconfdir}/redis/redis.conf
     install -d ${D}/${sysconfdir}/init.d
