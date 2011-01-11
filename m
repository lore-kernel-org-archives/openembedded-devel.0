Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcgak-0000ZU-Ud
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 16:57:03 +0100
Received: by fxm17 with SMTP id 17so19263450fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 07:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=QQi1eengNh2rhKjKKUBxZD6HaRoz8/IYT8P8tYpVi20=;
	b=vvSZCzQcEDyroIm7tiyIw0LO1OqXDAB9ixdENAsxXmf7n7boK84frRV+e/j3aXqDtZ
	4v6a8ylsPNOJZ6KOrDJnyZoRShDS2W7NiNFZuut82csmeT3l361eCrrmo3tYDLaxvQak
	F9LGCWHv2fxTA9ok0Qq//uAbiUZexyr3pMFN8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=fc81gAZWouOFBEafjC9NJC4U3wHoByEdCr4NSm8u1FK6lNuUSO0GA3mxHNLbJZBKJW
	g9ISaoWwBa56R5+L5uNAcvxaBzrGl/NEc4tip/OQ9vSSHpgE/kH8c43BOzuozBrRcmzg
	jYgPiKI4zKhb2zmlb1OfuvW2oZyJvNYGrc8dU=
Received: by 10.223.107.9 with SMTP id z9mr3240264fao.148.1294761392058;
	Tue, 11 Jan 2011 07:56:32 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id k6sm7448279faa.6.2011.01.11.07.56.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 07:56:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 16:56:22 +0100
Message-Id: <1294761389-13634-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
In-Reply-To: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 05/12] xorg-driver: obsolete old versions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jan 2011 15:57:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/xf86-input-aiptek_1.3.0.bb         |    6 +++
 .../xorg-driver/xf86-input-elographics_1.2.3.bb    |    7 +++
 .../obsolete/xorg-driver/xf86-input-evdev_2.3.0.bb |    7 +++
 .../xorg-driver/xf86-input-keyboard_1.4.0.bb       |    8 +++
 .../obsolete/xorg-driver/xf86-input-mouse_1.5.0.bb |    7 +++
 .../xorg-driver/xf86-input-penmount_1.4.0.bb       |    7 +++
 .../xorg-driver/xf86-input-synaptics_1.2.0.bb      |    7 +++
 .../xorg-driver/xf86-input-synaptics_1.2.99.901.bb |    7 +++
 .../01_fix-wrong-value-range-for-the-axises.diff   |   47 ++++++++++++++++++++
 .../xorg-driver/xf86-input-tslib/dynamic-xy.patch  |   17 +++++++
 .../xf86-input-tslib/use-hal-for-device.diff       |   45 +++++++++++++++++++
 .../xorg-driver/xf86-input-tslib/xserver16.patch   |   26 +++++++++++
 .../obsolete/xorg-driver/xf86-input-tslib_0.0.5.bb |   24 ++++++++++
 .../xorg-driver/xf86-input-vmmouse_12.6.5.bb       |    9 ++++
 .../obsolete/xorg-driver/xf86-input-void_1.3.0.bb  |    7 +++
 .../xf86-video-apm/get-rid-of-host-includes.patch  |   13 +++++
 .../obsolete/xorg-driver/xf86-video-apm_1.2.2.bb   |    9 ++++
 .../xf86-video-ark/get-rid-of-host-includes.patch  |   13 +++++
 .../obsolete/xorg-driver/xf86-video-ark_0.7.2.bb   |    8 +++
 .../obsolete/xorg-driver/xf86-video-ast_0.89.9.bb  |    6 +++
 .../obsolete/xorg-driver/xf86-video-ati_6.12.4.bb  |    8 +++
 .../obsolete/xorg-driver/xf86-video-chips_1.2.2.bb |    7 +++
 .../get-rid-of-host-includes.patch                 |   13 +++++
 .../obsolete/xorg-driver/xf86-video-dummy_0.3.2.bb |    8 +++
 .../obsolete/xorg-driver/xf86-video-fbdev_0.4.1.bb |    7 +++
 .../xorg-driver/xf86-video-geode_2.11.6.bb         |    9 ++++
 .../obsolete/xorg-driver/xf86-video-glint_1.2.4.bb |    7 +++
 .../obsolete/xorg-driver/xf86-video-i128_1.3.3.bb  |    7 +++
 .../xorg-driver/xf86-video-intel/nodolt.patch      |   12 +++++
 .../obsolete/xorg-driver/xf86-video-intel_2.9.1.bb |    9 ++++
 .../obsolete/xorg-driver/xf86-video-mga_1.4.11.bb  |    7 +++
 .../xorg-driver/xf86-video-neomagic_1.2.4.bb       |    8 +++
 .../obsolete/xorg-driver/xf86-video-nv_2.1.15.bb   |    7 +++
 .../xorg-driver/xf86-video-rendition_4.2.3.bb      |    7 +++
 .../xorg-driver/xf86-video-savage_2.3.1.bb         |   14 ++++++
 .../xorg-driver/xf86-video-siliconmotion_1.7.3.bb  |    7 +++
 .../obsolete/xorg-driver/xf86-video-sis_0.10.2.bb  |   14 ++++++
 .../xorg-driver/xf86-video-sisusb_0.9.3.bb         |    8 +++
 .../xorg-driver/xf86-video-trident_1.3.3.bb        |    8 +++
 .../obsolete/xorg-driver/xf86-video-tseng_1.2.3.bb |    6 +++
 .../xf86-video-vesa/fix-configure-includes.patch   |   13 +++++
 .../xf86-video-vesa/fix-includepath.patch          |   13 +++++
 .../obsolete/xorg-driver/xf86-video-vesa_2.2.1.bb  |    8 +++
 .../xorg-driver/xf86-video-vmware_10.16.8.bb       |    7 +++
 .../xorg-driver/xf86-video-voodoo_1.2.3.bb         |    8 +++
 .../obsolete/xorg-driver/xf86-video-xgi_1.5.1.bb   |    7 +++
 .../xorg-driver/xf86-video-xgixp_1.7.99.4.bb       |    7 +++
 recipes/xorg-driver/xf86-input-aiptek_1.3.0.bb     |    6 ---
 .../xorg-driver/xf86-input-elographics_1.2.3.bb    |    7 ---
 recipes/xorg-driver/xf86-input-evdev_2.3.0.bb      |    7 ---
 recipes/xorg-driver/xf86-input-keyboard_1.4.0.bb   |    8 ---
 recipes/xorg-driver/xf86-input-mouse_1.5.0.bb      |    7 ---
 recipes/xorg-driver/xf86-input-penmount_1.4.0.bb   |    7 ---
 recipes/xorg-driver/xf86-input-synaptics_1.2.0.bb  |    7 ---
 .../xorg-driver/xf86-input-synaptics_1.2.99.901.bb |    7 ---
 .../01_fix-wrong-value-range-for-the-axises.diff   |   47 --------------------
 .../xorg-driver/xf86-input-tslib/dynamic-xy.patch  |   17 -------
 .../xf86-input-tslib/use-hal-for-device.diff       |   45 -------------------
 .../xorg-driver/xf86-input-tslib/xserver16.patch   |   26 -----------
 recipes/xorg-driver/xf86-input-tslib_0.0.5.bb      |   24 ----------
 recipes/xorg-driver/xf86-input-vmmouse_12.6.5.bb   |    9 ----
 recipes/xorg-driver/xf86-input-void_1.3.0.bb       |    7 ---
 .../xf86-video-apm/get-rid-of-host-includes.patch  |   13 -----
 recipes/xorg-driver/xf86-video-apm_1.2.2.bb        |    9 ----
 .../xf86-video-ark/get-rid-of-host-includes.patch  |   13 -----
 recipes/xorg-driver/xf86-video-ark_0.7.2.bb        |    8 ---
 recipes/xorg-driver/xf86-video-ast_0.89.9.bb       |    6 ---
 recipes/xorg-driver/xf86-video-ati_6.12.4.bb       |    8 ---
 recipes/xorg-driver/xf86-video-chips_1.2.2.bb      |    7 ---
 .../get-rid-of-host-includes.patch                 |   13 -----
 recipes/xorg-driver/xf86-video-dummy_0.3.2.bb      |    8 ---
 recipes/xorg-driver/xf86-video-fbdev_0.4.1.bb      |    7 ---
 recipes/xorg-driver/xf86-video-geode_2.11.6.bb     |    9 ----
 recipes/xorg-driver/xf86-video-glint_1.2.4.bb      |    7 ---
 recipes/xorg-driver/xf86-video-i128_1.3.3.bb       |    7 ---
 recipes/xorg-driver/xf86-video-intel/nodolt.patch  |   12 -----
 recipes/xorg-driver/xf86-video-intel_2.9.1.bb      |    9 ----
 recipes/xorg-driver/xf86-video-mga_1.4.11.bb       |    7 ---
 recipes/xorg-driver/xf86-video-neomagic_1.2.4.bb   |    8 ---
 recipes/xorg-driver/xf86-video-nv_2.1.15.bb        |    7 ---
 recipes/xorg-driver/xf86-video-rendition_4.2.3.bb  |    7 ---
 recipes/xorg-driver/xf86-video-savage_2.3.1.bb     |   14 ------
 .../xorg-driver/xf86-video-siliconmotion_1.7.3.bb  |    7 ---
 recipes/xorg-driver/xf86-video-sis_0.10.2.bb       |   14 ------
 recipes/xorg-driver/xf86-video-sisusb_0.9.3.bb     |    8 ---
 recipes/xorg-driver/xf86-video-trident_1.3.3.bb    |    8 ---
 recipes/xorg-driver/xf86-video-tseng_1.2.3.bb      |    6 ---
 .../xf86-video-vesa/fix-configure-includes.patch   |   13 -----
 .../xf86-video-vesa/fix-includepath.patch          |   13 -----
 recipes/xorg-driver/xf86-video-vesa_2.2.1.bb       |    8 ---
 recipes/xorg-driver/xf86-video-vmware_10.16.8.bb   |    7 ---
 recipes/xorg-driver/xf86-video-voodoo_1.2.3.bb     |    8 ---
 recipes/xorg-driver/xf86-video-xgi_1.5.1.bb        |    7 ---
 recipes/xorg-driver/xf86-video-xgixp_1.7.99.4.bb   |    7 ---
 94 files changed, 516 insertions(+), 516 deletions(-)
 create mode 100644 recipes/obsolete/xorg-driver/xf86-input-aiptek_1.3.0.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-input-elographics_1.2.3.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-input-evdev_2.3.0.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-input-keyboard_1.4.0.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-input-mouse_1.5.0.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-input-penmount_1.4.0.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-input-synaptics_1.2.0.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-input-synaptics_1.2.99.901.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-input-tslib/01_fix-wrong-value-range-for-the-axises.diff
 create mode 100644 recipes/obsolete/xorg-driver/xf86-input-tslib/dynamic-xy.patch
 create mode 100644 recipes/obsolete/xorg-driver/xf86-input-tslib/use-hal-for-device.diff
 create mode 100644 recipes/obsolete/xorg-driver/xf86-input-tslib/xserver16.patch
 create mode 100644 recipes/obsolete/xorg-driver/xf86-input-tslib_0.0.5.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-input-vmmouse_12.6.5.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-input-void_1.3.0.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-apm/get-rid-of-host-includes.patch
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-apm_1.2.2.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-ark/get-rid-of-host-includes.patch
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-ark_0.7.2.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-ast_0.89.9.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-ati_6.12.4.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-chips_1.2.2.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-dummy/get-rid-of-host-includes.patch
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-dummy_0.3.2.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-fbdev_0.4.1.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-geode_2.11.6.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-glint_1.2.4.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-i128_1.3.3.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-intel/nodolt.patch
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-intel_2.9.1.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-mga_1.4.11.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-neomagic_1.2.4.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-nv_2.1.15.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-rendition_4.2.3.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-savage_2.3.1.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-siliconmotion_1.7.3.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-sis_0.10.2.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-sisusb_0.9.3.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-trident_1.3.3.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-tseng_1.2.3.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-vesa/fix-configure-includes.patch
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-vesa/fix-includepath.patch
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-vesa_2.2.1.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-vmware_10.16.8.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-voodoo_1.2.3.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-xgi_1.5.1.bb
 create mode 100644 recipes/obsolete/xorg-driver/xf86-video-xgixp_1.7.99.4.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-aiptek_1.3.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-elographics_1.2.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-evdev_2.3.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-keyboard_1.4.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-mouse_1.5.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-penmount_1.4.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-synaptics_1.2.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-synaptics_1.2.99.901.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-tslib/01_fix-wrong-value-range-for-the-axises.diff
 delete mode 100644 recipes/xorg-driver/xf86-input-tslib/dynamic-xy.patch
 delete mode 100644 recipes/xorg-driver/xf86-input-tslib/use-hal-for-device.diff
 delete mode 100644 recipes/xorg-driver/xf86-input-tslib/xserver16.patch
 delete mode 100644 recipes/xorg-driver/xf86-input-tslib_0.0.5.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-vmmouse_12.6.5.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-void_1.3.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-apm/get-rid-of-host-includes.patch
 delete mode 100644 recipes/xorg-driver/xf86-video-apm_1.2.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-ark/get-rid-of-host-includes.patch
 delete mode 100644 recipes/xorg-driver/xf86-video-ark_0.7.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-ast_0.89.9.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-ati_6.12.4.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-chips_1.2.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-dummy/get-rid-of-host-includes.patch
 delete mode 100644 recipes/xorg-driver/xf86-video-dummy_0.3.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-fbdev_0.4.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-geode_2.11.6.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-glint_1.2.4.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-i128_1.3.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-intel/nodolt.patch
 delete mode 100644 recipes/xorg-driver/xf86-video-intel_2.9.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-mga_1.4.11.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-neomagic_1.2.4.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-nv_2.1.15.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-rendition_4.2.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-savage_2.3.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-siliconmotion_1.7.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-sis_0.10.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-sisusb_0.9.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-trident_1.3.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-tseng_1.2.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-vesa/fix-configure-includes.patch
 delete mode 100644 recipes/xorg-driver/xf86-video-vesa/fix-includepath.patch
 delete mode 100644 recipes/xorg-driver/xf86-video-vesa_2.2.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-vmware_10.16.8.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-voodoo_1.2.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-xgi_1.5.1.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-xgixp_1.7.99.4.bb

