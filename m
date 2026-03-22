Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6ACFC72BF
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 10:51:41 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28526.1774176699924140374
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 03:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WaUYY496;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c73fbdd9b53so1010393a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 03:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774176699; x=1774781499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kyZEppuSxuKbgqbU5imBlFxfEzz/EzP9Ndm1QDAGcQk=;
        b=WaUYY496JNtJzE91JHNKBGU862SRcMfTZiSjkELLu9F8c/IS822utUQEfw3jASNP1q
         /osQHp7g9P7IXjvbaPAiKdamOY2oLvn3cg2038CTkgD95mQ5FqQHMZzl5pZG1dOjVkhE
         dZvK5WsRWRTVnO6dlFvlnk2dtdE65STIR7UjybfnZAuUlNeas4qRZUsGj9tJlYETED+T
         A2B0iYRAA10u/ZycLXKsqERLzGiTgHbVp0EM+sxg5bv+lCzd9FVEpHPQdlLH+QwXQtcF
         mU3LPmzQ0X7eB9R48DDAxGPw9CSfIlQwY5Gu85S8cx6yQ9JSOb5HZOL9CAxUaOvQzjVu
         jPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774176699; x=1774781499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyZEppuSxuKbgqbU5imBlFxfEzz/EzP9Ndm1QDAGcQk=;
        b=Kb7ZNzAA3j3+BHapoWIv403mtNIiLk2LHeLghrkyVKPse6A0yGCb5d3A3irVLZBonj
         glijUi8iNVRUS6RzlL+8hrL8vQbUaRRs2+ZjpoddhUazkzlZJ4uSmu8Gj7JeihoPHE0x
         JRaBD+2IvD7LgqteHTiZ0Nxm0F+JDzrRpBtPdHLfOQMoCPCDUJCttwamhU60BUr01UeT
         T3zNEk2sZzL1eBJKmzEeYu247dhG9DBeJBEE99QxrGRSKlsLo3kKDAEmHUxcZTBq6acn
         ztp9cRUuxsx62FS4liV05WUVyILhnduB0GgHo5e4vT3Aob9RyM5Jw25AquBA0rTdBao4
         O1aA==
X-Gm-Message-State: AOJu0YwYpK9D4C5fcR1btMwAApB4YsDDGAkv1WWuntdfa/YwrKUk+bSf
	wOIU5h6ZO6PF1Mo4SDVE/WbUPhrh6GMTkPzY9rZHZh7o2cfz741sv14dWx0ojmY3
X-Gm-Gg: ATEYQzzMTP/tAyt7dc0F/ens1mOfAm1K5f99QGg8Kx8qDvXIVUwjuQa4OdIkpMr76Xn
	pBzd3hCU2MVHV+nDXbFu4uHKkzFQa3Q0RBRaYxu589zShQ0a2duIw48dbQ+HNjf6glCkpAzgAFo
	5whRGPxnjFQzb6hA1jfcit5d2uLQvi5nDmyYVh/D1HWUaHcb6G3m9BkiAHYTwUO5rZBIhPaRzUk
	b7t2gS/p2LYFjjH0DIac3Qf3DjcYV5XtR2XZVyvI2DSvFqF3X6KWXN83weQGbPRxWRQi0XKdqOX
	y6VKwCL9Nusgyb3SIx0lx05B5juB3rnfSiVJYjwEwWbVlBmHQiu99d7N9hlE6JTtAKVD10F3O09
	1RsMwtVAxV/q584wDaxLFgOC1OcYYS/AizdtYPbllyiSleC8IN7zs/gbmd9H2wNqptbfi0+4odF
	DVtjUfBtPDdxNtbO1CU1dBDuym1A+P+zBOHCo=
X-Received: by 2002:a17:902:eccb:b0:2b0:7177:d5e7 with SMTP id d9443c01a7336-2b0827c7eedmr78591085ad.31.1774176698962;
        Sun, 22 Mar 2026 03:51:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836744a5sm75613895ad.63.2026.03.22.03.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 03:51:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 1/4] jasper: upgrade 4.2.8 -> 4.2.9
Date: Sun, 22 Mar 2026 23:51:22 +1300
Message-ID: <20260322105125.528264-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 10:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125479

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fixed a bug in the JP2 encoder that caused incorrect handling of
  opacity components in some cases.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 330ecdd2ad03225db3cd0933f1083abed8598a98)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../jasper/{jasper_4.2.8.bb => jasper_4.2.9.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_4.2.8.bb => jasper_4.2.9.bb} (92%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb b/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
similarity index 92%
rename from meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
rename to meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
index e00b56ddbf..b48fff7081 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
 SRC_URI = "https://github.com/jasper-software/${BPN}/releases/download/version-${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "98058a94fbff57ec6e31dcaec37290589de0ba6f47c966f92654681a56c71fae"
+SRC_URI[sha256sum] = "f71cf643937a5fcaedcfeb30a22ba406912948ad4413148214df280afc425454"
 
 UPSTREAM_CHECK_URI = "https://github.com/jasper-software/jasper/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/version-(?P<pver>\d+(\.\d+)+)"

