Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C28CAC5B9
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:49 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.21082.1759223980679713226
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DwFw0q/s;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-4259247208aso27052785ab.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223980; x=1759828780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2N8NiKaCTKbY4OUxh6TkGiyYb3rghdJbf0vqM+OOfUw=;
        b=DwFw0q/sNW4J282Xe5fju8LYtjpAT2t9TRhms/KSdZY98Mj7WuUGioIJmdsTGNdqlQ
         J9+sHmL6pvvH+58Sq3FI6Mj8wXr+Vh/aJAk+BPwqFW7hnq9TTDhctG5B54FDFQn+8H9Z
         wnS4ncPkXZDQxVmyqGTYIG+w3e/kaYBXYhP2eCmoEsFICr8J7Bl2aQtydLeglGjDYHMp
         Fe8bBlJA7j88/Cg5pN933eINQrTbuoSPHUOSJtW2TBYVsiGyLIMqqnpFgm46qN/he5SH
         HnCaZH8/RoY8RBucwnCc+gBlLv8lFgK0oMgL1Lmk600+FuX2IV+wMEK9fsNxc9+Jk9BZ
         EWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223980; x=1759828780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2N8NiKaCTKbY4OUxh6TkGiyYb3rghdJbf0vqM+OOfUw=;
        b=G4k4DMReFSfluL8lKm5L+FIjxcW47M7e7Gg7d3RF0mX9Y7EtGQOQ49hu39H00c1OKA
         mtrmo6oD+dJ+24bYr6P4J4gf/0VSqiEEQzRoq4Ho4qc+w3AEsNL8Liu63dYjM++5iTdJ
         tvRmTxYGgQULokCiky+4Dv1JEV6UFGDcpaW7Hhdt3ba8y5JOYrtqvG2jqKqYihkG1CF+
         jUNiSAr4i8zt42GI9XRDegZyhD0O87/UGD4ppGGJQIEhS4uvCTk8T5Yj0+Nqb9EYBQ7h
         iZo2eJOS/WPOUpT6Xcad6qFqAl1sE0d5J419NlLlRg4aMKmMKQXsgkyZ01nHDCgllOR0
         a2Cg==
X-Gm-Message-State: AOJu0YxIVZ84GvRJAHMgW9q1d6tbFcJgiHvoe2OpBaZ5pMHnG7ShbgGC
	9nsXxIXb1vFKhlz2MS66qFm8r0llA3ktRfVRghMZ8BsmZMgam5/0ZqMjRYybhs7C
X-Gm-Gg: ASbGncuURvkWawXT+fyuVIwiTlPkebmC3QWtAyzFDT01C/yQkufY6UUF2pm2/4HFSX3
	2tAXHvjs23EDyCiVSNtHUfWoAT+np5iWNkHGZHskgwZAwmfsnQxENKkrLrx21X7fEGEHTdTRafx
	tBOCOlAwqcEk4q1ndU4j7VtV9yxgCGdHJPNiqy0YS/KP1JxTShrAe6BPMIB/5vW9ou30BKVG58P
	C5waqRxvYwB4XuNHfrdL7M71YDTeUCJGzdhOU2JQTRVb+Y0kS1M6OcDLVMoK1W1w9jR82yw30s/
	Bvakr7pqUEj6zxMh4eYz8FOnMLZTOFfWBCX52TX3f4qE0O1e7hmXN+op3xiXMTVfYOlwXZcONBr
	7/fJWXtSLSRHAxPq0Mc4hQWB+VW7yCP6F+ITxcDqK2yYjIa0fXivr6g684s8v09COxpQJYrOCrC
	A=
X-Google-Smtp-Source: AGHT+IHzEr3sY3TiMIpLm8FEQzAsW0m4QBmFPFvCSTV3y0yalvLCKuff9+1Yzra4QTSJNxJfQEJ9Tg==
X-Received: by 2002:a05:6e02:349d:b0:42d:7d0c:ed16 with SMTP id e9e14a558f8ab-42d7d0cef51mr13915315ab.29.1759223979753;
        Tue, 30 Sep 2025 02:19:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:39 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sana Kazi <sanakazi720@gmail.com>,
	Nikhil R <nikhilr5@kpit.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 20/22] imagemagick: guard sed operations in do_install for optional files
Date: Tue, 30 Sep 2025 22:18:39 +1300
Message-ID: <20250930091841.1693131-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120072

From: Sana Kazi <sanakazi720@gmail.com>

When PACKAGECONFIG options like 'cxx' 'webp' and 'xml' are disabled,
certain files such as Magick++-config.im7, configure.xml, or
delegates.xml are not installed. Unconditionally running sed
on these files results in errors during do_install
Error:
sed: can't read .../image/usr/bin/Magick++-config.im7: No such file or directory

Signed-off-by: Nikhil R <nikhilr5@kpit.com>
Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 27469599fa6302a90af252c5148daef26c4b2e81)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../imagemagick/imagemagick_7.1.1-43.bb       | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index 9932cf01db..a892a55844 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -37,13 +37,24 @@ PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 libxext libxt"
 PACKAGECONFIG[xml] = "--with-xml,--without-xml,libxml2"
 
 do_install:append:class-target() {
-    for file in MagickCore-config.im7 MagickWand-config.im7 Magick++-config.im7; do
-        sed -i 's,${STAGING_DIR_TARGET},,g' ${D}${bindir}/"$file"
+    for file in MagickCore-config.im7 MagickWand-config.im7; do
+        sed -i 's,${STAGING_DIR_TARGET},,g' "${D}${bindir}/$file"
     done
-    sed -i 's,${S},,g' ${D}${libdir}/ImageMagick-${BASE_PV}/config-Q16HDRI/configure.xml
-    sed -i 's,${B},,g' ${D}${libdir}/ImageMagick-${BASE_PV}/config-Q16HDRI/configure.xml
-    sed -i 's,${RECIPE_SYSROOT},,g' ${D}${libdir}/ImageMagick-${BASE_PV}/config-Q16HDRI/configure.xml
-    sed -i 's,${HOSTTOOLS_DIR},${bindir},g' ${D}${sysconfdir}/ImageMagick-7/delegates.xml
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'cxx', 'true', 'false', d)}; then
+        sed -i 's,${STAGING_DIR_TARGET},,g' "${D}${bindir}/Magick++-config.im7"
+    fi
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'xml', 'true', 'false', d)}; then
+        xml_config="${D}${libdir}/ImageMagick-${BASE_PV}/config-Q16HDRI/configure.xml"
+        sed -i 's,${S},,g' "$xml_config"
+        sed -i 's,${B},,g' "$xml_config"
+        sed -i 's,${RECIPE_SYSROOT},,g' "$xml_config"
+    fi
+
+    if ${@bb.utils.contains_any('PACKAGECONFIG', 'webp openjpeg', 'true', 'false', d)}; then
+        sed -i 's,${HOSTTOOLS_DIR},${bindir},g' "${D}${sysconfdir}/ImageMagick-7/delegates.xml"
+    fi
 }
 
 FILES:${PN} += "${libdir}/ImageMagick-${BASE_PV}/config-Q16* \

