Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED6EC25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 04:58:24 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.2228.1718081904053010219
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 21:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=msHNtCQM;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-701b0b0be38so4860459b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 21:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718081903; x=1718686703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ix0LfY1VbRqndmfQ3TmVZaGiHIuaCxu6jw1n/AnJWI=;
        b=msHNtCQM8IvQr+uGfZR9NcxYjbJDF+bvh0Q0xX5WKzVDJlbXSSsXomZOqWnacGlOXt
         y14IBMwGwFyIHQxVZxRYIIQA3bD9v/JZJ3g98yQWy59ZSgq/yU8zUxOO9FQMhAc65gPp
         FRczyTsSxZDop5Qi+KHzZZT7z8vXJ2wJ8Gepo8pHyZyac38+pjDJk1u6EwtxxSql4IGv
         fQHvAOafDddFw+b/NkWzSi531iEg1S9VmlBs0XjYJsXMOWg2Ekn+Ju5uROwRpq0G9Wx0
         rvyme7Nx6w7PdqE72dK1LLWWTBMzg4XsLtZnJT87IfJ5otSj+3oIxe1tOlresESfnjyO
         w4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718081903; x=1718686703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ix0LfY1VbRqndmfQ3TmVZaGiHIuaCxu6jw1n/AnJWI=;
        b=U4q1hlZ2IeAfKV6fmoCzbfm+w/4ROcyueuSeD2gkUpZt59y0+gxs01NrLIPiqeW/VE
         DkIvWuBXL4uRjs/EKtPl6Q+g5l6nr2Cd7dez56WbMhkaPR8FmtFOYaPl6jU3JdF4ZoPJ
         7n3agtFvxZBNNv0suXiFgIWgdYaxwqn823yZJYC+qw70qQFWISHRkD6aaRBN/v755vnN
         a3aQ8TlOa6fbi5n8o4j9VgJD1X/vvONtknj10mqm4hSKVGjcdxei+OGE+dPYujcYXu6f
         dDYWRiwPcs1Dvm9Q3EdIUREKbRlGwoBjzK4f2Cd/z5i44nj28ewfdQ5ZJYDYfYC3acFT
         4hsw==
X-Gm-Message-State: AOJu0YzmA3SY/OyFH5W7RAsOww/IPwp4DZYM/bAPnWoI0RFaYKtjs6nZ
	IOO/HjeeTBKw0Yr+k0WtDRANg8UTXwC+jHGuWPlQyKtXKlSq2D9UTHRQ4w==
X-Google-Smtp-Source: AGHT+IFxmXQRwIH86vJSLqcUvugoLhUZ7lKlgMRHcG1YIx6DgRsU921+ADiB1fTZQb1YVCo4o4Pn4A==
X-Received: by 2002:a05:6a20:7288:b0:1b5:d00e:98e1 with SMTP id adf61e73a8af0-1b5d00e9b5dmr8375668637.15.1718081903223;
        Mon, 10 Jun 2024 21:58:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c29c240e86sm10134861a91.25.2024.06.10.21.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 21:58:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH] libgpiod-1.x: Fix build on musl
Date: Mon, 10 Jun 2024 21:58:20 -0700
Message-ID: <20240611045820.490708-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 04:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110813

get a patch backported to fix the build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 ...nclude-missing-libgen.h-for-basename.patch | 25 +++++++++++++++++++
 .../libgpiod/libgpiod_1.6.4.bb                |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-1.x/0001-Include-missing-libgen.h-for-basename.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0001-Include-missing-libgen.h-for-basename.patch b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0001-Include-missing-libgen.h-for-basename.patch
new file mode 100644
index 0000000000..d6da9ba6ea
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0001-Include-missing-libgen.h-for-basename.patch
@@ -0,0 +1,25 @@
+From b0ea35260ded2fbd41af46f2f18a61fb783a35be Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 10 Jun 2024 11:09:31 -0700
+Subject: [PATCH] Include missing libgen.h for basename()
+
+This is an error with newer musl otherwise
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=f6444fb306d6]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/core.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/core.c b/lib/core.c
+index 35dcd8e..cf1d677 100644
+--- a/lib/core.c
++++ b/lib/core.c
+@@ -10,6 +10,7 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <gpiod.h>
++#include <libgen.h>
+ #include <limits.h>
+ #include <linux/gpio.h>
+ #include <poll.h>
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
index 111a5727ba..4daa8fface 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
@@ -3,6 +3,7 @@ require libgpiod.inc
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
+SRC_URI += "file://0001-Include-missing-libgen.h-for-basename.patch"
 SRC_URI[sha256sum] = "7b146e12f28fbca3df7557f176eb778c5ccf952ca464698dba8a61b2e1e3f9b5"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-1.x:"

