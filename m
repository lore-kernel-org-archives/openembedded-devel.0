Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.443.1617594731585706168
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Apr 2021 20:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m+xasH8w;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id il9-20020a17090b1649b0290114bcb0d6c2so7234344pjb.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Apr 2021 20:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BZIJwuNiYUHO4CTXnsaHFhWN/6vZHu7dxq3SnErMjxQ=;
        b=m+xasH8wPVpmZC7YN2fCbBrKUn8Y0WDhBwVawi/OWuydZHWOTUscVJivYPEqSryWrC
         b2vOu3UQsVXcbgqP3SLKFgAUEuDQH/oBtMHWI58rv3DXH9fVfWIhbBUsQhCeRzYxXrrz
         C2dhFeAsiH4U2hAxcCj6nGPE9BXQBAV2vCgZMZO0PZXzxZJuTU2uYR0C5o8rqZT0hYxT
         4T/hObp799bxOHdzhaCjZ5zi33dWB9lVZ6uLI4bTPiEVllKIAO//O641OHJ7cOpO4N1I
         bcDN+pbgfkusnBozjC9jgDiP6SarDpLcfsccETRr+rXTH+aTn+9IstTremV3R/4sRBvt
         q/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BZIJwuNiYUHO4CTXnsaHFhWN/6vZHu7dxq3SnErMjxQ=;
        b=cjpBFmRuSmj2NcIzk4+adN5EDEnvJtSNpnOfugnXF7wwLyvFm54Irf3X1kBHQwEJJQ
         /GxPFlnx9cPKc7BEF3qKEqiNwgW2uvVS0ZjR3/Ydq3P7X7oiOjrrCmd0JSSg62PGDJLB
         WYfwXOK/G54YOxf7Ik/MFZ3tGV0QVO9H4R03hTdKgH076zsP3jw6h0H4HYq8beL2oAFg
         Gf5W9+C6a/y/fgIZmwUJ/Ak7o7P0/BokNoZxkz3FypeLhAql4LLxdEQovQGzJYv02XUq
         lhxvXS4Ezpr8t2VoZAEyf56hNSbkPs3pZHGItdu/R5lVFVaFOiLRsbmhO+V7ON5G/Cwq
         mbpw==
X-Gm-Message-State: AOAM533n09qZoSd7GCazCNh+L4RoyPU8M+/FBGBV9eQ5zPq4zGgbd38E
	v4GpRYLuM0A5ItDswqxGl4esXmQ00zg4nA==
X-Google-Smtp-Source: ABdhPJwet5BUDx93+xguCSwFH9Sf/XN8s4kXKdnna/+vb4J4Vue1dSgwbd4e3kDOp6Z1dsZEr3qsow==
X-Received: by 2002:a17:90a:b909:: with SMTP id p9mr15661761pjr.230.1617594730910;
        Sun, 04 Apr 2021 20:52:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id q19sm14443040pff.91.2021.04.04.20.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 20:52:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] libmanette: Add recipe
Date: Sun,  4 Apr 2021 20:52:07 -0700
Message-Id: <20210405035207.196290-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210405035207.196290-1-raj.khem@gmail.com>
References: <20210405035207.196290-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its needed for gamepad support in webkit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb        |  2 +-
 .../libmanette/libmanette_0.2.6.bb               | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index a6513352c0..59908e2c0f 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -760,7 +760,7 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     ccid \
     zchunk \
     libgpiod \
-    libgpiod \
+    libmanette \
     ckermit \
     libcereal \
     daemontools \
diff --git a/meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb b/meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb
new file mode 100644
index 0000000000..23ab348dcf
--- /dev/null
+++ b/meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb
@@ -0,0 +1,16 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+SUMMARY = "The simple GObject game controller library"
+HOMEPAGE = "https://gnome.pages.gitlab.gnome.org/libmanette/"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "libevdev libgudev"
+
+SRC_URI = "https://download.gnome.org/sources/libmanette/0.2/libmanette-${PV}.tar.xz"
+SRC_URI[sha256sum] = "63653259a821ec7d90d681e52e757e2219d462828c9d74b056a5f53267636bac"
+
+inherit meson pkgconfig gobject-introspection ptest vala
+
+FILES_${PN}-ptest =+ "${bindir}/manette-test"
+FILES_${PN}-dev =+ "${libdir}/girepository-1.0"
-- 
2.31.1

