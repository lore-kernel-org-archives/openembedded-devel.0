Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB74E63CB6
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 17:06:33 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42803.1769360791173453043
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 09:06:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GbiZRIPk;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-432d28870ddso1936654f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 09:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769360789; x=1769965589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7w99Dk/GTMR7htIyldHvcReQ5uiw82nHWU0mRf1hck=;
        b=GbiZRIPkelogctMPmgD8OWAmxKanDpmzhkG3CQTqR8fsx56yxTXRks5R/kfmk9Ck0N
         2i6T7Zm9cvm8h5WR9lIF3Q9akDAh3n7hXV2thCwaSddLKkkRP2B35fXnYTLjU2mXR5bB
         uXNrAvoTkWC2YFAXLpZBTrF0v1h1MaHBayJXIk2lVSZsQbO2hxBMr59vAibFizWSydzh
         JUfzAGX+5uzhBLivru6iES6SoDCB9/3HL8pjwhu3qEzWjwZNElK0cq/LUXkUbtERGGa3
         FlfWmswCl9cFJWSgld/ajpLTkCTqwY+4k00etOerj8noQTIZulCA1DjwgxkbCqnJci4O
         76og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769360789; x=1769965589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J7w99Dk/GTMR7htIyldHvcReQ5uiw82nHWU0mRf1hck=;
        b=ToCZiflvi0polAFXt9OLzrUSjqZKjibL61Ic18+m3EYBgaFVv3zwOgEEgwBaMXh+EE
         gAWyJ3X1l3aeD8Gc8rz7waKAl4DEC523Q7dTnreLWja8THG6vt8nH/m1niz8c6cvGwu6
         ae4UTLth7G3NmaHt4eEqivJ6QOHJ0zjqek7G5OTTzrFsSCdCiLoDaKNDIplL66USQ0XD
         +neibVQgoCfuDltCqLd9jbcIibXWjvwlq+I1F/uXVJTqJD+5sHcUWd6A1eMDZ58Qf0un
         VFiTOH/xoq4NKDSAJW4Z1uovB14AKJdPdlo/BFORuWPOdkpGrT+JGQXcLIyKKcihbEDa
         CCmQ==
X-Gm-Message-State: AOJu0Yw1MBNM8O/WgZH3dacSDIzKQ+1+WKelUVdhyd6dJP2HFrZuX9v5
	+dCR3di+JKpX5ZT5ltv+w4jVGj0LU1ok87yBc0V0clkzgdq1kaVfGC1UfS6tVw==
X-Gm-Gg: AZuq6aKv+uS6zBjZdNuQSh6eEGFSYqs63zdn+zVA6MMQJAhc1/v7XNA7WmFzFmeZ6MV
	z+uK+bREERnqKH/ljcVEPvHdOTwDXcvCB1Lz7YHuQcCqQjzZubl6DfeQArlKoY6XdF/dshtWKft
	Dwl2ih27rXE5hnyYybnHN9lr9aPHVu6QuoODSvlb9GqQXCw0EIEHe/1JjCAHCSWzpSNRT14yd3h
	apW5v0Wisf4Cu3G6nsqBbl4vOVbf2IXMOSRqbwdCX2vhqQdLrJ8pxzI1iPPDJwmlDMvtBMlGhEm
	GvcsA1fx/IJAt8+vFGZV4vm7h6ct61DZ0ajxyODLp5UYGlfTsTDXAYpQIme0rZVV3gcYOqv0Q+b
	vXtBcy5DpKH8733ogg+TClMdLciJ3LQX1RodywyOi9Ae/8nWJitM3EcG2DRwrUymEJ7cU3egOE0
	H1QBqPYu1I
X-Received: by 2002:a05:6000:2911:b0:3ec:db87:e5f4 with SMTP id ffacd0b85a97d-435ca122cd9mr3251958f8f.7.1769360789489;
        Sun, 25 Jan 2026 09:06:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1b6e2besm23431414f8f.0.2026.01.25.09.06.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 09:06:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 5/6] libgedit-amtk: upgrade 5.8.0 -> 5.9.0
Date: Sun, 25 Jan 2026 18:06:24 +0100
Message-ID: <20260125170625.3178555-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125170625.3178555-1-skandigraun@gmail.com>
References: <20260125170625.3178555-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 17:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123844

Also, update the SRC_URI - the original github repos have been deleted completely.
Fetch it from the Gnome servers instead.

Changelog:
* Adopt new versioning scheme (this version is a stable one).
* Move the project to: https://gitlab.gnome.org/World/gedit/libgedit-amtk
* Use GtkImageMenuItem even if deprecated.
* Build: add the 'tests' option.
* Translation updates.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gedit/{libgedit-amtk_5.8.0.bb => libgedit-amtk_5.9.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gedit/{libgedit-amtk_5.8.0.bb => libgedit-amtk_5.9.0.bb} (64%)

diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb b/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.9.0.bb
similarity index 64%
rename from meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
rename to meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.9.0.bb
index c2e7dd67e9..fc0356c14d 100644
--- a/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.9.0.bb
@@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSES/LGPL-3.0-or-later.txt;md5=c51d3eef3be114124d
 
 DEPENDS = "glib-2.0 gtk+3"
 
-inherit meson pkgconfig gobject-introspection features_check gtk-doc
+inherit gobject-introspection features_check gtk-doc gnomebase
 
-SRC_URI = "git://github.com/gedit-technology/libgedit-amtk.git;protocol=https;branch=main"
-SRCREV = "f6fbfd1c57de3d97cab2056a5c3088b0da49e8a4"
+SRC_URI[archive.sha256sum] = "7fc3348bef242e08967bdbb9a6698cf39f7810f95051fd8132910f36ed2d6d15"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 

