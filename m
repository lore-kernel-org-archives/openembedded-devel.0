Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id A354D61221
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 15:53:24 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so14054272wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 07:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=On11a9hUUTI2keWuXJ0OExtxWbAFTip6aOobYhbHTj8=;
	b=D3OFoHpIxMcQ6NPPVAVEPk51zb6qqBgYGCDHRBucMTKul1CCVVBjAfQ1NfCAj0guC1
	nTtB2RnvlooZzgFDfrdI+iZFtc33j7I4j0onDIxsNCkObCQ+Wp9myTxsDzUEyFCzL0Ko
	J4AT9ZnB8aE39D9aRUq8ehi69tHQLepBlVpIhHJoxkbqcCStsdnxUbG3VoyhUmEx7iHX
	AZoDjdkqnNi4rJLSF+MZ5urxEKTQay1/GrQ9ULnIQQA0WS8ejF+uEB3GshWz3+ZAp/ec
	p2ozf9dJMaq63pvcMXTWt6OwcWQw7I5U+mcuQZO2wEpOGbboENxImQ9Pvb3DeMz7iOXW
	w44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=On11a9hUUTI2keWuXJ0OExtxWbAFTip6aOobYhbHTj8=;
	b=tE2+YdWhWDUfMhgJyw8GzFU9HIIG6WbRqhRczoeNizCWM5fFktzfBFF5xVyUz021Q6
	ZGNeLH8Wlmo5LOowF1vaZeSCRHngS2Z19JGLB4BOH5blM/TbHv+lRt8YUg0aDPcKIjM+
	fURoiynYNw5z+10KB/8aGaMjT5DSbm/0Pk7Y6AtvBO93vtNLuKGPbNdFh6Ujx0NO88rx
	nJvUr81xCbV0P4uZRb1S5aIDzKjHf6JieVMgcze/bX1oYyhgxvLokygIU/TjnPzed5WM
	VDaxatR3qF7iDQxwAmt0b49Gz54Zml6keCuSs/ZS8yYO/2XXQakNFgEXW1l1yBBONJpj
	YY3A==
X-Gm-Message-State: APjAAAW7vQtoR2L3EzcE87rGLNf9uuE0LX1cDskQalkMmAISSPYr6eId
	kHEqq+HST6C6iT/QbC1TRX4T9wfe
X-Google-Smtp-Source: APXvYqzUerfnjonfYBxGP61FzsPLi7Ia2vL9NEYV+rDXsTjb6bpnmIv4DpoiyA9Cvee9rjJ2uoFCcQ==
X-Received: by 2002:a1c:6408:: with SMTP id y8mr11509438wmb.130.1581782005075; 
	Sat, 15 Feb 2020 07:53:25 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
	[31.10.206.124]) by smtp.gmail.com with ESMTPSA id
	y17sm11675155wrs.82.2020.02.15.07.53.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 07:53:24 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Feb 2020 16:52:59 +0100
Message-Id: <20200215155259.5977-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH] lirc: build and deploy with python3
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
X-List-Received-Date: Sat, 15 Feb 2020 15:53:24 -0000
Content-Transfer-Encoding: 8bit

lirc already uses python3 for the build, reflect that in the recipe.
Add the relevant python modules used in the scripts to RDEPENDS.
Deploy all python scripts in the lirc-python package.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb b/meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb
index 606caee89..f59969673 100644
--- a/meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb
+++ b/meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb
@@ -6,8 +6,7 @@ DESCRIPTION_append_lirc-nslu2example = " This package contains a working config
 HOMEPAGE = "http://www.lirc.org"
 SECTION = "console/network"
 LICENSE = "GPLv2"
-DEPENDS = "libxslt-native alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19"
-
+DEPENDS = "libxslt-native alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19 python3-pyyaml"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
@@ -61,9 +60,9 @@ PACKAGES =+ "${PN}-contrib ${PN}-exec ${PN}-plugins ${PN}-python"
 
 RDEPENDS_${PN} = "bash"
 RDEPENDS_${PN}-exec = "${PN}"
-RDEPENDS_${PN}-python = "python"
+RDEPENDS_${PN}-python = "python3-shell python3-pyyaml python3-datetime python3-netclient python3-stringold"
 
-RRECOMMENDS_lirc = "${PN}-exec ${PN}-plugins"
+RRECOMMENDS_${PN} = "${PN}-exec ${PN}-plugins"
 
 FILES_${PN}-plugins = "${libdir}/lirc/plugins/*.so ${datadir}/lirc/configs"
 FILES_${PN}-contrib = "${datadir}/lirc/contrib"
@@ -73,8 +72,7 @@ FILES_${PN} += "${systemd_unitdir}/system/lircd.service"
 FILES_${PN} += "${systemd_unitdir}/system/lircd.socket"
 FILES_${PN} += "${libdir}/tmpfiles.d/lirc.conf"
 FILES_${PN}-dbg += "${libdir}/lirc/plugins/.debug"
-FILES_${PN}-python += "${libdir}/python*/site-packages"
-
+FILES_${PN}-python += "${bindir}/irdb-get ${bindir}/irtext2udp ${bindir}/lircd-setup ${bindir}/pronto2lirc ${libdir}/python*/site-packages"
 
 INITSCRIPT_PACKAGES = "lirc lirc-exec"
 INITSCRIPT_NAME_lirc-exec = "lircexec"
-- 
2.20.1


