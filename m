Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1Qm9kc-0008LA-D9
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 21:26:38 +0200
Received: (qmail 8584 invoked by uid 501); 27 Jul 2011 12:22:22 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.1/13367. avast: v3.2.0/110726-1. sophie:
	3.06/3.21.0/4.67. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.034044 secs); 27 Jul 2011 19:22:22 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 27 Jul 2011 12:22:22 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 28 Jul 2011 07:22:20 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B1FAA0@nzc-ap-xch-02.ap.trimblecorp.net>
In-Reply-To: <20110727141213.GA8582@cverges-dev-lnx>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Kernel load address issue
Thread-Index: AcxMZ1mrWtaINDXfR2O7LIJOJROaEQAKRWgg
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8B5@nzc-ap-xch-02.ap.trimblecorp.net><20110726220305.GA15286@jama.jama.net><F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8D9@nzc-ap-xch-02.ap.trimblecorp.net><20110726222646.GB15286@jama.jama.net><F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F8E2@nzc-ap-xch-02.ap.trimblecorp.net><F7C0AA5DD1508F4789E10B6CC9BB75DB04B1F9D5@nzc-ap-xch-02.ap.trimblecorp.net><ED3E0BCACD909541BA94A34C4A164D4C4003C1EB@post.tritech.se>
	<20110727141213.GA8582@cverges-dev-lnx>
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: Kernel load address issue
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
X-List-Received-Date: Wed, 27 Jul 2011 19:26:38 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

Many thanks for that. However I only have a uImage in my build, no =
zImage so can't do a diff to find the offset, is there another way to =
find that out?=20
Maybe you or someone else knows what script in openembedded calls the =
mkimage utility so I can find what parameters are passed ..

By the way, I set UBOOT_LOADADDRESS and UBOOT_ENTRYPOINT to be the same =
(0x80400000, a bit past u-boot and the environment) in my config file, I =
am not sure if the entry point should be the same as the load address.

Cheers,
Bernie

-------------------------------------------------------------------------=
-----------------
I want to die peacefully in my sleep, like my grandfather, not screaming =
and yelling like the passengers in his car.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of =
Chris Verges
Sent: Thursday, 28 July 2011 2:12 a.m.
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Kernel load address issue

On Wed, Jul 27, 2011 at 06:00:07AM +0000, Mats K=E4rrman wrote:
> Starting kernel ...
>=20
> And there it hangs ... I don't know who printed out the "Starting=20
> kernel" was it uboot or the kernel?  If uboot, how do I pass kernel=20
> arguments (i.e the console serial params) with this method of booting?

Hi Bernie,

I've experienced this before when the UBOOT_LOADADDRESS and =
UBOOT_ENTRYPOINT values in the machine config file for OpenEmbedded =
aren't properly set to the correct value.  You may want to double check =
those values.

Also, try setting your bootm address just a tag higher in memory than =
the actual UBOOT_ENTRYPOINT.  I forgot what the exact uboot-mkimage =
header put on the uImage is, but you can do a hex diff between the =
zImage and uImage files to figure it out.  That offset can sometimes =
cause some odd booting problems.

So if your ENTRYPOINT is 0x8300000 and the uboot-mkimage offset is 0xC0, =
for example, you'd need to bootm 0x83000C0.  (Again, double check the =
uboot-mkimage offset.)

Good luck,
Chris


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


