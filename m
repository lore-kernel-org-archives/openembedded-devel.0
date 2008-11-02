Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Kwact-0006jb-0f
	for openembedded-devel@openembedded.org; Sun, 02 Nov 2008 11:56:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id C26FF140533B;
	Sun,  2 Nov 2008 11:54:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1vDSldZ3Jbx; Sun,  2 Nov 2008 11:54:06 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id 528BB1416BA2;
	Sun,  2 Nov 2008 11:54:01 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: Carsten Haitzler <raster@rasterman.com>
In-Reply-To: <20081102100819.ebdb2ce9.raster@rasterman.com>
References: <20081031110045.7EF89189333@amethyst.openembedded.net>
	<20081031233753.43f5f09d.raster@rasterman.com>
	<gef9q7$o65$1@ger.gmane.org>
	<20081101085334.8afcd730.raster@rasterman.com>
	<geh3kt$bp7$1@ger.gmane.org> <1225539496.4090.6.camel@utx.utx.cz>
	<20081102100819.ebdb2ce9.raster@rasterman.com>
Date: Sun, 02 Nov 2008 11:52:54 +0100
Message-Id: <1225623174.3749.24.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Cc: openembedded-devel@openembedded.org, Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [oe-commits] Koen Kooi : initscripts: only run ldconfig	on boot when ld.so. conf is present
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
X-List-Received-Date: Sun, 02 Nov 2008 10:56:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Carsten Haitzler wrote:
> On Sat, 01 Nov 2008 12:38:16 +0100 Stanislav Brabec <utx@penguin.cz> ba=
bbled:
>=20
> > Koen Kooi wrote:
> >=20
> > > I don't have a strong opinion on that :) People more knowledgable a=
bout=20
> > > ldconfig should chip in on this topic.
> >=20
> > And what about something like:
> > if ..../ld.so.cache -ot /usr/lib -o /etc/ld.so.cache -ot /lib ; then
> >     /sbin/ldconfig
> > fi
>=20
> you'd need to include all dirs in ld.so.conf in addition...

Yes.

> also doesn't cover
> me overwriting existing .so's in the lib dir with new ones. :)

Overwriting of existing .so is an extremely risky operation and I guess
that=EF=BB=BF install command nor any packaging system do it. To safely
replace .so file, you have to unlink existing instance and use a
different inode for the new instance. This operation updates directory
mtime.

> run ldconfig.

I agree with the rest. Ldconfig should be called whenever any package is
installed.

> at some point when oe was building images, it was unable to run ldconfi=
g using
> qemu natively within the rootfs before converting to a file system imag=
e (ext2,
> jffs2, or tar etc.) and thus as a workaround to not being able to do th=
is, it
> was run on boot to populate ld.so.cache. it's possible to do this now v=
ia qemu
> before packaging up the rootfs.

It's not generally true. Some platforms have no support in qemu, some
platforms are broken in qemu and commands fail there. The command
proposed above may be a work-around for this case.

I can imagine one-time script for this purpose. Platform has no working
qemu support =3D> packaging scripts will place one-time commands
somewhere.

Being inspired by DejaGnu, I can also imagine a native host as an
alternative solution for platforms without qemu support.

- Build (minimal) environment not needing any native run and being able
  to run on target.
- Mount a target root as a chroot on native host via a NFS.
- Using a ssh and chroot command, execute required code and get result
  back.

=EF=BB=BF(Well, it would complicate life to Koen a bit.)

It could perform any task=EF=BB=BF not possible on build system:
- run ldconfig
- generate locales (may need swap on native host)
- compile emacs macros
...


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



