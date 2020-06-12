Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.1354.1591986999905319441
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id w3so9941594qkb.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=Bz1QwyClMsZVBrJTm1tVgB2aTFVYnHhBhYwvSz54UaM=;
        b=b2OFN8CjiMP+q7kIR1w3IxEHwTBVISwtaruwYAwCiovbbitJrM6uoeKSqmd+JkT9rm
         7w5SQoNR4dCGlm3hGAdHTciNR+qhL0M1R5/VS30kdugI+Nj2Rb3zV0MrwsmpR2uNav0i
         sPXdXSgoxKgsz2Pqu12c50cVj3v4VaxK9HpSb5xAeUEaSN8L5X5bobwPv2cokzZ+qRHZ
         Ovkb5LpzC9nQvr7qAeuZ9DKXDYv1h6rCtjicZz1dV21MyuQhk+W4GVigHcHxP4s6b+Ro
         WkP1eR4H2H4IM64VxCx9ylPZApi7obPAA0XGroe834ZcDvdHjZdqN/Lqce+Lvhsx6WXY
         Dx9w==
X-Gm-Message-State: AOAM533p+r+5mng8gty90XmMqm1tzlxmU8S/QO38a5brRdz/rZVhxl44
	wrUkxrTVNDYAuZvRbSV6NMQ8gyv5p0o=
X-Google-Smtp-Source: ABdhPJwGmLjbORWJT4B27pzGBuL1hO3Wxwpl5iZwz+15qiOB+qBDzF6MeZ/GG2lUB4To/9WFNGHMZA==
X-Received: by 2002:a37:a7cd:: with SMTP id q196mr4330923qke.320.1591986998807;
        Fri, 12 Jun 2020 11:36:38 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id y1sm5205388qta.82.2020.06.12.11.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:36:38 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 06/22] python3-trafaret-config: Add recipe version 2.0.2
Date: Fri, 12 Jun 2020 15:35:51 -0300
Message-Id: <20200612183607.108989-6-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8288281e3b35674e8a76b600cb114e328c3ed94f)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
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
2.27.0

