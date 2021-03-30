Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.4000.1617133550098854639
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Mar 2021 12:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ADrMAPty;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id jy13so26620278ejc.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Mar 2021 12:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OR0g64N9rk2iJNV9FMoeFIBNjlwKm3uKMqdWpLKUoh8=;
        b=ADrMAPtyKIDZwLZ8RhmZGDaTSk/FoQ272AKyLH04hvZYkClODbTzR1AkUgyo59+0b4
         qhMIZoYNTqHQqKZL7upH7BoZL+dzv9V2yEXG1dMkb0WUfYHHDKajTUa7VdqZ6Ob7KX3A
         NNhz8c6CePStFsNJjOqwnRt0BHejCzHYsocPem+QyhN/sdX8izdEmsqrQLeXQXGacoSr
         mp04JDJjsfwDGC52DLu4cIV5UOFisN+6+QdrynxWThU7slOsERJYSsK7vuze41r4hPNL
         djVeLy8vk17guf878cvOJzcy91Zs7XHmpI4ZtRvJUv+pzMKkl7EyKRj2ixvCdZzk9wgF
         a6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OR0g64N9rk2iJNV9FMoeFIBNjlwKm3uKMqdWpLKUoh8=;
        b=VwJhvY/dzoB9RMQHtpO0bUEM9X3oGJLDGx05+9n478HjEFD1pxpOsw+AXfb1yoBzDB
         wGr6C/SZkHqPPNlYAcsOr7gi176TZ5kyracgs9F6G5ByK77aB7FJD387pdi2RCbmV4EX
         LT4NQ+4NCi1/JdZNCNtA3MBFTMskpIB77gcaS78FQcLIXUY3k5n2XDKYT2imUeTUiBeE
         AdurztUo+qxWENOZSbU00fvcuGg2Tw3lCSd1ttwvUL0n/N6+m5psDitr3lRcDJiwBWkz
         clFhbTVIH9eY+vSi5O9AmDB7Hz3a6es1fq69JHftv1uEuKr5MRTq4Cml8Em5R0Z58GXU
         KU9g==
X-Gm-Message-State: AOAM531ANLjwUWykMMO2/NNBwCG9hruqK7r0Pc0XiatgwvW1sFzpcTef
	CQTYTr18/EvgIrPlqhdQ9dUCBuLwtWY=
X-Google-Smtp-Source: ABdhPJxdEEvek3yUbcvQhs0dk4BCfZWOA4Tlgpa8GUE0VcD/7/A95u570ZlCbK2tKkq3YcR83AA+Fg==
X-Received: by 2002:a17:907:2716:: with SMTP id w22mr34866601ejk.328.1617133548488;
        Tue, 30 Mar 2021 12:45:48 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f19sm30383edu.12.2021.03.30.12.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 12:45:48 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-multimedia][PATCH] packagegroup-meta-multimedia: include vlc only with x11 in DISTRO_FEATURES
Date: Tue, 30 Mar 2021 21:45:46 +0200
Message-Id: <20210330194546.110286-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 0a82b8c2f1..73b852a4a9 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -67,7 +67,7 @@ RDEPENDS_packagegroup-meta-multimedia = "\
     openal-soft \
     opusfile \
     libdvdcss \
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "vlc", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", bb.utils.contains("DISTRO_FEATURES", "x11", "vlc", "", d), "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "sox streamripper", "", d)} \
     tinyalsa \
     tremor \
-- 
2.30.2

