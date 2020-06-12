Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.1263.1591987051266484981
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id w1so9951895qkw.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=20kr7V8Ian313bYrTQjVFJ/oCrj2Q01zYSDLIPbhGP0=;
        b=WHhQxUT3WajoBxPanMq2uw0/tm4uPdyn2JOOXNFtPNKz1IgeqaykWAFmezOIehz2n4
         YkUoU3JstYcdXp8iI3zBw5Gt/qm5Hp0jww994X3Ib4zUUQuAlys6vqyQPR2u674Sf5AV
         XZlyM6jlkEkVJ1iUSmlrSv6lMaYS2ZipBy910HUn9N2N1fr2VBzAXN3ULDwtOAol7v/V
         btrgihFs8FX+qNstrAD5QlcnjTMQqCaUCHEFVUcySyOkiNXDRsh9JOVDH+JLi6zwZV5m
         Tg33STMCBJ8fgaSgwp1oeRIdd6f2FZ2gV/qe7oM8twOlI7pwT3/2aAO0Nxi5F/mCTLcW
         uLTw==
X-Gm-Message-State: AOAM533PPvBU44NCebUUtiUjoqcCWr6hHsvSCTl0AlB56VHSOOjbEQap
	SzmVe5js+DjdX5Krpn+fB80sKVv5f1A=
X-Google-Smtp-Source: ABdhPJzlbjtEwH+XS1T5YvWcMC9v988meCsINjha6qj7GhT52AYfgpe14fpCJsN+oRlZnENefYm93g==
X-Received: by 2002:a05:620a:1223:: with SMTP id v3mr4153914qkj.468.1591987050242;
        Fri, 12 Jun 2020 11:37:30 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id e1sm5070507qto.51.2020.06.12.11.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:37:29 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 22/22] python3-pytest-asyncio: Update 0.10.0 -> 0.12.0
Date: Fri, 12 Jun 2020 15:36:07 -0300
Message-Id: <20200612183607.108989-22-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
(cherry picked from commit 2d0086afeeea83ee4d50e2e8b483afc8b565a666)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../python/python3-pytest-asyncio_0.10.0.bb        | 13 -------------
 .../python/python3-pytest-asyncio_0.12.0.bb        | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
deleted file mode 100644
index a7e963b04..000000000
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.10.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
-HOMEPAGE = "https://github.com/pytest-dev/pytest-asyncio"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=ae62268d207c73b615fbefddaf91a881"
-
-SRC_URI[md5sum] = "247a7ec32f24a185341327c42a0f85bf"
-SRC_URI[sha256sum] = "9fac5100fd716cbecf6ef89233e8590a4ad61d729d1732e0a96b84182df1daaf"
-
-inherit pypi setuptools3
-
-DEPENDS += "${PYTHON_PN}-pytest-native"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb
new file mode 100644
index 000000000..d83c42de3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.rst;md5=3faed73a08162b5b5367cdcaee996f75"
+
+SRC_URI[sha256sum] = "475bd2f3dc0bc11d2463656b3cbaafdbec5a47b47508ea0b329ee693040eebd2"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-pytest \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

