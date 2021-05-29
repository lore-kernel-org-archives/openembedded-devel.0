Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.22435.1622305658184949014
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 May 2021 09:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rt+sfVgv;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id r11so8331657edt.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 May 2021 09:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aw0NQwX113qBRuCmKH2lawfCr1BvXjwdi1HEbFcEfko=;
        b=Rt+sfVgvCYZpQ4uO2m4HO2mcT5EogTFuyRbmRtRkxxdCR1deDVVvX9tNKfXZNaQv1N
         QmCgAy+/5X6MECG1VWh0ec1qXX0Se+K82BCUfuNBgB/uPlCUYZVzyDKihYwUJizv2q5y
         Z4FLvtwm4rOqbncG9Lcs5xIXGkDAqVtbO2ReJ0ikQLphtgvf9c62Ee0JMcZ3bVLFj12U
         iKjIpKKSGpeZRq0BxLXLtAJRYIPqvHBd8Q5CLbajxFxVGTuN3qdUXdKuHBm981YPkAnQ
         ov9mV1D/2Fkn8/e+J+OWIbn45/qWzoLIChKVC9b0uZ3n/9ZEYtqitBcttDBaPI5/ooSf
         QDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aw0NQwX113qBRuCmKH2lawfCr1BvXjwdi1HEbFcEfko=;
        b=kJiENi5eVYv9poFwPgcXaH3qpe+5ehQCSYo/+oaGnzDtSPjkawWyPWf6AIdMseTaFP
         YbUuJFcKQYnpPTjb64mXdQ3UvupdLyIyU770vScA9HjVyqBlvMDUplxb2JrakwNzm5bQ
         u/v+8RnFer6jPezbBJo4H+9Ge9BwfccnfOK9Ex67Ca1EMuNh8sOPs4+0KLGdWDu/qgMH
         nkJw2FatOwamvJxzrEdsCkZDlvTfr1VVwXWYF3FDiBT8BMOYyjleSgwijWcS3ra9T+x9
         JKxSRon5ocfqpQ3NIuPT4PmtJPwf/Vn3TmY/Zy4me3x13yW+aMAn/uNCvnhvFi2RbvwJ
         oJTA==
X-Gm-Message-State: AOAM531eq/QyvOB0RY+5QQHua0o3rThs2thlvIeCLfdaMhjjUHxlKlUc
	gQZkwYSfdsG2AuIq/JdzoMmkNLA86ig=
X-Google-Smtp-Source: ABdhPJwQcwDrkyWa+LDfDiSdE9G5ggC12GeL8vQBa3y0zNGr8XRtYu7/XoHlul+p5GqPwuA+9JQ+jg==
X-Received: by 2002:a05:6402:5a:: with SMTP id f26mr16550228edu.306.1622305656599;
        Sat, 29 May 2021 09:27:36 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v1sm3665306ejw.117.2021.05.29.09.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 09:27:36 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] gtkwave: set REQUIRED_DISTRO_FEATURES only to wayland
Date: Sat, 29 May 2021 18:27:34 +0200
Message-Id: <20210529162734.1681055-1-Martin.Jansa@gmail.com>
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

