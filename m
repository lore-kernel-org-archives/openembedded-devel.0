Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmkpI-0001Nc-Q1
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:38:44 +0100
Received: by mail-ea0-f178.google.com with SMTP id k11so2625321eaa.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=SXQnjS9VQjUR9cSUnwZX6rSPZ1UN5UGo2K0E7MUP1hA=;
	b=qDKK9uOxUNLCH/r0C2Kwg239o/CqPRX91Ct6YgkZwA43putY7eMZpRcXxyPSDyC7Ji
	viLdB06nCfvfNBJa1sNyKkYjrUe7dd8iO6YSw0ECn9DsmwbJ++9tyklWZp8Hvg+cstdl
	vElvrbRygdkWxd7IB4/93Z+w6LsAt7+lNpzVyH23XdcZqrrlhc9SNPZcAnJGtCIaMgdk
	QuzL5wakeDzKSTO9P+NgHfVDHtCEg8iRMwq2fHXnKjk89xYs7RZB57b4gQpWiaBgU5Vg
	kJ7ngeBsl0ngbv5xZR/Io70B76pID06Hqs7t2we6qoIK6Kxe3+c1pIHK6h9sS1hwJ5L+
	1hXw==
X-Received: by 10.14.176.66 with SMTP id a42mr47846768eem.34.1356265436464;
	Sun, 23 Dec 2012 04:23:56 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id v46sm34559534eep.1.2012.12.23.04.23.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:23:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:38 +0100
Message-Id: <580fd6c7438ac99956cfb376913109f226fc6bd0.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 13/30] meta-openembedded: use correct format of Upstream-Status
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
X-List-Received-Date: Sun, 23 Dec 2012 12:38:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* some patches have also incorrect value, but e.g. "Unknown" is as good as
  "Pending" to me

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gdm/gdm-2.32.2/0001-Remove-user-switch-applet.patch   | 2 +-
 .../gnome-system-monitor/files/0001-Fix-glib-includes.patch             | 2 +-
 .../recipes-gnome/gvfs/files/0001-gvfsfusedaemon.c-fix-glib-build.patch | 2 +-
 meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch  | 2 +-
 meta-networking/recipes-daemons/vblade/files/cross.patch                | 2 +-
 .../iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch   | 2 +-
 .../0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch     | 2 +-
 .../bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch    | 2 +-
 .../0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch     | 2 +-
 .../php/php/0001-php-don-t-use-broken-wrapper-for-mkdir.patch           | 2 +-
 .../python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch         | 2 +-
 .../usb-modeswitch/0001-usbmodeswitch-leave-stripping-to-packager.patch | 2 +-
 .../0002-usb-modeswitch-leave-script-munging-to-recipe.patch            | 2 +-
 meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch              | 2 +-
 .../xfce4-screenshooter/files/0001-Fix-panel-plugin-build.patch         | 2 +-
 .../recipes-panel-plugins/datetime/files/0001-port-to-libxfce4ui.patch  | 2 +-
 .../files/0002-configure.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch   | 2 +-
 .../files/0001-Handle-multiple-interactive-session-save-bug-5379.patch  | 2 +-
 .../0001-xsettings.xml-remove-trouble-causing-comment.patch             | 2 +-
 19 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/0001-Remove-user-switch-applet.patch b/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/0001-Remove-user-switch-applet.patch
index 03f51c1..75aff5d 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/0001-Remove-user-switch-applet.patch
+++ b/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/0001-Remove-user-switch-applet.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Remove user switch applet
 
 This hasn't been updated to work with gnome-panel > 2.30.0, so just drop it
 
