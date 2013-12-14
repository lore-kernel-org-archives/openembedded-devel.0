Return-Path: <visgupta07@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 20F096E3DC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2013 07:17:45 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id hz1so489554pad.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 23:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=8R/rAUM2jTH6p3guAVxC3pUJlBw8TPyN10iTo/mvRWE=;
	b=PUz18XueOmIdl3PUq0pWElbGclERsGhNbSSjL8iCV0V/n44cZVKxpImgur/5B/vUgl
	dOxKPJ0fQm99ptHV/AsdJk6qDfiCl6aEMUEQ/btvq84CvuaQnGNyYHmH9ETPPoPo2Y5u
	CrXfIZqhLoq/16U/VBXQuv5MX9g6iErzczHDutRWjEk4vftMWdLSQ+0uy77DyT9IIaJz
	oWL5/caHfFIZ1tSBgz/WDFS+cE4XiBVSnL52ZA9CIDKlnx9htI2WgDkZ5SCFOXfIPNWb
	3l1z9NAFhaAd5969yGnypbTMIUg0tVrWH9YXxM/8IFIz3NSwJtNZ2M+h+VRfgfX02lj6
	N6Dg==
MIME-Version: 1.0
X-Received: by 10.68.130.130 with SMTP id oe2mr7882347pbb.135.1387005463788;
	Fri, 13 Dec 2013 23:17:43 -0800 (PST)
Received: by 10.67.14.169 with HTTP; Fri, 13 Dec 2013 23:17:43 -0800 (PST)
Date: Sat, 14 Dec 2013 12:47:43 +0530
Message-ID: <CAMGfQQrxmk9seHii6OH0bDXWpZgJD_zHnkfn6S_fbnm-TXG8uw@mail.gmail.com>
From: vishal gupta <visgupta07@gmail.com>
To: koen@dominion.thruhere.net
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Compiling the kernel source from Angstrom distribution & building an OS console-image.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Dec 2013 07:17:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thank you Koen for the reply.

I made the local changes so that i can include some features in my kernel.
The features are:
1.The camera driver mt9t112 for LI-LBCM3M1 from leopard imaging.
2.The camera driver mt9v113 for LI-LBCMVGA from leopard imaging.

As per a small test carried out by me i found that both the above camera
modules work fine with the pre-build image with Kernel  Version 2.6.32 from
Narccissus Image Builder.

So i downloaded the source of this Narccissus image from Angstrom
Distribution (https://github.com/Angstrom-distribution/meta-angstrom) and i
went for making the below listed local changes to change the default kernel
version which is 3.2.28 to the kernel version 2.6.32.

In the beagleboard.conf file present in the meta-ti layer i made the
following changes.
""
#PREFERRED_PROVIDER_virtual/kernel = "linux-mainline"
PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"

""

& adding an smc.patch to resolve  another error which i got when i compiled
above changed ,below is the error what i got.
""
/tmp/ccWRvvsG.s:309: Error: selected processor does not support ARM mode
`smc #0'
""

This error was resolved as i added the smc.patch.

But encountered with the error when command "MACHINE=beagleboard bitbake
console-image" is run  i got the error as presented in previous mail and
below again :
"
cp: cannot stat `include/generated/bounds.h': No such file or directory
ERROR: Function failed: do_compileconfigs (see
/home/vishal/oe-nad/setup-scripts/build/tmp-angstrom_v2012_12-eglibc/work/beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r122c+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155/temp/log.do_compileconfigs.22554
for further information)
"

Now I hope you have more information...!!
Sorry that i was not clear in explanation in my previous mail.

Please guide me to debug this "Function failed: do_compileconfigs" issue..

Vishal

