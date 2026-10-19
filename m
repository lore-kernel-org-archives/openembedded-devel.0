Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CFACCF2DB
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 00:41:36 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24903.1792370492920114596
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 17:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ddZ6bm7J;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35ef6b49813so3031021eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 17:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792370492; x=1792975292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9bgd2r9v3SgM0ysaLKDJ4+/iQsPs5a+dloR5xnjVew=;
        b=ddZ6bm7JgGnU4h3dfFHPe3xqEGBxiH2qrzzeibtN5AZhRdb5i6MGbdFJNDvm0SDgxe
         XpPlgvmDQeMWVsjeSBESq6tMakUg4yxmLLoc6OpBkL8xMjTEPjtVyhzWFan02VXMmhK/
         asNWgd2E/V6w2FeyQ1CFOff/Hr0MZ4I0T74A+X/UcroyZDQOs74FC2zJQ22IRhmqtDMc
         z/uWB3RV+gy/ZuIz3jLa4g3oqXjsKy0uN4dJCcHimDZw2ie4JaTpLqV+V5AzGxPVfn4a
         cfah6rxk5lz3oZnJ7wqUOIpO6PK4uFHz1E3AIm0hSbess7QOyxh3OrjW1xQa7rVghzlc
         ueNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792370492; x=1792975292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P9bgd2r9v3SgM0ysaLKDJ4+/iQsPs5a+dloR5xnjVew=;
        b=ZSvAgsAP8IjdApxitvsg9qdLWtPZYnKoKzScNb0IlwKWfl2qrdsupVtDXasvjApayI
         XRU9i6mG1EsmdJgp7CGNLAJ+ftGx4IEmlO3OxPrwIQqE417X8CwPEYJN9vqP9heWIP9G
         uqqxK394MIfDA5oriDk5elUVBhXIFpcVQG3judGPTVNvU9/l0MLzTiKIpI0vHKrBL8tG
         zFM8YTNoAkb5SqHiXNX1SLhxn2VkEexOmTYF+temFAHG3rvhz4NMjC+nva7yoGiqY/Sj
         urTbT8XmBWZ341eq2xO6SrOeC6yIy9iyLYHgEl8lA5DqI30CgnBBV+ZlNFHSJ2BvO2hO
         pCig==
X-Gm-Message-State: AFq9FYI/rMggf33yNLw2MJ7lNA13ttIgdkg5nx4y7O+NuN392wltM2I2
	Sb7TsaAx3BwcmElj/Dql71fTPNqqziMLa/Z/dUHPQcO1Z4SdZ7oqIBiKvTVMNwTqB0o=
X-Gm-Gg: AYBFou2srgNKkQErgk+xCs+3KnP9OyzXCzLEpIKfG1HoWiUzlJbmiGL99m3XBIGvkDo
	9iMtiXIJ8Uh4f/a1nACxWO45bx2TnML3hYLKIukREirt8KKu0lHAUKq+zUXrMWjcZFGwQmdN6d4
	yj4jLoOVKRAQUnwgfVnAbaipGJjeL+st33naotl0dsyvRSnJRSVPJBB4Om1QylpALCeLPu2pi2P
	+N+6hRgZwLDniZ49XJZS4ZP7qhHhP9wgMbjMye0ClQjmT18cPX+S3prBqB0OAFt95KYdguydXpw
	mmqbXZhJLmJxukywJJGXwMMVZ6PN0JCuHktkYBjclnjmIW8N9XvsNxQFMnEpH3l46RyAhJa3lVo
	4AFbVAG7LJK4Ytfarlz31xy/bpGbrWCU5lHck0Qdk/T9t5simP+prAymWpN5aZC1JNB+0bvUHxv
	WBfuzV42i2lPP8m5B31OqMnxxuboldfUZF17U8kZ5Q6F08avlUjV40jY5ydKzO1sadShO6usx6l
	x9cyAnPLJYmPf5UaBLWwc4/hAyscMhkRAEnb2mAphG0u3Q3N4bWtIFPB1+iIrnp3h1t7Cs9GRbO
	nD0KH3mEiYi5YiT8eRkkm+UgKPEK+VPl1Ke4/mFUp+3l7SYOI5lxJKHtQ5XR7rH5rUJ/3W4gwWL
	mN01a+WFQWhLM13OfVGxUUjP/G2ucppvI63vVFqhXav179IBQ39mileQqx2m1sqFEmCvVHmBNTn
	zTvLJW6amQA/0VLN+dbPivsTWPkmOd5USIWVs/3nT2Va2lIB+/a5f2T3YN
