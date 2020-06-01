Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.48686.1591047941425897947
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fA2RWiMI;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id x13so1329883wrv.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iAJblWQ11plkVmcTuXCkQ7KuroNT2u3uf/z91HyRApQ=;
        b=fA2RWiMIJpc3w1S6fHlfKxETQSZv31r2j4UEqybLJkryOLDmYWQrG2jsipIYgCgLba
         A9wwJDKy23f5sOLRNA7K4EvZm80ohf2/T9SELcPBKjiILO9HIXgnEvnhSjoGS9ryjhZP
         q26gdz21EOkvb9OP1PDuL/UBduwQ/B09f4iDCxb/N4qQ3Yy7gUFazv1Jnu/JNMF5bCSW
         8H6mD9i2EMekX3DHhT69aMqT0R//uL+nZbcBjRUOJSZjYyN7SNZYR8KfJfFFMz0EUjxN
         gAoH1wdgNCw7vcgwSXR8+t5Ttglyo+sa14oRuMvjdgk7i7xgu8Tqaxkv8Txu0ZarY2Rb
         IMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iAJblWQ11plkVmcTuXCkQ7KuroNT2u3uf/z91HyRApQ=;
        b=jl+au624Ij8LVDBEqhwUekpJhq+SDFYJlmPxcXjEM1phPJbfiUOUjCp91vUTr5cT3D
         BeAohDyMu/+loYPNwGrbtcXUPWfWD5D8Jyrj/ixkvNUM2fX3o+YROQ/p3WK/8ibJF8/E
         c+Zq5BDCyd0Jkp/EC6D8K1suX7guqcmF8sqKvdQ17eP/fk2yEb9Sxj3qwLNAxjVWWRG1
         4sYuzymhRIdx6l4Z8mZouu3i3qvMt8dG6GM911x2Qo06kwwR+x1f+yIVCh7q5UFg57e3
         EPJAaEKgQ6jx5X6EtQCJynmXa/3CjH4KWj1BEozrTOf94XVUxEUgADDqSa9GoODx5dBL
         sG9A==
X-Gm-Message-State: AOAM533Yozy5fWjIjeu/ctXyaZ/mQvBoIodT0hKBLadjdm15VcN7q75c
	ZQ/vb0AjJIhNxzxuewGm6lI4VClUZZ8=
X-Google-Smtp-Source: ABdhPJzQBE8wO4dId0T6XaR2Sx3SJsU07zaJNV3pHlAHoUTJMeFCin6MNLYjM6RSr8jlFO2jNmHO3w==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr22487530wrq.385.1591047939787;
        Mon, 01 Jun 2020 14:45:39 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:39 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/38] tepl: initial add 4.4.0
Date: Mon,  1 Jun 2020 23:44:50 +0200
Message-Id: <20200601214516.26624-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

tepl is a dependency for upcoming gedit 3.36.x

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/tepl/tepl_4.4.0.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/tepl/tepl_4.4.0.bb

diff --git a/meta-gnome/recipes-gnome/tepl/tepl_4.4.0.bb b/meta-gnome/recipes-gnome/tepl/tepl_4.4.0.bb
new file mode 100644
index 000000000..4120c6260
--- /dev/null
+++ b/meta-gnome/recipes-gnome/tepl/tepl_4.4.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Tepl library eases the development of GtkSourceView-based projects"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = " \
+    glib-2.0-native \
+    gtk+3 \
+    gtksourceview4 \
+    amtk \
+    libxml2 \
+    uchardet \
+"
+
+inherit gnomebase gobject-introspection gettext
+
+SRC_URI[archive.md5sum] = "013ee8aae178f75cc74e05fac70786b3"
+SRC_URI[archive.sha256sum] = "e6f6673a8a27e8f280725db8fbacec79b20676ae0558755239d15a9808faa256"
-- 
2.21.3

