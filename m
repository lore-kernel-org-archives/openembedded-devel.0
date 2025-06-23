Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9117AC7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 19:11:10 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.3454.1750705862591196504
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 12:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eQXyrIIj;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32ca160b4bcso22016151fa.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 12:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750705860; x=1751310660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EppaxaEtNT/A+ZVTWOwqrY7YDKcjADAKWH0y5cy0nfI=;
        b=eQXyrIIjMlALonpGmCrir1QDrJvKzWkU0yWopVf70/T0cj9lQoeKLnLNmZqE6fUdp/
         sXWnQzF+PD8Ldd6TPNFrh4IdOydJ08i7tY43sAY/KDuIzav8XlElj5uH3FO0hfO+knmM
         ad4udEErv4H4CVfNVLSFtBzJ8B3NIG7ky640OupS6laTgJVXiDi3novdYheJUHarr3gC
         zzyrT7oxnn6339Q7/Cg96kP2jtHKPO6GT7mc26M1cTnMid+palsKYy2ScirA+mQsls1T
         iuyHQw3/InnUq9Iww8Bc9tpJPWAWRZLv10zV25ZAc6NvX8Zw3P7x40tWCkYlZT1FdyKI
         SyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750705860; x=1751310660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EppaxaEtNT/A+ZVTWOwqrY7YDKcjADAKWH0y5cy0nfI=;
        b=F9T0VL4XCQNHnnGz+QOBL5QqhlBwpAlNyXcjEQGYN9EhXqiJKYTEW9+w1PSTneS/CZ
         XcarXg2Fqza77w5273NQk1p9OzFHZnL+avPBv+8VCoFsyMVztXZb8mlF0bKBqjTEwQah
         WyYfzf0wBb0l7+WJE2jLJzqjJD7uKhrYEGk9mwzjzU7W8HrZaUXvJa5Lgq9xWzPacYNi
         QY0NgaBr9p7Q2K54TlPiN1Xtu3IIjZzvEOMDpHxUrVLcDwHI2f8l8Bf+rhXjT88xk0Oj
         HakGQhjnKUaMQLLP0J5VbZddsKaJ7K+iPiYGxiaEV36sBwBGXEn11IswMal9TBBiCfNk
         MwMw==
X-Gm-Message-State: AOJu0YzOyif2XsyZ9MCqWpnByKRa/M1ezF3RqvFPO0eNYK9jio8lQTb4
	RPBuCu59CJxVg0JZrdsAEc4/XISOwBYcWkeIlxEhFDENw2e8iZkADj0LNktWPw==
X-Gm-Gg: ASbGnct23iOFtNtMKMl5SxRPgkhXNZp2QtV6HnhtdXy7tyTNiWF8CgtLxxP5xA9zlH0
	W+sdtaMjAW4uXDYQeuc0Du4L0fu7C78m5rt4ikEQWMa2YD8cS98kAx8usoKZFlKekLrdwgcIKJ+
	Pw5OnTSPMrBwH2lDdX1ajAfQXZy1q62aK5NduilnQn8awSOSIid+n22QuClXOg24j6IY4KUAxBG
	SiC+n49tmaVwBo93Xfqf/nq+D+UZxXGqCbs+IlHIpi3XgXm97SPn6dzs4NRcm9ECse/oTYecLCI
	epReyLyNMPdScwKLNYi5t36IR/hkRjijvjpRsJ01p1SWZmhrSMMMQooDLxx41d1apo5m9LocUfY
	Gr4s=
X-Google-Smtp-Source: AGHT+IGHJfM/2n2WoK6MTt2raPmpoZPI9/RB8A9dyQuyx0YvL1Qu+x5lKm0uQ076rzXRrhKzy1LgRQ==
X-Received: by 2002:a2e:b8d3:0:b0:32b:8e4a:5717 with SMTP id 38308e7fff4ca-32b98f077fbmr46307481fa.25.1750705859672;
        Mon, 23 Jun 2025 12:10:59 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.153])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f5980bsm13958931fa.7.2025.06.23.12.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 12:10:58 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] tk: Fix compile error
Date: Mon, 23 Jun 2025 22:10:48 +0300
Message-ID: <20250623191048.488812-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 19:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118088

tk9.0.1/unix/../generic/tk.h:19:10: fatal error: tcl.h: No such file or directory
|    19 | #include <tcl.h>
|       |          ^~~~~~~

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb b/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
index 504b40927e..230a244a6b 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
@@ -30,6 +30,8 @@ S = "${UNPACKDIR}/${BPN}${PV}"
 # Short version format: "8.6"
 VER = "${@os.path.splitext(d.getVar('PV'))[0]}"
 
+CFLAGS += "-I${STAGING_INCDIR}/tcl9.0.1/generic"
+
 LDFLAGS += "-Wl,-rpath,${libdir}/tcltk/${PV}/lib"
 
 inherit autotools features_check pkgconfig
-- 
2.43.0


