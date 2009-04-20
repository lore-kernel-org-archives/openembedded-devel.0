Received: from [204.2.163.5] (helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Shane.Dixon@atmel.com>) id 1Lw0id-0002cQ-3V
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 23:07:59 +0200
Received: from csomb01.corp.atmel.com ([10.95.30.150])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id n3KL2Hm3023007
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 14:02:18 -0700 (PDT)
Received: from 10.95.105.47 ([10.95.105.47]) by csomb01.corp.atmel.com
	([10.95.30.150]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon, 20 Apr 2009 21:03:34 +0000
Received: from homestead.cso.atmel.com by csomb01.corp.atmel.com;
	20 Apr 2009 15:03:34 -0600
From: Shane Dixon <shane.dixon@atmel.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <C62896630644CE43BF64B0FF0AC27F0E036714@mail.ad.skymv.com>
References: <C62896630644CE43BF64B0FF0AC27F0E0366CD@mail.ad.skymv.com>
	<gsbug1$b8b$1@ger.gmane.org>
	<C62896630644CE43BF64B0FF0AC27F0E036714@mail.ad.skymv.com>
Organization: Atmel
Date: Mon, 20 Apr 2009 15:03:33 -0600
Message-Id: <1240261413.1220.16.camel@homestead>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: Re: Newbie: Minimal OE build
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
X-List-Received-Date: Mon, 20 Apr 2009 21:07:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Chuck,

It's whatever image you build.  There's a guide in the manual for a few
of the pre-built images:

http://docs.openembedded.org/usermanual/html/gettingoe_building_software.html#id508473

If you want an image that's pretty fat-free, I'd suggest the bootstrap
image.  That's what I base all of my stuff off of while I'm developing.
It's a console-only image.

Image recipes are found in recipes/images/

--
Shane

On Mon, 2009-04-20 at 13:38 -0700, Chuck Kamas wrote:
> Koen,
> 
> Do you mean the recipe:
> recipes/kexecboot/initramfs-kexecboot-image.bb
> 
> Chuck
> 
> 
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Koen Kooi
> Sent: Saturday, April 18, 2009 12:12 AM
> To: openembedded-devel@openembedded.org
> Subject: Re: [oe] Newbie: Minimal OE build
> 
> On 18-04-09 01:57, Chuck Kamas wrote:
> > Hi all,
> >
> > I would like to use OE to build a rootfs plus busybox and a few i2c 
> > tools and that is about it.  What Distribution should I use as my
> base?
> > Angstrom?
> 
> Yes.
> 
> > Angstrom seems to pull in lots of things that are not needed like 
> > Bluetooth.
> 
> That's not angstrom that's doing this, it's the image recipe. For
> example the kexecboot-image binary in angstrom is 80kilobytes in size
> for the armv5te architecture.
> 
> > Is there a better starting place?
> 
> No.
> 
> regards,
> 
> Koen
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Shane Dixon
Linux Engineer
Atmel Corporation
E-mail: shane.dixon@atmel.com


