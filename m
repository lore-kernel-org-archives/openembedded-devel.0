Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NVDmB-0000Oa-7n for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 01:41:30 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NVDk3-0004ht-OW
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 01:39:15 +0100
Received: from p5b3b3319.dip.t-dialin.net ([91.59.51.25])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 01:39:15 +0100
Received: from no2spam by p5b3b3319.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 01:39:15 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 14 Jan 2010 01:38:49 +0100
Message-ID: <hilp2s$ag$1@ger.gmane.org>
References: <hill5g$ll0$1@ger.gmane.org>	<1263426466.457.286.camel@lenovo.internal.reciva.com>
	<1263427123.15954.6.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b3319.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <1263427123.15954.6.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Sane default for SPLASH
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
X-List-Received-Date: Thu, 14 Jan 2010 00:41:30 -0000
Content-Type: multipart/mixed; boundary="------------000109090407030904010602"

--------------000109090407030904010602
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> So the answer is likely that images or task .bb files use this thing.
> The logical approach would therefore be a weak default variable in
> image.bbclass or a package-groups.bbclass included by task-*.bb files...

yes, very good point indeed.  This does not have to be OE-wide, setting
it in image.bbclass is enough and much preferred.

Based on the suggestions I can now come up with a first draft of a patch
for discussion.  Further work would need to be done after this patch or
one like it has been applied.  There are currently a number of images
that hardwire the bootsplash.  For some, that is probably in their
nature and desired, for others it's not so clear.  Just to give an
example of the latter, I think that the BOOTSPLASH definition in
gpe-image.bb should be moved into the distro configuration instead.

--------------000109090407030904010602
Content-Type: text/x-patch;
 name="bootsplash.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="bootsplash.patch"

diff --git a/classes/image.bbclass b/classes/image.bbclass
index ab58031..8f45aeb 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -17,6 +17,9 @@ IMAGE_INITSCRIPTS ?= "initscripts"
 #
 IMAGE_LOGIN_MANAGER ?= "tinylogin"
 
+# set sane default for the BOOTSPLASH variable
+BOOTSPLASH ?= ""
+
 IMAGE_KEEPROOTFS ?= ""
 IMAGE_KEEPROOTFS[doc] = "Set to non-empty to keep ${IMAGE_ROOTFS} around after image creation."
 
diff --git a/recipes/images/beagleboard-demo-image.bb b/recipes/images/beagleboard-demo-image.bb
index d83281c..a410263 100644
--- a/recipes/images/beagleboard-demo-image.bb
+++ b/recipes/images/beagleboard-demo-image.bb
@@ -10,7 +10,7 @@ XSERVER ?= "xserver-xorg \
 "
 
 ANGSTROM_EXTRA_INSTALL ?= ""
-SPLASH = "exquisite exquisite-themes exquisite-theme-angstrom"
+BOOTSPLASH = "exquisite exquisite-themes exquisite-theme-angstrom"
 
 export IMAGE_BASENAME = "Beagleboard-demo-image"
 
@@ -19,7 +19,7 @@ IMAGE_INSTALL = "\
     ${XSERVER} \
     ${ANGSTROM_EXTRA_INSTALL} \
     task-beagleboard-demo \
-    ${SPLASH} \
+    ${BOOTSPLASH} \
     "
 
 IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
diff --git a/recipes/images/bootmanager-image.bb b/recipes/images/bootmanager-image.bb
index db05437..21d11a1 100644
--- a/recipes/images/bootmanager-image.bb
+++ b/recipes/images/bootmanager-image.bb
@@ -1,9 +1,9 @@
 #Angstrom bootmanager image
 
-SPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
+BOOTSPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
 
 DEPENDS = "task-angstrom"
-IMAGE_INSTALL = "angstrom-base-depends angstrom-bootmanager ${SPLASH}"
+IMAGE_INSTALL = "angstrom-base-depends angstrom-bootmanager ${BOOTSPLASH}"
 
 export IMAGE_BASENAME = "bootmanager-image"
 
diff --git a/recipes/images/console-base-image.bb b/recipes/images/console-base-image.bb
index d25a4fc..0b196b6 100644
--- a/recipes/images/console-base-image.bb
+++ b/recipes/images/console-base-image.bb
@@ -4,17 +4,16 @@ IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
 
 ANGSTROM_EXTRA_INSTALL ?= ""
 
-SPLASH ?= ""
 ZZAPSPLASH = ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-zap", "",d)}'
 
 DEPENDS = "task-base \
-           ${SPLASH} \
+           ${BOOTSPLASH} \
            ${ZZAPSPLASH} \
 	   "
 
 IMAGE_INSTALL = "task-base \
 	    ${ANGSTROM_EXTRA_INSTALL} \
-	    ${SPLASH} \
+	    ${BOOTSPLASH} \
 	    ${ZZAPSPLASH} \
 	    "
 
