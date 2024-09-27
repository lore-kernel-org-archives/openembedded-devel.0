Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF18CEBF8C
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 10:08:33 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.65808.1727431711481513881
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Sep 2024 03:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yjp9Ez86;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so18055825e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Sep 2024 03:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727431709; x=1728036509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LtY7ADSV1p9ieHQKjzd4NTHHqRhBuyONiBpIP65QNEI=;
        b=Yjp9Ez860f+JWqjPx90vpuycT9GeUhlG3WSCFGWvLtWkWlaCC2DCbdJua1Izdb2P7D
         fCRh1WNTDPK8P9qsOY4TlrG7OKdj8Cv03MV7c6OZM/dTanKElOcPk/67YYWawK2Xj9Vg
         R+Nf39wbtBLre3iroef7ox7xIfbaiyCDy6izihWXsMNM8dYlmp7tAtylrEYNaBCT60z0
         /CiNQzxRe11RfSbuO+2P9U6GkZDO6A9H5l+wwdtsqjEgeomaiJ+SH4TQCdyTCldzweee
         FwvFdfch9emdrV6Do4DSXim+CU54bRdGNEHz0EHFDRzgQoJ/dP6Y8ZXEODTbUfOG9srr
         VNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727431709; x=1728036509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtY7ADSV1p9ieHQKjzd4NTHHqRhBuyONiBpIP65QNEI=;
        b=WmiE/BEU/wo1Zt4oecaLepDocA72o9gpLmC2FfCoB4AHRgOb60JU/B7gU5oh0mio2t
         4TgpKByg1XnZYX99X4gE4Mi40s+Z8KJpsk54cNnn/nIftwv6OC0jfsnADPP92R2JVVj/
         lQuPK8E8kpqKxzYlJ/PK71oizRejlKKDGIF10B0KoY/xLFEb27ENidEdGH7NYuBDmQuP
         XGV/BzbZFzNPwuaM+6mrdkhsbFGRbXLtV8qbM5j5WlshFQuGIV3RCnuVmF3Zmdd4EOJ8
         ciyeKoWQw7hpYPXvtRe0ol/YGxNL+Pb3UHGWwDTs1qUW8ti3N0FZOUav4WDWmIeSm+TD
         CUxg==
X-Gm-Message-State: AOJu0YyNxTKSVO+RiyqjqXXw/tXvVOFx6dgTCVPbRj0Zd2pIj8qlnsZt
	u4sDNJqPezIdHPhelhDFzPsK8HdShwkiC69xgPwHft+ZHqYHlu4aV/uDmLgY
X-Google-Smtp-Source: AGHT+IFjlOomt2Es80EoLGJPkUvdvbcvIhVQZcrhMZRrs1Z4cDRuNJCQUNr3G8QtSYq6ALdysywgxw==
X-Received: by 2002:a05:600c:510e:b0:426:627e:37af with SMTP id 5b1f17b1804b1-42f5840e0bemr17106195e9.3.1727431708806;
        Fri, 27 Sep 2024 03:08:28 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ffb11sm69362755e9.21.2024.09.27.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:08:28 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][meta-oe][PATCH 1/2] Revert "gpsd: make the meta-python dependency conditionally"
Date: Fri, 27 Sep 2024 11:08:21 +0100
Message-ID: <20240927100822.5101-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Sep 2024 10:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112526

This reverts commit eb731aa8660b280a15684dc81954dbcd4d54fdb6.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
index 458aedbf8..f893ac359 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
@@ -27,7 +27,6 @@ CLEANBROKEN = "1"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} usb"
 PACKAGECONFIG[bluez] = "bluez='true',bluez='false',bluez5"
 PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
-PACKAGECONFIG[pyserial] = ",,python3-pyserial"
 PACKAGECONFIG[usb] = "usb='true',usb='false',libusb1"
 EXTRA_OESCONS = " \
     sysroot=${STAGING_DIR_TARGET} \
-- 
2.46.2


