Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5382DCA600A
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:09 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31263.1768811282198714085
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LqTm4gLd;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a3e89aa5d0so40241395ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811281; x=1769416081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UIxhblxXHUE7wGq0b+wCdjDVhd2tRvddlap1qlQyDxM=;
        b=LqTm4gLdGRXV1y56+yUAjBkizlsWDx/PLP9bRz7tehqunIuYdd7r01VH28ccnWMydz
         4jkqvbZNfqwc2ren6qcA7EW+sicQ+XkW+2xtHty0rcKHXTs0J5jFGa35dTUaK+cWS7Sd
         CTGz5ysekTIjwwEuRn/oV1IAeLH7ranCkf2yvxFu9mjEZ5yFZnBDm9vUERrG1QGKyx2X
         rxkLuPqIKhUPu+WpaFveHxNaqIACkvS7MU9jX5QEszbgZgZQcK+LZpnMxkUftPWNC/zF
         8TuhKpnq/83yIkQmkY7FMPdlMyxG6z4+TpJ1/lKVNemI8v1ayye1CZ3nj2OR9qKnLP7u
         LGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811281; x=1769416081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIxhblxXHUE7wGq0b+wCdjDVhd2tRvddlap1qlQyDxM=;
        b=Inn1wfmsafoBH8lTmTPGC58Yz+VxUosAbr9ZboITsjONSDDurzGVDK8rEGq8zpD+Zo
         hOaJvLrZlYbWyzcCjyK5NfVc48OhyN9GjSMSmO3xVNsVpVR2rzWcJoh7MqEL1XGpp25a
         vtajEYkxyk50ykMY2NUpk5EdIt1gyx3en2cs6+yyhqubwuYSBzD+pK1B/TkvncoIrTko
         Meuv6I8V/J53aTk9p4RovJuma/X7QtVJka3graZIzWFwB9Y+1tn7YMQYTVe/l4cvAOqA
         +G8eGwVeR6/8eRuUTtoo/ZRxxXVVz1DoGfwo0+/8DG77yM4BlZVQkRprYclFfydMv/7L
         LWEw==
X-Gm-Message-State: AOJu0Yw8xAcVSCQL6A2DRZ5qWq0W+3bKMNDSpw2Ir0r0U3YS4Wmh+wSt
	3qtVFDFlDSb+PEJW/qu3F+gWDMP2QFu/UuRm1nbuASC21l+Zx/BakVNDgqpH3A==
X-Gm-Gg: AZuq6aKGrDCE0pNT6DF99mV37a0bfAdcphcidIidcSzztpCApABAsrR/CrleLIjt3KY
	1HxM7+baF5TT2Cl8inJL7224jK/Pie6McAUEfFmXIUBfzambYUU5G3RxnBrMX7SyacMVEcma7Od
	RON5TPcgbR1ix++vezb7dlRIxACZJ8O1mejEuG6okdQupivSD1GYOeIJlaF/cmLUpWfTJ9qMJ2X
	kyvuwZ83mLzHjopGu3ThnuXoIU5BKzndSDa20wQMQ5MqxS7S5QYEoHxP3meSenG12WfDvd4btk3
	Rv/DqJB16tsD15iRYwLyUavIgtcXLQXXJleTyv22o0lHFnDP2eAo1oGqKP+I7IZbmT4NY6zds6r
	ob0mQMFXZQPtvEHkCUHARrQ8tYmlCXY7QrGM6zOMe3BS+X/BZyhWvbUe2f2dkD/ufSZ6DVkg/K4
	1ntTjpNnGm2pmaGmTxOTujA2Q=
X-Received: by 2002:a17:903:384f:b0:2a0:a484:6b87 with SMTP id d9443c01a7336-2a7175be723mr116605225ad.47.1768811281246;
        Mon, 19 Jan 2026 00:28:01 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 01/28] python3-psycopg: upgrade 3.2.12 -> 3.2.13
Date: Mon, 19 Jan 2026 21:27:23 +1300
Message-ID: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123595

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- Show the host name in the error message in case of name resolution error
- Fix Cursor.copy() and AsyncCursor.copy() to hold the connection lock for the
  entire operation, preventing concurrent access issues
- Fix GSSAPI check with C extension built with libpq < v16

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4b297312d7d256ddbca007f9fbdb1daa337fe431)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-psycopg_3.2.12.bb => python3-psycopg_3.2.13.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.12.bb => python3-psycopg_3.2.13.bb} (85%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.12.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.13.bb
similarity index 85%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.2.12.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.2.13.bb
index 4133a4b5b0..49030c56fd 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.12.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.13.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "85c08d6f6e2a897b16280e0ff6406bef29b1327c045db06d21f364d7cd5da90b"
+SRC_URI[sha256sum] = "309adaeda61d44556046ec9a83a93f42bbe5310120b1995f3af49ab6d9f13c1d"
 
 inherit pypi python_setuptools_build_meta
 

