Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.12994.1589899421780576923
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L4ZHgStc;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id b12so5701537plz.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DaU2lmGsWIpnpZgV/5WYIlfDBXqE2Ai5XZVNNnbwZsw=;
        b=L4ZHgStc5GLNtypqBiwOL3cEGq1Fesz0dyen+icIsTEbOyIOrn07IpdwUxu7+mSNOZ
         +GqseyUZO/8rSq5jnJlO3UvFGuHtskEfoykaKWdxU/+kc36bAgNNoqXSiBQNxSni2q3k
         MlsZRIWp19wlXZhH2a+qBdqsX9OEpG5KM8bIZhl8cnD9bbeblGnZP5G3vGK/vj1eyhgB
         h0y6wkOzq37V64OxIuQEGpE8umX/3AKrhZpHVIzf4rBe/GwZeG/Nt7hYZoyNjmdM3Zj5
         4IdYzxcK6qV+L8TjjOFymYMNIDTBDlG/4SeTnKS3sIbb4N7UwkK7lqPb0udvYuR0w6mg
         B/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DaU2lmGsWIpnpZgV/5WYIlfDBXqE2Ai5XZVNNnbwZsw=;
        b=SYRK3wnjs4CRh7nul8vZQ9+77B4WH+6zl1XjddlUGU7eMBrbjgelbDkjXDNOMZg1kF
         Ja3sf6ccTWnJ3WuDl7hvkYeX1R6ANc1B/Frs4F2FENL1CQQHUmOMOaWA4mxYomlerX2f
         HO6HKbxq6RoB2YdcXxd0d++znoUxJ42SSAIhEiKnKDMYsnAWd8IQQIKTakbD51SW8i27
         MJPGq7TPh/yrjPxN4yKd5KpeZyS2OdtM5lW/iPwxD3WUfkCq3QlSZ8WDZ5Dvq+Uwk4FO
         F5OpiFMpLfOVluAoFfG/NwL7vbPTsaRRUsI4JRLcfNi1MlAEnnyX+acXGDgeP54c+JCe
         t3Ug==
X-Gm-Message-State: AOAM532fTlzjFrQimuZgupkqvj7MiFpO4R55FLvYFZeR3o6LlpLHSd2J
	V/KOixLPGPeq6jeNncBmxUFZQD+m
X-Google-Smtp-Source: ABdhPJzkRH+IDrmfMexMhG74jnOAvprSnwr7G44y7jJZZeuMFJb5+eUBf+GhXR7T2l3o0nBI/8XuDw==
X-Received: by 2002:a17:902:7c16:: with SMTP id x22mr21312619pll.244.1589899420831;
        Tue, 19 May 2020 07:43:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:40 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 06/18] python3-dbusmock: re-add recipe and fix patch path
Date: Tue, 19 May 2020 07:43:20 -0700
Message-Id: <20200519144332.12822-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Running the "non-gpl3" builder in my local autobuilder fails
almost immediately because python3-dbusmock is not available. It
appears that during the creation of meta-python2 and cleanup of
meta-python that the recipe for python3-dbusmock got removed
entirely, so I've re-added it, and renamed the corresponding
patch folder so that it can find the patches listed in the
recipe.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0acb9d90bcd2dadce2102fc3b98635b942e2042b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...y-to-add-own-objects-to-internal-obj.patch |  0
 ...ty-to-import-templates-from-packages.patch |  0
 .../python/python3-dbusmock_0.16.7.bb         | 25 +++++++++++++++++++
 3 files changed, 25 insertions(+)
 rename meta-python/recipes-devtools/python/{python-dbusmock => python3-dbusmock}/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch (100%)
 rename meta-python/recipes-devtools/python/{python-dbusmock => python3-dbusmock}/0002-Add-possibility-to-import-templates-from-packages.patch (100%)
 create mode 100644 meta-python/recipes-devtools/python/python3-dbusmock_0.16.7.bb

diff --git a/meta-python/recipes-devtools/python/python-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch b/meta-python/recipes-devtools/python/python3-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch
rename to meta-python/recipes-devtools/python/python3-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch
diff --git a/meta-python/recipes-devtools/python/python-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch b/meta-python/recipes-devtools/python/python3-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch
rename to meta-python/recipes-devtools/python/python3-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch
diff --git a/meta-python/recipes-devtools/python/python3-dbusmock_0.16.7.bb b/meta-python/recipes-devtools/python/python3-dbusmock_0.16.7.bb
new file mode 100644
index 0000000000..cd760ab893
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dbusmock_0.16.7.bb
@@ -0,0 +1,25 @@
+# Copyright (c) 2014 LG Electronics, Inc.
+
+SUMMARY = "With this program/Python library you can easily create mock objects on D-Bus"
+AUTHOR = "Martin Pitt <martin.pitt@ubuntu.com>"
+
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+SRC_URI[md5sum] = "80f8caa838fad96483a8751e11d384f9"
+SRC_URI[sha256sum] = "2d2ea892fa4633c3ec6ac1e912120ec493047a5c6522849b7d1c95ad755bce75"
+
+SRC_URI += " \
+    file://0001-Add-functionality-to-add-own-objects-to-internal-obj.patch \
+    file://0002-Add-possibility-to-import-templates-from-packages.patch \
+"
+
+PYPI_PACKAGE = "python-dbusmock"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-dbus \
+    ${PYTHON_PN}-pygobject \
+    ${PYTHON_PN}-xml \
+    "
-- 
2.17.1

