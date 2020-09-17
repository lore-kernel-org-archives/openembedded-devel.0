Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.458.1600353849104349518
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2020 07:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=W0Umzx5f;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.68, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f68.google.com with SMTP id z1so2385795wrt.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2020 07:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TujOU9u3BU2EIj3fQQxQwRJEdH8oAy6YKYP63Xvetng=;
        b=W0Umzx5fQDAzZMdA1Nf77kdhr8pONc86tkxpklw5p0Sif58NZUC/88oaKqgvY8ffeH
         Mgdx1pxIIJfpyWkszQA0PSKl6pE/jxyU8L5CfBqRyXvlqrfhVKvtEJa4ZAcqKmbPgfLT
         ZlKTveFsg266K8JPkKnJT+/OG/URZzrxj9BxVPoalNB1uekCiIysSitOHm8alSSWRe2x
         T/N6Lm6ll2TvYSNMTG5RNCBMgPDEL9VxvvealBvDMagE4RkOADPXE3XjDRisa3ANytRc
         ZlO9cHauKyeIVGmsB6lIbzSQrOnvSlBXou5T4bVo3u+Jk4UM33/WoytJRHq7IFlfCzBA
         mqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TujOU9u3BU2EIj3fQQxQwRJEdH8oAy6YKYP63Xvetng=;
        b=ccS0n2p7KPJ0gYGwQN3nrVfWMYex2+8XOD5y2rBSolk0VimL1G1fe/q5qVGvcBqurM
         jE6Ico5HiB/5Ok4jhZ5Pea4Nkq6tVDrFdICAug5AmD7ErbxxrqaV0OCf+ZMJxplE/5nI
         SmiMSMp5AYr/p0jGvxBBOd3ZYeJIjk74SPcV64HfAMizFUJtuj4QPllbw+Sz61WV3dk2
         N4n0eFTP6r/Gqgwa5+oAo4jvAZE91D/UAUkb6kYJkeSIIdFP4xSgmA6RqgBKJLqqnXvn
         FuyMKA1hnq6cpIIfAJmw5omyCMXNFgZGm0aq+IHPljfANABEd5efB3Anz69thYCuU/Td
         LVmA==
X-Gm-Message-State: AOAM5327SgMhgB3rUsjqoKei4vXKCCQZlSNtEKZRcuS8ppfu5T9athbM
	u7H12sBJR/wjmCCZTeivMH3gBw==
X-Google-Smtp-Source: ABdhPJzHdp8povBrYkVh+L44hgFGOQM7JCBOot0z8rsZIn0saKSBYqwHn/LAYu2A0f4ST2iI4+1JlQ==
X-Received: by 2002:adf:f58b:: with SMTP id f11mr32501499wro.250.1600353847267;
        Thu, 17 Sep 2020 07:44:07 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id c14sm37896730wrv.12.2020.09.17.07.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 07:44:06 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] libgpiod: drop support for 0.3.3
Date: Thu, 17 Sep 2020 16:44:04 +0200
Message-Id: <20200917144404.805-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I no longer support the v0.x.y series. Remove the recipe for v0.3.3.
While at it: the tests PACKAGECONFIG is duplicated so remove one
instance.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb | 8 --------
 meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb | 2 --
 2 files changed, 10 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
deleted file mode 100644
index c4d2bddf4..000000000
--- a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libgpiod.inc
-
-PACKAGECONFIG ?= ""
-
-PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
-
-SRC_URI[md5sum] = "2aa1e1a80c3c919ae142ab9a55fb59ca"
-SRC_URI[sha256sum] = "b773e557af1a497f786825462a776b7bf90168e67ee0a5bc5d2473a5674dc38c"
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
index a9a462866..b5a64a554 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
@@ -9,8 +9,6 @@ SRC_URI[sha256sum] = "f1cda2789e6a13a92aefc012a76e5a7cc57a1b402d66f71df8719ee314
 PACKAGECONFIG ?= "cxx"
 
 PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
-PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
-
 PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
 
 inherit python3native
-- 
2.26.1

