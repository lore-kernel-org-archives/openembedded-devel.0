Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MXrfU-0000It-25
	for openembedded-devel@openembedded.org; Mon, 03 Aug 2009 09:09:12 +0200
Received: (qmail 26145 invoked by uid 813007); 3 Aug 2009 06:53:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 3 Aug 2009 06:53:47 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 3 Aug 2009 08:54:13 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4-00009-g83a3792-dirty; KDE/4.2.96;
	x86_64; ; )
References: <4A6FD077.1060001@gmail.com>
	<200907311524.44818.marcin@juszkiewicz.com.pl>
	<6ec4247d0908010245y69aa6830n36f9ceca0e9211ff@mail.gmail.com>
In-Reply-To: <6ec4247d0908010245y69aa6830n36f9ceca0e9211ff@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200908030854.14145.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH] remove duplicated code from linux.inc
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
X-List-Received-Date: Mon, 03 Aug 2009 07:09:12 -0000
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 1 sierpnia 2009 o 11:45:12 Graham Gower napisa=B3(a):
> 2009/7/31 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:

> > For AT91SAM9263-EK we get:
> >
> > 15:10 hrw@home:linux-2.6.30$ arm-angstrom-linux-gnueabi-nm
> > vmlinux|grep stext
> > c0008000 T _stext
> > c0008000 T stext
> >
> > But when I boot this device I have:
> >
> > ## Booting kernel from Legacy Image at 22200000 ...
> >   Image Name:   Angstrom/2.6.30/at91sam9263ek
> >   Image Type:   ARM Linux Kernel Image (uncompressed)
> >   Data Size:    2074384 Bytes =3D  2 MB
> >   Load Address: 20008000
> >   Entry Point:  20008000
> >   Verifying Checksum ... OK
> >   Loading Kernel Image ... OK
> >
> > So entry point is different.
>
> Yes, the linux kernel links to a virtual address. If u-boot leaves
> the MMU disabled on your platform then you will need to use a
> physical address. I haven't checked u-boot to see if this is common
> or not.

> Does the resulting uImage with entry point c0008000 boot for you?

## Booting kernel from Legacy Image at 22200000 ...
   Image Name:   Angstrom/2.6.30/at91sam9263ek
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2074380 Bytes =3D  2 MB
   Load Address: 20008000
   Entry Point:  c0008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

And HANG...

Then I changed kernel.bbclass so LoadAddress =3D=3D EntryPoint and that=20
hangs at loading kernel (which was expected). So it looks like that=20
patch is not so safe to use...

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