-Upstream-status: unacceptable, backport
+Upstream-Status: unacceptable, backport
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-Fix-glib-includes.patch b/meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-Fix-glib-includes.patch
index adcc533..ace1b00 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-Fix-glib-includes.patch
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-Fix-glib-includes.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Fix glib includes
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
-Upstream status: unknown
+Upstream-Status: unknown
 
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
diff --git a/meta-gnome/recipes-gnome/gvfs/files/0001-gvfsfusedaemon.c-fix-glib-build.patch b/meta-gnome/recipes-gnome/gvfs/files/0001-gvfsfusedaemon.c-fix-glib-build.patch
index 3db44a8..95d193e 100644
--- a/meta-gnome/recipes-gnome/gvfs/files/0001-gvfsfusedaemon.c-fix-glib-build.patch
+++ b/meta-gnome/recipes-gnome/gvfs/files/0001-gvfsfusedaemon.c-fix-glib-build.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] gvfsfusedaemon.c: fix glib build
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
-Upstream-status: Applied but we can not use it because newer versions depend
+Upstream-Status: Applied but we can not use it because newer versions depend
 on gnome-disk-utiltity >= V3.02 which depends on gtk+ V3
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
diff --git a/meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch b/meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch
index 06f10bd..83e598e 100644
--- a/meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch
+++ b/meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Fix glib includes
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
-Upstream status: unknown
+Upstream-Status: unknown
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
diff --git a/meta-networking/recipes-daemons/vblade/files/cross.patch b/meta-networking/recipes-daemons/vblade/files/cross.patch
index 481b6fa..d2eb156 100644
--- a/meta-networking/recipes-daemons/vblade/files/cross.patch
+++ b/meta-networking/recipes-daemons/vblade/files/cross.patch
@@ -1,6 +1,6 @@
 Remove CC and CFLAGS values, we set these ourselves
 
-Upstream-status: Inappropriate [config]
+Upstream-Status: Inappropriate [config]
 
 diff -urN vblade-19.old//makefile vblade-19//makefile
 --- vblade-19.old//makefile	2008-10-08 22:07:40.000000000 +0100
diff --git a/meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch b/meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
index dfe3ca1..97c00cd 100644
--- a/meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
+++ b/meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] iw: version.sh: don't use git describe for versioning
 
 It will detect top-level git repositories like the Angstrom setup-scripts and break.
 
-Upstream-status: Unknown
+Upstream-Status: Unknown
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch
index ba49bcd..4356982 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch
@@ -3,7 +3,7 @@ From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 17 Nov 2011 11:17:42 +0100
 Subject: [PATCH] don't try to run /sbin/dhclient to get the version number, this break cross-compiling
 
-Upstream-status: Unknown
+Upstream-Status: Unknown
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
diff --git a/meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch b/meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch
index 0494c4f..4581ef2 100644
--- a/meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch
+++ b/meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch
@@ -24,7 +24,7 @@ So no real way to get the actual SoC name, TI AM3359, but a lot better than 'Unk
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
 
-Upstream-status: submitted
+Upstream-Status: submitted
 
  svg.c |    4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch b/meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch
index b3bda45..f63d98a 100644
--- a/meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch
+++ b/meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch
@@ -7,7 +7,7 @@ Subject: [PATCH 2/2] svg: open /etc/os-release and use PRETTY_NAME for the
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
 
-Upstream-status: Submitted
+Upstream-Status: Submitted
 
  svg.c |   11 +++++++++++
  1 file changed, 11 insertions(+)
diff --git a/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-for-mkdir.patch b/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-for-mkdir.patch
index 1e16b86..9b71e9d 100644
--- a/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-for-mkdir.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-php-don-t-use-broken-wrapper-for-mkdir.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] php: don't use broken wrapper for mkdir
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
 
-Upstream-status: Inappropriate
+Upstream-Status: Inappropriate
 
  Makefile.global |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)
diff --git a/meta-oe/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch b/meta-oe/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch
index 3c3ec7c..0b0d471 100644
--- a/meta-oe/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch
+++ b/meta-oe/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] disable AI_ADDRCONFIG flag
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 
-Upstream-status: unknown
+Upstream-Status: unknown
 ---
  tornado/netutil.py |    6 ------
  1 files changed, 0 insertions(+), 6 deletions(-)
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-usbmodeswitch-leave-stripping-to-packager.patch b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-usbmodeswitch-leave-stripping-to-packager.patch
index 0cbacf0..e51a89c 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-usbmodeswitch-leave-stripping-to-packager.patch
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-usbmodeswitch-leave-stripping-to-packager.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] usbmodeswitch: leave stripping to packager
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
 
