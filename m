Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RtkXj-0008HL-SJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 19:41:00 +0100
Received: by eekd41 with SMTP id d41so1371114eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Feb 2012 10:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=cWe/x1d294mVZXyAomuv9KPKNNay2oBr5gljpwpnjJ8=;
	b=h1fAUvTwXjN0llqGE3rO5v1ngAlNgtgjYfn7BCRODJf68fR0il8yS0+Qof+XhsxXC6
	Z4KJ/iNV95zKfEZDmciROuZe5L4vlTDsM/S+8ftofE4JP6rl9moiBjDiCfGwHrxYyXFy
	+Cg6Mw9KGC/f56U+QxNzscfS831/GZHoHynGQ=
Received: by 10.14.136.139 with SMTP id w11mr3095139eei.1.1328380380791;
	Sat, 04 Feb 2012 10:33:00 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id z47sm30330292eeh.9.2012.02.04.10.32.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Feb 2012 10:33:00 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Feb 2012 19:30:47 +0100
Message-Id: <1328380249-11697-2-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1328380249-11697-1-git-send-email-tworaz666@gmail.com>
References: <1328380249-11697-1-git-send-email-tworaz666@gmail.com>
Subject: [meta-xfce][PATCH 1/3] xfconf: Update to latest stable version 4.8.1.
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
X-List-Received-Date: Sat, 04 Feb 2012 18:41:00 -0000

http://git.xfce.org/xfce/xfconf/tag/?id=xfconf-4.8.1

Run tested on netbook pro.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb |   15 ---------------
 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb |   13 +++++++++++++
 2 files changed, 13 insertions(+), 15 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
 create mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
deleted file mode 100644
index 65efffd..0000000
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Xfce configuration daemon and utilities"
-SECTION = "x11/wm"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "dbus-glib libxfce4util perl-native"
-
-PR = "r0"
-
-inherit xfce
-
-FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
-                ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
-
-SRC_URI[md5sum] = "0f11ed1ec7789c5c4c3fcc7cdb3c2940"
-SRC_URI[sha256sum] = "e071d55982238f997a691ff4bb08ef39e4c86bae31cf69b6666bc0cdadd1b85d"
diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb
new file mode 100644
index 0000000..51df2ee
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Xfce configuration daemon and utilities"
+SECTION = "x11/wm"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+DEPENDS = "dbus-glib libxfce4util perl-native"
+
+inherit xfce
+
+FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
+                ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
+
+SRC_URI[md5sum] = "70b4185aa7eed8a85f015f16c5c86d36"
+SRC_URI[sha256sum] = "9860737539fab2b852e8c07c50c205a5fbe894b08bcb4488a70e3fd6c75993cb"
-- 
1.7.3.4



