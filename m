Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.3727.1625562816922491185
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 02:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KpbnGzHH;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id t3so27008705edt.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 02:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HeiR+6unktq5phZdw033v1bvt+Mw01qX6AvniGtVX2w=;
        b=KpbnGzHH1H0zppz2iKq6YGAYwYF0xOOfIe/HkP0wfeRlRPIE1DGn7iNJkzqN7Y0q2o
         IZZIlsunidfCqEF4YYic3bpLJrHqwHhLctXKDc+m/fOfN1/YsUQtPFMe7wIE2/PFmer+
         cGtcAaGQLmUfe5UrO/MsZiuYlWmVKADeSayi/2SFMDxP0zfYpZXuIL0l9xjaZuFaJX0C
         aU8+82yGPJO155ZtxHcAtRGOH9/UwKHpNLt5fCfGHWR0HRGVkNo4YueWWFFh1ycMoVQ4
         ks7VvNPdX1QIX2NExwAl356e2DQ2ETdmhTPTj/J/YWtZwSFr2qRd2o10aHfsboXkVPzP
         hZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HeiR+6unktq5phZdw033v1bvt+Mw01qX6AvniGtVX2w=;
        b=PapRPnDqnyknDJxacYLb/693reM8GnbBLFxQIkXDAmsxwrd4zFP548CwBRVKYu2jIx
         DTzxn+l42ZP6pfZ5TB5xq3H2jmTdPKASD9Hh6gzZJkkR/s5nclsdo6a+b8uW2eEkIhLQ
         jngH0671Q7vCidO81l8gD/Ol9hcuAjj77x5Ppg8rJ/j8DcpvzCQ4FNbbyroP2bW67GaP
         fnQl3gQaBCCgONdWeglRUq5M/RnLfNuvcD3llgjblBNxydIj97WQNs8FlL4TNBHFNKRd
         94k869LP1s5/JoVTzhCNsNdtZXwMt6t7JgFIWwNES8nBvSNoykLI/o+LEuamnx+Ee9GB
         f5fA==
X-Gm-Message-State: AOAM532ARHQCCDmZ2iyL61Ezv09Aez/mFGXutuEizS+0m7hhygB7FvMi
	ejbsfgIv+mK8KDJ6UaDisCUCFBrc/RA=
X-Google-Smtp-Source: ABdhPJznjn8PFbLkzQs+84BuV+ThXPCZlmUpUg/ErGoHgNfTu5kTOWgHdmBGYpbZMFIt1R6Mah1f8Q==
X-Received: by 2002:a05:6402:2681:: with SMTP id w1mr21552957edd.275.1625562815291;
        Tue, 06 Jul 2021 02:13:35 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f3d4039af027e3874c3f08b.dip0.t-ipconnect.de. [2003:f0:7f3d:4039:af02:7e38:74c3:f08b])
        by smtp.gmail.com with ESMTPSA id p5sm5358273ejm.115.2021.07.06.02.13.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 02:13:34 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/9] blueman: upgrade 2.1.4 -> 2.2.1
Date: Tue,  6 Jul 2021 11:13:19 +0200
Message-Id: <20210706091327.1513939-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Manually refresh 0002-fix-fail-to-enable-bluetooth.patch - it did not apply

2.2.1
Bugs fixed
    Hard dependency of DBusService on NetworkManager

2.2
New features
    Disconnect items in applet menu (plugin)
    Desktop notifications on connect / disconnect (plugin)
    Notifications with battery level for connecting devices (applet plugin)
    Stop discovery and retry connection for broken adapter drivers
    Auto-connect settings for supported services

Changes
    Drop blueman-report
    Drop blueman-assistant
    Raise minimum Python version to 3.6
    Raise GTK+ 3 version to 3.22
    Raise minimum BlueZ version to 5.48
    Allow opening device menus via keyboard (Shift+F10 or menu key)
    Add Ctrl+Q and Ctrl+W accelerators for closing blueman-manager
    Allow cancelling device connection attempts
    Improved passkey handling (fixed padding, highlighting, single notifitication)
    Hide devices with no name

Bugs fixed
    Fix disconnecting NMDevice
    Exceptions from asynchronous DBus calls (getting picked up by tools like Apport or ABRT)
    DiscvManager plugin showed its icon unreliably

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0002-fix-fail-to-enable-bluetooth.patch   | 20 +++++++++----------
 .../{blueman_2.1.4.bb => blueman_2.2.1.bb}    | 16 +++++++--------
 2 files changed, 17 insertions(+), 19 deletions(-)
 rename meta-networking/recipes-connectivity/blueman/{blueman_2.1.4.bb => blueman_2.2.1.bb} (85%)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman/0002-fix-fail-to-enable-bluetooth.patch b/meta-networking/recipes-connectivity/blueman/blueman/0002-fix-fail-to-enable-bluetooth.patch
