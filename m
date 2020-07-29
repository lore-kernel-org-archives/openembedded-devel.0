Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web12.4720.1596025602650524375
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 05:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=uUNAQSRx;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.175, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f175.google.com with SMTP id q6so24810932ljp.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 05:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VcB5AmJVsLTWMJ41inmcY22jZDWTOg1FWf5PVn/ZYD0=;
        b=uUNAQSRxeGgA7GDyO9L8jlzqc6s8p8D7z43nJEyFvGLrUuCpXskVKKJmGqrv8s5UUW
         1JU+oq6MZMuhVRvkyQKRJVYRfdRcFVBSbiuNO2SCkt3GuC7pmXIExX/BeAFwGKzqS75w
         M7yLN6ZlMTEOsSRc+nST0QNR7jY9ydhk2Lj5udcUYUj7RsPrHuANZn74apwlBnGLcJxe
         NXbamQq/uU2h5IQpYhRn8Kbg77OdnHmfAjtnX93UZgvGRbTbXn91Djn3+HE/tretzADx
         WLjRNXEQri9AeGgiFNDqkm2LxgCPL2ZceQ1grz1G4hdPXK08Mp/jNIEaiGZWNGUnVG27
         /0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VcB5AmJVsLTWMJ41inmcY22jZDWTOg1FWf5PVn/ZYD0=;
        b=VbOAqGsiyi81UgmvGkjYwutxYjQp59xLeHw5fpYBYDCIoRXqh32p7VPQ9DpDUzFR49
         N3HAzO7qmlvpLJyDRV62uDRhwQexvEpyLM9omtLaC9vU7hwg1yBfUOOSlnb1bdoOv9AW
         NXooVtMrWIs6XkR68ROM2RqZkzmiE7uR4rWgShk0gGq5lAFdKE6F/Km05KP4fihzAoL3
         NERX7xk8AI/pK4KHiIwUuG64nnrFl1lJTEe5gmmfV0uz27+zJ/Fg/86hdTYniplR852K
         HhuEnFlgugGkw2hcfa1Os0KWXLqJxpkAjcE8LkEOCG5hvMUwoW8l1dhnYWyFcaQSi9dX
         Dazg==
X-Gm-Message-State: AOAM5313+v+Qk4QTQmWHkllc9Xr6PFvjmcgcSJecuZ0XFnL1oMRPkSQS
	RVY8sF6jJYVRs7hPqazpgVbbPlYWzZo=
X-Google-Smtp-Source: ABdhPJyYS+rkBDacqXUAGB3eZGr/oGjxWpamCr6+cGYRlvWsa0ZKSh/lEikoyvDXTMzgv5gtAwuMpw==
X-Received: by 2002:a2e:9f03:: with SMTP id u3mr10031089ljk.302.1596025600353;
        Wed, 29 Jul 2020 05:26:40 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id h2sm369521ljl.16.2020.07.29.05.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 05:26:39 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] firewalld: update to 0.8.3
Date: Wed, 29 Jul 2020 14:26:37 +0200
Message-Id: <20200729122637.3357934-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nft build dependency has been removed in @3f7419dcb50a5bdcf800512d2491.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../firewalld/{firewalld_0.7.5.bb => firewalld_0.8.3.bb}      | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/firewalld/{firewalld_0.7.5.bb => firewalld_0.8.3.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.5.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.8.3.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.7.5.bb
rename to meta-networking/recipes-connectivity/firewalld/firewalld_0.8.3.bb
index fbf586f76..ddf5ff88e 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.5.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.8.3.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://firewalld.init \
 "
-SRC_URI[md5sum] = "b1aeede85a72adcf4f79d98019811244"
-SRC_URI[sha256sum] = "45a8a7dbc084ef56ce306154d3834922e7f1fc2bf11b6c821f579cad51313226"
+SRC_URI[sha256sum] = "4ecb16d82c2825ccfb8f109e543c0492cf6ea8c43e2d0f59901bddcead037dc6"
 
 # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
 DEPENDS = "intltool-native glib-2.0-native"
@@ -29,7 +28,6 @@ PACKAGES += "${PN}-zsh-completion"
 # /etc/sysconfig/firewalld is a Red Hat-ism, only referenced by
 # the Red Hat-specific init script which we aren't using, so we disable that.
 EXTRA_OECONF = "\
-    --with-nft=${sbindir}/nft \
     --without-ipset \
     --with-iptables=${sbindir}/iptables \
     --with-iptables-restore=${sbindir}/iptables-restore \
-- 
2.25.1