-Upstream-status: Unknown
+Upstream-Status: Unknown
 
  Makefile |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0002-usb-modeswitch-leave-script-munging-to-recipe.patch b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0002-usb-modeswitch-leave-script-munging-to-recipe.patch
index f9396b2..4f549fd 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0002-usb-modeswitch-leave-script-munging-to-recipe.patch
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0002-usb-modeswitch-leave-script-munging-to-recipe.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] usb-modeswitch: leave script munging to recipe
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
 
-Upstream-status: Unknown
+Upstream-Status: Unknown
 
  Makefile |   13 +------------
  1 files changed, 1 insertions(+), 12 deletions(-)
diff --git a/meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch b/meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch
index 41bf4cc..81c5d1b 100644
--- a/meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch
+++ b/meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch
@@ -1,4 +1,4 @@
-Upstream Status: Backport
+Upstream-Status: Backport
 Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
 ---
  src/xslt.c | 19 +++++++------------
diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Fix-panel-plugin-build.patch b/meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Fix-panel-plugin-build.patch
index c30f9cb..98ce875 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Fix-panel-plugin-build.patch
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Fix-panel-plugin-build.patch
@@ -7,7 +7,7 @@ Subject: [PATCH] Fix panel plugin build.
 - Build as a module.
 - Only export needed symbols.
 ---
-Upstream-status: applied
+Upstream-Status: applied
  Makefile.am |   12 +++++++++---
  1 files changed, 9 insertions(+), 3 deletions(-)
 
diff --git a/meta-xfce/recipes-panel-plugins/datetime/files/0001-port-to-libxfce4ui.patch b/meta-xfce/recipes-panel-plugins/datetime/files/0001-port-to-libxfce4ui.patch
index 08ea135..ccff851 100644
--- a/meta-xfce/recipes-panel-plugins/datetime/files/0001-port-to-libxfce4ui.patch
+++ b/meta-xfce/recipes-panel-plugins/datetime/files/0001-port-to-libxfce4ui.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] port to libxfce4ui
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
-Upstream-status: pending
+Upstream-Status: pending
 
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
diff --git a/meta-xfce/recipes-panel-plugins/datetime/files/0002-configure.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch b/meta-xfce/recipes-panel-plugins/datetime/files/0002-configure.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch
index 05f7c72..fedbc12 100644
--- a/meta-xfce/recipes-panel-plugins/datetime/files/0002-configure.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch
+++ b/meta-xfce/recipes-panel-plugins/datetime/files/0002-configure.ac.in-remove-breaking-BM_DEBUG_SUPPORT.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] configure.ac.in: remove breaking BM_DEBUG_SUPPORT
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
-Upstream-status: pending
+Upstream-Status: pending
 
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
diff --git a/meta-xfce/recipes-xfce/xfce4-session/files/0001-Handle-multiple-interactive-session-save-bug-5379.patch b/meta-xfce/recipes-xfce/xfce4-session/files/0001-Handle-multiple-interactive-session-save-bug-5379.patch
index 38949a5..dd9c6d4 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/files/0001-Handle-multiple-interactive-session-save-bug-5379.patch
+++ b/meta-xfce/recipes-xfce/xfce4-session/files/0001-Handle-multiple-interactive-session-save-bug-5379.patch
@@ -9,7 +9,7 @@ anything on log out without session save.
 
 Based on original work by Chris Bainbridge (chris.bainbridge@gmail.com).
 ---
-Upstream-status: applied
+Upstream-Status: applied
  xfce4-session/xfsm-manager.c |   81 ++++++++++++++++++++++++-----------------
  1 files changed, 47 insertions(+), 34 deletions(-)
 
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-remove-trouble-causing-comment.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-remove-trouble-causing-comment.patch
index a76fad2..f926a93 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-remove-trouble-causing-comment.patch
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-remove-trouble-causing-comment.patch
@@ -5,7 +5,7 @@ Subject: [PATCH 1/2] xsettings.xml: remove trouble causing comment
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
-Upstream-status: Pending
+Upstream-Status: Pending
 
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-- 
1.8.0.2



