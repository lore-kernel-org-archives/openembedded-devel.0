Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.4346.1623220726129408995
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AZj7TtN/;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id he7so17226037ejc.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JWeOCVGxki+pMKcwzUIV4rrmTzt3yw0UWTW6XMcjPFE=;
        b=AZj7TtN/LQTBYrLlNvpXkwvdvSN8z+PuiiPsE/2EIh2+Yu+40JATr7argMVNg6vU55
         /9O8XGzCzZCI6g4EtVfkcCBJdSgairOVCdRwjj3kvXhpRoxOKqP2brv2EtAdcGmnEhD2
         XDQQfIstL/3yFQMJYFhjuXSInrqkhpGhzPL8I8vhZzYQ//fVnCR/4noDsjzIPV1qBJAc
         66DcSB5rhZY/yJrsJD/rUkC0RGXMKZ8jKJLJPvq+iHFenVWjnTGiv9mQ4MIlOlf4u1kj
         ej9/XYpLyviFjqka7AAt4zLfm8pTrGfp2IGLNS0mWI1gg9tRMEUS/tyKhG3JP0T5HaxT
         Bmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JWeOCVGxki+pMKcwzUIV4rrmTzt3yw0UWTW6XMcjPFE=;
        b=A6t0zFgFjKiB2HJBcY4Ab5VOlGRvUVRwJmX/qlqJ/W59SC3V8O6s+LK9NbScGJ5Ymg
         gqy0fOEKSlA1FTPJMU2DTfeiQHMRtcVR5Do6vPtEtMSCcFy3vLkQCh4+6CjuMCxC8xDB
         EgC03zRIDLSzIqpx+gPPTXnugzIK0y3Tkl1C8Fw43jtEeufEN5bvyUl89DWAAj5syVCy
         ACLLhHEhJR4D8HZJcTBeEERfu/rO9KzV7aMsdllqK4OLRNBkJHJSIVK94xtb+MMRM+XA
         qXbpI8DPMDpDcBM/RbVA2g7A9IyVRiOl91nPkc+rbOSPKGjWLVrc2RyZKeJt5a0mGmY+
         pjzw==
X-Gm-Message-State: AOAM532KY0emJZoTNc0Y7qdg3R8i1WTmPp5zQo1+633pKJnsKAPdLG2D
	uoPaB7KcWlpJBVWbEr0BvwfzdXF6WcXP6A==
X-Google-Smtp-Source: ABdhPJyqs8D+o+ROi/kquWYpHJa27PaELBuJrGN4HOVOZ1VUMzINxer28swQx7kffBiaEJFkE3zdvA==
X-Received: by 2002:a17:906:2b85:: with SMTP id m5mr27608255ejg.141.1623220724725;
        Tue, 08 Jun 2021 23:38:44 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:44 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/28] dconf: upgrade 0.38.0 -> 0.40.0
Date: Wed,  9 Jun 2021 08:38:06 +0200
Message-Id: <20210609063831.3400611-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in dconf 0.40.0
=======================

 - common: Add missing G_BEGIN/END_DECLS to allow use of headers from C++
   code (Philip Withnall, !67)

Changes in dconf 0.39.1
=======================

 - build: improve libdconf visible symbols (Inigo Martinez, Daniel Playfair
   Cal, !59)
 - engine: do not emit optimistic change notifications unless the local value
   is different (Daniel Playfair Cal, !2)
 - build: minor fixes to bash completion script (Philip Withnall, !64)
 - service: add a systemd unit for D-Bus activation (Simon McVittie, !63)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/dconf/{dconf_0.38.0.bb => dconf_0.40.0.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/dconf/{dconf_0.38.0.bb => dconf_0.40.0.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.38.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/dconf/dconf_0.38.0.bb
rename to meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
index 162748d30..b1604e8df 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.38.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SECTION = "x11/gnome"
 
-SRC_URI[archive.sha256sum] = "45f60f41330d27715cce1315af123f94f1c2cdedb68b6bed3b309866eec44f58"
+SRC_URI[archive.sha256sum] = "cf7f22a4c9200421d8d3325c5c1b8b93a36843650c9f95d6451e20f0bcb24533"
 
 DEPENDS = "dbus glib-2.0 intltool-native"
 
@@ -18,6 +18,7 @@ EXTRA_OEMESON_append_class-native = " -Dbash_completion=false"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
+    ${systemd_user_unitdir} \
     ${libdir}/gio/modules/*.so \
 "
 
-- 
2.31.1

