Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.294.1586884542187419412
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 10:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=fQpXAHPB;
 spf=pass (domain: broadcom.com, ip: 209.85.216.52, mailfrom: abhishek.shah@broadcom.com)
Received: by mail-pj1-f52.google.com with SMTP id mn19so5496059pjb.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 10:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=cGjoFPzwP3z6qOIakGqNQ9Mnzr7Gk1vjFXoy8u3yagA=;
        b=fQpXAHPBsVAPwzihMwzdwRhp6d+eaaebIWTS8VnKlL+UGVYYnsA+8BZje+8BEzIhbZ
         6D3vmCmWwzb+empXjmgD4Orv8atUYgm78vAq/AACOFJlGG3LsYkS6ETzR5sUnMEvPUvw
         F/hinX14z051Nv450Ljiib7pE9uaYE4hP/JKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cGjoFPzwP3z6qOIakGqNQ9Mnzr7Gk1vjFXoy8u3yagA=;
        b=Yl2qsIKPkgQIdz3+Z/lQAbqZunRLXxFqvnK5PnU9tW+Q7ANiMy6OfySK5HZD2IJ+YF
         cxuQ5RFWaTkFMJdZhfHha++41lg2P1D27RTirpdGxR3ptBgzj+pDyXJAGmevfUEfxgwE
         sBN7Z41UIySfZigvQKjfF0gHV6MWLhzP/McOo6STFbcBDCngQ977UB/T1RJcNhjHz7f9
         3MLqTb9hTTa3Cj3GWH577gIjRuboH/N1wQVKip24YSkeVyRuFDMbxmI8nsCjq5A1Oys2
         7Cg81iLIvoFq+mPR/7jTHg7jcagcYuZkgapcM8Qy8vpxdx5S0BEx7RDfBETKHuobrdLB
         OgUQ==
X-Gm-Message-State: AGi0PubDqj44UWa1a13Yr5AYpjk4KGTGCXnh/jBR8C2fJoCNaynsMqWQ
	693h+i7tuNqXn+Vc7ezn9jkiIZjA/ZJazK+0Le3pVDgNckLNMyoG4AqOk8djP0f4cPZhNiv5/fF
	rL2jZ6Ul1p+/mkwiETI0lijR2O6HmU4OoTi+E63BVXKWrdDhs7GIB+XM7O/kPGOPf4ik6Ii53qA
	6SyWVI2wWIBULBQD+5VAcjcCY=
X-Google-Smtp-Source: APiQypLnXFEODlaGe6XK33LLKnxh9NMBJDQhVPkQztTAmn+c22y27wO63ug7qbhL1ozJGJaY466nhA==
X-Received: by 2002:a17:902:9682:: with SMTP id n2mr960989plp.44.1586884541021;
        Tue, 14 Apr 2020 10:15:41 -0700 (PDT)
Return-Path: <abhishek.shah@broadcom.com>
Received: from ashah1-OptiPlex-7010.ibn.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id i4sm12348528pjg.4.2020.04.14.10.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 10:15:40 -0700 (PDT)
From: abhishek.shah@broadcom.com
To: openembedded-devel@lists.openembedded.org
Cc: Abhishek Shah <abhishek.shah@broadcom.com>
Subject: [meta-oe][PATCH 1/2] python-dateutil: Add six package as runtime dependency
Date: Tue, 14 Apr 2020 22:45:26 +0530
Message-Id: <20200414171527.29279-1-abhishek.shah@broadcom.com>
X-Mailer: git-send-email 2.17.1

dateutil package has runtime dependency on "six" package for native version
as well, as shown in error log below, fix the same:

|     File "poky/build/tmp/work/*/recipe-sysroot-native/usr/lib/python3.8/
		site-packages/pykwalify/core.py", line 25, in <module>
|       from dateutil.parser import parse
|     File "poky/build/tmp/work/*/recipe-sysroot-native/usr/lib/python3.8/
		site-packages/dateutil/parser/__init__.py", line 2, in <module>
|       from ._parser import parse, parser, parserinfo, ParserError
|     File "poky/build/tmp/work/*/recipe-sysroot-native/usr/lib/python3.8/
		site-packages/dateutil/parser/_parser.py", line 42, in <module>
|       import six
|
|   ModuleNotFoundError: No module named 'six'

Signed-off-by: Abhishek Shah <abhishek.shah@broadcom.com>

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index 3c89cd62c..40f406f50 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -15,10 +15,13 @@ FILES_${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-six \
+"
+
 RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-six \
     ${PYTHON_PN}-stringold \
 "
 
-- 
2.17.1

