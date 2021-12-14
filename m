Return-Path: <hughsient@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC26C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 14:41:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.26463.1639492877109683080
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 06:41:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HAExpGQf;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: hughsient@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id t18so32697218wrg.11
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 06:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Aj09GmDZrFx3sn82fnQm2A11ThhDR8mWdgvJ+lLfFdg=;
        b=HAExpGQfy+7KzH8JUj9A2FEpG4LYOaJpmjmsOr4xqLV/K6Pt0zRpuaPWJcvoyMNMgL
         0wkyAWGDPrIz0UEf8k6Jxmy8bkZDDUw5KLQ04fKtfWRoxks0tmiQJSgRHhiHbFOR5cq1
         e4Mg6Er32PCsepWPRHPrAK4j8OFMZjsXolEDcmfl++G64PBx4Cb5ExiTSFiZ6FQvjWAw
         mS7szmdD+QCjqwCZ2m03JpjdIIlkhPrGF8wglwqRtXeiCz7Qs/I44ulVCDSlpoU5947b
         4jJzeWbKb18ydMXbBEOOBuNbstvyjLNweCLoHsFeHuRxjbY1lQ0tGuJhsOH4wDPzdg7h
         Svpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Aj09GmDZrFx3sn82fnQm2A11ThhDR8mWdgvJ+lLfFdg=;
        b=7oQJ2c8/w66wT+2DrCxVR1gDEakmHjvanPbIYqY0J3LNyPAaMieLXsi1BouIov3E/a
         sy4adTMdP6JkWXl8B+/grWjNDp2Oe2DOkRUHgoD1Byz6DMYAxCl6ikbdumJSncV4xfLt
         wvUJs92iro2CFfuYryStpf6FRHVNWUjDq1V3+SmoBYJsHEmFBSFeT2ps9+2/P3kk40am
         V0inF+aw+2VkXc6mWGUnCoP3vNO8U9awJoRikC3thJU5QnWVMhH7gcg/XwZPo5UdclDU
         Ex+QssGXAGZjQ8IRtl3P30u8dUXrDzoHpdVVW4vxPEhikUOYZcHcgHRYarrpm3qlM5po
         LI2A==
X-Gm-Message-State: AOAM530NrztEQkNFcoBltAse+HG+OpHNd7m8PDhie9mHkPCygSwcFZHy
	YOTx6+F3QJCsEQDUNJTue4pFJJNZY+c=
X-Google-Smtp-Source: 
 ABdhPJyvjcA+icllM22As4ek1N43Q3JOpq04qg25R9MrGeS+N4NO81ujawV0fw0pax2EVEQRma2p2w==
X-Received: by 2002:a5d:4343:: with SMTP id u3mr6438698wrr.450.1639492875466;
        Tue, 14 Dec 2021 06:41:15 -0800 (PST)
Received: from fedora.Hitronhub.home ([62.31.71.236])
        by smtp.gmail.com with ESMTPSA id
 f19sm2831657wmq.34.2021.12.14.06.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 06:41:14 -0800 (PST)
From: Richard Hughes <hughsient@gmail.com>
X-Google-Original-From: Richard Hughes <richard@hughsie.com>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Hughes <richard@hughsie.com>
Subject: [PATCH 1/4] libjcat: Update to 0.1.9
Date: Tue, 14 Dec 2021 14:41:03 +0000
Message-Id: <20211214144106.2492080-1-richard@hughsie.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Dec 2021 14:41:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94355

New Features:
 - Set which backends are supported in the pkgconfig file
 - Use -Dcli=false to reduce the install size

Bugfixes:
 - Return an error if we try to self-sign no bytes of data
 - Show a more accurate output when not all engines are enabled

Also, inherit lib_package so the binary isn't installed by default.

Signed-off-by: Richard Hughes <richard@hughsie.com>
---
 .../libjcat/{libjcat_0.1.8.bb => libjcat_0.1.9.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-gnome/libjcat/{libjcat_0.1.8.bb => libjcat_0.1.9.bb} (80%)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.8.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.9.bb
similarity index 80%
rename from meta-oe/recipes-gnome/libjcat/libjcat_0.1.8.bb
rename to meta-oe/recipes-gnome/libjcat/libjcat_0.1.9.bb
index 87767ac2a..b0871c6a4 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.8.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.9.bb
@@ -8,13 +8,13 @@ DEPENDS = "\
 "
 
 SRC_URI = "\
-    git://github.com/hughsie/libjcat.git;branch=master;protocol=https \
+    git://github.com/hughsie/libjcat.git;branch=main;protocol=https \
     file://run-ptest \
 "
-SRCREV = "356cd2faf2d2197156b0dae7984482cf781d64db"
+SRCREV = "d4833949f8f1997b83f35a03127b9e12c104a7c8"
 S = "${WORKDIR}/git"
 
-inherit gobject-introspection gtk-doc meson ptest-gnome vala
+inherit gobject-introspection gtk-doc meson ptest-gnome vala lib_package
 
 PACKAGECONFIG ??= "\
     gpg \
-- 
2.33.1


