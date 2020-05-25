Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.39253.1590440523542561046
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 May 2020 14:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=1AGKktRf;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.196, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f196.google.com with SMTP id s1so18558914qkf.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2020 14:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=x3GKflR1put//GxYDC+vuWvPyvD8rgkfxOq1w+NnXFA=;
        b=1AGKktRfsPrcvHaSrr9QP7PgDaAg8kf/IXKkfbYIf7764WzPFmUmxdTQ4u3h4PjYex
         us+EZx1WkqXZxf9WmxnsOGMBlLPOnCmM2Q48j4jcDL/yUTEEw4g4RTm865FuPEHhxK8x
         843v2yDS6VVIphThDk/2XsZhqV2UJRi4iYjEQE50l6FwpuPbkSx8hfEEBYtMLu0qcQi+
         WFQmSrG84R90yFthvPQZjyJzZiiRUJapEhYOH+cTsH6eVfh7bsYH/xAsQqS2bWdZEqd8
         griCnboeRXC2Anm/I9+RvJlpgzircPQp8GksGyM5g5V715PweKJH5yQH4nfaEe524XSf
         ik2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=x3GKflR1put//GxYDC+vuWvPyvD8rgkfxOq1w+NnXFA=;
        b=gKrtPmELKbW/B71e2GLB7JurSvBCARjZXjTOuSUhYoAsCiswpp1qo+GBwuA6eXJcWm
         c+5iQYfiIi+R4ellWthIvyEAlOJez9ifbafIRrVPjh0FdCrn0UDRpsVQSjSNvlqRB9hr
         wVqwkPSZ7v1j9OLTP9EOvyaLtD8OJFT4cwCODu7nTv1P8f2Vcyxo7lsIlRQaTs48msnq
         +14Nk0OZ1xqUmOK8DDRIT79C31hUV3uwJciVJdouebDNT7JDGB7ZNGlv1Jzu/5ZGHjl2
         GOrKZrjFdHPiLkTXF2icQkj+Y/bVhqjH69bguZTyMvN4q3n7mbws86G7x7H1hNW22b5u
         GrAg==
X-Gm-Message-State: AOAM5312pFCXhOd4cfUAqs5likY2/9qpcDoCm8MVUS4iKp2ANlKzW5/z
	LxS31xBKLrzwRVwp2ddRKat70r2hdDE=
X-Google-Smtp-Source: ABdhPJxifjymZTIF/WXvMUO9Ey3QG32+uIkPMYcKXYKmq079Xxiu7acmDy20OXu7WUQO4ygweA36lA==
X-Received: by 2002:a37:b5c3:: with SMTP id e186mr26576886qkf.158.1590440522636;
        Mon, 25 May 2020 14:02:02 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:a8ac:fad9:36d6:4180])
        by smtp.gmail.com with ESMTPSA id t74sm14897838qka.21.2020.05.25.14.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 14:02:02 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [meta-oe][PATCH v2] python3-pyudev: Update 0.21.0 -> 0.22.0
Date: Mon, 25 May 2020 18:01:51 -0300
Message-Id: <20200525210151.13741-1-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
v1 had problems to be added to the master-next due to lack
of rebase with it. The current version is fixed on the
master-next and successfully tested.

.../{python3-pyudev_0.21.0.bb => python3-pyudev_0.22.0.bb}  | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyudev_0.21.0.bb => python3-pyudev_0.22.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
rename to meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
index 49a3628f4..38c012843 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A libudev binding"
+
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[md5sum] = "cf4d9db7d772622144ca1be6b5d9353b"
-SRC_URI[sha256sum] = "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b"
+SRC_URI[sha256sum] = "69bb1beb7ac52855b6d1b9fe909eefb0017f38d917cba9939602c6880035b276"
 
 inherit pypi setuptools3
 
@@ -20,3 +20,5 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-fcntl \
     libudev \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

