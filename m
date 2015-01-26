Return-Path: <sdliyong@gmail.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id C7B3E60670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 00:46:52 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id v8so4911173qal.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jan 2015 16:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:cc:content-type;
	bh=uTNdqn6uaAZIfJyyZT15Z+xvMUMicPIghnGbsf8XBkc=;
	b=t6Pl98Cwf6jruuUWKFOUYmWbnfw7IkWm0Mnu4On1ikGpQ+isSH7Y04Qc0F9CYh4D/h
	asvF4EQwbvrQ0C4lqnqZ7vUmc7O7dmr5VbVr152uL4M/WuGKBinIuF7O1ixMomJvdVA2
	Ogfd93n+tyAnBTYK8N84+cRdE7h5o+p6bm6WjWe+NApZWOC7RR9hT7eeDgy6Ux+Fpr6K
	8ECUmOHG0Q0OfssuTU6h65M+jtkhoJvV+UdzO977zlCkeR8AZzQAR77fSPUuIkbSqTV6
	usBy3wv/K761Q53qCIKpwY1LZAVh5Xxd5U/zLslRylVPQGb3BRlTUQdi9H7s7dMap1Fe
	gtPg==
X-Received: by 10.224.152.2 with SMTP id e2mr25937989qaw.23.1422233212699;
	Sun, 25 Jan 2015 16:46:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.70.194 with HTTP; Sun, 25 Jan 2015 16:46:32 -0800 (PST)
From: Yong Li <sdliyong@gmail.com>
Date: Mon, 26 Jan 2015 08:46:32 +0800
Message-ID: <CADO9-pf7FC6Qhh+K2HvZ2xBdYCY-qvMoGh9Xa5tE_XF9LRuuPA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yong Li <sdliyong@gmail.com>
Subject: [meta-xfce][PATCH]] Add XFCE iamge build file
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
X-List-Received-Date: Mon, 26 Jan 2015 00:46:55 -0000
Content-Type: text/plain; charset=UTF-8

From 44c7c064bd7d735e31c2fea0149fc293db78c536 Mon Sep 17 00:00:00 2001
From: Yong Li <sdliyong@gmail.com>
Date: Mon, 26 Jan 2015 08:39:37 +0800
Subject: [PATCH] Add XFCE iamge build file

Signed-off-by: Yong Li <sdliyong@gmail.com>
---
 meta/recipes-graphics/images/core-image-xfce.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-graphics/images/core-image-xfce.bb

diff --git a/meta/recipes-graphics/images/core-image-xfce.bb
b/meta/recipes-graphics/images/core-image-xfce.bb
new file mode 100644
index 0000000..1d9bfdc
--- /dev/null
+++ b/meta/recipes-graphics/images/core-image-xfce.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A very basic Wayland image with a terminal"
+
+IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs"
+
+LICENSE = "MIT"
+
+inherit core-image distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+CORE_IMAGE_BASE_INSTALL += "xserver-xorg xserver-xf86-config xinit xauth
xf86-input-evdev \
+xserver-nodm-init mini-x-session  xorg-minimal-fonts \
+xf86-video-fbdev xterm xclock xfwm4 xfce4-session xfdesktop xfce4-settings
\
+xfce4-panel xfce4-appfinder xfconf xfce4-terminal gtk-xfce-engine \
+packagegroup-fonts-truetype packagegroup-xfce-base"
--
1.9.1