diff --git a/recipes/images/gateway-image.bb b/recipes/images/gateway-image.bb
index d7a77e0..061b6b0 100644
--- a/recipes/images/gateway-image.bb
+++ b/recipes/images/gateway-image.bb
@@ -1,7 +1,7 @@
 #Angstrom gateway image
 #gives you a gateway with SMB, ssh and dnsmasqs
 
-SPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
+BOOTSPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
 
 ANGSTROM_EXTRA_INSTALL ?= ""
 DISTRO_SSH_DAEMON ?= "dropbear"
@@ -13,7 +13,7 @@ IMAGE_INSTALL = "task-boot \
             dnsmasq \
 #            vsftpd \
             angstrom-version \
-            ${SPLASH} \
+            ${BOOTSPLASH} \
 	   "
 
 export IMAGE_BASENAME = "gateway-image"
diff --git a/recipes/images/gnuradio-image.bb b/recipes/images/gnuradio-image.bb
index 53e79b8..0c9bfe2 100644
--- a/recipes/images/gnuradio-image.bb
+++ b/recipes/images/gnuradio-image.bb
@@ -4,17 +4,16 @@ IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
 
 IMAGE_EXTRA_INSTALL ?= ""
 
-SPLASH ?= ""
 ZZAPSPLASH = ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-zap", "",d)}'
 
 DEPENDS = "task-base-extended \
-           ${SPLASH} \
+           ${BOOTSPLASH} \
            ${ZZAPSPLASH} \
 	   "
 
 IMAGE_INSTALL = "task-base-extended \
 	    ${IMAGE_EXTRA_INSTALL} \
-	    ${SPLASH} \
+	    ${BOOTSPLASH} \
 	    ${ZZAPSPLASH} \
             oprofile \
             screen \
diff --git a/recipes/images/gpe-image.bb b/recipes/images/gpe-image.bb
index 768cc6b..df4a802 100644
--- a/recipes/images/gpe-image.bb
+++ b/recipes/images/gpe-image.bb
@@ -8,7 +8,7 @@ XSERVER ?= "xserver-kdrive-fbdev"
 GPE_EXTRA_THEMES = "gpe-theme-industrial"
 
 # Select bootsplash 
-SPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
+BOOTSPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
 
 # Select some useful things depending on the device capabilities
 
@@ -29,7 +29,7 @@ GPE_EXTRA_INSTALL += "${GPE_BIGFLASH_INSTALL}"
 
 
 DEPENDS = "${MACHINE_TASK_PROVIDER} \
-	   ${SPLASH} \
+	   ${BOOTSPLASH} \
 	   task-gpe-base \
            task-gpe-apps \
            task-gpe-pim \
@@ -44,7 +44,7 @@ IMAGE_INSTALL = "\
     task-gpe-settings \
     task-gpe-apps \
     ${XSERVER} \
-    ${SPLASH} \
+    ${BOOTSPLASH} \
     ${GPE_EXTRA_INSTALL}"
 
 ROOTFS_POSTPROCESS_COMMAND += '${@base_conditional("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
diff --git a/recipes/images/illume-image.bb b/recipes/images/illume-image.bb
index 3ab006a..ca219f2 100644
--- a/recipes/images/illume-image.bb
+++ b/recipes/images/illume-image.bb
@@ -5,7 +5,7 @@
 IMAGE_LINGUAS = "en-us de-de fr-fr pt-br ca-es zh-cn zh-tw bg-bg cs-cz da-dk nl-nl fi-fi hu-hu it-it ja-jp ko-kr nb-no pl-pl ru-ru sk-sk sl-si es-ar sv-se"
 
 # use exquisite splash
-SPLASH = "exquisite exquisite-themes exquisite-theme-illume"
+BOOTSPLASH = "exquisite exquisite-themes exquisite-theme-illume"
 
 # getting the base system up
 BASE_INSTALL = "\
@@ -154,7 +154,7 @@ IMAGE_INSTALL = "\
 #  ${ZHONE_INSTALL} \
   ${APPS_INSTALL} \
   ${DEV_INSTALL} \
-  ${SPLASH} \
+  ${BOOTSPLASH} \
 "
 inherit image
 
diff --git a/recipes/images/minimal-gpe-image.bb b/recipes/images/minimal-gpe-image.bb
index c37225d..de6a625 100644
--- a/recipes/images/minimal-gpe-image.bb
+++ b/recipes/images/minimal-gpe-image.bb
@@ -3,7 +3,7 @@
 # Very angstrom and opkg centric
 
 XSERVER ?= "xserver-kdrive-fbdev"
-SPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
+BOOTSPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
 
 export IMAGE_BASENAME = "minimalist-gpe-image"
 
