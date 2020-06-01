Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.48679.1591047935622899208
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vV8Jf6+w;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id p5so1294063wrw.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UHrzTB9vPgcwFE/SZ126KER1pp2iuKV9HdT0jQZMdHc=;
        b=vV8Jf6+w3bP3tklm5FwuZf46qfgUvXZZerZxBSemhVM08PuZnSmCUYjQeFzUnQBtRK
         vSK/VoOthk0Qlbds6J1vYWdOcwUM7icnIkxvc+4f9fWin7m8tj46seNN4t2O+7TqCZhO
         wjPLC9z7tu9N3XKfTZ7Eui2E/j/5mkUD0lnjqFS7S3idReR1J2zJhUMXBbJw5EF1922I
         4/o2U2Hr5YPR7a4NVEK7ocsXClW0QVmPS/5bWNEhtY/Nfk0hNknNd5WwkpixXkFcokDB
         cr3SrcASRULdCX0GCYZOUbtHIYgw2sArP43LHddfYYVljKZX3yUH0n5GJEWfa44Y7rGm
         KGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UHrzTB9vPgcwFE/SZ126KER1pp2iuKV9HdT0jQZMdHc=;
        b=VkXcaofYjwvgwFGhP/1/R8Fy5QlNYRr61fkIGhoS3cusrZsYnmSf7xGmGX+3Xm7yBZ
         wkVmncPzYkoMAklLKf3pt2N/wilFH1F9AhOZ3yu8FwIlxpJGnNxMOL9ObzqgjxFRpGTg
         3e7ouc9fcCJhmTg70exxJhPE18A1QzvsTL0BuKjLDmtDMh/76MinH28tcneGDQhc3pSm
         VHYjsi230LbodvxsofgaY1ISKm+H/1jXxQ+FZ04HPY13qWB0WHw7WzdOEH6I0aV8BnCZ
         ntqGB49cwVVMpAfxki+pMY3G8HHZcu7UHdqBYpBiJ+9T3nXwG3wRgVMw6hIF8wrV8cll
         o4ig==
X-Gm-Message-State: AOAM5313X4Bvu/lef4ky0PA5gaVjBvRvmicP+3K0Tijh1xlOtSzox4S2
	Al+bcuqlVtEsRDXlI9LE0XJNerEpJOc=
X-Google-Smtp-Source: ABdhPJxSN5XUIOYysJ08Axuz9vRTNIE8YGHlHBWqxb3rGg0th3v7n9QhA01lhKqBCNldRJ27yFwQCg==
X-Received: by 2002:a5d:484b:: with SMTP id n11mr23763209wrs.356.1591047933970;
        Mon, 01 Jun 2020 14:45:33 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:33 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/38] nautilus: upgrade 3.34.3 -> 3.36.3
Date: Mon,  1 Jun 2020 23:44:44 +0200
Message-Id: <20200601214516.26624-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Major changes in 3.36.3:
* Fix broken tracker search engine under some locales (Cristiano Nunes, AntÃ³nio Fernandes)
* Translation updates

Major changes in 3.36.2:
* Prevent jump to the old scrolling position after changing location (AntÃ³nio Fernandes)
* Revert icon emblem fixes in order to prevent performance issues (AntÃ³nio Fernandes)
* Fix content type detection when opening files from remote locations (Ondrej Holy)

Major changes in 3.36.1.1:
* Translation updates

Major changes in 3.36.1:
* Fix check to not clear clipboard after each move/copy operation (Artem Serostanov)
* Ignore hidden directories in the templates folder (Ondrej Holy)
* Honor umask when creating new files from templates (Ondrej Holy)
* Fix endless content size calculations in properties dialog (Ondrej Holy)

Major changes in 3.36.0:
* Translation updates

Major changes in 3.35.92:
* Fix crashes often happening when searching (Ondrej Holy)
* Say "Trash is Empty" only in the root of trash folder (Abdul Rauf)

Major changes in 3.35.91.1:
* Add support for hidden template files (Ondrej Holy)
* Fix conflict dialog for google-drive (Ondrej Holy)

Major changes in 3.35.90:
* Fix crashes after conflict dialog response (Ondrej Holy)
* Add support for numeric keypad for zooming (Sabri Ãœnal)
* Fix missing filename results when searching (Ondrej Holy)
* Fix compilation on Wayland-only systems (Javier JardÃ³n)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../nautilus/{nautilus_3.34.3.bb => nautilus_3.36.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_3.34.3.bb => nautilus_3.36.3.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.3.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_3.36.3.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_3.34.3.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_3.36.3.bb
index e7541664a..fc9ab379d 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.3.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_3.36.3.bb
@@ -17,8 +17,8 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check upstream-version-is-even mime-xdg
 
-SRC_URI[archive.md5sum] = "769053f14bb993605a2b60085c47b4cd"
-SRC_URI[archive.sha256sum] = "02d984b794f3a34a7aa66bf5c70cc2a7780de55bd900504fb1014931781db36d"
+SRC_URI[archive.md5sum] = "c3c8dbb90d8eeed6c127aa568e131395"
+SRC_URI[archive.sha256sum] = "b6cafc7ab1e70a64383de391b6097fcccbf36b208f8502d8c46423224fd30ef8"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.3

