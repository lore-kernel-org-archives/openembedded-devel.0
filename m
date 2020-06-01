Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.48783.1591047962005229050
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=taA8M28b;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id k26so1013342wmi.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Jzy2tN63kr5WArpjFXmhr/nHf6m47rbWvoUW4cb++E8=;
        b=taA8M28bxSd9i/J6YreSkFNASEwK6AgFiiVfa8ZfWA0m9H61IfPJ0gUC8HX3s5OVyj
         6IaWuHWJEN/kWrwCFXy+M3B6UqWBhk+gFHE0jPC66JgbI7v4/CosVAlRV+yuKTjBic55
         cysP0Nb1LTFYgQlfsMNGcqESWaPpwFAozaAmiUgZruAF7p1WKFlJPpEQ+5njCumLwuVh
         7D8KBumGB3xGOC3N9jm2uHc9u+ogwp8dnlZSnUPtd3T4uJHcvfGlMimW/528OqYAfgHK
         nTZ2bCF5ArIC011f01F11ajAEhJZXHgfh66/VUnsE2mj80AcB6GTv13ClJHuZRqbhP43
         ePXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jzy2tN63kr5WArpjFXmhr/nHf6m47rbWvoUW4cb++E8=;
        b=fckbnzCxLKAxdqLSrNF8jnv0W2mszavvIwICM6JDGGwWHdXGWp9L5o90cmIKS3V19n
         /nMNO22QScFMeIDAwqAi8G0y3TaKBSVswmC0pVRqBa6gZHQ9VGLLCQLEMM3ENVjCXwor
         +DUP+8lP993Zvouv1x09yJe2kg5AjrVkdwJ0/JUAU6v0HVS5zMsdQ7Fxy/dwagIHbiEH
         erb8p34Ln2FtMySENzRJ8bvPUqvbsRJ8kCKbbIFthoAQUZQVb0e28pAaJHwkTupgWam4
         c4xSfK9K8h477QRyncpZ3/0nl4Yt/KRPl4y8Z/RzpSb4Xx2mHaaJnDCzf/vIQ2ubrcut
         7qsA==
X-Gm-Message-State: AOAM530qvY3LZiUuPaSRmyATlf5cQCK74PZMpwYU/4ahU33E562jHfQB
	+0hunq3E2vji7uEhhI6PoHyKCQe286Q=
X-Google-Smtp-Source: ABdhPJxqfEhDeTkoiCaFiiNqNsQr94BK3AG9r/8Ps02oLRgFfOjdY6Se9aoXOOMGfoBXrh3qdyJLFw==
X-Received: by 2002:a7b:c10c:: with SMTP id w12mr1062256wmi.132.1591047960381;
        Mon, 01 Jun 2020 14:46:00 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:59 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 33/38] metacity: upgrade 3.34.1 -> 3.36.1
Date: Mon,  1 Jun 2020 23:45:11 +0200
Message-Id: <20200601214516.26624-34-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Version 3.36.1
==============
- Fix fullscreen regression. (#8)
- Do not unfocus on new window.
- Updated translations.

Version 3.36.0
==============
- Fix fullscreen regression.
- Remove some dead code.

Version 3.35.92
===============
- Use ARGB visual for window frame.

Version 3.35.1
==============
- Add support for _GTK_WORKAREAS_Dn. (!3)
- Add support for _GNOME_WM_STRUT_AREA.
- Clip shape region to window size. (#627879)
- Don't move focus to fullscreen window that is on other monitor.
- Fix blurry titlebar font. (#2)
- Fix shadow regression with Metacity theme.
- Fix some memory leaks.
- Updated translations.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../metacity/{metacity_3.34.1.bb => metacity_3.36.1.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.34.1.bb => metacity_3.36.1.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.34.1.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.36.1.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/metacity/metacity_3.34.1.bb
rename to meta-gnome/recipes-gnome/metacity/metacity_3.36.1.bb
index d8c8b5389..0cb59cdc9 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.36.1.bb
@@ -21,8 +21,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 inherit gnomebase gsettings gettext upstream-version-is-even features_check
 
-SRC_URI[archive.md5sum] = "c0c10204e4d6d024cb413042c1de316b"
-SRC_URI[archive.sha256sum] = "31c7d1045c390afb3bf405735b0b26c459197cbf43af37c469eb8918ce3a453d"
+SRC_URI[archive.md5sum] = "d1171705829bbebd42ac08ec49a9a90a"
+SRC_URI[archive.sha256sum] = "11f07693e2b266840759063a4bc807346070e8e7fec8f53cd0757f6662c1b323"
 SRC_URI += "file://0001-drop-zenity-detection.patch"
 
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
-- 
2.21.3

