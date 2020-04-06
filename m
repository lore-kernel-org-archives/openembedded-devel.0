Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.7333.1586164856954958415
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z7f241fX;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id x25so2826040wmc.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2020 02:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zngiLqVjOaFYZ14cXB07VzDthKYFNhqYhV0jfeQf0vw=;
        b=Z7f241fXyCnIHgBRhAzKRUy84aWNmW8hICV+Sd+zO3uz6XPcs2Cw8kWKGVl9cQNb1P
         C6aML98Pw6Z1kloffLfQmtLAqXpnXeF1ytMI+/eeB9ZUAf3DNffm4Z9dGVpRd32InmUx
         4PnvbJ0sij6rvjmSOUhF1ffx4SGcmYP3wTdlKRJM6g10BnArKwzDo0j51++AQcpS5ALs
         pU+3Rhzm5Ur7D+51xjiJldumycKzoSCX0qTkj4GEMYwE3fKQUC8LOZ1p00+BcdQFl2QA
         eo9tM66US8T7BQagibrBfczopw/Ok3aAmIqtvi9+yKoaCimqttrrHNxbB0gqYvK66SZs
         7CSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zngiLqVjOaFYZ14cXB07VzDthKYFNhqYhV0jfeQf0vw=;
        b=Q6qCWNz9P4CzLf4g+M+2nS1KRQ6yQxcr5zVMsWDnBhu9C3LTxJMMmH/jxvL0rkBzIW
         YmM6Iv2jR5P+jTk/G9Dgp8+F8YJRLY6XvrFVRRrWvYtIcCcL9s8KGmmdQ6B+b4e4rner
         D9309cPURtWAE7VKER0PYDwYaELUV4BfSppvSd1THHQK+GKveQnvp0t724xgcTAWtW5O
         etugKn6b2Zze+dL15oRyBMTCSYDSn41ZwyZqY41NqICW8C4BwyqOzXZ6OCKRpKDbb2QA
         HBst90bvoO13uJNV6Tx6dcWkuJkn+NX27cgvhtNxCcS20BbclgHM7dcJnPhSCAil4qBT
         eMdg==
X-Gm-Message-State: AGi0PubYOujPxgaNmnPmCqdHBXM+E/fH4KQcx6uwFz696pD6Nz83UHYv
	9BlRTmH2Ma+N7gsQryUfLHXnSy7neyo=
X-Google-Smtp-Source: APiQypLhICA3W7t7sfN6A4RpDaevfe7ZbfQG14KE9Lg8dkXsCPfehjtdDs/AJJXJssTi8HsqD/W9Mw==
X-Received: by 2002:a1c:7d90:: with SMTP id y138mr1433864wmc.121.1586164855281;
        Mon, 06 Apr 2020 02:20:55 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F295D58AB00388BFE597C49.dip0.t-ipconnect.de. [2003:f0:7f29:5d58:ab00:388b:fe59:7c49])
        by smtp.gmail.com with ESMTPSA id h13sm207075wru.64.2020.04.06.02.20.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:20:54 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/14] gnome-bluetooth: upgrade 3.34.0 -> 3.34.1
Date: Mon,  6 Apr 2020 11:20:31 +0200
Message-Id: <20200406092032.3574-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406092032.3574-1-schnitzeltony@gmail.com>
References: <20200406092032.3574-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ver 3.34.1:
- Prefer â€œAliasâ€ adapter name to â€œNameâ€
- Fix some memory leaks
- Updated translations

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-bluetooth_3.34.0.bb => gnome-bluetooth_3.34.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_3.34.0.bb => gnome-bluetooth_3.34.1.bb} (78%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.1.bb
similarity index 78%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.0.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.1.bb
index ae6587be1..e7c1099a9 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.34.1.bb
@@ -16,7 +16,7 @@ inherit gnomebase gtk-icon-cache gtk-doc gobject-introspection upstream-version-
 # gtk-icon-cache bbclass will take care of this for us.
 EXTRA_OEMESON = "-Dicon_update=false"
 
-SRC_URI[archive.md5sum] = "0c567e124a52e8ddc31c8bed0c3e57a1"
-SRC_URI[archive.sha256sum] = "e867e67423e1dc78c56c2ea11dec066ce0254238d559e4777c80fa2935eb6baf"
+SRC_URI[archive.md5sum] = "09b6bab7ceaafb35da766a5476fbc466"
+SRC_URI[archive.sha256sum] = "3ec91076c2822cd1f9abdc8e27663c3bda4c9c8a7a9773f9e92bfbf2b745d386"
 
 RDEPENDS_${PN} += "bluez5"
-- 
2.21.1

