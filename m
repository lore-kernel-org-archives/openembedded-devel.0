Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D141DC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 05:51:20 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2835.1784526677612468266
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2026 22:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hep2mTZ7;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso2098647a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Jul 2026 22:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784526677; x=1785131477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPLk/Dxr9J2j8opi4UoP0bYyKqggq8uL2bP9e7/108I=;
        b=hep2mTZ7jpGCyRftfZviRa5GItNFYy0vXZafKLsEUWrdFM9m3MFs8HCI3TlFXkFj95
         5KBUd/f+CXHpOMJsT+v/oKkFT+GekJxXQnkxwoPFyhgYyMsW9uKfJ52Z02TeccYiyESB
         8N1rDpN4YDEBXQ3TH8hr7n1iCRKF/zpq5OcBak89cNIN03tTrAVbk23Y8UFizK72gXHq
         W3AHm/9DflufBygk+LebLfCFuMJVFEidYOCUSBTJB9NjZ8Y59vSURVOo+1eS/y9x8hXe
         KDwFl7v0Cfzsml7ZXCvE+y+9l+rLTMwg/EwsLTU0wME5j1PC0yDyYElqibxiPZ/L8xyM
         mLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784526677; x=1785131477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPLk/Dxr9J2j8opi4UoP0bYyKqggq8uL2bP9e7/108I=;
        b=E3xX8CEoDeICNfK6RQ2hR8a2JMdKCbQ817X1+HQ6remhNYcds5DHFF+SpNKHiLdmIy
         C8LaAkENBL5oXoRA+vtAprjPUgrFWRAxAFTFNso145FzZrcUPqF9SL/YlV9Vl2MC3GG/
         2dbJVBE/8lmDzKHGiW3G4LR51GryxI+G+37T2KZq6gYH+sFyMiTdBRaI8visjYWgOQ9t
         BxoMTNYRZqD0QbY5WMNCo/U5aFGTLBZVuzvSeE1CKsBBwK7z70c+HxCAB4/ookdX9zib
         kREK1kinLYt5mAV7uh8ukdxA2lZnD5rYBqe+rRx6VUR/9OtcJkiGQ1Oc1b9znKDvku8t
         /Wkg==
X-Gm-Message-State: AOJu0Yzv/TxdcYHrRNHBSSXWpIt97tTHKzf4N9hJemRs822DB6vGmbWl
	yCq2cTx7rdmywoZtlSOMMcJZNbb2EKop75P+id/H0k5WG+PXiWW3E1A/IEAPCA==
X-Gm-Gg: AfdE7cmjcp5U+9bNfvRu/b+mnTU3bRTBlMricC3WdFQ0L9V745A50EOYfiVZ8rzh6AI
	T4zt6AXFIQnpK/NrUFelAsA71YucNI1+M/zF6zdaK3BF8MKOf4MTg3ekdS0kMA5jpKzw9cqBCCz
	BVMrQSpkm+P98zsZe4Naq2MIuysQBbPC7L50VncJWdHcKhJas2EWiSOXICkjfQJzYI74eilFxlU
	d01LoqUrN827ENUoETiYJaeAceUXoymqTXzzGPVVwGpmQUzidj1lZSjxALWg2XZafSfK+Fazh5y
	XYlMxjoUP7TIM0TL8F3u0zWlaBdAakAAdMOy3EQdIa4A/HMN2/DyME3mw+z87HPXjVlnuBJl+Yk
	75Fc9+yLDivaTRM1DpypQjPu5AG45FQHQfe360SO44eCRw28LsyHvdqYccOkHuIlSmpmTA3nfV0
	uOEDKuNC1zaRCZoYlDJZbasbxJtWW7VYEqTjwFmxCh/Nj5PS7+UqhlsR+6LeMAUuw1g9HgQccsl
	6NaZmpB3nUPJ4Ruaee79yCxRyPquYXZhJGxlrii/X0Khfdb+hB40ZRxYxADQFOypwKipwnPLx2o
	0WHNwJ9CjEQu1K9v450=
X-Received: by 2002:a05:6a20:816:b0:3c3:75c5:48d5 with SMTP id adf61e73a8af0-3c38d8cf132mr11851772637.4.1784526676668;
        Sun, 19 Jul 2026 22:51:16 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm29251360eec.11.2026.07.19.22.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 22:51:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] proxy-libintl: Delete recipe
Date: Sun, 19 Jul 2026 22:51:14 -0700
Message-ID: <20260720055114.1998433-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 05:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128272

proxy-libintl provides a Win32 static libintl stub sourced from an
ancient (2010) GNOME win32 dependency zip. It is not used by any target
build and its lone consumer was the meta-oe packagegroup; drop the
recipe and its packagegroup entry.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 .../proxy-libintl/proxy-libintl_20100902.bb   | 33 -------------------
 2 files changed, 34 deletions(-)
 delete mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index c3600d5c95..bdda72195b 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -180,7 +180,6 @@ RDEPENDS:packagegroup-meta-oe-core = "\
     mm-common \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "ndctl", "", d)} \
     pim435 \
-    proxy-libintl \
     safec \
     sdbus-c++ \
     sdbus-c++-tools \
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
deleted file mode 100644
index c56160571a..0000000000
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "Proxy libintl"
-HOMEPAGE = "https://download.gnome.org/binaries/win32/dependencies/"
-SECTION = "libs"
-LICENSE = "LGPL-2.0-only"
-LIC_FILES_CHKSUM = "file://${UNPACKDIR}/src/proxy-libintl/COPYING.LIB.txt;md5=bc400bc21422f9a92e76ec2c5167ca2e"
-
-PROVIDES = "virtual/libintl"
-
-SRC_URI = " \
-    https://download.gnome.org/binaries/win32/dependencies/${BPN}-dev_${PV}_win32.zip \
-"
-SRC_URI[sha256sum] = "291ac350cc5eb4a01b0d651ca99fae64cee8a1c06b2005277fab5a4356f9ae91"
-
-UPSTREAM_CHECK_REGEX = "${BPN}-dev_(?P<pver>\d+)_win32\.zip"
-
-PACKAGES = "${PN} ${PN}-dev"
-FILES:${PN}-dev = "${includedir}/libintl.h ${libdir}/libintl.a"
-INSANE_SKIP:${PN}-dev = "staticdev"
-ALLOW_EMPTY:${PN} = "1"
-CFLAGS:append = " -fPIC -Wall -I ../../include ${@['-DSTUB_ONLY', ''][d.getVar('USE_NLS') != 'no']}"
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_compile() {
-    cd ${UNPACKDIR}/src/proxy-libintl
-    oe_runmake ../../lib/libintl.a
-}
-
-do_install() {
-    install -d ${D}/${includedir}
-    install -d ${D}/${libdir}
-    install -m 0644 ${UNPACKDIR}/include/libintl.h ${D}/${includedir}
-    install -m 0644 ${UNPACKDIR}/lib/libintl.a ${D}/${libdir}
-}

