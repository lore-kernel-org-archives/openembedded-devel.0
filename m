Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.265.1617899825621853306
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dxr+jolJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id n140so2775010oig.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=2XBx1PJDxMzlsCwlV325FG3KZT0R71axlAabBbQkxBY=;
        b=Dxr+jolJxdIZ71h9yCNreBnGMkOJHkKWrwL2lyqJWUVnfDqh53jMvbmtVTsoj6rDvK
         B51uJ3D81gV8Z+cps3lAzfwV/pDjVA8pp0549t3gP8XRbLoqhPnepFVvyWY5lat5BVJF
         BRNpD7rJnudbyWuWbdYcHVc8gA9VUgyec2DW1LuOSmo3EjosXq8t6fSTF3Z1jJNOwOZP
         SjXmieMde8emDgqEtM0CZ/eY1BxTNyO7ayc59zAFAbIyT9WGwMdEjBkSfVZjypt+ZFcT
         FGkMzRmT+/CLGcyhwLxgrhyA30OrLeCq9t5sdiuxwXy1gqYVhNF3zQCHIP8Wo0ceFFyf
         9yhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=2XBx1PJDxMzlsCwlV325FG3KZT0R71axlAabBbQkxBY=;
        b=h1p+iU6gSp6BF6Fz/ujZkCC+wbzZfOFd54Pp1Ld2K3aH0nRx9NlHqghzHVUoAiTX75
         b16x8uPfdtJPyoOAwbm+LRU/x88N5i1uHB2VpRsrOPqcgdlLdrSP3ITYWcCDzE+3ymkp
         T3x8AH7Kpo8i2VOg6VmEIReIiDPEbV9k1ORyaO1IC9vV765b2yYjoRTZ7fpWiVpUHQRO
         c3XpqR7Dx4sNetD+1hB7OTLfScXRxNSiW2vcQMTfuO5k4l47cg2+ROqmuAjE2W3R2PYW
         BAF5oEDhR6tPNh6x6C12u1eOBogfZQ96snDddnhPpr3XCVldK+irMTYZugOdhjmNT7Vu
         bUxg==
X-Gm-Message-State: AOAM533sgG5QWCdNu8TYgaupyVOY5RDLr9VsOCEX5wc75ZMRQ5gaAkVM
	P02isHIbame3m64LsUTyeYoI49T5FoY=
X-Google-Smtp-Source: ABdhPJy3VJvRVwzdNKhKZCI5egtFpXGXv65I1xF2Sr1fHP2SNFyKZuscW358q07H/kIlacVooY0mSg==
X-Received: by 2002:a54:4492:: with SMTP id v18mr6806154oiv.49.1617899824768;
        Thu, 08 Apr 2021 09:37:04 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.37.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:37:04 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 56/64] telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindings
Date: Thu,  8 Apr 2021 09:36:03 -0700
Message-Id: <02a8f97cb6842d47c53c0c0b189c6707d5f1ccab.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e721f6d9444779cfd5f5de54c0cf4fe2f15fc74d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
index 2b05c61a0d0..4d4e841f624 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
 inherit autotools pkgconfig gettext gobject-introspection vala
 
-EXTRA_OECONF = "--enable-vala-bindings"
+# Respect GI_DATA_ENABLED value when enabling vala-bindings:
+# configure: error: GObject-Introspection must be enabled for Vala bindings
+EXTRA_OECONF = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-vala-bindings', '--disable-vala-bindings', d)}"
 
 FILES_${PN} += "${datadir}/telepathy \
                 ${datadir}/dbus-1"
-- 
2.17.1

