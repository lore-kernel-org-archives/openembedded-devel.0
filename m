Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1QlpbN-0007ly-Le
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 23:55:46 +0200
Received: (qmail 26056 invoked by uid 501); 26 Jul 2011 14:51:31 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.1/13361. avast: v3.2.0/110725-1. sophie:
	3.06/3.21.0/4.67. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.030896 secs); 26 Jul 2011 21:51:31 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 26 Jul 2011 14:51:31 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 27 Jul 2011 09:51:28 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8B5@nzc-ap-xch-02.ap.trimblecorp.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Kernel load address issue
Thread-Index: AcxL3ixhju5iEE6KQd227paPZ9oLdQ==
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Kernel load address issue
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
X-List-Received-Date: Tue, 26 Jul 2011 21:55:46 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi Guys,

I am new to OE, but have managed to get u-boot working on my target, got
TFTP working so I can transfer a kernel to RAM.
I have modified my conf/local.conf file so that when a kernel is built a
uImage binary is created that u-boot can use. (added line
KERNEL_IMAGETYPE =3D "uImage")

However When I try to boot the image in the bootloader, I get this:

uboot> bootm 0x80300000
## Booting kernel from Legacy Image at 80300000 ...
   Image Name:   Angstrom/2.6.36/mx31ads
   Created:      2011-07-26  19:55:31 UTC
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1765856 Bytes =3D 1.7 MiB
   Load Address: 20008000
   Entry Point:  20008000
   Verifying Checksum ... OK
   Loading Kernel Image ...   <-- gets stuck here! ...

The Load Address is wrong, my ram starts at 0x80000000 ... can someone
tell me how to change this? I presume mkimage is responsible for this as
the kernel is configured as relocatable ..

Many Thanks,
Bernie






