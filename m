Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A2EC55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:11:59 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5274.1785589917396108775
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fcUANCZR;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so2307161b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589917; x=1786194717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9w+/7lOqju2Atvy+N3nIEWaoTDSVeniAgZje748o0hk=;
        b=fcUANCZRz6bPtIgs30FUJXezdEkt+Y/HTK9LNF0NvYFfJv/c633iwywWQChhQVq8hh
         hna2TeUzaeOD20OfzyoV7SqlxKmPrf1jfDc1u2ua4Xnd1GqhLWJ63sSYkkNl4nOQX/Td
         9G7b1AhHcbZWDgLglUN3iXXuCdLkggcrQXT/LrJuyCHN6/7sbLIVsWjokdgGw7qPRPX0
         DnX5sxqWHj4USSXMh7Cj7dBOE1z+jztkbUcVBDSmvAJ8R92nebLdPy5fq0LKNK9Sb8Gt
         x6LYzRKtZi4NgRtTYAabZ0rT5csct6Ie+Zzp1LuBNu+0YXqLt6fDE76E6BNAVlHL2bIb
         2aPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589917; x=1786194717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9w+/7lOqju2Atvy+N3nIEWaoTDSVeniAgZje748o0hk=;
        b=tB/DP/zywWwLDuvrEMdmmfLCFG3coqzvPXaYdnbKbaQMUZ4n4kqxyPQNYda0MNHDy6
         HNCWni3VjV0g3QnZRD4omLMl8c29A2POl9mMBqxCwnSr/U9Rm8ThbcccoJNvikl1eDcc
         0g26DSaJF77K19awBLGLKQphO1fhVZdbdXdp8iHS0BNhJJIaNYOu6oiWl9MZzhX/nI8x
         /pjM/5gk4QutYsfgxhTIyQP0vhJxTNFwZj0qlZXrCqcXpty+R5anfTt5JR3HNbzCkaEZ
         E6VvIU/HaO0zY/buv9kJmdxJYx+JeeGSlrApj3aZ+S4svXXGFqBMGBcVEQb77QJBVSEO
         nm7Q==
X-Gm-Message-State: AOJu0YzdkSIYfrdfyvFBPeztMOF9vZwraXafDkc6PtqjvuZebfbELkmV
	+RSs0gfvAYqgQohg4eI972saEpKI+iS5GQwWmxZCPjVM5snKeCEHAp1F6Ln8uDV/
X-Gm-Gg: AR+sD11Mckz5LlzWcLUWavRJ2iALpcizDO8StvYUrj9gyfJY7RqdFPW8heycExoLBy/
	DFa51MYa17UOU4U06wrsVVomi329lz9NcLeYoH94nVM72V+ng0L3hxSOg7PEorkQZF10G5pUEfc
	YB8mcrEkDSOpVUsv2YO6Bvd+9BIctfA1H/HFgyr+CiYwGow4xIq8Q27JSkGPhGQNK8RYR2uY0RL
	WtvPQInGhZnsIbjSHa/Z8Arfkvt6jlZJICfv7cqoWUtFXwPE1pxuN9Lj34amc2N2R1mLaShw/nF
	hs2o4jEj7XDMEyqoI1WeeZkryfDZyrLvA3DBCuwNScQUPFw8LqFzWBahBMaaKujE/Jf5xALVW+o
	wofDZaC8CBVqsew4qNVHiGDi+sZuGwJmnbaIGY1mp/VrUZIM48D7wXodDUZSZR7FrT/aQdEl4DA
	OvMdjcGAk89q17kjVnHhavGFK9WslZMgTQNGgs+m4ZWoZed4P7g+csym3+eJAEXUf+lDJrYjN+n
	A==
X-Received: by 2002:a05:6a00:4b46:b0:848:57f3:8f8f with SMTP id d2e1a72fcca58-84ee48d1627mr2658363b3a.51.1785589916792;
        Sat, 01 Aug 2026 06:11:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:11:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 4/20] gnome-console: upgrade 47.1 -> 50.0
Date: Sun,  2 Aug 2026 01:11:22 +1200
Message-ID: <20260801131138.3299410-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128598

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch which is now merged in the upstream version.

https://gitlab.gnome.org/GNOME/console/-/blob/50.0/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-include-locale.h-for-setlocale.patch | 34 -------------------
 ...-console_47.1.bb => gnome-console_50.0.bb} |  4 +--
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-console/gnome-console/0001-include-locale.h-for-setlocale.patch
 rename meta-gnome/recipes-gnome/gnome-console/{gnome-console_47.1.bb => gnome-console_50.0.bb} (78%)

diff --git a/meta-gnome/recipes-gnome/gnome-console/gnome-console/0001-include-locale.h-for-setlocale.patch b/meta-gnome/recipes-gnome/gnome-console/gnome-console/0001-include-locale.h-for-setlocale.patch
deleted file mode 100644
index 28f26476ce..0000000000
--- a/meta-gnome/recipes-gnome/gnome-console/gnome-console/0001-include-locale.h-for-setlocale.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e72f6da3d509561b75e223667a0380772e7bd48a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Sep 2024 20:38:09 -0700
-Subject: [PATCH] include locale.h for setlocale()
-
-This issue is surfaced on systems+clang
-
-Fixes
-../gnome-console-47.0/src/main.c:29:3: error: call to undeclared function 'setlocale'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-   29 |   setlocale (LC_ALL, "");
-      |   ^
-../gnome-console-47.0/src/main.c:29:14: error: use of undeclared identifier 'LC_ALL'
-   29 |   setlocale (LC_ALL, "");
-      |              ^
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/console/-/merge_requests/171]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/main.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/main.c b/src/main.c
-index af9c5a5..5d16160 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -17,7 +17,7 @@
-  */
- 
- #include <glib/gi18n.h>
--
-+#include <locale.h>
- #include <kgx.h>
- 
- int
diff --git a/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.1.bb b/meta-gnome/recipes-gnome/gnome-console/gnome-console_50.0.bb
similarity index 78%
rename from meta-gnome/recipes-gnome/gnome-console/gnome-console_47.1.bb
rename to meta-gnome/recipes-gnome/gnome-console/gnome-console_50.0.bb
index fd1e98a992..0ec64f9cc8 100644
--- a/meta-gnome/recipes-gnome/gnome-console/gnome-console_47.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-console/gnome-console_50.0.bb
@@ -17,8 +17,8 @@ DEPENDS = " \
     pcre2 \
     vte \
 "
-SRC_URI += "file://0001-include-locale.h-for-setlocale.patch"
-SRC_URI[archive.sha256sum] = "d3f600b45b51716691aee92870332e9c9a8ca89d553565f3131d9e28074725d0"
+
+SRC_URI[archive.sha256sum] = "e4950207f0547e6a6c0f18eebfcf6e1a10461eab0f2fae0aae512b1044c7ac6e"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false"

