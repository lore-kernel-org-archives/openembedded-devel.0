Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1Qrc7A-0002eI-Uy
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Aug 2011 22:44:29 +0200
Received: (qmail 17196 invoked by uid 501); 11 Aug 2011 13:39:55 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.2/13427. avast: v3.2.0/110810-1. sophie:
	3.06/3.22.0/4.68. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.012054 secs); 11 Aug 2011 20:39:55 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 11 Aug 2011 13:39:54 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 12 Aug 2011 08:39:53 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04BCA295@nzc-ap-xch-02.ap.trimblecorp.net>
In-Reply-To: <201108111425.15678.manningc2@actrix.gen.nz>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Startx? Where is it?
Thread-Index: AcxXzgU2oGpSxZ5/RMqRakThXYqcmwAl98bg
References: <201108111425.15678.manningc2@actrix.gen.nz>
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: "Charles Manning" <manningc2@actrix.gen.nz>,
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Startx? Where is it?
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
X-List-Received-Date: Thu, 11 Aug 2011 20:44:29 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Charles,

I don't seem to have a /dev/fb0, even though I cave compiled in MXC
framebuffer support and framebuffer console .... So no penguin just yet.
Had a good look though the config options and turned on everything that
seemd to be relevent ... But no joy.

I don't have an xinit program or /usr/bin/Xfbdev ..

By the way, I have a few kernel modules in my root filesystem (not to do
with the framebuffer, built that as static) but tried a modprobe on
the box to try and load a module, but it complained about not finding it
.. Also lsmod shows no modules loaded by automagically by udev ..

Cheers,
Bernie
=20


------------------------------------------------------------------------
------------------


-----Original Message-----
From: Charles Manning [mailto:manningc2@actrix.gen.nz]=20
Sent: Thursday, 11 August 2011 2:25 p.m.
To: openembedded-devel@lists.openembedded.org
Cc: Bernard Mentink
Subject: Re: [oe] Startx? Where is it?

On Thursday 11 August 2011 12:36:16 Bernard Mentink wrote:
> Hi All,
>
> I have finally got a booting console image (Angstrom) logged in via=20
> SSH and now want to try and get X working.

Good going Bernie!

>
> I have built the Angstom-x11-image and have unpacked it into my NFS=20
> root ... but the problem is I see no startx command. How do you start=20
> X in this distro?
>
> I have also built frame-buffer support into my kernel, can someone=20
> tell me how to test that ..

xinit

eg.=20

xinit /usr/bin/xmessage "Hello Bernie"   --   /usr/bin/Xfbdev



