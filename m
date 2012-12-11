Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiERB-0007Rt-BB
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 02:15:14 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1930183eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2012 17:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Qaedaccum9rgfXKi3ydHYLcDaG0nNMsf77c+fCiBszY=;
	b=A+pC60Ib0J+W5dIpWtE9kGC1XFrV1jXQEBDK+2cA30P1rDmMyi8L8zoYDqXp0z/rGV
	9s5C3oiYhX3yLlgpyloIb6ZIjZ3tlY8GiOg9xFczVExNaqmwGhuZybpWsL2QI1XClkv7
	AVKncUhqG5YAGTekzC5RH+EtJ4nJ+zqoF4x7bHWnpLBWE0kGnAZLOpw81F5MVPlrigTl
	3Fcjn5lFuj89UE1TFDFnTtUOKPK+8hNqsBmdLV9zXt3toCkH+SAHwfI9lkewl9jbknnk
	rsUOVlfvtA5UEjtJsiN8ktL0G8HALDW/t8xoLjyWEB8eo8EON0TyIunkSnSfOZNTliKO
	I0Kw==
Received: by 10.14.0.133 with SMTP id 5mr54540889eeb.29.1355187638180;
	Mon, 10 Dec 2012 17:00:38 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b2sm46634075eep.9.2012.12.10.17.00.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Dec 2012 17:00:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Dec 2012 02:00:02 +0100
Message-Id: <f36e2e2ea4edcd4a0e65ed1c213bce388231214c.1355187290.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <fb4647c716848b803f2fe32036cce38855c93159.1355187290.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<fb4647c716848b803f2fe32036cce38855c93159.1355187290.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355187290.git.Martin.Jansa@gmail.com>
References: <cover.1355187290.git.Martin.Jansa@gmail.com>
Subject: [PATCH 90/90] gcalctool: upgrade to 5.32.0
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
X-List-Received-Date: Tue, 11 Dec 2012 01:15:14 -0000

* 5.8.17 required scrollkeeper which we don't provide as scrollkeeper-native
* inherit gsettings to package glib-2.0/shemas and compile them on target
* add LICENSE version and LIC_FILES_CHKSUM
* use SHRT_VER
* replace local patch with sed (other chunk is already resolved upstream)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb | 18 ++++++++++++++++++
 meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb | 15 ---------------
 2 files changed, 18 insertions(+), 15 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb

diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
new file mode 100644
index 0000000..88cf1d6
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "gcalctool is a powerful calculator"
+SECTION = "x11"
+DEPENDS = "gtk+ gnome-doc-utils"
+
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+SRC_URI = "http://download.gnome.org/sources/${PN}/${SHRT_VER}/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "48db927c6e7ee1d5395f953a8c184c98"
+SRC_URI[sha256sum] = "346f645c0fdef900642f6e9a2c18e7ba9a7ca9bc62fe2b08eb418f065a425c89"
+
+inherit autotools pkgconfig gsettings
+
+do_configure_prepend() {
+	sed -i -e "s: help: :g" ${S}/Makefile.am
+}
diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
deleted file mode 100644
index 61b28e4..0000000
--- a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-LICENSE = "GPL"
-SECTION = "x11"
-DEPENDS = "gtk+ gnome-doc-utils"
-DESCRIPTION = "gcalctool is a powerful calculator"
-PR = "r0"
-
-SRC_URI = "http://download.gnome.org/sources/${PN}/5.8/${PN}-${PV}.tar.gz \
-	file://fix-includedir.patch"
-
-SRC_URI[md5sum] = "dd9d4f326d7d925a5ad9fbb1c5b32142"
-SRC_URI[sha256sum] = "8806e7696eeee62f2df21135fc488ba99f7d55dfd2a40bb9615e2edd95391589"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--disable-gnome"
-- 
1.8.0



