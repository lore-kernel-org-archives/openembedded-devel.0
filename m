Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26ABC77B7A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 13:31:42 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.21851.1684243898061072827
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 May 2023 06:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YFvjyRp1;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ad9f2926adso98764771fa.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684243896; x=1686835896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CdXDuINXjW0pLehcIc15Nj/wePVvcRvBEz4V4Z7ugEw=;
        b=YFvjyRp10ufRXIw4yLDWYV/pqMs4LcisNGLzROLxfLYyhIlbojg3YY0TFoA0K5Fd8P
         LXDYqV027WqIxm6KB+ZlLiUV8DN2EaXqEaR7JFyleX5PLg/JiOcQuRza0pK4REXOQk8x
         gNo9W2exnFiiGSko3VhPmzIfe7tl/dRUK397yJN+HJ77npK4fhSaXSEpJWyp/p3XBb4R
         4LEj9Hd4tJ0LjxCn132vuGOdMTo48gVIR/YbuFgcsM8WfMmW51pA5+Nb6nKB4ciGBxBQ
         TSEjxpMhp47qUEYazARFPLY7AKrxJiBEYFFnXoIojipGUIsZjxBnm7a46OPIldCPN91W
         fcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684243896; x=1686835896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdXDuINXjW0pLehcIc15Nj/wePVvcRvBEz4V4Z7ugEw=;
        b=ChxEEhaafIjKHv/YDSuzCZ5YkP4AhPIBkLSk3IPW/57pv+he8PQQC946WR6loeRW6i
         t/LKf7pTh4+YIL48C6Ym9CKBGk10s8rILoGvPg7H66FqMpuY31PSgFOuF+aUdev15i7f
         1J8lduLvf8bvbJJzlCRPq3+j4k/mKY7D0u6OCDQgyfki3yUoZa7uQgqf2gpnBeWKhQtv
         XYBkwmEMIlLJqLJ7j/5z/aXqOD2F8P9qkQFN4CCEbkFqz14M14QRpgt8f46K0T/ruYnl
         IeIQM0yH/GCE+h1SUO29eScVCDs3RX/ADPjbCJs/plQNQl+OpMBgM6b4iYX2AFHsX0m8
         0JPw==
X-Gm-Message-State: AC+VfDxnDynwmuXER8szoOnwsxJVkZ/adIg+XeZZHVK/pqD08CxIWOId
	9B5vw6MG71ozuhzPwPc71f+e726d42s=
X-Google-Smtp-Source: ACHHUZ7Ct1udGoo1UtKJWTX/YkegA/7dUTPnUvaeM1cLGekLFgFcb9U5yduUrCewqXtnhs/cj3BEgw==
X-Received: by 2002:a2e:9916:0:b0:2ac:689e:241b with SMTP id v22-20020a2e9916000000b002ac689e241bmr8922288lji.47.1684243895686;
        Tue, 16 May 2023 06:31:35 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com ([2a00:801:7ac:9fa0:5593:5e7e:494a:e2c8])
        by smtp.gmail.com with ESMTPSA id w8-20020a2e9588000000b002a77583b718sm4122170ljh.12.2023.05.16.06.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 06:31:35 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH] libusbgx: check scripts in /etc/usbgx.d
Date: Tue, 16 May 2023 15:32:57 +0200
Message-Id: <20230516133257.2072092-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 13:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102629

From: Ming Liu <liu.ming50@gmail.com>

Sometimes an end user might want to change some values in
/sys/kernel/config/usb_gadget/ at runtime, for instance, a product id
or serial number must be read from /proc/device-tree, and so on.

Support that by letting gadget-start run all scripts in /etc/usbgx.d
after importing the schemas.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-oe/recipes-support/libusbgx/libusbgx/gadget-start | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
index 9e22671a9..e80cb2c34 100755
--- a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
+++ b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
@@ -6,6 +6,10 @@ for i in $IMPORT_SCHEMAS; do
     /usr/bin/gadget-import "$i" /etc/usbgx/"$i".schema
 done
 
+for script in $(find -L /etc/usbgx.d -type f -exec test -e {} \; -print 2>/dev/null); do
+    $script
+done
+
 for i in $ENABLED_SCHEMAS; do
     configured_udc=$(eval 'echo ${UDC_FOR_SCHEMA_'"$i"'}')
     if [ -n "${configured_udc}" ] && [ -e "/sys/class/udc/${configured_udc}" ]; then
-- 
2.25.1


