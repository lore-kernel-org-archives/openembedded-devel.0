Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.847.1586890356299979856
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 11:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=hRF+Lzz+;
 spf=pass (domain: broadcom.com, ip: 209.85.210.174, mailfrom: abhishek.shah@broadcom.com)
Received: by mail-pf1-f174.google.com with SMTP id v23so360890pfm.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 11:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=cGjoFPzwP3z6qOIakGqNQ9Mnzr7Gk1vjFXoy8u3yagA=;
        b=hRF+Lzz+WxsvtUOkW561tMbrq9tpyD2cEr4mvuYeP5tv2/cHvMC9WTdJIkwrnGrdbu
         6OI6Bse8wWczonnu5rmXOdaNraby6IHHgrt2v82hXv5su8g3IfpYjgtfMe8aKeoPW+UA
         fv6apLTjQIo4I5CtGS3qZeoO3E0AIOxgKYGyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cGjoFPzwP3z6qOIakGqNQ9Mnzr7Gk1vjFXoy8u3yagA=;
        b=GzonzgMN2fpn32XvnZKjpo2Z8NNjqMGLKxvOtDXqC5oIzj0X7UCLWJoQ0oeI0o23EK
         aFswEybe+3XHQ1IjNGjrb/bcGIauJrI1WhMTKDHgPp1G6ZiNnrEvUQGNDBAAPtdRrUyv
         6HWM1pasShjM0olBfNwv7k4gPGMaNAy4hLa1kCSE7kKqItpdq7gdxfaUL2lqTgTE3478
         3Q0Y8iMUJlT9GAY2drq/BIKj9pTw4sKl9SpUmjkLDS4HcRvGKT0rPyzgblKD5tKeqqYa
         rSvdwqckg16WOMj6OVM6koO07SpiYPXhq3NCNgjw9cWNtNkHZivOaAxfgJBFnjwm6O/F
         LwKw==
X-Gm-Message-State: AGi0PuYf+z+KkP37naTTt9NldtMMHR5rJ1t646IQ9MyA7E7SatVo6BAQ
	sh09n496h3+FeDTraFRECprMhagek2DFXpuCTAAM2zjc/OTwxiBhuMPQhExmpLxgVfTnnw/heBh
	2BPpEk21CupTliusYAv+UaSFagSnU84DBDUxcnu4k6Xdl1JSWz0Ima+cS2GMRCLB6lgJ6qo5CH6
	RMi0n7Jqmc9HNdW/EbEKNuSvY=
X-Google-Smtp-Source: APiQypIlpHx4K6cNfWPoWYe/dPfIOjqEn+YA/uwlHKX83JXky1ZwJKASQl/6EQqi+1t4d7atHcF2ZA==
X-Received: by 2002:a63:1d52:: with SMTP id d18mr22452772pgm.443.1586890354946;
        Tue, 14 Apr 2020 11:52:34 -0700 (PDT)
Return-Path: <abhishek.shah@broadcom.com>
Received: from ashah1-OptiPlex-7010.ibn.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id c59sm12851301pje.10.2020.04.14.11.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:52:34 -0700 (PDT)
From: "Abhishek Shah" <abhishek.shah@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Cc: Abhishek Shah <abhishek.shah@broadcom.com>
Subject: [meta-python][PATCH v2 1/2] python-dateutil: Add six package as runtime dependency
Date: Wed, 15 Apr 2020 00:22:16 +0530
Message-Id: <20200414185217.24503-1-abhishek.shah@broadcom.com>
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

