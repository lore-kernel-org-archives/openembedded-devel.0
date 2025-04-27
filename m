Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA526C369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 18:53:20 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.31740.1745779994909430728
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 11:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ADQYnzNH;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so6425201a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 11:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745779993; x=1746384793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xb6jWCtF2FRksEjj3i7i/dQpot9oV5I3eyX9qmhlYPc=;
        b=ADQYnzNHWTrnB2a5wMOVC7zUXx349OCDdGPn7WlfIzNgnhvBZeY6Sk+FSmHETLRtku
         Ep3c01zMt4/BX82yCClRRT49UE9Vw2ljZHmIH9vRHNPC1kiy2pyXSG3/UY972DlZePTP
         rNSbB6L9dI3vD0juKg4906khnQ/ciaITDkwm1/+1v0cHGzb1MiZPiAi8ceNv/dKyW3yL
         ElH9niT3tlq5SP7Tg+z2UnpTSoqreBD4DwSNtbeniUHwMAiIe4XJppsEBv4acHzrPqL8
         jiLrCrIoaksWQWwv3c3OiMJ9rEpbfMIYnhLJ8bCeeJE+dgkEZpSmgvjNy5x/dMymSS1p
         7PpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745779993; x=1746384793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xb6jWCtF2FRksEjj3i7i/dQpot9oV5I3eyX9qmhlYPc=;
        b=llAwxW+VU+7TMBYm0E7QOS0KGTpWy8l8Oxrla6nmTIoFTQK/o2g/giX0xOjuPiFBoS
         JkRX0Bu5X1i4sUQ641Yf8B3sf7tgtaMHu6U4KfAVW3ZOnhzKkmp8vICiKXiV/XaJ88FR
         tgTgay2E97MalPbyp3FjHfa47+mGYTh3rz22WQOdZ4u783f4bSU9zWs4+OurLtsg7HYo
         eF2lVB8Ezbj6eWYI9mSVcKX9XlfkJlw9UDtbh6RUfhZ6I40VmxiEXHWh3erMXxQfCOj/
         1pSbue8DEXS0r1l1hDC9qGPpRHV3Kza8j3NS8MjjIRQv4RtT1UnS0cF1nc7tAB5EmNvG
         FhCA==
X-Gm-Message-State: AOJu0YwFisfgdvqcarSuyNTPAmD3puZKCpiDkHzQIAcATepsCTYcbA0z
	P9lRXcpoTYPbDLuzfzEshqFsHsXUZrBdwgrAx2SmPFmFojO8yn+H7bL9IDuu
X-Gm-Gg: ASbGncvqIoLbqUESATS2ENyKDUcpNiBReXl2bqv/Hs+ENcQ81RgpqSxtcx7tFjgaOw0
	ntHa410klr8cMf+bzSN0oCA+36aIEtD2Wribk9gX3JD3iQKUdRlOjJmf/5ntOxUupCfUFgMw2tj
	b8Wz7hY/chpAkPnTGhWIa4s7AEWzdzYjkCvz5I6fhW9xgdCwp9q3uMSEoDrK5hBl+npDzCJfq/Q
	hTon/1NwxRGQpkjY4QK+cjK+xED2WdRufnh0W4pv925Tv5adA/HrS9hIcAyxkUA378/0qD3wWlZ
	6EcuDXj0E8MTSq3XIOXPHYs0+JwAsYrvNpPaMn5n1jQ=
X-Google-Smtp-Source: AGHT+IFZT3a8S643Zs4IRcLs7Ndf2q9/PNyRW6kWEvCcxVY1rs409AGMv+5AORTxrd72BCetIM1nUQ==
X-Received: by 2002:a17:907:9625:b0:ac7:805f:905a with SMTP id a640c23a62f3a-ace8493b526mr554978866b.28.1745779992942;
        Sun, 27 Apr 2025 11:53:12 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6ecf8304sm482396266b.111.2025.04.27.11.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 11:53:12 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] xfstests: bstat: use uint32_t instead of __uint32_t to fix build with musl
Date: Sun, 27 Apr 2025 20:53:04 +0200
Message-ID: <20250427185304.337603-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 18:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117172

From: Martin Jansa <martin.jansa@gmail.com>

* with musl this fails with:
  http://errors.yoctoproject.org/Errors/Details/853041/

bstat.c:65:33: error: unknown type name '__uint32_t'; did you mean 'uint32_t'?
   65 | static inline int xfs_highbit32(__uint32_t v)
      |                                 ^~~~~~~~~~
      |                                 uint32_t

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ..._t-instead-of-__uint32_t-to-fix-buil.patch | 33 +++++++++++++++++++
 .../xfstests/xfstests_2025.03.30.bb           |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0001-bstat-use-uint32_t-instead-of-__uint32_t-to-fix-buil.patch

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-bstat-use-uint32_t-instead-of-__uint32_t-to-fix-buil.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-bstat-use-uint32_t-instead-of-__uint32_t-to-fix-buil.patch
new file mode 100644
index 0000000000..6ac2dd92b4
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-bstat-use-uint32_t-instead-of-__uint32_t-to-fix-buil.patch
@@ -0,0 +1,33 @@
+From c3cc5c68a297a98adb9a7046c7563d0678245243 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Sun, 27 Apr 2025 20:29:09 +0200
+Subject: [PATCH] bstat: use uint32_t instead of __uint32_t to fix build with
+ musl
+
+* with musl this fails with:
+  http://errors.yoctoproject.org/Errors/Details/853041/
+
+bstat.c:65:33: error: unknown type name '__uint32_t'; did you mean 'uint32_t'?
+   65 | static inline int xfs_highbit32(__uint32_t v)
+      |                                 ^~~~~~~~~~
+      |                                 uint32_t
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ src/bstat.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/bstat.c b/src/bstat.c
+index 9a028a0d..a833af59 100644
+--- a/src/bstat.c
++++ b/src/bstat.c
+@@ -62,7 +62,7 @@ static inline int fls(int x)
+ 	return r;
+ }
+ 
+-static inline int xfs_highbit32(__uint32_t v)
++static inline int xfs_highbit32(uint32_t v)
+ {
+ 	return fls(v) - 1;
+ }
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2025.03.30.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2025.03.30.bb
index 94d37c03a9..b300fdb88c 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2025.03.30.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2025.03.30.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;ta
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
            file://0001-include-libgen.h-for-basename-API-prototype.patch \
            file://0002-Add-missing-STATX_ATTR_-defines-from-musl-sys-stat.h.patch \
+           file://0001-bstat-use-uint32_t-instead-of-__uint32_t-to-fix-buil.patch \
            "
 
 S = "${WORKDIR}/git"

