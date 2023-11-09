Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2076CC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 09:32:54 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.117465.1699522365089371377
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Nov 2023 01:32:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=eQDefEFi;
 spf=pass (domain: thaumatec.com, ip: 209.85.167.43, mailfrom: dse@thaumatec.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5098e423ba2so683156e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 01:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1699522363; x=1700127163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUmMrMHR19NdefvQQy9iRnPjaqTIv3UPBXIVnKMdp8Q=;
        b=eQDefEFiKBS5yVtqNXcHQAT1rY7w1cio8LJmvYk8aySTlYEmVP2Cv/jew20fQTj9lp
         UBL1vd0EyQ72spMmoRzow47HIAXb4T4zctKdMJBEA+cSmUXFYr2i5UDyUPRdKklr1cLV
         N4u/Y8OfgE0uw0bhIFrQ6Wox8lQeWm0mMse0Glth1R7GDbv4jdfVVPhvpAZQSdGuo5vo
         pvC3QG2BuQBdiv7LTncXJk3p4DfyrkY2FiDjw92/GO7nZWlC3AMYHwNXOlZVfOdQ+JOO
         L3dsBsGy+NbOKwjdUMMCjHDIEbZbYnSHPkYkwp0rmLWnCzFxfZ87Vi9A7hn/8uxKHVyM
         iRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699522363; x=1700127163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUmMrMHR19NdefvQQy9iRnPjaqTIv3UPBXIVnKMdp8Q=;
        b=rjBGyIEYbqXfmpimgw9plvC2XkKMO0WgU1vzFf5Aa6PQcEyxohf+KQ9NSNb8ZyVtuK
         6DoUDVJF/usPNofKY5//LpDdkUlzuLRu1JrvGWAhzf6srwOubfvuRZyj1aZJKssHeoGy
         wSCeAS6lV1yHeq3FaNDXCoycCtJlkXi9j7JCa5icvmCKQqX+1Oixzw+3eNCI6hiwRcId
         lCuwZhY5SLyX7kxRWvChF8pBt158dYunIJ0C1E3xpYvtco8cA3zG7afQw0oJutZx98EO
         R5QZJhbFgrUmt564aVjujd+KZlimsZbz1JDPyQsCDHga4Q7gYMGsfPDSEMZ0MzR9ZkdZ
         /jaA==
X-Gm-Message-State: AOJu0Yx2G7T60G4XU5f1L+/wjvPxmjEq6ZuAi6X4XDj23IzPliZAZ6kT
	nMKeDplzEfcWedrMPvEpBpOpgP9TznpROeoKffZ+0g==
X-Google-Smtp-Source: AGHT+IGLBNNhJmavk3/9sEbH8kjCpxnFe5goeJDRNizQNSGZNoRaqyldt4gkqqZSWkrlL+97+vQDJQ==
X-Received: by 2002:ac2:430f:0:b0:507:9d70:b297 with SMTP id l15-20020ac2430f000000b005079d70b297mr745652lfh.60.1699522363189;
        Thu, 09 Nov 2023 01:32:43 -0800 (PST)
Received: from localhost.localdomain ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id x19-20020a19f613000000b005032ebff21asm988937lfe.279.2023.11.09.01.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:32:42 -0800 (PST)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [meta-webserver][PATCH v1 2/2] cockpit: Bump to version 304
Date: Thu,  9 Nov 2023 10:31:45 +0100
Message-ID: <20231109093151.101752-2-dse@thaumatec.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109093151.101752-1-dse@thaumatec.com>
References: <20231109093151.101752-1-dse@thaumatec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 09:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106514

In version 301, the default bridge implementation was changed to Python.
Adjust recipe to build and install new Python bridge.

Old bridge implementation is still available and can be enabled using
'--enable-old-bridge' flag. Add PACKAGECONFIG option for old bridge.

New bridge shows minor regressions like networking graph not generated
correctly. Probably additional dependencies are missing.
For this reason, keep the old bridge enabled by default.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 .../cockpit/{cockpit_298.bb => cockpit_304.bb}           | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-webadmin/cockpit/{cockpit_298.bb => cockpit_304.bb} (93%)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
similarity index 93%
rename from meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb
rename to meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
index 39dbec54e..ab05fd377 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
@@ -9,11 +9,13 @@ SRC_URI += " \
     file://0001-Warn-not-error-if-xsltproc-is-not-found.patch \
     file://cockpit.pam \
     "
-SRC_URI[sha256sum] = "c7da91824f7a72c82c1a3aaff1a57dbe0ce1e29e05e95d92b5118a324a3f4b39"
+SRC_URI[sha256sum] = "a87d090c930e2058bb3e970ca7f2bafe678687966b5c0b8b42a802977e391ce9"
 
 inherit gettext pkgconfig autotools systemd features_check
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'old-bridge', '', 'python3targetconfig', d)}
 
 DEPENDS += "glib-2.0-native intltool-native gnutls virtual/gettext json-glib krb5 libpam systemd"
+DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'old-bridge', '', 'python3-pip-native', d)}"
 
 COMPATIBLE_HOST:libc-musl = "null"
 
@@ -37,12 +39,14 @@ EXTRA_OECONF = " \
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
+    old-bridge \
 "
 
 PACKAGECONFIG[pcp] = "--enable-pcp,--disable-pcp,pcp"
 PACKAGECONFIG[dashboard] = "--enable-ssh,--disable-ssh,libssh"
 PACKAGECONFIG[storaged] = ",,,udisks2"
 PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit"
+PACKAGECONFIG[old-bridge] = "--enable-old-bridge"
 
 PACKAGES =+ " \
     ${PN}-pcp \
@@ -120,8 +124,9 @@ FILES:${PN}-apps = "${datadir}/cockpit/apps"
 FILES:${PN}-bridge = " \
     ${bindir}/cockpit-bridge \
     ${libexecdir}/cockpit-askpass \
+    ${PYTHON_SITEPACKAGES_DIR} \
 "
-RDEPENDS:${PN}-bridge = ""
+RDEPENDS:${PN}-bridge = "${@bb.utils.contains('PACKAGECONFIG', 'old-bridge', '', 'python3', d)}"
 
 FILES:${PN}-desktop = "${libexecdir}/cockpit-desktop"
 RDEPENDS:${PN}-desktop += "bash"
-- 
2.41.0


