Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QHNxe-0000Pi-Mn for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 00:20:54 +0200
Received: from f053037176.adsl.alicedsl.de ([78.53.37.176]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QHNw8-0005nv-Rn for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 22:19:20 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304435916.13481.82.camel@mattotaupa>
References: <1304434485.13481.79.camel@mattotaupa>
	<4DC0192E.3010808@kernelconcepts.de>
	<1304435916.13481.82.camel@mattotaupa>
Date: Wed, 04 May 2011 00:18:16 +0200
Message-ID: <1304461096.22473.177.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: error in push of origin/org.openmbedded.dev
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
X-List-Received-Date: Tue, 03 May 2011 22:20:54 -0000
X-Groupsio-MsgNum: 31609
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-yKzd16tC0xA5pnJQVaBg"

--=-yKzd16tC0xA5pnJQVaBg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Florian,


Am Dienstag, den 03.05.2011, 17:18 +0200 schrieb Paul Menzel:

> Am Dienstag, den 03.05.2011, 17:03 +0200 schrieb Florian Boor:
>=20
> > Am 03.05.2011 16:54, schrieb Paul Menzel:
> > > you pushed to org.open*mb*edded.dev and therefore a new branch was
> > > created.
> >=20
> > Args - sorry my bad, I have a typo in the local branch name. Interestin=
g what
> > can happen working on a fresh tree :-)
> >=20
> > > Before you push to the correct branch could you maybe clean up the
> > > commit log using `git rebase -i =E2=80=A6` or take the improved patch=
es I
> > > attached.
> >=20
> > Ok great - many tanks. What else did you change?
>=20
> I also squashed the `ubootchart` commits. Everything else was just the
> commit messages.
>=20
> Somehow Git should be able to show the differences, but
>=20
> 	$ git diff origin/master -- origin/org.openmbedded.dev
>=20
> does not work for me.

it would have been better to first commit the new recipe `lsb-base` [2]
before using it in `ushare` [1] to preserve a working tree.


Thanks,

Paul


PS: If anyone cares, the error message for the commit for Zenity [3] is
the following.

        [=E2=80=A6]
        autoreconf: running: automake --foreign --add-missing --copy --forc=
e-missing --warnings=3Dcross
        automake: unknown warning category `cross'
        gnome-doc-utils.make:63: HAVE_GNOME_DOC_UTILS does not appear in AM=
_CONDITIONAL
        help/Makefile.am:1:   `gnome-doc-utils.make' included from here
        gnome-doc-utils.make:133: ENABLE_SK does not appear in AM_CONDITION=
AL
        help/Makefile.am:1:   `gnome-doc-utils.make' included from here
        gnome-doc-utils.make:182: ENABLE_SK does not appear in AM_CONDITION=
AL
        help/Makefile.am:1:   `gnome-doc-utils.make' included from here
        autoreconf: automake failed with exit status: 1
        + oefatal 'autoreconf execution failed.'
        + echo FATAL: 'autoreconf execution failed.'
        FATAL: autoreconf execution failed.
        + exit 1


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D0fd385e=
f5512def0db880139b1c9fa78f652f494
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D419cb68=
6b0bfe393f7c350ac881b46e8e2a14795
[3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D3539300=
2bb5aa476e281a004f7dc64aeefcb2c9e

--=-yKzd16tC0xA5pnJQVaBg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3AfygACgkQPX1aK2wOHVgSMgCdFodGNNJ37mMasm897x6AJJt5
9EAAnRxtLGNx7o87uP4f0wi77GMwNfZm
=FVGP
-----END PGP SIGNATURE-----

--=-yKzd16tC0xA5pnJQVaBg--
