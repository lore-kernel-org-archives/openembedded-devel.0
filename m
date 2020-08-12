Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.1250.1597271987512550020
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 15:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HHuFxHL4;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id qc22so4044195ejb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 15:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=65IaUYHbSPD077rBVQBOeRgmuHtH1mEd0JiLLtCI9kE=;
        b=HHuFxHL4IuSCR3rWpda4jpLdwzOPLWsCFOS+4qLScp+XOpfSpzMUBlKd6J9VPnSIIE
         tGhD3sRz+aFjIpjTHq2qHHVPstPWVP8y5vqnAXTRjOz1kJE3cBYT6gbACv0kXhZxCfi4
         I4bGXmH3dQ7kfwIkQk7bHHHf3ZpERnaBsj5tzsVb/QCED3QBHwBZn1U9haE4Wq/9L172
         bt4rMaG39Pb4UkWHZwawWIrLSn2umEedH8xqGEd1xUXB98Trt8NweM+goKuAiKJlOlcr
         MehJSfzI3He4nMYezCr+CGg87dH9AeuUMNzF2NCkBPyzawUO+Xp5pdTJaCkdUKGaNERX
         ek0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=65IaUYHbSPD077rBVQBOeRgmuHtH1mEd0JiLLtCI9kE=;
        b=q/46V3g21pCEDoeNW8KJMDukVRXfRBlq+DQVx9N89Ym4MTatOOdaIKmen/5CPYMY5v
         3P3IoZxhWx5n4yrYHzl7ZJ4BKpavVa+Y2QjfNJ2xoB2Yb7DSZ5J0GHCei+8Eh4qzDmQ6
         qrVrJRzD1S32ZwQuzln+Et/6giEmDYKwRjSO1ANjd6WnDVRRzI+Jg8gO+890cjF79f0Z
         LKacvJMySTlcsglaczqRYirv6CWCN0FXKaFFX5+n3fx5VNMucv+2xqjoE3cIxfSmUAAR
         quvbi57PeaMqW0YKTl17K/3W2P5YCPrElsbZ5TlvmB3OBMvFm+5hxClezlcGDf0JVzJW
         QLmQ==
X-Gm-Message-State: AOAM532kVwPDt1OUOr9+Pr7Dj5hAkVkJjcy+y+bl07jUZlaZI+FoDTtE
	e2L43OYNSwTrEW4fpYG8XjShYudD
X-Google-Smtp-Source: ABdhPJy7ZbQuBbBpZbkjgZ44vHGyM+oHYLPWo4rANhtJtuxlCl4iaBlj224ET82CpciuZgXWJ4GZVQ==
X-Received: by 2002:a17:906:e24f:: with SMTP id gq15mr2072919ejb.46.1597271985767;
        Wed, 12 Aug 2020 15:39:45 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f147e04a6500bbf92bdd781.dip0.t-ipconnect.de. [2003:f0:7f14:7e04:a650:bbf:92bd:d781])
        by smtp.gmail.com with ESMTPSA id ci27sm2569208ejc.23.2020.08.12.15.39.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 15:39:45 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/8] evolution-data-server: upgrade 3.36.4 -> 3.36.5
Date: Thu, 13 Aug 2020 00:39:30 +0200
Message-Id: <20200812223933.1119785-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812223933.1119785-1-schnitzeltony@gmail.com>
References: <20200812223933.1119785-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Evolution-Data-Server 3.36.5 2020-08-07
---------------------------------------

Bug Fixes:
	I#236 - Uses LC_ADDRESS unconditionally in libphonenumber code (Milan Crha)
	I#240 - IMAPx: Disable move to real junk/trash in server-side virtual folders (Milan Crha)

Miscellaneous:
	Fix a memory leak in ebmb_gather_photos_local_filenames() (Milan Crha)
	ESoupSession: Provided SoupAuth might not be always used by libsoup (Milan Crha)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../evolution-data-server/evolution-data-server.inc          | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 8276ce25a..f39440cc6 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "30282c322622a5a2d4b4a26eee661af4"
-SRC_URI[archive.sha256sum] = "39f83f1eee65c18785dfc2594720d5150e3fc37ea57e7b3b9bc2c40b4d3e4c0f"
-PV = "3.36.4"
+SRC_URI[archive.sha256sum] = "c555528c546d457be0dc0eaca5d766d4dfef7c408276cb05f9724c463bfe7fd9"
+PV = "3.36.5"
 
-- 
2.26.2

