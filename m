Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1Hg0Ga-0002oi-FT
	for openembedded-devel@openembedded.org; Mon, 23 Apr 2007 17:15:48 +0200
Received: (qmail 15695 invoked by uid 813007); 23 Apr 2007 14:49:07 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 23 Apr 2007 14:49:07 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Apr 2007 16:49:00 +0200
User-Agent: KMail/1.9.6
MIME-Version: 1.0
Message-Id: <200704231649.01632.openembedded@hrw.one.pl>
Subject: Wifi and Bluetooth support in task-base
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Apr 2007 15:15:48 -0000
X-Groupsio-MsgNum: 1914
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_ddMLGb8jlRLyWnZ"

--Boundary-00=_ddMLGb8jlRLyWnZ
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Our task-base is restructured now into separate task-base-* ones. Each 
feature got own metapackage and task-base contain all needed ones for 
machine.

But there comes problem. Many of our devices have PCI or Pcmcia/CF or USB 
Host functionality but do not have integrated Wifi or BT so users adds 
external 'cards/dongles' to get it. With current task-base they do not 
get them working without installing extra task-base-* packages.

I wrote small patch which change this. If Distro feature wifi then machine 
with pcmcia/pci/usbhost feature will get task-base-wifi added into 
task-base. Same goes for Bluetooth.

Someone can say that why not add usbhost support for pcmcia/pci machines - 
All our pci machines already feature usbhost. USB controllers for cf 
devices are expensive so only small amount of users have them.

Read patch, comment, complain.

-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

               Beware of Programmers who carry screwdrivers.
               		-- Leonard Brandwein

--Boundary-00=_ddMLGb8jlRLyWnZ
Content-Type: text/x-diff;
  charset="utf-8";
  name="task-base.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="task-base.diff"

# 
# old_revision [a5563210e57ff1a3cb7ddee80670313b6e95fdaa]
# 
# patch "packages/tasks/task-base.bb"
#  from [f42fce68f538f09a771fa2674b72feff0e5c88b4]
#    to [01ca51df062e419dcf92aca42814c26197770110]
# 
============================================================
--- packages/tasks/task-base.bb	f42fce68f538f09a771fa2674b72feff0e5c88b4
+++ packages/tasks/task-base.bb	01ca51df062e419dcf92aca42814c26197770110
@@ -1,5 +1,5 @@ DESCRIPTION = "Merge machine and distro 
 DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
-PR = "r28"
+PR = "r29"
 
 PACKAGES = 'task-boot \
             task-base \
@@ -105,7 +105,6 @@ RDEPENDS_task-base = "\
     ${@base_contains('COMBINED_FEATURES', 'usbgadget', 'task-base-usbgadget', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'usbhost', 'task-base-usbhost', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'bluetooth', 'task-base-bluetooth', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'wifi', 'task-base-wifi', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'uboot', 'task-base-uboot', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'redboot', 'task-base-redboot', '',d)} \
     \
@@ -114,8 +113,31 @@ RDEPENDS_task-base = "\
     ${@base_contains('DISTRO_FEATURES', 'ipsec', 'task-base-ipsec', '',d)} \
     ${@base_contains('DISTRO_FEATURES', 'ppp', 'task-base-ppp', '',d)} \
     ${@base_contains('DISTRO_FEATURES', 'raid', 'task-base-raid', '',d)} \
+    \
+    ${ADD_WIFI} \
+    ${ADD_BT} \
     "
 
+ADD_WIFI = ""
+ADD_BT = ""
+
+python __anonymous () {
+    import bb
+    # If Distro want wifi and machine feature wifi/pci/pcmcia/usbhost (one of them)
+    # then include task-base-wifi in task-base
+
+    distro_features = bb.data.getVar("DISTRO_FEATURES", d, 1)
+    machine_features= bb.data.getVar("MACHINE_FEATURES", d, 1)
+
+    if distro_features.find("bluetooth") and not machine_features.find("bluetooth") and (machine_features.find("pcmcia") or machine_features.find("pci")  or  machine_features.find("usbhost")):
+	bb.data.setVar("ADD_BT", "task-base-bluetooth", d)
+
+    if distro_features.find("wifi") and not machine_features.find("wifi") and (machine_features.find("pcmcia") or machine_features.find("pci")  or  machine_features.find("usbhost")):
+	bb.data.setVar("ADD_WIFI", "task-base-wifi", d)
+}
+
+
+
 #
 # packages added by distribution
 #

--Boundary-00=_ddMLGb8jlRLyWnZ--
