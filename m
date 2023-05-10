Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203B6C77B75
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 00:37:16 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.5534.1683679033985964824
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 17:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=FEa4pvsx;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1aaea3909d1so61952545ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 17:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683679033; x=1686271033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Murnid37f8Br/pqlBCxnEvmrCqRjD8CKr1EIb+KIxZ0=;
        b=FEa4pvsx4AiKrq/767EryLfaCPTep5nuUAqC8JMIDCnOtvJzGlTWOeBE6bb85poNEa
         d3FbfyGMJfLTfkT5xQiU6gDik5JbMu88ECJlHU/fm/xZiBjyWLFjprIuA1rpEDrQ2Ily
         vBnaIZhsoZUrlhsnqznTENkq91dKMrkDCmEr0zKAySRJS6sVmOB+65PYpWpRPr/mGRFq
         ZGr23er1oQfMCn/xrfQ9ZFKpjQYHLRaNrIyq+vbh8ku7klDuC5YA22q2FdM9nz1sMvt1
         UJeFrcxnLdYmgrmA0rTUaxzzGyimxqCheY3EimOTxOmfbp9aRtQlIF9EBqROCwKJJW5D
         FEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683679033; x=1686271033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Murnid37f8Br/pqlBCxnEvmrCqRjD8CKr1EIb+KIxZ0=;
        b=gwBE0+d5wCa73FBhzDyjwKH4UkVTVaMVqNs0giI6thlFphiDm4FC0Vbcj871MwSBEr
         XIRmWRcPH9ASWSthiZrFg/+TklB9QfqX6sFtzDUNRHO7JDjOcD6t6rQvvczCDXm7iEJe
         6w8Av/E10Sne7Sop50O4ifAQy6vSBriwK5QbKCZA58WNhpwZn2k4NC9WiWC4Nvmkf73d
         L64sdOCMHikS93hFWfBZXxswWY5vpQE6Le6/bjYvv2F3AAF+PRe0z5rZvyvyZ2mF0JUz
         ZA7sawOJVKLysOObQbJjODdfIccsH59ZWUkQIFCZVTEwfy2LAiG1vlUT4NT+//Fdwk2x
         F7bQ==
X-Gm-Message-State: AC+VfDwhK89ShtwqmasRrtCXMgG+p2+czU2O/C53ORLZ2LcX7j8bD/vg
	B8apS4MYrE0fNkh6ZQzrOUbiXUW3BHdU5w==
X-Google-Smtp-Source: ACHHUZ7FCM4eu6BFBXP4xZpsJJBnmS/sQpuaNWoLZBR9Nh3mM6aF0XyIKENMCGdY56OWsUykpk8UYg==
X-Received: by 2002:a17:902:ec92:b0:1ac:aba5:7885 with SMTP id x18-20020a170902ec9200b001acaba57885mr2209250plg.47.1683679033058;
        Tue, 09 May 2023 17:37:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id lw6-20020a17090b180600b002505f8b9c53sm5878673pjb.38.2023.05.09.17.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 17:37:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] usbmuxd: Remove recipe for 1.1.1
Date: Tue,  9 May 2023 17:37:10 -0700
Message-Id: <20230510003711.1343334-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 00:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102519

The _git recipe provided the latest uptodate version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../usbmuxd/usbmuxd_1.1.1.bb                  | 22 -------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_1.1.1.bb

diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_1.1.1.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_1.1.1.bb
deleted file mode 100644
index 3f4f846f9e..0000000000
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_1.1.1.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "This daemon is in charge of multiplexing connections over USB to an iPhone or iPod touch."
-HOMEPAGE = "https://github.com/libimobiledevice/usbmuxd"
-LICENSE = "GPL-3.0-only & GPL-2.0-only & LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=ebb5c50ab7cab4baeffba14977030c07 \
-                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504"
-
-DEPENDS = "udev libusb1 libplist"
-
-inherit autotools pkgconfig gitpkgv systemd
-
-PKGV = "${GITPKGVTAG}"
-
-SRCREV = "79c8b38d1488a6b07e1e68f39d8caec3f1a45622"
-SRC_URI = "git://github.com/libimobiledevice/usbmuxd;protocol=https;branch=master"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF += "--without-preflight"
-
-FILES:${PN} += "${base_libdir}/udev/rules.d/"
-
-SYSTEMD_SERVICE:${PN} = "usbmuxd.service"
-- 
2.40.1


