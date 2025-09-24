Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89EBCAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:28:57 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.11304.1758716929342553917
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DDkY/Bhr;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62f4a8dfadcso8184967a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716928; x=1759321728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJPmm0aNNtkBzgTBOGgyss0wZHn/Pda4ViaKmgh1HZc=;
        b=DDkY/BhrhGcXnWN9JozMdkOwizWBVsnC+t9HpOKbwmZsQKG5ZwZ21Ym/FQ6RoIcIMk
         N0FtXPpABKuJb4CXpK5Tes8YzJmsknP/4uYw5Yve+V9IjgRwkyL8UJbMMLBBmjRf8oBJ
         NiX/5hxl2ojDckstL5qxKDPD6VwnVIWFP392UbhGdgNawWUvYE5E4Ny+hM+cQu9ejHP2
         XiwPRitd6OSliLzF+IWAvbHy+ov6h/2YBmXp+rHjhctZXUU+yFaSxoH5RW6SKFBHOpiq
         1dS6R2TkEP72ZWWhl2NqOf7soTgC8Tqx+beYJP+IQYw913WI+pWonOH2Eby/ewek87Tk
         pS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716928; x=1759321728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJPmm0aNNtkBzgTBOGgyss0wZHn/Pda4ViaKmgh1HZc=;
        b=GilGHrbVDVo81IYc1JNUohaPYycGnFjP1AxD9rEYNeMu3Ule7P+cTSfIbGIKoWwDv2
         ei2LjwyMd8VZfLOleiDSszdn96h+D4ihNZqj2QncgAo0TB8vcG8aCnTqrBXYJPNkyB+K
         tGqKaI+5Il/qHV3tORmrOrLoJieOyHSQFI+/gFmV0ieOo9xkyPZ4DzxOlPuwrroJ2pv7
         eiMrG64gTIkVhfUeytBDf3TPWuQ0b9LEC8sh9Z6A6LcrR3MTXSuS1/jlA0A3B7TW+R3n
         Aev3gPQYOJfl2qPtTXzjoXgoB/O9m38Et4y8aYSZCu+IGvA1lSlD9G+rOL3M8xSiBrLw
         +YZw==
X-Gm-Message-State: AOJu0YwUNcRPIKduTct+aBMLy5rECi6saS8NRuucC0EPjSWYNWSOUu41
	ieGXJLJj880g6RxKWecIFKg96n3a2CcuZU6bbjLM2l+LxcPyRt8jFHU4bMytbA==
X-Gm-Gg: ASbGncvnh0hskwXdjH3nBsB310Edm9qkfCR2qj5itrA4sLYrPOUIB0grje5lJ36eNSB
	jgGlxgEJZkMiRiXOEY5A8d/uqMGZK+nWuRvRiPKaOVp6kwdnGQcEO6+uh2UeNVdlO5SJ7CJEeIC
	ZaVXqTBlmoaE/RPESWY2EYmjX4ME3SYuzdOSIcVR16q9brGplUXTCd0362U6fOYgwuRJjcyJ+6O
	8uAyRBAXe6x8QgRGZqoPfQXPQH4IMMT57/Dsz0PFMvgaiC9ub22Nm0twYVrI1jFluVdPiayHxEl
	hRfJVtHm7ZIJpyVYad/sRHTc8nQKbbkLL1x4BO1GZfbvSUMagBdAghOW2WWrT/sfMo5usLuIMeK
	UAUn7spnS7ESeXSz2lKn0
X-Google-Smtp-Source: AGHT+IEa3YEWmFFDISu5XlH7ZcPVQIJXVDDMB3OXWux++5ZMkL9ZEWYZqoMdqX1srJ01oZ5RdJr2hw==
X-Received: by 2002:a05:6402:3596:b0:634:7224:c6b5 with SMTP id 4fb4d7f45d1cf-6347224c99fmr4445017a12.28.1758716927554;
        Wed, 24 Sep 2025 05:28:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.28.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:46 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 06/20] gnome-commander: upgrade 1.14.2 -> 1.14.3
Date: Wed, 24 Sep 2025 14:28:24 +0200
Message-ID: <20250924122839.4184719-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119809

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4b2e46f2574cb073b13480c654210b7c2083cdba)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-commander_1.14.2.bb => gnome-commander_1.14.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-commander/{gnome-commander_1.14.2.bb => gnome-commander_1.14.3.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.2.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.3.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.2.bb
rename to meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.3.bb
index c672422992..b16400cf38 100644
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.14.3.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
 inherit gnomebase itstool gettext gnome-help features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "1378efd24f8af18a09031d83d918f9662a3f5eba5a6f9df9fc55870f2e6f0ee9"
+SRC_URI[archive.sha256sum] = "78d8dce70fb922b2909cf767783053b0811213a4d6a49b3875510cf3a84efd7b"
 
 PACKAGECONFIG ??= "exiv2 taglib libgsf poppler"
 PACKAGECONFIG[exiv2] = "--with-exiv2,--without-exiv2,exiv2"

