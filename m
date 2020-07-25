Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web12.7701.1595674664842330318
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 03:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=W2fZNG9M;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.67, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f67.google.com with SMTP id v15so1992459lfg.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 03:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ljdQpYB36TbxdxqBJsanFgySNZ4XDLXtNmIwzwTgB8k=;
        b=W2fZNG9MFjmcXReUWLrzI53l7xfWklNe0FgC9U3udGYtGWbLu+Jgs2ia3upzAmWbiA
         A2dFgLhu3HFwKGng4oue9pc1hwae8CWyn6w3whM7c9iY/WmCluPqcKvzvSsk+jkwyIkT
         W4y6oiT1qBcUIvDB7rsbKEFteXR0cqWomP3+2Vp8QpLh6eYuHacGlKrH1PdePDwyAejl
         224l6i7k1/w4vThI/kL/7zGTjiVz0RpMCCyV7LMFCb4hXTN3yxn1LIDglAVuzsUVR5Rv
         3PWZhO1nwwPTwspEQs2u2g0vT20sXE7BSqxULciJZPDFLs1U4+WrIQInNIP6PjBZItbI
         2MSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ljdQpYB36TbxdxqBJsanFgySNZ4XDLXtNmIwzwTgB8k=;
        b=c2DRA+yAObCNca6uR5HS4jYFGwjiTV0zGB7tOyS6gmaKg0xF23Os9TEjncmtSTccz7
         4QuJyUjHC/sEfDT/ok+USFfAyrxSZX2JAPvYtNdmPXDoKysGc8jwuDk5GE1PraGM3qNb
         PbG3A+tHwc0fSZUVYznEbyKCQ3agTN2uFW2qgvm5MDUstfrKdPKk8NzPdXFBAYgFSQwR
         85WTp85sTkR31awk8eLIWg8IbSdwF6VgKiuA/Cn0J5vgZq+CRyeDDBMsIjqoDB6sub5d
         NMZbRH0eyrXNyANwtgUUWJxTUJ6znc2tWBg7xc6S81Y1ibMRx7GNJes2sajl7Gbh6R0y
         s2pQ==
X-Gm-Message-State: AOAM530xy/YChnNl1NXlQLi4k/DpauMiMDoUtAtM/0Klc8gZ5qtjUtTd
	d5t9wMfAYNOOleeHuj8N7Mo6qz3lfUs=
X-Google-Smtp-Source: ABdhPJyOWwDzRKjpSAbfP4HcNn6T3hs77Nb04lmwwPKKxOxnGlorfluy/BXnJ4Y1g9I6qgYDE2owGQ==
X-Received: by 2002:a19:257:: with SMTP id 84mr6483530lfc.208.1595674662767;
        Sat, 25 Jul 2020 03:57:42 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id t205sm1198399lff.8.2020.07.25.03.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 03:57:42 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libqmi: update to 1.26.0
Date: Sat, 25 Jul 2020 12:57:38 +0200
Message-Id: <20200725105738.2142962-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libqmi/{libqmi_1.24.12.bb => libqmi_1.26.0.bb}   | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.12.bb => libqmi_1.26.0.bb} (69%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.12.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.0.bb
similarity index 69%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.24.12.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.26.0.bb
index 6f8638544e..db01e7baa3 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.12.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "libqmi is a library for talking to WWAN devices by QMI protocol"
-DESCRIPTION = "libqmi is a glib-based library for talking to WWAN modems and devices which speak the Qualcomm MSM Interface (QMI) protocol"
+DESCRIPTION = "libqmi is a glib-based library for talking to WWAN modems and \
+               devices which speak the Qualcomm MSM Interface (QMI) protocol"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libqmi"
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = " \
@@ -9,13 +10,12 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "glib-2.0 glib-2.0-native"
 
-inherit autotools pkgconfig bash-completion
+inherit autotools pkgconfig bash-completion gobject-introspection
 
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
-           "
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "7e6e49fddb9ae2b6fcde14619d6cfe49"
-SRC_URI[sha256sum] = "2d3b91a2b8a882b17b16403c9ef7bdce522db4f0ceaa3e4dff76033885428b69"
+SRC_URI[md5sum] = "8da95a97e893311878f8ce12dcf8fad0"
+SRC_URI[sha256sum] = "7f0429e0ae58792e21512d09ca2412537840ea42696762795af1284a65fd6e40"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.25.1

