Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U6mqY-0005QQ-Ce
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 19:51:07 +0100
Received: by mail-ea0-f177.google.com with SMTP id n13so1823527eaa.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2013 10:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QND23ribp/32VgO1uY9gEnP06SHhQLJEzecnjfAWbmw=;
	b=Cit9c/OUzBYXlxbHcMJHz5NETBvuLfh0bEiQiuvEd0/4rxf7MPoYeRvLEeeibIfr4y
	Glgc0sJmrirnQfpNZhlVqmrJa0SZVMSgYB8Q0jCX11+FN3V+PaW1qJzGT21FbyrMUKoQ
	3hcB6X/rD6gaplsHEvYkhpVkAlJopw+5KQL+6oTL2Zu/hEnfK4gA1ZQG8s0HLqp9pTXu
	3cPHRf9/m9XhdtV9pCsO1R68LlIcOgPQqhpy+KCc+v+9MXXTU3sHGKvqjH1S+eX3Dllb
	1GNkHIsq0IRc2aGGg31Ipx4qHlgoWK1ekETXZ669pgGp17q6KBTwgOCedD8xa6LZPNkl
	RRYw==
X-Received: by 10.14.205.68 with SMTP id i44mr23149012eeo.25.1361039685294;
	Sat, 16 Feb 2013 10:34:45 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l8sm55664115een.10.2013.02.16.10.34.44
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 16 Feb 2013 10:34:44 -0800 (PST)
Date: Sat, 16 Feb 2013 19:34:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130216183452.GZ3300@jama>
References: <1360609028-8921-1-git-send-email-andrei@gherzan.ro>
MIME-Version: 1.0
In-Reply-To: <1360609028-8921-1-git-send-email-andrei@gherzan.ro>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/4] x264: Add patch to remove default flags -mcpu=cortex-a8 and -mfpu=neon
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
X-List-Received-Date: Sat, 16 Feb 2013 18:51:09 -0000
X-Groupsio-MsgNum: 43203
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H7BIH7T1fRJ3RGOi"
Content-Disposition: inline

--H7BIH7T1fRJ3RGOi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2013 at 08:57:05PM +0200, Andrei Gherzan wrote:
> -march flag is not in CFLAGS so this will always default to -mcpu=3Dcorte=
x-a8
> -mfpu=3Dneon. Obviously wrong for other machines.

All 4 applied

>=20
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  .../don-t-default-to-cortex-a9-with-neon.patch     |   20 ++++++++++++++=
++++++
>  meta-oe/recipes-multimedia/x264/x264_git.bb        |    6 +++++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-multimedia/x264/x264/don-t-default-to=
-cortex-a9-with-neon.patch
>=20
> diff --git a/meta-oe/recipes-multimedia/x264/x264/don-t-default-to-cortex=
-a9-with-neon.patch b/meta-oe/recipes-multimedia/x264/x264/don-t-default-to=
-cortex-a9-with-neon.patch
> new file mode 100644
> index 0000000..b844d88
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-wit=
h-neon.patch
> @@ -0,0 +1,20 @@
> +-march flag is not in CFLAGS so this will always default to -mcpu=3Dcort=
ex-a8
> +-mfpu=3Dneon.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> +
> +Index: git/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/configure	2013-02-10 16:26:40.666343682 +0200
> ++++ git/configure	2013-02-10 16:27:49.198341677 +0200
> +@@ -703,9 +703,6 @@
> + fi
> +
> + if [ $asm =3D auto -a $ARCH =3D ARM ] ; then
> +-    # set flags so neon is built by default
> +-    echo $CFLAGS | grep -Eq '(-mcpu|-march|-mfpu)' || CFLAGS=3D"$CFLAGS=
 -mcpu=3Dcortex-a8 -mfpu=3Dneon"
> +-
> +     if  cc_check '' '' '__asm__("rev ip, ip");' ; then      define HAVE=
_ARMV6
> +         cc_check '' '' '__asm__("movt r0, #0");'         && define HAVE=
_ARMV6T2
> +         cc_check '' '' '__asm__("vadd.i16 q0, q0, q0");' && define HAVE=
_NEON
> diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb b/meta-oe/recipe=
s-multimedia/x264/x264_git.bb
> index 7d7579f..056c25c 100644
> --- a/meta-oe/recipes-multimedia/x264/x264_git.bb
> +++ b/meta-oe/recipes-multimedia/x264/x264_git.bb
> @@ -4,9 +4,13 @@ HOMEPAGE =3D "http://www.videolan.org/developers/x264.ht=
ml"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> =20
> +PR =3D "r1"
> +
>  DEPENDS =3D "yasm-native"
> =20
> -SRC_URI =3D "git://git.videolan.org/x264.git"
> +SRC_URI =3D "git://git.videolan.org/x264.git \
> +    file://don-t-default-to-cortex-a9-with-neon.patch \
> +    "
>  SRCREV =3D "1cffe9f406cc54f4759fc9eeb85598fb8cae66c7"
> =20
>  PV =3D "r2230+git"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--H7BIH7T1fRJ3RGOi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEf0UwACgkQN1Ujt2V2gBxY5ACfTjS0LEnmbMqSlHCxNGBQYzZq
eNMAn0phahBy3cmJzyy/Y0EukWwkh43P
=er19
-----END PGP SIGNATURE-----

--H7BIH7T1fRJ3RGOi--
