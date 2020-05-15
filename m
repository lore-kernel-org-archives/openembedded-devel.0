Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.14193.1589552217655547786
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 07:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=KtJ/XcZB;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.178, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qt1-f178.google.com with SMTP id v4so2058533qte.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 07:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hoWw5zKe3PEvJWPOMhlOPpupZ4IoM1hpUiN7FJhOdRM=;
        b=KtJ/XcZBIxoUOLCv6I0/R6zS5sCMOCimMj9DiiiXMx+iX1+0AJN4CKI+XkeVQTf9pa
         eEx3nqFePStTEsPgACJJnwJJ+YfuWVg7ZNrziGlJ8dRYWtLjwb+3WRpd9nb4cNeQDN3M
         Ox/NLXuBdvNTex/Eq86DwMkRciAIveJ4HeqLdwAqYDzDBuPN9xap9lcqJ/czt0X6xlph
         SDeVRrjTW6kvp6v+w1y9Z5Qo/0PFTLWgJ0AiTfGnDm/Vdr5nLGmpS0yl/H7CJ4qc/YVs
         fRDEsGiu+CBgBMTYtoqgdgrRKMqz2XBKFCSPSd2e/v7GGPfs4AZNsIqsyCwlEIV5Nv9/
         /a0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hoWw5zKe3PEvJWPOMhlOPpupZ4IoM1hpUiN7FJhOdRM=;
        b=f6yCH6xEwzJ3miUZF257KVoY85f3ikskohMcoWyEo150cpv89en3fbC2Dmr6W4zRLK
         hX9zz3ddYKuOgxh6VnO5uIe4tUaNC00JFhkcL444GWywwM5geUQ2X07YI5Z9cfhTxU5b
         nFlWVe/nOBejTdz8zs/WYpxU4KHPQCaLLjIBUHjx/tU7VXwjH0yMFHDuD0dAfoqGl5be
         QCPGDjG5BK/K8e/mo3nYNqcyznYp6Dy6cyf8rM+DgVlVFzdP1nAPJBWG7/ouh5heoHZ+
         RuBW21SVXMK+hr5t1X03IdqvpFBBPd1hPSk1PFQWQUTcgNrbo/wPPGBppPu9QiaPl0Vq
         Dy+w==
X-Gm-Message-State: AOAM531tVDBKkASDrPIjXPvCmqhzmoCnwVp32+LjY+yW4VMqFYvRObIn
	LCv+rWa9z8c88ru6n5cVr6tbZEHGz74=
X-Google-Smtp-Source: ABdhPJwGLlvb0e9S6CoTd30+efbHG2iMozfW/02eB6FlHqMJ+I5A0HztFpj7HO1Lp6iwEXMOsUGy9A==
X-Received: by 2002:ac8:1c67:: with SMTP id j36mr2582723qtk.34.1589552216706;
        Fri, 15 May 2020 07:16:56 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:5434:711e:b23:e7fd])
        by smtp.gmail.com with ESMTPSA id m33sm2170749qtb.88.2020.05.15.07.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:16:56 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 07/11] python3-txaio: Add recipe version 20.4.1
Date: Fri, 15 May 2020 11:16:26 -0300
Message-Id: <20200515141630.27789-7-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515141630.27789-1-domarys.correa@ossystems.com.br>
References: <20200515141630.27789-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-txaio_20.4.1.bb                 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb b/meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb
new file mode 100644
index 000000000..75a9395a2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-txaio_20.4.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
+
+SRC_URI[sha256sum] = "17938f2bca4a9cabce61346758e482ca4e600160cbc28e861493eac74a19539d"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-twisted \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

