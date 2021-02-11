Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web11.376.1613068482054944684
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Feb 2021 10:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=qLXZE+An;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.195, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f195.google.com with SMTP id v6so3924347ljh.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Feb 2021 10:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZJ7eLZbjm/XHFMa5NhRKz4NXUQqgpRetmVR875HdNSc=;
        b=qLXZE+AnIv2hvg0oGQu0w8BZ8B6fbRH1Vy8TCv9wcaZcXi3pwhQWaSCBjzkDLTHxhJ
         vWxKwyn6EWebGA+xUClEkR+2QxfjFHJ2GDFhQR/o6n7SbF8kDOAmPpMzxFI5L4ZAWGF3
         KdfuwaaFaoKid4cv0eaqBX4mhl9UyTEUseSw0UvsBwPefkpnz5aiv22GMjMnBZ42zfp6
         78G3co6Hk7FMS01u3YECRxBGkogSBamOMN/qsb7Vgjah29Hxb8CTr/ZfHdoRe4Ued/oz
         Bf66m3NlZ++lbZHB2CAlIeI+LjzRRkSrDl7T5n/lS+C2ezPWiN8sReFgAVu6klbewKxk
         edew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZJ7eLZbjm/XHFMa5NhRKz4NXUQqgpRetmVR875HdNSc=;
        b=nvPMDwuNbxI19Gmy4d0Wxfn51sNrST0cbyYKRMNkK3OD9/uspWdfyRfgqOq2IJ0L3c
         +E8PnBaVcDGZdykSLTzji0zwHPXygPeML0m+k4eJgzVYFo5EeixBjHBvlD7xOuw6v2Br
         wG6pMBkStVkoeVfLIIlXlzZUHXmZEGccBigy4dzXLHEY968elAEJRQFiuq+YhGY/ALj1
         SHg7xUI9LS7b49vINc++jAN6nSMQgTri7qUuO5zNk9ZhmTr9BlmP3EqDnvb+Wxlk7xyh
         2+v5iQgHrgrGVSl+Uu80dK9POKbJXgg+HbjGMF9mHSFLl03pzK2Hahs+P2Tz2kd19RaL
         CUEg==
X-Gm-Message-State: AOAM533uR/cIXck4SMYol985CKedbmjkB7SZdfjeJN2QEWUiMhQJV3Qi
	8oP6yByosKS1bHlB+GibK7i9zmSkNwf2ZWa5
X-Google-Smtp-Source: ABdhPJxn3P/ho2qMnjHKvKXkpW2OFYsL0PkiNPBZ8BQEUd3F+SKKeENbzVcySuc3/DUi+vVvGNj+4Q==
X-Received: by 2002:a2e:9710:: with SMTP id r16mr5940391lji.358.1613068479611;
        Thu, 11 Feb 2021 10:34:39 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id h5sm998447ljj.136.2021.02.11.10.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 10:34:38 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python[PATCH v2] python3-idna: update to 3.1
Date: Thu, 11 Feb 2021 19:34:37 +0100
Message-Id: <20210211183437.2215328-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-python/recipes-devtools/python/python3-idna_2.10.bb   | 2 --
 .../python/{python-idna.inc => python3-idna_3.1.bb}        | 7 ++++---
 2 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-idna_2.10.bb
 rename meta-python/recipes-devtools/python/{python-idna.inc => python3-idna_3.1.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-idna_2.10.bb b/meta-python/recipes-devtools/python/python3-idna_2.10.bb
deleted file mode 100644
index a08ca714ac..0000000000
--- a/meta-python/recipes-devtools/python/python3-idna_2.10.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-idna.inc
diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python3-idna_3.1.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python-idna.inc
rename to meta-python/recipes-devtools/python/python3-idna_3.1.bb
index 4968f10726..fab5445954 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python3-idna_3.1.bb
@@ -1,15 +1,16 @@
 SUMMARY = "Internationalised Domain Names in Applications"
 HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=cf36c8682cc154d2d4aa57bd6246b9a1"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
 
-SRC_URI[md5sum] = "7a910c706db30d758f377db2762c0f9a"
-SRC_URI[sha256sum] = "b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6"
+SRC_URI[sha256sum] = "c5b02147e01ea9920e6b0a3f1f7bb833612d507592c837a6c49552768f4054e1"
 
 RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-codecs \
 "
 
+inherit pypi setuptools3
+
 # Remove bundled egg-info
 do_compile_prepend() {
     rm -rf ${S}/idna.egg-info
-- 
2.25.1

