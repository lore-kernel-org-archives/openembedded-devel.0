Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.68275.1629370979705306901
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 04:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UdYPsnm+;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id z9so8417220wrh.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 04:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ogJXvjAY0GuO5sW5jDUiqbmfmD4/82yc5VJ1s1vgzV4=;
        b=UdYPsnm+xRj9Nrq7ltl/zunZ2aUcwDpujg+YdCTI1U9+tHuWF4eGqcD8BK0Y7pBPv5
         eWKCQuesUWviUBqnzPrhwH4WQCA1D1k0Rrk3hbsn+TzfwkvNcJ+Qd+H+6iSdb4ft4ctt
         OoxSPdBW3p8bmpHC9hmZp5nXDbocKVJihWjROwhnJE6i3U53UvtL2xqqBLOlZbueyv3o
         tbEu/CorFIiIgVrph0/AyAV8Z8tySm3Xsiy+1m3RMscgRGhf7IRQtWblE0nxX5Dz5pfd
         t64VBUTUGqDCp7xgqrd+RpkzVNr85wHArasBIUbXRiu0Qktsb0cadZzTiRXQ2RXGbcGl
         fH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ogJXvjAY0GuO5sW5jDUiqbmfmD4/82yc5VJ1s1vgzV4=;
        b=SwPnBPutP2bY9NTLg9RWdtaYz20kqtnu0SGma5+/lVo8uObYzetfTJ5+OiqBvxc3iO
         iH37sw/Qj6H8q4Y0jI6R8n01r6cMgrejfbufidOFrhHZcjnQVu42MX+9Dlq6iutonhit
         doirhiHEkZ/TZy6BpToU4mQXDduJhD/qaxipcvhwAKzmiOVMtkFI3ohTR8IROmZR8bkG
         34ScY9oz36qTBMjPbMnHA4VYxWRydt3tYQg706j0a8lJSptJEsT0z5nMsqiIUkcnCIOi
         S5P6f2XQFeyLubGdgcpIXDLSP0Mn1IyS9B7flfpniJwTqrFLP14BnDVAKmk0MVFEq60F
         kZqA==
X-Gm-Message-State: AOAM532gfo0LJ+BAaT0+Uf14YFAPK7Og9qZxwhRWUrX+LYytXUm2turY
	Qf76oCj/QpgBSo4oH5iPnvpQaZNtn5DUQA==
X-Google-Smtp-Source: ABdhPJw6Gizfa+O1MPlYboSN2Qv4EU/1dOSzS/aGlni/HmrKQgbZOhbzkf9qsWjTf7CW3UnddWFHDw==
X-Received: by 2002:adf:df0c:: with SMTP id y12mr3043699wrl.155.1629370978308;
        Thu, 19 Aug 2021 04:02:58 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f030860fe64da8baf3ac76f.dip0.t-ipconnect.de. [2003:f0:7f03:860:fe64:da8b:af3a:c76f])
        by smtp.gmail.com with ESMTPSA id y13sm2119642wmj.27.2021.08.19.04.02.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 04:02:57 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/5] network-manager-applet: upgrade 1.22.0 -> 1.24.0
Date: Thu, 19 Aug 2021 13:02:46 +0200
Message-Id: <20210819110248.3505349-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819110248.3505349-1-schnitzeltony@gmail.com>
References: <20210819110248.3505349-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

=======================================================
network-manager-applet-1.24.0
Overview of changes since network-manager-applet-1.22.0
=======================================================

* If Polkit permissions allow it, create system connections (instead
  of user-restricted ones) when clicking on a Wi-Fi network in the
  applet.
* Fix display of blurry applet icon.
* Use the "port" word for dependend devices and profiles in the
  editor.
* Support storing and retrieving WireGuard preshared-key into/from a
  keyring.
* Update translations.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...anager-applet_1.22.0.bb => network-manager-applet_1.24.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.22.0.bb => network-manager-applet_1.24.0.bb} (90%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.22.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.24.0.bb
similarity index 90%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.22.0.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.24.0.bb
index cef7c7569..6ebb3ea9f 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.22.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.24.0.bb
@@ -9,7 +9,7 @@ inherit features_check gnomebase gsettings gtk-icon-cache gettext
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "c70d80b48d40a9cb99ec967cc4389f67e7f0301528a69d481572041331a646be"
+SRC_URI[archive.sha256sum] = "b9f4bca5d0352718e07b7385fb195a9bbc8fd686b7959b74137854d52aab9c58"
 
 # We don't not have ubuntu's appindicator (yet?)
 EXTRA_OEMESON = "-Dappindicator=no"
-- 
2.31.1

