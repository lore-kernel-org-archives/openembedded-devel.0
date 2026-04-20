Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9EFF557EA
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 08:47:03 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15113.1776674815671264786
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 01:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JdaF+0Iv;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a40b2d26a1so2269481e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 01:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776674814; x=1777279614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bjda2EpxFJlyg/P41JdQKnaf8q0rIgJmoPzfFH2nE6M=;
        b=JdaF+0IvXy0qtW1yUOMegaOBitZ2X0b7M6DfNSD013jhmz3ORDMTMpmQO/eGxHOhkY
         A4JvZCtNLZHDYypD+f81DlngLuBzcDfWhe5TljuKmJDUsm6GXuJDm0ZHfbJ8BySHIQt0
         IQvCZjR6HuYG83rW700q71b/gWlVFw8frYzuywu4ypZcFvnUBLvVEwh/RZInCXu9bxHq
         ln4e8EtZzoe6ZbWvL3VbFFBL4nWscJrye3vKt/KcuP2qPu3HpbdDFs3tg9x4Db3zmoYf
         ZjZj4amdoHQKQ/YgASOwhMkMVXvCDTHl8T685L9sfV0LYw6RtzqYz0MvHQQ2dMdb5oXv
         KWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776674814; x=1777279614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bjda2EpxFJlyg/P41JdQKnaf8q0rIgJmoPzfFH2nE6M=;
        b=L1rloMCXZreMCr8ahq9GK7XnfWqdJZ5K8+LJQ2dCGnmJvmkei4OrTGWxBOYwoOfaNa
         /XP+c02JPWKEVj0/VnvB1anw1BTlCxFqwZl9FY66TmEDGnXBbzno0FEOobYmBsLTjzNK
         S1iIzNIqKo2bG0CslEihrfXZtF69mOZ2fCfcA0Rghn/h7RuhjyfFQisOCt0fBkJTr3pN
         XchEA4F/mGobv9lfyQXMY6lWWT3qGImeTsZarZIgcRU1AZL48YrsiAy5h7cotaadB3v7
         QOZfZ41Ys076nrYuXbbBsJd6OpD9ggJt4xUZzxSC2V89pkDHb6kfRhpEO2ATmn/8oj3C
         CycQ==
X-Gm-Message-State: AOJu0Yw4YJFO/NNvx00L2pkOnbgx/zMzdsPNxcmNz9VS5sSkm1vyKm4T
	A9Qw0jiwpXI4w1vsA/cGMO0jIwIihQ6O9+aEEPEDs4QSsbeK0HeSmHYP9vqS7w==
X-Gm-Gg: AeBDieuSzprh4TDVa0xi7fUqNsflmDf44tUIiyYEVyCpliTdqwqLT9BFsDNJphA7pDZ
	4rPsVQTkAOCsevmPcJGOyLxqRomVhRLutU5WX7EtcHezfphrVkyiFAxSJZtJduVivFzs0zYiK7X
	Rqjws5zyxqBpPdwwjPGi0Y01mb16wwEvGPCBbxCQyFHgJ0J99zlbQ5UJ1tBQib6IPN8yc4Zg84J
	rA2OPWT4BzbMQ7L4rX2ck0+AXNY400SyUQqoQlbhz7ZVeCIACipzdZ0DZwrKnomJOaMfth/c2wc
	3/p0gtAvmtjUSxBd6h7hdBB57KSecX7Fqr1rwG4hvT0EhGQh/l010x1le03Xntxf33sD48ZzL8y
	i8ZZlw0ldJQ1SpztPFp0+425O27fOFm3US++QbbktEiFW9BXllJ9JbMVqRQFLHj0OhoqVcYv5Ud
	W+X9jigmGRIv6/mfm47+7y7rOB0v3z+qicek3y64/rleXLDRh2p86jgxFilXqYvYiVSfEbqAF7S
	paPZYKzcQfWRw==
X-Received: by 2002:a05:6512:3193:b0:5a4:1310:473a with SMTP id 2adb3069b0e04-5a4172ca11dmr3832403e87.10.1776674813096;
        Mon, 20 Apr 2026 01:46:53 -0700 (PDT)
Received: from dcbuildsrv.ci.qt.io (ip-109-75-238-172.customer.as29154.net. [109.75.238.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad0e7sm2778990e87.12.2026.04.20.01.46.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 01:46:52 -0700 (PDT)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] minizip: backport fix for the missing header
Date: Mon, 20 Apr 2026 08:46:38 +0000
Message-ID: <20260420084638.985052-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 08:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126486

Minizip release v1.3.2 is missing required ints.h header that
causes build failure on components using it:

| ../../../../../recipe-sysroot/usr/include/minizip/ioapi.h:74:10: fatal error: ints.h: No such file or directory
|    74 | #include "ints.h"
|       |          ^~~~~~~~

Backport fix from https://github.com/madler/zlib/commit/cb14dc9ade3759352417a300e6c2ed73268f1d97

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 ...ncy-to-ints.h-in-minizip-Makefile.am.patch | 25 +++++++++++++++++++
 meta-oe/recipes-core/minizip/minizip_1.3.2.bb |  4 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/minizip/minizip/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch

diff --git a/meta-oe/recipes-core/minizip/minizip/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch b/meta-oe/recipes-core/minizip/minizip/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
new file mode 100644
index 0000000000..1d05989c74
--- /dev/null
+++ b/meta-oe/recipes-core/minizip/minizip/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
@@ -0,0 +1,25 @@
+From cb14dc9ade3759352417a300e6c2ed73268f1d97 Mon Sep 17 00:00:00 2001
+From: Rui Chen <rui@chenrui.dev>
+Date: Tue, 17 Feb 2026 10:48:39 -0500
+Subject: [PATCH] Add dependency to ints.h in minizip Makefile.am.
+
+So that ints.h is part of the installation.
+
+Upstream-Status: Backport
+Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
+---
+ contrib/minizip/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/contrib/minizip/Makefile.am b/contrib/minizip/Makefile.am
+index d343011..b7dea4f 100644
+--- a/contrib/minizip/Makefile.am
++++ b/contrib/minizip/Makefile.am
+@@ -27,6 +27,7 @@ libminizip_la_LDFLAGS = $(AM_LDFLAGS) -version-info 1:0:0 -lz
+ minizip_includedir = $(includedir)/minizip
+ minizip_include_HEADERS = \
+ 	crypt.h \
++	ints.h \
+ 	ioapi.h \
+ 	mztools.h \
+ 	unzip.h \
diff --git a/meta-oe/recipes-core/minizip/minizip_1.3.2.bb b/meta-oe/recipes-core/minizip/minizip_1.3.2.bb
index 49e4a4b561..95a605ecf4 100644
--- a/meta-oe/recipes-core/minizip/minizip_1.3.2.bb
+++ b/meta-oe/recipes-core/minizip/minizip_1.3.2.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://zip.h;beginline=14;endline=30;md5=b7d2930a7332b2bc68f
 
 GITHUB_BASE_URI ?= "https://github.com/madler/zlib/releases/"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/zlib-${PV}.tar.xz"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/zlib-${PV}.tar.xz \
+           file://0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch;patchdir=../.. \
+           "
 
 S = "${UNPACKDIR}/zlib-${PV}/contrib/minizip"
 
-- 
2.43.0


