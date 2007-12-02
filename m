Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1Iytsc-0003lF-VQ
	for openembedded-devel@openembedded.org; Sun, 02 Dec 2007 19:49:27 +0100
Received: (qmail 20317 invoked by uid 813007); 2 Dec 2007 18:46:03 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 2 Dec 2007 18:46:03 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 2 Dec 2007 19:45:56 +0100
User-Agent: KMail/1.9.7
References: <475207FB.8020405@whitby.id.au> <475269FD.60409@student.utwente.nl>
	<1196595074.6648.11.camel@localhost.localdomain>
In-Reply-To: <1196595074.6648.11.camel@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <200712021945.57464.openembedded@haerwu.biz>
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Re: [Angstrom-devel] RFC: Add ipkg to minimal image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Dec 2007 18:49:27 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 2 grudnia 2007, Richard Purdie napisa=C5=82:
> On Sun, 2007-12-02 at 09:17 +0100, Koen Kooi wrote:
> > Rod Whitby schreef:

> > > RFC #1:
> > >> Is there a reason why minimal-image does not include ipkg?  What
> > >> exactly is the definition of what should be in minimal-image which
> > >> excludes the ability to install further packages?
> >
> > Marcin and I had a discussion about that, but I can't remember the
> > outcome. So "I have no strong opinions on that".
>
> I think minimal was really intended for people trying to boot systems
> for the first time and really is 'the bare essentials to boot'. Having
> said that I appreciate the problem of creating an image cut down enough
> for the NSLU2.

minimal-image was meant as something really small which can be used to=20
just boot device into something usable. For different machines 'usable'=20
has different meaning and this should be covered by task-boot or=20
MACHINE_ESSENTIAL_ variables.=20

Zaurus palmtops are usable with just busybox + keymaps, for devboards it=20
usually mean busybox (getty on serial port is automatically started), for=20
nslu2 it means Ethernet + ssh/telnet daemon.

I see no problem with creating 'minimal-with-ipkg' image under better=20
name. Let 'minimal-image' be really minimal - example usage is devboard=20
with problems with NAND accessing and MMC card - all what is available is=20
u-boot with ethernet so booting over tftp with kernel and initrd (or=20
kernel with initramfs) makes it working.

> Ideally, MACHINE=3Dnslu2 should make the console image become small
> enough to be usable for the device even if that different compared to
> the minimal image is just the package manager due to size
> constraints...

NSLU2 is example of device which can do really many things but rootfs=20
space is limited. When it comes to =C3=85ngstr=C3=B6m defaults it means bt,=
 wifi,=20
usb host so 'task-base' starts to depend on too many stuff to be usable=20
with internal flash. This device really needs special image for internal=20
rootfs space.

> On a related but different note, the presence of a package manager or
> not sounds like an DISTRO_FEATURE. Perhaps we should add
> "package-manager" as a DISTRO_FEATURE and then use this to decide
> whether a package manager should be installed into an image. The
> package manager to install should determined by the class building the
> image so you end up with a package manager appropriate to the image -
> ipkg or dpkg+apt currently.

This sounds good - no use for package manager on systems which are=20
upgraded only by reflashing (due to many reasons).

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

           Q:      What's a light-year?
           A:      One-third less calories than a regular year.




