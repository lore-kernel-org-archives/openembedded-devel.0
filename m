Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.3727.1589499288018753249
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2020 16:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KGzfBCCo;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id m12so281188wmc.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2020 16:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+/GLeoocWG7czwEyKzmoSRUfbe9z/6o/+5n2zrHzDy4=;
        b=KGzfBCCowaCCEHoBJjD7/2yiT2ELw/qWBmdZ0u9GNGJEdbtmuAq81QW/Cdejqlck+E
         tScaX6oeRB+yiv9VIGSB9K3ue57cI0CL8IJXL3pdi2Jq/RcpThlwyuI1B6LlPSXprCDU
         HSDIfOnojMcLse0cJtuuCuwNNH/ckSt0gqwzCcgY387Aqo4R2bUxHL0g1jXZu+wOMD0L
         rooPRXbUIrVwIKXbaeml3PNWuuYbDs60c9kuJTwMYxQSVHUUW2HzO+guzu7vWTbFcC1k
         kG+IMbDvBhTXIVYzUCyGdzpTzwxmIBqmoH/Ios7083Q4AseFKr7crPTDrixkOtp3EJzT
         yfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+/GLeoocWG7czwEyKzmoSRUfbe9z/6o/+5n2zrHzDy4=;
        b=nwtfS+YLZXMWNweOfoKXF4RcCeav4GaS8niAcDsY4CsIFDCbgEdOtv3fcJrLZ0zMBz
         myWa5agkrcTdw+Y71QKPqsrJ6Dox9DDe9fEsPiJuAIdEdU/SlEEF2BpvuMXjG8WJI4gj
         m8lnY3bGO3z94XQCpFQQ9yi/EyWZeGMJIZ5zxwpA/udpAVHTjHJB5QOxGvZZPfTxeEUJ
         EhCSGNtYYztKWdZ4XIIoS0UDRBpg48XcTWOFn+FlzK3GwAmyzYDqJAHHwDp3F+dbhIr6
         hbUJ8rc34xlgKQ+FIcEKcxAHsoGekiExWrzTWyFnVljSYjt5e/Mu+9vx85ED0bxm9hXp
         xVTw==
X-Gm-Message-State: AOAM531w54w7CnSYcK52zD9K040cbOhPqX/VFgrx24ElP2pNdMW7NJV5
	kC4VDdfYt+bUp90efaakhccQyy/8
X-Google-Smtp-Source: ABdhPJzqChYMMh0mChnLhUWN4OFhHUZigO//Mlttn5gQwoRRuRxCei5HT4ZAOzkGb5auxUxnmN0yOw==
X-Received: by 2002:a05:600c:2257:: with SMTP id a23mr816517wmm.13.1589499286114;
        Thu, 14 May 2020 16:34:46 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F1074089F8D2D2EF5A696D9.dip0.t-ipconnect.de. [2003:f0:7f10:7408:9f8d:2d2e:f5a6:96d9])
        by smtp.gmail.com with ESMTPSA id a205sm956822wmf.33.2020.05.14.16.34.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 16:34:45 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] hidapi: upgrade 0.7.99+ -> 0.9.0
Date: Fri, 15 May 2020 01:34:35 +0200
Message-Id: <20200514233435.9551-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200514233435.9551-1-schnitzeltony@gmail.com>
References: <20200514233435.9551-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/hidapi/hidapi_git.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/hidapi/hidapi_git.bb b/meta-oe/recipes-support/hidapi/hidapi_git.bb
index a34797ff5..5afc4596e 100644
--- a/meta-oe/recipes-support/hidapi/hidapi_git.bb
+++ b/meta-oe/recipes-support/hidapi/hidapi_git.bb
@@ -1,15 +1,16 @@
-SUMMARY = "Multi-platform library to interface with USB and Bluetooth HID-Class devices"
+SUMMARY = "A Simple library for communicating with USB and Bluetooth HID devices"
 AUTHOR = "Alan Ott"
 HOMEPAGE = "http://www.signal11.us/oss/hidapi/"
 SECTION = "libs"
+
 LICENSE = "BSD-3-Clause | GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077"
+
 DEPENDS = "libusb udev"
-PV = "0.7.99+0.8.0-rc1+git${SRCPV}"
 
-SRCREV = "d17db57b9d4354752e0af42f5f33007a42ef2906"
-SRC_URI = "git://github.com/signal11/hidapi.git"
+inherit autotools pkgconfig
 
+SRC_URI = "git://github.com/libusb/hidapi.git;protocol=https"
+PV = "0.9.0"
+SRCREV = "7da5cc91fc0d2dbe4df4f08cd31f6ca1a262418f"
 S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-- 
2.21.1

