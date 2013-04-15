Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URedR-0003ae-DN
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 10:19:51 +0200
Received: by mail-ee0-f41.google.com with SMTP id c1so2149351eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 01:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=65NpqOLU+PNika9l8I5pgDPrrsn3vLmq+z/TZpci8tM=;
	b=g/DdGc2QCo82oJuqpNHE8LD9xMiGlm2ug6ovjxfLHf9o+hiI8e8GbI6+9WvcfkRvx/
	U635DbsLyXVgCvK9rtdHmYW4sY6581VZy04CE8TlW33tYqlDxc9+93cKliPoOOGPbuC6
	7jW2s20+g8oM7qOBbAt+B3sFGyYBS2qBuQR3Jlq8ABMbUFdupX6PdLVoJdXpz0kwWYzx
	YnmNBpKWbn1UY8rQ0IZ53l9bIpqzHVRNaz5Nyn09bhaGPsAAA30LW91dT3iGjYtm4BS1
	JmKRcls8d2gOsLGTVUc9dioqxIoX9mtO6vyYn+Ix+zRNbdh73dd8il3Ao+Xbx1qkB4JB
	L/zg==
X-Received: by 10.15.94.200 with SMTP id bb48mr59833918eeb.21.1366012924925;
	Mon, 15 Apr 2013 01:02:04 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id bj2sm25494213eeb.1.2013.04.15.01.02.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 01:02:03 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Apr 2013 10:01:55 +0200
Message-Id: <1366012915-7125-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQmVgUbvghhsmDc80gW52pgoGXwdiCufeiNtBlM0BS6rg+n+J19ojCtcOIBSfaJKM9a9lRVh
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-gnome][PATCH] metacity 2.24.13: fix crash on startup
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
X-List-Received-Date: Mon, 15 Apr 2013 08:19:54 -0000

Metacity crashes without the schemas installed, so RDEPEND on them

root@beaglebone:~# metacity

(metacity:594): GLib-GIO-ERROR **: Settings schema 'org.gnome.desktop.wm.preferences' is not installed

Trace/breakpoint trap
6 XSELINUXs still allocated at reset
SCREEN: 0 objects of 180 bytes = 0 total bytes 0 private allocs
COLORMAP: 0 objects of 4 bytes = 0 total bytes 0 private allocs
DEVICE: 0 objects of 64 bytes = 0 total bytes 0 private allocs
CLIENT: 0 objects of 84 bytes = 0 total bytes 0 private allocs
WINDOW: 0 objects of 20 bytes = 0 total bytes 0 private allocs
PIXMAP: 2 objects of 8 bytes = 16 total bytes 0 private allocs
GC: 4 objects of 8 bytes = 32 total bytes 0 private allocs
CURSOR: 0 objects of 4 bytes = 0 total bytes 0 private allocs
DBE_WINDOW: 0 objects of 12 bytes = 0 total bytes 0 private allocs
TOTAL: 6 objects, 48 bytes, 0 allocs
2 PIXMAPs still all[  281.248271] tilcdc 4830e000.fb: timeout waiting for framedone
ocated at reset
PIXMAP: 2 objects of 8 bytes = 16 total bytes 0 private allocs
GC: 4 objects of 8 bytes = 32 total bytes 0 private allocs
CURSOR: 0 objects of 4 bytes = 0 total bytes 0 private allocs
DBE_WINDOW: 0 objects of 12 bytes = 0 total bytes 0 private allocs
TOTAL: 6 objects, 48 bytes, 0 allocs
4 GCs still allocated at reset
GC: 4 objects of 8 bytes = 32 total bytes 0 private allocs
CURSOR: 0 objects of 4 bytes = 0 total bytes 0 private allocs
DBE_WINDOW: 0 objects of 12 bytes = 0 total bytes 0 private allocs
TOTAL: 4 objects, 32 bytes, 0 allocs
root@beaglebone:~#

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
index 3605201..e82f89c 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/include/main.h;endline=24;md5=c2242df552c880280315989bab626b90"
 
 DEPENDS = "gsettings-desktop-schemas startup-notification gtk+ gconf gdk-pixbuf-native libcanberra gnome-doc-utils"
-PR = "r0"
+PR = "r1"
 
 inherit gnome update-alternatives
 
@@ -27,4 +27,5 @@ do_configure_prepend() {
 }
 
 FILES_${PN} += "${datadir}/themes ${datadir}/gnome-control-center ${datadir}/gnome"
+RDEPENDS_${PN} += "gsettings-desktop-schemas"
 
-- 
1.8.1.4



