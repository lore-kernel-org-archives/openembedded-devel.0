Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.552.1621121949994502291
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hByAp1Nl;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id l7so2646993edb.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sx2tSORyRYgGHV5Tqw7Lr9Xl8z9D5pOHJ3yBGjUwm+E=;
        b=hByAp1NlkWzcEi5jz5p5/RSkJEnmCc4UWIzqm4a6JOsHLYV1y2EmKvGjInr78Zw1Yu
         Td1adq4h1p+5XaQqzIwwKsg8DCk4Ir+asArpmapG1p3x2k+Z2HO6W/Dhm9fIfQ9FFQHy
         oGIQGNYgzYtsBlcHyoDK+c4a7covGjr+fJhgUSJ0NpFYQbntlo8P6JZ+MP2+SEsln7H4
         IAski3PkFSuL3SDKcAyGCGKiceBbLhRAa7mwq9OUMhKjJNo/XdQv5vqGryRfW+5rvYac
         PufgHuI9P+FGahoNq8+Yan+0A1/043MaRzqEPEr7JFsOh/1c1O6xQE1WxqDxl/9Ugs2L
         nh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sx2tSORyRYgGHV5Tqw7Lr9Xl8z9D5pOHJ3yBGjUwm+E=;
        b=Le1aLawQv9Hj4+AOt1sZZNHW/p+TGS7QcukHe5X7jWHkb84T0LXRFV4nMw/GvtFB4G
         OmwjAnCxPhHVX/lBxStdE1PLgr8tqpqH+spE7uWqLkuhthfk9OTHsAgJXIpThfXWysV2
         tyRPQ6zc6eT1ouaEEHwQ0oHZQQRKRH/HRxSYg5R/qaeH9hGzQctS5BKCse/7A7oibzoz
         RVyqNgE5mByjYVKoMtHLku+CEiK+B33gyAcUlSvYWXTPe0cSfQ0//XKAlsXxGT2W7w8N
         zuZjfteBADkRD+3dPUdLRv+fdc7XFefw74er0IRfsL9OL2GPxZMXYvPY8Uj+i3GFASUO
         mjEg==
X-Gm-Message-State: AOAM53176XlU+pzXr9ZsASee4sC1iHYKEXyiwCbMLzDS7Qzm9f6aUrrw
	3EzedylClXdaBpLgz41/Dgmc66s+Hc4=
X-Google-Smtp-Source: ABdhPJxSPU9AuhDxibo+wGvKkW3P7LZEP4IJ46n8RrSCwgxqce8uyyEzPfl0vJYkc4/H4wJ37eSeTQ==
X-Received: by 2002:a05:6402:111a:: with SMTP id u26mr15490561edv.260.1621121948661;
        Sat, 15 May 2021 16:39:08 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:08 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/20] gnome-photos: upgrade 3.34.2 -> 40.0
Date: Sun, 16 May 2021 01:38:37 +0200
Message-Id: <20210515233853.583490-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gnome-photos' upgrade is mandatory due to tracker major version bump

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-photos_3.34.2.bb => gnome-photos_40.0.bb}       | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-photos/{gnome-photos_3.34.2.bb => gnome-photos_40.0.bb} (79%)

diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
similarity index 79%
rename from meta-gnome/recipes-gnome/gnome-photos/gnome-photos_3.34.2.bb
rename to meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
index bb70ae7a8..d26c61083 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
@@ -18,16 +18,19 @@ DEPENDS = " \
     libgdata \
     gfbgraph \
     tracker \
+    libhandy \
 "
 
 GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gettext upstream-version-is-even gnome-help features_check
 
+def gnome_verdir(v):
+    return oe.utils.trim_version(v, 1)
+
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "1dd0d477eac4707e8cfe9f35e26d1f29"
-SRC_URI[archive.sha256sum] = "3c59c76ef28618ec055a1799d1040287b90a0b021feb0a02b1eac28e9c2eb41a"
+SRC_URI[archive.sha256sum] = "e02d73e138af8b2868b5cad7faa1bdd278aeade3b6c3c92836511a4e6f3af1af"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.31.1

