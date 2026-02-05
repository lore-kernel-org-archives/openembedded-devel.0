Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E509ECD98F
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 17:07:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25861.1770311250487948065
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 09:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TKLC9AFW;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48069a48629so11205685e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 09:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770311249; x=1770916049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=McD0TNRL8jM+lgk587EVbVznYx4rbS2LLPxRqycH+JA=;
        b=TKLC9AFWu7Qg9HpbiRFn2NgIlvwlyH+TD5nT045Ya2kgw4uEb9UJM/EI8cLi840Llr
         WRBZWj28AunXYP02QAxlc4a4dDvYeEoDxv+repYm180eF13ANLqejIp7Vn8USa9uPeoH
         OG6VS9tkH7Gvz3jvOcnCaxjpZ0f/agEXA7nIRCkDRHRHFviCq0TQMTOml8u1IWKiWkDE
         8F30WlHih6ndb1XwlS+eLhUELi0i0DV0PlGQQpf/NMFt/yuQcxhmYfWvBEY/LTMP8Mnf
         lkNvkwEGv/xB3TN2QHbZcVG8dA3Ey8mf7Rd+eAdkYt0/yEVXfSfgM4BNFdEQY1My9Txw
         /sYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311249; x=1770916049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=McD0TNRL8jM+lgk587EVbVznYx4rbS2LLPxRqycH+JA=;
        b=PvXxnsNSaYPhWK3NeMYgQmpT17yrf6mCDoCRXrPYMEVVnYa2tvd6oiEPh4ow86DsNp
         Kg5eNpxTNNzvNwD05cKW9MnEZGFvmOMR9hXcHUpRUZx/e4HWMe5yB4mC3wxWXxPIoo5A
         OU+uo1UUf4ePMC+vVS7gIvS1Onk0m77++WxW1s7V/QZ5cWSe8b04NCM60ldBExd2EdpP
         oVLFtMqliNkervEPz18Clyrb6mxxoavRfpgAqNknSjkultzTD/Yzk1Wbv786mX6+LkhG
         Ai3bD92vugvRIgziUzySfpDMt1MI2pAIcA0IGBxWS0+IgaZg2R5F42QTaM2lTRLojhjB
         g5Xg==
X-Gm-Message-State: AOJu0Yw7nwXrEm203t7PcQ+xN/KQg5RZxt8wAMKDNWQ6zMbXWwxMy62s
	9hOVBNJr//RNJJ3M7SDF3TIlxxDm0V/rkwu4wuhbjxrrxuFx1G3P7uHNSvpHwA==
X-Gm-Gg: AZuq6aK5wrMvDpGacFcIRop1y30dRAwmTUJ321YheEyL8fRc64ddkm7vVj29vG70kfV
	y5DEARpSbpnSAbhawwaZKFl9rfDvAPBi6AUBMczh2Qc8OA7tnr4p8qkem+DvV4UrDLii+AxiWtk
	H8dQakt2dEYZBS2LIxuX6aSsDJ9aWJMs15/jKQlYjVB8Hf4eRS+3RNmV1nP5MQvgI8lXeEJegxr
	QpJrL0SIMYVfNkX6wQeqRHWj5+Apu9PFR4EwoNOQn2NYwcKyuQHovCi0Qc3jKQJhiwP/+gBMrAD
	ZFm+qs1lnt3A+e62cnAmFUzEhiiSLAnAIHpoRUZ9OonOI+MVjO3T7FVHnwrXiTL8F0PRqZW7d/1
	7E3DuEdq3FgXzndIEe/GQHksnMi1nTJWk8VkLgGZYHf9L0ioV/tqV7lPktxZkNs/ilkUUsyp31G
	HNXKcfWwFcufWA9Z+GNX8=
X-Received: by 2002:a05:600c:3553:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-483201dc49emr1386315e9.1.1770311248424;
        Thu, 05 Feb 2026 09:07:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d4d030sm102237375e9.13.2026.02.05.09.07.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:07:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] mailcap: drop recipe (debian version)
