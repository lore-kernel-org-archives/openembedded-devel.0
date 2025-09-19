Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A438ACAC5A8
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:59:37 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.17317.1758290377078340804
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jiDcxZsV;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so3798203a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 06:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758290375; x=1758895175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3S74MSnAi4mzfeymciuMKjpSTmhkUs4MINUjoPgZqs=;
        b=jiDcxZsV7jrO+ZCz0oOBu2lwTkHaHB1uaIBCHrsDfsMiygknkEQxKvEJA/rwadFSRt
         mnyJRtp6sU+Fw8A0gggynZovevgYCC52RC4SEkDt0Z4dSMEAfNW4UQcqTztYlA4LtTH1
         nzM7qqHK19cvinzpG1hTW4Hg4y+MJqWObToruTODDl74O84YfLe7+KZk6aQdff/tsmKW
         0h4Ur7EPml5fNGz8tya3VvTk/GHx9FD/Fw2aFUcXGqpVGnuMuBsbs9knXCSUgNrxF+cE
         6BYNaOgom+4pyC7iHH5nYKr0MtfRcWXhI/MvkwmJpwLr710mgRJBxgrlkq4Swg8PtZ9K
         hjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758290375; x=1758895175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3S74MSnAi4mzfeymciuMKjpSTmhkUs4MINUjoPgZqs=;
        b=Qs5hXh1geuT+vIS9rzu6OMSDGNvw/PABuVHtgYsgHciGq5i6iOi6+fla06u566cr9d
         GXZqzH80/UeQrKJ+ALYIxM2YMACBw8Y5XrI07XUDDZ2/VhMVenmO5XCFEcMnHyOXdCLn
         KF8vNspK/T6FbHcqUVDXV6K+X7bWzNYMgm2QGTxxsyRKdCka8l+5PA4cxM4B5NJou2+M
         JxwS+IKT3GlGAYfFZY6PjQ+DgEXVUn5/aDXaskQnFNeMJw9G9LyxwurtwMSGW7L0tG7Y
         AjDMNa5cFubg3vFP/MEVEZEOCAAd56eJzzd6XFYaGs9gFHvAuVjzlGjZyHYhkOo2j9GV
         9yjQ==
X-Gm-Message-State: AOJu0Yzevvt1uJP7C+CSYqhvn2t6YBCnCM+jz8dFb+olMKsK2NaVyEmP
	P0YbOqRIqRwj+HU93LdRtkJ6IfO9nByP6TvkafCEyR6zZ2Fjv+CANjheQq5AxQ==
X-Gm-Gg: ASbGnctzDS+9/SMf4FNhJWOakBLiKG4wDdTXLTS0a7sFhQ2V/CqhaPhUjqDTfRBMLYq
	0iYz3lJyNwNiZngZC1URJWaIfIJHTnnYxSG8i8gbu2LFu7QKvdThV+NsQYDHqr+wv5Tx4crV67+
	3EVx4j+db1kDJ4azkmjH5zvM7f+LIi2LxpNf72wW3XWFGQcr3Jx81CuKafC1bV5jNBMAu+Tx1xU
	ifJAesf4KpwsVc/CfwSACxuLweJ8nX7po6oqTK8q6NGrvAwIUOxCPWkQFwPAsC+klOKEGD8Krwk
	93V3JRzoeBNu7AOmOxJjs5rOggIAnAaA+dY4h3ZmLIzf7HmwTNAWxyflX6Yl0pBEFxk1HBMutRA
	BdQZUb19UUXEIWJLj5zPv
X-Google-Smtp-Source: AGHT+IELF89FSPz3BQ3IfEnmXbF5KhwM1qeZ1HCj457nwJuOeHpXUaBNrr3o8wUfvnTlganxbuQtDw==
X-Received: by 2002:a17:907:268b:b0:b24:e000:4339 with SMTP id a640c23a62f3a-b24f5685f12mr285815366b.52.1758290375160;
        Fri, 19 Sep 2025 06:59:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd262993asm442209166b.94.2025.09.19.06.59.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 06:59:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/9] colord: upgrade 1.4.5 -> 1.4.6
Date: Fri, 19 Sep 2025 15:59:24 +0200
Message-ID: <20250919135933.916848-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919135933.916848-1-skandigraun@gmail.com>
References: <20250919135933.916848-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 13:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119599

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Bugfixes:
 - Add missing copyright notices
 - Add Spyder X entry
 - Document where to send patches
 - Don't use exact floating point comparisons
 - Drop option for removed reverse engineering tools
 - Drop references to hughski.com
 - Fix a small memory leak in sqlite3_exec()
 - Fix typo in device-removed signal documentation
 - Make introspection optional in meson

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 706cfeb2504ebec37872e6ee051a5b07385412b7)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/colord/colord.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/colord/colord.inc b/meta-oe/recipes-support/colord/colord.inc
index 41962cd63c..0ae1a30fe6 100644
--- a/meta-oe/recipes-support/colord/colord.inc
+++ b/meta-oe/recipes-support/colord/colord.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://meson.build;beginline=3;endline=3;md5=f42198707d793be58b274d34fd5238c3 \
 "
 
-PV = "1.4.5"
+PV = "1.4.6"
 SRC_URI = "https://www.freedesktop.org/software/colord/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b774ea443d239f4a2ee1853bd678426e669ddeda413dcb71cea1638c4d6c5e17"
+SRC_URI[sha256sum] = "7407631a27bfe5d1b672e7ae42777001c105d860b7b7392283c8c6300de88e6f"
 

