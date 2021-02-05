Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.5242.1612511183173275109
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 23:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RuhiXcUp;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id g15so3951147pgu.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 23:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EFMW8Ulm4iC0kaTJDUiBrGqtKt20D8dmuHhGtszh9ec=;
        b=RuhiXcUpds4AAU6m/eKgCuNiEyLCkrgu8HzmSodl7VDAIHplzt+uxRrAFdDp21oTii
         5mDIG0R3ahNZi9HeacajsFelZlrXaCsRQrt1hz/WZQ9c417CIXzgCFBcyaUafLZPlhXk
         8WrGtUJ66UhjSRn/qJnHN+4ANr1L6GhBWdVSevVgZSQrvinv0C5fTz6slxlOvdBhVGD1
         Bxx8wSB5wXU22EIEWW7KSicI+aa4OkoL5mwei4fd3jui8/tQvx0QjW3xpXwbEqMmWR7f
         IbUoRXnFBHHTWFbHsh2QNOHkqY5NVWYb9mJGD2L/xaiMX6FchSa1Oh6u+AnTVhSIQdUl
         ROxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EFMW8Ulm4iC0kaTJDUiBrGqtKt20D8dmuHhGtszh9ec=;
        b=NxkSvgnMHodhI/8x3RktSjaifcHxGugGkTqKe1ZQnBl6TPEOgyeaMHu/b7WRpD7k3j
         0FkraqOjui6rPVGZI+na1fP5789B2DEjIIB6cf4hB2wjeOGHwKe3RKDtfPqmBkVVLurP
         9578fr7XIZvCZgnTGVS/9D8BZPihNfnpz2rK/+yq2vnOWo0YNdsB3OH+wlyoCCc/rByu
         GQKMB8knKjO1cEgzsK5gr2SQ9Txj+5TOxVkNQtwmJ/6Awx2Fl/JLZ7CuWBYpWKFKyrr0
         qJ1aJc85DoCQyawYWfeMmZ7DQ4QHarFXtZSk61KI4PPrOXbLHg3BdP3OEQHsYY7i0izs
         LAwg==
X-Gm-Message-State: AOAM530lWwk2WucCwynmGeVlHwIqFBIYJDCLyqMJwuY63uIZaq2M3Xdp
	6G49MxF/9R+E3VvNtYJajh78WoE8+nkOlg==
X-Google-Smtp-Source: ABdhPJylSd5OpIBaDgKVsigPT9qWyMJdCRGHtE0jNnPANJvggDqP9XuINynTR5k9SeK2qcTZpHwzLg==
X-Received: by 2002:a62:8c8d:0:b029:1d8:3458:5f3b with SMTP id m135-20020a628c8d0000b02901d834585f3bmr830666pfd.27.1612511182361;
        Thu, 04 Feb 2021 23:46:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id s13sm3317423pgq.40.2021.02.04.23.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 23:46:21 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] geany,geany-plugins: Upgrade to 1.37.x
Date: Thu,  4 Feb 2021 23:46:18 -0800
Message-Id: <20210205074618.53017-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210205074618.53017-1-raj.khem@gmail.com>
References: <20210205074618.53017-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{geany-plugins_1.36.bb => geany-plugins_1.37.bb}      | 3 +--
 .../geany/{geany_1.36.bb => geany_1.37.1.bb}              | 8 ++++++--
 2 files changed, 7 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany-plugins_1.36.bb => geany-plugins_1.37.bb} (98%)
 rename meta-oe/recipes-devtools/geany/{geany_1.36.bb => geany_1.37.1.bb} (74%)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.37.bb
similarity index 98%
rename from meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb
rename to meta-oe/recipes-devtools/geany/geany-plugins_1.37.bb
index 3cf2605733..0305d2c4f2 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.37.bb
@@ -33,8 +33,7 @@ SRC_URI = " \
     file://0001-Use-pkg-config-to-find-gpgme.patch \
     file://0002-Make-libgit2-version-preprocessor-conditionals-compatible.patch \
 "
-SRC_URI[md5sum] = "91fb4634953702f914d9105da7048a33"
-SRC_URI[sha256sum] = "ebe18dd699292174622e8cb8745b020ada8a5be3b604ab980af36e8518df7ce6"
+SRC_URI[sha256sum] = "c98f9b1303f4ab9bed7587e749cd0b5594d9136a1bf8ba110900d46a17fa9cd8"
 
 do_configure_prepend() {
     rm -f ${S}/build/cache/glib-gettext.m4
diff --git a/meta-oe/recipes-devtools/geany/geany_1.36.bb b/meta-oe/recipes-devtools/geany/geany_1.37.1.bb
similarity index 74%
rename from meta-oe/recipes-devtools/geany/geany_1.36.bb
rename to meta-oe/recipes-devtools/geany/geany_1.37.1.bb
index 039999f6bf..330daaace2 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.36.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.37.1.bb
@@ -10,11 +10,15 @@ inherit features_check autotools pkgconfig perlnative gettext mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "https://download.geany.org/${BP}.tar.bz2"
-SRC_URI[md5sum] = "53216a43345e2b6dbefa02ac24885753"
-SRC_URI[sha256sum] = "9184dd3dd40b7b84fca70083284bb9dbf2ee8022bf2be066bdc36592d909d53e"
+SRC_URI[sha256sum] = "18c5756444c1d8bcd737c8ecfd4ef0b3607c924fc02560d4e8b78f6121531a18"
 
 FILES_${PN} += "${datadir}/icons"
 
 EXTRA_OECONF = "--disable-html-docs"
 
+do_configure_prepend() {
+        cd ${S}
+        intltoolize --copy --force --automake
+}
+
 RRECOMMENDS_${PN} += "source-code-pro-fonts"
-- 
2.30.0

