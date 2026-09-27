Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4551C9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:22 +0000 (UTC)
Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35326.1790506214081244260
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SfCPC93P;
 spf=pass (domain: gmail.com, ip: 74.125.228.38, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc79f8a6170so226589a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506213; x=1791111013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b13RclcN6GNIm7H/ND2B+WsvJkuunfmEzUHlEI3GgO4=;
        b=SfCPC93PEwQFlQiinf1RO0GfyTS3SpTmKZjS5nTZavjtXtl4ap9AYZBXjn+tye/Wix
         xx/ipNhrgec/prjfjhCsqwtDiLlxREMuz+aDAeAw1qG5UQzk1FeKc+vTy05txkbKOs+3
         JIhdfD9q8L9cqt/sZF54z62mAs2lwTAphF6Chg1+cwXiLrFRBrPmy4GawH9vxB7JRcC8
         Lr0/R1rPV/PygUzICzYZNqRpT2lj9FNc9waskP+u0uPnQkrtW3CmsaEiY1IpG+P21yAJ
         zDneCk0Ls3cm5qrOIBSMmFUhxsgkjBnMwRxhcelqEKFYEp7Gsiq8YKcp7RHz2mPV6wWt
         7Dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506213; x=1791111013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b13RclcN6GNIm7H/ND2B+WsvJkuunfmEzUHlEI3GgO4=;
        b=q4xmmClts8j27LtvUkB/G91uk0LNYsOE077UxN6pw5/5Zbe6EspBMNuIBkR0sTZ3F4
         yhh+K/QuWKvsNHM9E6AMifwYns73LSGfhPFi0S0I/rJaHy7wGmKjV+tLydWLQIcK0Zez
         zuOYutRk1QftL2tQ0lXjwllvwZ6Lpn9+bn68kp9PoCzAXy2rO/vEB4Ms+JqQV3ta6DUX
         juLjM6a0O6QtFzky+5CGOMwyjejgKHJetJKnVP3ZUP2u4y9xHsnzHKVqA860W3+6P2sH
         DoYSG9PySRTqHz4NUVN9lj8JYsl+vOId9AJ/BhMWASge/hP8UwpC0kVEQsZjbLqYuiPz
         tT8Q==
X-Gm-Message-State: AFuF++lBVRiCYZrODdT0McGZ7pVegvBC6Zpu+ZZLahUcZ/ch1epvYdwx
	OLTY6f8Phx3vIF0Dw/Uwvfqhb+pk0LXMcexLIKAG4LNVVG9bo6NFEIbncblCBg==
X-Gm-Gg: AYBFou1+twplSj87W1DfHYuIXvnrON/EBnbj8f5cpRvhOIvSKzGPpPwSW8dpCcXwmHh
	JJGLs3t/XEmFoHGfGO5gtnDn2Kinh7qQoCUnOKOUdU2d7kbfTIMDDbGGgTppTyN5W5+L3HJknzz
	tE5nJPxy2teUGiOxMe3gr7kp/h3fMCKzfTUepLAoI2E8IaYF02UtAGXoE0wKissHvTHPOXvQARA
	p0YgS/Zj39QPitxVYOUfichBCGBEQ7D5ifE6A0WoXnsNj/mwNyXkzvfdokJ4gzAzjvemgeKwxkw
	sHcrYSk04ylIW37fGt7OQNarQbl9KcBhUKigBwayOCteTRBPhwpIbp3HoS1FBiPKRLMRcEislmB
	u1+O0suLUWpBElWxm/tTHv24QWo+Zl8pJRHkdWeo/dwgAKUB3kLdFI+zrb/WXVoHNwHkyLv5TmK
	ghZ05loGdYgXVOly+idbRaf3IcnKJN7XLM6uAXrFoVfdTlVor1BP1J9RWgdNYNuudqb7gX1S56C
	4NxVbgLIm9X17HlNzDLmn0ww3USkAPsmQ==
X-Received: by 2002:a05:6300:2795:10b0:3de:2fbc:82d2 with SMTP id adf61e73a8af0-3de2fbc856cmr3079634637.4.1790506213414;
        Sun, 27 Sep 2026 03:50:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 2/35] gegl: upgrade 0.4.70 -> 0.4.72
Date: Sun, 27 Sep 2026 23:49:29 +1300
Message-ID: <20260927105002.1832451-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130336

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/gegl/-/blob/GEGL_0_4_72/docs/NEWS.adoc?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-gimp/gegl/{gegl_0.4.70.bb => gegl_0.4.72.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.70.bb => gegl_0.4.72.bb} (96%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.70.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.72.bb
similarity index 96%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.70.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.72.bb
index c089589685..798f9bbc03 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.70.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.72.bb
@@ -9,7 +9,6 @@ DEPENDS = " \
     cairo \
     expat \
     zlib \
-    \
     json-glib \
     libpng \
     jpeg \
@@ -28,7 +27,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "47f50d9c3aecd375deb48c11ebfead52d162e4fc162a4b3d44618277f1faec02"
+SRC_URI[sha256sum] = "ccbb8cdd1db56ecd4ece5dbabae0118ab2c46b5b3439c94f3cec467798ce956d"
 
 PACKAGECONFIG ??= "gexiv2 libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native = "librsvg"

