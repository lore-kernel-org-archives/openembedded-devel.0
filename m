Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C271BE9E2F4
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:00:56 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17421.1770811255362702160
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:00:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fNevDzXY;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-823081bb15fso2648728b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 04:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770811254; x=1771416054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qpCwHFeQBPdItq8hLGh3vQZ3i3fvGmeWGJ463D6tYM=;
        b=fNevDzXYiXXy37Ae6k4wihSr51pHIjvMzNYTKpHz8764XJzRwcsYDbY/29jNCw6ZOH
         tqMeVrxAGWAfIPlvwzOGwEHA/RqLJRrUhi8HWqKnFEDedonTA9EoaA6fIwf7Pij0Jyi6
         SHqIdeexpIk+tYfy1n4M43k+qpAoGy+WhraGnN25gjc/gt7F3pK3mtWFo08FV1xIJS5R
         wtCu730qfKaad+H6GMSbsQXGdwT3+71dK6mwG/droo+0g+Cy5zX/N+MMILp0qQRhqCoQ
         HfoTyshH85SdJyYv8sDLgdoj54DvjY9yHulZvPdTktFYPGfkHUYaa/jYqIplPaEuaWd7
         Iyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770811254; x=1771416054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5qpCwHFeQBPdItq8hLGh3vQZ3i3fvGmeWGJ463D6tYM=;
        b=G05e9fcf9CMOpXKSl9DV4beHLi0ty72HUvXPPHk5x+7u03sstqkRgd7DdNGi6R8NkR
         go98GIUsFxowlY7JxOCkUc5SoHUXVhFvh4k9i2qupU8FqpuyYLkur5iqg5Ovbb74Rak1
         g+F2hcnOdi2mgi6pn5WgJephqxuL00NlsOtRjNlM5BPfH16EN6Dv21jvjsBmkfVN4jMa
         h1REW6gPLZbZmt5Fh4PSEacfiIAq68oWq2oZGxxb+1SLy0XZXkL35nY+oc1KluQbqC5L
         CQ4UYr49FhS9J9L8QWCQWd/nZxHlK4a8TMKmAlVfC/LSbXPAtD2pi41J0dbu3zCyFTFd
         5rAQ==
X-Gm-Message-State: AOJu0Yx/aPp/YMHN7u44Ko9QgoM6PuetD9Osg7TtpjDOr7Kol/A+7PFo
	kSMq56NO7cWiIxQEs7fBlAyDv7ahZ1wBWvAWkF3x4NTrJu8HL/ouxAh2KkycNw==
X-Gm-Gg: AZuq6aJ3EstKndeHuL439Z1yRkfxKMHylTZlDDlOKWEEe3ViPErQ0vzHEjlqH3DexnI
	06ufW5Gt3OKmAmn96Cr8rP/o0K7WJWBa5WTUiHr2xN02KRzB7qFdIgcRqW5ANcDzhWdj5ue7HlA
	7WgjKZQotoDo74UaFDuaraF7aXwwQYywoutsOe37aufrN9QSeepk6i7n817wwweYWur2fPXDO07
	5CVBLafsU5dOWY91hELYCFnaKPyXmRWf9NgtfhfqVDqwZJpUvIE9RVYDqYfmJkdhxqyn2p4r/9r
	NAA4W1t9hAqnhBFX9nsOyxFIUsDJJFDNzYXHZWSlqQLBDl6sEJNUeJPbjIR8BOilsBd2yedOEO9
	0ZYfZQgI/LRAFsFvRKpxO5sPwR1KO0P40QOBAzI7Z78qajQpGINhxgunTZx0SD0svCFx/rAbW51
	8tvuB2TTcLEpIE3VZDj00FT3UUgcooGmQZy6g=
