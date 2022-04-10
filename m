Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20D6C388F3
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web09.21637.1649623377102617512
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=I9mLd8V6;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.179, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f179.google.com with SMTP id r18so2173894ljp.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rOK0N3Dj1CsBGgZjOkvbgCP10e6BKHDiiPUiI8xml84=;
        b=I9mLd8V6LXScw7r0gXtBQJTDFUUcfL86crO/T1mrMncWBalNXDSQ0pExo3n6a/j24E
         02oCaP5fQXoUTETi+1IdazUgfpqjswkTtpFzU8RDq4uZiwHqTbI2u8OUHR4rkBB4nMKL
         +PdXgd270+mmaBcsjNGqgRg+uSNCGlcvHx3cuHjF6KKr+NqM7dRuqVXJoNZL4zJwIlcE
         aol9xWfeEymX/ZaWESYq8vmbnJY3oa/jn+huJy90b0VviFGbsrcVee0fx+WKEZ1m/2io
         VN3FpPwAdK/yahlDksSa5R+2nDw+yTOBl2ikdsDLa6CtBu2IFYENW4WASBhbf5tMFZks
         qS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rOK0N3Dj1CsBGgZjOkvbgCP10e6BKHDiiPUiI8xml84=;
        b=Zbu0yiN5Fj7W5KztEPlxeLPLqJoRWwX4VP1GJqdfB5P0QO6u31swCcQjQFiF81/0RZ
         tmUbjloxtSEAVDUeh255Nd8WGtmqvK4TVbx0sDvQmXF+V46J+B2cma+x/Y0NS2T7apn4
         kYJmPBIl6Ek7n7xNA2VxJFYaq+UJhQTlG99ms8eQPp6ABcx3oxzDB4y7q80XacnjM47A
         a0ZPSAbfa2P789b8xtytX0k7otzZHvkX3n963rHGk+cM9gvD/S9UWVBgSc4SkYUVmrJ0
         N7sQ0bbY5nOoMmDncOTPL+/hEzLk6FPq3n2SPk6/7bbFoOJDjF14fBAxoCgHOjy9Vwx8
         hNBA==
X-Gm-Message-State: AOAM530Waj7wPzRRLToVdHxsYuCTIavhUdjpBClHPuUKHGLf725m207V
	cDtU6+L17RVGaDe4NWrfbdiNp2A2536xyZ5V
X-Google-Smtp-Source: 
 ABdhPJxrci+30jIXlPgGQWBGjFbrsaRZENTBzwG6jxJdF/32dnwvmQ8jas8vxd33GYF8RchPghHfGw==
X-Received: by 2002:a2e:bc25:0:b0:249:8c68:1d11 with SMTP id
 b37-20020a2ebc25000000b002498c681d11mr18397701ljf.151.1649623375045;
        Sun, 10 Apr 2022 13:42:55 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 f16-20020a2e9190000000b0024b08969b49sm2710063ljg.67.2022.04.10.13.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:42:54 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-mypy: update to 0.942
Date: Sun, 10 Apr 2022 22:42:52 +0200
Message-Id: <20220410204252.4045866-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96521

License-Update: copyright years updated.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-mypy_0.910.bb => python3-mypy_0.942.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_0.910.bb => python3-mypy_0.942.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.910.bb b/meta-python/recipes-devtools/python/python3-mypy_0.942.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-mypy_0.910.bb
rename to meta-python/recipes-devtools/python/python3-mypy_0.942.bb
index 5dd717ae7..5b4b6d5ba 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_0.910.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_0.942.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Optional static typing for Python 3 and 2 (PEP 484)"
 HOMEPAGE = "https://github.com/python/mypy"
 LICENSE = "MIT & Python-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=17b7180fcfc43c4e70c07c71588604c4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6ba8ec528da02073b7e1f4124c0f836f"
 
 PYPI_PACKAGE = "mypy"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "704098302473cb31a218f1775a873b376b30b4c18229421e9e9dc8916fd16150"
+SRC_URI[sha256sum] = "17e44649fec92e9f82102b48a3bf7b4a5510ad0cd22fa21a104826b5db4903e2"
 
 BBCLASSEXTEND = "native"
 
-- 
2.25.1


