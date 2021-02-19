Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web12.384.1613771719756926621
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 13:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=JH73l6+s;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.194, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f194.google.com with SMTP id k22so29214833ljg.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 13:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9ehrLkshvCY6gcgN3uFcyYDplWDPPPCFa/fBoYKOfPo=;
        b=JH73l6+s2Rh4DkfwWobX5+Lpo9D0C6spKdyC5u+3BpKqVYogmeU/bdzdZWOUFrbucc
         /eYSsqbROj6OhrFw6/fU+cFIpnHaNwbBubdJr+kXerc3rZc9Vle5wGtAjvNSexX8oe7L
         04aU+7w1T1uW3wHMoEiOy9paCCc67vOitRO/s150mdpHbknSJqq7DRFDd3wtkUArXCYb
         scLAps8o3GQbmgSboUlMSdVGDF9VuNrO57ajK0w2jlA/SUIQeBojOJlGlZhwZ9JXRwEO
         cPyV3NXNBRunZEhfiGLA6dL3rl8r1VcUFlOUYUdcKe9c5Zb37A0w7nzll4cI3dglHls+
         kL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9ehrLkshvCY6gcgN3uFcyYDplWDPPPCFa/fBoYKOfPo=;
        b=Q3dVfKXXxHvM3Ok0JXn4nOW7X2L9Z9MBbnMm1WKUL0DdyOH9RA9igen/DY7g0cKXqr
         H/MYNcxv7PgyF581lnJ+yhd8Fnvwpj4bVMmVS+HY3WVTFprTz8v2EPfar6LoZGTE2rB/
         XfvbpJ9l0T1AMKS000r01yYZsDUzA/PAyFRIQFeAtQBXeYA+6gyV4Y6KuBKrGOF9WqRN
         mvWrKw5U6nCO9IYBKbXkdmKte3WMhK1iT72qLh4vE+6z2bubFrKS0k2F4hJehC8LM7E6
         U01egz+xBYq8W6O7GdUbNTQ6xsKv1qXZ3ZyBs+p8hu6kU974kwr2XqfMuI2qdyKp+9Oy
         y9Bg==
X-Gm-Message-State: AOAM530sfAAGj1qnOLqV8Z4WHdXUmBwsUkKArCyMScDC966NWDwbOY3h
	rDEXP05S7RvNKyGqC2atfP+6kVM7wgoC/Jq+
X-Google-Smtp-Source: ABdhPJw6lielQqIvv925pKT5qGJaycLj118hCnbukGA3zahZi0FXqV925zKvDBUl/g3mGEtN/J2a8A==
X-Received: by 2002:a2e:3014:: with SMTP id w20mr7214776ljw.64.1613771717792;
        Fri, 19 Feb 2021 13:55:17 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id o26sm1038818lfi.79.2021.02.19.13.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 13:55:07 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-periphery: update to 2.3.0
Date: Fri, 19 Feb 2021 22:55:00 +0100
Message-Id: <20210219215500.2368332-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...python3-periphery_2.2.0.bb => python3-periphery_2.3.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-periphery_2.2.0.bb => python3-periphery_2.3.0.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb b/meta-python/recipes-devtools/python/python3-periphery_2.3.0.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-periphery_2.3.0.bb
index a01071151..9e3cbb43e 100644
--- a/meta-python/recipes-devtools/python/python3-periphery_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-periphery_2.3.0.bb
@@ -2,10 +2,9 @@ DESCRIPTION = "A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI
 HOMEPAGE = "http://pythonhosted.org/python-periphery/"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fea92e2e010ccb151792c29fadc2db7b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fed1784a083509430580a913df680706"
 
-SRC_URI[md5sum] = "0a5b866443edab0dab62cea56ed96f1e"
-SRC_URI[sha256sum] = "391e5bdfe2511aa7369002d4861df795dbb2889426b1b2cc1e6c9d85939da4dd"
+SRC_URI[sha256sum] = "8a8ec019d9b330a6a6f69a7de61d14b4c98b102d76359047c5ce0263e12246a6"
 
 inherit pypi setuptools3
 
-- 
2.25.1