index 55d1ac94c..282d82137 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman/0002-fix-fail-to-enable-bluetooth.patch
+++ b/meta-networking/recipes-connectivity/blueman/blueman/0002-fix-fail-to-enable-bluetooth.patch
@@ -22,13 +22,13 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  blueman/Functions.py                   | 10 ++++++++++
  blueman/plugins/applet/PowerManager.py |  4 ++++
- 2 files changed, 15 insertions(+), 1 deletion(-)
+ 2 files changed, 14 insertions(+)
 
 diff --git a/blueman/Functions.py b/blueman/Functions.py
-index 3b76271..c5eeb27 100644
+index 3917f42..b4d5eae 100644
 --- a/blueman/Functions.py
 +++ b/blueman/Functions.py
-@@ -86,6 +86,16 @@ def check_bluetooth_status(message, exitfunc):
+@@ -80,6 +80,16 @@ def check_bluetooth_status(message: str, exitfunc: Callable[[], Any]) -> None:
              return
  
      applet.SetBluetoothStatus('(b)', True)
@@ -46,27 +46,27 @@ index 3b76271..c5eeb27 100644
          print('Failed to enable bluetooth')
          exitfunc()
 diff --git a/blueman/plugins/applet/PowerManager.py b/blueman/plugins/applet/PowerManager.py
-index 8ec9fc4..29a0fb0 100644
+index c2f7bc3..bf6c99f 100644
 --- a/blueman/plugins/applet/PowerManager.py
 +++ b/blueman/plugins/applet/PowerManager.py
-@@ -48,6 +48,7 @@ class PowerManager(AppletPlugin):
+@@ -63,6 +63,7 @@ class PowerManager(AppletPlugin, StatusIconProvider):
          self._add_dbus_signal("BluetoothStatusChanged", "b")
          self._add_dbus_method("SetBluetoothStatus", ("b",), "", self.request_power_state)
          self._add_dbus_method("GetBluetoothStatus", (), "b", self.get_bluetooth_status)
 +        self._add_dbus_method("GetRequestStatus", (), "b", self.get_request_status)
  
-     def on_unload(self):
+     def on_unload(self) -> None:
          self.parent.Plugins.Menu.unregister(self)
-@@ -182,6 +183,9 @@ class PowerManager(AppletPlugin):
-     def get_bluetooth_status(self):
+@@ -196,6 +197,9 @@ class PowerManager(AppletPlugin, StatusIconProvider):
+     def get_bluetooth_status(self) -> bool:
          return self.current_state
  
 +    def get_request_status(self):
 +        return self.request_in_progress
 +
-     def on_adapter_property_changed(self, _path, key, value):
+     def on_adapter_property_changed(self, _path: str, key: str, value: Any) -> None:
          if key == "Powered":
              if value and not self.current_state:
 -- 
-2.20.1
+2.31.1
 
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.1.4.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.2.1.bb
similarity index 85%
rename from meta-networking/recipes-connectivity/blueman/blueman_2.1.4.bb
rename to meta-networking/recipes-connectivity/blueman/blueman_2.2.1.bb
index 29bef230e..3cb01ff71 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.1.4.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.2.1.bb
@@ -4,14 +4,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "bluez5 python3-pygobject python3-cython-native python3-setuptools-native intltool-native"
 
-inherit autotools systemd gsettings python3native gtk-icon-cache
+inherit autotools gettext systemd gsettings python3native gtk-icon-cache
 
 SRC_URI = " \
     https://github.com/blueman-project/blueman/releases/download/${PV}/blueman-${PV}.tar.xz \
     file://0001-Search-for-cython3.patch \
     file://0002-fix-fail-to-enable-bluetooth.patch \
 "
-SRC_URI[sha256sum] = "1d9c3d39a564d88851aa8de509f16bfa586b0b50f4307dc6c6347ba4833664da"
+SRC_URI[sha256sum] = "fcc10a2259bef2c5ac63f577010d76caed460d68810b7f70fecf056bf10a1a72"
 
 EXTRA_OECONF = " \
     --disable-appindicator \
@@ -48,12 +48,10 @@ FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_blueman.a"
 do_install_append() {
     sed -i "1s/.*/#!\/usr\/bin\/env python3/" ${D}${prefix}/libexec/blueman-rfcomm-watcher \
                                               ${D}${prefix}/libexec/blueman-mechanism \
-                                              ${D}${bindir}/blueman-tray \
-                                              ${D}${bindir}/blueman-services \
-                                              ${D}${bindir}/blueman-sendto \
-                                              ${D}${bindir}/blueman-report \
-                                              ${D}${bindir}/blueman-manager \
-                                              ${D}${bindir}/blueman-assistant \
+                                              ${D}${bindir}/blueman-adapters \
                                               ${D}${bindir}/blueman-applet \
-                                              ${D}${bindir}/blueman-adapters
+                                              ${D}${bindir}/blueman-manager \
+                                              ${D}${bindir}/blueman-sendto \
+                                              ${D}${bindir}/blueman-services \
+                                              ${D}${bindir}/blueman-tray
 }
-- 
2.31.1

