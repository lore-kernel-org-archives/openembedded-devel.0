Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J8DFb-0001rr-0W
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Dec 2007 12:19:39 +0100
Received: by fg-out-1718.google.com with SMTP id 22so1627222fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2007 03:13:45 -0800 (PST)
Received: by 10.86.90.2 with SMTP id n2mr8821771fgb.66.1198840425901;
	Fri, 28 Dec 2007 03:13:45 -0800 (PST)
Received: from widy.lan ( [194.79.8.36])
	by mx.google.com with ESMTPS id a37sm12555291fkc.3.2007.12.28.03.13.44
	(version=SSLv3 cipher=OTHER); Fri, 28 Dec 2007 03:13:45 -0800 (PST)
Date: Fri, 28 Dec 2007 13:16:03 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1376655424.20071228131603@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	<angstrom-distro-devel@linuxtogo.org>
In-Reply-To: <E1J80sQ-0005Qr-AC@linuxtogo.org>
References: <E1J80sQ-0005Qr-AC@linuxtogo.org>
MIME-Version: 1.0
Subject: [oe-commits] org.oe.dev linux-rp-2.6.23: Add atags export patch for kexec use. Fix spitz suspend key issue. Sync kernel mirror uri tweak from poky.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Dec 2007 11:19:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

This is a forwarded message
From: rpurdie commit <openembedded-commits@lists.openembedded.org>
To: openembedded-commits@lists.openembedded.org
Date: Friday, December 28, 2007, 12:06:54 AM
Subject: [oe-commits] org.oe.dev linux-rp-2.6.23: Add atags export patch for kexec use. Fix spitz suspend key issue. Sync kernel mirror uri tweak from poky.

===8<==============Original message text===============
linux-rp-2.6.23: Add atags export patch for kexec use. Fix spitz suspend key issue. Sync kernel mirror uri tweak from poky.

[]
============================================================
--- packages/linux/linux-rp-2.6.23/defconfig-c7x0       511d465640921b0e994dbc25c4212fabf12ca150
+++ packages/linux/linux-rp-2.6.23/defconfig-c7x0       1245c4d3084a0f248fe10f90a1ef8eb1c2866f91
@@ -1395,7 +1396,7 @@ CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS=y
 # CONFIG_EXT2_FS_XATTR is not set
 # CONFIG_EXT2_FS_XIP is not set
-CONFIG_EXT3_FS=m
+# CONFIG_EXT3_FS is not set
 # CONFIG_EXT4DEV_FS is not set
 # CONFIG_REISERFS_FS is not set
 # CONFIG_JFS_FS is not set
============================================================
--- packages/linux/linux-rp-2.6.23/defconfig-collie     61e97e08b4342ff704be5b57783344f6d2834896
+++ packages/linux/linux-rp-2.6.23/defconfig-collie     9ffd9b1fadb6288179b7b23413e91d4eb9442460
[]
@@ -1459,7 +1460,7 @@ CONFIG_EXT2_FS=m
 CONFIG_EXT2_FS=m
 # CONFIG_EXT2_FS_XATTR is not set
 # CONFIG_EXT2_FS_XIP is not set
-CONFIG_EXT3_FS=m
+# CONFIG_EXT3_FS is not set
 # CONFIG_EXT4DEV_FS is not set
 # CONFIG_REISERFS_FS is not set
 # CONFIG_JFS_FS is not set


   This undos changes I did just a couple of days ago to address
http://bugs.openembedded.org/show_bug.cgi?id=2515 . Can you please
enable ext3 module for all devices in your master copies and re-push
them? While we're at it, enabling NFS support and iptables is worth
doing too. (Corresponding changes were applied to linux-handhelds-2.6
for Angstrom release too.)
 
===8<===========End of original message text===========



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



