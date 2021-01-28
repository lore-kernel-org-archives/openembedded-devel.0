Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.5169.1611820064497985575
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 23:47:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y3sEX1FJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id c6so5533006ede.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Jan 2021 23:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/vT4HcqdaEGkcCqIjbikrYNxC01DRfrLf2DSTKb04ic=;
        b=Y3sEX1FJio1DGmrfcRnXbLhwJqx1kWblGW52LhSpO+8CTIlcPICUQUl77sbtPEzhm2
         FsrusagSp2TeJ8d/8F3WLiLMBsprHlZXPo4JECRu3MixmCCR8lU7VqX8PpB79cw6Z5FI
         s8eJJhTtqxI5u6DhQTB4LwzxtuS6jn+iB6IwVPyRydS9vwfPriBbZOFoHg5hvq0cpUDl
         IDfVy1BA5cflZJi4yyQIgg09qmX1BawiRtdNh1D/GjXQYTbU7CPwFSAVCI7sKWj/Uzaf
         ypxkBb5Qfge+wrGviSkETxHXpr5hxYAmri4AHR4Ejn0g9ZQW4/qgP5SIQaeIlRiSRAe2
         X2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/vT4HcqdaEGkcCqIjbikrYNxC01DRfrLf2DSTKb04ic=;
        b=ZG55L2F//AZXmuj59GAaWkBgwovA/0FMhWlVYNn7rzu92nhp+rPYLZJSWpYV4KvXN/
         rSQ1FDfI/QqGXwa49fZzOK4UkwX6ynJwbKaEUCdbg5zTQDHSXv8OdV79WzKBNLO2Jdjr
         JE1iCb7+ePKpEKvqEJKh1dYLUTiTISCmF90S8OnKtVLS9MmegGU17CO25nko1U1mhZvy
         aKIriRvJa0Ofzqpnzqs7fGwYJRHZ4tweJgs7tRGtnEIRLBoY2WK+8PHV7/BHngelpqJz
         wuxTyLdlMDzy+rxUHIDwp7RD2AI0Ebd7zRaFNesvgbIFQhaizwwXuwV8JTRoqVkKwUR8
         I/6g==
X-Gm-Message-State: AOAM532iP7mFf5gzTqtx2DMk87LZM+TpCE+19gzpTe8Tx1HOBOATlCFU
	nTCavNleDBiEaOwqaYWkge1PeFMykl1IOg==
X-Google-Smtp-Source: ABdhPJwmxVmqwzw5q8jxwLkxYaIs8FMTPeDrpP61dCsXnSCQubVK9Q5lUAeoRIQ9MeIJHVqMNah5AQ==
X-Received: by 2002:a05:6402:70f:: with SMTP id w15mr12870892edx.121.1611820062982;
        Wed, 27 Jan 2021 23:47:42 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07f659ecbde7b17c1a812c.dip0.t-ipconnect.de. [2003:f0:7f07:f659:ecbd:e7b1:7c1a:812c])
        by smtp.gmail.com with ESMTPSA id b17sm2570850edv.56.2021.01.27.23.47.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 23:47:42 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/5] gparted: upgrade 1.1.0 -> 1.2.0
Date: Thu, 28 Jan 2021 08:47:28 +0100
Message-Id: <20210128074728.1631219-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128074728.1631219-1-schnitzeltony@gmail.com>
References: <20210128074728.1631219-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GParted 1.2.0 (2021-01-25)

Release Notes

This release of GParted includes enhancements, bug fixes and language translation updates.
Key changes include:

    Add exFAT support using exfatprogs
    Wait for udev change on /dev/DISK when erasing signatures
    Don't try to mask non-existent Systemd \xe2\x97\x8f.service

Bug Fixes

    Add exFAT support using exfatprogs (!30)
    Fix gparted not launching when PS_FORMAT environment variable set (!54)
    Wait for udev change on /dev/DISK when erasing signatures(#83, !55)
    Raise minimum supported dosfstools to 3.0.18 (!57)
    Fix formatting directive in it.po (!58)
    Fix GNOME GitLab CI test job failures because of missing /dev entries (!59)
    Fix GitLab CI job failures following Ubuntu docker image updates (!60)
    Fix CentOS 7 CI test job fails because of zero sized /etc/machine-id (!62)
    Set default alignment to cylinder for amiga partition table (#116, !63)
    Don't try to mask non-existent Systemd \xe2\x97\x8f.service (#129, !64)

Code Credits

Code enhancements are courtesy of Mike Fleetwood, Antoine Viallon and Curtis Gedak.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gparted/{gparted_1.1.0.bb => gparted_1.2.0.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_1.1.0.bb => gparted_1.2.0.bb} (86%)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.1.0.bb b/meta-gnome/recipes-extended/gparted/gparted_1.2.0.bb
similarity index 86%
rename from meta-gnome/recipes-extended/gparted/gparted_1.1.0.bb
rename to meta-gnome/recipes-extended/gparted/gparted_1.2.0.bb
index 3aaec3cdd..d0a499e6e 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_1.1.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_1.2.0.bb
@@ -11,8 +11,7 @@ SRC_URI = " \
     ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://0001-Install-polkit-action-unconditionally-executable-pke.patch \
 "
-SRC_URI[md5sum] = "0da45cb522d766dfb4886fb3bdbc2634"
-SRC_URI[sha256sum] = "e2fe7b7afbc07e930491c00a05200c2682cc0576ca8f6da87245a000257f5924"
+SRC_URI[sha256sum] = "6c90715d254d7a7ec0208b29007b64160dd9fb7df4c4aa7f8ec2c9d23114c719"
 
 DEPENDS += " \
     glib-2.0-native \
-- 
2.26.2

