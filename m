Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.6939.1588079375159485453
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2020 06:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=r4uhfY3U;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.174, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qt1-f174.google.com with SMTP id k12so17176057qtm.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2020 06:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kXTswz7/oQ34457aTyLKQ3l3YFNxkbaNQwexzUzUFlc=;
        b=r4uhfY3U5Vb4rk67Hx9078J1p/Ev/kMedSMKGOPujCnXyrjnEj+fFz80dz+NV7vouH
         u+YZeafIDj8CocWw5BjVeIphJ/oASn2SCAmiLTqQqoEmmlXM/cs4Q1tqymxkA7GDRsRE
         MlAig0FL5xzIrrTR70eb0nBsmmx8gaGvIWBRovmBes09QeEq/8jO2tkF50bHR/RdSDaz
         GlDFwxMdKsc2FUxRWH1Frlflc/QRD2aa+pXC7jrlqIMrgQf4jBA0oUstlGe5QJGl77ZR
         GqUJruZJ2Pv5T/MO4YI/N2ko4RdXgyKGESbaZaa78HDvmb7YAHIkrK77xebRvBMhVu/8
         iMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kXTswz7/oQ34457aTyLKQ3l3YFNxkbaNQwexzUzUFlc=;
        b=pDjupvokIhJoHwpfncfN3F+kFAIazLgL4LTOU7p1vRdJgiOnOJNRFSTQARlTnGXlcT
         ixtngncXylprfIs/ivI4u8WdBeVmfLmxqTIMpaf7v858+cQ8PKMPHjHiYlcofztOTY9N
         Rd1OGrnTJN+tJsWVbhc4KQosYK4/Z4liH5j5NRZsnZ4+2ioXb351HJjEAR8y8jZy5Cw9
         sFzqa+ycZ/XmrB7/VdLuUNb4DmM+CTBoYkE6d7zxB+zS7T0wYMLDi0elc3i/KpdONsMB
         1FuOO8KXg0i+vnGJ4/QMOI20X6Xt8s7WvYJPl5m2zIE1AXm1w2U3LdLCtKd8ViYDBhht
         L51g==
X-Gm-Message-State: AGi0PuY7idgG19LWbe7yocAo2dPs3EZ9FrGB7NQIkggIAyFMj653LgGe
	WkvXw2b8wCgiLF5nJvYCQTog8jFfz4Q=
X-Google-Smtp-Source: APiQypJKlXWzNonoy7HxFIL7npGA75tWIEYRvgIeSxiPW8Asya3z8xpK+OZnp+mCaYKvU1UjAwDYEQ==
X-Received: by 2002:ac8:3f19:: with SMTP id c25mr26232674qtk.96.1588079374162;
        Tue, 28 Apr 2020 06:09:34 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from localhost.localdomain ([2804:7f4:c193:1cf5:44ed:61e4:a25c:b4f0])
        by smtp.gmail.com with ESMTPSA id a13sm13203103qkg.129.2020.04.28.06.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 06:09:33 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [meta-python][PATCH 4/8] python3-httplib2: Add recipe version 0.17.3
Date: Tue, 28 Apr 2020 10:09:10 -0300
Message-Id: <20200428130914.17398-4-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428130914.17398-1-domarys.correa@ossystems.com.br>
References: <20200428130914.17398-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../recipes-devtools/python/python3-httplib2_0.17.3.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-httplib2_0.17.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.17.3.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.17.3.bb
new file mode 100644
index 000000000..57047c9ac
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.17.3.bb
@@ -0,0 +1,10 @@
+SUMMARY = "A comprehensive HTTP client library, httplib2 supports many features left out of other HTTP libraries."
+HOMEPAGE = "https://github.com/httplib2/httplib2"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=4edb3f072a9d815734530f608039a167"
+
+SRC_URI[md5sum] = "5730490cfe83350477b54b0a8a190c8a"
+SRC_URI[sha256sum] = "39dd15a333f67bfb70798faa9de8a6e99c819da6ad82b77f9a259a5c7b1225a2"
+
+inherit pypi setuptools3
-- 
2.17.1

