Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDv8e-00005k-Ak
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 11:30:12 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so705782bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 02:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Va7pBtzrDPicYOr14t3j9a8MRnWnOnrE9p8R/PHTElE=;
	b=rYipU0PijZ4vNEQyWo1WMaTELKUBc6Kcczbi0t9Oe10PLiwTaa8pGyuWAWDRiiHvC3
	4QcPSRsPWSTQcSyA1ltdETkAI5G3UBGJFY8hoFHZRonYG/eRbh3c47Nnt1tCyt8Zu+JV
	eqJK0sZw1lYy3JdC7zQBF9aPs5JOXXDrhdttE=
Received: by 10.204.130.65 with SMTP id r1mr12380790bks.27.1318411472014;
	Wed, 12 Oct 2011 02:24:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v16sm1380408bkd.6.2011.10.12.02.24.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Oct 2011 02:24:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Oct 2011 11:24:21 +0200
Message-Id: <1126404121c5f4f21439ca69ca6aaa6ea6821c91.1318411412.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1318411412.git.Martin.Jansa@gmail.com>
References: <cover.1318411412.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld 1/2] xserver-xf86-config: add bbappend and spitz xorg.conf
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
X-List-Received-Date: Wed, 12 Oct 2011 09:30:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xserver-xf86-config/spitz/xorg.conf            |   49 ++++++++++++++++++++
 .../xorg-xserver/xserver-xf86-config_0.1.bbappend  |    1 +
 2 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 recipes-graphics/xorg-xserver/xserver-xf86-config/spitz/xorg.conf
 create mode 100644 recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend

diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config/spitz/xorg.conf b/recipes-graphics/xorg-xserver/xserver-xf86-config/spitz/xorg.conf
new file mode 100644
index 0000000..224df5c
--- /dev/null
+++ b/recipes-graphics/xorg-xserver/xserver-xf86-config/spitz/xorg.conf
@@ -0,0 +1,49 @@
+Section "Device"
+        Identifier      "Generic Video Card"
+        Driver          "fbdev"
+        Option          "UseFBDev"              "true"
+        Option          "Rotate"                "CW"
+EndSection
+
+Section "Monitor"
+        Identifier      "Generic Monitor"
+        Option          "DPMS"
+        HorizSync       28-32
+        VertRefresh     43-60
+EndSection
+
+Section "Screen"
+        Identifier      "Default Screen"
+        Device          "Generic Video Card"
+        Monitor         "Generic Monitor"
+        DefaultDepth    16
+        SubSection "Display"
+                Depth           1
+                Modes           "640x480"
+        EndSubSection
+        SubSection "Display"
+                Depth           4
+                Modes           "640x480"
+        EndSubSection
+        SubSection "Display"
+                Depth           8
+                Modes           "640x480"
+        EndSubSection
+        SubSection "Display"
+                Depth           15
+                Modes           "640x480"
+        EndSubSection
+        SubSection "Display"
+                Depth           16
+                Modes           "640x480"
+        EndSubSection
+        SubSection "Display"
+                Depth           24
+                Modes           "640x480"
+        EndSubSection
+EndSection
+
+Section "ServerLayout"
+        Identifier      "Default Layout"
+        Screen          "Default Screen"
+EndSection
diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend b/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
new file mode 100644
index 0000000..72d991c
--- /dev/null
+++ b/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
@@ -0,0 +1 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
1.7.7



