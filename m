Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8974C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 13:55:15 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.9078.1642082115137819953
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 05:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CdF1N6Vs;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id p14so10058788plf.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 05:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=SkXzDKjix9nzLuKQdCuoMLdigvIHwg8DqgbwDPU0GVM=;
        b=CdF1N6Vs+fOwI4cNeJPodWb7DZeUtxUem/b6tYAhEpTS33odwP21C5zQGsLQZ5JmGp
         ne5/cJX+0/YCqW3RPMFEH+APlv83h1VWEVaz3zElO+zPpE2LF8Rk6qQkm9V36nffC6ku
         +F7m5EwTvcxosoh7X2TozSWwVTG4tCCVBPhOoWbTXtfTarHuVn66GSQwssRO653wkyT0
         kQNg1JuYXOAUbEOfCut0mLpgzT8ikcI9P2aq8koeDwmuVIPbc22+/Iir1/iiKsipPkI1
         g/yz4G/XIrUYHt0u22GpMwCVyBZ7pRrNPhZIzlurSZPJT/6nKShpN2dJp+kGac2Ifd7O
         xShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SkXzDKjix9nzLuKQdCuoMLdigvIHwg8DqgbwDPU0GVM=;
        b=lZErAmh3NE8CKem9zc/tZlwSPB1ZoBi66IRUKUWIOfcRkFxIRQ7dWhwNK+Sln6wi3g
         95jk3cQ8R3WXHDknplgIM/MmQG7ugjWXVh0rZe1t9Sv7hIt68OCoyutfUZkYMJmcTZ59
         zkO6T77/XdX8s3G4TrhiUihiBdrWPH4Vob7PiRFOcLRji+u5IQ+HlT+dvOED8L/n1045
         xO1PFBslio/W4lhKlYcUs2xOGDJnKrKVlD/KdorfNhpyAOs3DNbA+25qE3goyva5Mftp
         2SdR1wHvQ2Rv+hQYndRvon42WtCwHioKreVP5zn+DBMDH+cUt9uHCKwjTHrTlKrRbfFD
         a1wg==
X-Gm-Message-State: AOAM530AOAknhk892BRoS6peCXgMZABhFFUh3tKNMTb8jUySnTznkXB3
	abLjC7z2SqWJmb2BruQe6up6C0dRPT5QDA==
X-Google-Smtp-Source: 
 ABdhPJxh8DdzmX3J8njRQmzpivW/+n0cSNvgsRuF2bh7HhshjRhR2+O7tcpjFs34nGXVOilWMhrXAw==
X-Received: by 2002:a17:90b:17c4:: with SMTP id
 me4mr5265319pjb.15.1642082114357;
        Thu, 13 Jan 2022 05:55:14 -0800 (PST)
Received: from localhost.localdomain ([171.50.200.192])
        by smtp.gmail.com with ESMTPSA id
 m10sm2579796pgu.70.2022.01.13.05.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 05:55:14 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Virendra Thakur <virendra.thakur@kpit.com>
Subject: [oe][meta-oe][dunfell][PATCH] p7zip: Fix for CVE-2016-9296
Date: Thu, 13 Jan 2022 19:24:32 +0530
Message-Id: <20220113135432.5987-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jan 2022 13:55:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94809

From: Virendra Thakur <virendra.thakur@kpit.com>

Add patch to fix CVE-2016-9296

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
---
 .../p7zip/files/CVE-2016-9296.patch           | 27 +++++++++++++++++++
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch

diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch b/meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
new file mode 100644
index 000000000..98e186cbf
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
@@ -0,0 +1,27 @@
+p7zip: Update CVE-2016-9296 patch URL.
+From: Robert Luberda <robert@debian.org>
+Date: Sat, 19 Nov 2016 08:48:08 +0100
+Subject: Fix nullptr dereference (CVE-2016-9296)
+
+Patch taken from https://sourceforge.net/p/p7zip/bugs/185/
+This patch file taken from Debian's patch set for p7zip
+
+Upstream-Status: Backport [https://sourceforge.net/p/p7zip/bugs/185/]
+CVE: CVE-2016-9296
+
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+Index: p7zip_16.02/CPP/7zip/Archive/7z/7zIn.cpp
+===================================================================
+--- p7zip_16.02.orig/CPP/7zip/Archive/7z/7zIn.cpp
++++ p7zip_16.02/CPP/7zip/Archive/7z/7zIn.cpp
+@@ -1097,7 +1097,8 @@ HRESULT CInArchive::ReadAndDecodePackedS
+       if (CrcCalc(data, unpackSize) != folders.FolderCRCs.Vals[i])
+         ThrowIncorrect();
+   }
+-  HeadersSize += folders.PackPositions[folders.NumPackStreams];
++  if (folders.PackPositions)
++      HeadersSize += folders.PackPositions[folders.NumPackStreams];
+   return S_OK;
+ }
+ 
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index 13479a90f..c79752f56 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_al
            file://do_not_override_compiler_and_do_not_strip.patch \
            file://CVE-2017-17969.patch \
            file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
+           file://CVE-2016-9296.patch \
            "
 
 SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
-- 
2.17.1


