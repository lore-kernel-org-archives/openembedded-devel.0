Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9788AC46CD4
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 10:40:25 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.144191.1703846422679193843
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 02:40:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fB+VwVAL;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40d5b159350so27122725e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 02:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703846421; x=1704451221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUCokiT5j5bcWKVDmfcL6ein03HpbgRVFH7/bo8MHVg=;
        b=fB+VwVALh0Ney5ZFxATIAEIFN8h+0wupbpCMqN3rGojRv9g9vcR3c+NLbGlMX+RzVm
         82lr0bYXR6IkxgPnrrAyf0O2GX4rNfgxwBQuck71ofP1maK7Pj0L/LQ0JwMx3jo9u5fZ
         gMFEnKstvbv21JiRDIdcgXQ5GyKj/nPGGgnmc1xMrVhADcP38eHJRI5GJFe/n/qqd1Bz
         Ub0fw3kbTRal/onAtmPAeM64dW3M1pfNDJGn3sXIFHplsEhA1GKEt6xBWbUXtNL2L/pd
         +K0tKc2YbTBeaQpMM1qeZA3kvCqlD++lfAcy/oTDmCDacSGab4R0FglQ0H5mGrh3R5CQ
         Yl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703846421; x=1704451221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUCokiT5j5bcWKVDmfcL6ein03HpbgRVFH7/bo8MHVg=;
        b=FTCXnmsfRHKAJsp3C5YUYy2qS3yPB7WsjqqA9La9F+1NlXtdEmV51qWupbnzbQBdj5
         Bf8bTROxZLkh55+FXeeNnSQka9ure19WcThZK5yFxMn9zYPyI+w1x5wqEyF1eQl+cqRy
         waIX0GHggY/pmi3lwK9UzyuNC38v1DVXtRfCgoPVFZAqBBPa0EvHJLX/YyNNRDaOVv2a
         h2dagRAnTUFwsq3pAIyzddAlVnR732d2k9uxy+0HGf2Jy6lB4eBnw8dmc9OD+87u8jI/
         4ZyFiAOgaf+g+aTaT6xMHLjeLl0TiZNXKME1VEHPkS0PS28bWXdb1IyogGH35N/0wPRW
         rHzQ==
X-Gm-Message-State: AOJu0YwFDK+B3dpaGE1htvTiEknp2mv8Agv/+GPt/YoFibUI9kZqCK1l
	DXdnAmqjuZwfiE46X/4cZTsvmiXUtMA=
X-Google-Smtp-Source: AGHT+IGRxxWYvFGk51fCwxWbsNzyZpuhiuS7NRGeRE5TOTYDLixFhDTDxg5o9bDBCJe61jIpzdwJBg==
X-Received: by 2002:a05:600c:358e:b0:40d:5d9a:adc with SMTP id p14-20020a05600c358e00b0040d5d9a0adcmr1823929wmq.11.1703846420903;
        Fri, 29 Dec 2023 02:40:20 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id fb12-20020a05600c520c00b0040d7e8eaecasm719928wmb.24.2023.12.29.02.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 02:40:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperyasinak1@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] driverctl: fix installed-vs-shipped
Date: Fri, 29 Dec 2023 11:40:05 +0100
Message-ID: <20231229104005.1133493-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 10:40:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107877

* introduced in upgrade to 0.115 version:
  https://git.openembedded.org/meta-openembedded/commit/?id=1f2c2ebcbcf5944225462f530e0d56b20f1b4630

* fixes:
ERROR: driverctl-0.115-r0 do_package: QA Issue: driverctl: Files/directories were installed but not shipped in any package:
  /usr/lib/systemd
  /usr/lib/systemd/system
  /usr/lib/systemd/system/driverctl@.service
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
driverctl: 3 installed and not shipped files. [installed-vs-shipped]

  when systemd_system_unitdir isn't subdirectory of libdir, e.g. with multilib using:
  export libdir="/usr/lib64"
  export systemd_system_unitdir="/usr/lib/systemd/system"

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/driverctl/driverctl_0.115.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/driverctl/driverctl_0.115.bb b/meta-oe/recipes-support/driverctl/driverctl_0.115.bb
index d37563eda9..970844f982 100644
--- a/meta-oe/recipes-support/driverctl/driverctl_0.115.bb
+++ b/meta-oe/recipes-support/driverctl/driverctl_0.115.bb
@@ -18,6 +18,9 @@ do_install () {
 	oe_runmake install DESTDIR=${D}
 }
 
-FILES:${PN} += "${libdir}"
-FILES:${PN} += "${datadir}"
+FILES:${PN} += " \
+    ${libdir} \
+    ${datadir} \
+    ${systemd_system_unitdir} \
+"
 
-- 
2.43.0


