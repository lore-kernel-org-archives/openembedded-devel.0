Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1QmGGt-0007ro-JS
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 04:24:23 +0200
Received: (qmail 19230 invoked by uid 501); 27 Jul 2011 19:20:06 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.1/13367. avast: v3.2.0/110726-1. sophie:
	3.06/3.21.0/4.67. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.031326 secs); 28 Jul 2011 02:20:06 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 27 Jul 2011 19:20:06 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 28 Jul 2011 14:20:04 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7A25E@nzc-ap-xch-02.ap.trimblecorp.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Kernel boot problems
Thread-Index: AcxMzNy/L32rsx8hRHyk2BQ2+K7EBw==
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Kernel boot problems
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
X-List-Received-Date: Thu, 28 Jul 2011 02:24:24 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi Guys,

I have got a bit further with my efforts to boot linux on an imx31 based
platform using u-boot.

My console output is now:

----------------------------------------------------------------
uboot> bootm 80100000
## Booting kernel from Legacy Image at 80100000 ...
   Image Name:   Angstrom/2.6.36/mx31ads
   Created:      2011-07-28   2:03:27 UTC
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1586172 Bytes =3D 1.5 MiB
   Load Address: 8f000000
   Entry Point:  8f000000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
-------------------------------------------------------------------

So it seems to be getting to the 1st part of the kernel boot process,
then hangs (I presume the last line comes from kernel code.)
I don't know if the kernel is hanging, or if I don't have any more
serial out ....
I am passing "console=3Dttymxc0,115200" to the kernel ..
Can someone confirm:
A) If I have the correct Entry point, or does this need to be offset
into the kernel? ..
B) Is the serial console parameters correct?
C) What is the correct way to set up the memory map? (my ram starts at
0x80000000, ends at 0x8fffffff)
D) Is there a way to debug initial kernel stuff with serial output?
In the above, I have decompressed the kernel to the top of the 256M ram,
but have only advertised 120M via the bootloader   ... for now, not
knowing what is correct and not wanting the kernel
to stomp all over itself running in ram.

Many Thanks,
Bernie





