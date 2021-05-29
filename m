Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.19219.1622281884378460495
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 May 2021 02:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DGHVIuOZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id gb17so8930943ejc.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 May 2021 02:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/HUgC6+DfezVRXVlvrqqiuZUuzFH/dEhiI87XZTQfFg=;
        b=DGHVIuOZCGYmA00RqlMGijcBjKaUVCmZQdl4G7jIrM/fDwWEjUfbNbbyxCbpchrOsw
         3rT97fgn+pr3kikk7S9uT7+bLGjCojGIKt0O++qYrxCWJ/KF0/uNjq69yLv9eNp2lv5T
         kTYr6tGsm/aoxCOwBdIMl88VUaKrwri8AfRiCdcpYOuSHTgKAAz3N6lOyqt8Yr8r8d05
         dLbvC3ncK+oBbwIVcWr86fJSRqN5GWbts5goKOaWRiA/GuwK/Uvf/FOYvKJJ66g2/Hfz
         Lh1+wFAWzEXiiG/FwoFNv8Nbu3PKfvfkS10qgaRfsHBtVBsiDFsti78Ie0eOt18tDxkY
         6z+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/HUgC6+DfezVRXVlvrqqiuZUuzFH/dEhiI87XZTQfFg=;
        b=NibVk0oPtvs3pF+eCQskKnkf9GKJ3A73hkWB6sFCKKy2rcKZ/bCj/duwiF1OeHjh53
         ifTFMNp93HstOfMFpJHyRI+0NlUy0GwF1kFeG76QjLd74uGiif80cEj1aeor4Mpw9PaO
         pPOvQh1LhbdLbifZAL+PtCfQyScddZYAZPFHM1d3yfiBqtJSyH1ZwtxoJncyyxq3dCZ5
         gWwc0QPx66kPEN/TD0jaEbQbIgU5/DFnaCV4JU4g65qth6DD38fEav8NmZqdAGY8+aGz
         F5oqofcmTtJFcnvoqWep2wHlQi2CoRU7yw/xtkbGqI9krxZ0sENjQzsYOHh93fVkjIEf
         6L7w==
X-Gm-Message-State: AOAM531VkqvvwaHKt+9L76mXMfCQjA32yMLeEwzhOL82pjw3a2PzhGpc
	hKa8rFtrZDgpQU0pw6bhmVd8YSl7EUs=
X-Google-Smtp-Source: ABdhPJxNy4UUlz6ISDsUb0F7TzcEnntzD1oSk/j4RGf8+DAS6ZVSR28pKH/akCdkCxw6Z0FGI/Tv1g==
X-Received: by 2002:a17:906:68ca:: with SMTP id y10mr13332837ejr.318.1622281882889;
        Sat, 29 May 2021 02:51:22 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n15sm373ejz.36.2021.05.29.02.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 02:51:22 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] gtkwave: set REQUIRED_DISTRO_FEATURES only to wayland
Date: Sat, 29 May 2021 11:51:20 +0200
Message-Id: <20210529095120.2135584-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529095120.2135584-1-Martin.Jansa@gmail.com>
References: <20210529095120.2135584-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* after the migration to gtk3 in:
  https://git.openembedded.org/meta-openembedded/commit/?id=8221db74e300619d002e2b385d12a5fe13e8999a
  this was now failing with:

| In file included from ../../gtkwave-gtk3-3.3.109/src/debug.h:17,
|                  from ../../gtkwave-gtk3-3.3.109/src/vlist.h:18,
|                  from ../../gtkwave-gtk3-3.3.109/src/analyzer.h:18,
|                  from ../../gtkwave-gtk3-3.3.109/src/symbol.h:20,
|                  from ../../gtkwave-gtk3-3.3.109/src/vcd.h:32,
|                  from ../../gtkwave-gtk3-3.3.109/src/ae2.h:16,
|                  from ../../gtkwave-gtk3-3.3.109/src/globals.h:27,
|                  from ../../gtkwave-gtk3-3.3.109/src/timeentry.c:11:
| ../../gtkwave-gtk3-3.3.109/src/gtk23compat.h:12:10: fatal error: gdk/gdkwayland.h: No such file or directory
|    12 | #include <gdk/gdkwayland.h>
|       |          ^~~~~~~~~~~~~~~~~~

  for distributions without wayland in DISTRO_FEATURES.

* because https://github.com/gtkwave/gtkwave/blob/f9d82a82aa3ddc30ca47984278371f62c9a3bd81/gtkwave3-gtk3/src/gtk23compat.h#L10
  explicitly includes gdk/gdkwayland.h for gtk-3.22.26 and newer (oe-core currently has 3.24.29)

* restrict REQUIRED_DISTRO_FEATURES to wayland only (instead of GTK3DISTROFEATURES which includes x11 as well).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
index 2b572f7e2f..c8d7e959c1 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
@@ -23,9 +23,12 @@ DEPENDS = " \
 
 inherit pkgconfig autotools gettext texinfo mime mime-xdg
 
-# depends on gtk+3 which has this restriction
 inherit features_check
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+# depends on gtk+3 which has this restriction
+# ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+# but https://github.com/gtkwave/gtkwave/blob/f9d82a82aa3ddc30ca47984278371f62c9a3bd81/gtkwave3-gtk3/src/gtk23compat.h#L10
+# explicitly includes gdk/gdkwayland.h for gtk-3.22.26 and newer (oe-core currently has 3.24.29)
+REQUIRED_DISTRO_FEATURES = "wayland"
 
 EXTRA_OECONF = " \
     --enable-gtk3 \
-- 
2.30.2

