Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.1331.1591500285869331836
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YNjjuAOM;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id m2so4522363pjv.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1PDkyGrcV4srcAV61ZEBKuxORfx1AKjlEHJnpIbI9Oc=;
        b=YNjjuAOM7tXbed1sIo9zao7f4Tri6hyYSSfATVSo7t90cksd+UnGTsRgVrCXwJioA8
         /oAP7gosoIasnjSPAV+Pp6P9eNcj2KynrED5iH+xoWNR8VLZpbnhYRRHBEYMqNutl3eZ
         4GGbllr7yYVEuQzINnwLaBgk3nj2N5eXlpZ9wu8+3ZQnjgOj6AEf0RaHz6Xym8AZNdDy
         QSehwK8bVTk1Psh+1Ks99hwSoVKUHbkjvdw20FVTAkLru+X2qlFt8eXZCu7MfTXMm4CR
         mlIOMgyqe7BxBC+YxbSnQRFLkYa4aZHf0cuac03lUBRtKGluL0Qlp/B5O1tGNdHOFMwM
         JBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1PDkyGrcV4srcAV61ZEBKuxORfx1AKjlEHJnpIbI9Oc=;
        b=VrkQLvzeq5APfs62brnPTAjKypouKSHKw3H0+CkIp7PeOceMV/LWpX6GN+K6sxfhho
         vn4TF+4pM2Y9liLIsc17vsNQqFiAtnufmD5Ic0TrkwbdOVP2nKY9fibIxSbdhd8rPy//
         xGyQnZQHcXG4K8EYVp5FS5Mc2Wxt8eNK69KAdEViwICNF+cLgIjPOCkDbOgQ37gAeiwx
         R9xT69Z3w8rm8p5PurlIZ3WJnDjQFQ9mKV2Ck7NxWX8AqciLYS4UV/UJ2D6ZxlooYBvJ
         LqCpHUk8baDSNAcakY+41XNXQySH7C7Yt5ZH5LmkPa17dD7gL3jtWE3risrpKIWIsYJ5
         7D5A==
X-Gm-Message-State: AOAM533FETmf70DywkM5F/u4BkJH3s+dzVSBOy5Jj26xVdfDVLh83Y6u
	/BxptF3G6TPbR39TExtfL2hlRFIP
X-Google-Smtp-Source: ABdhPJxFEVGFVmLN+u62GvmWX2i1khd/fII9xAdcnIV6b49h0ewjvrtSSLJxu+ETi+3gVA64sUXfmQ==
X-Received: by 2002:a17:90a:ae11:: with SMTP id t17mr11185948pjq.157.1591500285202;
        Sat, 06 Jun 2020 20:24:45 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:44 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 04/26] nano: upgrade 4.9.2 -> 4.9.3
Date: Sat,  6 Jun 2020 20:24:14 -0700
Message-Id: <469f5b80d97fcd47766cd4ce18088960f2c9a7e2.1591500139.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a3f13f3d868a4266cfc1fa79cc6e3b5ecf97b2b3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/nano/{nano_4.9.2.bb => nano_4.9.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/nano/{nano_4.9.2.bb => nano_4.9.3.bb} (80%)

diff --git a/meta-oe/recipes-support/nano/nano_4.9.2.bb b/meta-oe/recipes-support/nano/nano_4.9.3.bb
similarity index 80%
rename from meta-oe/recipes-support/nano/nano_4.9.2.bb
rename to meta-oe/recipes-support/nano/nano_4.9.3.bb
index 2b236ba1eb..645b07b4ce 100644
--- a/meta-oe/recipes-support/nano/nano_4.9.2.bb
+++ b/meta-oe/recipes-support/nano/nano_4.9.3.bb
@@ -12,8 +12,8 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[md5sum] = "10df0100ebf4aa7bb4806428c11751eb"
-SRC_URI[sha256sum] = "d8a25eea942ecee2d57b8e037eb4b28f030f818b78773b8fcb994ed5835d2ef6"
+SRC_URI[md5sum] = "52137a960ae8b3ca6d7dab6767fe6e5f"
+SRC_URI[sha256sum] = "6e3438f033a0ed07d3d74c30d0803cbda3d2366ba1601b7bbf9b16ac371f51b4"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.17.1

