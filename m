Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.1164.1615568943867604476
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 09:09:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=0yLV0+Q/;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.45, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f45.google.com with SMTP id q25so46865627lfc.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 09:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LJwZefknSAHk8l+4882bbP6FxZrPC1PVxa6HxgJkRUI=;
        b=0yLV0+Q/ObP7hOq616TQVLLL8Oq7YRWlRlpPvYEb9UcRV35ZszV+mZ4WijetbiaOXA
         4k0Z6krsGz6fcjnws74PHi/wMo4GW+OWlLsDevuALSPqSuswKtxK+stmfnboB3D0V1uA
         54EqjTQ9Gm8UEscPY/hdr5uZKel/c/YcWVCr9Orn1Y6gKBJfWRU2KwlPQHI+kMAnE1p/
         c/ybPEcpq+uA2aDHDLr5gs2QQW+Hbm8YYdVby6i4ZnBf7J+fs6ddw51cksBUOSc7xTSJ
         ewlEA9nbqACKzeUkjf+40fRAO8tCfAoj6e6tm9PTeBscqXwmER154IYtInr09erFSoVB
         lyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LJwZefknSAHk8l+4882bbP6FxZrPC1PVxa6HxgJkRUI=;
        b=gfv4DA85hhPvfB5Wi4U74Uwo6SMwgKaxAnshVIBlgK/Wxj3beZweoSaYgHfd3d708y
         3ACjyHsgvuauU7TsEfhN2iU6g2V1W0P/zCJZvvGiXLxsFBtXc7JU3ymznDtT8vQfZ1Ly
         fyIljUUsuSqFFo5+EgC5zmiz5QTWjGO6AeDobOxFoLRxFYND/4BM+1FKo/GZ/qZw0YgR
         Hn3KQ6GH4UxKpC6GB3oqjvn8LWuZPUXs9PIbZBk0JB272KqN41WyGKAAOTB+SG7vz+Zd
         n74zSmIY4LRVXrl0IkJmkgMPFZOXDgD4S7DPIM2+iATWG16isTBg0wACm6X4f9GJqBqG
         9gbg==
X-Gm-Message-State: AOAM532Q4Z4xa370lH6aiRXzgRqbM+Cu+nFNSVYfrnRsCaHzhLJQ9yJN
	yBo/pRlJCY4uQ3NQkGGYMJ6PdXPWY3kiJaMk
X-Google-Smtp-Source: ABdhPJwb+vM9Ts+FpUStaebgmTABlMcbu9PN6yV6US2Iota5xlfmXoCODonUkuLo42q78573YcDwVg==
X-Received: by 2002:a19:6c6:: with SMTP id 189mr142531lfg.426.1615568941650;
        Fri, 12 Mar 2021 09:09:01 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id j28sm1753353lfh.156.2021.03.12.09.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:08:51 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-waitress: update to 2.0.0
Date: Fri, 12 Mar 2021 18:08:28 +0100
Message-Id: <20210312170828.567455-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-waitress_1.4.4.bb => python3-waitress_2.0.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-waitress_1.4.4.bb => python3-waitress_2.0.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb b/meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
rename to meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
index 3e207de4f..490dcee6c 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
@@ -6,7 +6,6 @@ SECTION = "devel/python"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
-SRC_URI[md5sum] = "079c3c4902b1cb5d0a917276ee70f1df"
-SRC_URI[sha256sum] = "1bb436508a7487ac6cb097ae7a7fe5413aefca610550baf58f0940e51ecfb261"
+SRC_URI[sha256sum] = "69e1f242c7f80273490d3403c3976f3ac3b26e289856936d1f620ed48f321897"
 
 inherit setuptools3 pypi
-- 
2.25.1

