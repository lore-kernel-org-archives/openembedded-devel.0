Received: from mail.opencsw.org ([82.220.5.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <attila@kinali.ch>) id 1RCB4N-0000Wi-E6
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 16:06:35 +0200
Received: from chise.local.aotag.ch (gs84.art-of-technology.ch
	[212.126.160.84])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.opencsw.org (Postfix) with ESMTPSA id A979AE5B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2011 15:53:55 +0200 (CEST)
Date: Fri, 7 Oct 2011 15:53:55 +0200
From: Attila Kinali <attila@kinali.ch>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20111007155355.b7dbb67d.attila@kinali.ch>
Organization: GEHIRN
X-Mailer: Sylpheed 3.1.0 (GTK+ 2.24.4; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: use of kpartx in contrib/angstrom/omap3-mkcard.sh is suboptimal
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
X-List-Received-Date: Fri, 07 Oct 2011 14:06:36 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Moin

the script contrib/angstrom/omap3-mkcard.sh uses kpartx to create the
device files for the partitions just created, if kpartx is available.
Unfortunately, kpartx does not work here as intended, it binds the
device files in a way that prevents the script from running properly
(mkfs fails due to the "partition in use" check, as kpartx makes
the kernel to keep them in use). As most systems do not have
kpartx installed, this bug isn't triggered for most people.
(kpartx is only needed if you want to create "partiton device files"
for block devices that are not usually partitioned, like lvm volumes or
disk images)

The right thing to do would be to use sfdisk to reload the partition
table and let udev handle the rest. (Actually this isn't really necessary,
as sfdisk reloads the partition table anyways after writing the changes)


--- omap3-mkcard.sh.orig        2011-10-07 15:52:57.000000000 +0200
+++ omap3-mkcard.sh     2011-10-07 15:29:49.000000000 +0200
@@ -33,9 +33,10 @@
 sleep 1
 
 
-if [ -x `which kpartx` ]; then
-       kpartx -a ${DRIVE}
-fi
+#if [ -x `which kpartx` ]; then
+#      kpartx -a ${DRIVE}
+#fi
+sfdisk -R $DRIVE
 
 # handle various device names.
 # note something like fdisk -l /dev/loop0 | egrep -E '^/dev' | cut -d' ' -f1 


			Attila Kinali

-- 
The trouble with you, Shev, is you don't say anything until you've saved
up a whole truckload of damned heavy brick arguments and then you dump
them all out and never look at the bleeding body mangled beneath the heap
		-- Tirin, The Dispossessed, U. Le Guin