Date: Thu,  5 Feb 2026 18:07:24 +0100
Message-ID: <20260205170726.2389904-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205170726.2389904-1-skandigraun@gmail.com>
References: <20260205170726.2389904-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 17:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124215

The same recipe is already provided, sourced from Fedora.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../mime-support/mailcap_3.75.bb              | 54 -------------------
 1 file changed, 54 deletions(-)
 delete mode 100644 meta-oe/recipes-support/mime-support/mailcap_3.75.bb

diff --git a/meta-oe/recipes-support/mime-support/mailcap_3.75.bb b/meta-oe/recipes-support/mime-support/mailcap_3.75.bb
deleted file mode 100644
index 6dc1fb3f8a..0000000000
--- a/meta-oe/recipes-support/mime-support/mailcap_3.75.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-SECTION = "base"
-SUMMARY = "MIME files 'mailcap', and support programs"
-LICENSE = "PD & Bellcore"
-LICENSE:${PN} = "PD"
-# mailcap.man's license is Bellcore
-LICENSE:${PN}-doc = "PD & Bellcore"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=881b8546ad4d18ee8d55d42c93cda0b6"
-
-DEPENDS = "file"
-RDEPENDS:${PN} = "perl"
-RRECOMMENDS:${PN} = "file"
-
-SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.tar.xz"
-SRC_URI[sha256sum] = "44876c7241693ab32de57e799052b19a575ae0e27e85380537225708f562738f"
-S = "${UNPACKDIR}/work"
-
-FILES:${PN} += " ${libdir}/mime"
-
-docdir:append = "/${BPN}"
-
-do_install () {
-    install -d ${D}${sysconfdir}
-    install -d ${D}${libdir}/mime/packages
-    install -d ${D}${docdir}
-    install -d ${D}${sbindir}
-    install -d ${D}${bindir}
-    install -d ${D}${mandir}/man1
-    install -d ${D}${mandir}/man5
-    install -d ${D}${mandir}/man8
-    install -m 644 mailcap            ${D}${libdir}/mime
-    install -m 644 mailcap.order      ${D}${sysconfdir}/
-    install -m 644 mailcap.man        ${D}${mandir}/man5/mailcap.5
-    install -m 644 mailcap.order.man  ${D}${mandir}/man5/mailcap.order.5
-    install -m 755 update-mime        ${D}${sbindir}/
-    install -m 644 update-mime.man    ${D}${mandir}/man8/update-mime.8
-    install -m 755 run-mailcap        ${D}${bindir}/
-    install -m 644 run-mailcap.man    ${D}${mandir}/man1/run-mailcap.1
-    install -m 644 debian/changelog   ${D}${docdir}
-    install -m 644 debian/copyright   ${D}${docdir}
-    install -m 755 debian-view        ${D}${libdir}/mime/
-    install -m 644 mailcap.entries    ${D}${libdir}/mime/packages/mailcap
-    cd ${D}${mandir}; gzip -9fv */*
-    cd ${D}${docdir}; gzip -9v changelog
-    cd ${D}${bindir}; ln -s run-mailcap see
-    cd ${D}${bindir}; ln -s run-mailcap edit
-    cd ${D}${bindir}; ln -s run-mailcap compose
-    cd ${D}${bindir}; ln -s run-mailcap print
-    cd ${D}${mandir}/man1; ln -s run-mailcap.1.gz see.1.gz
-    cd ${D}${mandir}/man1; ln -s run-mailcap.1.gz edit.1.gz
-    cd ${D}${mandir}/man1; ln -s run-mailcap.1.gz compose.1.gz
-    cd ${D}${mandir}/man1; ln -s run-mailcap.1.gz print.1.gz
-}
-
-INHIBIT_DEFAULT_DEPS = "1"

