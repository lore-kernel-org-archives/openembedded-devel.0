Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B88C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 08:31:49 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.10637.1716453100763779653
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 May 2024 01:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=iFbqL5vP;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: alexandre.truong@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4200ee78e56so17013675e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 01:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716453099; x=1717057899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lwZbEx/zSsFhV0odYLsnMuZBeBSr7OfOjQ1MNwUM4qo=;
        b=iFbqL5vPuhiNCvYy3Q7K5AxcYCO8TdPqEsx9R16RdbfolgUU3nBjYT3+K7AJq3gSHr
         Q6Boe3XfdIWAMcMUUVYzkws3oOpHL0CtAJngbsqJ4K9tCKXeGR/kIT6QpuLJdj8TpU8r
         koFdfY2y2dO3FoZ+w/JJ+xjFP0RAmvWFLG+EW10A9rGlrFSOfNkG/2PlcAXmezRGIAox
         D+u5QURqzTmFH6DK4bHlmNHQnTLeyJuTukgo0TaNDrqtlNA5wffiFe57nrHpuq+5FK2z
         rS9M260NULyQqKTmcVP3nNjguNWmHX14nTKlzSnPwpxK4PEg/JLnuhQGwUDXDIoFB7mp
         ohHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453099; x=1717057899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwZbEx/zSsFhV0odYLsnMuZBeBSr7OfOjQ1MNwUM4qo=;
        b=bRVdMM/rXLtrdf719Ihn/EarUrAUKV6p3UkO7/nWpV1360D5CCGuWx4R43+gCCz8CH
         QvmjDBQ+71Tbm2kiyJ3OfHkPTYxcnVscgV+bKvZX/CEqp2Ct0MkIW5mV58/9VkQKb8HT
         UCwcycezdv7WNAliAmdgW6od2PgG+yR/Iyz75sOXHTscaeJK+10DoQKg3YLabi8aeyyf
         B+o8Gk0jmF7a+d1uY6tPGNERMS1x3lOK6p49O1KOav+87F82fH/On65/qSoSqrdekT+y
         SARxXNfy0FBCFBlBziHMrMI0ZTY6FnFPPar9O5YHtfLB3xA4LtP+1iBwar5AOpfGV3Kj
         OfKw==
X-Gm-Message-State: AOJu0YzIb6VU4Fv7mXCiZiqgWHwBFt+B6cmuqOPuOvmWbVKNmV3sySk5
	V58XizYntsk3SpiYgW+PFr180NpVg7S4ns/mcOlh/MkCwMdbUsMzRAhEjHbj7rYJmAWarfq/1gw
	7
X-Google-Smtp-Source: AGHT+IHPnejSMLxEWlGlq+cv3ulSjlx2LeSKAU+4eb0oPsrvlQPVSJsabyf1rm0VXRrqhWPcoUURQA==
X-Received: by 2002:a5d:4950:0:b0:34d:b2a5:708f with SMTP id ffacd0b85a97d-354d8c73ef8mr3206228f8f.8.1716453097879;
        Thu, 23 May 2024 01:31:37 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-354f803c5c4sm1114780f8f.48.2024.05.23.01.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:31:37 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH v2] source-han-sans-*-fonts: rename downloaded files in SRC_URI
Date: Thu, 23 May 2024 10:31:22 +0200
Message-Id: <20240523083122.17258-1-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 08:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110500

In commit [0], we've switched away from SVN fetcher in SRC_URI.
The archives downloaded are named SourceHanSans*.zip
They are named this way regardless of the version 1.004 or 2.004.
So when the new archives checksums are tested, the fetcher will
look for the old archives with the same name in the DL_DIR.
From [1], there are checksum failures due to given checksums not
matching the ones in DL_DIR. Thus, downloaded archives are renamed
following their package name and version.

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
index 391d46557..db4ff4269 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
@@ -11,7 +11,7 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansCN.zip;subdir=${BP} \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansCN.zip;subdir=${BP};downloadfilename=${BP}.zip \
     file://44-source-han-sans-cn.conf \
 "
 SRC_URI[sha256sum] = "6841fc13f1c0d255cfeb33d2a2c68d24bbebd94ae2c070347a2b2b200a1db4d6"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
index f940478a8..7ece51128 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
@@ -11,7 +11,7 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansJP.zip;subdir=${BP} \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansJP.zip;subdir=${BP};downloadfilename=${BP}.zip \
     file://44-source-han-sans-jp.conf \
 "
 SRC_URI[sha256sum] = "1ae9f62ad620d686c4a049ce25cf54e3afd8fefc954a678c644cf9802750c17e"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
index f536d1b61..0cbe438ef 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
@@ -11,7 +11,7 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansKR.zip;subdir=${BP} \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansKR.zip;subdir=${BP};downloadfilename=${BP}.zip \
     file://44-source-han-sans-kr.conf \
 "
 SRC_URI[sha256sum] = "02fe28a48c6381c49d61c27a1b173c77f0e6f2b9f2b68e79f076f10a6a8f4bfe"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
index 0a4aff5e3..3b4eeb271 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
@@ -11,7 +11,7 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansTW.zip;subdir=${BP} \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansTW.zip;subdir=${BP};downloadfilename=${BP}.zip \
     file://44-source-han-sans-tw.conf \
 "
 SRC_URI[sha256sum] = "11d78c8fbc1a4bb04a453cdd65c99db8d41ec5cd6ba6d68c8638e6ba170de806"
-- 
2.34.1


