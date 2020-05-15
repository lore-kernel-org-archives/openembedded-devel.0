Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.14064.1589552207400671061
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 07:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=k25UmJes;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.195, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f195.google.com with SMTP id f83so2598379qke.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 07:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=6LXKhr5DcN5vL8CMHahClmXdkStSLKrHHWjZ0sNfxyE=;
        b=k25UmJes5s95XbjLAf9N86d+wsO5JYZ4tCA3DEWTnMoYTzDAlZNo0cT6SIgTNhMJ/r
         aqIGlMr2kV+YIwMrSXjfp3rXEEFw0hxjF2VZHHk7fsK7t8Jihh1GrFawf6Ad6LrgqHwC
         rAQKkV2Phk+deM9OwRyQXGyQKPcdBkgvDDOx9DvfZdWp7O83YzgCZRX3tv9MhSaKVZlM
         VOgEcMYxdsMpxkaM+vA58EEWHTAPVk9bDtwMwVpqVzesrt2X7mbjCDUoRt9StHneVOO2
         78NV4GJLBu0zDnJOyLV1zMXPsARwXELTDhJwbotmcGh5R1eUQ3UB3Nv6WT8gNZJwHDiI
         VETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6LXKhr5DcN5vL8CMHahClmXdkStSLKrHHWjZ0sNfxyE=;
        b=h5cLCHgqSYbLZeBh1LETBqqsXc2Rq3wQzcIrBlQ/pYIVI9glxD2OXyOX2xN69IWxk5
         /BZMXQxE48zIDIXpb1Sgu80Dg5D99wygkMYegr2foRopD6LhfG7tII5oIo0qGeJQiz1+
         X7fvP/tPITygSPIiEZOI6sp3zJB4xlYTNlYuVQ9zQnubwZShDCEibleX/DCn9vTB8x1x
         9/eSAM60q46mOlcstEge61dKoyISAs28cj6dAXVeShJTba7cl5KCnHhelPMDqAbauj4c
         vrJbRbRW7zGgqXXXIv1xUp9ciT4GrZxViTRXGXi3Hgcdsx9dWJISGu9pmDnsxF99bLwc
         qn8w==
X-Gm-Message-State: AOAM531Aa3X0MgxWKfh89Majo9o9Gzs5DAbolB96zezSviYt7EWZyMax
	gegkUeqckOx9tqLlcOtOMp18/inKLAs=
X-Google-Smtp-Source: ABdhPJxj4ZfvWT3KyvsMJhQttAuz/d7RYqlRq1ZpYTlCArDcDq+7qMJ1OoCbN7Dx01An527QD9Oitg==
X-Received: by 2002:a05:620a:110d:: with SMTP id o13mr3561361qkk.212.1589552206363;
        Fri, 15 May 2020 07:16:46 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:5434:711e:b23:e7fd])
        by smtp.gmail.com with ESMTPSA id m33sm2170749qtb.88.2020.05.15.07.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:16:46 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 01/11] python3-argh: Add recipe version 0.26.2
Date: Fri, 15 May 2020 11:16:20 -0300
Message-Id: <20200515141630.27789-1-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../recipes-devtools/python/python3-argh_0.26.2.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-argh_0.26.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb b/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb
new file mode 100644
index 000000000..6aa758876
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Pattern matching and various utilities for file systems paths."
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=cede70b648dcc81baf5b431d38905bad"
+
+SRC_URI[sha256sum] = "e9535b8c84dc9571a48999094fda7f33e63c3f1b74f3e5f3ac0105a58405bb65"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-logging \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

