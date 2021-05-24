Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.25378.1621872529693266280
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 May 2021 09:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fFeR37JR;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id b17so32651985ede.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 May 2021 09:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LcnoVbFar24XKsMmh/atm7PA1k8Zk35q5RK+ejz3UB4=;
        b=fFeR37JRHS8WPzwWGQcQe31AL6i70i4xSZv+onTnAloWhlFLXM/1Ne4rDNR048l27C
         n6QtvoajlUnfldWDQL+ar90VByFRKedOlKoXDfHbFoosHbw8yVw7y7wtTakyextokl3z
         2x93Xu1c/oQ8DWEe0Ybw5sEb86svtmTWk+YoaPpmPkwHeXpcHW3sVaWv6/sfd+p77A1x
         6Do3NAqD3pHknb7I2qYeMoecY59vLVZY+zozmaFkzd+zv9p+Iy4/c2AM6gRoulSApB2g
         Nn97QqtiRxazuDDetaO2hfrWmVe+km9ikvJCshsdMu0HpdalTiu5+ytpFzS37FEDq80R
         +RIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LcnoVbFar24XKsMmh/atm7PA1k8Zk35q5RK+ejz3UB4=;
        b=I482xqEXOMBCbkCUv5bsiLl4xJvkogbNrK+vhErYNOdxPqf8j2Wlwd+o0dvCRn603C
         9GLbHmcwU5LhBf0xS5UDt7h96bOP045IxNV+7A9nqWG9CxmdWatCCn/PPE0n/UloCXDj
         VL7k8qPtAKykSUVDdyr2wcN8ekshZ03a1bqsGsZ0IrUfxL/K8yzJvSpPiainT2pCMVdG
         vvo4la0gC/fXHx23i8G7gvbPlY+WO9R2n5ryr+1+KEouunw8kFsuU4dfM+ZYPLkYY0I1
         Av2uG9eNV0WVjfUerOZX17iywz58ZddrVBWdJs2bbpRJzZ4L+HAX3YmlxByBQmQ39aDH
         ULqw==
X-Gm-Message-State: AOAM5317uz8SLhbVjTndDvBUXle0sLBSDP16cvKV1Yl+UHuedMHZD2if
	LJPxb7TFChudULFU6LwhbJf1s5Q3mxs=
X-Google-Smtp-Source: ABdhPJwgSCEHOfXkQ5T6QSxvEQxmvKe23jFZQA05xJ2pQ91nCP3aoSIlwEYk0YAt0rfX3oqgERONyg==
X-Received: by 2002:a50:9e63:: with SMTP id z90mr26735785ede.342.1621872528030;
        Mon, 24 May 2021 09:08:48 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b189e31b9623dc41a84.dip0.t-ipconnect.de. [2003:f0:7f1a:3b18:9e31:b962:3dc4:1a84])
        by smtp.gmail.com with ESMTPSA id k22sm7953470eja.33.2021.05.24.09.08.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 09:08:47 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/4] mime-support: upgrade 3.48 -> 3.62
Date: Mon, 24 May 2021 18:08:37 +0200
Message-Id: <20210524160840.194431-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Many changes since 2009 (!!!) - most notable:
  CVE-2014-7209: run-mailcap shellcommand injection.
* They added Bellcore license for mailcap.man
* There is a later version 3.66 available but tarball is almost empty because
  with 3.65 they splitted mime-support into several packages

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/licenses/Bellcore                     | 13 +++++++
 ...e-support_3.48.bb => mime-support_3.62.bb} | 35 ++++++++++---------
 2 files changed, 31 insertions(+), 17 deletions(-)
 create mode 100644 meta-oe/licenses/Bellcore
 rename meta-oe/recipes-support/mime-support/{mime-support_3.48.bb => mime-support_3.62.bb} (62%)

