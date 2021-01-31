Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.16331.1612086602376562129
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Jan 2021 01:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LrlGock0;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id s11so15469225edd.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Jan 2021 01:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2WzAJrw0CDJd/Up6xWcR4NhUwB0Gze+idKnmR6kqKkU=;
        b=LrlGock0FiHJzIwhlsG/E8En+qVheGnmpOsH6GEGK6924CHny8UfFPRMQa7vsCm+vj
         V/2jJNzyVRdVQVNQzjD+lnJElXvDnL5MvSkSG4OVkgUV2dQDiyNt66+lsxJAaRRKqU2Y
         o2PABNsnmJZOVkWgescACDEkZvQLVrT50Nb3f2eWhFfXYq4RAcQLSClSw4v3TUs2CRJ1
         TAG3z/604ZJE1Wd7a/Y/AvHy/Emu4G+r4JnpwKbdnFSmKuvSHTzji4xocTqEkmGzTWel
         iSzzE4hdnICyZReA8vakJN8yF/Ew9FORZ0OEOJX5qyrbPgy3/kiFdZ4NfzZT7FnAV9Ph
         0zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2WzAJrw0CDJd/Up6xWcR4NhUwB0Gze+idKnmR6kqKkU=;
        b=gQQe65pjLrJwmBo2oONvT4C5Ye1qV9hWNNqOyeNERU8EAp9U/uL7ntrbAFQAHI7uCa
         7H/ncQ0b9CPB4RsKa2cBjNGbhGgOJvXRRLagRngnF94DcTJw3LWLv2tTeBiyyyTP13yd
         EVmVhJd3IGyey5roQ5u3dT1y/QtRafGtofF67MSELtDjBLFfBlPLGq0ZlAq0UYzWZ3Cd
         Gf2u9cRd4/PqEUZ8W/PJZP6XEANqz9uJcDEbPvLLoUMryR4sMp5CyKYuaTx4MAug52Q6
         K/eTO4p8s777jUAYd66o1Q805yIQ/3glF6ZySvkbxtS1LqNu9/FWFd6mYaF1aT6vUNdA
         rbNg==
X-Gm-Message-State: AOAM5306VQE7zLiA39sfBXaLuhlew3aNqpenP3JATS49f6hVpZXc317R
	NbEuQKTTK4R34Fu9pSMfwqQVbVn/Pqw=
X-Google-Smtp-Source: ABdhPJzLgZiJKyUg56EVv/s3/e5XfvSjAW6rf23UdnkTfxgF8JcJF5mGJl8BXFLcWYF6xpsYhNWCpA==
X-Received: by 2002:a50:bacb:: with SMTP id x69mr13353919ede.39.1612086600803;
        Sun, 31 Jan 2021 01:50:00 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id o13sm6452163ejb.10.2021.01.31.01.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 01:50:00 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH] python-setuptools: simplify RDEPENDS setting
Date: Sun, 31 Jan 2021 10:49:58 +0100
Message-Id: <20210131094958.9114-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* python2 version from meta-python2 caused parsing error now, which unfortunately left bitbake stuck after:
  ERROR: meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb: QA Issue: meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb: Variable RPROVIDES is set as not being package specific, please fix this. [pkgvarcheck]
  ERROR: meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb: Fatal QA errors found, failing task.
  ERROR: Failed to parse recipe: meta-python2/recipes-devtools/python/python-setuptools_42.0.2.bb

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/python/python-setuptools.inc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/recipes-devtools/python/python-setuptools.inc b/recipes-devtools/python/python-setuptools.inc
index d8bce71..5f427fd 100644
--- a/recipes-devtools/python/python-setuptools.inc
+++ b/recipes-devtools/python/python-setuptools.inc
@@ -24,6 +24,7 @@ RDEPENDS_${PN} = "\
   ${PYTHON_PN}-html \
   ${PYTHON_PN}-netserver \
   ${PYTHON_PN}-numbers \
+  ${PYTHON_PN}-pkg-resources \
   ${PYTHON_PN}-pkgutil \
   ${PYTHON_PN}-plistlib \
   ${PYTHON_PN}-shell \
@@ -43,8 +44,3 @@ BBCLASSEXTEND = "native nativesdk"
 # minimal distributions.
 PACKAGES =+ "${PYTHON_PN}-pkg-resources "
 FILES_${PYTHON_PN}-pkg-resources = "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
-# Due to the way OE-Core implemented native recipes, the native class cannot
-# have a dependency on something that is not a recipe name. Work around that by
-# manually setting RPROVIDES.
-RDEPENDS_${PN}_append = " ${PYTHON_PN}-pkg-resources"
-RPROVIDES_append_class-native = " ${PYTHON_PN}-pkg-resources-native"
-- 
2.27.0