X-Received: by 2002:a05:6a00:238b:b0:81c:717b:9d39 with SMTP id d2e1a72fcca58-8249b13565amr2017031b3a.56.1770811254511;
        Wed, 11 Feb 2026 04:00:54 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3669d8sm1805831b3a.2.2026.02.11.04.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 04:00:53 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 5/8] minizip-ng: 4.0.8 -> 4.0.10
Date: Thu, 12 Feb 2026 01:00:22 +1300
Message-ID: <20260211120025.4190831-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
References: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 12:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124333

From: Liu Yiding <liuyd.fnst@fujitsu.com>

1.Changelog:
  https://github.com/zlib-ng/minizip-ng/releases/tag/4.0.10

2.Remove 0001-crypt.h-Remove-register-keyword.patch as it was merged upstream.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5f6dbb284a16d3e0e85bb9ece7566703c213ba63)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...0001-crypt.h-Remove-register-keyword.patch | 35 -------------------
 ...nizip-ng_4.0.8.bb => minizip-ng_4.0.10.bb} |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-core/minizip-ng/minizip-ng/0001-crypt.h-Remove-register-keyword.patch
 rename meta-oe/recipes-core/minizip-ng/{minizip-ng_4.0.8.bb => minizip-ng_4.0.10.bb} (91%)

diff --git a/meta-oe/recipes-core/minizip-ng/minizip-ng/0001-crypt.h-Remove-register-keyword.patch b/meta-oe/recipes-core/minizip-ng/minizip-ng/0001-crypt.h-Remove-register-keyword.patch
deleted file mode 100644
index c471b098d4..0000000000
--- a/meta-oe/recipes-core/minizip-ng/minizip-ng/0001-crypt.h-Remove-register-keyword.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 469beab0747549599959a30188deb3b27df3a346 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 2 Apr 2025 11:19:54 +0800
-Subject: [PATCH] crypt.h: Remove register keyword
-
-Fixes:
- | In file included from /buildarea/tmp/work/core2-64-poky-linux/minizip-ng/4.0.8/git/test/test_compat.cc:17:
- | /buildarea/tmp/work/core2-64-poky-linux/minizip-ng/4.0.8/git/compat/crypt.h:62:9: error: ISO C++17 does not allow 'register' storage class specifier [-Wregister]
- |    62 |         register int keyshift = (int)((*(pkeys + 1)) >> 24);
- |       |         ^~~~~~~~
- | 1 error generated.
-
-Upstream-Status: Submitted [https://github.com/zlib-ng/minizip-ng/pull/853]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- compat/crypt.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/compat/crypt.h b/compat/crypt.h
-index 41c6454..ccdd83a 100644
---- a/compat/crypt.h
-+++ b/compat/crypt.h
-@@ -59,7 +59,7 @@ static int update_keys(unsigned long *pkeys, const z_crc_t *pcrc_32_tab, int c)
-     (*(pkeys + 1)) += (*(pkeys + 0)) & 0xff;
-     (*(pkeys + 1)) = (*(pkeys + 1)) * 134775813L + 1;
-     {
--        register int keyshift = (int)((*(pkeys + 1)) >> 24);
-+        int keyshift = (int)((*(pkeys + 1)) >> 24);
-         (*(pkeys + 2)) = CRC32((*(pkeys + 2)), keyshift);
-     }
-     return c;
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.10.bb
similarity index 91%
rename from meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
rename to meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.10.bb
index cf98c0cf2e..2e7f438821 100644
--- a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
+++ b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.10.bb
@@ -7,11 +7,10 @@ LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36964f044224efeedd694983c34e716f"
 
 SRC_URI = "git://github.com/zlib-ng/minizip-ng.git;protocol=https;branch=master \
-           file://0001-crypt.h-Remove-register-keyword.patch \
            file://run-ptest \
 "
 
-SRCREV = "55db144e03027b43263e5ebcb599bf0878ba58de"
+SRCREV = "f3ed731e27a97e30dffe076ed5e0537daae5c1bd"
 
 
 RCONFLICTS:${PN} += "minizip"

