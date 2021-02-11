Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web08.1671.1613001928717529963
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 16:05:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=KXflzkDC;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.66, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f66.google.com with SMTP id d3so5566760lfg.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 16:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GYYVgdm39ojc6F0KDRYBsrbMz9jBaEX0z7nCCUEkMIo=;
        b=KXflzkDCGyTnLZ9hzTXUXklt2bvwLnEPcAaK6kT7Ae5A795r6n5G7mjD/Sv7hv5pSp
         +/9zE9mg3duAvdPxnPWYw1YwgHg8KIMPjQQo0Id48Hwjsn14baaY1sVueuLGnHX/NlLL
         e8rjfXhkpE1F+Bf1SGS2nhj0CROeNaH0j0kJNtV2f3+ps0OGijyESBkrTuQmcZSK5skM
         V54MoqI7sjJlvPL0micbmnH6Enls0C1MgRvjzfetDsY+vEusNErNMcq14KmBXW1dkdu5
         FN6wQTJBzHBC8kcRatJuPFU5xSIfv8Hac5dKvs5hZyvCgizj2FE7TZDmA9doMGduKtZk
         jyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GYYVgdm39ojc6F0KDRYBsrbMz9jBaEX0z7nCCUEkMIo=;
        b=TJbgnQicxGoO1aWe7Y7L0a6OvyHmSHqy++NRK3GABHhd8TYebO9gpjxbHet5QX7mrk
         UGplVFPsKZmwH7lG2pdKZUYdrgEoDzlNpzVgnSbJUS4zHhcnC7UTDbYBzYAZtI6Fb5qb
         3tz06bnBkFtseRgV5MLm89tbRMbwcOpG9FQY+lHZNq8JXR7tn2aSaPNwGSkl4X/zEA5R
         8c6PbEMjfi6LWReBs6qN3eUyV6QBmMjur6ki/1nZuMEdXt61TK8dEq1K27mBDJ/DRSJc
         WRhSwzZUF/Kg+FZIA0NTPyfTliS+A7Sa3EPlm0lvRg09yVRTEC/GYPpVbyn9YRofnpAB
         DQJg==
X-Gm-Message-State: AOAM530ULKGE6iHdgdzWd2JGK9qIhsm1PPXXzdgsQ+OSC/Nh9x8VChi0
	Y22HDANPATxhppGpijY5K3eT0fZYCdbxMin7
X-Google-Smtp-Source: ABdhPJxVe09/yuQ4W3wnpJhg58pJxMMarN4evJHRZkS/GO9rMP980VJVSaUYM+D+juIhlpxhdGwGfQ==
X-Received: by 2002:a05:6512:3184:: with SMTP id i4mr3035164lfe.314.1613001926532;
        Wed, 10 Feb 2021 16:05:26 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id c78sm487051lfd.120.2021.02.10.16.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 16:05:26 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python[PATCH] python3-pykickstart: update to 3.32
Date: Thu, 11 Feb 2021 01:05:24 +0100
Message-Id: <20210211000524.1922826-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...{python3-pykickstart_3.26.bb => python3-pykickstart_3.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.26.bb => python3-pykickstart_3.32.bb} (94%)

diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
similarity index 94%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
index 7aeb5d6c9..62d2729dc 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
            "
-SRCREV = "4c93e84c8798da511da1c05f1912d2f908f8f85f"
+SRCREV = "c56a5fbdd4079b187b21787f072ccc83dc09c28c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
-- 
2.25.1

