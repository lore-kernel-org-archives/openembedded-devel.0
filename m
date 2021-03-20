Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.9347.1616275429723688135
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Mar 2021 14:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=lpui6MHo;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f54.google.com with SMTP id g25so7343483wmh.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Mar 2021 14:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+oPFGNMva188R7aKJ0yYwA8IygM+JcUlTchzryOEcC4=;
        b=lpui6MHoWi672NXPgmWg+KbOI+9oktNhq3G4x903OALUpqcSqVFh6iLwFR1a9v4wxS
         GoZbT+giKyZY4jFxzCj09nA/17EzRdtdMip59WT4QKWGEheeESusVYHTxtlksrDwMmnB
         dauNgDtR51B0G3herv4QSPanaBljFtOAPP/9mfgohfQKmfvXY0H0JtXqt02gZAhbUOf+
         8RRnV984xMXq7ddtxZU1pvDb7OnTt1aS9w0OsMVKHUpqqVDtSzM5qMNa+9uJ24qr3XPf
         HhCVebI+o2rwYNdzy1Os2Hy7+P77kKE0xMezjDVnIIxvaFE5gexohRzRNcaCh2+22+j1
         mnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+oPFGNMva188R7aKJ0yYwA8IygM+JcUlTchzryOEcC4=;
        b=q0OUON0MlC6s0O86LhiTZXjnqbidVzy89nX4sarYvmZoZFwTytB94x8nXCAYYfl62Z
         fcLzJ9ZtsnWVf0lBRFlmDYqzpP6AoyZI6KzXImG/2D71DIKHQeX+F/QIVnoF/W3Xvhl6
         uIoGLFz1SsLkkkYMCgI7NxS3OrxVdxfTDKqmi6IvVbTf0Lhmts+zG2tWicqU+hG5+gWO
         p33CXDWwCCQenqtrfk7qwh8Ty4KzQfMEA6cKa01AtpfPW0ZbTcLkUihH3Bf77HhLH4Bw
         ApuU6PYvyaycmvQvR/BXz3iXFIGdpGJ3/XcxaMuKF4Wt1CR2aMud5aXQ4PEUkf+5qiT4
         BnBw==
X-Gm-Message-State: AOAM530pfTFhd+M0dLAOeNbQPzya1S4ngJblaqvkB0gH4G1kdcZJHbtE
	oAHlKwaW8+3oY1bRh6WzaV2bDxGqqK0YOQ==
X-Google-Smtp-Source: ABdhPJxZSZ0KVFYHHpmg6Ogr273NWaA7Q01r914qrqIY3WwZsWVfmg9j5Efe0MJZSEHjvNDBD6NtAQ==
X-Received: by 2002:a1c:750d:: with SMTP id o13mr9220212wmc.76.1616275428133;
        Sat, 20 Mar 2021 14:23:48 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id p17sm11308962wmq.47.2021.03.20.14.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 14:23:47 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 3/4] python3-wpa-supplicant: fix importing the cli submodule
Date: Sat, 20 Mar 2021 22:23:08 +0100
Message-Id: <20210320212309.11310-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210320212309.11310-1-brgl@bgdev.pl>
References: <20210320212309.11310-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The @click.argument decorator in the version of click provided by
meta-python no longer takes more than one positional argument. Add a
local patch for python3-wpa-supplicant that fixes the parsing error when
running: 'from wpa_supplicant import cli'.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 ...ond-argument-from-click.argument-dec.patch | 127 ++++++++++++++++++
 .../python/python3-wpa-supplicant_0.2.bb      |   2 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-wpa-supplicant/0001-cli-drop-the-second-argument-from-click.argument-dec.patch

