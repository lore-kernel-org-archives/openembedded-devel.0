Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.14201.1589552223509620628
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 07:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=RIbtO/Yn;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.196, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f196.google.com with SMTP id n14so2634047qke.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 07:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0iM5Z83eHo2aC0fLgzFrLVEnjUv3Ta6bekjau/uvRjk=;
        b=RIbtO/YnXsEowLVxLha6K9icsPedmZCDZ3Xll966irpWc31ZAMssAuLtc/AweZ3xbV
         ocmccVvNcQhEi4yb13I/wkftsAE2issvnC8mq0uOVy/dXJ0cSvXaBvU0N1iiVgX86tGb
         3bFFH1+PEmMQR66XiT766/RH37qWRRurUCFiahnnRPN8nYXCiqctwJ3hlgpzoFf58cG2
         2Quz4mDMY0V2xDIVpvJ9uEa9qPxsIYha2Hsm7A+bO6kkCulj1lrGtTiOF1+k8DhVy30C
         bh7T8xTNuAN4dkvt60ntIxkR3FhekB+Sn4McylGJ84FH+T67iaOujiaht30OKy8UmYBp
         L69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0iM5Z83eHo2aC0fLgzFrLVEnjUv3Ta6bekjau/uvRjk=;
        b=rBasPb9OzTp9yZk3OfI3yN7plqkPH5zYt+LML4Idrdapo2oglV0CLoWd97LKO5sr4C
         6zJFcgPmtZHooOtbK1aRbNlT81p90PKerh+jsr3E2VpsRqwXFn8lf21s6uSVx3nzMRjY
         tTnW/9F+mBamPtYc1Nq/4Kt7IzL5Vygd2iFOzjx9TpDqYBZ/Zkx/M2YF32DmHG+F+rAX
         XOxK2hxdq0FaJ7Bllq645AmTQ3SwBPpdyuXcdEgOWfFI8Vdtbe7qFMTrv3MSeD4HUDZw
         atnvP3nXGC9oGVmZsLmHHC50nEfFCsgM3Y/HDikQXdSiBxQX4ziOtzWdrrg6hxTskzk9
         mZ9A==
X-Gm-Message-State: AOAM530R3Iqa+quwo3+EkCvlUm8nAtqQPRGJxTSjZU9eiU6UGjLP0bxm
	VX9spfy54TVN0tbcksOHocrr0FWIQv0=
X-Google-Smtp-Source: ABdhPJxGwB+UD1HQrbek2ef2fruYWKBONRcyToavnUN30Bx9NLXwjsNlHAq1JzzlWecrOsCXGOGD+w==
X-Received: by 2002:a05:620a:1305:: with SMTP id o5mr3590660qkj.318.1589552222346;
        Fri, 15 May 2020 07:17:02 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:5434:711e:b23:e7fd])
        by smtp.gmail.com with ESMTPSA id m33sm2170749qtb.88.2020.05.15.07.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:17:01 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 10/11] python3-multidict: Update 4.7.4 -> 4.7.5
Date: Fri, 15 May 2020 11:16:29 -0300
Message-Id: <20200515141630.27789-10-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515141630.27789-1-domarys.correa@ossystems.com.br>
References: <20200515141630.27789-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 ...hon3-multidict_4.7.4.bb => python3-multidict_4.7.5.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_4.7.4.bb => python3-multidict_4.7.5.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_4.7.4.bb b/meta-python/recipes-devtools/python/python3-multidict_4.7.5.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-multidict_4.7.4.bb
rename to meta-python/recipes-devtools/python/python3-multidict_4.7.5.bb
index 0636972ec..30e10c251 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_4.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_4.7.5.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Multidicts are useful for working with HTTP headers, URL query args etc."
 HOMEPAGE = "https://github.com/aio-libs/multidict/"
+
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a"
 
-inherit pypi setuptools3 ptest
+SRC_URI[sha256sum] = "aee283c49601fa4c13adc64c09c978838a7e812f85377ae130a24d7198c0331e"
 
-SRC_URI[md5sum] = "22b46f759cf2cc3ca1d2c9f82cc9bb79"
-SRC_URI[sha256sum] = "d7d428488c67b09b26928950a395e41cc72bb9c3d5abfe9f0521940ee4f796d4"
+inherit pypi setuptools3 ptest
 
 SRC_URI += " \
 	file://run-ptest \
@@ -20,3 +20,5 @@ do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

