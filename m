Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.18038.1590941824534312225
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EvPQJKEY;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id a127so270436pfa.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1vO7eOL/+WhCs3Dw/CTTa+q/eVDtdbabxM69bfBfRfY=;
        b=EvPQJKEY0w/MQdJjPaULhZr9wam7EqYz+9uDxJWHRI0FyttI7VQ7e/4htCTY6EkO3V
         43hath8eLy7B4SgVwFsV59TNq/UTqxTrBG00coM8W2DThvg0Iubv8XoRz4/LOxMD+sM3
         LiZ0byRFKQRVtDM0dK5UoGL8OnO79bEjnGjc1Des+EhZ0epDIG2qAChvxx501j52URlz
         65v9rsuHUeYsoCQ1wmA03/Lm/gOhMu6XmuYKXc39lWdOSugCBap+XfX8AzQCnCBTU1m5
         QEcbLQU67WHqbDzaumOKoTR+7JGplXAfBPwr8Yy/9jtJ3MsXxKK/SnXLvBRK607cCsYt
         jr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1vO7eOL/+WhCs3Dw/CTTa+q/eVDtdbabxM69bfBfRfY=;
        b=IV6aADvlk27a4IUb4jKiCUk8mz/YlWPS5pGqcL1Z/x0p47qa2an6IZThLviZ5mYECk
         Jk+ozlFim5aKsyIHzwV44sKMQOPRWBhTE3Eb41XlGo73ruOEMk3cnUoC9suCDPrxzd8G
         icNkPeuzzXlh086rEeGtGkH1d/3RtuKwwo2/3r+YxlIg5NyN52Ovp9mVyt+j7A3Wxda2
         XtDQvuDURSDtIh6pHPZwPqtdCYgGwjhxAmhS3O6LUBy5rIcoFqCZf27O6pQxCuE2MkbU
         wf1jHXSBtunMZtpNUVKKDDMkdt+NGwp6cflfIesVXfllxy918Xux1A1YwJhCgXdZzkrL
         Ok+Q==
X-Gm-Message-State: AOAM533qhbOnLTZDm3hcjyS8RSzfQtE9JcQbbESJxcuUHlxKNOYSeGKJ
	u1A9ex0AkU/KwBSfpghGLvSE1ZQD
X-Google-Smtp-Source: ABdhPJwP685kzepraMt4q3fbCjO6d/4DhME2nX2GBKgre64J8HtkUJolcmLDMvH6jUH4Kq3ea0qvuw==
X-Received: by 2002:a63:3101:: with SMTP id x1mr15407543pgx.392.1590941823779;
        Sun, 31 May 2020 09:17:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.17.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:17:03 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 34/35] gexiv2: upgrade 0.12.0 -> 0.12.1
Date: Sun, 31 May 2020 09:16:21 -0700
Message-Id: <ec8d71c988cf04470ccf80f4c8db5116921743c3.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

gexiv2 0.12.1 - 23 May 2020

 * Support macOS dylib versioning
 * Improve compatibility with current exiv2 development versions
 * Fix compiling on windows
 * Fix issue with problematic symbol visibility of exiv2
 * Fix issues with tests overwriting environment variables
 * Fix exception escaping on division by zero
 * Fix overflow in altitude fraction conversion
 * Fix crash with experimental GIO support
 * Documentation fixes
 * Add gexiv2_metadata_update_gps_info which will not remove all other GPS
   information

Bugs fixed in this release:
 - https://gitlab.gnome.org/GNOME/gexiv2/issues/41
 - https://gitlab.gnome.org/GNOME/gexiv2/issues/42
 - https://gitlab.gnome.org/GNOME/gexiv2/issues/45
 - https://gitlab.gnome.org/GNOME/gexiv2/issues/52
 - https://gitlab.gnome.org/GNOME/gexiv2/issues/53
 - https://gitlab.gnome.org/GNOME/gexiv2/issues/54
 - https://gitlab.gnome.org/GNOME/gexiv2/issues/55

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 86b77363b11bc44f1d6437433f4b33a1e2107602)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../gexiv2/{gexiv2_0.12.0.bb => gexiv2_0.12.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gexiv2/{gexiv2_0.12.0.bb => gexiv2_0.12.1.bb} (69%)

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.1.bb
similarity index 69%
rename from meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb
rename to meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.1.bb
index 458eaeaa17..12ea5938c5 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.1.bb
@@ -9,8 +9,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit gnomebase gobject-introspection gtk-doc
 
-SRC_URI[archive.md5sum] = "0a618c5b053106d1801d89cc77385419"
-SRC_URI[archive.sha256sum] = "58f539b0386f36300b76f3afea3a508de4914b27e78f58ee4d142486a42f926a"
+SRC_URI[archive.md5sum] = "44a3cfeab1afd83a71e852835d24e656"
+SRC_URI[archive.sha256sum] = "8aeafd59653ea88f6b78cb03780ee9fd61a2f993070c5f0d0976bed93ac2bd77"
 
 EXTRA_OEMESON = " \
     -Dvapi=false \
-- 
2.17.1