@@ -18,7 +18,7 @@ IMAGE_INSTALL = "\
     gpe-terminal \
     angstrom-feed-configs \
     opkg-nogpg opkg-collateral \
-    ${SPLASH} \
+    ${BOOTSPLASH} \
     "
 
 #zap root password for release images
diff --git a/recipes/images/minimal-image.bb b/recipes/images/minimal-image.bb
index e9abcb3..3d5d3aa 100644
--- a/recipes/images/minimal-image.bb
+++ b/recipes/images/minimal-image.bb
@@ -4,8 +4,6 @@
 ANGSTROM_EXTRA_INSTALL ?= ""
 DISTRO_SSH_DAEMON ?= "dropbear"
 
-SPLASH ?= " "
-
 IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
 
 IMAGE_INSTALL = "task-boot \
@@ -13,7 +11,7 @@ IMAGE_INSTALL = "task-boot \
             ${DISTRO_SSH_DAEMON} \
             ${ANGSTROM_EXTRA_INSTALL} \
             angstrom-version \
-            ${SPLASH} \
+            ${BOOTSPLASH} \
 	   "
 
 export IMAGE_BASENAME = "minimalist-image"
diff --git a/recipes/images/sdr-image.bb b/recipes/images/sdr-image.bb
index 55a59a2..7c52553 100644
--- a/recipes/images/sdr-image.bb
+++ b/recipes/images/sdr-image.bb
@@ -15,7 +15,7 @@ IMAGE_FSTYPES += "tar.bz2"
 ANGSTROM_EXTRA_INSTALL ?= ""
 DISTRO_SSH_DAEMON ?= "dropbear"
 XSERVER ?= "xserver-kdrive-fbdev"
-SPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
+BOOTSPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
 
 # Install "big" X if the target has a screen
 GUIPACKAGES_BIGX = " \
@@ -44,7 +44,7 @@ IMAGE_INSTALL = " task-base-extended \
 	uucp picocom \
 	angstrom-zeroconf-audio avahi-utils \
 	${ANGSTROM_EXTRA_INSTALL} \
-        ${SPLASH} \
+        ${BOOTSPLASH} \
 "
 
 inherit image
diff --git a/recipes/images/sugar-image.bb b/recipes/images/sugar-image.bb
index e4513f6..01218ad 100644
--- a/recipes/images/sugar-image.bb
+++ b/recipes/images/sugar-image.bb
@@ -1,5 +1,5 @@
 XSERVER ?= "xserver-kdrive-fbdev"
-SPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
+BOOTSPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
 ANGSTROM_EXTRA_INSTALL += ""
 
 export IMAGE_BASENAME = "sugar-image"
@@ -12,7 +12,7 @@ IMAGE_INSTALL = "\
     angstrom-gpe-task-base \
     angstrom-gpe-task-settings \
     task-sugar-sucrose \
-    ${SPLASH} \
+    ${BOOTSPLASH} \
     ${ANGSTROM_EXTRA_INSTALL}"
 
 IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
diff --git a/recipes/images/ti-demo-x11-image.bb b/recipes/images/ti-demo-x11-image.bb
index e37d183..2ed9150 100644
--- a/recipes/images/ti-demo-x11-image.bb
+++ b/recipes/images/ti-demo-x11-image.bb
@@ -10,7 +10,7 @@ XSERVER ?= "xserver-xorg \
 "
 
 ANGSTROM_EXTRA_INSTALL ?= ""
-SPLASH = "exquisite exquisite-themes exquisite-theme-angstrom"
+BOOTSPLASH = "exquisite exquisite-themes exquisite-theme-angstrom"
 
 export IMAGE_BASENAME = "ti-demo-x11-image"
 
@@ -19,7 +19,7 @@ IMAGE_INSTALL = "\
     ${XSERVER} \
     ${ANGSTROM_EXTRA_INSTALL} \
     task-demo-x11 \
-    ${SPLASH} \
+    ${BOOTSPLASH} \
     "
 
 IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
diff --git a/recipes/images/udumpty-image.bb b/recipes/images/udumpty-image.bb
index 8f616d9..3cda81f 100644
--- a/recipes/images/udumpty-image.bb
+++ b/recipes/images/udumpty-image.bb
@@ -1,6 +1,6 @@
 # Image that mimics the default desktop of a certain distro
 
-SPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
+BOOTSPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
 XSERVER ?= "xserver-xorg \
            xf86-input-evdev \
            xf86-input-mouse \
@@ -44,7 +44,7 @@ IMAGE_INSTALL = "\
 	gnome-control-center \
 	gnome-settings-daemon \
 	gnome-session \
-    ${SPLASH} \
+    ${BOOTSPLASH} \
 "
 
 IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
