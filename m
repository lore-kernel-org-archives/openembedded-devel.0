Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B338EC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 18:56:08 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.48238.1745348159879546188
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 11:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KpwtCJPR;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acbb85ce788so363535066b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 11:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745348158; x=1745952958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m487mYpKSDsSo69vA/BQHhgSG6INN5UWzd/Uh7cxCSc=;
        b=KpwtCJPRKVHEbZetz+uyYCPx3Zh+hOoHyrVm9CGN1lWFDrFL+8HW+n1j7dP+XIqbPC
         EgsSdLHh+CKmbJANyKEV2nKwnMwoIhG0orF57eQCRYEgJlZae8aeZRo0TVsu5D/eaCuI
         zI0IMlMDstAZeVzXYudj4Nkf7SwA6M4Rdexgnf9dZBLfuMsVIv2WQ66EmWgsgyVVsoub
         un+EhT7wnNTcQi2oBj4eCfPCzjgJ8HIkvJVtrdmrcq46gbn4E8T46KdARZSOGgJhV3Zm
         t6J2NDzvr4EKBw2Lhs84v+q3d2xc6vxiEhlvdpvElG3VktHCQBpw4z+lB180nrGhjSpq
         lWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745348158; x=1745952958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m487mYpKSDsSo69vA/BQHhgSG6INN5UWzd/Uh7cxCSc=;
        b=s5RF4+PoTwXVy8Q3NcgTg4t74U6LBXWCsiCScIDaN/PtyK3tax3bzl7RFblBLs9dTS
         2MLUAyYfz5+6rnxQItUzUT/JQzgu6lZ7vfUXDDGKGC1NjO9vCRjxcJgsz4sAZMphgvzK
         gwMnP7q9Hg3SkeK6BYrNdvtv2AtygFq9YbyCI3KekcoJIL2IjdXsjRyyTVs07QaCGHk4
         BDs+J2gAmu3YQTM4i+jSyWviFV+uBzz1/7fe3lkdr6ehLuWBzyAKbfRGZIrm87WgllW6
         CAdbPZg5FEm/mjvrpQlQsHbti7uDxFPbcL+rT/Vzgej/RisA6LzsSgE/pCsgcpgrow80
         YhcQ==
X-Gm-Message-State: AOJu0YwR3ybkKPY6uppR6U+5VVmtXwEH1xGffOZJUjLTna11uJKroLX0
	RrCfm6spLYcs1aVtxcT/+egUgfMK7NW/aZRo/X4ID3yVNtGoXT/Q7mZPpGlp
X-Gm-Gg: ASbGnctfKkxBuOXmuWuHn2on2+nuUdt1ydXGGq/dkJha0d/dZ1WMV4h5RLDs8lAZYQa
	W/BMnEXBSlmnCCVHDEnxAwC6u8U7PC3TDTHp7apdTC2O5nGMFXFyGxZILWl0/JNOiYS0+lFnXTo
	Kx9xim/tak4jKFPYePUsp4hVanNiK04KLMOybobzuVw1+mMB3WGCHM1GnQ35nDHy234kLAn3Ck4
	1BEKSwnDjwpRt8hUUYLgXSw+dqcRDs01EC3wLXYVVICI1hEPf5zeVsnX2rxsOkA7cD0ZEof+XCn
	69bmDeNrPT2y3AY7+xirFwZBgU9GzlN06yc2faFoFxc=
X-Google-Smtp-Source: AGHT+IHkaTYWZvifGj1ZjLjjdHE71+fJ8COKHz9TIqDhGFNi7sDehEL9Q5wwELyBaL4aSUgMn4DGWg==
X-Received: by 2002:a17:906:e242:b0:acb:b864:829c with SMTP id a640c23a62f3a-acbb8648443mr447857266b.10.1745348157951;
        Tue, 22 Apr 2025 11:55:57 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6efadd68sm688268666b.185.2025.04.22.11.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:55:57 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] python3-icu: upgrade to 2.15.1
Date: Tue, 22 Apr 2025 20:55:56 +0200
Message-ID: <20250422185556.1215490-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 18:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117068

From: Martin Jansa <martin.jansa@gmail.com>

* 2.15 as well as 2.15.1 fail to build with gcc-15
  http://errors.yoctoproject.org/Errors/Details/852863/
  http://errors.yoctoproject.org/Errors/Details/852882/

  In file included from bases.cpp:32:
  arg.h:837:37: error: static assertion failed
    837 |   static_assert(std::is_trivial<T>::value);             \
        |                 ~~~~~~~~~~~~~~~~~~~~^~~~~

* the tarball filename is now lowercase see:
  https://pypi.org/project/pyicu/2.15/#PyICU-2.15.tar.gz
  https://pypi.org/project/pyicu/2.15.1/#pyicu-2.15.1.tar.gz

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../python/{python3-icu_2.15.bb => python3-icu_2.15.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-icu_2.15.bb => python3-icu_2.15.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.15.bb b/meta-python/recipes-devtools/python/python3-icu_2.15.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-icu_2.15.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.15.1.bb
index f404538537..462b9d1f55 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.15.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.15.1.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0724597863f1581ab01429e0423e779f"
 
 DEPENDS += "icu"
 
-PYPI_PACKAGE = "PyICU"
+PYPI_PACKAGE = "pyicu"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "241bf4e73851524af67fea5d94ff60bac83dd98ce3ef6fd6f2c00e07e8476c87"
+SRC_URI[sha256sum] = "a9e6c3056668e3c75568da7172a7b0eb24727eb2892e8528b370faa122522f02"
 
 SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 

