Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.6590.1586035569229741923
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 14:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id a6so11251805otb.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 14:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wnEajEE7G+9EOK1oSn9c6Ub5yCy96S/Nt7XkXLga7WQ=;
        b=h9pfff+T1HCDVlh2eHhzX6NJIQBASYXWDbNKbj5846wnZPj0EGG/PpmFhlKT34jc4j
         rho89mtqNRIIkbVgZm+72j67ePPpFP2v+TzWySUeFai8MQDz2xy3N67us27AETpMaSpM
         vHnkWPIzBTe4GhebfQzzwYa1abSqt0+ec2/Kz7fXNyYWItTqrJAGi7jZA6xDFtm0Sfwx
         6V4MPGEZ0fXUOw07jgfbXfPw3zmRt4oJDYDkUhJBBwQylhQUi9Wgx+otKlARgt7csqAD
         RsyQ/2cejjuGFXF8OXiHthrC/4oQNzE8cb2Lj+61Qx64NgDbmC+qrRCXh25kC8+11kTO
         roYQ==
X-Gm-Message-State: AGi0PuYvyu7dgdaPjFDcvATvRtnwvBexSihot8fK0TCHjSkaUzwdr0VU
	6PNof29mwqGsTgyN7/efE9122K3Y8d4=
X-Google-Smtp-Source: APiQypKO4Ipa1EmbdAqyxi67RH+W84xzWMoFxALy1bOPy+z/bDoCBYHi2u3Qnm+BiUDe60GYYi/3Ow==
X-Received: by 2002:a05:6820:346:: with SMTP id m6mr12020355ooe.22.1586035568001;
        Sat, 04 Apr 2020 14:26:08 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id g72sm3183470otg.79.2020.04.04.14.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 14:26:07 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 1/5] python-pytest-helpers-namespace: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 17:25:56 -0400
Message-Id: <20200404212600.25018-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-pytest-helpers-namespace.inc    | 10 ----------
 .../python3-pytest-helpers-namespace_2019.1.8.bb  | 15 +++++++++++----
 2 files changed, 11 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc

diff --git a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc b/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
deleted file mode 100644
index c091ab9768..0000000000
--- a/meta-python/recipes-devtools/python/python-pytest-helpers-namespace.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "This plugin does not provide any helpers to pytest, it does, however, provide a helpers namespace in pytest which enables you to register helper functions in your conftest.py to be used within your tests without having to import them."
-HOMEPAGE = "https://github.com/saltstack/pytest-helpers-namespace"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=cc99508c43d9d14fd51c7fac622ffd23"
-
-SRC_URI[md5sum] = "04ec1d8750f9b154e782a47cf8b30736"
-SRC_URI[sha256sum] = "4eff23a19f92410c0166f6dffbfa8901d3e14a80e97d70cd08428b6d597771ce"
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2019.1.8.bb b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2019.1.8.bb
index f03f5d415f..b3aced4f68 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2019.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2019.1.8.bb
@@ -1,7 +1,14 @@
-require python-pytest-helpers-namespace.inc
+DESCRIPTION = "This plugin does not provide any helpers to pytest, it does, however, provide a helpers namespace in pytest which enables you to register helper functions in your conftest.py to be used within your tests without having to import them."
+HOMEPAGE = "https://github.com/saltstack/pytest-helpers-namespace"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=cc99508c43d9d14fd51c7fac622ffd23"
 
-inherit setuptools3
+SRC_URI[md5sum] = "04ec1d8750f9b154e782a47cf8b30736"
+SRC_URI[sha256sum] = "4eff23a19f92410c0166f6dffbfa8901d3e14a80e97d70cd08428b6d597771ce"
+
+inherit pypi setuptools3
 
 RDEPENDS_${PN} += " \
-    python3-pytest \
-    "
+    ${PYTHON_PN}-pytest \
+"
-- 
2.17.1

