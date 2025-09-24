Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE712CAC5B0
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:28:57 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.11307.1758716933954209615
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ou0xa0tx;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62fbfeb097eso8576876a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716932; x=1759321732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJXmxHx9PIjzKBK5S+9UPEuJcv+VASdOEvn4RWckH90=;
        b=Ou0xa0txBVHaXaKxyBFj1Kx8JHhlXqzS6RVK/PEeRxYm5Fv9PuwmiucF5//d7LErfR
         a5l1FT5ga62jFmV4Ah11FyHdjVSwz6GgJ7hQcxlEMfx4c+3kr2JxlxZB0TBp8U44FpIn
         RsOvI3EpmE6fwIllvtcQgazW/HMglZwHwolZcdHYvSibiXgk+o/wodCbs3pplg0SsKsg
         xDF9sBYf99udtUg6/ufyTXCNz43r0aKE+CFFmXT6I2ihyr/CjkBNY2cqSv3yzrY2Z3Nf
         5dTVoNYzLu9x3fiqfZLM4XFXm0iURQgrqOSDI4Hd5cfDk9te7or7YT+7a7G216YAgMov
         5+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716932; x=1759321732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJXmxHx9PIjzKBK5S+9UPEuJcv+VASdOEvn4RWckH90=;
        b=dshClP9tr6FPEw2BRkT6aKI3LyYl068SZEObaVDcYa3tzncVMj7971TNx0PA83KPQa
         6SAG2Rs7UXJAYPw8WQMAvOuLyY5LUSFCTXSLTlff/1VyhZPeUmoe2HXEUuBqhf2/HHU1
         J3/l+3l1mFl5vXIhlYHmeGwwRu5HaBdKB5MMUkj9qwEfuUdeAouqbD4a0/olTiOH+Ybi
         JThqs7tDqBMokuUL4Q8fZmxAZA/8jhDyMjIqXhSQ2ACBvCSMpjuHYoW68f0c0MIssAsi
         udHwfVKrmJckDTnOBYOm7QEH7XDW3wod2ci31Ok5YhD+1vL5qXoF6aU+6JdTbAkCqFRa
         9Reg==
X-Gm-Message-State: AOJu0YwzmYbDPvCUTd4g/HXfTU5E3myVvgjl6stiaO/DMJIV71+y0Ugm
	K/lLJKgxvWzybfU3VzJc+QhNIkiG9AHQ4qTXTW7xlP8BWmb8bKUiasdR0CFmezp3
X-Gm-Gg: ASbGnctEkWp0zvlyuPLXMQe506kLUh3mM5Ta2SdMuDsQPKMUvGWw8JQ0JTCBzAiIVo8
	yO0UQNcI8Jfjj50LlTqtGHqZP9DFs9kauxze3eH4VT+Izf+l+Lme1QK0//UoUBXZo9ATz76L7vY
	uxRu7rsyZPvDOqxNfg+5XH66rLeZZUIO0+dlD0Lm1TefuPo1Mn1Kgwl3I5+F95C0hAXVToOVasz
	191Awo5NLyPq2cJiyeBY3hP/vjhPFhJkiPoefkhxvTMsX2IdEQyGGQG8v2G/R3HypDtqIczJS/A
	vFTq8oqJEDw2vKdc0ywKDY0kJ4sdisPrkOjMTHEtjGSX+bIxKVnJQW1M7t8XKm22Mkva8gDQBtV
	DZpY0d2X/5YfBwBJeMjsk
X-Google-Smtp-Source: AGHT+IGXv5/aPYmNWuejElo5OuD0J2PKuI2xUsexJeTW0YWmhKqdaC4QZFExB18nar630LEyUrw+Fg==
X-Received: by 2002:a05:6402:44cd:b0:630:4a03:d1bd with SMTP id 4fb4d7f45d1cf-634677ecf1amr4900146a12.24.1758716932169;
        Wed, 24 Sep 2025 05:28:52 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.28.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 09/20] gnome-text-editor: upgrade 42.1 -> 42.2
Date: Wed, 24 Sep 2025 14:28:27 +0200
Message-ID: <20250924122839.4184719-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119812

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
 • Fix a crash at shutdown after saving state. This didn't cause any data
   loss, but could be annoying.
 • Spellcheck underline fixes for various languages
 • Various robustness fixes for GTK 4
 • Fixes for inconsistent line-endings
 • Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 46fce3997be65a3895ed6619d32131c1e63aeac9)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-text-editor_42.1.bb => gnome-text-editor_42.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_42.1.bb => gnome-text-editor_42.2.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.1.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.1.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb
index 7efc6867d8..1446b151c5 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_42.2.bb
@@ -19,7 +19,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mime-xdg features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "a3c8508033bfb63a8b48a062ac1e67b2c333ba0153879b38c661968a103ad15c"
+SRC_URI[archive.sha256sum] = "e56d4a8cdcbce8a8f1c0881b45de799f8b25205ec0cbf2269e532025761cc5da"
 
 FILES:${PN} += " \
     ${datadir}/metainfo \

