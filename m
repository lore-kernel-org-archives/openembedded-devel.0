Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.1357.1591987009465864838
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id d12so2001419qvn.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=yMps1tjSsFNlt9t4rlKg3armr8tDMRCqkoxm9uLhH+Q=;
        b=VVHI0dkyro2CaaN3pKlfkt1/gMy7KAXlyLduhV98S9Y2ndlHPmfa+FL1B8BkpHCLLY
         01ek3UHoG1w7SMLx1V7NWX0rZW8zDdhNIajyGRIaZ7RJ0cItOY5/GKF9FhQ6qOnJytn3
         778OiCFMftXzOEWliti/peCp9G9BdTMYJc3FksubZJrbNK8r1mv5UWov5MmjtF7Q9JBt
         Vi6RM8iCzNhA33kTfGZwlwEfYC+/wsgMhV3UtJGJH6nbQs5w/R/2apBMidJf5Se5B/ZR
         XuEh+HWe8Yc0TTbbLwMAP+1d3EHkZ7gcwFc9mu1vfiRIjwnj9ByOR1T+Ftv+zrqFAua1
         kduQ==
X-Gm-Message-State: AOAM533Jlm5JAQtS5ssQlvEWLOm+vzHFDZgvWaRdEzBU4GUlDPyfAdUB
	RJDKLS5rEv8YiMJ1bQKDror51WWaceE=
X-Google-Smtp-Source: ABdhPJztmDOESDuC7CMHm0G6ru2Lo3lsg0Sl4gnm4WfXWqkyLcoZ2B+J6JlDdZOP6IIHvtYm69dauA==
X-Received: by 2002:ad4:54cd:: with SMTP id j13mr13036927qvx.151.1591987008428;
        Fri, 12 Jun 2020 11:36:48 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id 124sm4518980qkn.45.2020.06.12.11.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:36:47 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 09/22] python3-xmodem: Add recipe version 0.4.6
Date: Fri, 12 Jun 2020 15:35:54 -0300
Message-Id: <20200612183607.108989-9-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0dccb1e5a698aec92506196fc1a9fcde601160ce)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../python/python3-xmodem_0.4.6.bb                 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb b/meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb
new file mode 100644
index 000000000..3fdd3e58c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "XMODEM protocol implementation"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI[sha256sum] = "089737298f5738eabc43f2519efdc80b402693768f16383f7013b9e6f8f279d7"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-logging \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

