Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 12C5C60A5A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 20:44:26 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id n8so5047983wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 13:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Qw+HlV1PZlPBKIcCkgKA1xLiD562LGiJB0ORLUDvIIg=;
	b=UZ7IXwIyjnrwqDJed5HJNJHTQvtf5dn5HtgpltwQtlaoVFm8nIid89MFfDOeA/ZaDm
	1NrlBwJx+yYjmt8kEykr8R/qGPtSYDg7aAJXb4FoaOtQAPjRVVHEZ5Y/hqf2pnWBGel+
	8VmBgTNxJsYu3juwRXc2VvAXvpAz93YFOYvD+v4aK55FHqanwzfdgKrbknKOtjfiyJ90
	L6EYAMu3jF7dCg9Nc7ZpSyz7OAjAghUXZtYuYvg5OPOomnL9nyIEcadlAB9dI0A+hs96
	12bpxz7AwwpmOAGj+kszvX99La7Ey48b5a4ku1w3HSgrknlnIpIG0APDtpkS2Y4Pn3b4
	wmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Qw+HlV1PZlPBKIcCkgKA1xLiD562LGiJB0ORLUDvIIg=;
	b=WnxtrzBQMXHhCCBkFpq+7fx4nENLaC3MVcKBEi+85pnbHIInx9Lwjm+AVV/kWFkWrA
	Wjqnzl8hmoW3FjtSE/oLehLhtfI5Hm5x1upMjdNM/Rk2LhCF45+kQzxBXpHVS+73r58v
	RQWERci++4fGSdRP/wbqNveZ/XgtQMAXdn4v7edD2iRX/GuysVqqSN7JyBGKoOco+xzt
	T0Q01rwEACn8nSsnDCUsji1OXL0TO+DHoH9d8ldhgeV/Ut8AIOjDEKXcJI9vxH18RpR+
	hxA9knQQ7MyJIB1ZX4IkTxJvF1p14YIW9NPBrfy1fKTCVMm9N1cLWctlvExi2u8Vcvq7
	41fg==
X-Gm-Message-State: ANhLgQ186Rsu5k9RnZ4RLklqwiTqWZAyavYR6vfE+PBv5S3SA/W6iQKY
	xryWyYuFEpR9V+c+L/SdJYRZvVxOSRs=
X-Google-Smtp-Source: ADFU+vv5bXuPpG3b2ZKdpff9l2XJLqPRjub4qojPLvxAQAY4XC1u+TPmwsJtHRn/wakGykCZADJjPw==
X-Received: by 2002:a1c:988d:: with SMTP id a135mr4386705wme.16.1584564267285; 
	Wed, 18 Mar 2020 13:44:27 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0E8C3838FF9D0BB177A6DE.dip0.t-ipconnect.de.
	[2003:f0:7f0e:8c38:38ff:9d0b:b177:a6de])
	by smtp.gmail.com with ESMTPSA id
	j188sm3982590wmj.36.2020.03.18.13.44.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Mar 2020 13:44:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Mar 2020 21:44:08 +0100
Message-Id: <20200318204411.12996-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200318204411.12996-1-schnitzeltony@gmail.com>
References: <20200318204411.12996-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] network-manager-applet: upgrade 1.8.24 -> 1.16.0
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
X-List-Received-Date: Wed, 18 Mar 2020 20:44:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* License changed in [1] - it is still GPLv2

=======================================================
network-manager-applet-1.16.0
Overview of changes since network-manager-applet-1.8.24
=======================================================

* Turned libnma into an external dependency and move to
  "https://gitlab.gnome.org/GNOME/libnma". To build,
  libnma-1.8.28 or newer is required.
* The libnm-gtk, the deprecated libnm-glib compatibility library was
  removed. Everybody should be using libnma by now.
* Improve applet icons for hidpi.
* Fix transparent dialog borders.

[1] https://gitlab.gnome.org/GNOME/network-manager-applet/-/commit/1ab20e8d49d10a7e673efc3c15983f2fac7a41fe

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../network-manager-applet_1.16.0.bb          | 25 ++++++++++++++++
 .../network-manager-applet_1.8.24.bb          | 29 -------------------
 2 files changed, 25 insertions(+), 29 deletions(-)
 create mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.16.0.bb
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.24.bb

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.16.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.16.0.bb
new file mode 100644
index 000000000..0cac52c05
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.16.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "GTK+ applet for NetworkManager"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "gtk+3 libnma libnotify libsecret networkmanager iso-codes nss"
+
+GNOMEBASEBUILDCLASS = "meson"
+inherit features_check gnomebase gsettings gtk-icon-cache gettext
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[archive.md5sum] = "9652c2757e85d6caba657405cf794fbd"
+SRC_URI[archive.sha256sum] = "d6f98a455a271e7e169b5d35d290f4880f503cdf7593251572c9330941b5c3e5"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[modemmanager] = "-Dwwan=true, -Dwwan=false, modemmanager"
+PACKAGECONFIG[selinux] = "-Dselinux=true, -Dselinux=false, libselinux"
+
+RDEPENDS_${PN} =+ "networkmanager"
+
+FILES_${PN} += " \
+    ${datadir}/nm-applet/ \
+    ${datadir}/libnma/wifi.ui \
+    ${datadir}/metainfo \
+"
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.24.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.24.bb
deleted file mode 100644
index 0853407ca..000000000
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.24.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "GTK+ applet for NetworkManager"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-DEPENDS = "gtk+3 libnotify libsecret networkmanager iso-codes nss"
-
-GNOMEBASEBUILDCLASS = "meson"
-inherit features_check gnomebase gsettings gtk-doc gtk-icon-cache gobject-introspection gettext
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI[archive.md5sum] = "5c1bf351fde5adc12200345550516050"
-SRC_URI[archive.sha256sum] = "118bbb8a5027634b62e8b45b16ceafce74441529c99bf230654e3bec38f9fbbf"
-
-GTKDOC_MESON_OPTION = "gtk_doc"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[gcr] = "-Dgcr=true, -Dgcr=false, gcr"
-PACKAGECONFIG[modemmanager] = "-Dwwan=true, -Dwwan=false, modemmanager"
-PACKAGECONFIG[mobile-provider-info] = "-Dmobile_broadband_provider_info=true, -Dmobile_broadband_provider_info=false, mobile-broadband-provider-info,mobile-broadband-provider-info"
-PACKAGECONFIG[selinux] = "-Dselinux=true, -Dselinux=false, libselinux"
-
-RDEPENDS_${PN} =+ "networkmanager"
-
-FILES_${PN} += " \
-    ${datadir}/nm-applet/ \
-    ${datadir}/libnma/wifi.ui \
-    ${datadir}/metainfo \
-"
-- 
2.21.1


