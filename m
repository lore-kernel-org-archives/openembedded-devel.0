Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.1370.1591987038742342251
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id q8so9905697qkm.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=n+czeGsM0K8IF+lLs3dFL4hXV/NTT12VXL+kgfCw7lU=;
        b=WXRBMgDQuUS+XtYk/nRAuRdDbJM+KL8Swzqmwu0jMnF/MVRG8MOPb+MDmsssFF3kat
         IJXZvuVsahAzRkgp/kdSoq0fohR69zzqQoQmHkuzUs/kemgbgebLUiKcGSWCTNar9P+m
         dMyEEnzlSkDRqlBe8hMsCnGkQD5w7yTVt/A+ODTh7cnelUc7t32SNzMyKXBLyexdkIZR
         51MQP0ZeFVpTGzMYKI+xSUKO2QaFxerjmDvXgi1k6Dr098S9jCzIka4b4Gq3cmOUQEls
         D9UXm7XTaXQLgUNdU6sUme9pX53N55IM5IdCdcrVvUc6LTEiUZ0MPYokxwjay/AbJmwn
         e+iQ==
X-Gm-Message-State: AOAM532utU8X+JofAD49mUXACli1y5L4msdIlfG8QBXbZ0FTr72ECknv
	uErZ6ZZXwHGk96bfdBmb9V/chvtix44=
X-Google-Smtp-Source: ABdhPJxq9eIX+1v9/kzu2tV0UfUET1oU9wHPcAYKwJRXN+pXwk4Ct94zeITE/jhrUO5gfbW1hjFNOw==
X-Received: by 2002:a37:73c2:: with SMTP id o185mr4371659qkc.356.1591987037644;
        Fri, 12 Jun 2020 11:37:17 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id n63sm4963178qkn.104.2020.06.12.11.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:37:17 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 18/22] python3-pyudev: Update 0.21.0 -> 0.22.0
Date: Fri, 12 Jun 2020 15:36:03 -0300
Message-Id: <20200612183607.108989-18-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
(cherry picked from commit d09f8bce84198b3f50d56c9a178cbea16b94cd9c)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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
2.27.0

