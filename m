Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RtTG6-00066N-G8
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 01:13:38 +0100
Received: by eaal10 with SMTP id l10so918444eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2012 16:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=QDikZpx4jss7HikL2LJw+28QAGm61MyxacH0aqIHC+s=;
	b=XQTyEtvh8WSymugI8fhf43x7Jj3f7y6T7Z1p4D9DIckVJhT2UEdxjanY3BKDaZha0K
	DgvpkbmH3JpUD6bNTLamJUHPB2etpxj16dZFeMsSoiW8fuYMrevXeG7KQWxvlvBiknjV
	SJsteoKeHHWv53w1QTiVqqZm3lJLkx7cmOdI8=
Received: by 10.213.32.71 with SMTP id b7mr1468412ebd.70.1328313940226;
	Fri, 03 Feb 2012 16:05:40 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id b3sm27865502een.2.2012.02.03.16.05.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 16:05:39 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Feb 2012 01:03:31 +0100
Message-Id: <1328313811-12627-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-xfce][PATCH] xfce4-power-manager: Add initial recipe for version 1.0.10.
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
X-List-Received-Date: Sat, 04 Feb 2012 00:13:38 -0000

Run tested on netbook pro.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 .../xfce4-power-manager_1.0.10.bb                  |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.0.10.bb

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.0.10.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.0.10.bb
new file mode 100644
index 0000000..4641178
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.0.10.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Power manager for the Xfce desktop environment"
+HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-power-manager"
+SECTION = "x11"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+inherit xfce
+
+DEPENDS = "gtk+ glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
+           libxrandr virtual/libx11 libxext xfce4-panel"
+RDEPENDS_${PN} = "networkmanager udisks upower polkit"
+
+EXTRA_OECONF = " \
+    --enable-polkit \
+    --enable-network-manager \
+    --enable-panel-plugins \
+    "
+
+PACKAGES += "xfce4-brightness-plugin"
+FILES_${PN} += "${datadir}/polkit-1"
+FILES_xfce4-brightness-plugin = " \
+    ${libdir}/xfce4/panel-plugins/xfce4-brightness-plugin \
+    ${datadir}/xfce4/panel-plugins/xfce4-brightness-plugin.desktop \
+    "
+
+SRC_URI[md5sum] = "38cbd272eb30e36ae538d9f38858bd38"
+SRC_URI[sha256sum] = "80e4bb44f81c485ec09654dde432d6e28667d49a787625632a4413aac30422f0"
-- 
1.7.3.4



