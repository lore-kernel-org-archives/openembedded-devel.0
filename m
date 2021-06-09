Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.4383.1623220740749604756
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IKq62kuZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id he7so17226796ejc.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KP7s+jv5Ig2OjDSwZexqZuvW3eI4WHeEb2D54UZjjBE=;
        b=IKq62kuZdTPznRK5T+EU0eQLA1cs97pZYutJl2e0qLjwXzTq9bueRkvgMPNo4pOn41
         ++2yUh83SE2BwLtkbNMI2ywVjqSYU4qqNlHdpSsFKQFC5Ad0+zenp4hE1Rf26J00RplF
         QDGLJNZDlVjL90soO37RawFfKO02ckYCW9XhhlOAd/4+EbKQ+cqjrvPKwvyQKklr+Sc/
         mbzWyhqGK1hVR2kq5OGVi0pK1AUBZHyjeVzQkFY9413GlxwVHoToXQ7BmFfzm2THtoKL
         YTYiT7rpWBI4B1BAFsHGkxSUHEYMfF1GotxjOzrs01hXuDC/GTQvw2IWF7vjafaLo3II
         a8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KP7s+jv5Ig2OjDSwZexqZuvW3eI4WHeEb2D54UZjjBE=;
        b=HmU+DZm347G4bEZ/MwG6U3F1rL/z/WJsmCjiMNYjz/7rgoeVsE6kXuD71WcDO+dAwG
         BdKTAEWeII1stJpuLasPRLvS8qUiA09yVNbVgNDuxtzGfhwN+LnDf8MQCtZbwEIxp0w6
         RBFKE2Z+XM9vu6wS6gPmke8dPo3RfFB+vsPucp4mQ5lDpRIfTgdHu4iAfLZhkmrpBLcT
         HY3ZtbuTqMwFifU8kD81vQMzGXRWgLjNVMTC3YrOFgWmTjYkgpDBRbRqUV8d+RbYwEJK
         7ZEnN7erTGaaBFJAuQccFNqYP0+vZxAFUQVO/wLl10c65+7wGv+Xwwq2KYpG1el78Y+3
         SSrA==
X-Gm-Message-State: AOAM5310FRZ+kZ70HeCetTzD0+TaNE6+p5d3Xbjzj7e/DV3H8pQuaWGH
	6dngLhFxhs9JRQEytDCW27QMm21xTBdxdA==
X-Google-Smtp-Source: ABdhPJwW794Korv2shYMFpqlRvn20PsHNE8hsUBrDBqVfjtN8KAMiD2bLGmnTIR3pH3ljvNI1cwLWg==
X-Received: by 2002:a17:906:a890:: with SMTP id ha16mr26138593ejb.159.1623220739262;
        Tue, 08 Jun 2021 23:38:59 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:58 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 22/28] pangomm: upgrade 2.42.1 -> 2.46.1 / build with meson
Date: Wed,  9 Jun 2021 08:38:25 +0200
Message-Id: <20210609063831.3400611-22-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2.46.1 is the version GNOME 40.2 release suggests. There are 2.48 versions but
these are for mm-bindings compatible with gtk4.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../pango/{pangomm_2.42.1.bb => pangomm_2.46.1.bb}     | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-graphics/pango/{pangomm_2.42.1.bb => pangomm_2.46.1.bb} (51%)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.42.1.bb b/meta-oe/recipes-graphics/pango/pangomm_2.46.1.bb
similarity index 51%
rename from meta-oe/recipes-graphics/pango/pangomm_2.42.1.bb
rename to meta-oe/recipes-graphics/pango/pangomm_2.46.1.bb
index 57d9ff982..f7e126e95 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.42.1.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.46.1.bb
@@ -6,18 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 
 DEPENDS = "mm-common cairomm glibmm pango"
 
-SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
+GNOMEBASEBUILDCLASS = "meson"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}/pangomm-${PV}.tar.xz"
-SRC_URI[md5sum] = "339c48dd92ebd3a9911b231708f7a819"
-SRC_URI[sha256sum] = "14bf04939930870d5cfa96860ed953ad2ce07c3fd8713add4a1bfe585589f40f"
+inherit gnomebase features_check
 
-inherit features_check autotools pkgconfig
+SRC_URI[archive.sha256sum] = "c885013fe61a4c5117fda395770d507563411c63e49f4a3aced4c9efe34d9975"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-EXTRA_OECONF = " --disable-documentation "
-
 FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev += "${libdir}/*/include/ ${libdir}/pangomm-*/"
 
-- 
2.31.1

