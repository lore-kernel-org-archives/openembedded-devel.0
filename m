Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.432.1617833922880508740
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 15:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YyfV4V/Z;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id x15so10347754wrq.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 15:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L6M0qzKgPlW9nsL4gGy2d1wPPxMBx905niAs5dtYiNs=;
        b=YyfV4V/ZxtTIXw1JhmeeU30cJIzSTSubX3+fypReq+8LUFD8IEUZfYDBuMcR1sYoSF
         jm4QGshNRJy4AHqkqh1uJ0iLNSEt/uj5injF7iv6t/WQ1z67zSYkMec4guOvN8MTc2ba
         AImGDUclQJ6bmGK3k88aTiUKAIcxa01D7yXn6owALWROnXkB+kj0o+ZaSFNsgn/KllbU
         SplkBY1Lk9Pm4jXreb3Aqkcq7c0p+8FVZL1ss2NMpN1//yD3veKGjghXDduZeSKOdCK6
         WhkAqhwnAjfrReijEUS9qjY1dVC3quO9prK6hxRau7msT1q8+fO9ILe5dK7EWWfsJgMm
         wJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L6M0qzKgPlW9nsL4gGy2d1wPPxMBx905niAs5dtYiNs=;
        b=mLZY74R6/Xc6byc+BNMz0FoWMUc4KPRYpHypxX0w83s2tPXGnyCmcrGsOv57NQcjEb
         GggASSqhmxlBbD7bwSoQ+guczMAvR5IH50tFarnjmUm4ZeQ6vac7pvy1zrVxdLW9YO0v
         RwoHEmkZwfheMahUOrFFM3HtVT72oDS6utjsnqqNRo32FirH2DrW9wO90L1hmf3sYyej
         UYgI1pjoviQmnunZiihzmXFpSsPhiUfgbQX6ubhSDMfzLVoprH+5yivVxMj2iBpZ8S6q
         ze0EU6R8afeW+eIRnWdxbHtLRhmCCLU7OyyHJBMKoihHuaWbBF6RNVNKXZGuJgAT2Ttp
         maOw==
X-Gm-Message-State: AOAM532Frz8gdG4y3dNOWWTYt4oXOku8HuTPjqucl6eSiAxpV1y2lQR3
	I1VbX7nQlewQc/Y5DGZfUPjlcMUGbP0=
X-Google-Smtp-Source: ABdhPJwyVVikUfeAXF0fZBij8ZDlkaxt0MSfqfYfnbnWo0/dWw4BWBdoUaOLychBwqAR0qbIRWi/mw==
X-Received: by 2002:a05:6000:1acb:: with SMTP id i11mr6975415wry.68.1617833921494;
        Wed, 07 Apr 2021 15:18:41 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f1192521410777e3304dd72.dip0.t-ipconnect.de. [2003:f0:7f11:9252:1410:777e:3304:dd72])
        by smtp.gmail.com with ESMTPSA id e9sm27462434wrv.92.2021.04.07.15.18.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 15:18:41 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/6] thunar: upgrade 4.16.4 -> 4.16.6
Date: Thu,  8 Apr 2021 00:18:27 +0200
Message-Id: <20210407221829.606871-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210407221829.606871-1-schnitzeltony@gmail.com>
References: <20210407221829.606871-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

4.16.6
======
- Reload current directory before selecting new files (Issue #524)
- tree-view: Hide menu-item "properties" for unmounted devices
- Removed 'the root folder has no parent' dialog box
- Revamp documentation to modernize/uniformize accross components
- Remove watches on shortcuts (Issue #513) (Issue #47)
- Translation Updates:
  Finnish, Occitan

4.16.5
======
- Revert "Bookmarks no longer need an existing file (Issue #47)"

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-xfce/thunar/{thunar_4.16.4.bb => thunar_4.16.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.4.bb => thunar_4.16.6.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.16.4.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.16.4.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb
index e5fd5ffd3..128043d19 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.16.4.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb
@@ -8,7 +8,7 @@ inherit xfce gobject-introspection features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "d51a2018c1ba7dcc420e7a84d85cc17a58f26fb1c80ee4c15e689a49f10425f9"
+SRC_URI[sha256sum] = "cb531d3fe67196a43ca04979ef271ece7858bbc80c15b0ee4323c1252a1a02b7"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
-- 
2.26.2

