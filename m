Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.2894.1594437575953789580
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 20:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mkw3RTPL;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id o1so3029432plk.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 20:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=Frs5SSWcTNSv35iiJ2H5fEOZel7okWNV2ZFS00BK9FQ=;
        b=Mkw3RTPLqwM1O9vrUM5EnYRvneevY20+ipkiMyNCmPavyqqGJSdPKnduWBSdWNr6gt
         4HsrPifmph9lOtXGQ2XNKl1PIZPg15XRJ1rAMdtNxE/8hl/NoUPPjV8dFZ7AJOUn62/o
         Jok/F436VAe2nZ2zEiFC3gii1EzVJ4Vt3Euhb+wLaXXnaZoUEdEo7z+JCGgfkYkEiHhJ
         xehofdSOkwPVFaa9fFCKbsXd9BEjWoIjqZeQxsQrBGEXdM8rCzjvaKDBM04DXnVchkGU
         JEy6VeEO/n/0bkL6Lx4nahAuDH4ZRwKsp7hRlsxYfOI6YIxgyLEsQEi2m4nhFzJH9R18
         +U+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=Frs5SSWcTNSv35iiJ2H5fEOZel7okWNV2ZFS00BK9FQ=;
        b=EDrk2/UUrqOSMakjT+eornYwv07/q0j6G9iO9RKTUksaF5WtHgeZZQcpdGrS2tCeAc
         V66V7/GIHY7u1x9M8jNyyn4WzjtOt2LYRcyzp7e5QoDq9pa/BlFjhIJLGQQOY+/lr/IP
         AEMbNeZbpKM/9T07a/YIp3GvvLM2gu8M8gc0ephq6X5K0WuGacsHn+tXCWRQ7mHxQFNF
         Pxl/mQHSXExNAy8ZuxvOPpj4AFAK7Hg67gTH3L756TTA1fhZhkdOC09hqCFBHWtj6zyh
         TeNpr2Lm+H0UwR4O5ixM6uhqD5oGZQUnozNljBskXjed66z8ICDQKFl0KZVzBOTOfPg2
         UWSA==
X-Gm-Message-State: AOAM5331nzHFhKdCjTq9WGYyWN0O8CqJC2aTo2DCbrg5n/7lekCzmZkK
	6/I58Tp6/iPqU6U7CT1Y0cd+Xr9wYSc=
X-Google-Smtp-Source: ABdhPJxC5HcfTxYn0Gf/pPRczC3SzUwqgWLXdlRJnMOpsoS79/+qPbPiyqNR3kxzQa4NqqHeRorrWw==
X-Received: by 2002:a17:90a:2562:: with SMTP id j89mr8451262pje.218.1594437575009;
        Fri, 10 Jul 2020 20:19:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:94e8:27ac:fdd9:c160])
        by smtp.gmail.com with ESMTPSA id f3sm6925461pju.54.2020.07.10.20.19.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 20:19:34 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/5] python3-gmpy2: add new package
Date: Fri, 10 Jul 2020 20:19:28 -0700
Message-Id: <20200711031932.5883-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-gmpy2_2.0.8.bb  | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb
new file mode 100644
index 0000000000..c6edcbb320
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.0.8.bb
@@ -0,0 +1,13 @@
+SUMMARY = "GMP/MPIR, MPFR, and MPC interface to Python 2.6+ and 3.x"
+SECTION = "devel/python"
+LICENSE = "GPL-3.0 | LGPL-3.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+DEPENDS += "gmp mpfr libmpc"
+
+PYPI_PACKAGE = "gmpy2"
+PYPI_PACKAGE_EXT = "zip"
+SRC_URI[sha256sum] = "dd233e3288b90f21b0bb384bcc7a7e73557bb112ccf0032ad52aa614eb373d3f"
+
+inherit pypi setuptools3
-- 
2.17.1

