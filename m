Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.5080.1596027020435310649
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 05:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=qObqFolP;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.196, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f196.google.com with SMTP id t23so1371409ljc.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 05:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KfFUJsRCXpBXcc+EI218+dzWEjT/bc8GnGKMcNSBTEI=;
        b=qObqFolPLES0EVY/P7VuaInSE44JKpJGbtJMs+dn9TYyVxXPTz5Gn989Jk9ANi0hNA
         /nxbxD6+mDPHvkYtDKXrayLFjxnITwTqMqbTbxiOQ12IPCDQ99l/tb/q0hxPXVRN3eRj
         lRabOwGzmnoWvuJXnpv3AHz9ZazaS3b70Oq0gKtnjKwtx+43A4JdLvpQVtVA+MQepZfv
         W30ESV2Jf+vqS0x0q/YCH1NE88oAhv4VomAJ4+nasSmCPbkoG7ryE4L9o7zXFXXC1vry
         815PuyO/hNCDpVNyvfKH6gEhY3qEQifXAbNlD49Ld23BWHUDwdesBuE8VqAbbZVILtcI
         ieuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KfFUJsRCXpBXcc+EI218+dzWEjT/bc8GnGKMcNSBTEI=;
        b=UkSkGZPdLGP0zQTuXNauVUcZzzvzanviNkc09fOQ4e+y65rmtHGJsUwSQ35yVwqDh+
         4cQVCLCcO0wlt02KmJJjLCjviG+ec3NI1x4BsheVYZD1pr4xEmv8oThX7uHTSgr3xvwE
         8iTEHa1t98kUKfsTxY6yR1zWF/YhrbgdWhKvS4upND68ioKV2vahmA1z46IMsz+d2VzJ
         z51BrOeB952VOZ4yzwilIYwX9RANbLs/SV9pUEmJKgu2n3UAFpj90CYuL+i9vmES3xcn
         ylmYXxWhKHh9lEhvETkKZmWKOFJh179Zu0kiDG2rAscyJQ1o2e3Xel9KT8B3dE9fAsD2
         TGQw==
X-Gm-Message-State: AOAM530ndocw7E+/NN11j7wunKbsjeqJYHsG5xye+wkDoGnBX6W2Ik4C
	/eyxIzcz064eIeL74TOJfjqtrYMTIfA=
X-Google-Smtp-Source: ABdhPJwCkaTV8rdv7+czVUZK1Jk8GiYYHVW9Q/KTIBWIigYL/9m1sztY14I5czx6UYkqRSqELgVctg==
X-Received: by 2002:a2e:161a:: with SMTP id w26mr15454449ljd.369.1596027017963;
        Wed, 29 Jul 2020 05:50:17 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id w11sm436956lff.62.2020.07.29.05.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 05:50:17 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] openconnect: update to 8.10
Date: Wed, 29 Jul 2020 14:50:15 +0200
Message-Id: <20200729125015.3431279-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...s-tncc-wrapper.py-convert-to-python3.patch | 71 -------------------
 ...penconnect_8.03.bb => openconnect_8.10.bb} |  9 ++-
 2 files changed, 6 insertions(+), 74 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/openconnect/openconnect/0001-trojans-tncc-wrapper.py-convert-to-python3.patch
 rename meta-networking/recipes-connectivity/openconnect/{openconnect_8.03.bb => openconnect_8.10.bb} (82%)

diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect/0001-trojans-tncc-wrapper.py-convert-to-python3.patch b/meta-networking/recipes-connectivity/openconnect/openconnect/0001-trojans-tncc-wrapper.py-convert-to-python3.patch
deleted file mode 100644
index 623ec101d..000000000
--- a/meta-networking/recipes-connectivity/openconnect/openconnect/0001-trojans-tncc-wrapper.py-convert-to-python3.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From de78bcac5e1fd13de0371c8e14b062b8786ade56 Mon Sep 17 00:00:00 2001
-From: Max Krummenacher <max.krummenacher@toradex.com>
-Date: Sun, 2 Feb 2020 15:53:05 +0000
-Subject: [PATCH] trojans/tncc-wrapper.py: convert to python3
-
-Use 2to3 to convert the script to python3.
-
-Upstream-Status: Pending
-
-Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
----
- trojans/tncc-wrapper.py | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/trojans/tncc-wrapper.py b/trojans/tncc-wrapper.py
-index 0d4587bf..1a9a1f4d 100755
---- a/trojans/tncc-wrapper.py
-+++ b/trojans/tncc-wrapper.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python2
-+#!/usr/bin/python3
- 
- # Lifted from Russ Dill's juniper-vpn-wrap.py, thus:
- #
-@@ -18,19 +18,19 @@
- 
- import subprocess
- import mechanize
--import cookielib
-+import http.cookiejar
- import getpass
- import sys
- import os
- import zipfile
--import urllib
-+import urllib.request, urllib.parse, urllib.error
- import socket
- import ssl
- import errno
- import argparse
- import atexit
- import signal
--import ConfigParser
-+import configparser
- import time
- import binascii
- import hmac
-@@ -39,7 +39,7 @@ import hashlib
- def mkdir_p(path):
-     try:
-         os.mkdir(path)
--    except OSError, exc:
-+    except OSError as exc:
-         if exc.errno == errno.EEXIST and os.path.isdir(path):
-             pass
-         else:
-@@ -64,9 +64,9 @@ class Tncc:
-             if zipfile.ZipFile(self.tncc_jar, 'r').testzip() is not None:
-                 raise Exception()
-         except:
--            print 'Downloading tncc.jar...'
-+            print('Downloading tncc.jar...')
-             mkdir_p(os.path.expanduser('~/.juniper_networks'))
--            urllib.urlretrieve('https://' + self.vpn_host
-+            urllib.request.urlretrieve('https://' + self.vpn_host
-                                + '/dana-cached/hc/tncc.jar', self.tncc_jar)
- 
-         with zipfile.ZipFile(self.tncc_jar, 'r') as jar:
--- 
-2.20.1
-
diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_8.03.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_8.10.bb
similarity index 82%
rename from meta-networking/recipes-connectivity/openconnect/openconnect_8.03.bb
rename to meta-networking/recipes-connectivity/openconnect/openconnect_8.10.bb
index 597c1920c..a486cf0e0 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_8.03.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_8.10.bb
@@ -4,9 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
 
 SRC_URI = " \
     git://git.infradead.org/users/dwmw2/openconnect.git \
-    file://0001-trojans-tncc-wrapper.py-convert-to-python3.patch \
 "
-SRCREV = "ea73851969ae7a6ea54fdd2d2b8c94776af24b2a"
+SRCREV = "9d287e40c57233190a51b6434ba7345370e36f38"
 
 DEPENDS = "vpnc libxml2 krb5 gettext-native"
 RDEPENDS_${PN} = "bash python3-core vpnc-script"
@@ -23,7 +22,11 @@ PACKAGECONFIG[pcsc-lite] = "--with-libpcsclite,--without-libpcsclite,pcsc-lite,"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig bash-completion
 
 EXTRA_OECONF += "--with-vpnc-script=${sysconfdir}/vpnc/vpnc-script \
                  --disable-static"
+
+do_install_append() {
+    rm ${D}/usr/libexec/openconnect/hipreport-android.sh
+}
-- 
2.25.1

