Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.16672.1587071968619996069
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 14:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=ZnlTKO1O;
 spf=pass (domain: broadcom.com, ip: 209.85.128.68, mailfrom: abhishek.shah@broadcom.com)
Received: by mail-wm1-f68.google.com with SMTP id z6so431417wml.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2020 14:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AvjYIjmkG6lj3rnQQJ25LoxRrp250FOwJ+WYUupneXs=;
        b=ZnlTKO1OYMaTumBafSPzh5s9NbBQ+DbfnTI5wMguVYYpMt6XQQObO0Ypc9X/C1pJpc
         EB0wl0GQm+npi70l71yLqHc9rHaQjrISRUH2+nXLIpCQ5NtJ2wxi9WSH0fT+aCht+C4x
         /ONJGrzPdTAo3SATOnh+2Q4V8T0v2A3K4Zz2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AvjYIjmkG6lj3rnQQJ25LoxRrp250FOwJ+WYUupneXs=;
        b=Uu/kZMCYYT68dTSbbmhXshIxqfqTydP3+4/QWs8jG76niRL9XhOLK1Q02Hp5rQlNEG
         o7dd4ADFpeTgNP/6a8xYWBczXecIST55QYlYbV38qgIRPK7vLZqjyZhjN2/pIgv8GRuC
         Jb4JMqC0mQSgteoXdrCktUF7pYYQCNcuGaL7rDpljVWgSjN88SP3D62rmJEX2WBujkWq
         ZHjDFiQemayKZMPVHXASMSxN13FsxCTqii5fdspAFLGd4UypCRb9qagJ/Lsffp1eaic4
         BqFx/H/3FSbPSiJhrgDBTBNLzXO+BlPwcOcs9FAnI+7bOP1xkrS1A5cRuUNC5DSK+Cra
         C/1g==
X-Gm-Message-State: AGi0PubL+6LyXKyF2YIuTHWNaA7/duyaqkhztm153B6G86ANqFOQGq9S
	rQCEB+nQ2S/E5Bv7Qz/h1++uLuWPZ5TPgOiu8copqnW7Nv7i1OswipzwtwFkvgnQuPMbl6PcnFd
	k3ouKejUzKBko5UGFXh/a2W8Bc6Tk0Vm5F2pcrL7cFovFmCCwzop3bCOaswanO6teRtYkS85yCf
	FjMwarVPHEy+sI7czMBqpGsGlCGg==
X-Google-Smtp-Source: APiQypIrQKTUS886LoHrFIT0LO8BfjD/aXTPxqQVetSnPSyqmb1aITmdazNKyb9IGaeJkdNmhXpLcQ==
X-Received: by 2002:a1c:a985:: with SMTP id s127mr1156550wme.125.1587071966719;
        Thu, 16 Apr 2020 14:19:26 -0700 (PDT)
Return-Path: <abhishek.shah@broadcom.com>
Received: from ashah1-OptiPlex-7010.ibn.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id x23sm5165460wmj.6.2020.04.16.14.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 14:19:26 -0700 (PDT)
From: "Abhishek Shah" <abhishek.shah@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Cc: Abhishek Shah <abhishek.shah@broadcom.com>
Subject: [meta-python][PATCH v3 2/2] python3-pykwalify: Add recipe for v1.7.0
Date: Fri, 17 Apr 2020 02:49:10 +0530
Message-Id: <20200416211910.27047-2-abhishek.shah@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416211910.27047-1-abhishek.shah@broadcom.com>
References: <20200416211910.27047-1-abhishek.shah@broadcom.com>

Description of the package can be found at:
https://pypi.org/project/pykwalify/

Signed-off-by: Abhishek Shah <abhishek.shah@broadcom.com>

diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
new file mode 100644
index 000000000..5d029bd76
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "YAML/JSON validation library"
+DESCRIPTION = "pykwalify is a schema validator for YAML and JSON"
+HOMEPAGE = "https://pypi.org/project/pykwalify/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a72ea5159364a2cd7f45c6dcbee37872"
+
+SRC_URI[md5sum] = "58357f1d0f77de976e73dbd3660af75b"
+SRC_URI[sha256sum] = "7e8b39c5a3a10bc176682b3bd9a7422c39ca247482df198b402e8015defcceb2"
+
+PYPI_PACKAGE = "pykwalify"
+inherit setuptools3 pypi
+unset _PYTHON_SYSCONFIGDATA_NAME
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-dateutil \
+    ${PYTHON_PN}-pyyaml \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

