Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E116C44501
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:16 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69139.1782634331911300070
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S+GxKLsQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-13986d61b4fso3224027c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634331; x=1783239131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rk/ERHujbBR6OdTeGJe90pJYIU2OrFoe63qAVjSGexs=;
        b=S+GxKLsQT0c8NSzuAw+FZp+1uhiDXYSvhI37Z7qN7OJjXVM/coy/bPirOnC3vfWMde
         wXWYryH37KouNryj4VTU7M83A+e18UWtMCRH4E965MHnxyDpRgXqig/oardzFNmOm0pn
         Nv2l0t7J+7F9Gwqsgk6Fy8QKfOdXMS3gOVkvhjZ+kxA9QvydSbtz/WstOcGU9sHOuc05
         zliAjlNS/yqVSzCauUY3I3uQjwm4G6mb4pxPBpscxGYyuM/PXztFTOetvzCZJnHUK1Uv
         kUT8yOaljrp7PEOZmgkTSwjgYkdsMC23ljnYiOQr0cq7G2RY/6gyYF3kQkUnRhOWqm1R
         XKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634331; x=1783239131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rk/ERHujbBR6OdTeGJe90pJYIU2OrFoe63qAVjSGexs=;
        b=CTDalwQfj94hx+zB7p1gyfs0F5OlC8ytcdNeVFqrOWY7eoRnJ+HMBwNHAo/dRn/F5T
         lzGOcYDeTLgHggIPwH55wXVIdxUCY8sCMLZeHRDsUjSgGVeVfpeqErnHDzLh7TF8hw9k
         aMdVO5f2t8BwDsh2luO+wwJ16TzC5z9QP2H0g2A4OwhP5QzIm1O49UxTL+uQdXbznY0C
         PJCOyQAvqvCLRaFtT9aFtHi+WrquW1Sx2Sj+4vNb+bNZn4xAQ3neFkvdcDvOG4wzynE5
         kaSPBj4lfCMF8FkqDkIX7tGLim6WdFlbkSi9Of1VURYdPXe64n9kqF2rlNgwMfgGeT9b
         yDkQ==
X-Gm-Message-State: AOJu0Yw7TVQbTRhFVBJ8NakygjQJobtPPcFg9d0GK48K5lGNnEyibj7d
	JBu6QXb+4tBNK5TTjtXH/3GptuO7T1qKfVU31pyY6uksqZ42sFDlmWOP2aI6WkCUREkIHQ==
X-Gm-Gg: AfdE7ckfDzVbzHKiG9/1CNis8A4dIKRhbDfGAi2kcdP35ncmTABp8Gvmy5n9UrMLcmC
	ZrUJgOomIt3k0x6Javq6ioobhRrst9X1Jf8KHqV0OmUqgWdivtRrgAEiSRP3UFOpQk6NP1+h/sG
	A8Gd1jC3pfA3tYnLZfhc0JQOelyXX22rlYBOIFH7GzO73cCWFpAnsVbDAYT2C7c2FJPWBy88ONQ
	+B1ybS/XBFEglfQRpWCvfY+Ce75P38lEztsNo8gDo5UBAqCXLCe/hCaDtrgyunXD5/OsVIK0xCx
	ks0A4ZZfjOBRC9BghVDSXEjs3FD1zv3kXbDuywONZDVAPNj9pbLE/V14f1uXnC1cTuQ39COtYM5
	Jdw2r+mVjJNJS2EYNgY5wW8QsVDtCQgLmiqBwXmvOq4ozn5zP3VDEAN2RzHuVEZzQgepAmat3mj
	5o+x3/yZEcfqVQC0r/rgkqnoxhY09WskeIptzQzJheUmNE4gcIYaixLrVAc1gf79xTGn11XctFq
	VWTHZFAdLa96iRfrTpUjudhDNWwwZiNgnpqI+57VWhbRUyrpulJFm0SzqfHGGVMj8H4M2QXIla7
	6AMjiTpQ8R+gndh3i+qDdeDs2EAPTrOP5Od6HkaS
X-Received: by 2002:a05:7301:3d17:b0:30c:ab4f:46a0 with SMTP id 5a478bee46e88-30cab4f4972mr5927434eec.36.1782634331136;
        Sun, 28 Jun 2026 01:12:11 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 050/128] redis: upgrade 8.0.6 -> 8.8.0
Date: Sun, 28 Jun 2026 01:10:01 -0700
Message-ID: <20260628081122.178348-50-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127860

