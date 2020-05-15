Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.14192.1589552216016689148
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 07:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=IVLRTBxP;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.195, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qt1-f195.google.com with SMTP id m44so2027350qtm.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 07:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Rkm8kzZKHWW1g7Zav+pJLdgPrT2e5JY3O3koEm8M6so=;
        b=IVLRTBxPRFj9+d6/fEHWUFMFETyv5jUbSLhpikbH79kgHc1/LQIsSaMHd61JkEXogf
         3iw2Dz2wIR9BvNL03yde4dSqTz4IwAFxD8AuXORCXbUlyQT8pg3VWjeSfsO9n18ct12E
         dgXleJhxCZQtVBBUSF5M3F2x+X/ybcT2EPVu9Ds/l8cZ+MMRYE2JnDdpSetYWBldQYxC
         ubRkiHKabPJlWssyeOpQGcrtf960PeCM3kVDPJ5xZpDarD7Ua96baBzpO3cPwFVCiphh
         M4DKHLV+VNc1CldCCywq5ae96qrrXirniNmEC9yjdS/TCrmFAYGj932o/oJY9uhac6ql
         EN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Rkm8kzZKHWW1g7Zav+pJLdgPrT2e5JY3O3koEm8M6so=;
        b=PIvShJ/yiXsAci80IUEoDPNW2DbMBw6YWObuD5BlmILMCkuEn4NdoHWXcfivsbcdjV
         4dVoLiqrdXfCTTijQK94XjVmI3TTYzbEp3J6bhLa7mbtRNF8I6udcCLy6+v0ULqWwD0P
         MHx/L7wHcoLH8/nkY8NVX1oMej0b9aGYxUabMrcKtMRB+7l3h99Ohnc8shHCh/8mRFm2
         u6AJavAUbqRW/cnBcEWlDi+uFGArdU/OK5uZaqDeJ8r7f3t3D0tFz/cygJPUxys9yMkZ
         jn+ExhFB9RaqPhl5pjY09QOpRCrpWDgYAJgCk24DVebf8w1jji+hSQE70zh6EI+chR6U
         iWWw==
X-Gm-Message-State: AOAM530B1O0P+E9lLcWd4fsYSz1lCgG5hNKaw563Rag3aZT+YXdzz7ny
	VWkeqrOzWsd4eB5NwBH62Y9fHVhWiug=
X-Google-Smtp-Source: ABdhPJzVO2UmegLtn5dmdIqpCjHpFUaZhaXgxj2NlF1RWc/tUNc6PcSXjs0ZfCSdlssK8RZOQNE46A==
X-Received: by 2002:ac8:1194:: with SMTP id d20mr3858672qtj.359.1589552215022;
        Fri, 15 May 2020 07:16:55 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:5434:711e:b23:e7fd])
        by smtp.gmail.com with ESMTPSA id m33sm2170749qtb.88.2020.05.15.07.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:16:54 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 06/11] python3-trafaret-config: Add recipe version 2.0.2
Date: Fri, 15 May 2020 11:16:25 -0300
Message-Id: <20200515141630.27789-6-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515141630.27789-1-domarys.correa@ossystems.com.br>
References: <20200515141630.27789-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-trafaret-config_2.0.2.bb       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.bb b/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.bb
new file mode 100644
index 000000000..b0f7548e4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-trafaret-config_2.0.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "This is a wrapper that loads yaml and checks config using trafaret while keeping track of actual lines of file where error has happened."
+
+LICENSE = "Apache-2.0 & MIT"
+LIC_FILES_CHKSUM = "file://README.rst;beginline=98;endline=106;md5=a15308789c3b7d0f3ef36b69048423e4"
+
+SRC_URI[sha256sum] = "440b6b49e5e975f9a640a2519abb2feddd96eb2aeb1715f87f947a7a079f20be"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-trafaret \
+    ${PYTHON_PN}-pyyaml \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

