Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36233.1793161600016642442
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0cNgYegW;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so260839a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161599; x=1793766399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uSYMbw4KZE/3stI5x6hHG/GPJSeBZVJsEyr3A63Ox4o=;
        b=0cNgYegWchQ+Nty9j9BHGpMGbNeodIfYmDJJBVrknuSz/+zEa1+fBN9d7HfXUsslxo
         qVgQhlaBFV20fXiFr2oXNrpalbfYmUuRKy9P70K7I8g73sctlsvQiTaUKwJ+hRBlyx1R
         XelrXoaam7OKyvbafGz25GvpT6O2VHDokrZdaGzG/RnkOMuaiyQbeYrCngtRtybae8sE
         0lreeVrAyvTqPO/sjN9Nudpcz7BFaNCRziRW0Rw0/0iHV7yyNW1DBcV2hXLu+dqagGgL
         +80S0ttvgCoP/urvjPe6rFj3J05UUkoMajHPjCiMCtWtulLoDfWgYjO4YPM/T+qkDo9C
         3cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161599; x=1793766399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uSYMbw4KZE/3stI5x6hHG/GPJSeBZVJsEyr3A63Ox4o=;
        b=cUlxVdVyRMdR+yW9UVO5tHo6PdmeN10d0tKCh6+h8jmCOOgRGCyNJQsM+BoujgasUd
         85we/Kennny/2KFlkxqA7Ltd4/WZEoPy38FZz8GvI58mRf7Qq3n3Vgo/7iP1+9iCkf1r
         RY41lW1Rb0kHdEtnFWecQ7rZQy7g+E1jwgSXZO+udrY9dmd9+4fmqFCbOu5weM1EODz0
         vu7yTKMOIrB5wi6M1rJcyd/M35FqOALWYtscqUaiIm1Z8gqLArYpmBnaEMuevXMCY82Q
         l3avgFMEOzzbIF7mXuJDS8DJcX0gmehXU8XmKKDTy6pSySAD59a853I4JwvOKr4E8Zs4
         kdvg==
X-Gm-Message-State: AFq9FYKRqW3xutmV6PD4NwLBdeX17+Uu8SCPVMTi8k+qD1bZPSorU7pJ
	DdtyVcuoC8gsH5HiR6A9MrPyeswyeTY0qBrvmifvrXBor08VFfKfeykVpwcLZw==
X-Gm-Gg: AYBFou1l7ATaSuXhIo+Fpa79V/5V3Aahjxyv0VhgrB/kIILN5P1XvflYuIYkQd0/g6k
	Y6dq5cWhpc9na+p7ELqKwxT07GT1bqC3rdYHc+EsuKHXU0IDPbqvfd24uBhzZ4wqOGDA58pR+Ss
	FmUnAaMLnQGxVpm995uOUnFeEtxT8NBbYW9dwl0qKCRoBfj6tkv1rMazSiabtTDvb/EdeEz215q
	bwi6XQGUgEF5sbnFzHYUB31tPo3KDFAi+Y3qx7l6NV9DolevG6QL41R6QWUZEecl8qIp6XoBq6+
	eVU+zjnERV1oQZGJFjEpBsJnf8ZemNrJi9VRUF+mc4oFLj2pv/sVtraqdSABn462hzijDrxIUnu
	heNHE5Sps4DBENDhLMCYaCqk1rGEZo4sLQ3wN/WTx6/X9GB6QqFGBUkKmwQAkXJHnM1TpaguKgJ
	weMZLWYQghWjiIRBASeQyXWDghcpY4DJr/4ZSD/3WeDOUzhXAtM1pp3tugCetYEbUOAAKWltSFE
	vtqqn4832yvv8FxAMUg2sbjtfNp9pRxQ8RwvB2JjFkR+8CmuILcCzoZerZ9Zwn5AKLbVwGl+bjl
	0gxJkJ5BHmxrMwUig1Ag5mjqmttP3EtxlMN7IYeu1MaKDo6IXHpst5G6HRj/xp0AXbqfr0GN6b2
	+xJ3OKlOkjg==
X-Received: by 2002:a17:90b:3905:b0:3ab:c370:3684 with SMTP id 98e67ed59e1d1-3ae581185a4mr747517a91.30.1793161599272;
        Tue, 27 Oct 2026 21:26:39 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:26:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [blacksail][PATCH 60/60] redis: upgrade 8.10.2 -> 8.10.3
Date: Wed, 28 Oct 2026 17:23:58 +1300
Message-ID: <bb956bf8ff7a32f31deaa83e96880d10ab564d14.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131612
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/redis/redis/releases/tag/8.10.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 53276e6882048b990201b3c230e0b1fd0b8311b6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-hiredis-use-default-CC-if-it-is-set.patch              | 0
 ...2-lua-update-Makefile-to-use-environment-build-setting.patch | 0
 .../0003-hack-to-force-use-of-libc-malloc.patch                 | 0
 .../0004-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 ...05-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 0
 ...06-src-Makefile-do-not-build-the-test-modules-from-all.patch | 0
 .../redis/{redis-8.10.2 => redis-8.10.3}/init-redis-server      | 0
 .../redis/{redis-8.10.2 => redis-8.10.3}/redis.conf             | 0
 .../redis/{redis-8.10.2 => redis-8.10.3}/redis.service          | 0
 .../recipes-extended/redis/{redis_8.10.2.bb => redis_8.10.3.bb} | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_8.10.2.bb => redis_8.10.3.bb} (98%)

diff --git a/meta-oe/recipes-extended/redis/redis-8.10.2/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-8.10.3/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.2/0001-hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.3/0001-hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.2/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-8.10.3/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.2/0002-lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.3/0002-lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.2/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-8.10.3/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.2/0003-hack-to-force-use-of-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.3/0003-hack-to-force-use-of-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.2/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-8.10.3/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.2/0004-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.3/0004-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.2/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-8.10.3/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.2/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.3/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.2/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch b/meta-oe/recipes-extended/redis/redis-8.10.3/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.2/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch
rename to meta-oe/recipes-extended/redis/redis-8.10.3/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.2/init-redis-server b/meta-oe/recipes-extended/redis/redis-8.10.3/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.2/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-8.10.3/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.2/redis.conf b/meta-oe/recipes-extended/redis/redis-8.10.3/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.2/redis.conf
rename to meta-oe/recipes-extended/redis/redis-8.10.3/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-8.10.2/redis.service b/meta-oe/recipes-extended/redis/redis-8.10.3/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.10.2/redis.service
rename to meta-oe/recipes-extended/redis/redis-8.10.3/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_8.10.2.bb b/meta-oe/recipes-extended/redis/redis_8.10.3.bb
similarity index 98%
rename from meta-oe/recipes-extended/redis/redis_8.10.2.bb
rename to meta-oe/recipes-extended/redis/redis_8.10.3.bb
index d24f6825d1..240eb4143f 100644
--- a/meta-oe/recipes-extended/redis/redis_8.10.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.10.3.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-src-Makefile-do-not-build-the-test-modules-from-all.patch \
           "
-SRC_URI[sha256sum] = "b9ffee226b5eecdba98a679260dad764b2a4ebd90dce4ad5ac9e9f3eef9c02b3"
+SRC_URI[sha256sum] = "edde778f6bdee7581e42fc139ca9e07e2822212092f7501f99989656e3629d02"
 
 RPROVIDES:${PN} = "virtual-redis"
 
