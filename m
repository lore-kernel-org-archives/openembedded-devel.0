Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.1292.1591500284634912248
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N2APWKHC;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id ne5so1836891pjb.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=sBAnRcNI5/sd6oSQxki6fg300TesorNxEuJuwmNVeBM=;
        b=N2APWKHCwP2W5l7qWn0ONUvrqNLcQK+23wLezdBRtNR3BXZg1wfP2FlO3BtvAim7jJ
         1Wl/9NCF3+WHsXgC8HX+QL9TQ2YxmJ9iWnbgnQqCTkpiJlZknErkBN2lzFBz71slGuZW
         L1wz9UVK26yBxMCsqFNqdgIhxv5o5ArqdDKvyn0BSbLfFvarh1QRir/kVRLUU65ILSdP
         lDC8DWTTBZxOuUUjYbo8u1EBMGGXkrtno1w93FHJyVDIMqgV1gI3p0tP3V37we/XIUS6
         sojZFL1gt7xe0Jo0V/T/aqw05TwEueXB2/dmCmYzX3F4RNORVFDbfG29q48A1tTpGLtW
         JAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=sBAnRcNI5/sd6oSQxki6fg300TesorNxEuJuwmNVeBM=;
        b=A5a3CYdRC4+1BJOll2xyxpN2oq8Ga/xGvYlSqY34karRRll9fT86uUAvMADmk8w9M/
         ERLCbjp7fnDM6SX19RrPnnufi+kUa7hvtaM/gWK7GCFoUvY3BdH+LmJz5b4poc2BLPZf
         GaH3EwSmLuWZFe9VPLaM7orWY1lHUUnO2trID34b6v81smkCuocPVqVpe830JJbSZgTd
         pV0Trf6EXxBl5FPOq/YPZnwMPr/wGFQ5iIHNtIXGfW7VnI2smXnyWENI0ZEo45O1Hxub
         5HwtBx16SnevPIPoRacA6aWkNk9XVeEcW35LK+RKaGYBbFdlq5L7gQ+rLerHJFCe4+zP
         czVA==
X-Gm-Message-State: AOAM531x3ahaiQ4sfAHCHbtIqNQUStAzqbzwwdbtrck8Zmfoueh2eE5f
	L8PMVTPvyU6AtHmt3RTgU+3mKT4d
X-Google-Smtp-Source: ABdhPJwG1ywz5lnI6iBnbWoPhCuT7MlkPUtLGZKMeDqaQBLh7mpD5U/1/dHtx3KebZbRN/kHzzCkKg==
X-Received: by 2002:a17:90b:30d8:: with SMTP id hi24mr10828132pjb.78.1591500283985;
        Sat, 06 Jun 2020 20:24:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:43 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 03/26] multipath-tools: fix compiling parallel issue
Date: Sat,  6 Jun 2020 20:24:13 -0700
Message-Id: <75bf37828e827db74554d91bd78bbe917e5c389d.1591500139.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Hongxu Jia <hongxu.jia@windriver.com>

Add explicit dependency on libraries
[snip]
gcc/i686-overc-linux/10.1.0/ld: cannot find -lmpathpersist
collect2: error: ld returned 1 exit status
Makefile:36: recipe for target 'multipathd' failed
make[1]: *** [multipathd] Error 1
make[1]: Leaving directory 'git/multipathd'
Makefile:29: recipe for target 'multipathd' failed
make: *** [multipathd] Error 2
ln -sf libmpathpersist.so.0 libmpathpersist.so
[snip]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 78509dbb7966906c78a16bec24e6c31e307b78aa)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...add-explicit-dependency-on-libraries.patch | 40 +++++++++++++++++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch b/meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch
new file mode 100644
index 0000000000..2827bb8745
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch
@@ -0,0 +1,40 @@
+From 04884263d1de8c427a7a15bd1cf6466ea65d3a0b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 25 May 2020 23:22:55 -0700
+Subject: [PATCH] add explicit dependency on libraries
+
+[snip]
+gcc/i686-overc-linux/10.1.0/ld: cannot find -lmpathpersist
+collect2: error: ld returned 1 exit status
+Makefile:36: recipe for target 'multipathd' failed
+make[1]: *** [multipathd] Error 1
+make[1]: Leaving directory 'git/multipathd'
+Makefile:29: recipe for target 'multipathd' failed
+make: *** [multipathd] Error 2
+ln -sf libmpathpersist.so.0 libmpathpersist.so
+[snip]
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index bea0a0b2..37a77129 100644
+--- a/Makefile
++++ b/Makefile
+@@ -29,7 +29,8 @@ $(BUILDDIRS):
+ 	$(MAKE) -C $@
+ 
+ multipath multipathd mpathpersist libmpathpersist : libmultipath
+-mpathpersist:  libmpathpersist
++mpathpersist multipathd:  libmpathpersist
++libdmmp libmultipath mpathpersist multipath multipathd: libmpathcmd
+ 
+ DEPS_ON_MULTIPATH := \
+ 	multipath \
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 2795a8d091..af34a4b392 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
            file://0030-Always-use-devmapper.patch \
            file://0031-Always-use-devmapper-for-kpartx.patch \
            file://0001-fix-bug-of-do_compile-and-do_install.patch \
+           file://0001-add-explicit-dependency-on-libraries.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-- 
2.17.1

