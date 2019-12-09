Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id AE9577E6EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:13 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id s14so12995309wmh.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=gkYWJNEgqxg9OMp+In34EAytAnZJCWB80EkOZDZ7jt4=;
	b=ThV7849XRnL5GKUTPvYsfHffWaLp8vQ7LP0Mlsn+Vn3jcz3WO0kQ/rTMThYvavfMUY
	HNNFclTLtnlRrDinGgdUFta46nfDlIlEc5JlDmbVkd4Hcxer9R1xK1Ek0U/FZ3tsq8bE
	nem7rP/L0OEpHur+7t/eXULKJqYAeMLIrwpcVLqLM3bCIOBw03OWuBRt+go5Mi977C36
	u4QAOm14h0rwhVULqefULX97VQjMyTn3CziPdXOV4VlhnD6shtQorYuLsoLnrDPDqZwa
	YRG5gTWv/HJ3e+bS/vkQy2/NiayFHwnKsdUF3N5lX7oeq5noFvQSrqzTP6r/mk0hkp+j
	GIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gkYWJNEgqxg9OMp+In34EAytAnZJCWB80EkOZDZ7jt4=;
	b=EQVdbFkJ7A8oROloho1TnHwGOPKfqiGGpJOGliR4x+y5xy6rkV92Qh8Lw+5H5EY8KQ
	IfRMq7nCAkbFS3gN2dcZmN9uTPyN6wwphSMUCaVuKniAy4GW0yhBKtQyCA8Jd8RlHszB
	0OW7vV0JXa6M8Wp8SRoi7NQ8T/YTbCVXZp/F03/U6iPZEM04Met2X9ObiCY1CvbqfQnn
	50yHG20v5V6PxFl9t4xVoqPgIJiotUvC/zgeu+/tkenvNsG420J4gaL7RlPyNxSr+l7h
	cPlzL7i1OHw/dsKxT+mCBA4U0F+pg4WE2zP2dmj8p1n1WJnVBqgkpy9tG4QMT4lUvAcx
	BXfg==
X-Gm-Message-State: APjAAAVoD1qjCZ+GJHFXw/CTn5+/lwrhGN8ONsK0UmFke4/KxAmsKY14
	akz+F49JAemEtEg7RNIqGfLmjEwE
X-Google-Smtp-Source: APXvYqxuqX4up/OE3LfA3dSz/ztSDoP+yu3DwbwdOD1wGLTG2HL0Nk0ebJiOjBQV/BB8MlnQ8TiSXw==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr22254112wmk.68.1575851954188; 
	Sun, 08 Dec 2019 16:39:14 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:13 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:32 +0100
Message-Id: <20191209003840.3383-22-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 21/29] Add: packagegroup-gnome-apps / packagegroup-gnome-desktop
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../packagegroups/packagegroup-gnome-apps.bb  | 19 ++++++++++++++
 .../packagegroup-gnome-desktop.bb             | 26 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
 create mode 100644 meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop.bb

diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
new file mode 100644
index 000000000..642e02680
--- /dev/null
+++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
@@ -0,0 +1,19 @@
+SUMMARY = "GNOME applications"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit packagegroup features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+RDEPENDS_${PN} = " \
+    evolution-data-server \
+    evince \
+    file-roller \
+    gedit \
+    gnome-font-viewer \
+    gnome-terminal \
+    libwnck3 \
+    nautilus \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'gnome-system-monitor', '', d)} \
+"
diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop.bb
new file mode 100644
index 000000000..e27678c89
--- /dev/null
+++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Basic GNOME desktop"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit packagegroup features_check
+
+REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam gobject-introspection-data"
+
+RDEPENDS_${PN} = " \
+    adwaita-icon-theme \
+    adwaita-icon-theme-cursors \
+    evolution-data-server \
+    gnome-backgrounds \
+    gnome-bluetooth \
+    gnome-control-center \
+    gnome-desktop3 \
+    gnome-flashback \
+    gnome-keyring \
+    gnome-menus3 \
+    gnome-session \
+    gnome-settings-daemon \
+    gnome-shell \
+    gnome-shell-extensions \
+    gmime \
+    gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash \
+"
-- 
2.21.0


