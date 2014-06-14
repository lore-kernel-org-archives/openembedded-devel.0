Return-Path: <ajlennon@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0215A6FE1E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jun 2014 11:37:49 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id t60so3906757wes.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jun 2014 04:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=tGCsehWUPee7rrNYrRxLoFP6qFnzDu8RmtIicLnJnHw=;
	b=O0yig9Nke7s9wV22uO9LrSD0RoS3xPWiSpGvt0wF6U6M53p0uuEB+M0LUS+4YbZCd0
	hHZKO4SmxowqnPK6ycjOnAoiStfmKajRo6+74XtGuNByaaP7E/TQPmDFbE58dixePNHF
	IHavE1mmjLgZCliQLmI6aeK0CcvSJMXJVmsuqu/7N07gEIOx8UPubQouaA+MpJceJx58
	w1RuuFtp8gKCH0sXCNvjXYUFSivcrn//23k08DNhF0yoX6xHEtXCVxm3y0B8IDEGAmqn
	o3j9KJj7whLTMQEvImW5/jt76/J+nCKPjRqQ7GSbTjTJipbxPOCvwKBjcVjPrxpSrlWg
	QT0A==
X-Received: by 10.180.102.10 with SMTP id fk10mr12238772wib.42.1402745870056; 
	Sat, 14 Jun 2014 04:37:50 -0700 (PDT)
Received: from localhost.localdomain
	(cpc32-live22-2-0-cust59.17-2.cable.virginm.net. [82.36.253.60])
	by mx.google.com with ESMTPSA id i8sm2359972wiw.22.2014.06.14.04.37.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 14 Jun 2014 04:37:49 -0700 (PDT)
Sender: Alex Lennon <ajlennon@gmail.com>
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Jun 2014 12:37:13 +0100
Message-Id: <3b3522700ffdf8e7c31d30632e0bb0def0688ba5.1402745549.git.ajlennon@dynamicdevices.co.uk>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1402745549.git.ajlennon@dynamicdevices.co.uk>
References: <cover.1402745549.git.ajlennon@dynamicdevices.co.uk>
Subject: [meta-gnome][PATCH 1/1] gnome-menus3: Add support for 3.x.x
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Jun 2014 11:38:01 -0000

Signed-off-by: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
---
 .../gnome-menus/gnome-menus3_3.10.1.bb             | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
new file mode 100644
index 0000000..87060f3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "GNOME menus"
+SECTION = "x11/gnome"
+LICENSE = "GPLv2 & LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+
+DEPENDS = "python libxml2 gconf popt gtk+3"
+
+inherit gnomebase pkgconfig python-dir pythonnative
+
+BPN = "gnome-menus"
+
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BPN}-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "6db025e79e2b69f39fc7aa0753f43081"
+SRC_URI[sha256sum] = "46950aba274c1ad58234374fa9b235258650737307f3bc396af48eb983668a71"
+
+PACKAGES += "${PN}-python"
+FILES_${PN} += "${datadir}/desktop-directories/"
+FILES_${PN}-python = "${libdir}/python*"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug \
+                    ${PYTHON_SITEPACKAGES_DIR}/.debug"
-- 
2.0.0


