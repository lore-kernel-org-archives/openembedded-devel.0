Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.1211.1591986986887525495
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id c12so9894151qkk.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=Dq+ITpbj7LVBiBWoLcjjYaoNmSbD7EQMc6rPU8sBtUg=;
        b=Yy1l/UavJjEJ6mcZrMVkxfSPl3x+aTvxb1iU3iLHXcLlcR9FxOhN++pYUc0PTx8C1W
         1z/mIyyiG4heVT1LAyfdC6bftpXBHJHMJqSggG65J/lIbYt98fav27pXueaDLYYM77cb
         ZvlEsAfk0ZH4HCjCtOaoRwXpBUmFyufB1ZEKjTnE9tUsT4v7CY9x8h0/fB1TCoJ9G4yP
         JIaePczOUzd6ESzdQojfCKfXB8iuEmt/aldjTB6pMidGq1OnLqV0C5dd2wve42vpSlB2
         d8w7s+CiUl30fs06YnVl/HKQgQgZZzJnVk4qFVh5ya4To03vFa8XFhKLgA3a/qn8V1/E
         Z8mA==
X-Gm-Message-State: AOAM530EdYJfQPzSa4nn3Ui6MA4uSp/+AIg0TKhyiR+f/gyHJvwyzum7
	2NkJbHSF/KvBFTCfq1/vFf5cHjyeAKA=
X-Google-Smtp-Source: ABdhPJy8c1UOt9Vqhaa9pfZXdRbVY5dA34Zfs0eSseqJU3Enfwlfw4l8jxGpchjdghdAjlo/Tva9xg==
X-Received: by 2002:a37:8985:: with SMTP id l127mr2672238qkd.169.1591986985834;
        Fri, 12 Jun 2020 11:36:25 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id 63sm4875887qkm.82.2020.06.12.11.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:36:25 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 02/22] python3-graphviz: Add recipe version 0.14
Date: Fri, 12 Jun 2020 15:35:47 -0300
Message-Id: <20200612183607.108989-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 636d98b3ab80ac2d295851aa985d7a71eee29ec4)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../python/python3-graphviz_0.14.bb              | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-graphviz_0.14.bb

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.14.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.14.bb
new file mode 100644
index 000000000..98bbddd21
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.14.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Graphviz protocol implementation"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI[sha256sum] = "e104ba036c8aef84320ec80560e544cd3cad68c9f90394b4e2b87bc44ab09791"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE_EXT = "zip"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-logging \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

