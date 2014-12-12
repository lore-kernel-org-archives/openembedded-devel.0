Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 31C3272417
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 17:07:27 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so9652761wgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 09:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5hMWAwDYNMlnPjXd5iyKZK+cTx4cGuYseOOtyGRr8Xw=;
	b=fm7E/oxLNyxw1R2FQkdMTjv0krRBgFxANOvdCdvSAy+2pdDlUF/AQcqmTR6Fw0xyX8
	5t4xSSbtPch6BTCHZ8udDlbHmevZndg2v7lQkrxVlteLFG9urnIj6Zy1Y/GDV0r7H/df
	k5SVpxFubyjl7+AOl81IuKSGybgPxnlpqEJ6T56YB+cK+c5qhi0O+BaaZVkuX9XHk25h
	8r+Ytlt8PQctF/ywhUxMr8GyyOg4uHHFI2CuyxpQGPn/3fE4rQ5x2t/O6iKBwRCtOQeP
	tFVhE3bJiLu6cbqkFutg+s6WdRmnE/PTdn3i4OnhY7zTfWk3qRkrRi9Qoy9VahzWNQh4
	ur6A==
X-Received: by 10.180.160.144 with SMTP id xk16mr9791848wib.12.1418404047422; 
	Fri, 12 Dec 2014 09:07:27 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cz3sm2528564wjb.23.2014.12.12.09.07.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Dec 2014 09:07:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Dec 2014 18:07:29 +0100
Message-Id: <1418404050-2772-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
Subject: [meta-qt5][PATCH 1/2] qt5-plugin-generic-vboxtouch: Import from meta-webos-ports
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
X-List-Received-Date: Fri, 12 Dec 2014 17:07:30 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb

diff --git a/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
new file mode 100644
index 0000000..7308064
--- /dev/null
+++ b/recipes-qt/qt5/qt5-plugin-generic-vboxtouch_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "This driver extends Qt's platform support (QPA) for Virtualbox guests. \
+It uses the integrated pointer feature to create a smooth conversion from \
+the host pointer to touchscreen events in the guest, without grabbing the \
+host pointer."
+SUMMARY = "Touchscreen driver for integrated mouse pointer in VirtualBox"
+LICENSE = "LGPL-2.1 & GPL-3.0"
+LIC_FILES_CHKSUM = " \
+    file://vboxtouch.cpp;beginline=1;endline=22;md5=ca51db8f7c0606c77f702dcee4cf31d9 \
+    file://evdevmousehandler.cpp;beginline=1;endline=40;md5=9081062f6e7f74b6e62ad7ecee4a71be \
+"
+
+PV = "1.0+gitr${SRCPV}"
+
+DEPENDS = "qtbase"
+
+SRC_URI = "git://github.com/nemomobile/qt5-plugin-generic-vboxtouch.git"
+SRCREV = "7d7a6dfd501c43687e7bb110610cac5f7c9abd4b"
+S = "${WORKDIR}/git/vboxtouch"
+
+inherit qmake5
+
+FILES_${PN} += "${libdir}/qt5/plugins/generic/libvboxtouchplugin.so"
+FILES_${PN}-dbg += "${libdir}/qt5/plugins/generic/.debug/"
-- 
2.1.3


