Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC762D2C133
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.19548.1730817424617361867
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EEZRtK06;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e35bf59cf6so60231217b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817423; x=1731422223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8lM+9t/CtM5shOqL6PaJtVvkT8dHMglk/gVmXiosjI=;
        b=EEZRtK06UeFXLt0JvxyJSHFqt28K09GG1FzDITxFQBPSYZV6wIfLmhHnQ4k9pKqGLe
         6zXAFQ+z2LaTZJLNzwkz0zUzflzp9Svig9twijnz/brYRMwniydoIa4m1BMURZ+Ciy3d
         iDEArWZhS0+GcDxLj2kxAC33/zMWZslOOMa7EIM9/OZcwkw89tne8LMnvu4EML1aT1gV
         ktIh1e228UHX+jgAKXJCa7V8QWKQwRvqtoh5wSPs/sgwdW6OAHhhU443KUR32dmw81Xm
         K96uAyNRFKPN8u04xCkoRWVf5po4dhP/oYJdcBnv+3W9o/LqcSwx5WRBJaYeviSgBJt/
         NkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817423; x=1731422223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8lM+9t/CtM5shOqL6PaJtVvkT8dHMglk/gVmXiosjI=;
        b=XxfHyvCBDisbkTALeFPGm3kCbP9FFtYxbc1eKRbJh+ppc/LtxPN7n5nqNi0Uq4rmP9
         7exSq0wZXOK/tzTmy+IDqzqW1EjGJlaw+0FDDbtuCoRIiGFZFD9KRqrv4pMxCAY44odw
         5V0XhfZnHRxDO3OIGRjdcmet9cOLqClXg0OQuc5wF1WeUxJsIFO/BSjC1zzXU1WFEqJa
         5eqArkcMfPrPKKx+bwiEskXRWQm4VAV2FKyhTjdBtrfGC/6nj7+cO5VAKwAtjGfbn/Ar
         qM0CCG58xT0wZ6gSqB0raUwLn0PZWr/Ws+xkD5DPG2wLyE2FnaqlCN2Cv1nxbvPk5p0s
         VMNw==
X-Gm-Message-State: AOJu0Yzy+7LKGzFtwRGk2Q4tckV563HjN09kitzlpYwhdageDIfbRZZb
	WUD3FikD4i0bioX/78YbrKNvaXP7jZdVX92xu4H/lkAyVSA1aEGAhdS7ug==
X-Google-Smtp-Source: AGHT+IES+G/fRkbLhWzsJGIB74lKdxoGZVJ9yAvswEMo0Frjl9QM4BteZMT6DcutC+U2qtJ1KYx/nw==
X-Received: by 2002:a05:690c:d18:b0:6db:d02f:b2c4 with SMTP id 00721157ae682-6ea64308628mr131117777b3.7.1730817423646;
        Tue, 05 Nov 2024 06:37:03 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 54/90] Revert "gpsd: make the meta-python dependency conditionally"
Date: Tue,  5 Nov 2024 09:35:19 -0500
Message-ID: <20241105143638.2301245-55-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113472

From: Jose Quaresma <quaresma.jose@gmail.com>

This reverts commit eb731aa8660b280a15684dc81954dbcd4d54fdb6.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
index 458aedbf85..f893ac359b 100644
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
2.43.0


