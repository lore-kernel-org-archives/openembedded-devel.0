Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.1345.1591986990388145125
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id n141so9961164qke.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=NRcWuTLOMIymzo2mR2nprdXbx93r+F2bjAQZAJ6KCdk=;
        b=hR8AhyXtNbSX4j5tleLgYAtHeVd3LHEbOr++4QrdIoQ3kh6u5yV6bSC+vx/og1RxLa
         pA27fgRIdS+/kvN5+0EKJYtz9DQcbD4utTAAP0ksBCqsVE4OGwhl6pjbthCCQokz/TDZ
         SdhcNrY1qfYUhgCyGtru4JQK7h+t1YvZrJkOMualx4tQ0+70pDkHaD8Xm+fQSrh9Fdek
         XVFjTcbZdgmjjWUsG20PafEL5WvXpep+hck5Yml4Oss1wBK3Am/B9pMoZCkxR/Ze2c43
         KwG8IEgeU3oTJBr1XdaoLS5jIw6mmIaII0tSlWPP/pYdRm6sJ1cU07sZeG/VovfS5STq
         cGfQ==
X-Gm-Message-State: AOAM531D/ZAWjPfJH1P3UcbqLasb5OBF1FH6HA64rK6Z1JB8BfAysLTD
	UHpd8HlDymyizaAzUp9s70HB3/CzIYI=
X-Google-Smtp-Source: ABdhPJzhMv2tQPOF9Px8IAWa8we4Iv06k40xxohsChC/WqBBwHg3GPvzZPhDd1cVlm1Ycc1E8dZIlA==
X-Received: by 2002:a37:f505:: with SMTP id l5mr4351570qkk.118.1591986989349;
        Fri, 12 Jun 2020 11:36:29 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id c34sm5697660qte.41.2020.06.12.11.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:36:28 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 03/22] python3-aiohttp-jinja2: Add recipe version 1.2.0
Date: Fri, 12 Jun 2020 15:35:48 -0300
Message-Id: <20200612183607.108989-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 498901a50b961dcc4828be79ced44564e5f826be)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../python/python3-aiohttp-jinja2_1.2.0.bb        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb
new file mode 100644
index 000000000..de336af22
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.2.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "jinja2 template renderer for aiohttp.web (http server for asyncio)"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c82758543767c96574b6e29fc478fb73"
+
+SRC_URI[sha256sum] = "2dfe29cfd278d07cd0a851afb98471bc8ce2a830968443e40d67636f3c035d79"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-jinja2 \
+    ${PYTHON_PN}-aiohttp \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