diff --git a/meta-python/recipes-devtools/python/python3-wpa-supplicant/0001-cli-drop-the-second-argument-from-click.argument-dec.patch b/meta-python/recipes-devtools/python/python3-wpa-supplicant/0001-cli-drop-the-second-argument-from-click.argument-dec.patch
new file mode 100644
index 000000000..59aaa7ed8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wpa-supplicant/0001-cli-drop-the-second-argument-from-click.argument-dec.patch
@@ -0,0 +1,127 @@
+From 49b133d84e7a1471bf51d8d005b1ba8b78c37724 Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <brgl@bgdev.pl>
+Date: Sat, 20 Mar 2021 20:59:54 +0100
+Subject: [PATCH] cli: drop the second argument from @click.argument()
+ decorator
+
+@click.argument no longer takes two positional arguments.
+
+Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
+---
+Upstream-Status: Pending
+
+ wpa_supplicant/cli.py | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/wpa_supplicant/cli.py b/wpa_supplicant/cli.py
+index bad5b5b..1fb322d 100644
+--- a/wpa_supplicant/cli.py
++++ b/wpa_supplicant/cli.py
+@@ -81,7 +81,7 @@ def root(ctx, debug):
+ 
+ 
+ @root.group()
+-@click.argument('ifname', 'e.g. wlan0')
++@click.argument('ifname')
+ @click.pass_context
+ def interface(ctx, ifname):
+     """Access fi.w1.wpa_supplicant1.Interface object"""
+@@ -101,7 +101,7 @@ def interface_p2p_device():
+ 
+ 
+ @root.group()
+-@click.argument('ifname', 'e.g. wlan0')
++@click.argument('ifname')
+ @click.option('--ssid', default=None, help='Look at scan results for BSS examples')
+ @click.option('--bssid', default=None, help='Look at scan results for BSS examples')
+ @click.pass_context
+@@ -149,7 +149,7 @@ def persistent_group():
+ # fi.w1.wpa_supplicant1 API
+ #
+ @root.command()
+-@click.argument('ifname', 'e.g. wlan0')
++@click.argument('ifname')
+ @click.option('--bridge_if_name', default=None, help='Bridge to control, e.g., br0')
+ @click.option('--driver', default=None, help='e.g. nl80211')
+ @click.option('--config_file', default=None, help='Config file path')
+@@ -161,7 +161,7 @@ def create_interface(ifname, bridge_if_name, driver, config_file):
+ 
+ 
+ @root.command()
+-@click.argument('ifname', 'e.g. wlan0')
++@click.argument('ifname')
+ def remove_interface(ifname):
+     """Method: Deregisters a wireless interface from wpa_supplicant"""
+     with supplicant() as supp:
+@@ -170,7 +170,7 @@ def remove_interface(ifname):
+ 
+ 
+ @root.command()
+-@click.argument('ifname', 'e.g. wlan0')
++@click.argument('ifname')
+ def get_interface(ifname):
+     """Method: Returns a D-Bus path to an object related to an interface which wpa_supplicant already controls"""
+     with supplicant() as supp:
+@@ -178,7 +178,7 @@ def get_interface(ifname):
+ 
+ 
+ @root.command(name='get')
+-@click.argument('name', 'Name of property (case sensitive)')
++@click.argument('name')
+ def root_get(name):
+     """Method: Get Property (case sensitive)"""
+     with supplicant() as supp:
+@@ -186,8 +186,8 @@ def root_get(name):
+ 
+ 
+ @root.command(name='set')
+-@click.argument('name', 'Name of property (case sensitive)')
+-@click.argument('value', 'Value to be set')
++@click.argument('name')
++@click.argument('value')
+ def root_set(name, value):
+     """Method: Set Property (case sensitive)"""
+     with supplicant() as supp:
+@@ -217,7 +217,7 @@ def disconnect(ctx):
+ 
+ 
+ @interface.command(name='get')
+-@click.argument('name', 'Name of property (case sensitive)')
++@click.argument('name')
+ @click.pass_context
+ def interface_get(ctx, name):
+     """Method: Get Property (case sensitive)"""
+@@ -227,8 +227,8 @@ def interface_get(ctx, name):
+ 
+ 
+ @interface.command(name='set')
+-@click.argument('name', 'Name of property (case sensitive)')
+-@click.argument('value', 'Value to be set')
++@click.argument('name')
++@click.argument('value')
+ @click.pass_context
+ def interface_set(ctx, name, value):
+     """Method: Set Property (case sensitive)"""
+@@ -241,7 +241,7 @@ def interface_set(ctx, name, value):
+ # fi.w1.wpa_supplicant1.BSS API
+ #
+ @bss.command(name='get')
+-@click.argument('name', 'Name of property (case sensitive)')
++@click.argument('name')
+ @click.pass_context
+ def bss_get(ctx, name):
+     """Method: Get Property (case sensitive)"""
+@@ -261,8 +261,8 @@ def bss_get(ctx, name):
+ 
+ 
+ @bss.command(name='set')
+-@click.argument('name', 'Name of property (case sensitive)')
+-@click.argument('value', 'Value to be set')
++@click.argument('name')
++@click.argument('value')
+ @click.pass_context
+ def bss_set(ctx, name, value):
+     """Method: Set Property (case sensitive)"""
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
index 9a2e3f3bc..55e508805 100644
--- a/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wpa-supplicant_0.2.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=171;endline=199;md5=462586bcbebd1
 SRC_URI[md5sum] = "c21c7841f5e03ff709a0564b2e094010"
 SRC_URI[sha256sum] = "3ad0f40a696763bb0f4d4dec5b51f6b53ccfeb7c16ebb5897349303045f94776"
 
+SRC_URI += "file://0001-cli-drop-the-second-argument-from-click.argument-dec.patch"
+
 PYPI_PACKAGE = "wpa_supplicant"
 
 inherit pypi setuptools3
-- 
2.30.1

