Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web08.1080.1612379070568034618
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 11:04:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=mN/omPsi;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.65, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f65.google.com with SMTP id i187so762171lfd.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Feb 2021 11:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P628cWFX1WnFisi3FewoGlZsZAC2g4CZN0TCg03E6Lg=;
        b=mN/omPsi4fkSErVngl/IBx1TCZFFbBClXRlZh3B+zVGLyOvwrPGJADKpnc0+NRkw6p
         BMtqvrpA9t0xq8R77OamV4EBWHVOAPYBYMzDIZQRRqn5IE/eIYggHSZUGQdSXf/jMSRf
         rZrIkjOM9zTe4tjknWQYPxY0tpjJy4R/lQl47Yy+TsJ5NCvldRde0JBMUQs1H2cIv2bS
         g0KdZI7PPGBAJngQzJRCCTpcueY1SetkvVnp6oF3/KFQgRI4isdT3p8tlDg9IzIpnAca
         4JIQ85lJyXJLYpNSXbAONn/LIiuWakz9Xf0DId8UuadEmHkExCD8UI85jJCM+n0ey9mV
         mqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P628cWFX1WnFisi3FewoGlZsZAC2g4CZN0TCg03E6Lg=;
        b=RgcRK0ByMovJOQZ5cvjmEnH9lSnjtZYegIIicF8lHSoa4PgMRu+YNqSUfBUl3liKwk
         oABcTUjZGNK3w37xJZitRdUsGlcQndAWZnYVZSJmAn/e9N7q7oAgmqfleyrbNYWRm+Y2
         P+xX+Qtrvt1KWn3QQi4PMXRVcLqTYGmqdg6Wvsjg3WXzjlHp41ha/eC6tsJ8SV5o5+FF
         9ycpdS9Dv1fg2tClHHFUrndmFYTF/Zs0du9PMmiq/MIMyp4AjpzYEk2oQtsZ7ZRVOByn
         ZghBZNIWmkUmEu/e16qQmqr8TRNs6dExpg/MtGTSCdTF6hDAJi+gNTLczwmBeytHyiXD
         YQfg==
X-Gm-Message-State: AOAM533rzRQSYu6OL2NOa0z0Wh8JwSLLvt+T8ePEKaIJPT5CVclxaC/L
	AaY5dzLuvRCaEzEC+6pR3mub8pdw/AfmZybU
X-Google-Smtp-Source: ABdhPJydM80ZUrMAViwm5MV5mbU0pNJ6wR5vuUs1ESwgXjlV2rTS25HpDav7Te99jw4roeD0GK6aWQ==
X-Received: by 2002:a05:6512:292:: with SMTP id j18mr2455887lfp.613.1612379068307;
        Wed, 03 Feb 2021 11:04:28 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id m16sm344899ljg.135.2021.02.03.11.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 11:04:27 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] cpuid: update to 20201006
Date: Wed,  3 Feb 2021 20:04:26 +0100
Message-Id: <20210203190426.1415766-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../cpuid/{cpuid_20200427.bb => cpuid_20201006.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/cpuid/{cpuid_20200427.bb => cpuid_20201006.bb} (85%)

diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20200427.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20201006.bb
similarity index 85%
rename from meta-oe/recipes-devtools/cpuid/cpuid_20200427.bb
rename to meta-oe/recipes-devtools/cpuid/cpuid_20201006.bb
index ff781f694..1b42590f4 100644
--- a/meta-oe/recipes-devtools/cpuid/cpuid_20200427.bb
+++ b/meta-oe/recipes-devtools/cpuid/cpuid_20201006.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "cpuid dumps detailed information about the CPU(s) gathered \
 from the CPUID instruction, and also determines the exact model of CPU(s). \
 It supports Intel, AMD, and VIA CPUs, as well as older Transmeta, Cyrix, \
 UMC, NexGen, Rise, and SiS CPUs"
+HOMEPAGE="http://www.etallen.com/cpuid.html"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
            "
-SRC_URI[md5sum] = "daa93ee2fdaf461e515b4713e7337076"
-SRC_URI[sha256sum] = "c1a9463f1f2175086120e9079e318bbd383dc1e574fafb2f724879f1d11061d4"
+SRC_URI[sha256sum] = "13c53f16408341d11ed489b352f218ec4dbb5bedb796a9d059e924770a9c56a6"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 
-- 
2.25.1

