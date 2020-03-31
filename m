Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.4699.1585642040276630414
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2020 01:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WDkMBy6s;
 spf=pass (domain: gmail.com, ip: 209.85.167.66, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f66.google.com with SMTP id x200so9354886lff.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2020 01:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NaT2iec02m4ru7uZ8uoelwjRsUfg0Um00L9xc1VcjZU=;
        b=WDkMBy6s3pG9me9R0ZSJz7ydiyb2O+nYk/ECYbcdyA+EE8Ptnw5MffLOHTem4E8MMX
         zXTTlEr8s6H5kaTzCfcraOwNCwnb7b15+INtmRBTOlkArGL7hSHAfbYz2xBdyVObs/EY
         jNtDLPuXorMC8IAYFPPAOeN27/ORaEDOkznjghXJ9zb5Q8Af0cOhAcg7qY9yueC5Vfjl
         LxC/owDKbqSgRvrfj1rdRsHmOxUcxqB+xUBbfv0mLHq5i68Yf7WwupY6HHKkZMjH8XK0
         +TnIKaQRRroCm6fXqasEJoTSlukikjMJDAyZ+n3vDIWQPZTZk8D7M5/3vBhHS7U2A9ng
         80fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NaT2iec02m4ru7uZ8uoelwjRsUfg0Um00L9xc1VcjZU=;
        b=qtc82lC+rjd558hIdfEq7mz39SnRJQYsq6i92k1mQI/Gdyg9+t9juwqYonSbrcsQfA
         IJcBTqlZqRsTJ6sw/NI5VYuYbwr/EbHSpfp1NUK5YnAb+ii8f1HK9J605BXRlsC5UYLd
         PeA1xmcUOFf/r+abEDbO2qmxlBe8yz7QLtlfKpRAu1LpIRppHsgQcHLIz9zOFCIq5Iqm
         /lYDkKx1iFE4I3AKE9IHBHkt+nisofXPhjVcG+5VYnHT9qK4gdQFmBqQ50lidkD9nz59
         bNCxJdDpUpjCrtyTpYg9Pw4OQFYy3ApmFN4m8udMEMmLzoq5qSaWvkZUTpvGVs1H3QNl
         6kWg==
X-Gm-Message-State: AGi0PuYUqD/vA/Ub+l7FjGKUtW0IRPLp2VtNAUftjEHHTZ8b0Ef2t3yw
	mT8p5j4lcj8azR2j44LNcHa+l4Me
X-Google-Smtp-Source: APiQypJO/DOdDGWLWEX+Sw38Dq6R1tbCpiPkjC9Po2z1Xdi0gdrvvtogbVw50u+/0kZQ6Ta/txBMbg==
X-Received: by 2002:ac2:4a88:: with SMTP id l8mr10345483lfp.138.1585642037938;
        Tue, 31 Mar 2020 01:07:17 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id t6sm974641lfb.55.2020.03.31.01.07.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 01:07:17 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java][PATCH] layer.conf: Mark as compatible with dunfell
Date: Tue, 31 Mar 2020 10:07:04 +0200
Message-Id: <20200331080704.947412-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 0ddc5f9..294c319 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
-LAYERSERIES_COMPAT_meta-java = "zeus"
+LAYERSERIES_COMPAT_meta-java = "dunfell"
 LAYERDEPENDS_meta-java += "openembedded-layer"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.25.1

