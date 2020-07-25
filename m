Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.7191.1595671651395626914
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 03:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=o+VWt9M6;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.49, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f49.google.com with SMTP id v15so1958478lfg.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 03:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1uA+FN3kP0xO8aaugnPp+0+sz4fdpdg27N09EeimN4Q=;
        b=o+VWt9M6vWOzc9j82Gpz0ADgi3xeUcJteaYoBYEuho7GTYzZ9nZGMWBZEVNL0SFx+j
         0aC/oRrxZCy4S/m7Nnd7RAWP03jL0hJChS4APuugqilU9yzxINMKUMP33S31ROfizb2Y
         gE51BgitvYRhMlngw5JVVwWPX/wwjZtWB3V4gtYGlaqqpU9SrkJ3VW7PiF95+kv/h5uH
         qjcSYWsSIkmXopgoSGCCoH4XcilmCBT6YaDgnjMdTVrGOUGj6k+/wTeIqJoEatuZx/OW
         wDuMtRddp8LLzTUvIUyPDMi++dDvzuJQXlWUuKBv2BrToMSEGW8LhgtLjVySsV4dFh9u
         XjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1uA+FN3kP0xO8aaugnPp+0+sz4fdpdg27N09EeimN4Q=;
        b=RfJo+fEukXEihl/tGBDJBhCt9BjfsPaf0jFWaGuCqxwFJ1k2QOAJoPLmSyz2sVsso2
         29lenL2VQq9KYDb6D1l1W5Vb6YwwaYHD5QXEF6FFzGNZay5Z73Vi7msFcBzXXZb4W3aR
         BpvDgzaergcrd1+AwxHKrvmFQVO4MJzZv/f63E6eMqd9PQ9z6HiBgTW7jsxBL++k6Av4
         cyr2UeNQQHViKVbsYWgc45zXKSCOkqalJYSjaQdrHGVdxfAmtIsc0MrcEDnlh7veBxms
         xug3p0A+7Md4ieS29seB6/kvW62PmXLz+G83qWFPxsOXe+AGHPeiEtmkUstzun2gzQMQ
         k/ZQ==
X-Gm-Message-State: AOAM533ui3uN73qMPPq7MrkPrv4hUo9K54S9joMZ8FNvZv5ti+RE1PGI
	im0EjWuQQvk4/lplhvZp6TMOQtmp0fs=
X-Google-Smtp-Source: ABdhPJxJW/HUBLOFqkPyu4RyO4EVTTx/mbzgdZlIiogWHpWEr0Qzgx29sA+axwV+lN6aUXu936SZaA==
X-Received: by 2002:a19:4910:: with SMTP id w16mr7197582lfa.161.1595671648954;
        Sat, 25 Jul 2020 03:07:28 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id m27sm1162459lfq.19.2020.07.25.03.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 03:07:28 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] iwd: update to 1.8
Date: Sat, 25 Jul 2020 12:07:25 +0200
Message-Id: <20200725100725.1929872-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
- Fix issue with handling FT AKMs when not supported.
- Fix issue with handling FILS and RSNE in authenticate.
- Fix issue with handling auto-connection and quick scan.
- Fix issue with sending multiple scan requests.
- Add support for P2P feature and API.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.7.bb => iwd_1.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.7.bb => iwd_1.8.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.7.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.7.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
index 4911b3d803..bfbf3c7fa6 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.7.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 DEPENDS = "ell"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
-SRCREV = "ef6084dcb4fe2e00327bb9c7b113ece204042c22"
+SRCREV = "a01754f56aacdc641c819f983c3c0ad374be77b2"
 S = "${WORKDIR}/git"
 
 inherit autotools manpages pkgconfig python3native systemd
-- 
2.25.1

