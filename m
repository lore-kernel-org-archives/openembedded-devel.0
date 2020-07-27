Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.63619.1595878061842162692
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 12:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=lWk0b1YC;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.177, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f177.google.com with SMTP id g6so5911457ljn.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 12:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=445tVHzWJVgpn6/4cEu7ze0ieEnzyNX18ECP51RiHvM=;
        b=lWk0b1YCVS71u3d5XCkSHGTu35jAq2mXWLZSsPM5ZfRrb10h20CAxtZHSsgmFNH8Zf
         jqoaswjJEmWEFyjpvB8s+6oSiE2iBqoxLMMvY0kBbNn7JMZ9BKvd1Ln8QQIpfMkBqJ5l
         uxdsilT+Q2SIeN81iRTQHhsKxOXjHcHC/lXFVCeylRn4cUZXySULDu4q2AJfSNkq16yb
         /ANlGxa0C3u8wOWB93RwuPeu+D0/vMHgh+HN5FjxNbXY6tE/rJ0SAsfFhbklyePWq3TY
         jNiP5Ph2/ABS1DWwP+bEb1Lf8KflnJcwqMc1fPslMhuajU3YPmdz/Dag2AeDRCrYP/Sq
         SRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=445tVHzWJVgpn6/4cEu7ze0ieEnzyNX18ECP51RiHvM=;
        b=HDW3pvWFINoOmTSJiaoMo0u9nHFyNQU8BgDZexkYvCjCZYz1WbfQMmktmWX4FqQCG0
         ER2EEYy7w9xH06xiXm6YeE/VMS0kbFJhVxLMkCscIGq6rAqUOsUkXO8ywDvoMsu6NkBI
         LcO8LPpzhPTXd7kdGYbywNLWA2yiU1AgrZTiqIIyRN68ZAWyWLVwmDAmb/+E55lBjka+
         EJfDFxorElWlLmIOt3dz1ehsvHhXDrCHJOtgLr20hoUOhRKQHSbr68SmnvXWorA+jbfD
         fYdcHCc/eOGbQuMux7L8LiyQOnjg0SZtFf3d/TW5r4BbPFfex1g4h8rOnRjz7XA6KyNo
         vbhw==
X-Gm-Message-State: AOAM532c3d1WrQvWlgXVMBCuImD7Xg2q5itDNWmRRHCLPgx4Hve/e0EN
	TDF1XPIZ7OaZbRpf2xwMe/IZE4MsTvw=
X-Google-Smtp-Source: ABdhPJxR83j8Lfvp82SptZKBx1QC9AzrHABnvDeNFezggnwkJb7g8y+rN29Pcpd9rUiMy8dqzAkwuQ==
X-Received: by 2002:a2e:9a47:: with SMTP id k7mr10667647ljj.96.1595878059708;
        Mon, 27 Jul 2020 12:27:39 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id u19sm2910311ljk.0.2020.07.27.12.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 12:27:39 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe 3/5] libplist: update to 2.2.0
Date: Mon, 27 Jul 2020 21:27:20 +0200
Message-Id: <20200727192722.2488841-3-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727192722.2488841-1-open.source@oleksandr-kravchuk.com>
References: <20200727192722.2488841-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{libplist_2.1.0.bb => libplist_2.2.0.bb}   | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-extended/libimobiledevice/{libplist_2.1.0.bb => libplist_2.2.0.bb} (70%)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
similarity index 70%
rename from meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
rename to meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
index 36659e752d..408fa8ac0e 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A library to handle Apple Property List format whereas it's binary or XML"
-
+HOMEPAGE = "https://github.com/libimobiledevice/libplist"
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
                     file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7"
@@ -8,9 +8,8 @@ DEPENDS = "libxml2 glib-2.0 swig python3"
 
 inherit autotools pkgconfig python3native
 
-SRCREV = "3df02d4d0e9008771e8622fdc10de8333b3f0d85"
-SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https \
-           "
+SRCREV = "c5a30e9267068436a75b5d00fcbf95cb9c1f4dcd"
+SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https"
 
 S = "${WORKDIR}/git"
 
@@ -20,10 +19,11 @@ do_install_append () {
     fi
 }
 
-PACKAGES =+ "${PN}-utils ${PN}++ ${PN}-python"
-FILES_${PN} = "${libdir}/libplist${SOLIBS}"
-FILES_${PN}++ = "${libdir}/libplist++${SOLIBS}"
+PACKAGES =+ "${PN}-utils \
+             ${PN}++ \
+             ${PN}-python"
+
+FILES_${PN} = "${libdir}/libplist-2.0${SOLIBS}"
+FILES_${PN}++ = "${libdir}/libplist++-2.0${SOLIBS}"
 FILES_${PN}-utils = "${bindir}/*"
 FILES_${PN}-python = "${libdir}/python*/site-packages/*"
-
-
-- 
2.25.1

