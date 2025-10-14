Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149CBCCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:33:28 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.3495.1760484807518224588
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eTjGFi23;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32ec291a325so4299209a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484807; x=1761089607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxOFw7U2r1tSvSpUN0MIqNOU96qN8776Ow1BtsH+Xck=;
        b=eTjGFi23PoARR8nKGalRXInscaEqFr5/YVr8kHBs+ruts0l8/KG+duYRK/zXuliLO4
         N6c5egPDALCFP8DbdDYeRsFrBVy+tY6KDEvY9zke0nhGCQjKw+InTvBIhnSlEqWrxRhw
         mltUB5W5oiIXOTT/78Yl/oy00DzzEWvb2be6eB9uN/YU5VHwyb7xIYBTHdkNZ9W2wanD
         J4riI2OSE6Rupv4UlOpBMac/o+Cruu2W946O5gMJ42DmBSQR4n7UuVMg/isjPIDLJu7c
         ODihSDCNXcIALPP+tn+o724AtWTU8xLMicLzACcZn6tjafGvVNGy/AcvuXBxZUS7brMW
         +NUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484807; x=1761089607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxOFw7U2r1tSvSpUN0MIqNOU96qN8776Ow1BtsH+Xck=;
        b=JnVU49JJEsjJ/hAmd6o2xibJ41DmMtyL6xLRdOyaxmJP3ReHJEW4axb2FXef4nDUbP
         oxGOgPUaPlTaiAWwwH/ipHuSQUz1WTrKhMn3xcGqXGhD0zPx4AXhRIZnke3BzP4OMcI9
         Rp/X06rkbt3d6Xaug74utDbl3TjXYU9jGSZiE+KKQM2AQNkIVf9izVKA0XF8EMlMfvvd
         fkagSf7TYKc97W+pXK/UqKGxOhT0qtzs836wZqUx8yc9LQ9JTysVdrJFoqIFTEwZQZ0/
         xdhU7JZefS8KKwMo0jj+2m00hNRX0MGD7lwKT1GKNMe3WjCf8KDVKbtkXYK3uXbYcvHi
         sPlw==
X-Gm-Message-State: AOJu0YxH3N+S3m001qjQVrR++Icoi8z0ZG98ru5mg1X4LGkj7A5BUWte
	c8eJ4NFpnfWQk5SNvmd7sPAYiGqapEtMXQ6MHLaXJdBSMeEWmD1BjlQf7E7TSA==
X-Gm-Gg: ASbGnctwg3YwVlPc1XFkRqR2M+V/PNeyVuyHyEOhi/Aw9wUrO5KQeTgFzEnVipIKgTC
	E5TAQZrPqMv5eJHGmwVdwgQDQ2nORhGEXhpKcKFZ02SOg11m2RvyJlPczgZkDpOcgAaqbVmgixD
	HlNBg8Ya2MsbkWTu8jjHDJaXpAIEzaM8RH/H4xkliaLsMMUlSJmM6zFQdK0Gy9gReO+fFOUcjdF
	v5ntwajHcSsnyhwEnKb/iIGWPZ3vJO+o4PAj+gGc/kw+bL9lbOtSUkTBqAyi1lQJezxYqsagXra
	Wz87aNBfVpNmfa5jJADxraDqmmJg/xrPDmz/xjl8/5t+3TFMBWAvl68E2Q7dCBDhGlR2UMgOgrz
	dIGYHsCISkCD9t4LG2aZRGf623UlpJenHlY0EbcQJxyQ3F1ctKgPc+hM=
X-Google-Smtp-Source: AGHT+IHQPyXI3Dc27bMogFf//rLXCGWeiwpNGK1Ku/WNrGTQ2vSHMQPWONojKA5vh42YYBIFOB9PJg==
X-Received: by 2002:a17:90b:3b46:b0:32e:d9db:7a86 with SMTP id 98e67ed59e1d1-33b510ff4acmr40566125a91.7.1760484806770;
        Tue, 14 Oct 2025 16:33:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:33:26 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 16/18] influxdb: Do not remove non-existing files
Date: Wed, 15 Oct 2025 12:32:27 +1300
Message-ID: <20251014233233.304125-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120675

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cd6e2d8f53b45108ae9aa7b2a2988452dff4a2eb)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index 5301071516..836736dd8c 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -38,9 +38,10 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system -d /var/lib/influxdb -m -s /bin/nologin influxdb"
 
 do_install:prepend() {
-    rm ${B}/src/${GO_IMPORT}/build.py
-    rm ${B}/src/${GO_IMPORT}/build.sh
-    rm ${B}/src/${GO_IMPORT}/Dockerfile*
+    test -e ${B}/src/${GO_IMPORT}/build.py && rm ${B}/src/${GO_IMPORT}/build.py 
+    test -e ${B}/src/${GO_IMPORT}/build.sh && rm ${B}/src/${GO_IMPORT}/build.sh
+    rm -rf ${B}/src/${GO_IMPORT}/Dockerfile*
+
     sed -i -e "s#usr/bin/sh#bin/sh#g" ${B}/src/${GO_IMPORT}/scripts/ci/run_perftest.sh
 }
 