Regenerate 0001-hiredis-use-default-CC and
0004-src-Do-not-reset-FINAL_LIBS so they apply without fuzz (patch-fuzz
is a fatal QA error).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-hiredis-use-default-CC-if-it-is-set.patch     |  5 ++---
 ...ate-Makefile-to-use-environment-build-setting.patch |  0
 .../0003-hack-to-force-use-of-libc-malloc.patch        |  0
 .../0004-src-Do-not-reset-FINAL_LIBS.patch             | 10 +++++-----
 ...-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |  0
 .../{redis-8.0.6 => redis-8.8.0}/init-redis-server     |  0
 .../redis/{redis-8.0.6 => redis-8.8.0}/redis.conf      |  0
 .../redis/{redis-8.0.6 => redis-8.8.0}/redis.service   |  0
 .../redis/{redis_8.0.6.bb => redis_8.8.0.bb}           |  2 +-
 9 files changed, 8 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis-8.0.6 => redis-8.8.0}/0001-hiredis-use-default-CC-if-it-is-set.patch (94%)
 rename meta-oe/recipes-extended/redis/{redis-8.0.6 => redis-8.8.0}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.0.6 => redis-8.8.0}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.0.6 => redis-8.8.0}/0004-src-Do-not-reset-FINAL_LIBS.patch (91%)
 rename meta-oe/recipes-extended/redis/{redis-8.0.6 => redis-8.8.0}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.0.6 => redis-8.8.0}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.0.6 => redis-8.8.0}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.0.6 => redis-8.8.0}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_8.0.6.bb => redis_8.8.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/redis/redis-8.0.6/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-8.8.0/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 94%
rename from meta-oe/recipes-extended/redis/redis-8.0.6/0001-hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-8.8.0/0001-hiredis-use-default-CC-if-it-is-set.patch
index a176f7c14e..8e1985b726 100644
--- a/meta-oe/recipes-extended/redis/redis-8.0.6/0001-hiredis-use-default-CC-if-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis-8.8.0/0001-hiredis-use-default-CC-if-it-is-set.patch
@@ -31,11 +31,10 @@ Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile
-index bd2106b..9ce768d 100644
 --- a/deps/hiredis/Makefile
 +++ b/deps/hiredis/Makefile
-@@ -36,8 +36,6 @@ endef
- export REDIS_TEST_CONFIG
+@@ -41,8 +41,6 @@
+ HIREDIS_LDFLAGS=
  
  # Fallback to gcc when $CC is not in $PATH.
 -CC:=$(shell sh -c 'type $${CC%% *} >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
diff --git a/meta-oe/recipes-extended/redis/redis-8.0.6/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-8.8.0/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.0.6/0002-lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-8.8.0/0002-lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.0.6/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-8.8.0/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.0.6/0003-hack-to-force-use-of-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-8.8.0/0003-hack-to-force-use-of-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.0.6/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-8.8.0/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 91%
rename from meta-oe/recipes-extended/redis/redis-8.0.6/0004-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-8.8.0/0004-src-Do-not-reset-FINAL_LIBS.patch
index 5b8616c652..a8a13de83e 100644
--- a/meta-oe/recipes-extended/redis/redis-8.0.6/0004-src-Do-not-reset-FINAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis-8.8.0/0004-src-Do-not-reset-FINAL_LIBS.patch
@@ -23,12 +23,12 @@ diff --git a/src/Makefile b/src/Makefile
 index 5dbbefc..15fbe09 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -131,7 +131,7 @@ endif
- 
+@@ -152,7 +152,7 @@ endif
+
  FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
  FINAL_LDFLAGS=$(LDFLAGS) $(OPT) $(REDIS_LDFLAGS) $(DEBUG)
--FINAL_LIBS=-lm -lstdc++
-+FINAL_LIBS+=-lm -lstdc++
+-FINAL_LIBS=-lm
++FINAL_LIBS+=-lm
  DEBUG=-g -ggdb
- 
+
  # Linux ARM32 needs -latomic at linking time
diff --git a/meta-oe/recipes-extended/redis/redis-8.0.6/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-8.8.0/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.0.6/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
rename to meta-oe/recipes-extended/redis/redis-8.8.0/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
diff --git a/meta-oe/recipes-extended/redis/redis-8.0.6/init-redis-server b/meta-oe/recipes-extended/redis/redis-8.8.0/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.0.6/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-8.8.0/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-8.0.6/redis.conf b/meta-oe/recipes-extended/redis/redis-8.8.0/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.0.6/redis.conf
rename to meta-oe/recipes-extended/redis/redis-8.8.0/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-8.0.6/redis.service b/meta-oe/recipes-extended/redis/redis-8.8.0/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-8.0.6/redis.service
rename to meta-oe/recipes-extended/redis/redis-8.8.0/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_8.0.6.bb b/meta-oe/recipes-extended/redis/redis_8.8.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis_8.0.6.bb
rename to meta-oe/recipes-extended/redis/redis_8.8.0.bb
index f6866747eb..865ebd47b6 100644
--- a/meta-oe/recipes-extended/redis/redis_8.0.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.8.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0004-src-Do-not-reset-FINAL_LIBS.patch \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
           "
-SRC_URI[sha256sum] = "6d0a9913887a4972536f9da226f1575859c34d86354129163260a5f9c6bd4229"
+SRC_URI[sha256sum] = "88422181efb0c9c0abba332e3e391d409e1e13714b838931669235e5796f704b"
 
 RPROVIDES:${PN} = "virtual-redis"
 

