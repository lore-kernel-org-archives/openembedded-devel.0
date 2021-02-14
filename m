Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web12.11688.1613265573173112632
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Feb 2021 17:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=tkuOhxIy;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.67, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f67.google.com with SMTP id d3so5064104lfg.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Feb 2021 17:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GYYVgdm39ojc6F0KDRYBsrbMz9jBaEX0z7nCCUEkMIo=;
        b=tkuOhxIyS35eydF3EaOOOhwscKxFSa+ulP9Ywfvr1VuOfHQUGEOZP0t7nhivLo/ypI
         MI481NEOOBZquVd5iG1laZr3GEgbhXBriOQnFbsAbfnz2ybRSinu/1BO/2TV2+z72/4q
         sVuQm57zFTJ4rGdbY2RPw3iMNVSTZ2eOL9xazyGrxaYzw3HX3KkOuIY3Scsyx9157qlF
         LLxt5EiUpo7UWkrDwIGSZ4DRtoHS9TXQFtuLJdmv/+BJGmwZDwPnJzYpTFW0zin+N0vP
         nwT0ivmBsWcVIhmu4BaEoQ3/2zA+QzpJn4ylxu4T8N/U0nRxhc/U5O2bB/xWvY/NtRRG
         d4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GYYVgdm39ojc6F0KDRYBsrbMz9jBaEX0z7nCCUEkMIo=;
        b=ftH+Vs/6XaiVrQhom1HX2UMV6/9Pzw+MI7gXf3LmDVWc/rDOVrUNG4157fX8ffrdds
         Z6uIw7FOIdJQQJUvfYfe5DnVcDBLQ0pAqPt/3xxSxLiSoyNVTsaUcgpIlU6xI25ogn1y
         KfFGD1I4HGFW+GefGSyPKIlcYxQdn71KuQtURtHaljJhJQrRYrHJxnQltUr0jQRiB7LY
         zFFx40YIMJH+1YnGJHFIigO8/RsOCGN4OFyoeNnzsIALOX8t2xG3oTXwSc5cVoUziOYR
         +xc5/OHkpb3wp45rbenAc43yZfrEkriYYFBensJRNb1mSONYCyDDLhwzJDdH88JKJp5t
         pttg==
X-Gm-Message-State: AOAM533cl43erNBQialyy97v9SUsp5ukdAvexQzxRRMxUeyPXnl8gSLY
	5OnbLZ3RurW2EqcLV/NvfCwstNVk0bFuKSXX
X-Google-Smtp-Source: ABdhPJzogqEOkqeWvZ3aXU0fh3NKGdSz9lUyl2JdJiH5gi6ZzMejfGxTA91y+lx7sWkhOuPZHDNuGA==
X-Received: by 2002:ac2:42d5:: with SMTP id n21mr5332477lfl.154.1613265571197;
        Sat, 13 Feb 2021 17:19:31 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id r13sm697729lfc.262.2021.02.13.17.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 17:19:30 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pykickstart: update to 3.32
Date: Sun, 14 Feb 2021 02:19:29 +0100
Message-Id: <20210214011929.447131-1-open.source@oleksandr-kravchuk.com>
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

