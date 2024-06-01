Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A069AC25B76
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 13:50:17 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.37772.1717249807777603499
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Jun 2024 06:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bu63WfwE;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6266ffdba8so252060466b.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Jun 2024 06:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717249806; x=1717854606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0jnoeYf/sXjGJe4PaySGlybbSmZU2NlqF8H6lX6Mbz4=;
        b=bu63WfwEz7alCof4gZ/RgzebIU2iZ7b8taEiRE17I1lGiBy0LZZqNpqWFnDSNiBfL4
         S7jr50LKYh16MyamA64wMlNLMk4KAYjCBcATohMQgDFiKpNbm7Ah2+8E1XeaEUQGgnut
         +wcuDBc0IVSfw3WR6O/3E7ncDJZ5HjAR/+sgQ1rwczfI/+mMZ1NqA5dKbuteUUMDJ7a2
         za2FflO5vpi7acR+WQvfYsURLsFbBrAN97dm+rVHGUnCdVUF51lv3xhJXzjn+uXIqKIK
         GSrAhoAfNVhs2rjm0lQE6hVfrXQ6Mm7rI+6L8PQa1ukjGgULKCw3WprR46WgF67LBuxQ
         kSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717249806; x=1717854606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jnoeYf/sXjGJe4PaySGlybbSmZU2NlqF8H6lX6Mbz4=;
        b=inSZ6pPNNcuwKPK/J/HZaw55KLIajBCvt7f0KbknejB2Uitqk+joLEzkzU7Kaav1ec
         iGMFF76Wgw/ynyuyS7YJ2VRATj3gXg6yzuuJiwsUXN16YgOXS6kgE2ZvYkB6c/uHuuWN
         WzyM6UInETT2UUYgIar/pjpwV4DWWWVCSjvTMZXQHg8xzM+otqpNXrN+1DPSIL65ec1N
         2eoH1RycO4vNpSph6l2Np5mWwnVGJOGop/EcsOVmCd9xF0d6Hhc7RiumzQgGvmfSBySj
         eTTnfGSBqUbCDUZGGG6HBvmshQ5MxAbCq7AbzRr/XnPZzPMBXSn8M7+Y1RVVjhTUu3cn
         hBrw==
X-Gm-Message-State: AOJu0Yx7+9oPJvsjWaE/A6adc0COZfmkqs+mIPCAmVbqKAFdfABcr4Wt
	PPrHRonqlNZ79k8y41QnrAaux1Uc+9L7qq8KFyPpkGSC/6zGOg+s/g2c6w==
X-Google-Smtp-Source: AGHT+IGLEZG+x8UoBWd3gaVHqiSLI6yCLm1biTjl3elyvuDfLuLhRFyTPpIcpI2ZbXsuo84nxFXNPQ==
X-Received: by 2002:a17:906:c797:b0:a63:3586:a4ca with SMTP id a640c23a62f3a-a681fe4e68amr308206366b.11.1717249805799;
        Sat, 01 Jun 2024 06:50:05 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68b4b1f225sm71716866b.25.2024.06.01.06.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 06:50:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] python3-icu: upgrade from 2.12 to 2.13.1 to fix build with icu-75
Date: Sat,  1 Jun 2024 15:49:49 +0200
Message-ID: <20240601134949.3057658-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Jun 2024 13:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110658

Version 2.13 -> 2.13.1
----------------------
  - change c++11 to c++17 in setup.py as current versions of ICU require it

Version 2.12 -> 2.13
--------------------
  - fixed build issues on Windows
  - added wrappers for MeasureUnit(locale, width) and getUnitDisplayName()
  - added wrappers for DateFormatSymbols.getEra|ZodiacNames()
  - added wrappers for DateFormatSymbols.getZoneStrings()
  - added wrappers for LocaleDisplayNames
  - fixed bug dealloc calling wrong destructor on most types (Fredrik Roubert)
  - added support for ICU 75.1
  - added wrappers for LocalizedNumber|Range|Formatter.withoutLocale()
  - added wrappers for UIdentifierType, Char.hasIDType(), Char.getIDTypes()
  - added wrappers for UIdentifierStatus
  - added wrappers for UProperty.IDENTIFIER_TYPE, UProperty.IDENTIFIER_STATUS

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../python/{python3-icu_2.12.bb => python3-icu_2.13.1.bb}   | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icu_2.12.bb => python3-icu_2.13.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.12.bb b/meta-python/recipes-devtools/python/python3-icu_2.13.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-icu_2.12.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.13.1.bb
index 6394db4e9e..6a590de5fd 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.12.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.13.1.bb
@@ -8,8 +8,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0724597863f1581ab01429e0423e779f"
 DEPENDS += "icu"
 
 PYPI_PACKAGE = "PyICU"
-SRC_URI[sha256sum] = "bd7ab5efa93ad692e6daa29cd249364e521218329221726a113ca3cb281c8611"
+
+SRC_URI[sha256sum] = "d4919085eaa07da12bade8ee721e7bbf7ade0151ca0f82946a26c8f4b98cdceb"
 
 SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 
 inherit pkgconfig pypi python_setuptools_build_meta
+
+# it's lowercase pyicu instead of ${PYPI_PACKAGE} in this version
+S = "${WORKDIR}/pyicu-${PV}"
-- 
2.45.2


