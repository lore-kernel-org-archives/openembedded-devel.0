Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjHhw-00070L-Rt
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 23:56:48 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so957167eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 14:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=aQD1ycq5yum04rd/5aUouhWVJRBv45uaYfH8Cf27FaA=;
	b=w63+g6ZYguR1mwsqh2gVvKw+C7uwVi6bqy2QUsbtr/JiDfSa5ysv6zoDPN3oeH2CcR
	ipd0UweBi/keKr7fSOkBPk7yGR0sV7knT7fhPTsWpeqAlvr2P2qscCbci4osWFtepSnm
	SI6xercGjP6HfEqsC+Pf3pzjDwe15ouGgl0e+RQ7xnuYCvXd/d68W3y4suxl+2hPcuc4
	W7HrAeTjDDNh9EYrXVoCXGloSzxvIT4hullTb8HA2rebFyQuHRLWVgX1cGhxmIgIr9wR
	GKY6XyK4EbHzg1+T4ESUSYt9KEJZC7MtfFQV8/0+AvZVBJMDNXCPL303265GslRQzuWf
	wCLQ==
Received: by 10.14.209.193 with SMTP id s41mr9397107eeo.9.1355438528710;
	Thu, 13 Dec 2012 14:42:08 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 6sm5693567eea.3.2012.12.13.14.42.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 14:42:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 23:41:48 +0100
Message-Id: <fdcf7609f2e2ab18185acddf1727c69a537c337d.1355438402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/11] gnome-control-center: fix QA issue
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
X-List-Received-Date: Thu, 13 Dec 2012 22:56:49 -0000

* fixes:
gnome-control-center-2.32.1: non -staticdev package contains static .a library: gnome-control-center-dev path '/work/armv5te-oe-linux-gnueabi/gnome-control-center/2.32.1-r0/packages-split/gnome-control-center-dev/usr/lib/window-manager-settings/libmetacity.a'
l

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gnome-control-center/gnome-control-center_2.32.1.bb          | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
index 59d81b4..ea4ce4b 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "desktop-file-utils-native gnome-menus libunique dbus-glib gnome-desktop libxml2 metacity gconf gnome-settings-daemon librsvg pango libgnomekbd libxklavier libcanberra"
 
+PR = "r1"
+
 inherit gnome
 
 SRC_URI[archive.md5sum] = "b4e8ab5c7556ae07addbfcfb4fa2f761"
@@ -22,8 +24,5 @@ FILES_${PN} += "${datadir}/icon* \
                 ${datadir}/desktop-directories \
                "
 FILES_${PN}-dbg += "${libdir}/window-manager-settings/.debug"
-FILES_${PN}-dev += "${libdir}/window-manager-settings/*a"
-
-
-
-
+FILES_${PN}-dev += "${libdir}/window-manager-settings/*.la"
+FILES_${PN}-staticdev += "${libdir}/window-manager-settings/*.a"
-- 
1.8.0.2



