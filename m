Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.1341.1591986983535179094
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id d12so2000700qvn.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=+CHyBROyNsAZ+qUUuyELHVM5PraizNhJnPFw5SFp5os=;
        b=k8nCNpsCk+W2DXloROry96hnti1I5i3Fu2TZTXzD62g8GC5dSaDX1KE152+rbTBdYR
         vqmiYlh1uTPQYyPj5Kzy1SOlbqveawY1YhqiJGkbcqZaMsaNaKeBaKZlkcLNhNq7d97n
         jeWISi3CnM3j4zxOFRiB6lozYi0yTj44Wm+gwa9SPHap1CXC8iTH2QKI2xILjaLq5rx0
         8Q7tGb5gtyBuieDplXe9bcOHnPKksafeCXukTeVH+5djMQ2AlgGd0vzItGWSSesT7WUY
         lW05AHFABS9je1L6rMMJmGmmbxS1fqlYouxC18O2rUO584XugPyU09e4VwW34Z6EStEP
         9Eng==
X-Gm-Message-State: AOAM531P7vgJtWeYLBmYfrhAdVCQus08CoORAxBur/C1vNZmUXZ3N4T4
	K8lwotKZUchvLcmakzZJEktgvBNY5Ss=
X-Google-Smtp-Source: ABdhPJwiJKw6sbrPDu/L+AXOHHyi1HJlWpNDmGdvh2Dx9e5m1XgL7ullRNTV8HN6nskZ1YZ6UryB7A==
X-Received: by 2002:a05:6214:4e7:: with SMTP id cl7mr13607483qvb.215.1591986982415;
        Fri, 12 Jun 2020 11:36:22 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id 78sm4874749qkg.65.2020.06.12.11.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:36:21 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 01/22] python3-argh: Add recipe version 0.26.2
Date: Fri, 12 Jun 2020 15:35:46 -0300
Message-Id: <20200612183607.108989-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ae8968122461df7e1fa39138f32caa35218bb71f)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../recipes-devtools/python/python3-argh_0.26.2.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-argh_0.26.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb b/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb
new file mode 100644
index 000000000..6aa758876
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Pattern matching and various utilities for file systems paths."
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=cede70b648dcc81baf5b431d38905bad"
+
+SRC_URI[sha256sum] = "e9535b8c84dc9571a48999094fda7f33e63c3f1b74f3e5f3ac0105a58405bb65"
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