diff --git a/recipes/images/x11-gpe-image.bb b/recipes/images/x11-gpe-image.bb
index 837d94a..c3fc947 100644
--- a/recipes/images/x11-gpe-image.bb
+++ b/recipes/images/x11-gpe-image.bb
@@ -3,7 +3,7 @@
 ANGSTROM_EXTRA_INSTALL += " \
 			  " 
 XSERVER ?= "xserver-kdrive-fbdev"
-SPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
+BOOTSPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
 
 export IMAGE_BASENAME = "x11-gpe-image"
 
@@ -17,7 +17,7 @@ IMAGE_INSTALL = "\
     kernel-modules \
     hal \
     angstrom-gpe-task-pim \
-    ${SPLASH} \
+    ${BOOTSPLASH} \
     ${ANGSTROM_EXTRA_INSTALL}"
 
 
diff --git a/recipes/images/x11-gpe-java-image.bb b/recipes/images/x11-gpe-java-image.bb
index 760fe52..e4b7998 100644
--- a/recipes/images/x11-gpe-java-image.bb
+++ b/recipes/images/x11-gpe-java-image.bb
@@ -3,7 +3,7 @@
 ANGSTROM_EXTRA_INSTALL += " \
 			  " 
 XSERVER ?= "xserver-kdrive-fbdev"
-SPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
+BOOTSPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
 
 export IMAGE_BASENAME = "x11-gpe-java-image"
 
@@ -19,7 +19,7 @@ IMAGE_INSTALL = "\
     kernel-modules \
     hal \
     angstrom-gpe-task-pim \
-    ${SPLASH} \
+    ${BOOTSPLASH} \
     ${ANGSTROM_EXTRA_INSTALL}"
 
 IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
diff --git a/recipes/images/x11-image.bb b/recipes/images/x11-image.bb
index 7c632e3..552a8ab 100644
--- a/recipes/images/x11-image.bb
+++ b/recipes/images/x11-image.bb
@@ -12,7 +12,7 @@ IMAGE_INSTALL = "\
     angstrom-x11-base-depends \
     angstrom-gpe-task-base \
     angstrom-gpe-task-settings \
-    ${SPLASH} \
+    ${BOOTSPLASH} \
     ${ANGSTROM_EXTRA_INSTALL}"
 
 IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
diff --git a/recipes/images/x11-jvm-image.bb b/recipes/images/x11-jvm-image.bb
index fd0e5f0..63c0652 100644
--- a/recipes/images/x11-jvm-image.bb
+++ b/recipes/images/x11-jvm-image.bb
@@ -28,7 +28,7 @@ IMAGE_INSTALL = "\
     angstrom-x11-base-depends \
     angstrom-gpe-task-base \
     angstrom-gpe-task-settings \
-    ${SPLASH} \
+    ${BOOTSPLASH} \
     ${ADD_JVM} \
     ${ADD_OTHER} \
     ${ANGSTROM_EXTRA_INSTALL}"
diff --git a/recipes/images/x11-office-image.bb b/recipes/images/x11-office-image.bb
index ecbc8a0..6d0d306 100644
--- a/recipes/images/x11-office-image.bb
+++ b/recipes/images/x11-office-image.bb
@@ -3,7 +3,7 @@
 ANGSTROM_EXTRA_INSTALL += " \
 			  " 
 XSERVER ?= "xserver-kdrive-fbdev"
-SPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
+BOOTSPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
 
 export IMAGE_BASENAME = "x11-office-image"
 
@@ -22,7 +22,7 @@ IMAGE_INSTALL = "\
     claws-mail claws-mail claws-plugin-mailmbox claws-plugin-rssyl \
     midori minimo \
     gphoto2 \
-    ${SPLASH} \
+    ${BOOTSPLASH} \
     ${ANGSTROM_EXTRA_INSTALL}"
 
 IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
diff --git a/recipes/images/x11-pimlico-image.bb b/recipes/images/x11-pimlico-image.bb
index cb8e78d..32ec989 100644
--- a/recipes/images/x11-pimlico-image.bb
+++ b/recipes/images/x11-pimlico-image.bb
@@ -3,7 +3,7 @@
 ANGSTROM_EXTRA_INSTALL += " \
 			  " 
 XSERVER ?= "xserver-kdrive-fbdev"
-SPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
+BOOTSPLASH ?= ' ${@base_contains("MACHINE_FEATURES", "screen", "psplash-angstrom", "",d)}'
 
 export IMAGE_BASENAME = "x11-pimlico-image"
 
@@ -17,7 +17,7 @@ IMAGE_INSTALL = "\
     kernel-modules \
     hal \
     angstrom-ohand-task-pim \
-    ${SPLASH} \
+    ${BOOTSPLASH} \
     ${ANGSTROM_EXTRA_INSTALL}"
 
 IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"

--------------000109090407030904010602--
