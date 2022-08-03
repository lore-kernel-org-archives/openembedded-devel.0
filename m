Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503A3C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 18:29:09 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.314.1659551342418462976
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 11:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=1GT60Eoq;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.53,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f53.google.com with SMTP id l4so22538272wrm.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 11:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YDaaUyZUFTHNvN81+YcOKrx4K47K855VNmVokMG52EU=;
        b=1GT60EoqPvFwvmsn5l1GvWVWQWDHU+JXGBxg32qVsvPkWxEsQ7Qb18FtHvrgBH5s8V
         Qx9GJZygZD05jfVl5kIH1myGUVerHrkqpCXVh9DX5I15rfRJ6UHqzzsFvK5QN7tF4Wn/
         ftJZWIq3mDkYG/dya6VhGNLgh50B1SYXTPci3oyW+MtkGqmj72NQAfVJWJvgm/ldiu7D
         y2MpeuILXeXQHjdukxbjinDlf+e+8Thjanit3u8fiWrp8hefGAmgGMSXgcafVZDDLsQZ
         kzTihoD1NVWwwqm8+27mSSdtAAq+QXe2TwVTN1zguci4pFavQsvlX9AubwCIV8/kP92i
         oMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YDaaUyZUFTHNvN81+YcOKrx4K47K855VNmVokMG52EU=;
        b=VHQBoJPCsC5xvmT2f+39S2hxGz6aMPTGApnYPQrRDM/f9kYf8ZLCaMtyTvyFKQWi9V
         7jF6DclNHzpPdyC7LrESIpbC20+0xgbMOMD7s/pIlBRVHDQ260gpoVL/bdTJi1YTkxnL
         shVf0k6KKLDMAzxsTufqQKWfdtWS2jeTTqAahgp2+ivyst2TzVIL27nlw45kD/IGoJRv
         TWpI3NevWs9+OZbLrl3BvzMFkM6cF8UXaerBXHm7DDRU1l7VJUZQVJAoAcItid5mr72o
         SSdR/4BbSWQGOgFkL2KjvdQpLrKu26X/a+a81+v3c0vZxGbPDK9CsYAmPoJWgXWEoX8h
         nAUA==
X-Gm-Message-State: ACgBeo3erG5ruowNE1eYH54+Bi8UMg40FadNC0IDsN6NzG+t6xXKh6pi
	nYYCsLo1086js6WChlXXPRz4EQ==
X-Google-Smtp-Source: 
 AA6agR4Rwo+yIWMZODcK42QIn+XT93X8y1tRT/FlZ0SgA/1XYaZWoTQ7+uIwVqkkPvCX9uetAxTaig==
X-Received: by 2002:a05:6000:c3:b0:21e:e081:4cc4 with SMTP id
 q3-20020a05600000c300b0021ee0814cc4mr16508421wrx.93.1659551340639;
        Wed, 03 Aug 2022 11:29:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4a53:da6b:7724:118e])
        by smtp.gmail.com with ESMTPSA id
 x4-20020a5d4444000000b00220606afdf4sm2730280wrr.43.2022.08.03.11.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 11:29:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 1/3] python3-matplotlib: don't use PYTHON_PN
Date: Wed,  3 Aug 2022 20:28:53 +0200
Message-Id: <20220803182855.104135-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Aug 2022 18:29:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98111

We only support python3 so using PYTHON_PN is redundant.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../python/python3-matplotlib_3.5.1.bb        | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
index cd05b455d..7dfe46f3c 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
@@ -14,11 +14,11 @@ LIC_FILES_CHKSUM = "\
 DEPENDS = "\
     freetype \
     libpng \
-    ${PYTHON_PN}-numpy-native \
-    ${PYTHON_PN}-pip-native \
-    ${PYTHON_PN}-dateutil-native \
-    ${PYTHON_PN}-pytz-native \
-    ${PYTHON_PN}-certifi-native \
+    python3-numpy-native \
+    python3-pip-native \
+    python3-dateutil-native \
+    python3-pytz-native \
+    python3-certifi-native \
 "
 
 SRC_URI[sha256sum] = "b2e9810e09c3a47b73ce9cab5a72243a1258f61e7900969097a817232246ce1c"
@@ -44,13 +44,13 @@ LDFLAGS:remove:toolchain-clang:mips = "-fuse-ld=lld"
 RDEPENDS:${PN} = "\
     freetype \
     libpng \
-    ${PYTHON_PN}-numpy \
-    ${PYTHON_PN}-pyparsing \
-    ${PYTHON_PN}-cycler \
-    ${PYTHON_PN}-dateutil \
-    ${PYTHON_PN}-kiwisolver \
-    ${PYTHON_PN}-pytz \
-    ${PYTHON_PN}-pillow \
+    python3-numpy \
+    python3-pyparsing \
+    python3-cycler \
+    python3-dateutil \
+    python3-kiwisolver \
+    python3-pytz \
+    python3-pillow \
 "
 
 ENABLELTO:toolchain-clang:riscv64 = "echo enable_lto = False >> ${S}/mplsetup.cfg"
-- 
2.34.1


