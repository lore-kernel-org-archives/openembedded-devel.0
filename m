Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 479777F3B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 02:07:11 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id e11so2652180pga.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 19:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=J4Q/TuYqD4APb+2VD80wzBTn/m4jm9dlGiiokvnR12w=;
	b=Kd91gdgCC4I2o/qQQ8rkdC2v9j3E1sSIxD5DmIKdDPHMShrmHSaGrRROmefF3IyAVA
	UAVHLAKd+vSavAMzNg2oqu4JewyaZpMnjO3IKEZmlGdzntFYwbDQgyx484jGJCzZIK07
	suKQd/aF8r8DCxOwoJ0Ai+nYPjEta5Sz+kJwsfVC+XYkSOdu9Fz+t+8SVZj1+dapGJhE
	efKvBMO3b+iSJCw094tjpRAYVLRD+RS9xCiL72PobzENxSpboYULv8/vm5y12O2CCGfm
	YCdedzOYG1piQja56cWYCwWPRU1smbRNpvyFvYHAVbUNRbRpEOiR2NAHzDYIaucgUt9e
	nyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=J4Q/TuYqD4APb+2VD80wzBTn/m4jm9dlGiiokvnR12w=;
	b=jlNmvaxj/5KbkGU7TaODYyFgSRsd9FRknIfqnDagaV07Nmqi+u3bHunWMYrVmJr32A
	Medb8gJ2qINE51ybhAlAH7qTprGHsmbg5dL2teCy/fM7NzO2DoV0I3juYUZ65Ro5XPsS
	PuSY4Ah+RpM75aU4tP0JN50ehKmxtPtObU0ZvGBdS3TLVKfSUGibEoRRP8DIc9OSkD6f
	vi2BA1ClAELw/KsnWuSG051j0CWQOaXPWSyi1RjYPjeXAmA9QTIClcGqGJFawpDCuWQ0
	LPIYwmvdFrd4Da/o2DLialepj42t3WhUSIvR3GXvGqnBz9LUA7x0oie5nvkHULmTKf44
	tGsw==
X-Gm-Message-State: APjAAAXaCRJ2OJ4wat0w/reP8WIrftE9TkMgaxnjQ/WExPiEXpf1cLot
	Phd5HfiTgLEzSPXi4Jmu/IUhv+TY
X-Google-Smtp-Source: APXvYqzWl2kezrN2GolMXFqUhCQ8uoPJluQLuw7XGTui6ayURQ1n7kYaGt7SAqxvCju64BIADJIHaA==
X-Received: by 2002:a65:5342:: with SMTP id w2mr10883077pgr.261.1567130831725; 
	Thu, 29 Aug 2019 19:07:11 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:90d2:579e:19f:13b1])
	by smtp.gmail.com with ESMTPSA id
	c35sm3256653pgl.72.2019.08.29.19.07.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Aug 2019 19:07:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2019 19:07:08 -0700
Message-Id: <1567130828-26806-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [[meta-webserver][warrior]] apache2: upgrade 2.4.39 -> 2.4.41
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Aug 2019 02:07:11 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Security fixes:
  CVE-2019-10081
  CVE-2019-9517
  CVE-2019-10098
  CVE-2019-10092
  CVE-2019-10097
  CVE-2019-10082

See: http://www.apache.org/dist/httpd/CHANGES_2.4.41

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-httpd/apache2/{apache2_2.4.39.bb => apache2_2.4.41.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.39.bb => apache2_2.4.41.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
index 4cdf36c..be9c864 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
@@ -25,8 +25,8 @@ SRC_URI_append_class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d52d0fd0bc788f068e647116c01ddfcd"
-SRC_URI[md5sum] = "930e217ba2d71e708a3f1521ecae7ec0"
-SRC_URI[sha256sum] = "b4ca9d05773aa59b54d66cd8f4744b945289f084d3be17d7981d1783a5decfa2"
+SRC_URI[md5sum] = "dfc674f8f454e3bc2d4ccd73ad3b5f1e"
+SRC_URI[sha256sum] = "133d48298fe5315ae9366a0ec66282fa4040efa5d566174481077ade7d18ea40"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.7.4


