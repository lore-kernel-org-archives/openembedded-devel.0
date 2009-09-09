Received: from [209.85.221.172] (helo=mail-qy0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MlHAD-0000jy-1y
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 09:00:25 +0200
Received: by qyk2 with SMTP id 2so3576652qyk.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2009 23:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=LpOKoPozPV/SvlVrkwSrw3E5Hpa+w89zVG67DQMiHfc=;
	b=k2V7f6ZNnBd+bHtkVcnOllD5YOJRQdJL+A0dofWtUpiNnoAfXWxd46LmoWqfrkXFpk
	f8TYQq+hW3WnysqBXTy0zADQh0re5Uoolce2EIhLyk9LooSzYT8m/859s89u1PRy9GLX
	bWeruVcAbNIh5y1lhoqnQAThetu9am8GH1Ug8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=F1DbmfdqDtWu+8odF7DZVYyGQoXv9nGwU78tQnxNdqmJobLgn4CDL3IEA4/Uep2D+P
	nkXctgYKW2sj87N1kX8A2c4NEbQ0W1pg3lYbkL1Wp9MHnbVH9oY58/B3pF/Enhk7j3pZ
	yV15Rg9Pu642hCnd0glbXTw0GgFGrn0+9/VjA=
Received: by 10.224.105.31 with SMTP id r31mr10672153qao.374.1252479592984;
	Tue, 08 Sep 2009 23:59:52 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id 26sm303250qwa.22.2009.09.08.23.59.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 08 Sep 2009 23:59:51 -0700 (PDT)
Message-ID: <4AA75260.4010901@gmail.com>
Date: Wed, 09 Sep 2009 16:29:44 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.172
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Add fbreader 0.10.7
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
X-List-Received-Date: Wed, 09 Sep 2009 07:00:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Probably looks ugly on small screens, but as none of the other build targets
would build for me, nor the older fbreader recipes, I adapted the desktop/gtk
target for this latest version.

Patches are mostly to fix tap scrolling bugs.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 conf/checksums.ini                                 |    4 +
 .../fbreader/fbreader-0.10.7/clear-selection.patch |   14 +++++
 .../fbreader-0.10.7/motion-threshold.patch         |   23 ++++++++
 .../fbreader-0.10.7/remove-recursion.patch         |   10 +++
 recipes/fbreader/fbreader-0.10.7/sane-events.patch |   59 ++++++++++++++++++++
 recipes/fbreader/fbreader_0.10.7.bb                |   41 ++++++++++++++
 6 files changed, 151 insertions(+), 0 deletions(-)
 create mode 100644 recipes/fbreader/fbreader-0.10.7/clear-selection.patch
 create mode 100644 recipes/fbreader/fbreader-0.10.7/motion-threshold.patch
 create mode 100644 recipes/fbreader/fbreader-0.10.7/remove-recursion.patch
 create mode 100644 recipes/fbreader/fbreader-0.10.7/sane-events.patch
 create mode 100644 recipes/fbreader/fbreader_0.10.7.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index a69b6b0..74580d6 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -6066,6 +6066,10 @@ sha256=e4db7a6305ffe2333fae08c940ded8f7e5b02999e0917b0ea4ef3764c80f58c8
 md5=2d2f3713cf3c17b71997064f39d4c888
 sha256=e4db7a6305ffe2333fae08c940ded8f7e5b02999e0917b0ea4ef3764c80f58c8
 
+[http://www.fbreader.org/fbreader-sources-0.10.7.tgz]
+md5=145f4d2ba24c54288bad2d66ddd2baf2
+sha256=d7bcc7cafb1c78f00b380dc2facdb82c5a2fb1475e1ddfc8e5d44a2b855cec1a
+
 [http://only.mawhrin.net/fbreader/obsolete/fbreader-sources-0.7.3d.tgz]
 md5=705a89bb03860fb312a7afa25db0310e
 sha256=ec9f93968147526a9b2dd17e31a6d2795356b2eeed309f796f655b37b98abd83
diff --git a/recipes/fbreader/fbreader-0.10.7/clear-selection.patch b/recipes/fbreader/fbreader-0.10.7/clear-selection.patch
new file mode 100644
index 0000000..813b2ba
--- /dev/null
+++ b/recipes/fbreader/fbreader-0.10.7/clear-selection.patch
@@ -0,0 +1,14 @@
+--- fbreader-0.10.7.orig/zlibrary/text/src/view/ZLTextView.cpp
++++ fbreader-0.10.7/zlibrary/text/src/view/ZLTextView.cpp
+@@ -479,6 +478,11 @@
+ bool ZLTextView::onStylusRelease(int x, int y) {
+ 	myDoubleClickInfo.update(x, y, false);
+ 
++	if (myDoubleClickInfo.Count == 2) {
++		/* fast tap */
++		mySelectionModel.clear();
++		application().refreshWindow();
++	}
+ 	if (myDoubleClickInfo.Count > 0) {
+ 		return onStylusClick(x, y, myDoubleClickInfo.Count);
+ 	}
diff --git a/recipes/fbreader/fbreader-0.10.7/motion-threshold.patch b/recipes/fbreader/fbreader-0.10.7/motion-threshold.patch
new file mode 100644
index 0000000..0359aba
--- /dev/null
+++ b/recipes/fbreader/fbreader-0.10.7/motion-threshold.patch
@@ -0,0 +1,23 @@
+http://www.mikecrash.com/index.php?name=News&file=article&id=107
+
+diff -ur fbreader-0.10.7/fbreader/src/fbreader/FBView.cpp fbreader-0.10.7dfsg/fbreader/src/fbreader/FBView.cpp
+--- fbreader-0.10.7/fbreader/src/fbreader/FBView.cpp	2009-03-30 23:26:07.000000000 +1030
++++ fbreader-0.10.7dfsg/fbreader/src/fbreader/FBView.cpp	2009-05-29 13:07:36.000000000 +0930
+@@ -151,7 +154,7 @@
+ 	}
+ 
+ 	myIsReleasedWithoutMotion =
+-		myIsReleasedWithoutMotion && (abs(x - pressedX()) <= 5) && (abs(y - pressedY()) <= 5);
++		myIsReleasedWithoutMotion && (abs(x - pressedX()) <= 50) && (abs(y - pressedY()) <= 50);
+ 	if (isReleasedWithoutMotion() &&
+ 			fbreader().EnableTapScrollingOption.value() &&
+ 			(!ZLBooleanOption(ZLCategoryKey::EMPTY, ZLOption::PLATFORM_GROUP, ZLOption::FINGER_TAP_DETECTABLE, false).value() ||
+@@ -185,7 +188,7 @@
+ 
+ bool FBView::onStylusMovePressed(int x, int y) {
+ 	if (myIsReleasedWithoutMotion) {
+-		if ((abs(x - pressedX()) > 5) || (abs(y - pressedY()) > 5)) {
++		if ((abs(x - pressedX()) > 50) || (abs(y - pressedY()) > 50)) {
+ 			myIsReleasedWithoutMotion = false;
+ 			activateSelection(pressedX(), pressedY());
+ 		}
diff --git a/recipes/fbreader/fbreader-0.10.7/remove-recursion.patch b/recipes/fbreader/fbreader-0.10.7/remove-recursion.patch
new file mode 100644
index 0000000..cab3bb4
--- /dev/null
+++ b/recipes/fbreader/fbreader-0.10.7/remove-recursion.patch
@@ -0,0 +1,10 @@
+--- fbreader-0.10.7/zlibrary/core/src/application/ZLApplication.cpp.orig
++++ fbreader-0.10.7/zlibrary/core/src/application/ZLApplication.cpp
+@@ -210,7 +210,6 @@
+ void ZLApplicationWindow::refresh() {
+ 	refreshToolbar(WINDOW_TOOLBAR);
+ 	refreshToolbar(FULLSCREEN_TOOLBAR);
+-	processAllEvents();
+ }
+ 
+ void ZLApplicationWindow::refreshToolbar(ToolbarType type) {
diff --git a/recipes/fbreader/fbreader-0.10.7/sane-events.patch b/recipes/fbreader/fbreader-0.10.7/sane-events.patch
new file mode 100644
index 0000000..8f583e9
--- /dev/null
+++ b/recipes/fbreader/fbreader-0.10.7/sane-events.patch
@@ -0,0 +1,59 @@
+--- fbreader-0.10.7.orig/zlibrary/ui/src/gtk/view/ZLGtkViewWidget.cpp
++++ fbreader-0.10.7/zlibrary/ui/src/gtk/view/ZLGtkViewWidget.cpp
+@@ -23,6 +23,7 @@
+ 
+ #include <ZLibrary.h>
+ #include <ZLLanguageUtil.h>
++#include <stdlib.h>
+ 
+ #include "ZLGtkViewWidget.h"
+ #include "ZLGtkPaintContext.h"
+@@ -54,7 +55,15 @@
+ 	}
+ }
+ 
++static int mouse_is_down = 0;
++
+ static void mousePressed(GtkWidget *area, GdkEventButton *event, gpointer data) {
++	if (event->button == 3)
++		/* ignore gtkstylus long touch events */
++		return;
++
++	mouse_is_down = 1;
++
+ 	gtk_window_set_focus(GTK_WINDOW(gtk_widget_get_toplevel(area)), area);
+ 	ZLGtkViewWidget *viewWidget = (ZLGtkViewWidget*)data;
+ 	int x = (int)event->x;
+@@ -65,6 +74,12 @@
+ }
+ 
+ static void mouseReleased(GtkWidget*, GdkEventButton *event, gpointer data) {
++	if (event->button == 3)
++		/* ignore gtkstylus long touch events */
++		return;
++
++	mouse_is_down = 0;
++
+ 	ZLGtkViewWidget *viewWidget = (ZLGtkViewWidget*)data;
+ 	int x = (int)event->x;
+ 	int y = (int)event->y;
+@@ -73,6 +88,19 @@
+ }
+ 
+ static void mouseMoved(GtkWidget*, GdkEventMotion *event, gpointer data) {
++	static gdouble last_x=0, last_y=0;
++
++	if (!mouse_is_down)
++		/* we couldn't possibly want this mouse move event */
++		return;
++
++	if (abs(last_x-event->x) < 5 && abs(last_y-event->y) < 5)
++		/* give the touchscreen tolerance for small movement */
++		return;
++
++	last_x = event->x;
++	last_y = event->y;
++
+ 	ZLGtkViewWidget *viewWidget = (ZLGtkViewWidget*)data;
+ 	int x, y;
+ 	GdkModifierType state;
diff --git a/recipes/fbreader/fbreader_0.10.7.bb b/recipes/fbreader/fbreader_0.10.7.bb
new file mode 100644
index 0000000..256467e
--- /dev/null
+++ b/recipes/fbreader/fbreader_0.10.7.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "FBreader is an ebook reader"
+HOMEPAGE = "http://www.fbreader.org"
+SECTION = "x11/utils"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+DEPENDS = "gtk+ expat bzip2 libfribidi liblinebreak virtual/libiconv"
+
+SRC_URI = "http://www.fbreader.org/fbreader-sources-${PV}.tgz \
+	   file://motion-threshold.patch;patch=1 \
+	   file://remove-recursion.patch;patch=1 \
+	   file://sane-events.patch;patch=1 \
+	   file://clear-selection.patch;patch=1 \
+	   "
+
+READER_ARCH	  = "desktop"
+READER_GUI	  = "gtk"
+READER_STATUS	  = "release"
+
+FILES_${PN} += "${datadir}/FBReader ${datadir}/zlibrary ${libdir}/zlibrary"
+FILES_${PN}-dbg += "${libdir}/zlibrary/ui/.debug"
+
+CFLAGS_append = "INSTALLDIR=/usr"
+EXTRA_OEMAKE = "CC='${CXX}' LD='${CXX}' OE_CFLAGS='${CXXFLAGS}' INCPATH='${STAGING_INCDIR}' LIBPATH='${STAGING_LIBDIR}'"
+
+inherit pkgconfig
+
+do_configure() {
+	echo "TARGET_ARCH = ${READER_ARCH}" > ${S}/makefiles/target.mk	
+	echo "UI_TYPE = ${READER_GUI}" >> ${S}/makefiles/target.mk
+	echo "TARGET_STATUS = ${READER_STATUS}" >> ${S}/makefiles/target.mk
+}
+
+do_compile_append() {
+	# enable tap scrolling
+	sed -i -e 's/Enabled" value="false/Enabled" value="true/' \
+		${S}/fbreader/data/default/config.desktop.xml
+}
+
+do_install () {
+	oe_runmake DESTDIR=${D} install
+}
-- 
1.6.0.3



