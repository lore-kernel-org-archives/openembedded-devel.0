Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Nzr90-0002PI-0z
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 14:47:39 +0200
Received: by bwz20 with SMTP id 20so1671096bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 05:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type;
	bh=khGvU7rgGal4p/8qjM3tEStDjiFbbRIOPLtqj8Xkga4=;
	b=uU3S1+omwYzeNiROj5sQjuydE3WVDsB7DMLBby2raL6U9DzVYR/RiLcjZczUPqFfAy
	eCHHqGTGA8CJlKO2yKJZgvWOJxZvFJ2RZp3kkpXS2G4AN/bdjyvooXbjjM0rDY2PXPx7
	nd5OUAgKZ11TQGT1m4ICaHtbrZeaJ1UJYr0AE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=I2DSWpHNlfgWFli+iRQ+jhK6veSr3oNixfn8Huu1ZKMlEWxawHcSzJYbvLLtyZFSmx
	4bM52iV2LZwx5xkXiKxhERJjjP/DsfYCY3xFdVkM+6ON4IVPPSidP2rSGF53GYUfLRkK
	firuqvMZwkmljUDS8YPz0A2W42LxO2hfHYmyg=
MIME-Version: 1.0
Received: by 10.204.54.204 with HTTP; Thu, 8 Apr 2010 05:44:15 -0700 (PDT)
Date: Thu, 8 Apr 2010 14:44:15 +0200
Received: by 10.204.144.153 with SMTP id z25mr58459bku.198.1270730655127; Thu, 
	08 Apr 2010 05:44:15 -0700 (PDT)
Message-ID: <l2pfca63bcf1004080544ze5d9af0cw4c3b1ea9ea30e597@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: OE Mailinglist <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] omap3-mkcard.sh: Adding sleep and umounts to fix race cond.
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
X-List-Received-Date: Thu, 08 Apr 2010 12:47:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

* Adds sleep to wait for blocknodes in /dev
* Adds unmounts to fix possible automounts

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 contrib/angstrom/omap3-mkcard.sh |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/contrib/angstrom/omap3-mkcard.sh b/contrib/angstrom/omap3-mkcard.sh
index d8b5b43..1cf6817 100755
--- a/contrib/angstrom/omap3-mkcard.sh
+++ b/contrib/angstrom/omap3-mkcard.sh
@@ -1,5 +1,5 @@
 #! /bin/sh
-# mkcard.sh v0.4
+# mkcard.sh v0.5
 # (c) Copyright 2009 Graeme Gregory <dp@xora.org.uk>
 # Licensed under terms of GPLv2
 #
@@ -30,10 +30,14 @@ echo ,9,0x0C,*
 echo ,,,-
 } | sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE

+sleep 1
+
 if [ -b ${DRIVE}1 ]; then
+	umount ${DRIVE}1
 	mkfs.vfat -F 32 -n "boot" ${DRIVE}1
 else
 	if [ -b ${DRIVE}p1 ]; then
+		umount ${DRIVE}p1
 		mkfs.vfat -F 32 -n "boot" ${DRIVE}p1
 	else
 		echo "Cant find boot partition in /dev"
@@ -41,9 +45,11 @@ else
 fi

 if [ -b ${DRIVE}2 ]; then
+	umount ${DRIVE}2
 	mke2fs -j -L "rootfs" ${DRIVE}2
 else
 	if [ -b ${DRIVE}p2 ]; then
+		umount ${DRIVE}p2
 		mke2fs -j -L "rootfs" ${DRIVE}p2
 	else
 		echo "Cant find rootfs partition in /dev"
-- 
1.6.4.4


