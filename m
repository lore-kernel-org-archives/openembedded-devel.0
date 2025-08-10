Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38596C87FDA
	for <webhook@archiver.kernel.org>; Sun, 10 Aug 2025 20:22:21 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.33356.1754857340239046903
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Aug 2025 13:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BlXO133U;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7183d264e55so38815477b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Aug 2025 13:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754857339; x=1755462139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ky1Uq4dgf3itaJlxKRkhOaqjb9X8PGTYj4cKVlcciT0=;
        b=BlXO133Ue7tP4VYDg5fRUCo3K65yjNNsjLyWNDrJSLIfOhnbvkxd7DuUOkWjtwS8sE
         re9n+260u2+2ohsQ8PJEfTOuzof6GDimj9SKfefF+NJ7gwIGTzfZTW5TsnFMZO3BciGz
         tjLb8ZGAFxWu9lboW9KD2PBFnZti9XzlNOTPjBQ6yHMZVsfJw0Wiv6XGXjD6d4AJJWvb
         nrXslneMQEVH16F7QlXCaRGVISNH/XXIjEprAmxBwJ3/G3fxWGm+GTT4bx/Vc6A9gFz5
         FBFz990B3kyh5qXAzaKbTPl6oEBTy/WsoisojfQ9YD4qNSyMPJIsYjW1T72BMw7a9dNN
         wY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754857339; x=1755462139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ky1Uq4dgf3itaJlxKRkhOaqjb9X8PGTYj4cKVlcciT0=;
        b=LoXnKffCLKb6FpPEHxqZeEGJCF4JjV0lEIEqcwbJgKZGC84aNin5y26DYcqUHfwR5c
         jbUAfWgiHCBjVXf/70BZ/FQtFc1e8Bylpa1sldn9+JPd1rB02DSzLb3rE5Bl1aWC2IEZ
         A6Zd9NlR1ZRhueaEDe8FY1cYMJfVXYMFmjv7nPwBECrn36vXAp2onL/jfeuhyLQdQF+K
         lOGKjgz2M5WY2DbyqUmcMS21r2omDXXmO+wv1+BpFuxy8CTVmCusrFqbDHhUs0O51Sag
         AhmAyvdJ0k3WPy2PdbSKDqq8oD4mQynbD/HeH5CByuquni81LfCTWAwcalYzh1YxJ9uF
         yJ+A==
X-Gm-Message-State: AOJu0YwPSopjdhJ3IxlepbhGh39LvyuoGgyK3mrdioO4lSWpteGXijQN
	YV+2Q7dtBPM0kMtF/0lZLAJXkVg0mZzCP0lkXz8ozO/6q3Sb5qEgQ7ALuqwUXA==
X-Gm-Gg: ASbGncujaKTW75bAa+2/nUamEGbKUik2NvoweKUEggFFrgtr1KqAp+B8hwYkGgfBouJ
	bLFgX2dblZqJRu7ks2cnrY1rWAYPCPi5Yp4i7EDsyFpTl6TEpoKXTvtygndVAzb6wP5O2TGrRGx
	V19wXNpogt/HLh0OPUGpUJEDnDKooOAoW837ya/b+Hgg2S2iQaPApBGm/1FOCxk21cKYwFjSlrb
	yJw9G81XWxk1CO7r+cF1aVI4mGeHagL/yDSLZgAOvubUFTMklVFO3VktF3QzxT2paKH/tyPS6Fl
	v7e+TumK4hNYG6dvhHk49AxLeJJGoXNGznrVpw0O472zYV9z2eR6A1DJkIYhxhB20ga6DYa6q9t
	FNpTbjiby58OEhdOGpvaxfzG0aqc/
X-Google-Smtp-Source: AGHT+IFWzj+a2jEcSFeqt16xGqvYsg4hHt2KWohUxll/dfpOg5XBEYxQ5koWermpn06ri2X/cc+XQw==
X-Received: by 2002:a05:690c:10c:b0:719:b6a8:de30 with SMTP id 00721157ae682-71bf0cd07c4mr133317527b3.4.1754857338692;
        Sun, 10 Aug 2025 13:22:18 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71b5a5cdfc5sm64920957b3.77.2025.08.10.13.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 13:22:18 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] c-ares: backport a patch for a memory leak
Date: Sun, 10 Aug 2025 16:21:55 -0400
Message-ID: <20250810202155.505901-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Aug 2025 20:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118907

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/0001-ares_uri-memory-leak.patch    | 21 +++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.34.5.bb   |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch b/meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch
new file mode 100644
index 0000000000..4d08651be1
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/0001-ares_uri-memory-leak.patch
@@ -0,0 +1,21 @@
+fix memory leak in ares_uri (#1012)
+Dynamic memory, referenced by 'outpath', is allocated at ares_uri.c:527
+by calling function 'ares_buf_create' and lost at ares_uri.c:536.
+
+Signed-off-by: Felix The Cat (@F3lixTheCat)
+
+--
+
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/ee2a1c3eff3c8164b09123005f4b49c571788b59]
+
+--- a/src/lib/util/ares_uri.c	2025-08-10 15:59:17.501710307 -0400
++++ b/src/lib/util/ares_uri.c	2025-08-10 16:00:35.867494819 -0400
+@@ -533,7 +533,7 @@
+   status = ares_buf_split_str_array(inpath, (const unsigned char *)"/", 1,
+                                     ARES_BUF_SPLIT_TRIM, 0, &arr);
+   if (status != ARES_SUCCESS) {
+-    return NULL;
++    goto done;
+   }
+ 
+   for (i = 0; i < (ares_ssize_t)ares_array_len(arr); i++) {
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
index b6945f221d..8204f25cdb 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
@@ -6,6 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
+           file://0001-ares_uri-memory-leak.patch \
            file://run-ptest"
 SRC_URI[sha256sum] = "7d935790e9af081c25c495fd13c2cfcda4792983418e96358ef6e7320ee06346"
 
-- 
2.43.0


