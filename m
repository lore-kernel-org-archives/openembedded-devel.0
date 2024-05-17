Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DEBBC04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 13:07:45 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.40248.1715951255068931037
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 May 2024 06:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=3Cc40I12;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: alexandre.truong@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-420180b5838so717415e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 06:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1715951253; x=1716556053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fO7M45Qr1XacBpKPOVV+lCEaDJielGnHDgNIjRkgrfc=;
        b=3Cc40I1285QuW6XsaWyvP1WzK1To12d2anDaS17Jt7YT8WRktlmbzBXWXIsSvzEvCt
         ounvV6olkJMfMhA7+9gO7qp7obnQP/pj1SNR8Ajd2lfnk7t4OHxi7s6yXZMQZtyWmWtl
         e1rbufeaBI7RqbA4ywOx2HQ3omBzTDWW5y2VGo51jihErFN5uE6EZUrEmgWmhlzLnfRK
         jMyfmtHY2gqjyMmrZh1W8Lq3w5yhy2NRSSwrn1+VtCeC1sON+6JzIOJMw9nD7B88OFtY
         ZySZkChGs2mDfMEimez4PoRa5llrDhH3EewBk9dUGVAiY1Soix0CE2qZrzEAd/v+IGQI
         XO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715951253; x=1716556053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fO7M45Qr1XacBpKPOVV+lCEaDJielGnHDgNIjRkgrfc=;
        b=m6cNDkIXd+PnHwqg/7UktkUvB1zJR9VnIUsUf9NYBSsbm+83smU/aMe9A7+uETR2dI
         vAVxvO+G0ET6PFKsNwGQRZ1ACnuAFaG9wa5alBAUhV4bf5SVnl3fdmQHqlYx2oM1v4LS
         Fli9CnlL3bnAebdk5vXzPkrEnB8VuGVHELSovMsC3KPFoTrLrazY2wBUDIoEmyWz8hzX
         6yiqw78fvZSA4gdbBe/AcxN+5EskiZKtcgPs52exyXfuNWF8IhbK1anFzTBJnJ3gRRIq
         GiBy6xdynrhp2pjDoev+5bhphH79TSFmnGJKJjzKcbJ7S7jOiE+rtwZB+T3bC3AANDLI
         Fvdg==
X-Gm-Message-State: AOJu0Yy4ldpD1WpySEtgnVOcUq2/eXMANE0l4NDL8SMCOnNaDa6htW4/
	h4nSJ8pJBtbJuqgwPRAEFdjWWs4STdtcJxIT5nuCsV175DB/1c3KgadTGoFV1pv9V9lMoYFNcpS
	7
X-Google-Smtp-Source: AGHT+IGsLSsC9xFpCqGFv2eUEKDilcBUU42zS9p8D5KySYSonrStZK/wCY5QwhVktWVBCHLzTxcUjA==
X-Received: by 2002:a05:600c:3512:b0:41b:f979:e19b with SMTP id 5b1f17b1804b1-41fead6441amr221446905e9.39.1715951253484;
        Fri, 17 May 2024 06:07:33 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a7748sm21782231f8f.49.2024.05.17.06.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 06:07:33 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH v2] source-han-sans-*-fonts: fix SRC_URI
Date: Fri, 17 May 2024 15:07:00 +0200
Message-Id: <20240517130700.16442-1-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 13:07:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110429

We get fetch errors from the SRC_URI provided. See errors at [0].
svn protocol was used but it's deprecated.
So, a http url will be passed instead.

The sha256sum has also been changed since the previous one was
for the 1.004 release's archive, while we are on 2.004.

[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/353/steps/16/logs/errors

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ttf-fonts/source-han-sans-cn-fonts_2.004.bb            | 7 ++-----
 .../ttf-fonts/source-han-sans-jp-fonts_2.004.bb            | 7 ++-----
 .../ttf-fonts/source-han-sans-kr-fonts_2.004.bb            | 7 ++-----
 .../ttf-fonts/source-han-sans-tw-fonts_2.004.bb            | 7 ++-----
 4 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
index b4a598527..391d46557 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
@@ -11,13 +11,10 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    svn://github.com/adobe-fonts/source-han-sans;module=branches/release/SubsetOTF/CN;protocol=http;rev=82 \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansCN.zip;subdir=${BP} \
     file://44-source-han-sans-cn.conf \
 "
-SRC_URI[md5sum] = "d16abc21f6575bb08894efedbed484a2"
-SRC_URI[sha256sum] = "0a0e1d8e52833bc352d454d8242da03b82c0efc41323fb66f7435e5b39734a4f"
-
-S = "${WORKDIR}/SourceHanSansCN"
+SRC_URI[sha256sum] = "6841fc13f1c0d255cfeb33d2a2c68d24bbebd94ae2c070347a2b2b200a1db4d6"
 
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
index 6a4509048..f940478a8 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
@@ -11,13 +11,10 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    svn://github.com/adobe-fonts/source-han-sans;module=branches/release/SubsetOTF/JP;protocol=http;rev=82 \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansJP.zip;subdir=${BP} \
     file://44-source-han-sans-jp.conf \
 "
-SRC_URI[md5sum] = "908fbf97f3df04a6838708c093f1e900"
-SRC_URI[sha256sum] = "dc6dbae3fba35f220bac88ba7130b826c7efe1282f472788fae3628b79be3f54"
-
-S = "${WORKDIR}/SourceHanSansJP"
+SRC_URI[sha256sum] = "1ae9f62ad620d686c4a049ce25cf54e3afd8fefc954a678c644cf9802750c17e"
 
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
index 5ab5057d8..f536d1b61 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
@@ -11,13 +11,10 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    svn://github.com/adobe-fonts/source-han-sans;module=branches/release/SubsetOTF/TW;protocol=http;rev=82 \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansKR.zip;subdir=${BP} \
     file://44-source-han-sans-kr.conf \
 "
-SRC_URI[md5sum] = "f8d1bd6c87d8575afdb25e2f46bd81d4"
-SRC_URI[sha256sum] = "38fd15c80f9980492faaa1af39ff873d8a38e45027023fb17d5b10d4b4b0e6af"
-
-S = "${WORKDIR}/SourceHanSansKR"
+SRC_URI[sha256sum] = "02fe28a48c6381c49d61c27a1b173c77f0e6f2b9f2b68e79f076f10a6a8f4bfe"
 
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
index a2b3fff07..0a4aff5e3 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
@@ -11,13 +11,10 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    svn://github.com/adobe-fonts/source-han-sans;module=branches/release/SubsetOTF/TW;protocol=http;rev=82 \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansTW.zip;subdir=${BP} \
     file://44-source-han-sans-tw.conf \
 "
-SRC_URI[md5sum] = "6533b71b31c19e548768f0fc963202f3"
-SRC_URI[sha256sum] = "92ba161921c5cdec5a8f8d5711676f0865b50cee071c25eb4bd4125b5af59fd0"
-
-S = "${WORKDIR}/SourceHanSansTW"
+SRC_URI[sha256sum] = "11d78c8fbc1a4bb04a453cdd65c99db8d41ec5cd6ba6d68c8638e6ba170de806"
 
 do_install() {
     install -d ${D}${sysconfdir}/fonts/conf.d/
-- 
2.34.1


