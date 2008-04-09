Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JjbtV-0006Dz-VH
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Apr 2008 17:07:26 +0200
Received: by yw-out-1718.google.com with SMTP id 9so551605ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2008 08:07:24 -0700 (PDT)
Received: by 10.142.72.4 with SMTP id u4mr56081wfa.327.1207753643721;
	Wed, 09 Apr 2008 08:07:23 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.14.115])
	by mx.google.com with ESMTPS id 22sm482703wfd.4.2008.04.09.08.07.22
	(version=SSLv3 cipher=RC4-MD5); Wed, 09 Apr 2008 08:07:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200804090920.02871.geoffrey@pager.net>
References: <200804090920.02871.geoffrey@pager.net>
Date: Wed, 09 Apr 2008 08:07:21 -0700
Message-Id: <1207753641.7368.20.camel@isis>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1 
Subject: Re: avr32-*-gdb requires modifying gdb.inc / gdb-cross.inc
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
X-List-Received-Date: Wed, 09 Apr 2008 15:07:26 -0000
X-Groupsio-MsgNum: 4930
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-+/6fFlxz1SDZFTQnjF1R"

--=-+/6fFlxz1SDZFTQnjF1R
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Geoffrey

I think it will be good to make this step arch specific to AVR only.
and best is to identify what changes are done in configure that needs it
to be regenerated. You can regenerate these and include them in the
patch itself instead of doing it at compile time.

Thanks

-Khem

On Wed, 2008-04-09 at 09:20 -0500, Geoffrey Wossum wrote:
> Hi all,
>=20
> I currently have a BitBake recipe that can build gdb 6.4 for the AVR32, a=
nd=20
> I'm about to make one that can build the gdb 6.7 using Atmel's newly rele=
ased=20
> patches for the AVR32.
>=20
> According to this page, http://avr32linux.org/twiki/bin/view/Main/GDBPatc=
hes,=20
> you must do some extra steps to build gdb if you patch it.  My experience=
=20
> with Atmel's gdb 6.4 release was that even though they claim you don't ha=
ve=20
> to do these steps if you use the full source tarball, you have to anyway.
>=20
> This requires modifying gdb.inc / gdb-cross.inc.  I think the modificatio=
ns=20
> are safe for all platforms, but I was hoping someone could comment before=
 I=20
> roll a patchset to submit. =20
>=20
> TIA,
> ---
> Geoffrey
>=20
>=20
> --- packages/gdb/gdb-cross.inc  2008-03-04 14:30:27.000000000 -0600
> +++ /home/geoff/lrs/playpaq/org.openembedded.dev/packages/gdb/gdb-cross.i=
nc   =20
> 2008-04-09 09:09:50.000000000 -0500
> @@ -10,9 +10,38 @@ do_configure () {
>  # override this function to avoid the autoconf/automake/aclocal/autohead=
er
>  # calls for now
>         (cd ${S} && gnu-configize) || die "failure in running gnu-configi=
ze"
> +
> +
> +        # This stuff is required to build Atmel's patched gdb for the AV=
R32.
> +        # See http://avr32linux.org/twiki/bin/view/Main/GDBPatches
> +        (cd ${S}/bfd && autoreconf) || die "failure running autoreconf i=
n bfd/"
> +        (cd ${S}/opcodes && autoreconf) || die "failure running autoreco=
nf in opcodes/"
> +
>         oe_runconf
> +
> +
> +        # Also required according to the avr32linux GDBPatches page
> +        make configure-bfd || die "Error running configure-bfd"
> +        (cd bfd && make headers && cd "$OLDPWD") || \
> +                die "error running 'make headers' in bfd"
>  }
>=20
>  do_stage () {
> +        # Left to fend for itself, "make install" will fail, saying that
> +        # makeinfo is missing.  I don't know if this is because my syste=
m
> +        # makeinfo isn't available inside the bitbake build, or if this =
is
> +        # due to the texinfo version detection bug that has plagued some
> +        # packages (see https://bugzilla.redhat.com/show_bug.cgi?id=3D34=
5621).
> +        # Either way, we want to keep "make install"from wanting to run
> +        # makeinfo.  By copying over all the .info files before hand,
> +        # the files will exist in the build tree and have shiny new
> +        # timestamps, thus preventing "make install" from using makeinfo=
.
> +        cd ${S}
> +        for infofile in `find . -name "*.info"`; do
> +            cp "$infofile" ${B}/"$infofile"
> +        done
> +        cd "$OLDPWD"
> +
> +
>         oe_runmake install
>  }
>=20
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
--=20
Khem Raj <raj.khem@gmail.com>

--=-+/6fFlxz1SDZFTQnjF1R
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBH/NupHnJKy6V6em4RAiXCAJ0UqT5PfSsPYfu1TI0a/FAmC1yqfQCfYr2D
bQEoR4fdrSZ9WDLAaz+tm6c=
=EYaX
-----END PGP SIGNATURE-----

--=-+/6fFlxz1SDZFTQnjF1R--
