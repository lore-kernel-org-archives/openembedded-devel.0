Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.4380.1623220735830623040
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EWRG5dtI;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id k25so31171459eja.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pZeRKoRZcohZh3eK0GqzsP9U7dL+vo2LUfBSISZ1l8U=;
        b=EWRG5dtI7SKxBbdPMdHwMUmfalXH1G1ZR+WMnTYZFEu5Xow2hm07LW1VV1UijMiImi
         eqeAgzZgBGuA/pAPgktcnuuZ6v4qFJdamCYNJ2Ncr6dHP/E4WrBTDa121VPzhkBD+kKV
         cMh3ZgHqg85upZPdjPCO+V7H5aBLTWg+uwxuz1imgSguFx3ETLEkKz2jCerzxGGEST4w
         HBXg5Tnshz3AUtfi5oceuB14n/verNaMxnNw/un9/VXEnr1w8wbUNCoMTR3LQDnddORy
         kLPQX2mncOa0UJOnyqwPzp+U4Ra2UzYRKA2cWGYmI393akQJbQL63UT0yT+ULLq8AoSr
         YJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pZeRKoRZcohZh3eK0GqzsP9U7dL+vo2LUfBSISZ1l8U=;
        b=GEUnJm0zQdyKzGL+O92gR7sR2cCx4MDgxsE5TldkrVMXjkNglkOjeLvgfNiCirl8or
         hWSz2o4UAVHz1Z5Z/yL3yMIufPEko4Z2aedqMwuxsXuTB+2V6ziMVmIwiy5adSkjXy9b
         hQue4uaQO/KW8YFmH8o2J2ZaLEu1FmOmD/G47q2ivPojBkXwDqD9hzJnb0L/f7fFrGG6
         sfCcaNuvZFp2ICh6exCWhHM3n5+wn52VmBDf6dNWda5l1XSXopPdpE6T0KYUh6KPQfOf
         iwuoL/lhYxRfKKiPnPY0jSeFUmF6RA6VD98Z97Xi86OC4p9W57xZw0WSe6f2n866xUzc
         XCig==
X-Gm-Message-State: AOAM530dMSJk8hKEh7qG1KiWoYCIWJaBGMOeP9ZzP6DkGzqIEg+hnYO+
	hlpryhAsJrukzNCri4WS+QlaMreyX6AxkA==
X-Google-Smtp-Source: ABdhPJxLg20IZKqv7JDy2S5gEdmW8udwTGyFmBf+U9zP2fz4BXSzZQMhzKt+7GbOj4zOnHHzGBFIQA==
X-Received: by 2002:a17:907:628d:: with SMTP id nd13mr26656920ejc.299.1623220734350;
        Tue, 08 Jun 2021 23:38:54 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:53 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 16/28] gvfs: upgrade 1.44.1 -> 1.48.1
Date: Wed,  9 Jun 2021 08:38:19 +0200
Message-Id: <20210609063831.3400611-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.44.1.bb => gvfs_1.48.1.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.44.1.bb => gvfs_1.48.1.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.48.1.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.48.1.bb
index c8c16a3c5..39f681f4e 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.48.1.bb
@@ -11,8 +11,7 @@ DEPENDS += "libsecret glib-2.0 glib-2.0-native libgudev shadow-native \
 RDEPENDS_${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
-SRC_URI[archive.md5sum] = "72383474f52d05c21ef2be96d0b91974"
-SRC_URI[archive.sha256sum] = "50ef3245d1b03666a40455109169a2a1bd51419fd2d51f9fa6cfd4f89f04fb46"
+SRC_URI[archive.sha256sum] = "b2ea4f271aad2711f16b43c03151e2ec5a9874ff1a21142ef6d6406486a19dc2"
 
 # depends on gsettings-desktop-schemas->gcr->gtk+3-> x11
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.31.1

