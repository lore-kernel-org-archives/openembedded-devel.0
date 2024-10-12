Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AB0D1A42D
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 01:43:06 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.2531.1728697380210509984
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 18:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sa1recMo;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e221a7e7baso1784202a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 18:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728697379; x=1729302179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cbHvLqbAiBFsISqtMzEpcSQhE8MI+Tah95wTvjyBvuE=;
        b=Sa1recMoom1NmxXfhnMOi6dYeMWP+Rn4lSgD1/d0AzE1YTO89sIdCmo0pOS9SXXfNm
         r+aj4/hlCXOltQh7YSadFsvpNKBiAcRrbVq0XVf67hqjAXBKTyPEJO7L6pXQ0l7D2I9M
         cSLjKlyHWWdW1xxf0rIkUv/1IEj3GB49WSXjtnbQ2Gj3mpXM8hUIuF/eo5iWynaarQ5A
         0VTrdPdkSqKA96icgCwvZSGgdNEm94Zp5aVSf2AVUikeZhrHXuStM0QIKRLEHP5O4Dyj
         ZiLf76WGneRBKtjIfR4XcXMKtyAHX6YRO3cycQVy4bWOGLjouPn6M6h86UdJw6qsQOCC
         jWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728697379; x=1729302179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbHvLqbAiBFsISqtMzEpcSQhE8MI+Tah95wTvjyBvuE=;
        b=E2q54GU4NhEGk3pkSM4eHU6xClgAeXMIu6MYT8AaQXLWZ1oV3YoJZ1jJRMF85KZW8c
         F3+DKTZGzwDRtHi7wWQBOMDst4ku7JAdqNAJAprW3GiSwZYEjVFxj/zOKpIfeO2XQ8Zi
         bhwimnKoEzP9gcsQBSYmiQNFVnvNmBUTstbfaiDyKKO3/C6TwRBVfvvmDJrwbPcsiigH
         ZlvLfCCbdUpu/oKmA1iunVQ5I3GQNx2ZHBS6dOCbZEaMfJThXm2wXxmjqdNIYL5kAUZJ
         AOr+EJPvBpUSetM3Sap4S2u2pYA0jrsgg543c3XlknY4WVbNpTik0NeJNDZz3RYWy5LK
         H6ag==
X-Gm-Message-State: AOJu0YymEOLsjfI6TIzCXHOgQ+5cAtw67KwHhoMlpo34InSwVgkU2NgU
	N82QFtx2nsfJepYrYlmRKU/aCOS8CZJ3rXJr68jOwVAxNCiiIb+Qip/5M+ee
X-Google-Smtp-Source: AGHT+IEA5aXeYwCKfPOP4iDTeKJ2WkS90qSZJe6yo8G45ArizbvnScjIXqK4V2BEFfcaiFI+bXnumg==
X-Received: by 2002:a17:90b:4a82:b0:2d8:82a2:b093 with SMTP id 98e67ed59e1d1-2e2f0aa8b19mr6495187a91.13.1728697379318;
        Fri, 11 Oct 2024 18:42:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ca87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2b9483328sm5464366a91.44.2024.10.11.18.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 18:42:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] jasper: Upgrade to 4.2.4 release
Date: Fri, 11 Oct 2024 18:42:55 -0700
Message-ID: <20241012014257.1775463-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 01:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112816

Changes are here
https://github.com/jasper-software/jasper/compare/version-4.1.1...version-4.2.4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../jasper/{jasper_4.1.1.bb => jasper_4.2.4.bb}            | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_4.1.1.bb => jasper_4.2.4.bb} (84%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb b/meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb
similarity index 84%
rename from meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
rename to meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb
index 5281980ecb..4796a85190 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb
@@ -3,13 +3,11 @@ HOMEPAGE = "https://jasper-software.github.io/jasper/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
-SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master"
-SRCREV = "917f7708b755d8434f70618108c1a76f1b6a0a82"
+SRC_URI = "https://github.com/jasper-software/${BPN}/releases/download/version-${PV}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "6a597613d8d84c500b5b83bf0eec06cd3707c23d19957f70354ac2394c9914e7"
 
 CVE_STATUS[CVE-2015-8751] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 
-S = "${WORKDIR}/git"
-
 inherit cmake multilib_header
 
 do_configure:prepend() {
@@ -31,4 +29,3 @@ do_install:append() {
     chrpath -d ${D}${libdir}/libjasper.so.*
     oe_multilib_header jasper/jas_config.h
 }
-

