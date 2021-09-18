Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.1895.1631989624141178498
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 11:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L3IAfEaM;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso12297036pjh.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 11:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wN9L3e9h/6pGPmMAvKQKZdhc3d1LXcijAQDSleqUE9k=;
        b=L3IAfEaMjzpTeuZpqc+jSlCTCXmKliyNtUxl289amfPW8LYkOQDSV/aYupTExvwm9o
         1AkuBc+UtfUKAXTeD5mPhmvrL1k+bTW13aIMfSXBnk7kKO53fwKftaPJgvn03pv+dmxU
         bjFKhn7k3DjJMvRt8qOimbF1oKzIu+1QYfjAhUgOcSbKjkbk4FApIRWznpnDXbxY9E0l
         Ss0utw7FucDc3D2O1+zGNsKh4eBOJPoigW5vOxCRX/05gtSIz2+Tp7Kun3/9wK39tNkb
         KQN7a0tg7uP9d+N84N3Q3YAT02qtHOsb7OGFYvg2SIv5WpeB1c7qix0KoK7gR3Pf09Yr
         gbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wN9L3e9h/6pGPmMAvKQKZdhc3d1LXcijAQDSleqUE9k=;
        b=Kgo9Lz16y+Z4j5HHaEx8NeDu7pUUAW0pBYquTIpjfktf9GE/BUZHyj42XX9Osse0NB
         6geA6sBHmufPNp0zeADCQ0JUPOaxYJ3AHXYFEhDO2Ue5/9WFtxG4Wz4i9PO9JtK6L66p
         10h6sXg3JwHCWEbEXixusDXABMMCCzeZwFSkrHbxpyicXOALdESkqSkEpM0MlfF2GfkJ
         wROZT/M2voBlEWFBFR1mfpz+vbd2Y/CulooShzGnm5G5aPI6uq1J74pf3pl5bWKvKQ1i
         BsANFB3QPX6+I4WA4evTLo8PYGlBNJYtL0ZUqJncb+wk7kRha0c7bPKnhRzeWziNW0ix
         hRYQ==
X-Gm-Message-State: AOAM531RlGc7oOsA/qC+WDcHhrSulvQyluN/LmvAyhX+oT1t2p+XJzEt
	KCSmcpx56g7/NXalsN8sblzlRWdHk/k=
X-Google-Smtp-Source: ABdhPJypkN4tS+CXEbpm0H3y/aStxv9R2YxUdOGf6MrB9/I1igyygcA4XyP8opZKaQvMpNdVpEaJiA==
X-Received: by 2002:a17:90b:1b0b:: with SMTP id nu11mr28655695pjb.74.1631989623224;
        Sat, 18 Sep 2021 11:27:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id s9sm9192143pfu.129.2021.09.18.11.27.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 11:27:02 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][v2][PATCH] python3-flask-bootstrap: Update LICENSES
Date: Sat, 18 Sep 2021 11:27:01 -0700
Message-Id: <20210918182701.3684526-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Missing MIT and Apache 2-0...

Signed-off-by: Armin Kuster <akuster808@gmail.com>

--
v2]
Too many 'ands'
---
 meta-python/recipes-devtools/python/python-flask-bootstrap.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap.inc b/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
index 688622afa6..1a729c975b 100644
--- a/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
+++ b/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "An extension that includes Bootstrap in your project, without any boilerplate code."
-LICENSE = "BSD"
+LICENSE = "Apache-2.0 & MIT & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a210619"
 
 SRC_URI[md5sum] = "e40d50f5c5b6438c1c6200a6f2871f81"
-- 
2.25.1

