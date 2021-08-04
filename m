Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.12458.1628098248462634335
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 10:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nePH+Mgd;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id e21so3776772pla.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 10:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oolpr/9FGPzacwictgawIhw3k9PYjhcI+OlUryyysKg=;
        b=nePH+Mgdvu5whWdS5ayv54xplnUuYBDZOXgAu3RlY0hTPwCTFLefNKGd+n+P8I33Jf
         GxtCbS7jve5U04wm4opUYwI3aqrRjzj3u8jZnQpfhW8hAvZDyW92OFqWKHnQdRGJSUAc
         udv7jPfLbgGtiK2Ck8A/bXktMO1qPgSLhIaZUZKN2EVTRIpabWuIBxkYIc0tA5H73m9Y
         nvYGOaaOGytd30rAMdu3HNDJaR/URRUQJKTymfWPTy7EBvn3DcrSXRb/aN42o2zAmt8A
         eVmvSloHTdZlBfUtsEijBD3K2XjnzygmWGeTuhm5e+F5cMifb4XyhlnVs/fEcDylWVhT
         V70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oolpr/9FGPzacwictgawIhw3k9PYjhcI+OlUryyysKg=;
        b=fs1brb1GahfyelLB9UsgrSvPn9+1W3oZ7uVIkX4OvQa0Zb+vTup5walcneEM5c9Toj
         tvBPXXtQSaxqt2t1xD2qA+dr//ycSBERiv+u0novzVcucA4vbMYcoueBPhBSrWykeE0f
         tIoCGTyC8wFYlyD17WdzDpr3q9zHvWEohJ73g6g2JoKdS59WeBiHHA2IZJxeoiD3ldiF
         PRh7qXqTmqugHQk4+H0qc02+77mIJMb2vGCFBNlBTlWbUABGdzfW27rFpMLXRdaSVjOr
         mFGqbdYGJMJioDGKLQxZiC1JVKg1IW68VuzZon6J/gAtzztxw7wUlX2PZaSQ/xbY0Vc7
         NoGw==
X-Gm-Message-State: AOAM531ggAsnCZjm1z+Q6WlrusnRfIbxIRHnoxDSSj7AQa5TrCnGwCVs
	jcn3gxo6eMTVWF0LWZmySuKOgH5cxZaF8A==
X-Google-Smtp-Source: ABdhPJw1PGVmGpV6UywzyKWab4UNP9g7jb29zhXF3hEmrFUwhe3cjYy3Ym4v+NSBDoo6VDzaNpl2TA==
X-Received: by 2002:a17:90b:400e:: with SMTP id ie14mr11007658pjb.156.1628098247681;
        Wed, 04 Aug 2021 10:30:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id s7sm3459488pfk.12.2021.08.04.10.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 10:30:47 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe,meta-webserver][PATCH] emacs,libgpiod,cockpit: Fix override syntax in using FILES_${PN}
Date: Wed,  4 Aug 2021 10:30:44 -0700
Message-Id: <20210804173044.357148-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_27.2.bb            | 2 +-
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb     | 2 +-
 meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/emacs/emacs_27.2.bb b/meta-oe/recipes-support/emacs/emacs_27.2.bb
index 485d78ce4b..a91c465c1f 100644
--- a/meta-oe/recipes-support/emacs/emacs_27.2.bb
+++ b/meta-oe/recipes-support/emacs/emacs_27.2.bb
@@ -253,7 +253,7 @@ FILES:${PN}-base = " \
 "

 # Restore FILES for the full package to catch everything left
-FILES:${PN}-full = "${FILES_${PN}}"
+FILES:${PN}-full = "${FILES:${PN}}"
 FILES:${PN}-full:append = " ${datadir}/icons"


diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index 38bd23711e..ac4ba85d77 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -63,7 +63,7 @@ do_install_ptest() {
     # we're not selecting libgpiod-tools.
     install -m 0755 ${S}/tools/gpio-tools-test ${D}${PTEST_PATH}/tests/
     install -m 0755 ${S}/tools/gpio-tools-test.bats ${D}${PTEST_PATH}/tests/
-    for tool in ${FILES_${PN}-tools}; do
+    for tool in ${FILES:${PN}-tools}; do
         install ${B}/tools/.libs/$(basename $tool) ${D}${PTEST_PATH}/tests/
     done

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb
index c49ba04564..7c3c17cd78 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_220.bb
@@ -181,7 +181,7 @@ do_install:append() {
     rm -rf ${D}${libdir}/firewalld

     if ! ${@bb.utils.contains('PACKAGECONFIG', 'storaged', 'true', 'false', d)}; then
-        for filename in ${FILES_${PN}-storaged}
+        for filename in ${FILES:${PN}-storaged}
         do
             rm -rf ${D}$filename
         done
--
2.32.0
