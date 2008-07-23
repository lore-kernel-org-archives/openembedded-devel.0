Received: from [217.154.246.189] (helo=lon-gs4dmrelay.mistral.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bluelightning@bluelightning.org>) id 1KLo5O-0006qb-MV
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jul 2008 01:49:34 +0200
Received: from [212.32.109.80] (helo=shodan.local)
	by lon-gs4dmrelay.mistral.net with esmtp (Exim 4.51)
	id 1KLnnd-0001bt-UF for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jul 2008 00:31:14 +0100
To: openembedded-devel@lists.openembedded.org
From: Paul Eggleton <bluelightning@bluelightning.org>
Date: Thu, 24 Jul 2008 00:48:20 +0100
MIME-Version: 1.0
Message-Id: <200807240048.20980.bluelightning@bluelightning.org>
Subject: PATCH: make h2200-bootloader load & depend on mtdblock
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 23 Jul 2008 23:49:34 -0000
X-Groupsio-MsgNum: 5582
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_EN8hIOy2xNi+9zb"

--Boundary-00=_EN8hIOy2xNi+9zb
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi there,

The attached patch fixes bug 4451 by making h2200-bootloader depend on 
kernel-module-mtdblock and load the mtdblock module before attempting to use 
it.

http://bugs.openembedded.net/show_bug.cgi?id=4451

Does this look OK?

Cheers,
Paul

--Boundary-00=_EN8hIOy2xNi+9zb
Content-Type: text/x-diff;
  charset="utf-8";
  name="h2200-suspend-dev.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="h2200-suspend-dev.patch"

#
# old_revision [87bf384fc6b31f73e5ad8bbd29b113adcc5cd9e0]
#
# patch "packages/h2200-bootloader/h2200-bootloader.bb"
#  from [d015a17dbeb17e4fef0f6d6df88a9ca9620cc88f]
#    to [80838c3d05408a49597b6fad5a441fecf5af0af7]
#
============================================================
--- packages/h2200-bootloader/h2200-bootloader.bb	d015a17dbeb17e4fef0f6d6df88a9ca9620cc88f
+++ packages/h2200-bootloader/h2200-bootloader.bb	80838c3d05408a49597b6fad5a441fecf5af0af7
@@ -1,6 +1,7 @@ DESCRIPTION = "Bootloader firmware extra
 DESCRIPTION = "Bootloader firmware extractor for the h2200 iPAQ"
+RDEPENDS = kernel-module-mtdblock
 ALLOW_EMPTY = "1"
-PR="r2"
+PR="r3"
 
 COMPATIBLE_MACHINE = "h2200"
 #it is a shell script, but lets protect the innocent some more
@@ -9,5 +10,6 @@ mkdir -p /lib/firmware
 pkg_postinst() {
 #!/bin/sh
 mkdir -p /lib/firmware
+modprobe mtdblock
 dd if=/dev/mtdblock0 of=/lib/firmware/h2200_bootloader.bin 2>/dev/null
 }

--Boundary-00=_EN8hIOy2xNi+9zb--
