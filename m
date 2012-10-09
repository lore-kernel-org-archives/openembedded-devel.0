Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1TLbBy-00064E-Tp
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 16:53:55 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so4774213pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 07:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=NFDJg2UowoufcQxffT1JfL7FnhnNgORml08ZUhQORJ4=;
	b=sL5B+2aqJyAH3Tvq66PbojWqZdewatjSgMbOcFTE5/DRTTth9PCkcBkkafCGiTYDfr
	wEKzExwWBW8XWYQJW4xYkRwkxVIv6U7vP/FP9D4LoQ427rWpP0LiKvorKpDPAD4jbs4w
	pLVGn8yaQ0wN1JoCezK/1XPnH27JHJTbV0niyRFU/MzWjvWPQBLIlDr/B97JFJJLyswd
	saJ7PchqAA5U89XsMTs+6CZRgEiAJN6ly7fDRsz/V64a87dnG/vMcApmW9tqWNtihkD6
	WmyoOpnMF6Gl1gr6pC0SjzcheVssMk7ld1IUJ4ssUJarenCkTGmQOZI53RRsmLKHEPfs
	meDA==
Received: by 10.68.217.67 with SMTP id ow3mr64286125pbc.26.1349793646454;
	Tue, 09 Oct 2012 07:40:46 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:d921:cb9:5b45:279c])
	by mx.google.com with ESMTPS id j10sm12682441pax.4.2012.10.09.07.40.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Oct 2012 07:40:44 -0700 (PDT)
Date: Tue, 9 Oct 2012 07:40:51 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20121009144051.GB16530@bill-the-cat>
References: <505ABA13.2050109@dresearch-fe.de>
	<cover.1349185326.git.sledz@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <cover.1349185326.git.sledz@dresearch-fe.de>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Henning Heinold <h.heinold@tarent.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 0/2] pull request 20121002
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
X-List-Received-Date: Tue, 09 Oct 2012 14:53:56 -0000
X-Groupsio-MsgNum: 41026
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline

--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 02, 2012 at 03:53:19PM +0200, Steffen Sledz wrote:

> Hi Tom, hi meta-java maintainers,
>=20
> this pull request contains a backport of jamvm-initial from meta-java
> which fixes at least the problem of endless loop in java-initial
> script while running do_configure for classpath-native.
>=20
> The backport works well for us, but it would be nice if we can get
> some acks from the java maintainers before Tom pulls the commits to
> 2011.03-maintenance branch.
>=20
> see also: http://thread.gmane.org/gmane.comp.handhelds.openembedded/54242
>=20
> Thx,
> Steffen
> The following changes since commit a35ceaacb2019750dc9f4b4fd5ea927cf2ad47=
fb:
>=20
>   gdk-pixbuf: add missing dependencies (2012-09-14 15:07:04 -0700)
>=20
> are available in the git repository at:
>=20
>   git://github.com/sledz/oe pull-request-1
>   https://github.com/sledz/oe/tree/pull-request-1
>=20
> Steffen Sledz (2):
>   jamvm: reorganize metadata to simplify backport from meta-java
>   jamvm-initial: backport 1.4.5 from meta-java
>=20
>  recipes/jamvm/files/jamvm_1.5.0-initial.patch      |   91 --------------=
------
>  recipes/jamvm/files/java-initial                   |   17 ++++
>  .../jamvm-initial.patch}                           |   19 ----
>  recipes/jamvm/jamvm-initial_1.4.5.bb               |   22 ++---
>  recipes/jamvm/{files =3D> jamvm}/debian-jni.patch    |    0
>  .../jamvm-1.3.1-size-defaults.patch                |    0
>  .../jamvm-1.5.3-jni_h-noinst.patch                 |    0
>  recipes/jamvm/jamvm/libffi.patch                   |   66 ++++++++++++++
>  8 files changed, 95 insertions(+), 120 deletions(-)
>  delete mode 100644 recipes/jamvm/files/jamvm_1.5.0-initial.patch
>  create mode 100755 recipes/jamvm/files/java-initial
>  rename recipes/jamvm/{files/jamvm_1.4.5-initial.patch =3D> jamvm-initial=
/jamvm-initial.patch} (81%)
>  rename recipes/jamvm/{files =3D> jamvm}/debian-jni.patch (100%)
>  rename recipes/jamvm/{files =3D> jamvm}/jamvm-1.3.1-size-defaults.patch =
(100%)
>  rename recipes/jamvm/{files =3D> jamvm}/jamvm-1.5.3-jni_h-noinst.patch (=
100%)
>  create mode 100644 recipes/jamvm/jamvm/libffi.patch

Applied to 2011.03-maintenance, thanks and sorry for the delay.

--=20
Tom

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlB0N3IACgkQdZngf2G4WwNFQgCeKTAIKDyXQRuOvYNz67DYgYfU
p8AAn2XMe6zSoz5pSJkAbol0Yowq7mvj
=+gum
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
