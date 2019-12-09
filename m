Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 240587FC23
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:34 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id p9so14437022wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=gkYWJNEgqxg9OMp+In34EAytAnZJCWB80EkOZDZ7jt4=;
	b=d8Oc9tewwvB8KNoimoPSgp61vI5kYpNFamjA6QBjgRJ2F1c8HMNuN6B6NnNcnIQrxo
	bC/IAQpsEA0LhhuPU3T65v7udOjicJULoDewU2oMB1LwnEe+f2KFNOgps95UcrcDksxT
	IJxz5HwYwco6Og3tvlSCkvEY2mlDrjw7dVSQzP0Qr5JiaRMiFzgzZxjnslbVfk2ndrYy
	1Ab1MrZe4NiwUZqPINZIiBlimtYIHcFSL8/kKjhjIjkoFaLH4qhNfZCwcwV/y3ayYQdC
	W2d62ULq2lXfZ5rrxVpdyLyLjA0vJD868aEkmazqXVtU+lo91jjgPRJXT8+ZDUKojKyW
	hn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gkYWJNEgqxg9OMp+In34EAytAnZJCWB80EkOZDZ7jt4=;
	b=kDw0F5ywqKTrzQfDEGTcljLPp1LeUzdzeNFIUytP2I5aepWE+KAf91/fvvz5FQKP22
	QyUsrB877VUljQEKBWn6B5GhRVYDvk9rFmzW4pOyTNNRLLomqDQ3Kum7usdV1FRod6We
	6e1jNe5giRnpUPI//foJ26ngGEVEIzsNG0lxfZHT1zCWQFBd8B5svFVhtQYozyKDoD2x
	vUKQNHQR1y12pGLk7pJcK2Qu80F/EXPr0C4kEXGhUIN7G9rJNXnFUB7VxvTCHZy8n6sR
	gxniBlAZk1ve8XYn17+2m7UpuvvxPkWck3/XfduVXPSuWF0zypRITKk7GfXDOde61A0V
	6xKQ==
X-Gm-Message-State: APjAAAXIbwuqnEEvii+Ww5L6chJpiXaFoVb6vaPE30VmKWe2e6yaOsS+
	c8XEH4MxsQ4X9fYVHSEbwZg9zkeU
X-Google-Smtp-Source: APXvYqw095ZTwUrGCfVwl0vKJ38S4aC1xgICnvjCQqyX4TqlwTSTwEoelwoVddFt4MLgJGF3chRl0w==
X-Received: by 2002:a7b:cc90:: with SMTP id p16mr23681862wma.49.1575880594676; 
	Mon, 09 Dec 2019 00:36:34 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:36:04 +0100
Message-Id: <20191209083612.23922-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 12/20] Add: packagegroup-gnome-apps / packagegroup-gnome-desktop
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:34 -0000
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


