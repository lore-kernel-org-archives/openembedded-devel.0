Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.3947.1594240269246828273
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2020 13:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nUVc8oXB;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id 72so8084059ple.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2020 13:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=R1z6A3M9TFr/4eWBjg8CdO8QD4sYf/uXZE4hhHvxGwE=;
        b=nUVc8oXBMHnzZJMcLcJei2rPXxZ1cH/b0jL+CQw+YQmv9m8FcxAmfGxmsujSsu9anq
         x3cw4fP4ugLVcsznb7wfful65sNsSm+EMXLv/Mu8CEUYohmVHkhlbbgWUNwMjoRUXlxS
         157pPiBA/IyZ2RXQu5mrhUg/phUedlqbaoRiiOCHdKZDSGiEaYyIW/q0X+sP1oYs52/L
         MLR6h4PrUXiWFYeZg1R0+oFYro5I+kLzQEnhdwD4U/fOkQkc3A0l6kHa+r0WJCsrcRRx
         ub3LT6lWdhxkcZYMCGDDsGDkxD5SHCKiJxRf/+gQ8CVxKimK9o1csYbvFLiBHXg2y+jA
         XpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=R1z6A3M9TFr/4eWBjg8CdO8QD4sYf/uXZE4hhHvxGwE=;
        b=AsuWFxaauaMhbC+mtny/+fqr5M/y1NwTb4rEPbIl8uKKFv4qdXDoxJuUAgXvnmFxvi
         bR9GxlQudAtCvHoZM16jKr4Tip7o0jZTjC73yN3z+rbJ/7KB2TIeSRT0faYHqMhN+KCv
         l19A4akzL5OB4yNhKD0Pcmh+3pWWHh5yUudLNtOaqfsXe5gJ24HzcU4HjhTyO6yLV4HN
         wGbPudDMQ7oYttog0I9fDr/sk6K43lh6RsuNO1bKcS+llL5M20fm6zLgIxpjJpamEadT
         AeLmyc5cGwDaV2ms6djzahzE1LjdZ9SNMaYtkQ35f8wYjyglb83uidTGSivtf15MUFcB
         vi8A==
X-Gm-Message-State: AOAM532cmd/ygnxs735NnZShwDZKglACo+/0bd5ro1K+waFgr9hdoJM/
	mfpJ4AC/IAFsDeNDaQhAP06MF+n2Txk=
X-Google-Smtp-Source: ABdhPJz0EllEOL/k2TNQ8YDIAroQVNZM2JaPtoqDH9s/bXqdeJoV4QFczf/j+UiVMshRi7KJGuPkww==
X-Received: by 2002:a17:902:ed02:: with SMTP id b2mr40793457pld.121.1594240268401;
        Wed, 08 Jul 2020 13:31:08 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e0fc:4d03:5c6c:3dcd])
        by smtp.gmail.com with ESMTPSA id 2sm596372pfa.110.2020.07.08.13.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 13:31:07 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][master][dunfell][PATCH] wireshark: Update to 3.2.5
Date: Wed,  8 Jul 2020 13:31:06 -0700
Message-Id: <20200708203106.14506-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Armin Kuster <akuster@mvista.com>

Source: wireshark.org
MR: 104620
Type: Security Fix
Disposition: Backport from wireshark.org
ChangeID: 64e3701e4d6bd53972c22c49d655556e6f37e461
Description:

Affects: 3.2.0 to 3.2.4

Includes:
CVE-2020-15466

For more info see: https://www.wireshark.org/docs/relnotes/wireshark-3.2.5.html

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../wireshark/{wireshark_3.2.4.bb => wireshark_3.2.5.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.4.bb => wireshark_3.2.5.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
index c3caaefde9..a6c09d47ba 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
@@ -12,8 +12,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "4bbee1bdd5b88343733590fabfffddf3"
-SRC_URI[sha256sum] = "d17d461e849e2d0b033431c45f71d8ee8ec3c8faa232a6ad63069a47927db8aa"
+SRC_URI[sha256sum] = "bd89052a5766cce08b1090df49628567e48cdd24bbaa47667c851bac6aaac940"
 
 PE = "1"
 
-- 
2.17.1