diff --git a/recipes/obsolete/xorg-driver/xf86-input-aiptek_1.3.0.bb b/recipes/obsolete/xorg-driver/xf86-input-aiptek_1.3.0.bb
new file mode 100644
index 0000000..6dd42a7
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-input-aiptek_1.3.0.bb
@@ -0,0 +1,6 @@
+require xorg-driver-input.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ae3ec07aff6c156cf5307f53feb6b293"
+SRC_URI[archive.sha256sum] = "b37f35bb021dffc337c731bfbbb6ce7c0953dc69f7c660cbe48b0f84a07b5e5c"
diff --git a/recipes/obsolete/xorg-driver/xf86-input-elographics_1.2.3.bb b/recipes/obsolete/xorg-driver/xf86-input-elographics_1.2.3.bb
new file mode 100644
index 0000000..08103a6
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-input-elographics_1.2.3.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- ELOGraphics input driver"
+PE = "2"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "cc2923460c8eff9652b01889a063058d"
+SRC_URI[archive.sha256sum] = "67550c8f4a85a8029f08880adf487e2efd4585e7adbe8da357fbd49750b08d8f"
diff --git a/recipes/obsolete/xorg-driver/xf86-input-evdev_2.3.0.bb b/recipes/obsolete/xorg-driver/xf86-input-evdev_2.3.0.bb
new file mode 100644
index 0000000..6a4d534
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-input-evdev_2.3.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- evdev input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "21dac6461379d67ee3b333c77f63e7bf"
+SRC_URI[archive.sha256sum] = "6d57420cce9201a14f2fb5c5f6bc8999ffdcc9520020d54290eb22db27c366c8"
diff --git a/recipes/obsolete/xorg-driver/xf86-input-keyboard_1.4.0.bb b/recipes/obsolete/xorg-driver/xf86-input-keyboard_1.4.0.bb
new file mode 100644
index 0000000..2658cc6
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-input-keyboard_1.4.0.bb
@@ -0,0 +1,8 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- keyboard input driver"
+DEPENDS += " kbproto"
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "fd17158ffeacecc8cc670604460cb98b"
+SRC_URI[archive.sha256sum] = "842d36cfca68ddab4f2c562c73bfd43ba76de2d490d60034f0c5dd524aa6d6a5"
diff --git a/recipes/obsolete/xorg-driver/xf86-input-mouse_1.5.0.bb b/recipes/obsolete/xorg-driver/xf86-input-mouse_1.5.0.bb
new file mode 100644
index 0000000..a3fe9b7
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-input-mouse_1.5.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- mouse input driver"
+PE = "1"
+PR = "${INC_PR}.1"
+
+SRC_URI[archive.md5sum] = "c58629fddf0782dad5c02da6aeb35521"
+SRC_URI[archive.sha256sum] = "f303e20872ab2fb20e07a7f734d17723346d2b4b8687ea2086f7a7468d1ab397"
diff --git a/recipes/obsolete/xorg-driver/xf86-input-penmount_1.4.0.bb b/recipes/obsolete/xorg-driver/xf86-input-penmount_1.4.0.bb
new file mode 100644
index 0000000..0a0b082
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-input-penmount_1.4.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- Penmount input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "d5f1395b2dcefc7533ff5580e63f2066"
+SRC_URI[archive.sha256sum] = "8cb15e9a30f3602d22eba6c7bcca2c1040889ed0851c7b575273671c2da1bff1"
diff --git a/recipes/obsolete/xorg-driver/xf86-input-synaptics_1.2.0.bb b/recipes/obsolete/xorg-driver/xf86-input-synaptics_1.2.0.bb
new file mode 100644
index 0000000..fc6a746
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-input-synaptics_1.2.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- mouse input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2cf0a2b0b3006bcfcd85bb77d966244a"
+SRC_URI[archive.sha256sum] = "ddd5ad4c25ad2f2e46134272bf047522882deba8ac3ac04d5e11f8bd9718620c"
diff --git a/recipes/obsolete/xorg-driver/xf86-input-synaptics_1.2.99.901.bb b/recipes/obsolete/xorg-driver/xf86-input-synaptics_1.2.99.901.bb
new file mode 100644
index 0000000..8916907
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-input-synaptics_1.2.99.901.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- mouse input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "fc4c99046af0be9d67f1f5a1911b6ed5"
+SRC_URI[archive.sha256sum] = "1b3dcc3a012e0f490b800804c41240478267c13fd80101266bab98bc2c9c2a9e"
diff --git a/recipes/obsolete/xorg-driver/xf86-input-tslib/01_fix-wrong-value-range-for-the-axises.diff b/recipes/obsolete/xorg-driver/xf86-input-tslib/01_fix-wrong-value-range-for-the-axises.diff
new file mode 100644
index 0000000..b540710
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-input-tslib/01_fix-wrong-value-range-for-the-axises.diff
@@ -0,0 +1,47 @@
+--- xf86-input-tslib-0.0.5.orig/src/tslib.c
++++ xf86-input-tslib-0.0.5/src/tslib.c
+@@ -183,7 +185,7 @@
+ {
+ 	InputInfoPtr pInfo;
+ 	unsigned char map[MAXBUTTONS + 1];
+-	int i;
++	int i, axiswidth, axisheight;
+ 	struct ts_priv *priv;
+ 
+ 	ErrorF("%s\n", __FUNCTION__);
+@@ -212,17 +226,29 @@
+ 			return !Success;
+ 		}
+ 
++		switch(priv->rotate) {
++		case TSLIB_ROTATE_CW:
++		case TSLIB_ROTATE_CCW:
++			axiswidth = priv->height;
++			axisheight = priv->width;
++			break;
++		default:
++			axiswidth = priv->width;
++			axisheight = priv->height;
++			break;
++		}
++
+ 		InitValuatorAxisStruct(device, 0, 0,    	/* min val */
+-					       priv->width - 1,	/* max val */
+-					       priv->width,	/* resolution */
++					       axiswidth - 1,	/* max val */
++					       axiswidth,	/* resolution */
+ 					       0,		/* min_res */
+-					       priv->width);	/* max_res */
++					       axiswidth);	/* max_res */
+ 
+ 		InitValuatorAxisStruct(device, 1, 0,    	/* min val */
+-					       priv->height - 1,/* max val */
+-					       priv->height,	/* resolution */
++					       axisheight - 1,	/* max val */
++					       axisheight,	/* resolution */
+ 					       0,		/* min_res */
+-					       priv->height);	/* max_res */
++					       axisheight);	/* max_res */
+ 
+ 		if (InitProximityClassDeviceStruct (device) == FALSE) {
+ 			ErrorF ("Unable to allocate EVTouch touchscreen ProximityClassDeviceStruct\n");
diff --git a/recipes/obsolete/xorg-driver/xf86-input-tslib/dynamic-xy.patch b/recipes/obsolete/xorg-driver/xf86-input-tslib/dynamic-xy.patch
new file mode 100644
index 0000000..e4ff346
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-input-tslib/dynamic-xy.patch
@@ -0,0 +1,17 @@
+Index: xf86-input-tslib-0.0.5/src/tslib.c
+===================================================================
+--- xf86-input-tslib-0.0.5.orig/src/tslib.c	2008-11-11 13:48:12.000000000 +0000
++++ xf86-input-tslib-0.0.5/src/tslib.c	2008-11-11 13:51:51.000000000 +0000
+@@ -321,10 +321,10 @@
+ 	priv->screen_num = xf86SetIntOption(pInfo->options, "ScreenNumber", 0 );
+ 
+ 	priv->width = xf86SetIntOption(pInfo->options, "Width", 0);
+-	if (priv->width <= 0)	priv->width = DEFAULT_WIDTH;
++	if (priv->width <= 0)	priv->width = screenInfo.screens[0]->width;
+ 
+ 	priv->height = xf86SetIntOption(pInfo->options, "Height", 0);
+-	if (priv->height <= 0)	priv->height = DEFAULT_HEIGHT;
++	if (priv->height <= 0)	priv->height = screenInfo.screens[0]->height;
+ 
+ 	s = xf86SetStrOption(pInfo->options, "Rotate", 0);
+ 	if (s > 0) {
diff --git a/recipes/obsolete/xorg-driver/xf86-input-tslib/use-hal-for-device.diff b/recipes/obsolete/xorg-driver/xf86-input-tslib/use-hal-for-device.diff
new file mode 100644
index 0000000..9f2cfa2
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-input-tslib/use-hal-for-device.diff
@@ -0,0 +1,45 @@
+From: Markku Vire markku.vire@movial.fi <mvire@movial.fi>
+Date: Tue, 9 Oct 2007 07:29:08 +0000 (+0300)
+Subject: Changed tslib device path to use the data provided by
+X-Git-Url: http://linux.onarm.com/gitweb/?p=generic%2Fsource%2Fxf86-input-tslib.git;a=commitdiff_plain;h=9ead96bb85857c0122b7a1a4653a5863f187d511
+
+Changed tslib device path to use the data provided by
+automatic device detection.
+---
+
+--- /tmp/tslib.c	2008-11-11 13:05:57.000000000 +0100
++++ xf86-input-tslib-0.0.5/src/tslib.c	2008-11-11 13:10:55.000000000 +0100
+@@ -72,11 +72,6 @@
+ 	int width;
+ };
+ 
+-static const char *DEFAULTS[] = {
+-	"TslibDevice", "/dev/event0",
+-	NULL
+-};
+-
+ static void
+ BellProc(int percent, DeviceIntPtr pDev, pointer ctrl, int unused)
+ {
+@@ -308,7 +303,7 @@
+ 	pInfo->private = priv;
+ 
+ 	/* Collect the options, and process the common options. */
+-	xf86CollectInputOptions(pInfo, DEFAULTS, NULL);
++	xf86CollectInputOptions(pInfo, NULL, NULL);
+ 	xf86ProcessCommonOptions(pInfo, pInfo->options);
+ 
+ 	priv->screen_num = xf86SetIntOption(pInfo->options, "ScreenNumber", 0 );
+@@ -334,8 +329,10 @@
+ 		priv->rotate = TSLIB_ROTATE_NONE;
+ 	}
+ 
+-	s = xf86SetStrOption(pInfo->options, "TslibDevice", NULL);
+-
++ 	s = xf86CheckStrOption(dev->commonOptions, "path", NULL);
++  	if (!s)
++		s = xf86CheckStrOption(dev->commonOptions, "Device", NULL);
++ 
+ 	priv->ts = ts_open(s, 0);
+ 	if (!priv->ts) {
+ 		ErrorF("ts_open failed (device=%s)\n",s);
diff --git a/recipes/obsolete/xorg-driver/xf86-input-tslib/xserver16.patch b/recipes/obsolete/xorg-driver/xf86-input-tslib/xserver16.patch
new file mode 100644
index 0000000..c3108b6
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-input-tslib/xserver16.patch
@@ -0,0 +1,26 @@
+XServer 1.6.x introduced XInput3. Official drivers were fixed by X.org
+developers. This change is based on xf86-input-citron:
+
+http://cgit.freedesktop.org/xorg/driver/xf86-input-citron/commit/?id=591674bee43061f1169ebeede653fb6d98147724
+
+Signed-off-by: Marcin Juszkiewicz <marcin@buglabs.net>
+---
+ src/tslib.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+--- xf86-input-tslib-0.0.5.orig/src/tslib.c
++++ xf86-input-tslib-0.0.5/src/tslib.c
+@@ -199,11 +199,13 @@ xf86TslibControlProc(DeviceIntPtr device
+ 			return !Success;
+ 		}
+ 
+ 		if (InitValuatorClassDeviceStruct(device,
+ 						  2,
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 3
+ 						  xf86GetMotionEvents,
++#endif
+ 						  0, Absolute) == FALSE) {
+ 			ErrorF("unable to allocate Valuator class device\n");
+ 			return !Success;
+ 		}
+ 
diff --git a/recipes/obsolete/xorg-driver/xf86-input-tslib_0.0.5.bb b/recipes/obsolete/xorg-driver/xf86-input-tslib_0.0.5.bb
new file mode 100644
index 0000000..53a3963d
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-input-tslib_0.0.5.bb
@@ -0,0 +1,24 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- tslib input driver"
+DEPENDS += "tslib"
+RRECOMMENDS_${PN} += "hal tslib-calibrate"
+PR = "${INC_PR}.0"
+
+SRC_URI = "http://www.pengutronix.de/software/xf86-input-tslib/download/xf86-input-tslib-${PV}.tar.bz2;name=archive \
+           file://use-hal-for-device.diff \
+           file://01_fix-wrong-value-range-for-the-axises.diff \
+           file://dynamic-xy.patch \
+           file://xserver16.patch \
+           file://10-x11-input-tslib.fdi"
+SRC_URI[archive.md5sum] = "4231b517d216e9f80ba66f13a0f30afd"
+SRC_URI[archive.sha256sum] = "d70c64f3f4fe931e12d5af7f91ff04cd0d16dd7459061c50b3149f9e35de8091"
+
+do_configure_prepend() {
+        rm -rf ${S}/m4/ || true
+}
+do_install_append() {
+        install -d ${D}/${datadir}/hal/fdi/policy/20thirdparty
+        install -m 0644 ${WORKDIR}/10-x11-input-tslib.fdi ${D}/${datadir}/hal/fdi/policy/20thirdparty
+}
+
+FILES_${PN} += "${datadir}/hal"
diff --git a/recipes/obsolete/xorg-driver/xf86-input-vmmouse_12.6.5.bb b/recipes/obsolete/xorg-driver/xf86-input-vmmouse_12.6.5.bb
new file mode 100644
index 0000000..c330dae
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-input-vmmouse_12.6.5.bb
@@ -0,0 +1,9 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- VMMouse input driver to use with VMWare"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ce78e0135b5e34338a1ea98afb933120"
+SRC_URI[archive.sha256sum] = "381ac3b9dc47f7bb425b4748fc9945e9c70054e40d71aedcd5327b5834d68c0d"
+
+COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/obsolete/xorg-driver/xf86-input-void_1.3.0.bb b/recipes/obsolete/xorg-driver/xf86-input-void_1.3.0.bb
new file mode 100644
index 0000000..225816e
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-input-void_1.3.0.bb
@@ -0,0 +1,7 @@
+require xorg-driver-input.inc
+DESCRIPTION = "X.Org X server -- void input driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "53bdac9ca56418f4675810ed8a78b3e8"
+SRC_URI[archive.sha256sum] = "e2165ddf637703e21b3c45d83d56485c39b082b9440053d3885557c4d52b130f"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-apm/get-rid-of-host-includes.patch b/recipes/obsolete/xorg-driver/xf86-video-apm/get-rid-of-host-includes.patch
new file mode 100644
index 0000000..a7e8a09
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-apm/get-rid-of-host-includes.patch
@@ -0,0 +1,13 @@
+Index: xf86-video-apm-1.2.0/configure.ac
+===================================================================
+--- xf86-video-apm-1.2.0.orig/configure.ac	2008-06-13 20:04:44.000000000 +0200
++++ xf86-video-apm-1.2.0/configure.ac	2008-06-13 20:05:02.000000000 +0200
+@@ -63,7 +63,7 @@
+ AC_SUBST([XF86RUSH_CFLAGS])
+ 
+ CFLAGS="$CFLAGS $XORG_CFLAGS $XF86RUSH_CFLAGS"' -I$(top_srcdir)/src'
+-INCLUDES="$XORG_INCS -I${sdkdir} $XF86RUSH_INCS "'-I$(top_srcdir)/src -I$(prefix)/include'
++INCLUDES="$XORG_INCS $XF86RUSH_INCS "'-I$(top_srcdir)/src'
+ AC_SUBST([CFLAGS])
+ AC_SUBST([INCLUDES])
+ 
diff --git a/recipes/obsolete/xorg-driver/xf86-video-apm_1.2.2.bb b/recipes/obsolete/xorg-driver/xf86-video-apm_1.2.2.bb
new file mode 100644
index 0000000..12e0dc2
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-apm_1.2.2.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+DESCRIPTION = "This is the Alliance Promotion driver for XFree86 4.0+"
+DEPENDS += " xf86rushproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://get-rid-of-host-includes.patch"
+SRC_URI[archive.md5sum] = "48441a19aaf015570b267f2a8e67d8ab"
+SRC_URI[archive.sha256sum] = "678edd063e1d5e7c7f72ccdda2388c5857559847b3d313c94d659f9bd51c1752"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-ark/get-rid-of-host-includes.patch b/recipes/obsolete/xorg-driver/xf86-video-ark/get-rid-of-host-includes.patch
new file mode 100644
index 0000000..654d593
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-ark/get-rid-of-host-includes.patch
@@ -0,0 +1,13 @@
+Index: xf86-video-ark-0.7.0/configure.ac
+===================================================================
+--- xf86-video-ark-0.7.0.orig/configure.ac	2008-06-14 11:08:06.000000000 +0200
++++ xf86-video-ark-0.7.0/configure.ac	2008-06-14 11:08:17.000000000 +0200
+@@ -57,7 +57,7 @@
+ sdkdir=$(pkg-config --variable=sdkdir xorg-server)
+ 
+ CFLAGS="$CFLAGS $XORG_CFLAGS "' -I$(top_srcdir)/src'
+-INCLUDES="$XORG_INCS -I${sdkdir} "'-I$(top_srcdir)/src -I$(prefix)/include'
++INCLUDES="$XORG_INCS "'-I$(top_srcdir)/src'
+ AC_SUBST([CFLAGS])
+ AC_SUBST([INCLUDES])
+ 
diff --git a/recipes/obsolete/xorg-driver/xf86-video-ark_0.7.2.bb b/recipes/obsolete/xorg-driver/xf86-video-ark_0.7.2.bb
new file mode 100644
index 0000000..bae9efa
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-ark_0.7.2.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- ark display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://get-rid-of-host-includes.patch"
+SRC_URI[archive.md5sum] = "4745f5c722b030962cc56eb2443894a0"
+SRC_URI[archive.sha256sum] = "db1ef3e15ebd382837f16c1143035dfd9fa6465a77ae2e850201f71508065741"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-ast_0.89.9.bb b/recipes/obsolete/xorg-driver/xf86-video-ast_0.89.9.bb
new file mode 100644
index 0000000..a31235d
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-ast_0.89.9.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "619f6ff15db869be3800bb001d5b0468"
+SRC_URI[archive.sha256sum] = "880f16d32a373a052515f4ae28a3f1a97543d0d73d2ea5d74baf23bdc3a6b401"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-ati_6.12.4.bb b/recipes/obsolete/xorg-driver/xf86-video-ati_6.12.4.bb
new file mode 100644
index 0000000..5a62ae5
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-ati_6.12.4.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- ATI display driver"
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e662348f6f957fcedf52818d668ab9f5"
+SRC_URI[archive.sha256sum] = "cfde066a7087a19b624f79e95cb9a6c97a847b8802cf38d4ae6022758bf338f6"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-chips_1.2.2.bb b/recipes/obsolete/xorg-driver/xf86-video-chips_1.2.2.bb
new file mode 100644
index 0000000..9ea7003
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-chips_1.2.2.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Chips display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a3969c28c3b36ab2caa852a9324e9b70"
+SRC_URI[archive.sha256sum] = "ff6fef2cffc62feb3b23f3fee375e502ab7356d571517a89b4de67f0f6037f0e"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-dummy/get-rid-of-host-includes.patch b/recipes/obsolete/xorg-driver/xf86-video-dummy/get-rid-of-host-includes.patch
new file mode 100644
index 0000000..404e947
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-dummy/get-rid-of-host-includes.patch
@@ -0,0 +1,13 @@
+Index: xf86-video-dummy-0.3.0/configure.ac
+===================================================================
+--- xf86-video-dummy-0.3.0.orig/configure.ac	2008-06-14 12:20:36.000000000 +0200
++++ xf86-video-dummy-0.3.0/configure.ac	2008-06-14 12:20:58.000000000 +0200
+@@ -58,7 +58,7 @@
+ sdkdir=$(pkg-config --variable=sdkdir xorg-server)
+ 
+ CFLAGS="$CFLAGS $XORG_CFLAGS "' -I$(top_srcdir)/src'
+-INCLUDES="$XORG_INCS -I${sdkdir} "'-I$(top_srcdir)/src -I$(prefix)/include'
++INCLUDES="$XORG_INCS "'-I$(top_srcdir)/src'
+ AC_SUBST([CFLAGS])
+ AC_SUBST([INCLUDES])
+ 
diff --git a/recipes/obsolete/xorg-driver/xf86-video-dummy_0.3.2.bb b/recipes/obsolete/xorg-driver/xf86-video-dummy_0.3.2.bb
new file mode 100644
index 0000000..ca4bed5
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-dummy_0.3.2.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- dummy display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://get-rid-of-host-includes.patch"
+SRC_URI[archive.md5sum] = "2a6f1f07462fbe336865068cd69c8593"
+SRC_URI[archive.sha256sum] = "9389cbc21b0b5f90920fdfaad4466f4ec07674bb1ddbbf63cbb8759ace5c45fa"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-fbdev_0.4.1.bb b/recipes/obsolete/xorg-driver/xf86-video-fbdev_0.4.1.bb
new file mode 100644
index 0000000..7e6e0e7
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-fbdev_0.4.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- fbdev display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "79ce1eb9f9d2ed56de70d8e06cb767d9"
+SRC_URI[archive.sha256sum] = "2bf857179523433a9cc6c6eea059298db4c865e649aa58dfc67c828f28b7288f"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-geode_2.11.6.bb b/recipes/obsolete/xorg-driver/xf86-video-geode_2.11.6.bb
new file mode 100644
index 0000000..ab309fd
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-geode_2.11.6.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "3ff0dfb4b3bd8872c6efb70371cb6b98"
+SRC_URI[archive.sha256sum] = "4a1ada47bc08db13a57f32e73cbc5a5f0774f87ba447071737e50dfefb741f91"
+
+COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-glint_1.2.4.bb b/recipes/obsolete/xorg-driver/xf86-video-glint_1.2.4.bb
new file mode 100644
index 0000000..b39ef77
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-glint_1.2.4.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Glint display driver"
+DEPENDS += " xf86dgaproto drm xf86driproto"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "960df34e129faa411e58c0d6b56d79a3"
+SRC_URI[archive.sha256sum] = "5f8d6e3b02c261d235bae63d95510b940b6c9a775301146b3c229926ed99d76f"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-i128_1.3.3.bb b/recipes/obsolete/xorg-driver/xf86-video-i128_1.3.3.bb
new file mode 100644
index 0000000..eb4052b
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-i128_1.3.3.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- i128 display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "a597e8efeec6ab8bc6ba6d87fceb2dba"
+SRC_URI[archive.sha256sum] = "4d0691ce8e3b54075d05cc34717350be42915174b3930b2c9b7f5e309b32b02e"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-intel/nodolt.patch b/recipes/obsolete/xorg-driver/xf86-video-intel/nodolt.patch
new file mode 100644
index 0000000..c5c0e7b
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-intel/nodolt.patch
@@ -0,0 +1,12 @@
+Index: xf86-video-intel-2.9.1/configure.ac
+===================================================================
+--- xf86-video-intel-2.9.1.orig/configure.ac
++++ xf86-video-intel-2.9.1/configure.ac
+@@ -42,7 +42,6 @@ AC_CONFIG_FILES([
+ # Checks for programs.
+ AC_DISABLE_STATIC
+ AC_PROG_LIBTOOL
+-DOLT
+ AC_PROG_CC
+ AM_PROG_CC_C_O
+ 
diff --git a/recipes/obsolete/xorg-driver/xf86-video-intel_2.9.1.bb b/recipes/obsolete/xorg-driver/xf86-video-intel_2.9.1.bb
new file mode 100644
index 0000000..15b092c
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-intel_2.9.1.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
+DEPENDS += " virtual/libx11 libxvmc drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += " file://nodolt.patch "
+SRC_URI[archive.md5sum] = "8951d0366c16991badb7f9050556f4f3"
+SRC_URI[archive.sha256sum] = "95347c88854c2b41c07ab3bcdfadd1b8d27fb181a20520f185892877eb8d9d76"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-mga_1.4.11.bb b/recipes/obsolete/xorg-driver/xf86-video-mga_1.4.11.bb
new file mode 100644
index 0000000..5dc6d53
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-mga_1.4.11.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- MGA display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9d1ca965cedb0856296b47442f3c739d"
+SRC_URI[archive.sha256sum] = "c91922316f486f74d41ddbda92ff94a7917cea151ad802cf25603ab6b90f97e6"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-neomagic_1.2.4.bb b/recipes/obsolete/xorg-driver/xf86-video-neomagic_1.2.4.bb
new file mode 100644
index 0000000..a0c06e0
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-neomagic_1.2.4.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X11 driver for NeoMagic 2200, 2160, 2097, 2093, 2090, 2070"
+DEPENDS += " xf86dgaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2d722ee9b9fe8da49109f280689c9c25"
+SRC_URI[archive.sha256sum] = "434da2986d007243f4590a86d16a1632a9611b71de44d6e46f28bd3cdb898353"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-nv_2.1.15.bb b/recipes/obsolete/xorg-driver/xf86-video-nv_2.1.15.bb
new file mode 100644
index 0000000..f3f71498
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-nv_2.1.15.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- NV display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "1b22188bd9012a148206940708b52ea6"
+SRC_URI[archive.sha256sum] = "c18ce0410437ced9c171d2d6328a8406b79b6edacf55b9526594b446ee5a3641"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-rendition_4.2.3.bb b/recipes/obsolete/xorg-driver/xf86-video-rendition_4.2.3.bb
new file mode 100644
index 0000000..c92d5f6
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-rendition_4.2.3.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X11 driver supporting cards based on the V1000 or the V2x00."
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "9a0a916fe1e7b5c81cd4c80a08e646cc"
+SRC_URI[archive.sha256sum] = "9d5559fd3029feee5af2493ab8f558c58c426fc89776a1109dab97e3a4764d94"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-savage_2.3.1.bb b/recipes/obsolete/xorg-driver/xf86-video-savage_2.3.1.bb
new file mode 100644
index 0000000..175562e
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-savage_2.3.1.bb
@@ -0,0 +1,14 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Savage display driver"
+DEPENDS += " drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "66c319f610e3699c3de0f3ef630abb32"
+SRC_URI[archive.sha256sum] = "2b4adcdd820a6f3acba6f3c0995f5899edc8f5e33fb4c4666c4c7a78090ddaab"
+
+EXTRA_OECONF += " \
+  ac_cv_file__usr_include_xorg_dri_h=yes \
+  ac_cv_file__usr_include_xorg_sarea_h=yes \
+  ac_cv_file__usr_include_xorg_dristruct_h=yes \
+"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-siliconmotion_1.7.3.bb b/recipes/obsolete/xorg-driver/xf86-video-siliconmotion_1.7.3.bb
new file mode 100644
index 0000000..04cd1f0
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-siliconmotion_1.7.3.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- SiliconMotion display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "29fb322cd3adab52cc7f1ac86f9315bb"
+SRC_URI[archive.sha256sum] = "ebda468be42695c08ceaa4043da3cf5bcd5f9ab15d1482311fd6e826a8060b2b"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-sis_0.10.2.bb b/recipes/obsolete/xorg-driver/xf86-video-sis_0.10.2.bb
new file mode 100644
index 0000000..569c724
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-sis_0.10.2.bb
@@ -0,0 +1,14 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- SiS display driver"
+DEPENDS += " xineramaproto xf86miscproto xf86dgaproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f04baa307e49e9f0e5a5c3d2e89a5576"
+SRC_URI[archive.sha256sum] = "3aad701799e355669b9027a9baedd623fe6b7ce93da9ac22b6902fd7e38128c2"
+
+EXTRA_OECONF += " \
+  ac_cv_file__usr_include_xorg_dri_h=yes \
+  ac_cv_file__usr_include_xorg_sarea_h=yes \
+  ac_cv_file__usr_include_xorg_dristruct_h=yes \
+"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-sisusb_0.9.3.bb b/recipes/obsolete/xorg-driver/xf86-video-sisusb_0.9.3.bb
new file mode 100644
index 0000000..333d279
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-sisusb_0.9.3.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- SiS USB display driver"
+DEPENDS += " xineramaproto xf86miscproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "be59e9c2d9458cee0b5006549c14a95d"
+SRC_URI[archive.sha256sum] = "1df9a90ecc31d5fb63de7c970555f166dab24c0f633b54aaac4ee82fa7b49bb2"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-trident_1.3.3.bb b/recipes/obsolete/xorg-driver/xf86-video-trident_1.3.3.bb
new file mode 100644
index 0000000..f1058e7
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-trident_1.3.3.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.org X server -- Trident display driver"
+DEPENDS += " xf86dgaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "47f3c5da1942017218355f178f02ef84"
+SRC_URI[archive.sha256sum] = "6241eab6f3f0a075380be6b614e33ad72256242c865115bc8b696f83a75d11f5"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-tseng_1.2.3.bb b/recipes/obsolete/xorg-driver/xf86-video-tseng_1.2.3.bb
new file mode 100644
index 0000000..81d0b97
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-tseng_1.2.3.bb
@@ -0,0 +1,6 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "79f63999c88477801ae54dc486272ad6"
+SRC_URI[archive.sha256sum] = "0556bb3e79da4be87e880f82e2b8504527e760e284680f9463a08f9572507187"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-vesa/fix-configure-includes.patch b/recipes/obsolete/xorg-driver/xf86-video-vesa/fix-configure-includes.patch
new file mode 100644
index 0000000..a886e6c
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-vesa/fix-configure-includes.patch
@@ -0,0 +1,13 @@
+Index: xf86-video-vesa-2.0.0/configure.ac
+===================================================================
+--- xf86-video-vesa-2.0.0.orig/configure.ac	2008-11-06 15:13:02.000000000 +0000
++++ xf86-video-vesa-2.0.0/configure.ac	2008-11-06 15:13:16.000000000 +0000
+@@ -69,7 +69,7 @@
+ AM_CONDITIONAL(XSERVER_LIBPCIACCESS, test "x$XSERVER_LIBPCIACCESS" = xyes)
+ 
+ CFLAGS="$CFLAGS $XORG_CFLAGS "' -I$(top_srcdir)/src'
+-INCLUDES="$XORG_INCS -I${sdkdir} "'-I$(top_srcdir)/src'
++INCLUDES="$XORG_INCS "'-I$(top_srcdir)/src'
+ AC_SUBST([CFLAGS])
+ AC_SUBST([INCLUDES])
+ 
diff --git a/recipes/obsolete/xorg-driver/xf86-video-vesa/fix-includepath.patch b/recipes/obsolete/xorg-driver/xf86-video-vesa/fix-includepath.patch
new file mode 100644
index 0000000..c8a79c0
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-vesa/fix-includepath.patch
@@ -0,0 +1,13 @@
+Index: xf86-video-vesa-X11R7.1-1.2.0/configure.ac
+===================================================================
+--- xf86-video-vesa-X11R7.1-1.2.0.orig/configure.ac	2007-01-07 19:28:00.000000000 +0100
++++ xf86-video-vesa-X11R7.1-1.2.0/configure.ac	2007-01-07 19:28:02.000000000 +0100
+@@ -57,7 +57,7 @@
+ sdkdir=$(pkg-config --variable=sdkdir xorg-server)
+ 
+ CFLAGS="$CFLAGS $XORG_CFLAGS "' -I$(top_srcdir)/src'
+-INCLUDES="$XORG_INCS -I${sdkdir} "'-I$(top_srcdir)/src -I$(prefix)/include'
++INCLUDES="$XORG_INCS -I${sdkdir} "'-I$(top_srcdir)/src'
+ AC_SUBST([CFLAGS])
+ AC_SUBST([INCLUDES])
+ 
diff --git a/recipes/obsolete/xorg-driver/xf86-video-vesa_2.2.1.bb b/recipes/obsolete/xorg-driver/xf86-video-vesa_2.2.1.bb
new file mode 100644
index 0000000..32d2a35
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-vesa_2.2.1.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://fix-includepath.patch \
+            file://fix-configure-includes.patch"
+SRC_URI[archive.md5sum] = "61a1dc9a22991bd04d0ff98f800775c1"
+SRC_URI[archive.sha256sum] = "a3657971232e9c7db3e7517a8aedd86d3ef4d159f7099ec974cdd03aafa41080"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-vmware_10.16.8.bb b/recipes/obsolete/xorg-driver/xf86-video-vmware_10.16.8.bb
new file mode 100644
index 0000000..4fbae3b
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-vmware_10.16.8.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "25287a202c986b33bd79fbe379c96a16"
+SRC_URI[archive.sha256sum] = "956443948d94f7459b0056d8cb8ff2cd9fba4621d8b61f0257cb84469ea7da07"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-voodoo_1.2.3.bb b/recipes/obsolete/xorg-driver/xf86-video-voodoo_1.2.3.bb
new file mode 100644
index 0000000..0d16887
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-voodoo_1.2.3.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X11 driver for Voodoo/Voodoo2"
+DEPENDS += " xf86dgaproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "c164effcc839eca1fc1d43a42f4086db"
+SRC_URI[archive.sha256sum] = "025d4d99ab19325b72417fadbb099c757412988f800c9511be3e2c3993ae29e9"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-xgi_1.5.1.bb b/recipes/obsolete/xorg-driver/xf86-video-xgi_1.5.1.bb
new file mode 100644
index 0000000..63ebc5b
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-xgi_1.5.1.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "65a8d94d360b51690f8d4b2e7bfa036a"
+SRC_URI[archive.sha256sum] = "cb19f5287f9d345fc4fe15ba7c9344a3be2d8395ebf19a139899d1566d7c9e18"
diff --git a/recipes/obsolete/xorg-driver/xf86-video-xgixp_1.7.99.4.bb b/recipes/obsolete/xorg-driver/xf86-video-xgixp_1.7.99.4.bb
new file mode 100644
index 0000000..f852470
--- /dev/null
+++ b/recipes/obsolete/xorg-driver/xf86-video-xgixp_1.7.99.4.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "0e7d0df07528c57304900da3acafc1a2"
+SRC_URI[archive.sha256sum] = "ee0a178c89ff10d679e6f174d2a2e5cc7b89c7c7d5c115d48e9c75942f487395"
diff --git a/recipes/xorg-driver/xf86-input-aiptek_1.3.0.bb b/recipes/xorg-driver/xf86-input-aiptek_1.3.0.bb
deleted file mode 100644
index 6dd42a7..0000000
--- a/recipes/xorg-driver/xf86-input-aiptek_1.3.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-input.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ae3ec07aff6c156cf5307f53feb6b293"
-SRC_URI[archive.sha256sum] = "b37f35bb021dffc337c731bfbbb6ce7c0953dc69f7c660cbe48b0f84a07b5e5c"
diff --git a/recipes/xorg-driver/xf86-input-elographics_1.2.3.bb b/recipes/xorg-driver/xf86-input-elographics_1.2.3.bb
deleted file mode 100644
index 08103a6..0000000
--- a/recipes/xorg-driver/xf86-input-elographics_1.2.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- ELOGraphics input driver"
-PE = "2"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "cc2923460c8eff9652b01889a063058d"
-SRC_URI[archive.sha256sum] = "67550c8f4a85a8029f08880adf487e2efd4585e7adbe8da357fbd49750b08d8f"
diff --git a/recipes/xorg-driver/xf86-input-evdev_2.3.0.bb b/recipes/xorg-driver/xf86-input-evdev_2.3.0.bb
deleted file mode 100644
index 6a4d534..0000000
--- a/recipes/xorg-driver/xf86-input-evdev_2.3.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- evdev input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "21dac6461379d67ee3b333c77f63e7bf"
-SRC_URI[archive.sha256sum] = "6d57420cce9201a14f2fb5c5f6bc8999ffdcc9520020d54290eb22db27c366c8"
diff --git a/recipes/xorg-driver/xf86-input-keyboard_1.4.0.bb b/recipes/xorg-driver/xf86-input-keyboard_1.4.0.bb
deleted file mode 100644
index 2658cc6..0000000
--- a/recipes/xorg-driver/xf86-input-keyboard_1.4.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- keyboard input driver"
-DEPENDS += " kbproto"
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "fd17158ffeacecc8cc670604460cb98b"
-SRC_URI[archive.sha256sum] = "842d36cfca68ddab4f2c562c73bfd43ba76de2d490d60034f0c5dd524aa6d6a5"
diff --git a/recipes/xorg-driver/xf86-input-mouse_1.5.0.bb b/recipes/xorg-driver/xf86-input-mouse_1.5.0.bb
deleted file mode 100644
index a3fe9b7..0000000
--- a/recipes/xorg-driver/xf86-input-mouse_1.5.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- mouse input driver"
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "c58629fddf0782dad5c02da6aeb35521"
-SRC_URI[archive.sha256sum] = "f303e20872ab2fb20e07a7f734d17723346d2b4b8687ea2086f7a7468d1ab397"
diff --git a/recipes/xorg-driver/xf86-input-penmount_1.4.0.bb b/recipes/xorg-driver/xf86-input-penmount_1.4.0.bb
deleted file mode 100644
index 0a0b082..0000000
--- a/recipes/xorg-driver/xf86-input-penmount_1.4.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- Penmount input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "d5f1395b2dcefc7533ff5580e63f2066"
-SRC_URI[archive.sha256sum] = "8cb15e9a30f3602d22eba6c7bcca2c1040889ed0851c7b575273671c2da1bff1"
diff --git a/recipes/xorg-driver/xf86-input-synaptics_1.2.0.bb b/recipes/xorg-driver/xf86-input-synaptics_1.2.0.bb
deleted file mode 100644
index fc6a746..0000000
--- a/recipes/xorg-driver/xf86-input-synaptics_1.2.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- mouse input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2cf0a2b0b3006bcfcd85bb77d966244a"
-SRC_URI[archive.sha256sum] = "ddd5ad4c25ad2f2e46134272bf047522882deba8ac3ac04d5e11f8bd9718620c"
diff --git a/recipes/xorg-driver/xf86-input-synaptics_1.2.99.901.bb b/recipes/xorg-driver/xf86-input-synaptics_1.2.99.901.bb
deleted file mode 100644
index 8916907..0000000
--- a/recipes/xorg-driver/xf86-input-synaptics_1.2.99.901.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- mouse input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "fc4c99046af0be9d67f1f5a1911b6ed5"
-SRC_URI[archive.sha256sum] = "1b3dcc3a012e0f490b800804c41240478267c13fd80101266bab98bc2c9c2a9e"
diff --git a/recipes/xorg-driver/xf86-input-tslib/01_fix-wrong-value-range-for-the-axises.diff b/recipes/xorg-driver/xf86-input-tslib/01_fix-wrong-value-range-for-the-axises.diff
deleted file mode 100644
index b540710..0000000
--- a/recipes/xorg-driver/xf86-input-tslib/01_fix-wrong-value-range-for-the-axises.diff
+++ /dev/null
@@ -1,47 +0,0 @@
---- xf86-input-tslib-0.0.5.orig/src/tslib.c
-+++ xf86-input-tslib-0.0.5/src/tslib.c
-@@ -183,7 +185,7 @@
- {
- 	InputInfoPtr pInfo;
- 	unsigned char map[MAXBUTTONS + 1];
--	int i;
-+	int i, axiswidth, axisheight;
- 	struct ts_priv *priv;
- 
- 	ErrorF("%s\n", __FUNCTION__);
-@@ -212,17 +226,29 @@
- 			return !Success;
- 		}
- 
-+		switch(priv->rotate) {
-+		case TSLIB_ROTATE_CW:
-+		case TSLIB_ROTATE_CCW:
-+			axiswidth = priv->height;
-+			axisheight = priv->width;
-+			break;
-+		default:
-+			axiswidth = priv->width;
-+			axisheight = priv->height;
-+			break;
-+		}
-+
- 		InitValuatorAxisStruct(device, 0, 0,    	/* min val */
--					       priv->width - 1,	/* max val */
--					       priv->width,	/* resolution */
-+					       axiswidth - 1,	/* max val */
-+					       axiswidth,	/* resolution */
- 					       0,		/* min_res */
--					       priv->width);	/* max_res */
-+					       axiswidth);	/* max_res */
- 
- 		InitValuatorAxisStruct(device, 1, 0,    	/* min val */
--					       priv->height - 1,/* max val */
--					       priv->height,	/* resolution */
-+					       axisheight - 1,	/* max val */
-+					       axisheight,	/* resolution */
- 					       0,		/* min_res */
--					       priv->height);	/* max_res */
-+					       axisheight);	/* max_res */
- 
- 		if (InitProximityClassDeviceStruct (device) == FALSE) {
- 			ErrorF ("Unable to allocate EVTouch touchscreen ProximityClassDeviceStruct\n");
diff --git a/recipes/xorg-driver/xf86-input-tslib/dynamic-xy.patch b/recipes/xorg-driver/xf86-input-tslib/dynamic-xy.patch
deleted file mode 100644
index e4ff346..0000000
--- a/recipes/xorg-driver/xf86-input-tslib/dynamic-xy.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Index: xf86-input-tslib-0.0.5/src/tslib.c
-===================================================================
---- xf86-input-tslib-0.0.5.orig/src/tslib.c	2008-11-11 13:48:12.000000000 +0000
-+++ xf86-input-tslib-0.0.5/src/tslib.c	2008-11-11 13:51:51.000000000 +0000
-@@ -321,10 +321,10 @@
- 	priv->screen_num = xf86SetIntOption(pInfo->options, "ScreenNumber", 0 );
- 
- 	priv->width = xf86SetIntOption(pInfo->options, "Width", 0);
--	if (priv->width <= 0)	priv->width = DEFAULT_WIDTH;
-+	if (priv->width <= 0)	priv->width = screenInfo.screens[0]->width;
- 
- 	priv->height = xf86SetIntOption(pInfo->options, "Height", 0);
--	if (priv->height <= 0)	priv->height = DEFAULT_HEIGHT;
-+	if (priv->height <= 0)	priv->height = screenInfo.screens[0]->height;
- 
- 	s = xf86SetStrOption(pInfo->options, "Rotate", 0);
- 	if (s > 0) {
diff --git a/recipes/xorg-driver/xf86-input-tslib/use-hal-for-device.diff b/recipes/xorg-driver/xf86-input-tslib/use-hal-for-device.diff
deleted file mode 100644
index 9f2cfa2..0000000
--- a/recipes/xorg-driver/xf86-input-tslib/use-hal-for-device.diff
+++ /dev/null
@@ -1,45 +0,0 @@
-From: Markku Vire markku.vire@movial.fi <mvire@movial.fi>
-Date: Tue, 9 Oct 2007 07:29:08 +0000 (+0300)
-Subject: Changed tslib device path to use the data provided by
-X-Git-Url: http://linux.onarm.com/gitweb/?p=generic%2Fsource%2Fxf86-input-tslib.git;a=commitdiff_plain;h=9ead96bb85857c0122b7a1a4653a5863f187d511
-
-Changed tslib device path to use the data provided by
-automatic device detection.
----
-
---- /tmp/tslib.c	2008-11-11 13:05:57.000000000 +0100
-+++ xf86-input-tslib-0.0.5/src/tslib.c	2008-11-11 13:10:55.000000000 +0100
-@@ -72,11 +72,6 @@
- 	int width;
- };
- 
--static const char *DEFAULTS[] = {
--	"TslibDevice", "/dev/event0",
--	NULL
--};
--
- static void
- BellProc(int percent, DeviceIntPtr pDev, pointer ctrl, int unused)
- {
-@@ -308,7 +303,7 @@
- 	pInfo->private = priv;
- 
- 	/* Collect the options, and process the common options. */
--	xf86CollectInputOptions(pInfo, DEFAULTS, NULL);
-+	xf86CollectInputOptions(pInfo, NULL, NULL);
- 	xf86ProcessCommonOptions(pInfo, pInfo->options);
- 
- 	priv->screen_num = xf86SetIntOption(pInfo->options, "ScreenNumber", 0 );
-@@ -334,8 +329,10 @@
- 		priv->rotate = TSLIB_ROTATE_NONE;
- 	}
- 
--	s = xf86SetStrOption(pInfo->options, "TslibDevice", NULL);
--
-+ 	s = xf86CheckStrOption(dev->commonOptions, "path", NULL);
-+  	if (!s)
-+		s = xf86CheckStrOption(dev->commonOptions, "Device", NULL);
-+ 
- 	priv->ts = ts_open(s, 0);
- 	if (!priv->ts) {
- 		ErrorF("ts_open failed (device=%s)\n",s);
diff --git a/recipes/xorg-driver/xf86-input-tslib/xserver16.patch b/recipes/xorg-driver/xf86-input-tslib/xserver16.patch
deleted file mode 100644
index c3108b6..0000000
--- a/recipes/xorg-driver/xf86-input-tslib/xserver16.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-XServer 1.6.x introduced XInput3. Official drivers were fixed by X.org
-developers. This change is based on xf86-input-citron:
-
-http://cgit.freedesktop.org/xorg/driver/xf86-input-citron/commit/?id=591674bee43061f1169ebeede653fb6d98147724
-
-Signed-off-by: Marcin Juszkiewicz <marcin@buglabs.net>
----
- src/tslib.c |    2 ++
- 1 file changed, 2 insertions(+)
-
---- xf86-input-tslib-0.0.5.orig/src/tslib.c
-+++ xf86-input-tslib-0.0.5/src/tslib.c
-@@ -199,11 +199,13 @@ xf86TslibControlProc(DeviceIntPtr device
- 			return !Success;
- 		}
- 
- 		if (InitValuatorClassDeviceStruct(device,
- 						  2,
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 3
- 						  xf86GetMotionEvents,
-+#endif
- 						  0, Absolute) == FALSE) {
- 			ErrorF("unable to allocate Valuator class device\n");
- 			return !Success;
- 		}
- 
diff --git a/recipes/xorg-driver/xf86-input-tslib_0.0.5.bb b/recipes/xorg-driver/xf86-input-tslib_0.0.5.bb
deleted file mode 100644
index 53a3963d..0000000
--- a/recipes/xorg-driver/xf86-input-tslib_0.0.5.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- tslib input driver"
-DEPENDS += "tslib"
-RRECOMMENDS_${PN} += "hal tslib-calibrate"
-PR = "${INC_PR}.0"
-
-SRC_URI = "http://www.pengutronix.de/software/xf86-input-tslib/download/xf86-input-tslib-${PV}.tar.bz2;name=archive \
-           file://use-hal-for-device.diff \
-           file://01_fix-wrong-value-range-for-the-axises.diff \
-           file://dynamic-xy.patch \
-           file://xserver16.patch \
-           file://10-x11-input-tslib.fdi"
-SRC_URI[archive.md5sum] = "4231b517d216e9f80ba66f13a0f30afd"
-SRC_URI[archive.sha256sum] = "d70c64f3f4fe931e12d5af7f91ff04cd0d16dd7459061c50b3149f9e35de8091"
-
-do_configure_prepend() {
-        rm -rf ${S}/m4/ || true
-}
-do_install_append() {
-        install -d ${D}/${datadir}/hal/fdi/policy/20thirdparty
-        install -m 0644 ${WORKDIR}/10-x11-input-tslib.fdi ${D}/${datadir}/hal/fdi/policy/20thirdparty
-}
-
-FILES_${PN} += "${datadir}/hal"
diff --git a/recipes/xorg-driver/xf86-input-vmmouse_12.6.5.bb b/recipes/xorg-driver/xf86-input-vmmouse_12.6.5.bb
deleted file mode 100644
index c330dae..0000000
--- a/recipes/xorg-driver/xf86-input-vmmouse_12.6.5.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- VMMouse input driver to use with VMWare"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ce78e0135b5e34338a1ea98afb933120"
-SRC_URI[archive.sha256sum] = "381ac3b9dc47f7bb425b4748fc9945e9c70054e40d71aedcd5327b5834d68c0d"
-
-COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-input-void_1.3.0.bb b/recipes/xorg-driver/xf86-input-void_1.3.0.bb
deleted file mode 100644
index 225816e..0000000
--- a/recipes/xorg-driver/xf86-input-void_1.3.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- void input driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "53bdac9ca56418f4675810ed8a78b3e8"
-SRC_URI[archive.sha256sum] = "e2165ddf637703e21b3c45d83d56485c39b082b9440053d3885557c4d52b130f"
diff --git a/recipes/xorg-driver/xf86-video-apm/get-rid-of-host-includes.patch b/recipes/xorg-driver/xf86-video-apm/get-rid-of-host-includes.patch
deleted file mode 100644
index a7e8a09..0000000
--- a/recipes/xorg-driver/xf86-video-apm/get-rid-of-host-includes.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: xf86-video-apm-1.2.0/configure.ac
-===================================================================
---- xf86-video-apm-1.2.0.orig/configure.ac	2008-06-13 20:04:44.000000000 +0200
-+++ xf86-video-apm-1.2.0/configure.ac	2008-06-13 20:05:02.000000000 +0200
-@@ -63,7 +63,7 @@
- AC_SUBST([XF86RUSH_CFLAGS])
- 
- CFLAGS="$CFLAGS $XORG_CFLAGS $XF86RUSH_CFLAGS"' -I$(top_srcdir)/src'
--INCLUDES="$XORG_INCS -I${sdkdir} $XF86RUSH_INCS "'-I$(top_srcdir)/src -I$(prefix)/include'
-+INCLUDES="$XORG_INCS $XF86RUSH_INCS "'-I$(top_srcdir)/src'
- AC_SUBST([CFLAGS])
- AC_SUBST([INCLUDES])
- 
diff --git a/recipes/xorg-driver/xf86-video-apm_1.2.2.bb b/recipes/xorg-driver/xf86-video-apm_1.2.2.bb
deleted file mode 100644
index 12e0dc2..0000000
--- a/recipes/xorg-driver/xf86-video-apm_1.2.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "This is the Alliance Promotion driver for XFree86 4.0+"
-DEPENDS += " xf86rushproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://get-rid-of-host-includes.patch"
-SRC_URI[archive.md5sum] = "48441a19aaf015570b267f2a8e67d8ab"
-SRC_URI[archive.sha256sum] = "678edd063e1d5e7c7f72ccdda2388c5857559847b3d313c94d659f9bd51c1752"
diff --git a/recipes/xorg-driver/xf86-video-ark/get-rid-of-host-includes.patch b/recipes/xorg-driver/xf86-video-ark/get-rid-of-host-includes.patch
deleted file mode 100644
index 654d593..0000000
--- a/recipes/xorg-driver/xf86-video-ark/get-rid-of-host-includes.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: xf86-video-ark-0.7.0/configure.ac
-===================================================================
---- xf86-video-ark-0.7.0.orig/configure.ac	2008-06-14 11:08:06.000000000 +0200
-+++ xf86-video-ark-0.7.0/configure.ac	2008-06-14 11:08:17.000000000 +0200
-@@ -57,7 +57,7 @@
- sdkdir=$(pkg-config --variable=sdkdir xorg-server)
- 
- CFLAGS="$CFLAGS $XORG_CFLAGS "' -I$(top_srcdir)/src'
--INCLUDES="$XORG_INCS -I${sdkdir} "'-I$(top_srcdir)/src -I$(prefix)/include'
-+INCLUDES="$XORG_INCS "'-I$(top_srcdir)/src'
- AC_SUBST([CFLAGS])
- AC_SUBST([INCLUDES])
- 
diff --git a/recipes/xorg-driver/xf86-video-ark_0.7.2.bb b/recipes/xorg-driver/xf86-video-ark_0.7.2.bb
deleted file mode 100644
index bae9efa..0000000
--- a/recipes/xorg-driver/xf86-video-ark_0.7.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- ark display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://get-rid-of-host-includes.patch"
-SRC_URI[archive.md5sum] = "4745f5c722b030962cc56eb2443894a0"
-SRC_URI[archive.sha256sum] = "db1ef3e15ebd382837f16c1143035dfd9fa6465a77ae2e850201f71508065741"
diff --git a/recipes/xorg-driver/xf86-video-ast_0.89.9.bb b/recipes/xorg-driver/xf86-video-ast_0.89.9.bb
deleted file mode 100644
index a31235d..0000000
--- a/recipes/xorg-driver/xf86-video-ast_0.89.9.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "619f6ff15db869be3800bb001d5b0468"
-SRC_URI[archive.sha256sum] = "880f16d32a373a052515f4ae28a3f1a97543d0d73d2ea5d74baf23bdc3a6b401"
diff --git a/recipes/xorg-driver/xf86-video-ati_6.12.4.bb b/recipes/xorg-driver/xf86-video-ati_6.12.4.bb
deleted file mode 100644
index 5a62ae5..0000000
--- a/recipes/xorg-driver/xf86-video-ati_6.12.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- ATI display driver"
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e662348f6f957fcedf52818d668ab9f5"
-SRC_URI[archive.sha256sum] = "cfde066a7087a19b624f79e95cb9a6c97a847b8802cf38d4ae6022758bf338f6"
diff --git a/recipes/xorg-driver/xf86-video-chips_1.2.2.bb b/recipes/xorg-driver/xf86-video-chips_1.2.2.bb
deleted file mode 100644
index 9ea7003..0000000
--- a/recipes/xorg-driver/xf86-video-chips_1.2.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Chips display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a3969c28c3b36ab2caa852a9324e9b70"
-SRC_URI[archive.sha256sum] = "ff6fef2cffc62feb3b23f3fee375e502ab7356d571517a89b4de67f0f6037f0e"
diff --git a/recipes/xorg-driver/xf86-video-dummy/get-rid-of-host-includes.patch b/recipes/xorg-driver/xf86-video-dummy/get-rid-of-host-includes.patch
deleted file mode 100644
index 404e947..0000000
--- a/recipes/xorg-driver/xf86-video-dummy/get-rid-of-host-includes.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: xf86-video-dummy-0.3.0/configure.ac
-===================================================================
---- xf86-video-dummy-0.3.0.orig/configure.ac	2008-06-14 12:20:36.000000000 +0200
-+++ xf86-video-dummy-0.3.0/configure.ac	2008-06-14 12:20:58.000000000 +0200
-@@ -58,7 +58,7 @@
- sdkdir=$(pkg-config --variable=sdkdir xorg-server)
- 
- CFLAGS="$CFLAGS $XORG_CFLAGS "' -I$(top_srcdir)/src'
--INCLUDES="$XORG_INCS -I${sdkdir} "'-I$(top_srcdir)/src -I$(prefix)/include'
-+INCLUDES="$XORG_INCS "'-I$(top_srcdir)/src'
- AC_SUBST([CFLAGS])
- AC_SUBST([INCLUDES])
- 
diff --git a/recipes/xorg-driver/xf86-video-dummy_0.3.2.bb b/recipes/xorg-driver/xf86-video-dummy_0.3.2.bb
deleted file mode 100644
index ca4bed5..0000000
--- a/recipes/xorg-driver/xf86-video-dummy_0.3.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- dummy display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://get-rid-of-host-includes.patch"
-SRC_URI[archive.md5sum] = "2a6f1f07462fbe336865068cd69c8593"
-SRC_URI[archive.sha256sum] = "9389cbc21b0b5f90920fdfaad4466f4ec07674bb1ddbbf63cbb8759ace5c45fa"
diff --git a/recipes/xorg-driver/xf86-video-fbdev_0.4.1.bb b/recipes/xorg-driver/xf86-video-fbdev_0.4.1.bb
deleted file mode 100644
index 7e6e0e7..0000000
--- a/recipes/xorg-driver/xf86-video-fbdev_0.4.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- fbdev display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "79ce1eb9f9d2ed56de70d8e06cb767d9"
-SRC_URI[archive.sha256sum] = "2bf857179523433a9cc6c6eea059298db4c865e649aa58dfc67c828f28b7288f"
diff --git a/recipes/xorg-driver/xf86-video-geode_2.11.6.bb b/recipes/xorg-driver/xf86-video-geode_2.11.6.bb
deleted file mode 100644
index ab309fd..0000000
--- a/recipes/xorg-driver/xf86-video-geode_2.11.6.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3ff0dfb4b3bd8872c6efb70371cb6b98"
-SRC_URI[archive.sha256sum] = "4a1ada47bc08db13a57f32e73cbc5a5f0774f87ba447071737e50dfefb741f91"
-
-COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-video-glint_1.2.4.bb b/recipes/xorg-driver/xf86-video-glint_1.2.4.bb
deleted file mode 100644
index b39ef77..0000000
--- a/recipes/xorg-driver/xf86-video-glint_1.2.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Glint display driver"
-DEPENDS += " xf86dgaproto drm xf86driproto"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "960df34e129faa411e58c0d6b56d79a3"
-SRC_URI[archive.sha256sum] = "5f8d6e3b02c261d235bae63d95510b940b6c9a775301146b3c229926ed99d76f"
diff --git a/recipes/xorg-driver/xf86-video-i128_1.3.3.bb b/recipes/xorg-driver/xf86-video-i128_1.3.3.bb
deleted file mode 100644
index eb4052b..0000000
--- a/recipes/xorg-driver/xf86-video-i128_1.3.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- i128 display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a597e8efeec6ab8bc6ba6d87fceb2dba"
-SRC_URI[archive.sha256sum] = "4d0691ce8e3b54075d05cc34717350be42915174b3930b2c9b7f5e309b32b02e"
diff --git a/recipes/xorg-driver/xf86-video-intel/nodolt.patch b/recipes/xorg-driver/xf86-video-intel/nodolt.patch
deleted file mode 100644
index c5c0e7b..0000000
--- a/recipes/xorg-driver/xf86-video-intel/nodolt.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: xf86-video-intel-2.9.1/configure.ac
-===================================================================
---- xf86-video-intel-2.9.1.orig/configure.ac
-+++ xf86-video-intel-2.9.1/configure.ac
-@@ -42,7 +42,6 @@ AC_CONFIG_FILES([
- # Checks for programs.
- AC_DISABLE_STATIC
- AC_PROG_LIBTOOL
--DOLT
- AC_PROG_CC
- AM_PROG_CC_C_O
- 
diff --git a/recipes/xorg-driver/xf86-video-intel_2.9.1.bb b/recipes/xorg-driver/xf86-video-intel_2.9.1.bb
deleted file mode 100644
index 15b092c..0000000
--- a/recipes/xorg-driver/xf86-video-intel_2.9.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
-DEPENDS += " virtual/libx11 libxvmc drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += " file://nodolt.patch "
-SRC_URI[archive.md5sum] = "8951d0366c16991badb7f9050556f4f3"
-SRC_URI[archive.sha256sum] = "95347c88854c2b41c07ab3bcdfadd1b8d27fb181a20520f185892877eb8d9d76"
diff --git a/recipes/xorg-driver/xf86-video-mga_1.4.11.bb b/recipes/xorg-driver/xf86-video-mga_1.4.11.bb
deleted file mode 100644
index 5dc6d53..0000000
--- a/recipes/xorg-driver/xf86-video-mga_1.4.11.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- MGA display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9d1ca965cedb0856296b47442f3c739d"
-SRC_URI[archive.sha256sum] = "c91922316f486f74d41ddbda92ff94a7917cea151ad802cf25603ab6b90f97e6"
diff --git a/recipes/xorg-driver/xf86-video-neomagic_1.2.4.bb b/recipes/xorg-driver/xf86-video-neomagic_1.2.4.bb
deleted file mode 100644
index a0c06e0..0000000
--- a/recipes/xorg-driver/xf86-video-neomagic_1.2.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X11 driver for NeoMagic 2200, 2160, 2097, 2093, 2090, 2070"
-DEPENDS += " xf86dgaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "2d722ee9b9fe8da49109f280689c9c25"
-SRC_URI[archive.sha256sum] = "434da2986d007243f4590a86d16a1632a9611b71de44d6e46f28bd3cdb898353"
diff --git a/recipes/xorg-driver/xf86-video-nv_2.1.15.bb b/recipes/xorg-driver/xf86-video-nv_2.1.15.bb
deleted file mode 100644
index f3f71498..0000000
--- a/recipes/xorg-driver/xf86-video-nv_2.1.15.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- NV display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1b22188bd9012a148206940708b52ea6"
-SRC_URI[archive.sha256sum] = "c18ce0410437ced9c171d2d6328a8406b79b6edacf55b9526594b446ee5a3641"
diff --git a/recipes/xorg-driver/xf86-video-rendition_4.2.3.bb b/recipes/xorg-driver/xf86-video-rendition_4.2.3.bb
deleted file mode 100644
index c92d5f6..0000000
--- a/recipes/xorg-driver/xf86-video-rendition_4.2.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X11 driver supporting cards based on the V1000 or the V2x00."
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "9a0a916fe1e7b5c81cd4c80a08e646cc"
-SRC_URI[archive.sha256sum] = "9d5559fd3029feee5af2493ab8f558c58c426fc89776a1109dab97e3a4764d94"
diff --git a/recipes/xorg-driver/xf86-video-savage_2.3.1.bb b/recipes/xorg-driver/xf86-video-savage_2.3.1.bb
deleted file mode 100644
index 175562e..0000000
--- a/recipes/xorg-driver/xf86-video-savage_2.3.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Savage display driver"
-DEPENDS += " drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "66c319f610e3699c3de0f3ef630abb32"
-SRC_URI[archive.sha256sum] = "2b4adcdd820a6f3acba6f3c0995f5899edc8f5e33fb4c4666c4c7a78090ddaab"
-
-EXTRA_OECONF += " \
-  ac_cv_file__usr_include_xorg_dri_h=yes \
-  ac_cv_file__usr_include_xorg_sarea_h=yes \
-  ac_cv_file__usr_include_xorg_dristruct_h=yes \
-"
diff --git a/recipes/xorg-driver/xf86-video-siliconmotion_1.7.3.bb b/recipes/xorg-driver/xf86-video-siliconmotion_1.7.3.bb
deleted file mode 100644
index 04cd1f0..0000000
--- a/recipes/xorg-driver/xf86-video-siliconmotion_1.7.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- SiliconMotion display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "29fb322cd3adab52cc7f1ac86f9315bb"
-SRC_URI[archive.sha256sum] = "ebda468be42695c08ceaa4043da3cf5bcd5f9ab15d1482311fd6e826a8060b2b"
diff --git a/recipes/xorg-driver/xf86-video-sis_0.10.2.bb b/recipes/xorg-driver/xf86-video-sis_0.10.2.bb
deleted file mode 100644
index 569c724..0000000
--- a/recipes/xorg-driver/xf86-video-sis_0.10.2.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- SiS display driver"
-DEPENDS += " xineramaproto xf86miscproto xf86dgaproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f04baa307e49e9f0e5a5c3d2e89a5576"
-SRC_URI[archive.sha256sum] = "3aad701799e355669b9027a9baedd623fe6b7ce93da9ac22b6902fd7e38128c2"
-
-EXTRA_OECONF += " \
-  ac_cv_file__usr_include_xorg_dri_h=yes \
-  ac_cv_file__usr_include_xorg_sarea_h=yes \
-  ac_cv_file__usr_include_xorg_dristruct_h=yes \
-"
diff --git a/recipes/xorg-driver/xf86-video-sisusb_0.9.3.bb b/recipes/xorg-driver/xf86-video-sisusb_0.9.3.bb
deleted file mode 100644
index 333d279..0000000
--- a/recipes/xorg-driver/xf86-video-sisusb_0.9.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- SiS USB display driver"
-DEPENDS += " xineramaproto xf86miscproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "be59e9c2d9458cee0b5006549c14a95d"
-SRC_URI[archive.sha256sum] = "1df9a90ecc31d5fb63de7c970555f166dab24c0f633b54aaac4ee82fa7b49bb2"
diff --git a/recipes/xorg-driver/xf86-video-trident_1.3.3.bb b/recipes/xorg-driver/xf86-video-trident_1.3.3.bb
deleted file mode 100644
index f1058e7..0000000
--- a/recipes/xorg-driver/xf86-video-trident_1.3.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.org X server -- Trident display driver"
-DEPENDS += " xf86dgaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "47f3c5da1942017218355f178f02ef84"
-SRC_URI[archive.sha256sum] = "6241eab6f3f0a075380be6b614e33ad72256242c865115bc8b696f83a75d11f5"
diff --git a/recipes/xorg-driver/xf86-video-tseng_1.2.3.bb b/recipes/xorg-driver/xf86-video-tseng_1.2.3.bb
deleted file mode 100644
index 81d0b97..0000000
--- a/recipes/xorg-driver/xf86-video-tseng_1.2.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "79f63999c88477801ae54dc486272ad6"
-SRC_URI[archive.sha256sum] = "0556bb3e79da4be87e880f82e2b8504527e760e284680f9463a08f9572507187"
diff --git a/recipes/xorg-driver/xf86-video-vesa/fix-configure-includes.patch b/recipes/xorg-driver/xf86-video-vesa/fix-configure-includes.patch
deleted file mode 100644
index a886e6c..0000000
--- a/recipes/xorg-driver/xf86-video-vesa/fix-configure-includes.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: xf86-video-vesa-2.0.0/configure.ac
-===================================================================
---- xf86-video-vesa-2.0.0.orig/configure.ac	2008-11-06 15:13:02.000000000 +0000
-+++ xf86-video-vesa-2.0.0/configure.ac	2008-11-06 15:13:16.000000000 +0000
-@@ -69,7 +69,7 @@
- AM_CONDITIONAL(XSERVER_LIBPCIACCESS, test "x$XSERVER_LIBPCIACCESS" = xyes)
- 
- CFLAGS="$CFLAGS $XORG_CFLAGS "' -I$(top_srcdir)/src'
--INCLUDES="$XORG_INCS -I${sdkdir} "'-I$(top_srcdir)/src'
-+INCLUDES="$XORG_INCS "'-I$(top_srcdir)/src'
- AC_SUBST([CFLAGS])
- AC_SUBST([INCLUDES])
- 
diff --git a/recipes/xorg-driver/xf86-video-vesa/fix-includepath.patch b/recipes/xorg-driver/xf86-video-vesa/fix-includepath.patch
deleted file mode 100644
index c8a79c0..0000000
--- a/recipes/xorg-driver/xf86-video-vesa/fix-includepath.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: xf86-video-vesa-X11R7.1-1.2.0/configure.ac
-===================================================================
---- xf86-video-vesa-X11R7.1-1.2.0.orig/configure.ac	2007-01-07 19:28:00.000000000 +0100
-+++ xf86-video-vesa-X11R7.1-1.2.0/configure.ac	2007-01-07 19:28:02.000000000 +0100
-@@ -57,7 +57,7 @@
- sdkdir=$(pkg-config --variable=sdkdir xorg-server)
- 
- CFLAGS="$CFLAGS $XORG_CFLAGS "' -I$(top_srcdir)/src'
--INCLUDES="$XORG_INCS -I${sdkdir} "'-I$(top_srcdir)/src -I$(prefix)/include'
-+INCLUDES="$XORG_INCS -I${sdkdir} "'-I$(top_srcdir)/src'
- AC_SUBST([CFLAGS])
- AC_SUBST([INCLUDES])
- 
diff --git a/recipes/xorg-driver/xf86-video-vesa_2.2.1.bb b/recipes/xorg-driver/xf86-video-vesa_2.2.1.bb
deleted file mode 100644
index 32d2a35..0000000
--- a/recipes/xorg-driver/xf86-video-vesa_2.2.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://fix-includepath.patch \
-            file://fix-configure-includes.patch"
-SRC_URI[archive.md5sum] = "61a1dc9a22991bd04d0ff98f800775c1"
-SRC_URI[archive.sha256sum] = "a3657971232e9c7db3e7517a8aedd86d3ef4d159f7099ec974cdd03aafa41080"
diff --git a/recipes/xorg-driver/xf86-video-vmware_10.16.8.bb b/recipes/xorg-driver/xf86-video-vmware_10.16.8.bb
deleted file mode 100644
index 4fbae3b..0000000
--- a/recipes/xorg-driver/xf86-video-vmware_10.16.8.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "25287a202c986b33bd79fbe379c96a16"
-SRC_URI[archive.sha256sum] = "956443948d94f7459b0056d8cb8ff2cd9fba4621d8b61f0257cb84469ea7da07"
diff --git a/recipes/xorg-driver/xf86-video-voodoo_1.2.3.bb b/recipes/xorg-driver/xf86-video-voodoo_1.2.3.bb
deleted file mode 100644
index 0d16887..0000000
--- a/recipes/xorg-driver/xf86-video-voodoo_1.2.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X11 driver for Voodoo/Voodoo2"
-DEPENDS += " xf86dgaproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "c164effcc839eca1fc1d43a42f4086db"
-SRC_URI[archive.sha256sum] = "025d4d99ab19325b72417fadbb099c757412988f800c9511be3e2c3993ae29e9"
diff --git a/recipes/xorg-driver/xf86-video-xgi_1.5.1.bb b/recipes/xorg-driver/xf86-video-xgi_1.5.1.bb
deleted file mode 100644
index 63ebc5b..0000000
--- a/recipes/xorg-driver/xf86-video-xgi_1.5.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "65a8d94d360b51690f8d4b2e7bfa036a"
-SRC_URI[archive.sha256sum] = "cb19f5287f9d345fc4fe15ba7c9344a3be2d8395ebf19a139899d1566d7c9e18"
diff --git a/recipes/xorg-driver/xf86-video-xgixp_1.7.99.4.bb b/recipes/xorg-driver/xf86-video-xgixp_1.7.99.4.bb
deleted file mode 100644
index f852470..0000000
--- a/recipes/xorg-driver/xf86-video-xgixp_1.7.99.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "0e7d0df07528c57304900da3acafc1a2"
-SRC_URI[archive.sha256sum] = "ee0a178c89ff10d679e6f174d2a2e5cc7b89c7c7d5c115d48e9c75942f487395"
-- 
1.7.4.rc1



