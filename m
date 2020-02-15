Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id ACE6461315
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 16:00:02 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id t23so13070529wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 08:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZUhTeDay/eLHYY8IYvEn3DYcVtpSOphaE2t39++3vBM=;
	b=b7o8ab4FvlKXYBqRwPWFKNEJOCj0IyuMPl273AvHH8qPCC3PXVK/5oTkbcslOXElqE
	anpUNAMQiP1whfw6vqL+fz0c9HHEA82e2ESiOLjIs7GiofZ5dJd/dCLB0X6fGjb8I7YS
	ScVL2fUwtue0crszKUQ4GKZAIfMSxmb118ZEPVu8djeBZoIIYLLYlBY76CqHCRvLr9tx
	UuEKUAy/IgbM/V72FtLw3Ym46g/+nc+CTbcboFRxGg9fJcciprPsNW+QZS/sHb1LPxJK
	dqJGBLM8tKx0Y2UGwRPpOBklbd7uuSUp7/AZ2dqyOPqpIbZ51H0U1yq2Rb6PX1Qo6LKn
	t4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZUhTeDay/eLHYY8IYvEn3DYcVtpSOphaE2t39++3vBM=;
	b=oU5/hiWi0Ruz36Z2+kOhExB8rCk+KnQiAP3Js+P1sMVU2UrhCHY/ZFZ0bEFRFEWdRF
	NL8E5upZrLBPftZtyTqV221tkbKR4lDKVsvMfos3MDOFJk2fGIdb53fuCYcPlJkpVTkF
	BfPeoaXo7hjKasoC64ZvNifQJC0OfaLuXivEBc+0yCdX+CYg48MfMtOtASH+xZHja0Bq
	d9RPz6c8VJMZU5lPXxxwWNtwgpbpPtYHwSjOTL2w92AxgD8b3hM0SsfFCZg58ZxRRYO9
	h6hQSSQDNCln8o4aqNsJ8noJ2BmmS/hDFihH+4M57CSWqtZlGAoIT1l6u1iyFYbt4umR
	5ghw==
X-Gm-Message-State: APjAAAXXkbJAAkD2KSbx7WAnRTdRiBJOGMjr/v/gadrDA712/irWNraF
	cFgP9YhUBCiW3VXyLr5KFW4nkzOh
X-Google-Smtp-Source: APXvYqwdKta/AWsMxWX+ID51g54EirYsUDQzbusftUHh/j5R3/kEGvJw3WFlb32PCGEONsgrfHAqKA==
X-Received: by 2002:a05:600c:d7:: with SMTP id
	u23mr11730746wmm.145.1581782403055; 
	Sat, 15 Feb 2020 08:00:03 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
	[31.10.206.124]) by smtp.gmail.com with ESMTPSA id
	c9sm11666220wrq.44.2020.02.15.08.00.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 08:00:02 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Feb 2020 16:59:34 +0100
Message-Id: <20200215155935.6255-2-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200215155935.6255-1-max.krummenacher@toradex.com>
References: <20200215155935.6255-1-max.krummenacher@toradex.com>
MIME-Version: 1.0
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH 2/3] openconnect: build with python3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Feb 2020 16:00:03 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 ...s-tncc-wrapper.py-convert-to-python3.patch | 71 +++++++++++++++++++
 .../openconnect/openconnect_8.03.bb           | 12 ++--
 2 files changed, 76 insertions(+), 7 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/openconnect/openconnect/0001-trojans-tncc-wrapper.py-convert-to-python3.patch

diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect/0001-trojans-tncc-wrapper.py-convert-to-python3.patch b/meta-networking/recipes-connectivity/openconnect/openconnect/0001-trojans-tncc-wrapper.py-convert-to-python3.patch
new file mode 100644
index 000000000..623ec101d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect/0001-trojans-tncc-wrapper.py-convert-to-python3.patch
@@ -0,0 +1,71 @@
+From de78bcac5e1fd13de0371c8e14b062b8786ade56 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Sun, 2 Feb 2020 15:53:05 +0000
+Subject: [PATCH] trojans/tncc-wrapper.py: convert to python3
+
+Use 2to3 to convert the script to python3.
+
+Upstream-Status: Pending
+
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ trojans/tncc-wrapper.py | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/trojans/tncc-wrapper.py b/trojans/tncc-wrapper.py
+index 0d4587bf..1a9a1f4d 100755
+--- a/trojans/tncc-wrapper.py
++++ b/trojans/tncc-wrapper.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python2
++#!/usr/bin/python3
+ 
+ # Lifted from Russ Dill's juniper-vpn-wrap.py, thus:
+ #
+@@ -18,19 +18,19 @@
+ 
+ import subprocess
+ import mechanize
+-import cookielib
++import http.cookiejar
+ import getpass
+ import sys
+ import os
+ import zipfile
+-import urllib
++import urllib.request, urllib.parse, urllib.error
+ import socket
+ import ssl
+ import errno
+ import argparse
+ import atexit
+ import signal
+-import ConfigParser
++import configparser
+ import time
+ import binascii
+ import hmac
+@@ -39,7 +39,7 @@ import hashlib
+ def mkdir_p(path):
+     try:
+         os.mkdir(path)
+-    except OSError, exc:
++    except OSError as exc:
+         if exc.errno == errno.EEXIST and os.path.isdir(path):
+             pass
+         else:
+@@ -64,9 +64,9 @@ class Tncc:
+             if zipfile.ZipFile(self.tncc_jar, 'r').testzip() is not None:
+                 raise Exception()
+         except:
+-            print 'Downloading tncc.jar...'
++            print('Downloading tncc.jar...')
+             mkdir_p(os.path.expanduser('~/.juniper_networks'))
+-            urllib.urlretrieve('https://' + self.vpn_host
++            urllib.request.urlretrieve('https://' + self.vpn_host
+                                + '/dana-cached/hc/tncc.jar', self.tncc_jar)
+ 
+         with zipfile.ZipFile(self.tncc_jar, 'r') as jar:
+-- 
+2.20.1
+
diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_8.03.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_8.03.bb
index ec36a375a..974ff4547 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_8.03.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_8.03.bb
@@ -2,11 +2,14 @@ SUMMARY = "Open client for Cisco AnyConnect VPN"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=243b725d71bb5df4a1e5920b344b86ad"
 
-SRC_URI = "git://git.infradead.org/users/dwmw2/openconnect.git"
+SRC_URI = " \
+    git://git.infradead.org/users/dwmw2/openconnect.git \
+    file://0001-trojans-tncc-wrapper.py-convert-to-python3.patch \
+"
 SRCREV = "ea73851969ae7a6ea54fdd2d2b8c94776af24b2a"
 
 DEPENDS = "vpnc libxml2 krb5 gettext-native"
-RDEPENDS_${PN} = "bash python"
+RDEPENDS_${PN} = "bash python3-core"
 
 PACKAGECONFIG ??= "gnutls lz4 libproxy"
 
@@ -24,8 +27,3 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF += "--with-vpnc-script=${SYSROOT_DESTDIR}${sysconfdir}/vpnc/vpnc-script \
                  --disable-static"
-
-do_configure_append() {
-    # script has /usr/bin/python2 path hardcoded
-    sed -i -e 's=python2\.*=python=g' ${S}/trojans/tncc-wrapper.py
-}
-- 
2.20.1


