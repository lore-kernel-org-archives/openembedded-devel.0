Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.676.1615908911919443547
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 08:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AGJI+W5H;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id f8so3611617plg.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OTO2W7UORIVAKQM0stQYJK3oA6ByZql0A8oc3IpUap8=;
        b=AGJI+W5HnHVLvueoLNIkilPjaKpryuVU1NESoacE78xvQBLF3j/doFZjs1A9OKn5wi
         FWWZbMAejAsZGILPS1to2lWy1llVH8kOPwon4U7ZJ9FcVbYOiy6be0MeH3dk5R76q4A3
         UUf8s/Iz8Q5RXHzKyJWlL5q61V01ugyL/ChAp1Gs2xElu1ePz8He6NnPGWBZrwTu9LoX
         mHf6lbiAKkKSxw0b+JLQ0Rkgyl9jC6L9sgVRBvqJ5/OueOZitsMT3yF3UubO2Eawm1Ac
         GOvhtq+Zb3kBHLez7OfQDiR4TjrWo7ig2kTxlUodd+0NfcuauHtEOrKNwqdQzS6y9oXX
         3Zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OTO2W7UORIVAKQM0stQYJK3oA6ByZql0A8oc3IpUap8=;
        b=BrJMMiiGlZGixbE9CVCKJN+mksYtFxP6sx8GuBwFC6d8tJUSo4yl11q1/znuNKk5Yv
         30lbcho8ojxIL9xWlFdvkbXcMyP6fYgGa4XLxgHupFG28j+4bhgj3rAkLrqDmAlB7+M3
         W5jdQuDuXHZnmRXQkv96NKRV5I0WIPjTPhTNttGqeJj7delaVE1gTjg1UTOV3V28NhKo
         TSkQ07LPhyoDMLYNeby4IbQoKl0x4I1PMpJIkhrWv9jMU17yDge6MqPWIWWb9Cy/n/Kr
         o7AOixi03v57bYgoHwb+Kgl8W2kVNERmQ8Kson0z2Uj0G80pEouMV3iVM9XrbUg83W0U
         SFEQ==
X-Gm-Message-State: AOAM531yRk61UDILL48p3cFqgo/I6y/yDONtUZcrnGGKAPokahHdDUGX
	V1JWu9f23L2M3rMI7xSqGtuh4Crydy5MDQ==
X-Google-Smtp-Source: ABdhPJxFiFW2XZcgnyqrWp5z+87CyyWUSzodHrhiWFRklJ7oR6PJCWiD43DADGrFFFIPRNdHiizg9A==
X-Received: by 2002:a17:902:ecc4:b029:e6:1a9f:3397 with SMTP id a4-20020a170902ecc4b02900e61a9f3397mr11464plh.9.1615908910622;
        Tue, 16 Mar 2021 08:35:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id na8sm3215779pjb.2.2021.03.16.08.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 08:35:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Devon Pringle <devon.pringle@digi.com>,
	Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v3] python3-pastedeploy: Add recipe
Date: Tue, 16 Mar 2021 08:35:07 -0700
Message-Id: <20210316153507.3426404-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Devon Pringle <devon.pringle@digi.com>

Add release 2.1.1:

- Added setuptools as an explicit dependency. This has always been
  required but now that more environments are becoming capable of
  operating without it being installed, we now need to ensure it's
  available.
- pytest-runner removed, use tox to run tests.

License-Update: Use license file from PyPI tarball.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Merge the upgrade and add recipe patches
    Fix License Checksum

 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-pastedeploy_2.1.1.bb       | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pastedeploy_2.1.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index c6ac19a225..2748c50591 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -251,6 +251,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-parse-type \
     python3-parso \
     python3-passlib \
+    python3-pastedeploy \
     python3-pathtools3 \
     python3-pep8 \
     python3-periphery \
diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_2.1.1.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_2.1.1.bb
new file mode 100644
index 0000000000..47508e2223
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pastedeploy_2.1.1.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Load, configure, and compose WSGI applications and servers"
+HOMEPAGE = "https://pylonsproject.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://license.txt;md5=1798f29d55080c60365e6283cb49779c"
+
+inherit pypi
+PYPI_PACKAGE = "PasteDeploy"
+
+SRC_URI[sha256sum] = "6dead6ab9823a85d585ef27f878bc647f787edb9ca8da0716aa9f1261b464817"
+
+S = "${WORKDIR}/PasteDeploy-${PV}"
+
+inherit setuptools3
+
+# Uncomment this line to enable all the optional features.
+#PACKAGECONFIG ?= "paste docs"
+PACKAGECONFIG[paste] = ",,,python3-paste"
+PACKAGECONFIG[docs] = ",,,python3-sphinx python3-pylons-sphinx-themes"
+
+DEPENDS= "python3 python3-setuptools-scm-native python3-pytest-runner-native"
+RDEPENDS_${PN} += "python3-core  python3-misc python3-netclient python3-pkgutil python3-setuptools python3-threading python3-core"
-- 
2.30.2

