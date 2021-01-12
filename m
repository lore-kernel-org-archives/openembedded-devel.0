Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.17067.1610488332935864200
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 13:52:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XcXhbhro;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id r4so3486785wmh.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 13:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dDQ3ZEm1TCKiL1HYJj+rvzROAWVA8eNwSuAlu5EJh9Y=;
        b=XcXhbhrorIA06/QxouH82do/uYozT85aZx5qDBotQBQPqIDSIW81yRzebcR3h+8KAg
         atWPax2beBwVJxDW4juZOxdkQ0GMcuSk4nj/7er5LR8MLQvXELyrPrRYEg+h75su08o9
         IjKzjwu/hAqaTSBcN+R4XFbfRAVw/Mh4MfqIhDA6Lb0EVFNwFlTMgruE7NJSUYMt3hLK
         pfVAQCtWQ7kDBXHSVha/c1/p2W5GqnonNrOk2mrIuxDAJcbopbUT3oZkg+qNFs52UPQk
         HlXtiprL1pLF206SHcGYAanOnZxfkq53H4ADPkJn4Hzg9c2qpCycdGayaEGpNdFwg1kp
         meaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dDQ3ZEm1TCKiL1HYJj+rvzROAWVA8eNwSuAlu5EJh9Y=;
        b=iQpgSepXqi+8t/Tf7xxJqVVFtH765+FmmQTbMbVaKgp67x8aQ0fj/z2yb5SrGq23xS
         4/B3Q+klNzS5ubA6hJMstewFv0RGQS+8KRffouVf09dpsuyPKAaLFgWhsIKtReJi7fC2
         QWK8M+NhlhLtKMpVIb+rM54wzCDah9SVZdCrEkcTlC7DOXz7DOBZhxCvpXO1+PVPN/fz
         FWOGxopOgajUoYxQgzYuKXR0g4WQoLM9vdxxnC5Nmf8+3YtvBgKN62KDFxBADNDTIEmO
         JDjOOWj0nlQr40Ti4jguvNyJefkVaI0Lk0uXwBCZ7ln+oahPPSb+SZs5fy624hNgkGYY
         9eCA==
X-Gm-Message-State: AOAM531BT4xCsgZ79XfaJLz8t/kvgRzLcu4JJlrQofLe3FxbDD1AVBgR
	3Z9uEYEL5XGDhoJrI9EZ1OHQ5A3XqCIj6w==
X-Google-Smtp-Source: ABdhPJz2M18LMbGILiL1yuRpXFXvzUKmBogugXJ+fd0zlu+U7JCZ1h/DNSYpXWWWkxw+wsXYbYkRbQ==
X-Received: by 2002:a1c:a583:: with SMTP id o125mr1105597wme.91.1610488331401;
        Tue, 12 Jan 2021 13:52:11 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0538793397820a7f9846fa.dip0.t-ipconnect.de. [2003:f0:7f05:3879:3397:820a:7f98:46fa])
        by smtp.gmail.com with ESMTPSA id c6sm6881300wrh.7.2021.01.12.13.52.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 13:52:10 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/8] dconf: upgrade 0.36.0 -> 0.38.0
Date: Tue, 12 Jan 2021 22:51:55 +0100
Message-Id: <20210112215201.3940196-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112215201.3940196-1-schnitzeltony@gmail.com>
References: <20210112215201.3940196-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in dconf 0.38.0
=======================

 - build: Install bash-completion relative to datadir (Jan Trojnar, !58)
 - client: add `dconf compile` to shell autocomplete (Andreas Polnas, !60)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/dconf/{dconf_0.36.0.bb => dconf_0.38.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/dconf/{dconf_0.36.0.bb => dconf_0.38.0.bb} (79%)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.36.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.38.0.bb
similarity index 79%
rename from meta-gnome/recipes-gnome/dconf/dconf_0.36.0.bb
rename to meta-gnome/recipes-gnome/dconf/dconf_0.38.0.bb
index 4b924d89a..162748d30 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.36.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.38.0.bb
@@ -3,8 +3,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SECTION = "x11/gnome"
 
-SRC_URI[archive.md5sum] = "1a50c988d9f0206f74a44f7c6d09cead"
-SRC_URI[archive.sha256sum] = "9fe6bb22191fc2a036ad86fd8e7d165e9983c687b9fedccf85d46c799301da2d"
+SRC_URI[archive.sha256sum] = "45f60f41330d27715cce1315af123f94f1c2cdedb68b6bed3b309866eec44f58"
 
 DEPENDS = "dbus glib-2.0 intltool-native"
 
-- 
2.26.2

