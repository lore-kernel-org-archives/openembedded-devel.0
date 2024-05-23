Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9BCC25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 07:51:19 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.11580.1716450672437265173
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 May 2024 00:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=u67SF4O3;
 spf=pass (domain: smile.fr, ip: 209.85.167.51, mailfrom: alexandre.truong@smile.fr)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5231efd80f2so8130033e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 00:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716450670; x=1717055470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jaMG5HPAiuGAO4VBUB/KpThk+gp+MJEjvTeu21H6fu0=;
        b=u67SF4O3TppLf2JZYCGHRzRJa9XOnGYPauzYT58ly9ATfaZFcjfu/QmYT+I0HzRNx7
         fiWdZs+VrcgfuawoFUbZBXDuURhuFog5/tw+u6RrixJSlQT7chdSZUD/D3Wzuea6yEX9
         aFb1W3W7jpp22joChV/Ku3nxKCKBryDH1/AxBACtxM2XX0TqSoWau0EvwTpBVJWquubB
         aDgAHqqWoFhFnUyf7Wz9ySKHx95xC0kYyA2ZlN6VL4+MzpEbn/Cp2+nTtE7zNeh0yQ8H
         q6MdJFg+4SzBpek6AuxwKGmsVVV59mmSFHhH0eSPJxzYymNiHvZnp1fpiK7+xBw31Yfl
         K0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716450670; x=1717055470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jaMG5HPAiuGAO4VBUB/KpThk+gp+MJEjvTeu21H6fu0=;
        b=Pvu01H64brLZ+zflcVjik9gMDGMR+hdfZP52guWEw4GSa6R3ULNDcoGnPdEBDUlNAz
         SUbzyfA0Yxif9mA/iNOylXdLHgvVO3zPOlVc3rEKpeLx7kKK8J5cEQyctC4uVBqlcpNE
         GJjhotj7oHbX5TQvR2WhogX/u1StWzCgMhLTXhvF0bSROymEJ4/RNWQoIeh+tA8uzYds
         IJ3/zkh2lZLNqgg5QDCs4lX2pCxP4wP6IokKuxa/RRbqxaYKJt6DlNxh6/PGvCs8CTKp
         XAhaGmH2q9bSfv6CRsX1McdCljCYjuoHZZbu0hrWblRc6tTDaxJzuZhi8Sim/B9p7qkr
         xUvQ==
X-Gm-Message-State: AOJu0YyqEzHHkHaApBLV7yos1D0oy+nULwCPD/ERN18yiAe6vtW5cAki
	ccGvU3JnEVlyX+nz5duz08MI3BTHUAubMOg7yFQjGrNAYeQLu5I5sOQQRXaRmrlIKN69FifEivl
	X
X-Google-Smtp-Source: AGHT+IHTS8t+fWyqLvx8eHF6B4LkvPsUHoyCS2IPTyC83cLV5bqn/ts4alURGdEJ52o2R4T1l/cMLA==
X-Received: by 2002:a19:f007:0:b0:519:1e33:9d85 with SMTP id 2adb3069b0e04-526bf92293amr2502456e87.36.1716450670390;
        Thu, 23 May 2024 00:51:10 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-354fb92aca5sm533533f8f.72.2024.05.23.00.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 00:51:10 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] source-han-sans-*-fonts: rename downloaded files in SRC_URI
Date: Thu, 23 May 2024 09:50:52 +0200
Message-Id: <20240523075052.8854-1-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 07:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110496

In commit [0], we've switched away from SVN fetcher in SRC_URI.
The archives downloaded are named SourceHanSans*.zip
They are named this way regardless of the version 1.004 or 2.004.
So when the new archives checksums are tested, the fetcher will
look for the old archives with the same name in the DL_DIR.
From [1], there are checksum failures due to given checksums not
matching the ones in DL_DIR. Thus, downloaded archives are renamed
by adding ${PV} in archive name.

[0]: https://git.openembedded.org/meta-openembedded/commit/?id=36a1e36e1272ca50e5dba0c4cf25ee3ff8b8f1c9
[1]: https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/367/steps/16/logs/errors

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ttf-fonts/source-han-sans-cn-fonts_2.004.bb                 | 2 +-
 .../ttf-fonts/source-han-sans-jp-fonts_2.004.bb                 | 2 +-
 .../ttf-fonts/source-han-sans-kr-fonts_2.004.bb                 | 2 +-
 .../ttf-fonts/source-han-sans-tw-fonts_2.004.bb                 | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
index 391d46557..f6e1a4c6d 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
@@ -11,7 +11,7 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansCN.zip;subdir=${BP} \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansCN.zip;subdir=${BP};downloadfilename=source-han-sans-cn-fonts-${PV}.zip \
     file://44-source-han-sans-cn.conf \
 "
 SRC_URI[sha256sum] = "6841fc13f1c0d255cfeb33d2a2c68d24bbebd94ae2c070347a2b2b200a1db4d6"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
index f940478a8..9e18921d6 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
@@ -11,7 +11,7 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansJP.zip;subdir=${BP} \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansJP.zip;subdir=${BP};downloadfilename=source-han-sans-jp-fonts-${PV}.zip \
     file://44-source-han-sans-jp.conf \
 "
 SRC_URI[sha256sum] = "1ae9f62ad620d686c4a049ce25cf54e3afd8fefc954a678c644cf9802750c17e"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
index f536d1b61..2b79cd762 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
@@ -11,7 +11,7 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansKR.zip;subdir=${BP} \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansKR.zip;subdir=${BP};downloadfilename=source-han-sans-kr-fonts-${PV}.zip \
     file://44-source-han-sans-kr.conf \
 "
 SRC_URI[sha256sum] = "02fe28a48c6381c49d61c27a1b173c77f0e6f2b9f2b68e79f076f10a6a8f4bfe"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
index 0a4aff5e3..303edf3b6 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
@@ -11,7 +11,7 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansTW.zip;subdir=${BP} \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansTW.zip;subdir=${BP};downloadfilename=source-han-sans-tw-fonts-${PV}.zip \
     file://44-source-han-sans-tw.conf \
 "
 SRC_URI[sha256sum] = "11d78c8fbc1a4bb04a453cdd65c99db8d41ec5cd6ba6d68c8638e6ba170de806"
-- 
2.34.1


