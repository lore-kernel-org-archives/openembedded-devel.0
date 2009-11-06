Received: from [82.208.49.253] (helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1N6PUG-0004D7-BH
	for openembedded-devel@openembedded.org; Fri, 06 Nov 2009 15:08:27 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 76DA91D36078; Fri,  6 Nov 2009 15:07:09 +0100 (CET)
Date: Fri, 6 Nov 2009 15:07:09 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Message-ID: <20091106140709.GB25214@ibawizard.net>
References: <1257504486-7975-1-git-send-email-ynezz@true.cz>
	<be7a9f3d0911060409u60dbf7ecg8b174c3b55441188@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <be7a9f3d0911060409u60dbf7ecg8b174c3b55441188@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH][geodegx] geodegx: Linux 2.6.31.4
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
X-List-Received-Date: Fri, 06 Nov 2009 14:08:27 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Otavio Salvador <otavio@ossystems.com.br> [2009-11-06 10:09:29]:

> NACK!
>=20
> On Fri, Nov 6, 2009 at 8:48 AM, Petr =A9tetiar <ynezz@true.cz> wrote:
> >
> > Signed-off-by: Petr =A9tetiar <ynezz@true.cz>
> >
> > diff --git a/conf/checksums.ini b/conf/checksums.ini
> > index 808cc11..225a6f8 100644
> > --- a/conf/checksums.ini
> > +++ b/conf/checksums.ini
> > @@ -16954,6 +16954,10 @@ sha256=3Dd7b9f19b92fd5c693c16cd62f441d051b69=
9f28ec6a175d1b464e58bacd8c78f
> > =A0md5=3D84c077a37684e4cbfa67b18154390d8a
> > =A0sha256=3D0acd83f7b85db7ee18c2b0b7505e1ba6fd722c36f49a8870a831c8516=
60e3512
> >
> > +[http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.31.4.tar.bz2]
> > +md5=3Dae7fde9fd0ae0d8ac12a1e1536d6d3ce
> > +sha256=3De63041db1ef666ca43293762c8aaec27bd4b54b6d86aee68ebb090c1b66=
584f4
> > +
> > =A0[http://kernel.org//pub/linux/kernel/v2.6/linux-2.6.9.tar.bz2]
> > =A0md5=3De921200f074ca97184e150ef5a4af825
> > =A0sha256=3Df5dba6366e87e91234d1b0069cfea655b0a4cb37ea97f899226f16998=
e6ab9f1
> > diff --git a/conf/machine/geodegx.conf b/conf/machine/geodegx.conf
> > index 0ec6782..6350f2d 100644
> > --- a/conf/machine/geodegx.conf
> > +++ b/conf/machine/geodegx.conf
> > @@ -6,8 +6,10 @@ TARGET_ARCH =3D =A0"i486"
> >
> > =A0require conf/machine/include/tune-geode.inc
> >
> > -PREFERRED_PROVIDER_virtual/kernel =3D "linux-geodegx"
> > -BOOTSTRAP_EXTRA_RDEPENDS =3D "kernel pciutils udev kernel-modules"
> > +PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> > +MACHINE_EXTRA_RDEPENDS =3D "kernel grub"
> > +MACHINE_FEATURES =3D "kernel26 pci ext2 x86"
> > +MACHINE_KERNEL_VERSION =3D "2.6"
>=20
> You don't need to rdepends on the kernel and bootloader. In my case
> for example, I use a initrd and don't need to have the kernel in the
> image of rootfs; another issue, I use syslinux.

Ok. I'll make my custom machine file.

> Besides, machine changes are another commit; please use one commit for
> kernel recipe and other to the machine changes.

True, I'm sorry, it's my local modification. Would you revert/fix it in .=
dev, or
should I provide patch? Thanks.

-- ynezz


