Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1648C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 17:16:42 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.19948.1678382192957411240
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 09:16:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G8Lc1Bam;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id ev13so1861666qvb.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678382191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVrjYEqJpUtJ/xncEbYLSc8WrTtTZi0In8cwHqMYnnA=;
        b=G8Lc1Bammuv4x7SpmUrwr1/mdUqg2AGx6ezEzpupGb2T5ZXfi3lHZcqEFyq4o4zOsr
         sxwFloMehlg2W6YlftY4Vdtj9tEU9mFxC9xXIjYvUENWcP3Hrx+5X7fndsgDSr8epiLB
         ZG42NiqbEG+aeFdjCdcozWrvq7T+cWyiHa3Q498MKlwzb8T+Ps18d0RxQNGwN2F5XgPF
         RgDQpYjWyl8VmPW3LCsLcaypYRAdDgJ6oUA/Z2EKgteCthUJKuue4/ihZ19GbsxS8r7x
         ekVWtL76Fq5AE5vkv41NHCGvwrdHnM3SIB6jwEQ52n85kC0PnKcjWbwct5dDUpmCdmK3
         J9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678382191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVrjYEqJpUtJ/xncEbYLSc8WrTtTZi0In8cwHqMYnnA=;
        b=ESFtpviyh1XtNoSWcQB1G1vjDydJd1e1SD7vGTkM4U4VE1swirTGMmB37zGE13muUS
         nGuIYZGUmXxpxB5R5wWjtH+pviujTtIKufhKz7uNc8WrHUL/08PJVhOjfzoyRsA4Ntn3
         tdmkwHN5qrFP+gpznx8JHeVCZY4T3o8m4eu0qPdgcBbz96LefSZCBYsO9Wd8s4SHL49V
         66m4IYCX1G/CVVHOZuru8AndrCzsE6VaMQuF6m9Qxd7KMAIXm/zdEaeWPlJKs1jDRxa/
         jfSlQ/eCOat2DI8uxoihBoQxGevcYf/ZAexNiAud2BuORpcOKz6cCdAfRs19+oWcHVce
         tBsg==
X-Gm-Message-State: AO0yUKUANZOEybGarRBIXpt50mNaInLkXc4kcKfRa1dKqPSrK5cvF3CC
	AnqUzjgKl8JBc5GWcd0GfqaSC4GSdjc=
X-Google-Smtp-Source: AK7set+rLR60WkB1dONF927PKOQYfZzCl3Zw9tWHzLEkTHoGfMVFzi5IIx60rde7NekMvTd+w4WZOQ==
X-Received: by 2002:a05:6214:2a82:b0:572:636d:625f with SMTP id jr2-20020a0562142a8200b00572636d625fmr41571310qvb.33.1678382191471;
        Thu, 09 Mar 2023 09:16:31 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d15-20020a05620a240f00b00742562938cfsm14356602qkn.107.2023.03.09.09.16.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 09:16:30 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] cups-filters: fix ghostscript handling
Date: Thu,  9 Mar 2023 12:16:23 -0500
Message-Id: <20230309171623.28428-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230309171623.28428-1-twoerner@gmail.com>
References: <20230309171623.28428-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 17:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101460

ghostscript is not needed at build-time (it only needs to be enabled in the
configuration step) but it is required at run-time for two of this recipe's
packages.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb b/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb
index 0d3560b9c2ac..fd82bb39c2d4 100644
--- a/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb
+++ b/meta-oe/recipes-printing/cups/cups-filters_1.28.17.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d77679ce6a2cc4d873d4ebbf2a401e6"
 
 SECTION = "console/utils"
 
-DEPENDS = "cups glib-2.0 glib-2.0-native dbus dbus-glib lcms ghostscript poppler qpdf libpng libexif"
+DEPENDS = "cups glib-2.0 glib-2.0-native dbus dbus-glib lcms poppler qpdf libpng libexif"
 DEPENDS:class-native = "poppler-native glib-2.0-native dbus-native pkgconfig-native gettext-native libpng-native"
 
 SRC_URI = "https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
@@ -51,6 +51,7 @@ PACKAGES =+ "\
 FILES:${PN}-gst = "\
 	${libexecdir}/cups/filter/gsto* \
 	"
+RDEPENDS:${PN}-gst += "ghostscript"
 
 FILES:${PN}-data = "\
 	${datadir}/cups/data \
@@ -71,6 +72,8 @@ FILES:${PN} += "\
         ${datadir}/cups/ppdc \
         ${datadir}/cups/banners \
 "
+RDEPENDS:${PN} += "bash"
+RDEPENDS:${PN} += "ghostscript"
 
 do_install:append() {
 	# remove braille dir
@@ -79,5 +82,3 @@ do_install:append() {
 	# remove sysroot path contamination from pkgconfig file
 	sed -i -e 's:${STAGING_DIR_TARGET}::' ${D}/${libdir}/pkgconfig/libcupsfilters.pc
 }
-
-RDEPENDS:${PN} += "bash"
-- 
2.36.0.rc2.17.g4027e30c53


