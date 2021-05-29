Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.22411.1622305667117917828
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 May 2021 09:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JMggChBj;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id s6so8336897edu.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 May 2021 09:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aw0NQwX113qBRuCmKH2lawfCr1BvXjwdi1HEbFcEfko=;
        b=JMggChBjjAiXCRw4PQOf6r5z2iQGfxTZ7HdhTscVt3IQbvJltsCAiridde23sRPtpd
         N0QxswtEb54umJoOtr+tTeFevPsnG0MocJTMp00gnZq29jlKbhmgODY9knsxLujR/UmJ
         nCH+5OQdbEYhrAqqoM1T9aHkSe7pQp/7d/vBy8NKmqrHD6IGuW+PvKTOtbVxmB1hRXX0
         Aez4MzjIx2Hyp8t4Kis9BN0aMeIFqeunaQoP+sGT8SIXieo8Q3oYqeyzpy6nYGgHHZSd
         lgSGxPmQs1sS3vnA69rIjjsZOr3SguSp7ShZ/K/8BkfAdwYbKIiwInqItYJ6xdjGW3EM
         A42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aw0NQwX113qBRuCmKH2lawfCr1BvXjwdi1HEbFcEfko=;
        b=sa9XSHyO0GXonNpSwDes6palXQEgAufOw3HtaEOntSDiO2LU2M2vOu2Mnq2Uyxmvuj
         UbEmznB7ft4AoHqu9k7Vp+/wEZE6acdysdBs0DFPvPQYDuOgu/FJce8cqAKdFEBv4kjb
         LhzAmIUBvaad2hG4i1MR8LC+0RuVQz50K/xvnB3JI9dHl1kFJhpeavGvb2HAwSE23oyp
         Fcu+BkGYbwciSpKozuFP4DXSirqjJnQ+MLLgeOSF7y7mNnqgcuTcvh49ALLLpbgSbT0o
         eI0yKGWhIhuOJbFJ8YBvf3VddoNdE8ZeXZYWYEI1V7Y8AyiBomKSPuEkW3ak136jsj8X
         gvUg==
X-Gm-Message-State: AOAM532DmioF1gOeHdy/uLyOdm4DFiP++pkGiRwkThnC7Syl8ohf/e/k
	GtHRk2SQqaDsM6rllvr4grCzp//ZuNY=
X-Google-Smtp-Source: ABdhPJxtEdpv18+g3kS8WUHPCfnG/3xY3GzryGEzfCTjPT4Nt3GlH6UcJ95D/bikuYIqd5fJ9H4prA==
X-Received: by 2002:a05:6402:8d4:: with SMTP id d20mr4663989edz.117.1622305665700;
        Sat, 29 May 2021 09:27:45 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t19sm4440425eds.4.2021.05.29.09.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 09:27:45 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv2] gtkwave: set REQUIRED_DISTRO_FEATURES only to wayland
Date: Sat, 29 May 2021 18:27:43 +0200
Message-Id: <20210529162743.1681123-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <16839630F438851A.19130@lists.openembedded.org>
References: <16839630F438851A.19130@lists.openembedded.org>
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

* restrict REQUIRED_DISTRO_FEATURES to wayland _and_ x11
  (instead of either of them through ANY_OF_DISTRO_FEATURES and GTK3DISTROFEATURES)
  because wayland is needed for gtk3 to provide this gdkwayland.h
  and x11 is needed by tk dependency

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
index 2b572f7e2f..e1cb3d4a51 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.109.bb
@@ -23,9 +23,13 @@ DEPENDS = " \
 
 inherit pkgconfig autotools gettext texinfo mime mime-xdg
 
-# depends on gtk+3 which has this restriction
 inherit features_check
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+# depends on gtk+3 which has this restriction
+# ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+# but https://github.com/gtkwave/gtkwave/blob/f9d82a82aa3ddc30ca47984278371f62c9a3bd81/gtkwave3-gtk3/src/gtk23compat.h#L10
+# explicitly includes gdk/gdkwayland.h for gtk-3.22.26 and newer (oe-core currently has 3.24.29)
+# and it needs x11 as well for tk dependency (so it happends to be both GTK3DISTROFEATURES instead of either of them)
+REQUIRED_DISTRO_FEATURES = "wayland x11"
 
 EXTRA_OECONF = " \
     --enable-gtk3 \
-- 
2.30.2

