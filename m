Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.7326.1586164846255071469
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gFQz4OFG;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id r16so13887943wmg.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2020 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VKB1h+Vpj98nFbT4u2crL1uH9ab7RjCl26PNgI+WqYo=;
        b=gFQz4OFGAqp/9zmKYI18+/l/SfBVMV3q0HJx9mq/u4u32nXNCN7aMcdXk9b1ntMYRa
         +MlxNmrnnK4psyBfzRub9urbOEco8uiviomM2txz/12KV5YSsOuZTioYeAQo6aT5e/vL
         DfRjvfetzyfhjLui+MKYb5KAP2mjAMeCF+vSZ5pi9R5baXkvvRNyecJSWPNABYdG2l0E
         Pk2U5Y6Athor5Nd+AOxqWLJcxU7GqkXeVjsm/seWnSLSDuGnK8N6BGYYaC3fz3pXyKc1
         I8GFAsXb/emX5SX2BcgsVKmrXeoikCe0H1Ip4bR0ynadXiB2GdukNFbmiyN4ohNtQDcd
         sMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VKB1h+Vpj98nFbT4u2crL1uH9ab7RjCl26PNgI+WqYo=;
        b=Ac2hMmRBBIHYqgTcGPQobzNlAWt4eeMMwsktia8ZpAAlCRbt2L0ZyNIX2smBLnkobp
         +GonqLXXPECtbbGBzJlY/xdOqohnIdr9CFOOgLlPpV+BHyVWm91SHpbjkkUXa6h9rKHu
         6yOcWQTtxQbTnreKBlDToZFVIGJhdf8JmEl+Y1H74QCzt9tPPS2eJPYviKvWYHSvjvaB
         3zySui+xu8PWE2AkEZ40TGq2BfwoZLzYb+hixLkNJlsqOpkOtyAN4ZNXkMe2S0bWeXwg
         xucyXFR86QGelqRb3vA1b5WD1UGmfi9cG3/oQwhctEOLeHTFfFNajo12/+uvoOthD9qj
         nrNg==
X-Gm-Message-State: AGi0PuZ5+rL+pv/3rtQOipnhSEok+HlU7A0sLvmxHj2NbgDTpnmXDacJ
	COqdZMPI1+jBbe+rcaLVc3VHTqP1Dqs=
X-Google-Smtp-Source: APiQypISPNAFR85b3OvQRwC/l8MMd1J2fu1yJo4V9FfSuVGHPYNWaoPIadS0wFvqjD2A8Jscz6pl9g==
X-Received: by 2002:a1c:750a:: with SMTP id o10mr8175459wmc.124.1586164844328;
        Mon, 06 Apr 2020 02:20:44 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F295D58AB00388BFE597C49.dip0.t-ipconnect.de. [2003:f0:7f29:5d58:ab00:388b:fe59:7c49])
        by smtp.gmail.com with ESMTPSA id h13sm207075wru.64.2020.04.06.02.20.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:20:43 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/14] gnome-shell: upgrade 3.34.4 -> 3.34.5
Date: Mon,  6 Apr 2020 11:20:21 +0200
Message-Id: <20200406092032.3574-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406092032.3574-1-schnitzeltony@gmail.com>
References: <20200406092032.3574-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

3.34.5
======
* Leave overview when locking the screen [Jonas D.; !1043]
* Avoid IO on the main thread [Christian; !1050]
* Fix OSK layout fallback for unsupported variants [Florian; #2471]
* Fix high-contrast/symbolic icon mix-up [Florian; #2414]
* Misc. bug fixes and cleanups [Jonas Ã…., Florian; !1032, #2386]

Contributors:
  Jonas DreÃŸler, Christian Hergert, Florian MÃ¼llner, Jwtiyar Nariman,
  Jonas Ã…dahl

Translators:
  Jwtiyar Nariman [ckb]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-shell_3.34.4.bb => gnome-shell_3.34.5.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_3.34.4.bb => gnome-shell_3.34.5.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.4.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.5.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.4.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.5.bb
index 33dd7e459..9619628c8 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.5.bb
@@ -30,8 +30,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "692181c1a98be9e5f5b7e8738fd428ce"
-SRC_URI[archive.sha256sum] = "e99cfb151307e1d5e5dff57b7026cf8aeace9d595a8c9e62537e934d0f14a366"
+SRC_URI[archive.md5sum] = "4bd27c8a91d30fde78cb69b94677cf1f"
+SRC_URI[archive.sha256sum] = "d296f318a74a6d7883358a6ce1c4d8808b7903dbbb4f9c61ab4230f18e6d7550"
 
 PACKAGECONFIG ??= "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[bluetooth] = ",,gnome-bluetooth"
-- 
2.21.1

