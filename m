Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.923.1588022133227305194
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2020 14:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bt94Jlc/;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id a32so161616pje.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2020 14:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XhRkP+kr7wcJEZymr8RMilRoHUTukiapTyslWBHAZ5w=;
        b=bt94Jlc/oo1Jp7Oz7LWifGLRsMAnnBZmJ7n7ep+9tPk94P8lRXqtFJoyHDi9shyIfk
         zuHNMBd+ppHEh3Y0jbziepwFeEc1twPQqyKI5NSQDEv2lavnfxeBTKzlpoZGskxbga8V
         BLE+3E7cSiVSG7EQZcfntufgHZtssEEAS7MaX+hUCsa9GDPylgybitBIVx3soWXyIXZW
         3XO3ThEZItG5M9zM4jeKfp0MbjASJ0EFx8tD1oR5hCNToFjhGcGL1A3TLLIRHcydXTpL
         LsVyMomhN0Rt1XKZ6esK7GNMJk2sSelJQVQz+M4kK6iuRJU4IdCiU76yAZK8k+9rWwTh
         gdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XhRkP+kr7wcJEZymr8RMilRoHUTukiapTyslWBHAZ5w=;
        b=dwt+lU09HM6DTBgV38UEVLLUFC+GrNHKUybpHA3IZTMZCwjr5AzevV2Woz9Ay61CYb
         Q+wEPWVxLsRRSbDcuUbjaVbdVeeu+GAiJnP+dyU1Ax/NaeIN027JrcTgSYrxJYSK3a6d
         ty8b8bi5HTTzDV7ZDZiYXFUt1GFs5K5FkLsRxjwWwG/Q1Vtrvjg/jD83AxEmYWJOeLdP
         6y0hP6m8xOxSK2Eh0otuAEyBIJnT2zjSVkUyQ0fMkwW0rOnB2oWvMekYcXPUjPLrU7s5
         1Yd2+2ufjTsui/TTsEdSnhm2MkhrdmAKZdfBgDxreSM0kSg7SJ/hKn/kTr2uf24Ku6K1
         9L1w==
X-Gm-Message-State: AGi0PuaB9bnasu0RWMXKduMgha7e/UpSVD30LkG8S5qdNQI1iP7iYX1f
	jBrrwDQxoo6VANxeCqMs/oYFkSGuskY=
X-Google-Smtp-Source: APiQypKK5Bu5CcbxZTjJ5wkdhe5JqUsm0pa3q8BDEhX/gas1VqNeyGKozT9i2/uEjUQ343JJSbtEdg==
X-Received: by 2002:a17:90b:93:: with SMTP id bb19mr811896pjb.134.1588022132319;
        Mon, 27 Apr 2020 14:15:32 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:2152:6caa:5703:bc1])
        by smtp.gmail.com with ESMTPSA id w12sm12999739pfq.133.2020.04.27.14.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 14:15:31 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python2][PATCH] python-pbr: merge bb and inc files
Date: Mon, 27 Apr 2020 14:15:19 -0700
Message-Id: <20200427211519.33154-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge the contents of the inc file from oe-core to
prevent collisions and getting out of sync.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-pbr_5.4.4.bb | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/recipes-devtools/python/python-pbr_5.4.4.bb b/recipes-devtools/python/python-pbr_5.4.4.bb
index 9d7d8d7b..fb0949eb 100644
--- a/recipes-devtools/python/python-pbr_5.4.4.bb
+++ b/recipes-devtools/python/python-pbr_5.4.4.bb
@@ -1,13 +1,21 @@
-inherit setuptools
-# The inc file is in oe-core
-require recipes-devtools/python/python-pbr.inc
+SUMMARY = "Python Build Reasonableness"
+DESCRIPTION = "PBR is a library that injects some useful and sensible default behaviors into your setuptools run"
+HOMEPAGE = "https://pypi.python.org/pypi/pbr"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
 SRC_URI[md5sum] = "65cdc32e1a1ff56d481fc15aa8caf988"
 SRC_URI[sha256sum] = "139d2625547dbfa5fb0b81daebb39601c478c21956dc57e2e07b74450a8c506b"
 
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "${PYTHON_PN}-pip"
+
 do_install_append() {
         if [ -f ${D}${bindir}/pbr ]; then
                 mv ${D}${bindir}/pbr ${D}${bindir}/pbr-2
         fi
 }
 
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

