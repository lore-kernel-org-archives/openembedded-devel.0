Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web08.963.1612378688690834405
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 10:58:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=srEEZ/fY;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.66, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f66.google.com with SMTP id q12so648939lfo.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Feb 2021 10:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yo27TnSt08YA7FxSEK0X7H18YCPpOZPrLGXmV1T/s04=;
        b=srEEZ/fYtrtQ6lmzjmHCVGKhrpREvtMfsZQh9JbivU9dz0gPegZFHXau8i4Iam3hzC
         w747jYsmhWoxWmDFagdkSTDwGqcSSX/hS5q20oI7cgeO+R70mYVv7LBGkBKTz7DHKCYB
         BgLHQku7s0PjRFxuuy1K+bHfcjASRl2CMSTIP84zpbJGdBdtMyenHHUqam/dY0qmU4VR
         suwCWX2404F04DkWIivAZeOwsV4Y4wcHGS2M2v6tJSUQxZQ69OIBoTlAIDkoLp5eMPy5
         xNxhKdTulBLWFJVOcuNSBkUMwUHYjxLMusAErI9cwszbUZReH0zRHEYHzKDZOtmkusub
         dfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yo27TnSt08YA7FxSEK0X7H18YCPpOZPrLGXmV1T/s04=;
        b=dlzW4Qa8oiBktKRhuItYx1NyWGFjGuVJj2E3KwTpcOQi6BKJSQkVZLj6iNt8v/q7Vs
         udjzxVpGIXtELDXfx3IZlBidw0h/WUfEQryj0KSu0HadlqZfFaahwOGWU8DY4nu8P2vn
         jDf0y5lCpImNX2kl4xdrKKRdeQvyEt7YSV50t2DTwG1uRqa2Mqsoy6y8r8KStw6Gg3Z6
         TDYSgnxe/i+Sbec+XSoc5QQi0ST5Qdn3zTyylppC3SyplZmxAW78AW214EDwsBrEFs8Q
         cFLKMfE4EDvjvzab0iutNroE/Ke3iHKD2nK+WXyzIEWpj/RNxHzhtmvQvT5UpA3dIfZh
         rtAw==
X-Gm-Message-State: AOAM530QYqofrVCOUlppExNbDsmSD6WdwH/EKD+bUjAthYC5KE9wSlsb
	3aNIbXxjJIxJZYmx+e3Y7xybxBaod+BYV+t4
X-Google-Smtp-Source: ABdhPJwFfAB56DBhGg9l3JVvE8MqAhMrVu9zLfo1ZQ6G02UzKDJRyPoy3Ojo5CJPZh/WhLVtSjUxKA==
X-Received: by 2002:ac2:592b:: with SMTP id v11mr2408435lfi.512.1612378686337;
        Wed, 03 Feb 2021 10:58:06 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id y23sm320435lfy.158.2021.02.03.10.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 10:58:05 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] iwd: update to 1.11
Date: Wed,  3 Feb 2021 19:58:03 +0100
Message-Id: <20210203185803.1413539-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
- Add support for ACD client for static configuration
- Add support for intelligent scan of all frequencies

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.10.bb => iwd_1.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.10.bb => iwd_1.11.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.10.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.11.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.10.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.11.bb
index b2495348f..f4a237e03 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.10.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.11.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 DEPENDS = "ell"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
-SRCREV = "d8dc5a9bd19c5b98d8692801d3cf4e8af495930a"
+SRCREV = "355c2df97e1adfdaee4a67c1705bd76202384687"
 S = "${WORKDIR}/git"
 
 inherit autotools manpages pkgconfig python3native systemd
-- 
2.25.1

