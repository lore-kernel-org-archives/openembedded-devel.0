Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 60CEE71AA9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:43 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y68so449136pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7n2b9CRtFdvXKVk3lB+/ahmMarPOgCs15FpJz0sTxoo=;
	b=Sy1uCBNWppVIaMD6xLwE0zU2mj3UPB8WD3K1WMk1uHqZztE5166gI5gF5KbS5uvdBC
	mQoZa/aRnGr/1nkXBoArxzHYhoHhzUt2cHwVuHA8GkiKufoyy+htOeUytkCNUADLymKX
	HFhXju1WnRzQD5meWVlgGe2fXoytgf3Utmmq5IGStQVqLzCNv9HU7VjHwxvadEGG9Qcb
	v5TVEbk1ZV/pDolMO19xNuPjcVYlDFuRZkkL/RaK7o/dUxbdKNthYt2CaaEEpc9Alor8
	2HHXoG0bPvgNzui2C0dD9M6PHLArS1ZgtZXVP9haJMfvQeXHOIfqAkx8DtYYlYhVpJju
	TXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7n2b9CRtFdvXKVk3lB+/ahmMarPOgCs15FpJz0sTxoo=;
	b=TDeNP+xjCUPyWAbLHgnvbS6G2ZCCAYtL/p9p5I6g4qjkOWR9ntDne8uuW60jcaEydb
	WuHqTIHGhBXSv+KizC3/ZiO6NmfC5odXR2azpXLl/3VwtqD0B63+vpyPTk9ySfrbKJ6/
	Ed0NtdHBKfBtm2xnc9eDLvLgcYHCySNwTdDU7kitwRYtYXIuHZw+m0oZuNMOELCJY8za
	gaXl88cESz5gSkXxguo23kkbXY8AsChOxxQAauFkno1XfAjE/qMMjB71G4vyF6cIriDg
	J3SWDvCatCePqG5zcfBgBUsIcYRVoR2adOI80dTuj5YcXTmLoSBi0S2piiYIE9xa8yGk
	F4bg==
X-Gm-Message-State: AKaTC02WeoiQ29vCHOTDWNKV4lVUBH4S44sd6egq5ni2UOxsaCkYEXHdpc5QcwLCXcWUGw==
X-Received: by 10.99.178.89 with SMTP id t25mr3458084pgo.131.1479892965261;
	Wed, 23 Nov 2016 01:22:45 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:56 -0800
Message-Id: <20161123092209.23699-36-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 36/49] obex-data-server: Fix build with new openobex version
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:44 -0000

Add missing dependency on dbus-glib-native, this is needed for
getting DBUS_BINDING_TOOL

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../obex-data-server-0.4.6-build-fixes-1.patch       | 20 ++++++++++++++++++++
 .../obex/obex-data-server_0.4.6.bb                   |  7 ++++---
 2 files changed, 24 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/obex/obex-data-server/obex-data-server-0.4.6-build-fixes-1.patch

diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server/obex-data-server-0.4.6-build-fixes-1.patch b/meta-oe/recipes-connectivity/obex/obex-data-server/obex-data-server-0.4.6-build-fixes-1.patch
new file mode 100644
index 0000000..e2c4e9f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/obex/obex-data-server/obex-data-server-0.4.6-build-fixes-1.patch
@@ -0,0 +1,20 @@
+Submitted By:            Armin K. <krejzi at email dot com>
+Date:                    2012-07-06
+Initial Package Version: 0.4.6
+Upstream Status:         Unknown
+Origin:                  Self
+Description:             Some build fixes.
+
+Index: obex-data-server-0.4.6/src/ods-obex.c
+===================================================================
+--- obex-data-server-0.4.6.orig/src/ods-obex.c
++++ obex-data-server-0.4.6/src/ods-obex.c
+@@ -412,7 +412,7 @@ ods_obex_setup_usbtransport (OdsObexCont
+ 		goto err;
+ 	}
+ 
+-	interfaces_num = OBEX_FindInterfaces(obex_context->obex_handle, &obex_intf);
++	interfaces_num = OBEX_EnumerateInterfaces(obex_context->obex_handle);
+ 	if (intf_num >= interfaces_num) {
+ 		g_set_error (error, ODS_ERROR, ODS_ERROR_FAILED, "Invalid interface number");
+ 		goto err;
diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
index c2c284e..e10b89c 100644
--- a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
+++ b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
@@ -2,14 +2,15 @@ DESCRIPTION = "obex-data-server is a D-Bus service providing high-level OBEX cli
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "gtk+ dbus-glib imagemagick openobex"
+DEPENDS = "gtk+ dbus-glib dbus-glib-native imagemagick openobex"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
 
-SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz"
+SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz \
+           file://obex-data-server-0.4.6-build-fixes-1.patch \
+"
 SRC_URI[md5sum] = "961ca5db6fe9c97024e133cc6203cc4d"
 SRC_URI[sha256sum] = "b399465ddbd6d0217abedd9411d9d74a820effa0a6a142adc448268d3920094f"
 
 inherit autotools-brokensep pkgconfig
 
 FILES_${PN} += "${datadir}/dbus-1/"
-
-- 
2.10.2