diff --git a/meta-oe/licenses/Bellcore b/meta-oe/licenses/Bellcore
new file mode 100644
index 000000000..6bbbf94e6
--- /dev/null
+++ b/meta-oe/licenses/Bellcore
@@ -0,0 +1,13 @@
+Copyright: (c) 1991 Bell Communications Research, Inc. (Bellcore)
+License: Bellcore
+ Permission to use, copy, modify, and distribute this material 
+ for any purpose and without fee is hereby granted, provided 
+ that the above copyright notice and this permission notice 
+ appear in all copies, and that the name of Bellcore not be 
+ used in advertising or publicity pertaining to this 
+ material without the specific, prior written permission 
+ of an authorized representative of Bellcore.  BELLCORE 
+ MAKES NO REPRESENTATIONS ABOUT THE ACCURACY OR SUITABILITY 
+ OF THIS MATERIAL FOR ANY PURPOSE.  IT IS PROVIDED "AS IS", 
+ WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
+
diff --git a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb b/meta-oe/recipes-support/mime-support/mime-support_3.62.bb
similarity index 62%
rename from meta-oe/recipes-support/mime-support/mime-support_3.48.bb
rename to meta-oe/recipes-support/mime-support/mime-support_3.62.bb
index 1137f5012..858521b65 100644
--- a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
+++ b/meta-oe/recipes-support/mime-support/mime-support_3.62.bb
@@ -1,13 +1,17 @@
 SECTION = "base"
 SUMMARY = "MIME files 'mime.types' & 'mailcap', and support programs"
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://debian/README;md5=36bbe2ace0a05c3fb684b73208fbf30b"
+LICENSE = "PD & Bellcore"
+LICENSE_${PN} = "PD"
+# mailcap.man's license is Bellcore
+LICENSE_${PN}-doc = "PD & Bellcore"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=53c851e31d27c3ea8a6217073a5ff01c"
 
 DEPENDS = "file"
 RDEPENDS_${PN} = "perl"
 RRECOMMENDS_${PN} = "file"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/m/mime-support/mime-support_${PV}-1.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/m/mime-support/mime-support_${PV}.tar.gz"
+SRC_URI[sha256sum] = "54e0a03e0cd63c7c9fe68a18ead0a2143fd3c327604215f989d85484d0409f4a"
 S = "${WORKDIR}/${BPN}"
 
 inherit update-alternatives
@@ -27,22 +31,22 @@ do_install () {
     install -d ${D}${mandir}/man8
     install -m 644 mime.types         ${D}${sysconfdir}/
     install -m 644 mailcap            ${D}${libdir}/mime/
-    install -m 644 mailcap.order           ${D}${sysconfdir}/
+    install -m 644 mailcap.order      ${D}${sysconfdir}/
     install -m 644 mailcap.man        ${D}${mandir}/man5/mailcap.5
-    install -m 644 mailcap.order.man    ${D}${mandir}/man5/mailcap.order.5
-#    install -m 755 install-mime        ${D}${sbindir}/
-#    install -m 644 install-mime.man        ${D}${mandir}/man8/install-mime.8
+    install -m 644 mailcap.order.man  ${D}${mandir}/man5/mailcap.order.5
+#    install -m 755 install-mime       ${D}${sbindir}/
+#    install -m 644 install-mime.man   ${D}${mandir}/man8/install-mime.8
     install -m 755 update-mime        ${D}${sbindir}/
-    install -m 644 update-mime.man        ${D}${mandir}/man8/update-mime.8
+    install -m 644 update-mime.man    ${D}${mandir}/man8/update-mime.8
     install -m 755 run-mailcap        ${D}${bindir}/
-    install -m 644 run-mailcap.man        ${D}${mandir}/man1/run-mailcap.1
-#    install -m 644 rfcs/*            ${D}${docdir}/
-    install -m 644 debian/changelog        ${D}${docdir}/changelog.Debian
-    install -m 644 debian/README        ${D}${docdir}/copyright
+    install -m 644 run-mailcap.man    ${D}${mandir}/man1/run-mailcap.1
+#    install -m 644 rfcs/*             ${D}${docdir}/
+    install -m 644 debian/changelog   ${D}${docdir}/changelog.Debian
+    install -m 644 debian/copyright   ${D}${docdir}/copyright
     install -m 755 debian-view        ${D}${libdir}/mime/
-    install -m 755 playaudio        ${D}${libdir}/mime/
+    install -m 755 playaudio          ${D}${libdir}/mime/
     install -m 755 playdsp            ${D}${libdir}/mime/
-    install -m 644 mailcap.entries        ${D}${libdir}/mime/packages/mime-support
+    install -m 644 mailcap.entries    ${D}${libdir}/mime/packages/mime-support
     cd ${D}${mandir}; gzip -9fv */*
     cd ${D}${docdir}; gzip -9v *
     cd ${D}${docdir}; gunzip copyright.gz
@@ -56,9 +60,6 @@ do_install () {
     cd ${D}${mandir}/man1; ln -s run-mailcap.1.gz print.1.gz
 }
 
-SRC_URI[md5sum] = "d6e5d715e331147352c50c158dbdec6d"
-SRC_URI[sha256sum] = "a529c7892cb786f514af71f4ca5a4c3ebc58b538a49ff959c0d97592d38f040a"
-
 ALTERNATIVE_PRIORITY = "90"
 ALTERNATIVE_${PN} = "mime.types"
 ALTERNATIVE_LINK_NAME[mime.types] = "${sysconfdir}/mime.types"
-- 
2.31.1

