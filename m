Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web12.26374.1595757836938154208
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 03:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=sPkSlkPG;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.170, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f170.google.com with SMTP id d17so14148299ljl.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 03:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3P43a8P6THn62eJsLx35iKxw55rqmaNHVw6F8Gaq4yU=;
        b=sPkSlkPGwI8pmJARvIQY444FxEJP9UQKaBZuoRIRcQWdrToASWip1LuF/7z35oB17n
         +4CsjfWFSSmb4Pabm7PcwPMJQqFYlkT3r8IqMQ5l0SUJVWeruFE2RpotkWvE0yD9ifz0
         ympQFca7ZsVj6Dq7lJU2EZNznpfu8EaYNeuyJsp8SCzvGtSDlJmjx5pe5/vPaqICWIPR
         dLdLclGhz5qKAF+Jo7HHab/fFnTccFUKmZXVQtEy3KR0ZkCks0It8zb7udlAVyqOCQ2p
         +25nTxEhV02p+bx8JMGFvpriz1AO2PI+cSC9ipZ6TRHdeOUBdPZxQEWLiKWB9HkgOLZk
         BIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3P43a8P6THn62eJsLx35iKxw55rqmaNHVw6F8Gaq4yU=;
        b=DmZi3DOx4/pZ7VzYxGD7e8jPrgVFJWSf2bsmZrcEpyAqHw9jlznAYDidRtFrC5NC76
         rJQjz0es5M6EEbo+UzToisTxmtXqTljlp/MdYQKhKDksn1u30frxZeiisQ+Y44T/4gM6
         nnvwzF/IOsUVQTSPOklESUlnWdwBL6UXL+v37+gnwY14Gm57SqRxVwUq6euayRnkjDWp
         hh4ZYMIhxzXjssKrY+4ONclPuMV5kbx+enf3OalHJHGbuXtFhk8d5Ubw3URcZWuVoGPv
         dtKSmWMP2nLTZw1LURQrxOSqWPlnXaLhVpSSbTJ2yzV3nlfWoE6ek4FbnHXsIPFVkAAH
         gYSA==
X-Gm-Message-State: AOAM530uZR1Oazfz4dxUZEHAZ0bCV43b+Y4ZZut23MnkpBxD9t1xepZd
	Eqdecs3dQXEF8GnKI9g9shnMWKdXzlM=
X-Google-Smtp-Source: ABdhPJydIQeSBm/jznowJ2Evs5I0rZ1X6kmw8rg450L7JzLa1EASNRtVNEx07YENohWlabrlcIkOWQ==
X-Received: by 2002:a2e:9a82:: with SMTP id p2mr7862128lji.129.1595757834683;
        Sun, 26 Jul 2020 03:03:54 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id e69sm2243995lfd.21.2020.07.26.03.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 03:03:54 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] broadcom-bt-firmware: update to 12.0.1.1105_p2
Date: Sun, 26 Jul 2020 12:03:52 +0200
Message-Id: <20200726100352.3964129-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...firmware_git.bb => broadcom-bt-firmware_12.0.1.1105_p2.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-kernel/broadcom-bt-firmware/{broadcom-bt-firmware_git.bb => broadcom-bt-firmware_12.0.1.1105_p2.bb} (96%)

diff --git a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_git.bb b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p2.bb
similarity index 96%
rename from meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_git.bb
rename to meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p2.bb
index 8c474ecdc4..010bbcb4b4 100644
--- a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_git.bb
+++ b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p2.bb
@@ -10,9 +10,7 @@ NO_GENERIC_LICENSE[Firmware-Broadcom-WIDCOMM] = "LICENSE.broadcom_bcm20702"
 
 LIC_FILES_CHKSUM = "file://LICENSE.broadcom_bcm20702;md5=c0d5ea0502b00df74173d0f8a48b619d"
 SRC_URI = "git://github.com/winterheart/broadcom-bt-firmware.git"
-SRCREV = "c0bd928b8ae5754b6077c99afe6ef5c949a58f32"
-PE = "1"
-PV = "0.0+git${SRCPV}"
+SRCREV = "1af1116f73782951bd7bbe2139928e497c3a634b"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

