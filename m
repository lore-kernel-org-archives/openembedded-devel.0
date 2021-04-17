Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.3567.1618693594272044509
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NP0cFGo7;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id f29so21540707pgm.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=WzEx8Am/ZYLDDNCniBL+mjg7Q+EFywUDKHlKdxcb9fY=;
        b=NP0cFGo7CjvaBRWeYi04zHHYpKuEex9d3e/w2oF3+/cMRIApK9luv0QZJ3i2nYOej0
         5sa3KNY2RAL6wcLl96VG33T0sWNBMrGwQN1V3urhPxKM11wQkMjjpY2fL9UtLdVuaEXk
         j6FCDVeYBTz6/BSOm/5Q/ZZ69v2PmufFTqhZEbxJzzRR5LnT5lpiKXS3eQ67ghOjiy4g
         JsBwcyMpiXlIYn8PApQOxHaCX8/Wme+yTiff24kGT4kN/nYyQM/Kxs//vlKxOVOzUADo
         MwAp5h8Ainz0cImwinRKi/2TGg+dUuMjKeX4kiBjE5V1+pjBn9zqQBNcrXhPPhpX4lg6
         Wnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=WzEx8Am/ZYLDDNCniBL+mjg7Q+EFywUDKHlKdxcb9fY=;
        b=HpvmVmMJsVaj1Hrn7phsPa08RolIPSl1y6e90tNLqHmaQuiJe2aDn/7w+7FQjvPqUZ
         g3lkkktSivISeaFDFmuF27tX1IZUDD+yHhsL6PAN321R/O7o2OFXbKSsLm6/8WkMOZIC
         CAi3b2ugk9cotAo0T5yfC04WZmSEbOcMEm+WRFyUqUDd0Nyge8LvJ4rVu0AEB+M1SCeu
         TXm+8EYG25zvY412k3yQsX+aw8ESTGDAEbHieUus1GjKret1cvj28UX3fxI4Wen5qrlO
         QHgTfm6L9EwVyv8kAWbl6SJ640MjT4IYWf7OwUrjNvmMCOPVigVLWEhD+psvxhCqS/Vf
         7n6Q==
X-Gm-Message-State: AOAM533TGyhyS/mv7XtG6ID6NtbuXWoMo7PfX3fmlisKHBsUBEF9cD/l
	RFDUilbBLuF+fOgFDMbQ3U+R89EpMNmoBw==
X-Google-Smtp-Source: ABdhPJwpnbxJCnMgJE7MVJA2HXC2Ytvv1G5/8Zg32mzZdQ8xzKPLlLWo5099jMx70/UCEhLkErYdlA==
X-Received: by 2002:a62:ce4f:0:b029:258:2b6c:7741 with SMTP id y76-20020a62ce4f0000b02902582b6c7741mr12147203pfg.33.1618693593721;
        Sat, 17 Apr 2021 14:06:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:33 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 33/50] python3-colorlog: Upgrade 4.8.0 -> 5.0.1
Date: Sat, 17 Apr 2021 14:05:42 -0700
Message-Id: <7050ad06aca904115893ad0f50797fbb3ca1498b.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 5.0.1:

- Fix colorlog.basicConfig does not accept '{' style
- Fix linter errors

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 3793fa1ca638e488cbb31882d3c8f79b71fa838d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-colorlog_4.8.0.bb => python3-colorlog_5.0.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_4.8.0.bb => python3-colorlog_5.0.1.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.8.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_5.0.1.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-colorlog_4.8.0.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_5.0.1.bb
index 6f9b8d47a49..61b8152a1e0 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_5.0.1.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "A colored formatter for the python logging module"
 HOMEPAGE = "https://github.com/borntyping/python-colorlog"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=85a1d478cd35d62763a1419e948bdde4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5c3c6ebdec7792ae12df8d1c0a46b26a"
 
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[sha256sum] = "59b53160c60902c405cdec28d38356e09d40686659048893e026ecbd589516b1"
+SRC_URI[sha256sum] = "f17c013a06962b02f4449ee07cfdbe6b287df29efc2c9a1515b4a376f4e588ea"
-- 
2.17.1

