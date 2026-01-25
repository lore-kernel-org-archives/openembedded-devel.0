Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7E1E63CB4
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 17:06:33 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42703.1769360791820802127
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 09:06:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i67PKGQ6;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee07570deso28894115e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 09:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769360790; x=1769965590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qAU1fGvcVXClcBaGWJ9RUG8jGiVnLnnryuY0FcOpgdE=;
        b=i67PKGQ6T0nL/3U0ra0t2VYedcTmSLtrBDeI+KeTobTxg7k6U4BTNiZpIkFXO9rm4E
         iaJ1AbCF7IS0vLxFc5bAjwDKnBhxvlGOy5QtuRZXpAMOWqPxgGF5kVaE6nubgtVjL4Gk
         N+6zrqwxYfjtsoGfRP+Z9ICqQ3V6LgHGsCd7qafedtR/bxa0kXwtLoEUJifaIh8BK/LC
         cByfbYr/6sOkx6MyW4KNFadsO7aPYJ2heQ9bLqNp8/Kot93XraD+2ea9RB2vqupWfXbC
         iPtWn92LVoJcL/R2lIzdgpPIrX5dbH2byYzcCkFCKy304WGueyLyS/IoH005N0EtAFbw
         D5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769360790; x=1769965590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qAU1fGvcVXClcBaGWJ9RUG8jGiVnLnnryuY0FcOpgdE=;
        b=O/z8WTeC4elpIj0WRs9wEO76Q7gQbUtGkZsavThTy/j64FQGdGrbbCbKoF0o4iKcaS
         QR4IXaXPlXxSdCutWrdRqOzKVQ+wzUfsGLY4ri4eQ7HruVqvs54oPIwhzdPqnFfvtOPr
         AqjAcrCydCUwuKEA2hyYs3WbNEOjtzjULPJ7Yo/fG2WZgGPD9morkISckZkdJo8rCILo
         MmjdF7FB5Bb4XlTZMdX7qjG3Xtpu1eiKywd5w05dR/IMVgGc2MiYWySvDC6XAb3bcuJo
         f3GbIvU9EcPhDH2gv5iIJ0loXzYHXVq/5X75+jgjFgHUoEMavTp+zW/WZjkLI5LY5oLe
         9BzA==
X-Gm-Message-State: AOJu0YwWLjzpLXE1/ZAuA54e/wFrtdFz0buzhuCruuvD1MpzMq4TS9u+
	WvruG56fPKgUleK28sB4+mBEeywip8auLMvpJALLpqfFL5PyiD5Hf3bZRDUP1Q==
X-Gm-Gg: AZuq6aI90rHXMC/m2EcOUswwXJH4TWzXzI+eU2qHFw/4oRTcvg9uvVMtWIRX4m+ucHX
	4sv3LiglnoH8uXAQgNC9w8KvtGUcHYMDUvcrCZU+cldX5tB0PtSe3tI9u0aqt0js1aG9+LgGU4P
	SPl3ukbANTprdap3SwyoiTHtc8VKB3a+tAfEuzU2K2VEXefm8Whp3uVBfnHpKHwicKP8GfrvIX2
	RRgkvTrbtBQRIHUHp6PDzL+U4jPnsPMb6zfi2D8AOQrykbACqQpKOA0XqlfgAthnKs78VnUf9Iu
	G3X+BgB5qdKi5lsMWVaqg42TybXRJMTntSdO0WzTwcm3QVh/DvUwxoT27+F5zJqi4bCA9PIB/xQ
	N7Ymh70O/DuKs2Fd6aFk5BzMnKEd2aQ831oBEVZtrzol199oLnLlkAqD16Bq9bVJokENJKV2fw5
	bk6SkfBNIn
X-Received: by 2002:a05:600c:8715:b0:477:97c7:9be7 with SMTP id 5b1f17b1804b1-4805eebeb72mr24586145e9.1.1769360790150;
        Sun, 25 Jan 2026 09:06:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1b6e2besm23431414f8f.0.2026.01.25.09.06.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 09:06:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 6/6] libgedit-gtksourceview: upgrade 299.2.1 -> 299.4.0
Date: Sun, 25 Jan 2026 18:06:25 +0100
Message-ID: <20260125170625.3178555-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125170625.3178555-1-skandigraun@gmail.com>
References: <20260125170625.3178555-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 17:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123845

Also update the SRC_URI. The original upstream Github repos have been
deleted. Switched to Gnome servers to fetch the sources from.

Changelog:

299.4.0:
- Remove the background-pattern (with the grid) feature.
- Fix some crashes.
- Fix GI annotation warnings.
- Translation updates.

299.3.0:
Style schemes:
- Remove GtkSourceStyleSchemeChooser interface.
- Add light-only and dark-only kinds.
- Mark classic and tango as light-only kind (so they are unsupported with dark
  theme variants).

Syntax highlighting:
- New *.lang file: Nix.

For packagers:
- Build: add the 'tests' option.

Misc:
- Documentation updates and improvements.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...w_299.2.1.bb => libgedit-gtksourceview_299.4.0.bb} | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gedit/{libgedit-gtksourceview_299.2.1.bb => libgedit-gtksourceview_299.4.0.bb} (55%)

diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.2.1.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.4.0.bb
similarity index 55%
rename from meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.2.1.bb
rename to meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.4.0.bb
index 4f21c3e569..0d67471280 100644
--- a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.2.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.4.0.bb
@@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 DEPENDS = "glib-2.0 gtk+3 libxml2"
 
-inherit meson pkgconfig gobject-introspection features_check gtk-doc
+inherit gobject-introspection features_check gtk-doc gnomebase
 
-SRC_URI = "git://github.com/gedit-technology/libgedit-gtksourceview.git;protocol=https;branch=main"
-SRCREV = "eaafc892d033713c7c823d8ad602061e456b3c88"
+SRC_URI[archive.sha256sum] = "20c17ff89e2031aed5dc1107fe9a93fd50f92b569be2954b119c86f9e2fd85d6"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
@@ -21,3 +20,9 @@ do_install:prepend() {
 }
 
 FILES:${PN} += "${datadir}"
+
+# Most gnome projects have a verison like x.y.z, and they are stored in a folder called x.y
+# Not this one. This has x.y.z version, but stored in folder called x.
+# The original of this function is in gnomebase.bbclass.
+def gnome_verdir(v):
+    return v.split(".")[0]

