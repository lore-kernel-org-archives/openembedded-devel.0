Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLdL9-0005JC-Ki for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 17:34:43 +0200
Received: from f053043231.adsl.alicedsl.de ([78.53.43.231]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLdJq-0008ME-Pd for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 15:33:23 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110512085420.GD3423@jama.jama.net>
References: <1305190050.4254.14.camel@mattotaupa>
	<20110512085420.GD3423@jama.jama.net>
Date: Sun, 15 May 2011 17:31:52 +0200
Message-ID: <1305473512.5838.569.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: libshr-glib: task configure fails with `/bin/sh: gdbus-codegen: command not found`
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
X-List-Received-Date: Sun, 15 May 2011 15:34:43 -0000
X-Groupsio-MsgNum: 32056
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-dxULiR1a5QxWSpOztcVv"

--=-dxULiR1a5QxWSpOztcVv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 12.05.2011, 10:54 +0200 schrieb Martin Jansa:
> On Thu, May 12, 2011 at 10:47:30AM +0200, Paul Menzel wrote:

> > as a result of I think commit 82f8341d [1]
> >=20
> > 	commit 82f8341d6282d6ae29e80eb3cdf312b6deda9b4c
> > 	Author: Martin Jansa <Martin.Jansa@gmail.com>
> > 	Date:   Sun May 8 07:08:16 2011 +0200
> >=20
> > 		  glib-2.0_git: include gdbus-codegen files in -dev
> > 		 =20
> > 		  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >=20
> > I am seeing the following error message in task configure of
> > `libshr-glib` using `minimal` for `MACHINE =3D "beagleboard"`.
> >=20
> > 	[=E2=80=A6]
> > 	for f in /oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux=
-gnueabi//usr/share/shr-specs/xml/*.xml; do OUT=3D`echo $f | sed 's/.*\///g=
; s/^org\.shr\./shr-/g; s/.xml//g; s/\.//g;' | awk  '{ printf tolower($1)}'=
`; gdbus-codegen  --interface-prefix org.shr --generate-c-code $OUT $f; ech=
o "#include <$OUT.h>" >> shr-bindings.h; done
> > 	/bin/sh: gdbus-codegen: command not found
> > 	/bin/sh: gdbus-codegen: command not found
> > 	/bin/sh: gdbus-codegen: command not found
> > 	/bin/sh: gdbus-codegen: command not found
> > 	/bin/sh: gdbus-codegen: command not found
> > 	/bin/sh: gdbus-codegen: command not found
> > 	/bin/sh: gdbus-codegen: command not found
> > 	/bin/sh: gdbus-codegen: command not found
> > 	/bin/sh: gdbus-codegen: command not found
> > 	touch shr-bindings.h
> > 	[=E2=80=A6]
> >=20
> > Is that related?
>=20
> Not really, gdbus-codegen was provided by gdbus-binding-tool, but this
> recipe is no longer supported by libshr-glib which now uses newer
> gdbus-codegen version which was merged to glib sources (2.29.3 and
> newer)
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D22b4f79261=
70ec14253a6d60f6d98f5eb3ec7f27
>=20
> That's why this _git recipe has
> DEFAULT_PREFERENCE_shr =3D "1"
>=20
> and libshr-glib no longer depends on gdbus-binding-tool, but expects
> glib-2.0-native to be new enough
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df6c2ad4e65=
1383ab09be1f5b394aa7014233cfc5
>=20
> and also few more libs/daemons were changed to support newer glib
> glib-2.0_git: add RREPLACES for gdbus-binding-tool	Martin Jansa
> libphone-ui: bump SRCREV for glib-2.29	Martin Jansa
> libshr-glib: bump SRCREV for glib-2.29 support and use gdbus-codegen from=
 gli...	Martin Jansa
> phoneuid: bump SRCREV for glib-2.29	Martin Jansa
> phonefsod: bump SRCREV for glib-2.29
>=20
> So if you need any of those, you have to manually clean
> gdbus-binding-tool-native/gdbus-binding-tool on your buildhost (to clean
> sysroot and shlibs) and then prefer glib-2.0-2.29.3.

Thank you for the explanation.

	DISTRO=3D"shr" bitbake -k libshr-glib

indeed worked after getting `glib-2.0_git` to build on my build host
[1].

I will not get to test newer GLib version with other distributions
before July.

One slightly off topic question. Where did you get the 2.29.3 or git
recipe from or did you write it from scratch? I find the ordering in the
recipe quite confusing.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Ddcf425c=
5472fdee74885c4f21a851e39c84e6642

--=-dxULiR1a5QxWSpOztcVv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3P8egACgkQPX1aK2wOHVj5CwCeLZcWwGBJkTRvLTZxEtUei+5m
/rQAniUUxD0SvG/ejOCavDPR/nNcuhGj
=fMzt
-----END PGP SIGNATURE-----

--=-dxULiR1a5QxWSpOztcVv--
