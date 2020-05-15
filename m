Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.14191.1589552214200300784
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 07:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=SGC7I/hw;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.193, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f193.google.com with SMTP id f83so2598818qke.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 07:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kpJqQjEjPL+IxQj15Jz0uyvOEY9L/7EAGgsG+i8lBMs=;
        b=SGC7I/hw6SnxoXimcAPkwJ9KhGbiWFIgQgBgLIwvVNLlaBfXLGjYN8D9yIeafRWDMC
         obgxAInCuEMqY0v/GlBLn2Okbj642gGtjtVRNNmYfc9XDD+v5AonOOAzuRt/IL4HHsqD
         326yI6F5ItTZryO3kpBEn3WfdDdiptyn9oE/3dUh0kHV0r6Yn12eJ80vrUneJHKlQqWA
         DPRdpclso/NipZo1P4MmJ+LajM0/YTdaGrForb8gTkjzNsLeqyY8hsTnW+bhmjHm1Njp
         heWvJKwLYJ6YOEsNLn8FnwrJMKgGYheMESU8j7+cJy0qHUlhRHzKxsnl/GnSlJH/M7w5
         jlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kpJqQjEjPL+IxQj15Jz0uyvOEY9L/7EAGgsG+i8lBMs=;
        b=Yn73Z9wv1aRGnzP5x4/ZJ+pVyfa0e813qOXiXjWBRZ9T/DZe9u3rtk7EtvSTvYvvoJ
         lfUdcWQA/SWhBura/iJD2fvQIzohUniGu9jwNNwomjTMK3OTgxZM0KzaZTyTJMFI7HSC
         bdLoCyFUY1Y75fPd4+04eTZwuxqbWQ3BMR4cKssnzl96ATK2HMeIWs2JQQFhzrp75Iv/
         6ukYHGr80JDIWedTex6wHsbNSSbmXlxN/tlZ3toAK42Rf+70FeXVpiSFozAbPB25BYeF
         SOCLXRkBdWDRbKejTqF6GcE0XBqkPXnQBV/e+7Erl4JBZ5y0XmaKXZOri9vW819tsW6s
         tbag==
X-Gm-Message-State: AOAM532jL51IRRyyvaKN4AeanIxmjkBueEwPbFCrj2R1l8gRXBoOlgbF
	H6RDIseuadD+e0ximXZZzWp4cZF8g+0=
X-Google-Smtp-Source: ABdhPJzgSVjRARhMp9cM82eWpEw7GeapOjm5GZ/Gkj4bubhd5R1I8x+1/FC2GqDF8sWFCY509CL1fw==
X-Received: by 2002:a37:6797:: with SMTP id b145mr3629623qkc.350.1589552213243;
        Fri, 15 May 2020 07:16:53 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:5434:711e:b23:e7fd])
        by smtp.gmail.com with ESMTPSA id m33sm2170749qtb.88.2020.05.15.07.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:16:52 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 05/11] python3-trafaret: Add recipe version 2.0.2
Date: Fri, 15 May 2020 11:16:24 -0300
Message-Id: <20200515141630.27789-5-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515141630.27789-1-domarys.correa@ossystems.com.br>
References: <20200515141630.27789-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-trafaret_2.0.2.bb             | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb b/meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb
new file mode 100644
index 000000000..4e814073b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Ultimate transformation library that supports validation, contexts and aiohttp."
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=21ecc7aa8f699874e706fc1354903437"
+
+SRC_URI[sha256sum] = "61dfc25b574f70bfdf7ee3a808ec423061811c13a10b8d3c9e11ab539b96ab65"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-urllib3 \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

