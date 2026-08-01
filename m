Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3392C55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:09 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5275.1785589920186234352
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VX5kwTDJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84a652535dcso1389783b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589919; x=1786194719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUlkTrrejmfdSB7UkjExSK9HwDnqEYPWBCCZvx7O5WY=;
        b=VX5kwTDJwFRIv3Cs0JXLCOzo+EAv98KBxrJf8/mYHqNH2dhSTbxIKVND0NkjEzQBRd
         mUmi5fyG42ExmjnFXj9KJtaL60XPoLWudD4j/b6/p2okd18m6n12qhz5yFA1pa4OfUCG
         hSrMyAazISleAliRlmsvjJH/W/InVafvOlR+Z49y1q75/pW7o6vpZtW8WMzBr/tcAXNf
         Plr2sCrU3Z8rUSP99DRINv7COOj3kBcdjQQpRSA+B/MHASyoMeuophYyCbZnncUW6DcM
         Zg4Hb1nW56+Zpn42lSx9RnBkFqYGox4r5u4V9N60fggAEfKGx4xPwlO5sCUAI5ZBZfUR
         5JHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589919; x=1786194719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUlkTrrejmfdSB7UkjExSK9HwDnqEYPWBCCZvx7O5WY=;
        b=KEvQomGC8bK/6TU2snmGIbk2wWLCLScI2X44hSJ7f75e4PQmUeSke/jKA/m2RvksBY
         AZFV4DbJDvHaNvoOtLzOJmISpcBDsmxL/VymguuvBlxiYoK+VDHfYAr8i6wihSJFcwwR
         gw1TyHeBjw76oU+f0At4zcpmrjeBJeRHP0VRF2QYifGNullzBTNBWuOf6cRbeZiVK2wV
         H3j0O0MqRBO2YDVdYFErIqIh7/VyyEZTgHPoxDOkhOoK9lRWoUSfpRQi2hEQXYyBBFUG
         5FUzjdCUakziWOpplJmV/LFC5oVTHPIWMoUwnFrsU8AS2TYkuYYJrAbbZYT+pONvgcUE
         JwLw==
X-Gm-Message-State: AOJu0YxdEc7I/eWQ9hMC89GlpaOOKL1c8jlqm6dMBMfgfIyah7Fsc9Ys
	Q9A5VXgTi4pnhhUreIRlOw9uz+Muk7fsR5ft+pcux1mRxaOMewOPs/i/APNMfnnm
X-Gm-Gg: AR+sD100IQOEgFceO6tiUWuhxqL+212IREPSFuMzr3avscoXvHQJvPwtpiBQTZZ5jSU
	SXYJvIfVUvwMHj/u4i59J11/gp50VGld/v0cq5XbQRbnBi629+vseXxDB28W/xol9yWTP9bFIvL
	hd3PK1/3nEXJ6WiS/MQf7gWDeM3v5rahQuU5SyCgkJiqYT+fIfKEM4SsAD7kmum78MCtEcbf0wI
	RPQrQvtEh4bHrTYMKPJVswDwrTTBUhjb4C/gNNi9MIlUIikE0q9u/a22LDQY+pUtLJt/TGMqp2I
	mjqa5vemIVQkc6Ls2rmBho/wIrK4nrTExmGuCPL3XwXVRs3t3LFXqVfxHxQK4JvWInfnRqvVea/
	Yq4WPkZgC0gjg70/kdJswlxoCRDNcCC3W9TbEGL4B6F6bZSkLpekqHO+G5ChBKoKzpqqBSw9fXK
	D8Wf6iXkyV0UCk3zCjkRF97Si2uCXszxshRMnBX0bCwbJGUHWkRpW9P2mEfcsSS4YNJy1HAV4JO
	g==
X-Received: by 2002:a05:6a00:92a5:b0:845:dde9:ab62 with SMTP id d2e1a72fcca58-84ee485accamr2955267b3a.19.1785589919403;
        Sat, 01 Aug 2026 06:11:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:11:58 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 5/20] appstream-glib: upgrade 0.8.3 -> 0.8.4
Date: Sun,  2 Aug 2026 01:11:23 +1200
Message-ID: <20260801131138.3299410-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128599

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

New Features:
- Add symbol and sample text for Amharic and Inuktitut
- Add symbol text for N'Ko and Yi script

Bugfixes:
- Fix building the silo when shared-mime-info >= 2.5.1 is installed
- Fix RISC-V test failure

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{appstream-glib_0.8.3.bb => appstream-glib_0.8.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/appstream-glib/{appstream-glib_0.8.3.bb => appstream-glib_0.8.4.bb} (91%)

diff --git a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.8.3.bb b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.8.4.bb
similarity index 91%
rename from meta-gnome/recipes-support/appstream-glib/appstream-glib_0.8.3.bb
rename to meta-gnome/recipes-support/appstream-glib/appstream-glib_0.8.4.bb
index 399d9813af..74b89ed282 100644
--- a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.8.3.bb
+++ b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.8.4.bb
@@ -20,7 +20,7 @@ DEPENDS = " \
 inherit meson gobject-introspection gettext bash-completion pkgconfig manpages
 
 SRC_URI = "https://people.freedesktop.org/~hughsient/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "84754064c560fca6e1ab151dc64354fc235a5798f016b91b38c9617253a8cf11"
+SRC_URI[sha256sum] = "132575f3ef2712cd0fc8a7f0c9287ff5c4264d75921953220dd2089911272946"
 
 EXTRA_OEMESON = " \
     -Drpm=false \

