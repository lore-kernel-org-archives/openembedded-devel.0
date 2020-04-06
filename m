Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.7331.1586164850974302971
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L/hWInZY;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id w10so16573955wrm.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2020 02:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2vsAj4AQluFGgI/UxOTlTDLjg7H6FXvkh+fnC6Cfm5U=;
        b=L/hWInZYaQA0FOZO1HyDgeg0cg2eCy3PJOpBnfqpKzfu7P/4DLc8CYkPN5F2GwGIkK
         xMvNp+r2+OIIQ+vdBbVViBQKyh3qmIf+APsh+fRdeNaZBLh/QQEUTYXGlTTyUtoZ89AX
         yYYbyi8IfwQ6XKTP6x5vmxYk+acfw5pTtigCfobTcfIM51ncQaXUlBT2TrT1YF4Y1ofF
         fO0rfbTPf2u4BXYOqpWGdIqF2nfGoTap61raFRSGtjLvGmFIZoMq7CGMuuMWEh2PXWpC
         E2N1srhbSCSDIoFw1vQPQsRoTgUIvIjqG/5ov8was0gyKbPXTdoD7x/fGJZOYAdxTFMp
         TMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2vsAj4AQluFGgI/UxOTlTDLjg7H6FXvkh+fnC6Cfm5U=;
        b=GDyicDT2aJ2XtpP11QZpZMOCyUNP4F0oN6J3lYQ8rbfw0X96YE7MOmsxJ/RjOPrMHz
         StinCwhTifeSGVGuxggpC98zD5Vd6xmfoN5Eg5nP0jnqVOxTjnzHNv7u+EZA8S2znY/Y
         FtL4WaDYjZo0QOP2+hYZ54JhoEnH35AXf2kK7csrQByUjoSRgNaEPeOA6UVpwdWqpuF9
         kE2PuVb+euA+86nAsfOUnyoesZF/zIHfHyTBeraRB4nAF1AwgXlOi9t+Gc2wjbR06GHr
         5In5v0KHjOSw0DGV097QRU98jD8rUVrC8+1tuvPK1Vylj+cyhFW+50q8uRxZl1y7/TGr
         a6/Q==
X-Gm-Message-State: AGi0PuZvkX2kUbshu1bEzOLSYlED2vid8Ll5+USFTkEIPz84EdizlzFx
	T2p33toDfbCgjNX51anGiQmTNyHsnZs=
X-Google-Smtp-Source: APiQypLdGiaQUPVWUcZ5PTO4KVPF0qihfqaP+ZB4xnxbGBD4Ddc/sQhM/IV2iavvsZvraHUbxQ9MUQ==
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr9970555wrv.348.1586164849273;
        Mon, 06 Apr 2020 02:20:49 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F295D58AB00388BFE597C49.dip0.t-ipconnect.de. [2003:f0:7f29:5d58:ab00:388b:fe59:7c49])
        by smtp.gmail.com with ESMTPSA id h13sm207075wru.64.2020.04.06.02.20.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:20:48 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/14] libgsf: upgrade 1.14.46 -> 1.14.47
Date: Mon,  6 Apr 2020 11:20:26 +0200
Message-Id: <20200406092032.3574-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406092032.3574-1-schnitzeltony@gmail.com>
References: <20200406092032.3574-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libgsf 1.14.47

Allin Cottrell:
	* GsfOutputMemory improvement.
	* Teach GsfOutputGzip to control compression level.

Marc-André Lureau:
	* Cleanups.  See merge request 5.

Morten:
	* Fix fuzzed-file crash.  [#19]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgsf/{libgsf_1.14.46.bb => libgsf_1.14.47.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.46.bb => libgsf_1.14.47.bb} (79%)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.46.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.47.bb
similarity index 79%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.46.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.47.bb
index 049320afc..6d82b35eb 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.46.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.47.bb
@@ -9,8 +9,8 @@ DEPENDS= "libxml2 bzip2 glib-2.0 zlib gnome-common-native"
 
 inherit gnomebase gobject-introspection gettext gtk-doc
 
-SRC_URI[archive.md5sum] = "5bc6d1d6394f0ed5a58e8f2e5e4ead7f"
-SRC_URI[archive.sha256sum] = "ea36959b1421fc8e72caa222f30ec3234d0ed95990e2bf28943a85f33eadad2d"
+SRC_URI[archive.md5sum] = "20bf9933128210d7a9f920a34198d22f"
+SRC_URI[archive.sha256sum] = "d188ebd3787b5375a8fd38ee6f761a2007de5e98fa0cf5623f271daa67ba774d"
 SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
 
 PACKAGECONFIG ??= ""
-- 
2.21.1

