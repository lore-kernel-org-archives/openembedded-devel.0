Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web12.809.1596127485460600437
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2020 09:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=NqX3TZI+;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.171, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f171.google.com with SMTP id b25so29583852ljp.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2020 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xZc+HS7ofpgOaaaca6TGRkHGTCirobdPckW95SSYHQc=;
        b=NqX3TZI+yJZOVMbL0KaBN010vXGxTZLHna0eb+3yI/vHvMbPnZb9zqCvW13WapGBgx
         rX7kB8Kf4jNjaEUV5r3C1xZoLlN2XHsaQOq9W+UTfwHJU/3ABEzGKNK217ohEDHdeVuc
         uNvHXGTm8NvPeMSitSBBmehxXhABlE/MigUU1EW21o6zfzS9Z9yJOtWXiA0CjyKTkaYr
         v4P0X0Ot3iYtLtQg2cwlc2xiHqD5IK6HUjGAL5i6OQrm+Vw+aSy9k5yH/FyryvMAjwff
         fv1oTBXkrL8coAFXVqVb39qiqar2iLVnpnnULQQdxa+lTuJ899kRwrBQ9LXqCwU18K2G
         MNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xZc+HS7ofpgOaaaca6TGRkHGTCirobdPckW95SSYHQc=;
        b=D6RxivGzu4+WGnt1JMphjprEMRgkq6x+6ftROuQZtoCqvpgBw8ktoOhdicIva14p1e
         MH2aytOUBAvVl+Xca+Fo8oz4MgO7l3fXT9VeXLhdha4CoOzMcofY5dVBuOa5OwUXDdqT
         xUK/b8vSyWYv+cZ6PUdKE/Y6IEjB2KI/6x1oLor0w3Ep/YvnswUADoqKYiXthcIgqny1
         XqVfzVkcsgex8giUel1z8FQNKHaE2xBBKkOdjlvtEzYFjRO9wfhpfGyt5hQt2u0GPN4r
         yF7NSHjMrvuS7WMCcammV1Y04kTcEEogCiXvEZ3p6JATrJPhfrahGUizfGWTRTKYhDb8
         2qnQ==
X-Gm-Message-State: AOAM532ITHPKrUMT4GxoJ1pUG/4Een25OLFPWD2nBdu0LM8+434UYvsP
	RUq9F8Jtzg+LjdX9an1GVn61SLFLQ/o=
X-Google-Smtp-Source: ABdhPJxOmTsm5hGpxFSgNXhn8vuu66dK+jfYykBghn3Ke/Hp1UcktRlXvK6V2Z4jPoWbfEDEGyHtPQ==
X-Received: by 2002:a2e:7308:: with SMTP id o8mr66783ljc.414.1596127483070;
        Thu, 30 Jul 2020 09:44:43 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id w29sm1297309lfq.65.2020.07.30.09.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 09:44:42 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] broadcom-bt-firmware: add PE back
Date: Thu, 30 Jul 2020 18:44:39 +0200
Message-Id: <20200730164439.193074-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was mistakenly removed in @77469168db5062.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p2.bb b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p2.bb
index 010bbcb4b..e861ddb72 100644
--- a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p2.bb
+++ b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p2.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.broadcom_bcm20702;md5=c0d5ea0502b00df74173d0f
 SRC_URI = "git://github.com/winterheart/broadcom-bt-firmware.git"
 SRCREV = "1af1116f73782951bd7bbe2139928e497c3a634b"
 
+PE = "1"
+
 S = "${WORKDIR}/git"
 
 inherit allarch
-- 
2.25.1

