Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QHb8q-0002L6-GR for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 14:25:20 +0200
Received: from f053033156.adsl.alicedsl.de ([78.53.33.156]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QHb7L-0002nA-HX for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 12:23:47 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304435916.13481.82.camel@mattotaupa>
References: <1304434485.13481.79.camel@mattotaupa>
	<4DC0192E.3010808@kernelconcepts.de>
	<1304435916.13481.82.camel@mattotaupa>
Date: Wed, 04 May 2011 14:22:42 +0200
Message-ID: <1304511762.20079.4.camel@mattotaupa>
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
X-List-Received-Date: Wed, 04 May 2011 12:25:20 -0000
X-Groupsio-MsgNum: 31612
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-hxfOgxi24AgHZMRnYp4c"

--=-hxfOgxi24AgHZMRnYp4c
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

[=E2=80=A6]

task fetch of `lsb-base` fails

        [=E2=80=A6]
        NOTE: package lsb-base-3.2-r0: task do_fetch: Started
        --2011-05-04 13:26:04--  http://ftp.de.debian.org/debian/pool/main/=
l/lsb/lsb_3.2-23.tar.gz
         Resolving ftp.de.debian.org... 141.76.2.4
         Connecting to ftp.de.debian.org|141.76.2.4|:80... connected.
         HTTP request sent, awaiting response... 404 Not Found
         2011-05-04 13:26:05 ERROR 404: Not Found.
        [=E2=80=A6]

and task patch of proftpd fails too.

        NOTE: package proftpd-1.3.3c-r0: task do_patch: Started
        ERROR: Execution of 'quilt --quiltrc=3D/oe/build-angstrom-next/angs=
trom-dev/sysroots/i686-linux/usr/bin/quiltrc push' failed with exit code 1:
        Applying patch proftpd-install-nostrip.patch
        patching file Make.rules.in
        Hunk #1 FAILED at 28.
        1 out of 1 hunk FAILED -- rejects in file Make.rules.in
        Patch proftpd-install-nostrip.patch can be reverse-applied
       =20
        NOTE: package proftpd-1.3.3c-r0: task patch_do_patch: Failed
        ERROR: Function 'patch_do_patch' failed
        ERROR: Task 1 (/oe/openembedded/recipes/proftpd/proftpd_1.3.3c.bb, =
do_patch) failed with exit code '1'
        ERROR: '/oe/openembedded/recipes/proftpd/proftpd_1.3.3c.bb' failed

Could you please take a look.


Thanks,

Paul

--=-hxfOgxi24AgHZMRnYp4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3BRP8ACgkQPX1aK2wOHVgJeACdEh4kkxGqW1uUPsWkG44VyToy
rP8AnRW0IIhMkVafnajNZ8SCNtWkoE5J
=cHmT
-----END PGP SIGNATURE-----

--=-hxfOgxi24AgHZMRnYp4c--
