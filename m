Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.40084.1595802913224049375
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 15:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sbf269TW;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id g19so1339218ejc.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 15:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HwFlf+yKCRDiJuEGyGN8xj+8jelyJgJggp0e03ClJOg=;
        b=sbf269TWHs+c1K43BJS4J/ylvZC5yzhJEzRCXq1llPCVAwwhAGduijP55XIzzeZZax
         lRpuPriTDk/UHNE9TFzslAOnMVhfyLywTTEEgtpQW4apz88rj4lHjc47Yc3j7Wz62j6D
         1tmuWFf4QSN0N+2AZzGLq/RE7tBqrDph8PrlgsXmt43eNQM2AVGmT8l84WwFsrE0ot9I
         HegnMEKPoLXEmlsmLVZLpYPFHmQAzEpjtHd8pWqWRr89LEnafo7gEbZKQzYx1Vhqgrvy
         Xgw2WsmSA4Orz2ucXO1PveLfgd7FbZz/2XKBNVYZFddLZmtGnG1ClGqEFbHgekQQUuiS
         VBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HwFlf+yKCRDiJuEGyGN8xj+8jelyJgJggp0e03ClJOg=;
        b=XpyiEh9SiRzLRwHBVsqALGwbTbji3L9efu29XxelOGT2Mj9h5nz+Vwx9tldDaWscw8
         hPGwFpYfkCzNckST9fDgoLb+gt2aUOJiWLv3pJnYJLoCkIigLPFS1Uw1OiGzOqf4URYM
         376LCYHJrH0lbLqtP+tqImAupnGZDFukS6X98MEB7qPyXHHfyDeDGM+7agi99HpeWRQK
         rqUwLVnsBb1peLxOoKiTodW/LFgu4Qvx+dQueA6ZYw/CqUUxB2fPkhGcfwVhKUUnnse+
         uz24QTTwQA4A23vytLGP2d/DzOIUGamICrShhTBjA7U0aSbcAPBB76sb+Ao/yCPAs8Dc
         CVmg==
X-Gm-Message-State: AOAM533kfDoj/OunUeylW7aePRWKb3xGLWrfIu+TIRZVgxkaIPXTl/To
	4+J5foXchL16w3vwusQJYeIVWBXc
X-Google-Smtp-Source: ABdhPJwvkI5pt+0rzBixY9pbVMDqeVl+32vMUXlUXFzFVr97+cpGGEjvmaXV2zpGbPZFxZ/YD8y05w==
X-Received: by 2002:a17:906:6406:: with SMTP id d6mr17822686ejm.30.1595802911601;
        Sun, 26 Jul 2020 15:35:11 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f46e203fabf36e58663abdc.dip0.t-ipconnect.de. [2003:f0:7f46:e203:fabf:36e5:8663:abdc])
        by smtp.gmail.com with ESMTPSA id x64sm6404096edc.95.2020.07.26.15.35.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 15:35:10 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/10] gtksourceview4: upgrade 4.6.0 -> 4.6.1
Date: Mon, 27 Jul 2020 00:34:52 +0200
Message-Id: <20200726223455.333001-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726223455.333001-1-schnitzeltony@gmail.com>
References: <20200726223455.333001-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

News in 4.6.1, 2020-06-26
-------------------------
* Fix various G-I annotations
* Improve draw-spaces coloring in solarized-light
* javascript.lang: Performance improvements
* c.lang: Fixes for #include preprocessor
* sql.lang: Language completeness improvements
* latex.lang: additional keywords
* sh.lang: improved parameter expansion
* yara.lang: initial support for YARA
* Translation updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gtksourceview4_4.6.0.bb => gtksourceview4_4.6.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview4_4.6.0.bb => gtksourceview4_4.6.1.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.6.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.6.1.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.6.0.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.6.1.bb
index bc7f4b05e..5a420e615 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.6.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.6.1.bb
@@ -17,8 +17,8 @@ inherit gnomebase lib_package gettext features_check gtk-doc gobject-introspecti
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtksourceview/4.6/${PNAME}-${PV}.tar.xz"
-SRC_URI[md5sum] = "51558b386cd12602b7bb1c460c09bc62"
-SRC_URI[sha256sum] = "4c13e30ab2e602abdc56f55d35f43c1142a79b1cd77aa8839d2fc85e966d9a85"
+SRC_URI[md5sum] = "4d4cff3a57a371bff4793e97d50404ef"
+SRC_URI[sha256sum] = "63f487a7ab59612ffa9e7be1883dbd274ab1016afcede3239b93b0fc384df874"
 
 GIR_MESON_OPTION = 'gir'
 GTKDOC_MESON_OPTION = "gtk_doc"
-- 
2.26.2

