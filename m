Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.4589.1592566335909745431
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 04:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pKrtH37T;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id y13so9843513eju.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 04:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=B038+/EiZtYDfSxMaSC/0rRYR8yVvDGfkPhgL/l6Qts=;
        b=pKrtH37TxolZI1La5jibzfoaiHu6gPpw3CA1HnQqwuzgOwvEvGBIuA8gPfmi7LDdQ1
         X59GiHdaBOWn0za3tcf18CDxKIxryFlFEteQ5/+X/uZ8g+87KWqRSAUqpziky2FRy1wq
         bHCxeRSjW86yUUMzjieW3uy1eXTxlPlJqVdTkjrhooA7xaWjH0+BRIOlu4bjXUkawHNb
         ZuE9cx/7BEXMDS7F5upQZvi+cIHqMXsqWK+hkTnJt2gIRqHra9vA3zNIwc/JjzQS4om6
         o3sowBvuqjduqsZODl+vl9pr0+9pjibELt9qC82pKGEbS1aibpb4ZKuEWzRalzTLncFw
         ZN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B038+/EiZtYDfSxMaSC/0rRYR8yVvDGfkPhgL/l6Qts=;
        b=KbM/XfFp9FXStBuxaprsEO/WeG3iRcKIsrr0rwUOY8bwQy9yEf7KJHcnW2i3tRiqym
         mqHjlrF+/7PzQ/3NgBVauKlgy12Y8mX18IxGCjce0hki5j3rrFmT3NXx80T3vw8i/70Y
         3yDrK79jnv9fOXT/6KixtzuaWwUtMhDqGwSBMTB91HviaE8iIXcBhf7ua1agDxRP4tlZ
         A8z7d9dYrSO18TbpBbqEjI4g8BBOC43pZYOhbXDmH/T7FmYDFYsUlajeYqf8lAa4MBdu
         F4hofkMwJRhjFobpBG8Q1PFFzr0pl3Ig34NAHlj4knYdb1ySz54hpVlerJHzCyjwB0kP
         yeQw==
X-Gm-Message-State: AOAM530eBnnm9Uhd7NtHYePw4vyogEz35mujGIVauZbbVbNoc8cr3Suf
	rE8sCJ0td+PABTlLFjDP1JhfrWBRimY=
X-Google-Smtp-Source: ABdhPJw1J6dUPN8WtPT64kLSYtdyjk/fQE1NKx+q18wNlRDsqO0HhxSiSEsQlaPclxcemDcPQp+SNw==
X-Received: by 2002:a17:906:6a4b:: with SMTP id n11mr3103749ejs.198.1592566334255;
        Fri, 19 Jun 2020 04:32:14 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07a002d299e9f71202562c.dip0.t-ipconnect.de. [2003:f0:7f07:a002:d299:e9f7:1202:562c])
        by smtp.gmail.com with ESMTPSA id o12sm4472346edq.7.2020.06.19.04.32.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 04:32:13 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/10] gnome-desktop3: upgrade 3.36.2 -> 3.36.3.1
Date: Fri, 19 Jun 2020 13:31:57 +0200
Message-Id: <20200619113201.2811033-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619113201.2811033-1-schnitzeltony@gmail.com>
References: <20200619113201.2811033-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

===============
Version 3.36.3
===============

- thumbnails: keep the orignal file name
- Fix encoding issue when translating locale modifiers
- Update wallclock reftest expectations
- Update Hebrew wallclock expectation
- Translation updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...e-desktop3_3.36.2.bb => gnome-desktop3_3.36.3.1.bb} | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.36.2.bb => gnome-desktop3_3.36.3.1.bb} (77%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.2.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.3.1.bb
similarity index 77%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.2.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.3.1.bb
index 1f5acd8d0..b7ef7545a 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.36.3.1.bb
@@ -1,8 +1,10 @@
 SUMMARY = "GNOME library for reading .desktop files"
 SECTION = "x11/gnome"
 LICENSE = "GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
+"
 
 BPN = "gnome-desktop"
 
@@ -14,8 +16,8 @@ inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspecti
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "9fa17a6e2eacde3f9dd0df6be10091b2"
-SRC_URI[archive.sha256sum] = "38f994dcb1e1ae093d1c929c7acc4f88e39111e43b5fdc13125b0f6e2311c789"
+SRC_URI[archive.md5sum] = "75e828342e51c88c866dcdd46c021d26"
+SRC_URI[archive.sha256sum] = "4bed119fa25ea0ff7880928142365c3c8726585fc072bc147157e66b63e96b7e"
 
 SRC_URI += " \
     file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-- 
2.26.2

