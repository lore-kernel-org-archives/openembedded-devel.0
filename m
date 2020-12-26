Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.17023.1608947418196026586
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 17:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tpGQeix8;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id y19so12239799lfa.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 17:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BBVNghdQum7YqWAcUhLXj+UfI3OJVQN9ohGcxVitQbM=;
        b=tpGQeix8W99M2GXEkTrrFpJ3AHQTBfbWFK/vFqDyE8qOApd+ukVm/5l6OXGTbVO+pV
         /MV6RjNtCDHjGa18fulYVOxGKjX8BEbBvuyZrpppiicTjQbpK+zie8l7CAg/QQowv617
         eZNU/Jnjr1S0w7sU1QOWx/d9A+0Nf7e6ilyC2Y8BqlydlNkWTob18Z1gEh5cnPG3vo8Q
         ERawA7NHGMrGsSBOvs5mHGFiRP7xUKOfM60Bswi9p3FRi7Qw0sM9WfBqrMduUHCsiTOJ
         7HoYhe1ZCAWSUXHRNRal4sf5FLdLYa+BHSMcGiX51NFHLlpPAI+hLUp5ClIGsd9g0HFD
         7tAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BBVNghdQum7YqWAcUhLXj+UfI3OJVQN9ohGcxVitQbM=;
        b=pyDT231URPa7OhzQiJMAe8+jryqM9oz9ntGlj0kMs+Iil2Ufl943GeISXde5ivtpXA
         lb2oVDuNB48YM6y6h/2ccDWpvNWIPEsZp0r1CyqNu4ZysIuKBhas5Je1FvPtUIHYzcCR
         jzczogei5973IFD8RsBx3wpXEFYPFTZVSlvqqcYe8b3nZ1X/OIBjKPSlT8c0way429B1
         cqWVreDJp63DUSmqMdUGtjaw4Al93GCHnofYGrYMChMMK8pBS1lV8y4qhwT2HcFMfZau
         fBDa211w72qXqX92I4iRsA4WVJwBvpONr/43PJ6s2HDCqfw6Mb7v7l5Iznjta1s1rc+s
         VafA==
X-Gm-Message-State: AOAM532hPTjlGwcs4grcprQ85LYwGrjoRhL/V5EunLawjh/urAMcfrYi
	4/WKbfGVXJ0GlSWiBcQSvYFtlvRphu+r3g==
X-Google-Smtp-Source: ABdhPJx6lEGb/I512G7QgOf/OqgpTbCd32qIgE0/opGXe854DvJKtL6Zmyvbpf4HTbrm7ugEmADCtg==
X-Received: by 2002:a19:3d5:: with SMTP id 204mr14072288lfd.21.1608947416095;
        Fri, 25 Dec 2020 17:50:16 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.59])
        by smtp.gmail.com with ESMTPSA id f21sm4338902lfe.6.2020.12.25.17.50.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Dec 2020 17:50:15 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] packagegroup-meta-oe: add new packages
Date: Sat, 26 Dec 2020 04:50:13 +0300
Message-Id: <20201226015013.3809622-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add several new packages to packagegroup-meta-oe:
 - feh
 - imlib2
 - obconf
 - openbox-xdgmenu

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 5023e495102d..88669625d9a7 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -448,11 +448,13 @@ RDEPENDS_packagegroup-meta-oe-graphics ="\
     ${@bb.utils.contains("PACKAGE_CLASSES", "package_rpm", "dnfdragora", "", d)} \
     fontforge \
     fbida \
+    feh \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "freeglut", "", d)} \
     ftgl \
     fvwm \
     gtkperf \
     gphoto2 \
+    imlib2 \
     libgphoto2 \
     graphviz \
     gtkwave \
@@ -460,7 +462,9 @@ RDEPENDS_packagegroup-meta-oe-graphics ="\
     libforms \
     lxdm \
     numlockx \
+    obconf \
     openbox \
+    openbox-xdgmenu \
     packagegroup-fonts-truetype \
     qrencode \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "st", "", d)} \
-- 
2.29.2

