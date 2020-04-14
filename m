Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.258.1586884546411369783
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 10:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=FmSHFc2Q;
 spf=pass (domain: broadcom.com, ip: 209.85.216.65, mailfrom: abhishek.shah@broadcom.com)
Received: by mail-pj1-f65.google.com with SMTP id ng8so5585376pjb.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 10:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sO+ZH1W03eghcCULbQzoqjZy21yUqhLq6SokXkrRsEg=;
        b=FmSHFc2QM5ZWqKEB9oMFd3ZYbUdZ/4O87h5Ujng/RnbeeBkUxCaueie3Li5/cnrAno
         St2wquKXBX5CqccEzVETTFYKu2BnC+APcqxfn+PFwuLg9xc8wp4A1Rgzn/pefT9rYGJ2
         rGOow4xWrG4oxwt1zDiTJTnOFoXAgkmKnbmlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sO+ZH1W03eghcCULbQzoqjZy21yUqhLq6SokXkrRsEg=;
        b=SWCNnWJz44rOecuFa9OQ8oU+rlE51a+E5zqWiAcoBBFepRFjq4OogeTGxlEt+wuSXp
         dsy66yXGxQMtlkmZuniH5qELrlrzkf43RCrntOW4BjX8+uRGaOFGdLssCj0oYIWkANPy
         bpS1//BHNRD4vwbQeh9BiH8N8tLoT8VwVQ00ZjCcBRtdxjL/VjB1Q+Mmi0ccEDGsJmoC
         xaMzGvFxza0nSSC+z1z5wU+ZzGkzyOVb5+Z4Ytb9MgOUHMT9rbYS81F1+mV5Mgc3Z8SB
         J5SecF1lfytcMsLca+sDpIrza0JkTo/+deqCeZpxEi/sjx0LBkZZtGh2cNOZ+6vN993B
         U+rA==
X-Gm-Message-State: AGi0PuY/tnML3ldKdlc8YhR1YZ3mRBZqjHJ0KrqRoAXrufJd7ybR76dI
	x/knyd05eL2pmBpNAhAV+V+6XDRzXDCMtSdmXyo9gOu1LPKcsm93boNHsahj3TyF3j2bG7wCpUL
	WhGgKgb0AvWb9PZqTfiX0aRZtPNElmxn61sonN39w5io+k8CHVe3ZVcc2IFuIDvgHtDaC3jIWlS
	moQ6hleWcApdXYpfOhBvGKBV4=
X-Google-Smtp-Source: APiQypLvLp2Ljayvw7LmAxv6LvKQDynfvqyvnWS+0PlZLdzJaKLBLeoEjwy+RTAunldoyR5EXm2mfQ==
X-Received: by 2002:a17:90b:f13:: with SMTP id br19mr1231180pjb.153.1586884545457;
        Tue, 14 Apr 2020 10:15:45 -0700 (PDT)
Return-Path: <abhishek.shah@broadcom.com>
Received: from ashah1-OptiPlex-7010.ibn.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id i4sm12348528pjg.4.2020.04.14.10.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 10:15:45 -0700 (PDT)
From: "Abhishek Shah" <abhishek.shah@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Cc: Abhishek Shah <abhishek.shah@broadcom.com>
Subject: [meta-oe][PATCH 2/2] python3-pykwalify: Add recipe for v1.7.0
Date: Tue, 14 Apr 2020 22:45:27 +0530
Message-Id: <20200414171527.29279-2-abhishek.shah@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200414171527.29279-1-abhishek.shah@broadcom.com>
References: <20200414171527.29279-1-abhishek.shah@broadcom.com>

Description of the package can be found at:
https://pypi.org/project/pykwalify/

Signed-off-by: Abhishek Shah <abhishek.shah@broadcom.com>

diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
new file mode 100644
index 000000000..0237851c0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.7.0.bb
@@ -0,0 +1,23 @@
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
+
+DEPENDS = "\
+    ${PYTHON_PN}-dateutil-native \
+    ${PYTHON_PN}-pyyaml-native \
+"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-dateutil \
+    ${PYTHON_PN}-pyyaml \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

