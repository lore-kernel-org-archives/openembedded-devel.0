Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.1276.1591987032372013571
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id g11so4827925qvs.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=j82CjWW1hTg1X//xE+Pn7frX2ZtVWMuZZR/vNLVEwdU=;
        b=J9GHHrNpvN8/JugeHVbZ/ofji7MLR5fZEGbLNLSDKcxBK+GVFq5zinIQq5Xx5HnZZR
         4Nz1vt4aILcF5DCrzradvYk5EPhb+H0ajd2Guo3SRXMwdTjwr8t0/3JluaBx5SB170pJ
         37gBO/yHqvT2ibd+u88xGdgY70dOQ0fNGx7XtV4SD4/vHO1M/66/tKJHItwF6tMxcUpZ
         1ZnTQkDvtEBd+BfIAoI64+CPHaO4dqrL0NGbyhc8gxZS2R5sx3QFW8Gqd3dRqqHzaG97
         Q6Xztpwnxh/JJPX0vx7l7LFg9fy8SPBW4cnUYsUsDrvi1ZsI2pcDjT+pouBfPOgwmbkd
         CI4A==
X-Gm-Message-State: AOAM531whxFwrH5d9xedUX15dP+chY6Q9pO4VNou27Fftqje7Fpj+mFk
	zVjvmkwohq1v3a1FUhydXIPfljBS2hk=
X-Google-Smtp-Source: ABdhPJwb1OhbMQeEuNzoLFQhmyBRSk0jK0sEnB71j/sUZ8VFoIvoGar+7OHSpF45hSe1BS9S6sJqfg==
X-Received: by 2002:a05:6214:1371:: with SMTP id c17mr14138165qvw.186.1591987031360;
        Fri, 12 Jun 2020 11:37:11 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id n85sm4990746qkn.31.2020.06.12.11.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:37:10 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 16/22] python3-watchdog: Add recipe version 0.10.2
Date: Fri, 12 Jun 2020 15:36:01 -0300
Message-Id: <20200612183607.108989-16-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3e431c3ce9bc58ff58a10c8fbd6ff556fcc66838)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../python/python3-watchdog_0.10.2.bb          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb b/meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb
new file mode 100644
index 000000000..93a1c192f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Filesystem events monitoring"
+DEPENDS = "${PYTHON_PN}-argh"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[sha256sum] = "c560efb643faed5ef28784b2245cf8874f939569717a4a12826a173ac644456b"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = " \
+    ${PYTHON_PN}-argh \
+    ${PYTHON_PN}-pathtools3 \
+    ${PYTHON_PN}-pyyaml \
+    ${PYTHON_PN}-requests \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

