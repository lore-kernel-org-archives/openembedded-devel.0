Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062D5D111A6
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 21:06:02 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4390.1764191160759727560
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 13:06:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H05+fo8u;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-340c39ee02dso160633a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 13:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764191160; x=1764795960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHhj8PZsGX/NigwxN20M20YrSaKqyJ+4ahKp6rQcoKM=;
        b=H05+fo8usU2d1p5GchwFrb5IgCy3YIsG88hkchR5BPeBZXYoRcSv5QauiKq0TTQzL+
         MCa4k05geglptoqxWOhbHAWUyIu82Lvz+RjJy2qZrKFqpBUqGu0WX6YGvnQtzBClzXv8
         bqW9/r2rbvYV1AOc2U7xrVfv8ia0+Ksb6St2LL+P1T1j1k0yGbdK5OZx5YEInQIGTEAa
         6Rw3prpZ2auLskwujugjmfSm/hXKy105kRgOI4N4yfhBgKZwwMt4xpGLx/pU1ZNxFm6F
         QFgBJxK4IrYqD2G9QKN8v8+8mmkOrGX26xsOgQJzR2iI1f02EA0NKi6i/Ol/c7x4LJ+d
         kLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764191160; x=1764795960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RHhj8PZsGX/NigwxN20M20YrSaKqyJ+4ahKp6rQcoKM=;
        b=dc32RZ1+/G8xU01VsA1Ff1iS/WL0hZY5M9bI+yUAHN8jv6jdHXdeZpmzLYJun6UMeA
         6O2PWjq8ekmryefuhU9AQRARUH9BkG9e2fsi+0oTHNuSiJSSfw3mC9n2YZlfz1curtmF
         HimtSn/6P0z0Hx4IuRkULLQli20u6GArSeY+JazHKKoNHRqMSDoP0srZKdqQkjuhvbD7
         Mmtp17MWj7xr7sZCCQq6MIF2k+6bLnGyUVMBiR12+gorfhdZrwQ7MHgC0aCksnQziZ7n
         uhIsNXhuADbmQBkNFfkxsKDaRCQ/RsVRfPOFz3y94VyUX9+OXH8Gcrb8pwB2xZBgLen+
         FZQg==
X-Gm-Message-State: AOJu0YwG54V/ma66d6FPgU5/TH3zYQINu4bsaL7sM202X0rS4k1fVYMS
	ZmQ6sJTw+PukHPvVoyQnRY66r8uu746+KPHXFtKxkX1DZem/y+UC3SbOyq9OWg==
X-Gm-Gg: ASbGncusbgWZruoSZsu4HEYTVU6c9mqbA/JHMzeIIEAXIRKG/pRbDScuwjjDjAmVjsq
	vRGfkdlFu2mnNHyV5OrzwdpJRreXk6KbFJ0FStX7YOm9HEsaOrJVc06gQOaVSObYwWuXZ5y5KYd
	hD5cLOljTa+5UBvi+YAqZf5l0YDvOJYIDHFwwp70LI39bWTJZbhwMVdYjuDzpz2TgJB3gQvt0FL
	lERIR22yDzzTLZaohsrMK2/xBpDu2pEfWyZYi1ADlaTE9xQtnA3E7pJzmbHeeUfoGtI340bGrIk
	f+W4o6ROGgiByWBcOfAl5/6/f5sVec9q5OHNJNPTlB2fmy02jsC+iRmYkFLfnFoTiwJrvD2fimR
	LEl8fjP8Iqy3v3Ss4Vq+oIvLYByAUdcg/8BeTv3d3BWlrEYT6R/Qk1zXORJp5rJrCb8CjBMDlgC
	Z8yxd6QDYPix+O+RDYwpE24q8=
X-Google-Smtp-Source: AGHT+IH1SKGrvIAxnTkVVjaE4U87pzNJO3gFJrNi557En7ZFtB0F1LoMjwQ8nq73t9G9QI2Q6Zi22Q==
X-Received: by 2002:a17:90b:2d4c:b0:330:6d5e:f17b with SMTP id 98e67ed59e1d1-34733f165f9mr20591026a91.21.1764191159991;
        Wed, 26 Nov 2025 13:05:59 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3475ff57b47sm3067834a91.5.2025.11.26.13.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 13:05:59 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 2/2] python3-django: upgrade 4.2.25 -> 4.2.26
Date: Thu, 27 Nov 2025 10:05:50 +1300
Message-ID: <20251126210550.2010120-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126210550.2010120-1-ankur.tyagi85@gmail.com>
References: <20251126210550.2010120-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 21:06:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122093

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://docs.djangoproject.com/en/dev/releases/4.2.26/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_4.2.25.bb => python3-django_4.2.26.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.25.bb => python3-django_4.2.26.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.25.bb b/meta-python/recipes-devtools/python/python3-django_4.2.26.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-django_4.2.25.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.26.bb
index 861f7747d2..ea790e4b7f 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.25.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.26.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2391ab3d78191caaae2c963c19fd70b99e9751008da22a0adcc667c5a4f8d311"
+SRC_URI[sha256sum] = "9398e487bcb55e3f142cb56d19fbd9a83e15bb03a97edc31f408361ee76d9d7a"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
@@ -9,6 +9,6 @@ RDEPENDS:${PN} += "\
 "
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
-# default. To build the 4.x branch, 
+# default. To build the 4.x branch,
 # PREFERRED_VERSION_python3-django = "4.2.%" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"

