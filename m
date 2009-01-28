Received: from [82.208.44.173] (helo=ibawizard.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@ibawizard.net>) id 1LS8fA-0002m2-Fc
	for openembedded-devel@openembedded.org; Wed, 28 Jan 2009 12:32:56 +0100
Received: by ibawizard.net (Postfix, from userid 1002)
	id C4F1C16C001; Wed, 28 Jan 2009 12:25:14 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Date: Wed, 28 Jan 2009 12:25:14 +0100
Message-Id: <1233141914-25251-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.0
Subject: [PATCH] fix missing groups in udevd
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
X-List-Received-Date: Wed, 28 Jan 2009 11:32:56 -0000

Fix for udevd warning messages when I plug in USB stick:

	Starting udevudevd[585]: lookup_group: specified group 'scanner' unknown
	udevd[585]: lookup_group: specified group 'nvram' unknown
	udevd[585]: lookup_user: specified user 'tss' unknown
	udevd[585]: lookup_group: specified group 'fuse' unknown
	udevd[585]: lookup_group: specified group 'kvm' unknown
	udevd[585]: lookup_group: specified group 'rdma' unknown
	udevd version 124 started

Signed-off-by: Petr Štetiar <ynezz@true.cz>
---
 packages/udev/udev-124/permissions.rules |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/packages/udev/udev-124/permissions.rules b/packages/udev/udev-124/permissions.rules
index 205b733..fbc9974 100644
--- a/packages/udev/udev-124/permissions.rules
+++ b/packages/udev/udev-124/permissions.rules
@@ -32,12 +32,12 @@ KERNEL=="nht[0-9]*", 				GROUP="tape"
 # SCSI devices
 KERNEL=="sr[0-9]*", IMPORT{program}="cdrom_id --export $tempnode"
 SUBSYSTEMS=="scsi", ATTRS{type}=="1",				GROUP="tape"
-SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="HP",	GROUP="scanner"
-SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="Epson",	GROUP="scanner"
-SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="EPSON",	GROUP="scanner"
+SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="HP",	GROUP="plugdev"
+SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="Epson",	GROUP="plugdev"
+SUBSYSTEMS=="scsi", ATTRS{type}=="3", ATTRS{vendor}=="EPSON",	GROUP="plugdev"
 SUBSYSTEMS=="scsi", ATTRS{type}=="4",				GROUP="cdrom"
 SUBSYSTEMS=="scsi", ATTRS{type}=="5",				GROUP="cdrom"
-SUBSYSTEMS=="scsi", ATTRS{type}=="6",				GROUP="scanner"
+SUBSYSTEMS=="scsi", ATTRS{type}=="6",				GROUP="plugdev"
 SUBSYSTEMS=="scsi", ATTRS{type}=="8",				GROUP="tape"
 
 # USB devices
@@ -86,10 +86,10 @@ KERNEL=="inotify",		MODE="0666"
 KERNEL=="sgi_fetchop",		MODE="0666"
 KERNEL=="sonypi",		MODE="0666"
 KERNEL=="agpgart",				GROUP="video"
-KERNEL=="nvram",				GROUP="nvram"
+KERNEL=="nvram",				GROUP="staff"
 KERNEL=="rtc|rtc[0-9]*",			GROUP="audio"
-KERNEL=="tpm*",			MODE="0600",	OWNER="tss", GROUP="tss"
-KERNEL=="fuse",					GROUP="fuse"
+KERNEL=="tpm*",			MODE="0600",	OWNER="root", GROUP="staff"
+KERNEL=="fuse",					GROUP="staff"
 KERNEL=="kqemu",		MODE="0666"
 KERNEL=="kvm",					GROUP="kvm"
 KERNEL=="tun",			MODE="0666",
@@ -98,9 +98,9 @@ KERNEL=="cdemu[0-9]*",				GROUP="cdrom"
 KERNEL=="pktcdvd[0-9]*",			GROUP="cdrom"
 KERNEL=="pktcdvd",		MODE="0644"
 
-KERNEL=="uverbs*",				GROUP="rdma"
-KERNEL=="ucm*",					GROUP="rdma"
-KERNEL=="rdma_ucm",				GROUP="rdma"
+KERNEL=="uverbs*",				GROUP="staff"
+KERNEL=="ucm*",					GROUP="staff"
+KERNEL=="rdma_ucm",				GROUP="staff"
 
 # printers and parallel devices
 SUBSYSTEM=="printer",				GROUP="lp"
-- 
1.5.4.3