X-Received: by 2002:a05:693c:6395:10b0:35d:b44:a52 with SMTP id 5a478bee46e88-361a23528d5mr9401387eec.24.1792370492203;
        Sun, 18 Oct 2026 17:41:32 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm45211774eec.28.2026.10.18.17.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:41:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 7/8] zbar: Fix test build with musl
Date: Sun, 18 Oct 2026 17:41:21 -0700
Message-ID: <20261019004122.2475327-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019004122.2475327-1-khem.raj@oss.qualcomm.com>
References: <20261019004122.2475327-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 00:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131106

test/meson.build assumed libc provides argp whenever argp.h exists, but
on musl the header comes from argp-standalone, pulled into the sysroot
via v4l-utils, and test_decode/test_video failed to link argp_parse.
Backport the upstream fix that also checks for argp_parse and falls
back to the bundled non_argp.c.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...build-better-detect-if-libc-has-argp.patch | 31 +++++++++++++++++++
 meta-oe/recipes-support/zbar/zbar_0.23.95.bb  |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/zbar/zbar/0001-test-meson.build-better-detect-if-libc-has-argp.patch

diff --git a/meta-oe/recipes-support/zbar/zbar/0001-test-meson.build-better-detect-if-libc-has-argp.patch b/meta-oe/recipes-support/zbar/zbar/0001-test-meson.build-better-detect-if-libc-has-argp.patch
new file mode 100644
index 0000000000..6bab32b05b
--- /dev/null
+++ b/meta-oe/recipes-support/zbar/zbar/0001-test-meson.build-better-detect-if-libc-has-argp.patch
@@ -0,0 +1,31 @@
+From 77ad19ae9bc3d0fa0f2208be99e562fb96a6e392 Mon Sep 17 00:00:00 2001
+From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+Date: Wed, 14 Oct 2026 09:21:42 +0200
+Subject: [PATCH] test/meson.build: better detect if libc has argp
+
+On some cases, the build system is not properly detecting if
+argp is there or not, because on non-Linux systems, they may
+require the location of the libraries containing it.
+
+As we have our own simplified version of argp here, and currently
+we use it only on tests, if the library is not there, simply fall
+back to non_argp.c.
+
+Upstream-Status: Backport [https://github.com/mchehab/zbar/commit/77ad19ae9bc3d0fa0f2208be99e562fb96a6e392]
+Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ test/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/meson.build b/test/meson.build
+index 656c8aa2..42905b80 100644
+--- a/test/meson.build
++++ b/test/meson.build
+@@ -1,5 +1,5 @@
+ argp_compat = []
+-if not cc.has_header('argp.h')
++if not cc.has_header('argp.h') or not cc.has_function('argp_parse')
+   argp_compat = files('non_argp.c')
+ endif
+
diff --git a/meta-oe/recipes-support/zbar/zbar_0.23.95.bb b/meta-oe/recipes-support/zbar/zbar_0.23.95.bb
index 489615721a..e3e337d50e 100644
--- a/meta-oe/recipes-support/zbar/zbar_0.23.95.bb
+++ b/meta-oe/recipes-support/zbar/zbar_0.23.95.bb
@@ -9,7 +9,9 @@ SECTION = "graphics"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5e9ee833a2118adc7d8b5ea38e5b1cef"

-SRC_URI = "git://github.com/mchehab/zbar.git;branch=master;protocol=https;tag=${PV}"
+SRC_URI = "git://github.com/mchehab/zbar.git;branch=master;protocol=https;tag=${PV} \
+           file://0001-test-meson.build-better-detect-if-libc-has-argp.patch \
+           "
 SRCREV = "dc19fcc7da58e8cf84ba1ec417e24b04609feb23"

 DEPENDS += "xmlto-native"

