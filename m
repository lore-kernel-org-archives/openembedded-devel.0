Received: from [209.85.221.190] (helo=mail-qy0-f190.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MlHak-0002Gz-8F
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 09:27:49 +0200
Received: by qyk28 with SMTP id 28so3482255qyk.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Sep 2009 00:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=YBMl02/ZX+pT4SWiUElKQ9NGJxC0QkSuPgyGcJvlitQ=;
	b=RwlXnoIg96wsWuPW9y/EyQ99mp+YfSGrjEXey1brdhQH13YDP/EM74dhWaIszNF9h8
	Ok60UmQyuq7K70mzVcmPIiULkPQYSOD5C0Gpf87XVPa4BWp8Wzb0rXU9I0sbmL40DtcB
	9wZEFMULIzcQuQKYaj40YenFp5gvgRYmIWTHE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=i0R2P3gSkrmfwgJ4iovuVh07oB8zz8MMl3zfges2Vn8M11pdw+F5TUZpH3DZPwuKon
	rDzv+VfNEduBgmYa7PTebvhlyIZgq/4f1uxVu3vMZf4H7fUrPMnu+nk+FeuPi3QVs39b
	UB+7m8kIBsVpC2Z0hqHZjzSzzXjLVNGOGRQ5Q=
Received: by 10.224.117.13 with SMTP id o13mr10820038qaq.129.1252481237624;
	Wed, 09 Sep 2009 00:27:17 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id 6sm345014qwd.3.2009.09.09.00.27.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Sep 2009 00:27:16 -0700 (PDT)
Message-ID: <4AA758CC.7030505@gmail.com>
Date: Wed, 09 Sep 2009 16:57:08 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.190
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Fix netsurf touchscreen behaviour.
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
X-List-Received-Date: Wed, 09 Sep 2009 07:27:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

As per http://vlists.pepperfish.net/pipermail/netsurf-dev-netsurf-browser.org/2009-September/001588.html

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/netsurf/netsurf-2.1/touchscreen.patch |   21 +++++++++++++++++++++
 recipes/netsurf/netsurf_2.1.bb                |    3 ++-
 2 files changed, 23 insertions(+), 1 deletions(-)
 create mode 100644 recipes/netsurf/netsurf-2.1/touchscreen.patch

diff --git a/recipes/netsurf/netsurf-2.1/touchscreen.patch b/recipes/netsurf/netsurf-2.1/touchscreen.patch
new file mode 100644
index 0000000..a6c25dc
--- /dev/null
+++ b/recipes/netsurf/netsurf-2.1/touchscreen.patch
@@ -0,0 +1,21 @@
+--- netsurf.orig/gtk/gtk_window.c
++++ netsurf/gtk/gtk_window.c
+@@ -220,6 +220,7 @@
+ 				GDK_BUTTON_PRESS_MASK |
+ 				GDK_BUTTON_RELEASE_MASK |
+ 				GDK_POINTER_MOTION_MASK |
++				GDK_POINTER_MOTION_HINT_MASK |
+ 				GDK_KEY_PRESS_MASK |
+ 				GDK_KEY_RELEASE_MASK);
+ 	GTK_WIDGET_SET_FLAGS(GTK_WIDGET(g->drawing_area), GTK_CAN_FOCUS);
+@@ -344,6 +345,10 @@
+ 	bool shift = event->state & GDK_SHIFT_MASK;
+ 	bool ctrl = event->state & GDK_CONTROL_MASK;
+ 
++	if ((abs(event->x - g->last_x) < 5) && (abs(event->y - g->last_y) < 5))
++		/* necessary for touch screens */
++		return FALSE;
++
+    	if (g->mouse->state & BROWSER_MOUSE_PRESS_1){
+ 		/* Start button 1 drag */
+ 		browser_window_mouse_click(g->bw, BROWSER_MOUSE_DRAG_1,
diff --git a/recipes/netsurf/netsurf_2.1.bb b/recipes/netsurf/netsurf_2.1.bb
index 849a8e5..68da708 100644
--- a/recipes/netsurf/netsurf_2.1.bb
+++ b/recipes/netsurf/netsurf_2.1.bb
@@ -7,11 +7,12 @@ LICENSE = "GPLv2"
 SRC_URI = "http://www.netsurf-browser.org/downloads/releases/netsurf-${PV}-src.tar.gz \
 	   file://fix_makefile.patch;patch=1 \
 	   file://debugxml_fix.patch;patch=1 \
+	   file://touchscreen.patch;patch=1 \
 	   file://netsurf.png \
 	   file://netsurf.desktop \
 	   file://Makefile.config"
 
-PR = "r1"
+PR = "r2"
 
 # Workaround for 2.1 tarball (unpacks into netsurf/, not netsurf-2.1/ )
 S = "${WORKDIR}/netsurf"
-- 
1.6.0.3



