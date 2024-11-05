Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D04D2C118
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.19552.1730817427440868461
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qclo9Vg2;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e3cdbc25a0so60987597b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817426; x=1731422226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TELwbJFkh8xsBAQQZ9XZYEsuG/JV+4y04muOEWYQ0e4=;
        b=Qclo9Vg2R7xHEdHZ4gfMGRFPBqRCS9z0rUDxV87tfxV9FYE4uYYDw36QY2xjfcWHJ+
         omrGYN5y7cU90jKYwHqJGNVtbeGwrWXTfPLj2EtLxzuTvUgn9KHR2iNSDP8U02YQeQqI
         87fW6Q9SsLo6u7zhKzD0XBrjnUODvFBOD1LKFAJfYn4jMuQT/n8wZk5W/rOXfY5KcKHE
         fZWMEGg904PVBo2IccoKwgahbiHar1vCZ5EkGcNCOtK4nCwgdvSl0fmLZi4tS4Dijvgf
         rvUnn4eUrpUvTqDP0eCkSaZlrORCSjJ4JFG1fwzaophaKnWzZmoAaTzWAjPvj6pa6UlK
         GsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817426; x=1731422226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TELwbJFkh8xsBAQQZ9XZYEsuG/JV+4y04muOEWYQ0e4=;
        b=jwhh+hGFuWpk9lX08Ar8/5eIJHJv/dNncKL0xmfdgnKaIycWm22fcQioLw6ldxsjac
         3MbWOQ7KIYUoB0QPDWBcI0NtV3OFZ57CBkjsAcaTvUtMX0V18uOpKULcIRp2gPM7y+CQ
         lAfIjyIxFGdguYP2dY58PPq4Vp8iGZeB4yVYf3+zh6/DG4OyUv6+nutfJYnYw+6fIJOW
         5WnfcBOYZuFKz+UQjezUNnB6EIeXnT9Ws7nXdwAqv81aZ73qEYLf+3tMQBl/GJVfpneu
         QjrwDDHnqqQAP/zFjV5ebl4G6pRc9GmibstD8TniYru6B98q/leLpB9abetwdwz/ri3Z
         StgQ==
X-Gm-Message-State: AOJu0YyVwZKP0SKlqmmZRWIhhOnZ8VZiET2V3KEbqHGdumZVdSC8WKCA
	La48h4PmQT7m2reC+pG/mLZtAgHQPxo7SUVea9pLZD+Cgp+tZS5u+bxZ5g==
X-Google-Smtp-Source: AGHT+IFSno7pGa4eutXg/nqx/YsxE8yse18QZ0x7jqmUhohksnrTrHIh203pQasx9H72YLMNUqoVuw==
X-Received: by 2002:a05:690c:4801:b0:6e5:907a:5170 with SMTP id 00721157ae682-6ea64c10a6cmr162054757b3.43.1730817426479;
        Tue, 05 Nov 2024 06:37:06 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 59/90] python3-sqlalchemy: Upgrade 2.0.32 -> 2.0.35 and switch to PEP-517 build backend
Date: Tue,  5 Nov 2024 09:35:24 -0500
Message-ID: <20241105143638.2301245-60-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113477

From: alperak <alperyasinak1@gmail.com>

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

- PYPI_PACKAGE name changed SQLAlchemy to sqlalchemy.

- Added missing Cython dependency.

Fix:

WARNING: python3-sqlalchemy-2.0.32-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Changelog:

https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.33
https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.34
https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.35

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 42d10bd71d354aa6eeb3ba3a2bea71c33de475eb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...3-sqlalchemy_2.0.32.bb => python3-sqlalchemy_2.0.35.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.32.bb => python3-sqlalchemy_2.0.35.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.32.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.32.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb
index bb319d566d..202350dcd1 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.32.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.35.bb
@@ -4,10 +4,11 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
 
-SRC_URI[sha256sum] = "c1b88cc8b02b6a5f0efb0345a03672d4c897dc7d92585176f88c67346f565ea8"
+SRC_URI[sha256sum] = "e11d7ea4d24f0a262bccf9a7cd6284c976c5369dac21db237cff59586045ab9f"
 
-PYPI_PACKAGE = "SQLAlchemy"
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-cython-native"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.43.0


