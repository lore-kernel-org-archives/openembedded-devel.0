Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QeiTK-0003u3-6k for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 08:54:02 +0200
Received: from f053040030.adsl.alicedsl.de ([78.53.40.30]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QeiPw-0004pi-Sh; Thu, 07 Jul 2011 06:50:33 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAD=GYpZKhaBrJFFpYUSjGft6Eu6sq88YGtNPf+gjAj1bBUCwOA@mail.gmail.com>
References: <CAD=GYpZKhaBrJFFpYUSjGft6Eu6sq88YGtNPf+gjAj1bBUCwOA@mail.gmail.com>
Date: Thu, 07 Jul 2011 08:50:11 +0200
Message-ID: <1310021411.4532.14.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: Joel Fernandes <agnel.joel@gmail.com>
Subject: Re: [PATCH] libxml: Deleted patch that is already applied in source tarball
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
X-List-Received-Date: Thu, 07 Jul 2011 06:54:02 -0000
X-Groupsio-MsgNum: 33034
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-uWUJr5b5KfhPPpxiL8OQ"

--=-uWUJr5b5KfhPPpxiL8OQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Joel,


Am Mittwoch, den 06.07.2011, 20:41 -0500 schrieb Joel A Fernandes:

> Sorry I am unable to reply to your email on libxml2 as I'm a
> digest-mode subscriber so I have started another thread. Could I be
> kept on the CC-list by replying-to-all?

I will try to remember that. By the way, you do not have to put me into
CC as I am reading the list. ;-)

> My build configuration is:
> DISTRO=3D"angstrom-2010.x"
> MACHINE=3D"beagleboard"
>=20
> git branch: org.openembedded.dev

You can use master as this name is just there for historical reasons.

> Uncompressing the sources from the downloaded archive
> libxml2-2.7.8.tar.gz shows that the patch in
> recipes/libxml/libxml2-2.7.8/0cbeb50ee03ce582a0c979c70d8fbf030e270c37.pat=
ch
> has already been applied to xpath.c

Still it is strange, that it does not complain on my end.

> Could your build configuration be pulling a different recipe?

It does not look like it.

        $ bitbake -c patch libxml2
        NOTE: Out of date cache found, rebuilding...
        [=E2=80=A6]
        Parsing recipes: 100% |#########################################| T=
ime: 00:01:29
        Parsing of 7201 .bb files complete (0 cached, 7201 parsed). 7857 ta=
rgets, 309 skipped, 0 masked, 0 errors.
       =20
        Build Configuration:
        BB_VERSION        =3D "1.12.0"
        METADATA_BRANCH   =3D "master"
        METADATA_REVISION =3D "529b445"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-gnueabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "angstrom"
        DISTRO_VERSION    =3D "v2011.07"
        TARGET_FPU        =3D "hard"
       =20
        NOTE: Resolving any missing task queue dependencies
        NOTE: Preparing runqueue
        NOTE: Executing RunQueue Tasks
        NOTE: Removing stamps: /oe/build-angstrom-next/angstrom-dev/stamps/=
armv7a-angstrom-linux-gnueabi/libxml2-2.7.8-r9.1.*
        NOTE: Running task 10 of 13 (ID: 3, /oe/openembedded/recipes/libxml=
/libxml2_2.7.8.bb, do_setscene)
        NOTE: package libxml2-2.7.8-r9.1: task do_setscene: Started
        NOTE: package libxml2-2.7.8-r9.1: task do_setscene: Succeeded
        NOTE: Running task 11 of 13 (ID: 2, /oe/openembedded/recipes/libxml=
/libxml2_2.7.8.bb, do_fetch)
        NOTE: package libxml2-2.7.8-r9.1: task do_fetch: Started
        NOTE: package libxml2-2.7.8-r9.1: task do_fetch: Succeeded
        NOTE: Running task 12 of 13 (ID: 0, /oe/openembedded/recipes/libxml=
/libxml2_2.7.8.bb, do_unpack)
        NOTE: package libxml2-2.7.8-r9.1: task do_unpack: Started
        NOTE: package libxml2-2.7.8-r9.1: task do_unpack: Succeeded
        NOTE: Running task 13 of 13 (ID: 1, /oe/openembedded/recipes/libxml=
/libxml2_2.7.8.bb, do_patch)
        NOTE: package libxml2-2.7.8-r9.1: task do_patch: Started
        NOTE: package libxml2-2.7.8-r9.1: task do_patch: Succeeded
        NOTE: Tasks Summary: Attempted 13 tasks of which 9 didn't need to b=
e rerun and 0 failed.

Here is my check.

        $ md5sum libxml2-2.7.8.tar.gz=20
        8127a65e8c3b08856093099b52599c86  libxml2-2.7.8.tar.gz
        $ tar xvf libxml2-2.7.8.tar.gz=20
        [=E2=80=A6]
        $ zless -N libxml2-2.7.8/xpath.c
           3575     } else if (cur->nodeNr =3D=3D cur->nodeMax) {
           3576         xmlNodePtr *temp;
           3577=20
           3578         cur->nodeMax *=3D 2;
           3579         temp =3D (xmlNodePtr *) xmlRealloc(cur->nodeTab, cu=
r->nodeMax *
           3580                                       sizeof(xmlNodePtr));
           3581         if (temp =3D=3D NULL) {
           3582             xmlXPathErrMemory(NULL, "growing nodeset\n");
           3583             return;
           3584         }
           3585         cur->nodeTab =3D temp;
           3586     }

Please remember that the sources are patched in the build directory
after the task patch has been executed.


Thanks,

Paul

--=-uWUJr5b5KfhPPpxiL8OQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4VVxcACgkQPX1aK2wOHVgy1QCfegb91fn8lsgPKL9He4Grb+tG
ZwcAnRvyGIqKoRfvfoqLJA6W+KK5Fs6w
=QJZZ
-----END PGP SIGNATURE-----

--=-uWUJr5b5KfhPPpxiL8OQ--
