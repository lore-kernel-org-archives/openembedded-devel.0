Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NpI0b-0008GK-TB for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 10:15:23 +0100
Received: from f053034230.adsl.alicedsl.de ([78.53.34.230]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NpHxl-0003Ju-2B for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 09:12:21 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <13c1beb11003100010l6d97c26bs51faaa0dfa74d118@mail.gmail.com>
References: <13c1beb11002250321g6099bc44oebd182fa8c4f8d1c@mail.gmail.com>
	<13c1beb11003100010l6d97c26bs51faaa0dfa74d118@mail.gmail.com>
Date: Wed, 10 Mar 2010 10:12:14 +0100
Message-ID: <1268212334.3843.28.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][mtd-utils][how to] Numonyx chip support
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
X-List-Received-Date: Wed, 10 Mar 2010 09:15:23 -0000
X-Groupsio-MsgNum: 17450
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Xtp8erQJkuHk6kXkVx80"

--=-Xtp8erQJkuHk6kXkVx80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Michal,


please do not top post.


Am Mittwoch, den 10.03.2010, 09:10 +0100 schrieb Michal Stawinski:
> 2010/2/25 Micha=C5=82 Stawinski <nazgee@gmail.com>
> > I am a newb in working with open projects, so please take it easy if I'=
ll
> > do something wrong.
>
> Can anyone help me on this, please?

Welcome! And sorry that nobody responded earlier to you. Next time this
happens I suggest, you join the IRC channel and contact the developers
directly.

> > Below (and in the attachment) is "git format-patch" output.
> > It introduces support for Numonyx memories, that have oobsize=3D64 and
> > pagesize=3D4096, that are used e.g. in OMAP3, igep0020b machine.
> >
> > Solution is very straightforward, though you'll probably reject my patc=
h,
> > as diff contains full path to files that i altered (not relative to
> > mtd-utils). I hope however, that you can tell me how to generate patche=
s for
> > sepcific packages correctly, so it won't contain whole path (e.g.
> > a/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1=
-r0/git/nanddump.c)
> >
> > That is how I've done it:
> > - "git pull"      //to update oe dev branch
> > - bitbake mtd-utils      //to get *.c files refreshed
> > - git checkout -b mtd_utils      //to create my new development branch
> > - git add build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-uti=
ls-1.3.1-r0/git/nanddump.c
> > //to add files I am going to alter
> > - git commit     //to create a starting point for my development
> > - :::editing=3D>compiling=3D>testing:::
> > - git commit     //to check in changes I've made
> > - git format-patch HEAD^     //to create patch from changes I've made
> >
> > What am I doing wrong? Sources of packages like mitd-utils are not adde=
d to
> > .git repository in OE tree,

That is correct. OE does not distribute the sources but just the magic
(recipes) on how to get the sources and install them correctly.
Therefore you should not have your build directory in the OE tree.

> > and when I add it manually to it (as above), and
> > then create patch, whole path relative to OR root is generated, which m=
akes
> > my patch useles to other builds than the one I did (IGEPv2).
> >
> > I really'd like to contribute, but I can't find any how-to realted to *=
.c
> > sources editing (*.bb editing is straightforward, as these files are al=
ready
> > in oe git tree).

As you figured out, you have to patch the source. BitBake provides a way
to apply patches to the source. Unfortunately [2] is down right now, but
I try to give different references.

First you find a lot of information in the OE user manual [3]. The
source files for the manual are also in the Git repository [4].

        $ ls recipes/mtd/mtd-utils/
        add-exclusion-to-mkfs-jffs2-git-2.patch  lzo_1x-git.patch
        add-exclusion-to-mkfs-jffs2-git.patch    lzo_1x.patch
        fix-ignoreerrors-git.patch
        $ $ more recipes/mtd/mtd-utils_1.3.1.bb=20
        require mtd-utils.inc
       =20
        DEPENDS +=3D "e2fsprogs-libs"
       =20
        PARALLEL_MAKE =3D ""
        ARM_INSTRUCTION_SET =3D "arm"
       =20
        # This is the default package, thus we lock to a specific git versi=
on so=20
        # upstream changes will not break builds.
       =20
        TAG =3D "v${PV}"
       =20
        SRC_URI =3D "git://git.infradead.org/mtd-utils.git;protocol=3Dgit;t=
ag=3D${TAG} \
        	   file://add-exclusion-to-mkfs-jffs2-git-2.patch;patch=3D1 \
        	   file://fix-ignoreerrors-git.patch;patch=3D1 \
        	   file://lzo_1x-git.patch;patch=3D1"
        [=E2=80=A6]

So in `SRC_URI` you see the `file://=E2=80=A6` lines. That is how patches g=
et
applied in OE.

So I suggest

1. you to create the patch for mtd-utils in its source directory (get
the source, for example [5] in a seperate directory outside the OE tree,
adapt it and create a patch).
2. Copy the patch to `recipes/mtd/mtd-utils/`.
3. Add a file line to SRC_URI.
4. If this works, add the patch to the OE Git tree (`git add =E2=80=A6`) an=
d
proceed as you did before.

[=E2=80=A6]

> Maybe it is wrong mailing-list- should I be writing somewhere else?

It would be really nice to get your patch included upstream, so that
patches are not needed in the future [6]. So please also send it to
upstream MTD [1][7].


Thanks,

Paul


[1] http://www.linux-mtd.infradead.org/
[2] http://www.openembedded.org
[3] http://docs.openembedded.org/usermanual/html/recipes_syntax.html
[4] docs/usermanual/chapters/recipes.xml
[5] git clone git://git.infradead.org/mtd-utils.git
[6] http://wiki.openembedded.net/index.php/Push_patches_upstream
[7] http://www.linux-mtd.infradead.org/mail.html

--=-Xtp8erQJkuHk6kXkVx80
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkuXYmgACgkQPX1aK2wOHVj0pgCfQ0SWVDUl8Hpri/hph8MgyS4P
sCoAnAugAFTW/y1LHL7O0nsyWvT7Q17K
=kWJA
-----END PGP SIGNATURE-----

--=-Xtp8erQJkuHk6kXkVx80--
