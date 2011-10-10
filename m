Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RDMje-0004Rn-6V
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Oct 2011 22:46:06 +0200
Received: (qmail invoked by alias); 10 Oct 2011 20:40:25 -0000
Received: from p4FDF1933.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.25.51]
	by mail.gmx.net (mp062) with SMTP; 10 Oct 2011 22:40:25 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/QvU1rLGTQ/YhqwbcOn4yFz5Qhx27tIMYbnAIiYS
	TJN4olV2tfOHEu
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Oct 2011 22:44:50 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201110102244.51216.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe] Networkmanager help (and other issues?)
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
X-List-Received-Date: Mon, 10 Oct 2011 20:46:06 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

I am working on a xfce-image (see below) in angstrom environment with networkmanager / nm-applet taking care of network/wlan settings. Currently I have no display manager. In very old oe-classic times I used 'slim' - but a try caused kernel panic. That one needs some alignment for systemd I think - but this is another issue.

So I login to console and call 'startxfce4'. Without futher preparations neither networkmanager nor nm-applet are started properly.
I took a look around and found a workaround by entering the following two commands before 'startxfce4':

1. dbus-launch --config-file=/etc/dbus-1/system.conf
2. /etc/init.d/Networkmanager start

As a side-effect I discovered that after calling 1. the 'shutdown' and 'restart' options are enabled when logging of from xfce-session.

Now my questions:

* What steps are required to save me from entering the two commands?
* Is this a dbus or a systemd or a missing display-manager issue?

Hints appreciated

Andreas

diff --git a/recipes-angstrom/images/xfce-base-image.bb b/recipes-angstrom/images/xfce-base-image.bb
new file mode 100644
index 0000000..2fea779
--- /dev/null
+++ b/recipes-angstrom/images/xfce-base-image.bb
@@ -0,0 +1,53 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+PR = "r0"
+
+require systemd-image.bb
+
+# conman conflicts with networkmanager so remove here
+CONMANPKGS = ""
+
+export IMAGE_BASENAME = "xfce-base-image"
+
+IMAGE_INSTALL += " \
+    task-base-extended \
+    task-xserver \
+    task-xfce-base \
+    \
+    xfwm4-theme-daloa \
+    xfwm4-theme-kokodi \
+    xfwm4-theme-moheli \
+    xfwm4-theme-sassandra \
+    xfwm4-theme-stoneage \
+    xfwm4-theme-therapy \
+    xfwm4-theme-tyrex \
+    xfwm4-theme-wallis \
+    \
+    xfce4-appfinder \ 
+    xfce4-screenshooter \
+    midori \
+    ristretto \
+    gedit \
+    \
+    gtk-xfce-engine \
+    \
+    gvfs \
+    gvfsd-ftp gvfsd-sftp gvfsd-trash \
+    \
+    iso-codes mime-support consolekit \
+    upower udisks \
+    \
+    network-manager-applet networkmanager \
+    \
+    xserver-common \
+    ttf-dejavu-sans ttf-dejavu-sans-mono ttf-dejavu-common \
+    gnome-icon-theme \
+"
+
+#    slim
+#    udev-extra-rules
+#    orage
+#    xserver-nodm-init
+
+
+inherit image
-- 
1.7.4.4


