Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tmnichols@gmail.com>) id 1PmpAX-00033A-FX
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 16:07:53 +0100
Received: by bwz10 with SMTP id 10so5789312bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Feb 2011 07:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Lv3o98Ezd0keNj03u5hyWkmJBkfh+4FLpHm17G4zf2s=;
	b=FwKeaKLfnickHNbTbes6w83vN2EymcixZy6T/MYAjZTUEUWmaxg42prgiEOp30mE04
	cFoVswT5dAPPVvlJoyuslhiChjY0rWOIktrRAg5k0Dz7z4x3cxm5zudxR/8K1eTJgDCZ
	49zL5z3EdeTcSrFneRCfxXAV86UzjV/WyilE8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pzMhF1Y8lr+g6OKQclFzbs3eFQQ+SsYtHprzzQZlvfnLRLU2siRJ9+8ksIpoVpFbP1
	f92pTaCaoIS32FCC9kMJem9RAQLGA1ccokWr9c0eZAQ/EpwMwyJKEmOMp3mi4A831R34
	WO3GNa2ECYTGBdYf4qIjvwHb0IF53Td5JZPWM=
MIME-Version: 1.0
Received: by 10.204.98.15 with SMTP id o15mr4264353bkn.14.1297177609985; Tue,
	08 Feb 2011 07:06:49 -0800 (PST)
Received: by 10.204.49.19 with HTTP; Tue, 8 Feb 2011 07:06:49 -0800 (PST)
In-Reply-To: <4D51566B.9060603@mentor.com>
References: <4D51566B.9060603@mentor.com>
Date: Tue, 8 Feb 2011 10:06:49 -0500
Message-ID: <AANLkTi=YdcSebCFohPH4BXMHHOb81vznhtkoeotvHrmi@mail.gmail.com>
From: Thom Nichols <tmnichols@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Tue, 08 Feb 2011 15:07:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'd like to see angstrom-2008.1 and angstrom-2010.x console images built for
at91sam9g20ek.

I could run these builds on 64-bit Ubuntu if necessary.  I'm not familiar
with the acceptance processes - do you just verify that the builds succeed
and images boot?


On Tue, Feb 8, 2011 at 9:42 AM, Tom Rini <tom_rini@mentor.com> wrote:

> Hey all,
>
> As March is fast approaching I want to gather the list of DISTRO / MACHINE
> / BBPKGS targets that the various distributions would like to see at least
> compile tested (volunteers for HW testing welcome!). Today, I have the
> following setup to be built:
>
> minimal / minimal-uclibc:
> qemux86/ppc/arm/mips/mips64/sh4/mipsel, mpc8315e-rdb, p2020ds, p2020rdb +
> nas-server-image/native-sdk-image/console-image/minimal-image/x11-image/meta-toolchain/qt4-x11-demo-image/qt4e-demo-image
>
> angstrom-2008.1 / angstrom-2010.x:
> hawkboard, mini2440, mini6410, beagleboard + console-image /
> qt4-x11-demo-image / qt4e-demo-image
>
> slugos / ucslug:
> nslu2be/le + slugos-image
>
> I'm building all of these for 32bit Ubuntu 8.04, RHEL5 and will be adding
> Ubuntu 10.04 for the next run.  What more do people want added? I'm looking
> to fill this matrix out to something that runs "over the weekend" and I've
> still got plenty of room to spare (which is why I've bcc'd everyone in the
> MAINTAINERS file with a Distro by their name).
>
> And of course if you wish to handle building what you care about yourself
> instead, that's great!  Please just take this as a gentle reminder that
> there's a release coming up so it's time to crank the builders up and make
> sure your stuff is working.
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

