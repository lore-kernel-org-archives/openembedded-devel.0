Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD787C48295
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 00:05:17 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.8048.1706918710344597394
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 16:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6e132fef7baso1463579a34.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 16:05:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706918709; x=1707523509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypPZlRpDFYMvPv691n4Kezv5yqAvBQ0k6FjlP70zUPU=;
        b=jLDvEGlE6CGlFnkMn6xPsPJkGWnGm0xXzYVu0ipI+t1ujL1HBeumx2MIThIapB1V7C
         IW/Gon5Y3YPLH0FuhAY2oFFMVGWDsEdft3NR2AqWGeC9HHo3kZfj/nAKhKHX5UN1vPKy
         kk8XNJHjYa7NAimg0VrxVLXA+/8BEaBdtm0nfYeAaytYpCUMN02iKwjDiX+wIYRbX1Ry
         rIIuHWM/0bNI+F+fTIgk8cVVwEh1NDWI1WG+upS0QYlZihOImlpu17OZUIhIZqgtkmj0
         IJkX3Cpm4GoA5j9eM76XDqfkKCnVwFk45fVj318WjNDaTsuOnag7brxAf5iCM6xSADaZ
         8sKw==
X-Gm-Message-State: AOJu0YyuhqRjVOOadmGrnSa9OYb0SyjgDh+DGWLcq6+vTK/bXvzXfxCF
	j1hwATLz9VRNnKjgAayzSoxxDC4x7sOqK1ffwH84o3KpdB2u/GBmr+xW63HJ9P9D8jm2
X-Google-Smtp-Source: AGHT+IG62RW86LNBtX1v2bbGJKKfDikmyh2o1XZrQY2Hbmwod07NQEORxQtekXqR3GFmZTk02LtMdg==
X-Received: by 2002:a9d:67cd:0:b0:6dc:813:6c3f with SMTP id c13-20020a9d67cd000000b006dc08136c3fmr3423328otn.38.1706918708608;
        Fri, 02 Feb 2024 16:05:08 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id w7-20020a9d4507000000b006e129888566sm580667ote.17.2024.02.02.16.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 16:05:08 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCHv2] python3-pymodbus: update to version 3.6.3
Date: Sat,  3 Feb 2024 00:04:45 +0000
Message-Id: <20240203000445.1628768-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Feb 2024 00:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108554

Update checksum for latest copyright year and verify license remains unchanged

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...on3-pymodbus_3.5.2.bb => python3-pymodbus_3.6.3.bb} | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.5.2.bb => python3-pymodbus_3.6.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.5.2.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.6.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.5.2.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.6.3.bb
index 4cd3801ee..337fd0e19 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.6.3.bb
@@ -1,13 +1,11 @@
 SUMMARY = "A fully featured modbus protocol stack in python"
 HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6a146397c35e3d0953758ce8803de347"
-DEPENDS += "python3-six-native"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "26c1aa9919b24f2247794d5d9d80f65ec06fdfd9bd6b76b81d446b55335cabf3"
-S = "${WORKDIR}/pymodbus-${PV}"
+SRC_URI[sha256sum] = "862f64376ae201f979c91ca2398f0ed5df8f136b76491e0995edeebbd0fa8940"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[repl] = ",,,python3-aiohttp python3-click python3-prompt-toolkit python3-pygments python3-pyserial-asyncio"
@@ -31,5 +29,3 @@ RDEPENDS:${PN} += " \
     python3-pyserial \
     python3-six \
 "
-
-
-- 
2.34.1


