Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.6937.1588079373225254534
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2020 06:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=HX+N46Bt;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.52, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qv1-f52.google.com with SMTP id y19so10287957qvv.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2020 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xPjJRa3I3RR+UPY2cXLexf4/qp34kSl+rfpiAFXA5p8=;
        b=HX+N46Btn8fMGDyHbXSQS70SoazaX8tFTAsOKhSOJYp9TmX4KTcr9oLLjNsvIhcwgn
         XcMD+hg9DFKAqYpp/55NHpYGg5VFxGMwa+ZtQw+Hb24wlEzxLpR+HMXd7e8gbv70JQ5F
         gwCvLXYblQ44r49flQOVEzz+PGOSX5W1tF8hXxquCWoB7hz4r4BrmxU8X5QEu0Ho+bU1
         EXhDXywdHUJ6QladA5s9KrWF11DmHyuoz8oQmgmARgaYXFKwYfFzdYmAnb53cRTG+Hwi
         hxT73fOGZephYrw1dImTiHDlaJ3wDtsWqi+XIr44CPIw8T9edAQOFqzLAcSPMBK+fR/S
         pC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xPjJRa3I3RR+UPY2cXLexf4/qp34kSl+rfpiAFXA5p8=;
        b=dIEUUsehhJQPopNHO3Ashki0OMzGdQrB1u2x5lZ0S39NMKgmHRxzApQkRoBMmCY+bl
         x2+DWvz7kt72qC+w1Us7jY4lz3Ems8htl/6pl887aOnpuqLt1xP3hvPSYL/gk9EuiJpw
         Omcm3q0aD4quIOIrpMAWvmTai8A32MJYrYLiBJgFR/cnzmvqj+wtZDIE5BhHjqCkHH57
         M5NJ/r/hOIQ9AvtLv6IT4u+TWuf3VXxZZsHXJZ74h3tto0u9xxzx838XYbv62X52jb+O
         bgZfV6HK+OTAtjvqY153riGP85jK3y9DfyVgFRk/Fln6x9UPZArj8MylOWHqraqXq9pO
         U5CQ==
X-Gm-Message-State: AGi0Puad18n3BXpolnsI34ytZTloaURUt/VRZblVwtajbUYIpBao+fbs
	/mPuOL6v5sMZ/E4UaKavCqwpCHCFmUs=
X-Google-Smtp-Source: APiQypJ4yTNdoS28Q9lMTdeSN87sn+zIQiOh4tmmysCUb/GBoZyDyg5WQSGH0DuJ/Q+sCAP2l+k0Kg==
X-Received: by 2002:ad4:452d:: with SMTP id l13mr11957980qvu.19.1588079372296;
        Tue, 28 Apr 2020 06:09:32 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from localhost.localdomain ([2804:7f4:c193:1cf5:44ed:61e4:a25c:b4f0])
        by smtp.gmail.com with ESMTPSA id a13sm13203103qkg.129.2020.04.28.06.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 06:09:31 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [meta-python][PATCH 3/8] python3-gunicorn: Add recipe version 20.0.4
Date: Tue, 28 Apr 2020 10:09:09 -0300
Message-Id: <20200428130914.17398-3-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428130914.17398-1-domarys.correa@ossystems.com.br>
References: <20200428130914.17398-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-gunicorn_20.0.4.bb                 | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-gunicorn_20.0.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_20.0.4.bb b/meta-python/recipes-devtools/python/python3-gunicorn_20.0.4.bb
new file mode 100644
index 000000000..5bd8d51c0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_20.0.4.bb
@@ -0,0 +1,11 @@
+SUMMARY = "WSGI HTTP Server for UNIX"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f75f3fb94cdeab1d607e2adaa6077752"
+
+SRC_URI[md5sum] = "543669fcbb5739ee2af77184c5e571a1"
+SRC_URI[sha256sum] = "1904bb2b8a43658807108d59c3f3d56c2b6121a701161de0ddf9ad140073c626"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-setuptools ${PYTHON_PN}-fcntl"
-- 
2.17.1

