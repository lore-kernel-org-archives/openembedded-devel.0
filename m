Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QCRoS-0007v9-5E
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 09:27:00 +0200
Received: by fxm19 with SMTP id 19so314593fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 00:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=qNvOrVA+hqiLV2+WMxXEIqc4lX53E/tEbgmqoen2sCQ=;
	b=hcdPbxQLCiw0IN1KXMuCBtYq5Y93rr16D9pqiDgfEQPUWWjpPc31ymKxtOJhIgfX/2
	a5cmHs63jiaP8Q0yqZdDkh1bzdyBUhT0EaPatGl+BjbIn9X+pwiD+zukX/hWQWTBgysv
	ivTy2jyManA9W7S/OLc+pRZwMGSH7iUglX2RM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=OVR6WPYEMZ0dYkcK9iqegYEjQRFOKbNSmxprOo/ShUJQ1mcZ1obxGKhqO9Piam2it8
	mturktwgOfxfu61G/I1uf+cIMGG9GXmhGgUwYhM6/sr+kYdKOTn5DK8OGPp18aKfsza0
	SxtCDq7fYp79no6leRyaL95C5p/ftUbyyuOZk=
Received: by 10.223.76.129 with SMTP id c1mr1753479fak.107.1303284277362;
	Wed, 20 Apr 2011 00:24:37 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n7sm189777fam.11.2011.04.20.00.24.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 00:24:36 -0700 (PDT)
Date: Wed, 20 Apr 2011 09:24:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110420072436.GD5675@jama.jama.net>
References: <cover.1303283391.git.michael.lippautz@gmail.com>
	<12f5ec3eb914530ef9a14ce31a21500bc25cd2c7.1303283391.git.michael.lippautz@gmail.com>
MIME-Version: 1.0
In-Reply-To: <12f5ec3eb914530ef9a14ce31a21500bc25cd2c7.1303283391.git.michael.lippautz@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe 3/6] eventlog: Clean recipe and upgrade to 0.2.12
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
X-List-Received-Date: Wed, 20 Apr 2011 07:27:00 -0000
X-Groupsio-MsgNum: 31343
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Content-Disposition: inline

--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2011 at 09:18:31AM +0200, Michael Lippautz wrote:
> * Added LIC_FILES_CHKSUM
> * Move to version 0.2.12
>=20
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> ---
>  .../recipes-support/eventlog/eventlog_0.2.12.bb    |   11 +++++++++++
>  meta-oe/recipes-support/eventlog/eventlog_0.2.5.bb |   10 ----------
>  2 files changed, 11 insertions(+), 10 deletions(-)
>  create mode 100644 meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
>  delete mode 100644 meta-oe/recipes-support/eventlog/eventlog_0.2.5.bb
>=20
> diff --git a/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb b/meta-o=
e/recipes-support/eventlog/eventlog_0.2.12.bb
> new file mode 100644
> index 0000000..3683901
> --- /dev/null
> +++ b/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION =3D "Replacement syslog API"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db8ba8e77bcda9a53fac0fe39fe957=
767"
> +PR =3D "r1"

new version should start with r0 (or drop PR from recipe to get default
r0)

> +
> +SRC_URI =3D "http://www.balabit.com/downloads/files/syslog-ng/sources/3.=
2.2/source/${PN}_${PV}.tar.gz"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI[md5sum] =3D "f9c32814f78ea2629850f0440de5ff34"
> +SRC_URI[sha256sum] =3D "f78c218faa6b6b378f25c640a5d1188b1ecbd57d3a527432=
263fd44b17bbd1c9"
> diff --git a/meta-oe/recipes-support/eventlog/eventlog_0.2.5.bb b/meta-oe=
/recipes-support/eventlog/eventlog_0.2.5.bb
> deleted file mode 100644
> index 9dfa402..0000000
> --- a/meta-oe/recipes-support/eventlog/eventlog_0.2.5.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -DESCRIPTION =3D "Replacement syslog API"
> -LICENSE =3D "BSD"
> -PR =3D "r1"
> -
> -SRC_URI =3D "http://www.balabit.com/downloads/files/eventlog/0.2/${P}.ta=
r.gz"
> -
> -inherit autotools pkgconfig
> -
> -SRC_URI[md5sum] =3D "a6bdba91f88540cc69b398fd138d86cd"
> -SRC_URI[sha256sum] =3D "914319726bcd01a4055b1c5e09671085875af6de2b0d8589=
841916139574ee11"
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2uijMACgkQN1Ujt2V2gBzDtgCdGuU6UEyf3HjgOsoumyoDoBBD
9wUAnRk9Bsk0CLG+XQqrpE9BsrJJftXR
=m5kx
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--
