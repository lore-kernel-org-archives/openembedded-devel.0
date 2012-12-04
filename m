Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi2T-00023S-SW
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:15:13 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377522eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qkb4hTyIEL19XPNK41fpzQg9spbUaNVBPwAGBCh2Pgo=;
	b=K1cjiQHaqn+evrdH23DxTyB08gO2BPLTY1kr0x6heFqGggpUUNEM6btbSzZtzoSrUV
	E64YwbOkMNe+9Hp+C2qgYfvkSGQu14j5ufb0W/eo1R+vdMkF162pnkEUh0Ag43+jKOj0
	YYGzq1NOqWAgox3NjRXIxv3f9/EQizN/xUHwell10F3iUlPIZvv01voMcWZvQByLLeoQ
	JMGGqK7XkxrBs24RYv+yAkItyOF2pSwlQictimzhwX5qvBncZwPtcZWUghaAeJLCawkf
	xkyRpxGZST+FA1dOxh9MBi1WUl3LYNznPaOrtU+ARmW3T7Y576G44sERsb4csVr6x0VZ
	zUUA==
Received: by 10.14.178.70 with SMTP id e46mr23046792eem.1.1354586452407;
	Mon, 03 Dec 2012 18:00:52 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q44sm34798632eep.5.2012.12.03.18.00.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:00:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:42 +0100
Message-Id: <8f8398e952d97b3861343363c28479c3174a9e09.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 09/58] cheese: rename eds-dbus to evolution-data-server in DEPENDS
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
X-List-Received-Date: Tue, 04 Dec 2012 02:15:14 -0000

* was renamed in oe-core
  commit 6189a8a05620974c098d548c26502453f371fe26
  Author: Saul Wold <sgw@linux.intel.com>
  Date:   Thu Apr 19 17:26:01 2012 -0700

    evolation-data-server: Rename from eds-dbus

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
index d6d61fd..4ac667b 100644
--- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
+++ b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
@@ -2,7 +2,9 @@ DESCRIPTION = "Take photos and videos with your webcam, with fun graphical effec
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
 
-DEPENDS = "gtk+ gstreamer gst-plugins-base libcanberra udev librsvg gnome-desktop eds-dbus"
+DEPENDS = "gtk+ gstreamer gst-plugins-base libcanberra udev librsvg gnome-desktop evolution-data-server"
+
+PR = "r1"
 
 inherit gnome
 
-- 
1.8.0



