Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7769.1793057218711003241
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 16:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LJiLtVU8;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2761c69fbso1868058c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 16:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793057218; x=1793662018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/kFuIo1ONL8LZpAdTV12QzoZ1I5Dn98yn05Xd83a/p4=;
        b=LJiLtVU8z6cYCS3XqOSnfgjXqz2GV3AqftkUQt0qN+3HFtFapo0uf/WgtW1HfxaGIu
         2qlkJom/dRNKun7EHo6su9qjkM7bd1/7DQ8IP9oCn6OpFQKRTV5p64oMDeNfUsejsQza
         TSD7yqoeEFXh1FvTXwCPnYB1LAHAxQB68byQlDche4NKUoNVVpeIdfPcGH3F3iPLw8iu
         kj+4JQC0fLvq9WyOVp1u8nInDBBaHjwK1ZpZQ70xjf0eWtwW+kqIArP81fi7GOlcKeBJ
         YxOTVhZrlkMD4mZN9AOrlppCRm0RWbKyAo/zis2Bw7VZlviGvhwRplCbnxncphj52q8D
         keuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057218; x=1793662018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/kFuIo1ONL8LZpAdTV12QzoZ1I5Dn98yn05Xd83a/p4=;
        b=ENOZlfb0ZUbEvetNk2mUap/hmKQmVi27DL4wMUKq2JNA90xOfI/wte/3hq0BoXLrQK
         zCMLSyWiQFKRp0wsXmI4qXk4ir3VWveGK1KPQ/WwnljBJonH0KC/+BZgK459iEOp2J7h
         Yng9kOrpNBtEEPz34wb9A3/2dZzHVW66jRic6Wc3hgOn5YZSKHRxQYMF8yKj+jIspZZj
         LR0dDw1wWNJvl1ToM2r3EMCeg1K+boh9HnlmwlMuuHHfkK2X0WkaJDX845CScB63Uh3K
         27D4h75vpA5vBPq5JTPaaTTqbjKP3bPkEbYdIyo4njIEIbxyi4LvfLzSQcsEnuG1EK4z
         NSjw==
X-Gm-Message-State: AFq9FYLjTVGpowKEW8QYmoAMxkwAko6BVRXNMqWPyd8VlD5nDy8mNCBm
	I74T39X29IBHFRhV0l/b8ymx0x+oe0p9O977S/mrTe2Mw72mir2mK/EYssryLA==
X-Gm-Gg: AYBFou2IamUvbpVj3RxOK/lwTELSzyg8cmRrVASzRM9A4LokhBdLGrTwNDAxvWSKKvS
	vpSWRvDeak3nymJMzXK9E60dKaqhwvlnj0W60j94Dsv5Nax8ZeGi2PLnU+hUZ+Xrw6VhkKCx5WG
	MoO+qqj+PEqeHvDqcQi/FPYyXIUWLO6dbR1CcupR8aRJQkMKpaBGZM0Y+/ftD385rxTmrNaJMTI
	VZVLujtX4GrzqxKkSJxyy5v8OfVxqTPY/umAGwkScqhPy47JISuesvSnEt50RICUevCDZ30d7EJ
	mYPxIVAny2zCBbk+s+RTYlAamWTHPc4BIvS1w+ZvtGG+M5RAYKbJARheNBYJsbnQEA+zokPsuf9
	0v8OTMQxbI25qdoO35RsOjP2PzQL2ELg1zenb2STlzGI88RlbbUmxLIkhrKzSOVm2APavj5rSR/
	TYkcWAhnkNt9fHVbdWRv8/Q4uHfe2rV0XWlk/HXXjDUvDRVbH+eIPXt+nXvcfDg1eYs0ub2PhZb
	QZ3jNUXsdj3anumACSW4wMTxs8vbanICfh67BT0VIszrzsxQTj+VUL8r4lGYOjM+wx7Jg5NMRi8
	C+ncsSLrND/i
X-Received: by 2002:a05:7022:3b8a:b0:16b:fdbf:4a9c with SMTP id a92af1059eb24-199363a121cmr13213357c88.23.1793057217989;
        Mon, 26 Oct 2026 16:26:57 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm32234982c88.10.2026.10.26.16.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:26:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 13/13] redis: upgrade 8.10.2 -> 8.10.3
Date: Tue, 27 Oct 2026 12:26:25 +1300
Message-ID: <20261026232625.1275411-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
References: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 23:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131453
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/redis/redis/releases/tag/8.10.3

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
 
