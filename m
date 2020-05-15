Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.14203.1589552225827969768
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 07:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=d/MHqLFH;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.182, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qt1-f182.google.com with SMTP id b1so2067193qtt.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 07:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OPcTmUIcpmw6irTzj/jWEIVqhRTWRyydAB0MjuQ+v6g=;
        b=d/MHqLFHRiI0uNZMzqjdEJO+zcesyXt4kYQcOuCcddhc9qlAiLG7ciWNrXvRjUKMOg
         Zl03spnItaefoA9P5UdrGF1B3T2qBFfvwbntnV+0j2FKJc+J0Ghw/Kt4uZQCJnozBm3y
         QkmHDf8uZKJuAq4wIPMNprfYHf+/POvysU2ABjAUf/nsCVcNKicLMVQHb1nFLeIYV8CM
         paqIWR9aP+TjS7BAA+7eyaQRUjk0XEfODMSH/DeR/bxP1al4J0N8ZatPu/7HVOw/ohiH
         ayRRVVKB07jAk1bwwgbnwDKcdpDk3Xd+grvkS9BbUZkwQwiXSdOxSEJOvhaytIRth88b
         S83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OPcTmUIcpmw6irTzj/jWEIVqhRTWRyydAB0MjuQ+v6g=;
        b=tJt5dr+4kApIlA/Zt6j5OD84KdJp2zO9h0NVkofpcQ2Utg4o9aoIEPESiaIvaGrB32
         O2dWog0MkM0+okWHBYKFOYD5reOZsRBfjJpdK5qxZbQz4iyglyfJZf4h6T2ncS7CG/Wt
         TfFN1kAXtxJN8dVJ8vzIpZ7+OnYAub7YH1Jk6a2gStmr3GGeiHvJM/mao59tWcHRgHsU
         QxLM9hYSYtq80gRCCG/dvu6PJdPhfhxqQNRbO6Qkh0YUCN0vHt1rK++EJ0mEH98bDJ8k
         jgGTsS35FvP1Bv/fpY56WukLqiefx1BSJx259JX9Va1oXpLCIkEuRt246EPESTY0Cmvb
         PFkw==
X-Gm-Message-State: AOAM532EkTV1jOUNvTsdE4pyPrPMYm57wi5NEv2+bHfrzLMR1MRDRZy9
	TxeGCvpaShH+/IbYGTCaybRKAH/z5So=
X-Google-Smtp-Source: ABdhPJy9l7y8aJbcer5rCa+pllIFOrzi0ssoGq1rdiRzVIK3c2sS0kEPbF76Dvjyh71cnGzoGreIFg==
X-Received: by 2002:aed:3949:: with SMTP id l67mr3526503qte.313.1589552224091;
        Fri, 15 May 2020 07:17:04 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:5434:711e:b23:e7fd])
        by smtp.gmail.com with ESMTPSA id m33sm2170749qtb.88.2020.05.15.07.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:17:03 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 11/11] python3-lz4: Add recipe version 3.0.2
Date: Fri, 15 May 2020 11:16:30 -0300
Message-Id: <20200515141630.27789-11-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515141630.27789-1-domarys.correa@ossystems.com.br>
References: <20200515141630.27789-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../recipes-devtools/python/python3-lz4_3.0.2.bb   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb b/meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb
new file mode 100644
index 000000000..e39ca8f3b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "python bindings for the lz4 compression library by Yann Collet"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6231efa4dd4811e62407314d90a57573"
+
+DEPENDS += " \
+    ${PYTHON_PN}-setuptools-scm-native \
+    ${PYTHON_PN}-pkgconfig-native \
+"
+SRC_URI[sha256sum] = "9c9f6a8b71c18c24bd83537a4d616f0301623a5e98db7c7ca956d608e1bcd4c7"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

