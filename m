Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.2715.1590520825809175124
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 May 2020 12:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=r2W4tNGA;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.67, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qv1-f67.google.com with SMTP id f89so10021453qva.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2020 12:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j/r8tjKgUOLg+MyXM0A4iodml0bVbgkVmvkAlFVxgcs=;
        b=r2W4tNGAmYsXDoMGDe5Tt8RD6XreY+gsVtjF+OmV/5ye2+/1yw7XERtaZ65yMPSlMs
         dp3PSG6sTy6cDEhTxT1LbMktfqRpZdBElqmZxLIkRWrCw59/LZ/TDkV84dDpYTd2EvDf
         ieLyQuqAvM/kOmHRD9UpkNWeQ9L3ktIqNSjnzf208OUDgXR1hpBGs7n8mrbOROoSaJ7b
         EnxpLP/yBSrb4L42oBJ/4PCuL1Bt7BCp7gh7XXiaoFn5HakkWtGh0OovunQXZPa26cgw
         IKjZNNvcwhyLY/9F2Y+GefkmiMzKEw3cgwrnlpRCwjte/+XR1awd/M3DOHe2WY/+29Er
         L6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j/r8tjKgUOLg+MyXM0A4iodml0bVbgkVmvkAlFVxgcs=;
        b=UKH/DkkyzWaiUQJeFcayCgiBS1duHKecKR4qt6Ganv2lBvw6JHm/bDX3tgU2ZinR5c
         sArwU/elv6dDtDGjeBSFFTJm1AavZl6zXGMWH0DC16wmH06jJPngOP7SrLx6hurY0dVl
         evZL0iHwtEmUBod/tpX5YQFA/Adz0ka5U5SQ6fL4PE3dzot+h4Es/kweUhTtyS6eDEbW
         93xAK94LjcigU8Rm3rh9PIyAFx6eo1zBrPhl/rRzDHoifbxF4P+xJ5+2YkOdHdNFAHk4
         /Xx7I5vj0Duk3MuPhuCiri6bbQzxSWEGHBCpOiF8DJmN51+hEZaAP1xvtbIOMrehuTaN
         u7vw==
X-Gm-Message-State: AOAM531rOmD2kX/VGL0uCRcyxojwROPrDljE5cmF2Wc0YUSEnXZadTvP
	FQni2ay1QTsKKqk5CQOWYHV4kd0/6f0=
X-Google-Smtp-Source: ABdhPJxtSjeW1PVbXIOOjOji3SdnX02LTLClCEHqEBVmc6YzBQosKeTTkXnSDQndEHItIx1Jvko0Nw==
X-Received: by 2002:ad4:47c8:: with SMTP id p8mr21000717qvw.93.1590520824836;
        Tue, 26 May 2020 12:20:24 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:d122:133e:cc4c:c1a0])
        by smtp.gmail.com with ESMTPSA id c197sm434453qkg.133.2020.05.26.12.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 12:20:24 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [meta-oe][PATCH 4/4] python3-pytest-asyncio: Update 0.10.0 -> 0.12.0
Date: Tue, 26 May 2020 16:20:11 -0300
Message-Id: <20200526192011.17024-4-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200526192011.17024-1-domarys.correa@ossystems.com.br>
References: <20200526192011.17024-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
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
2.17.1

