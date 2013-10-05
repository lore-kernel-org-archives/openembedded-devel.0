Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4BFDF6CC7B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Oct 2013 11:27:11 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so2318024eak.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Oct 2013 04:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PrtHC4AlMrL69uY4GRtyjTiXJgTHaMoN9pJBNEFO+BE=;
	b=LNtqfKGJk5x28oJopQlfAQchh9XsTF9xznPol6fkEdlctfJdGe0NwyLxytoLQHwxyF
	pNwuifTpPSJGbe0dTmpB4z7ZAJddPEJ03JZrya2+KBY56oJVg6JV/3itlQrs6iRcPzmK
	MZx0HWBMKhFpjccyl5q5vfFR15Mu+CV9xWj+fGWFwQudFvxotsSadsE7k2e/XmP6veyt
	KV+w13JzE2u5mBe+WdpreSaYEt8+92Tkja50R1MPUTcW+4OEwkDZT0y4n6wYuVbWaW0M
	sRe29fAUt3Hpu7J83IAeQCl+JJBkMwI8bZ/dNjRCv65jTqaYF3kz7jrG4Cx66XDDmS0p
	cNSw==
X-Received: by 10.14.210.8 with SMTP id t8mr29783120eeo.39.1380972432133;
	Sat, 05 Oct 2013 04:27:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm38740615eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 04:27:11 -0700 (PDT)
Date: Sat, 5 Oct 2013 13:27:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131005112719.GN6240@jama>
References: <1380187231-23854-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1380187231-23854-1-git-send-email-b28495@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] netperf: set _FILE_OFFSET_BITS to 64 to support large files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Oct 2013 11:27:12 -0000
X-Groupsio-MsgNum: 46454
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qi3SIpffvxS/TM8d"
Content-Disposition: inline

--qi3SIpffvxS/TM8d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2013 at 05:20:31PM +0800, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>=20
> Without this patch, netperf2.6 can only
> support files smaller than 2GB with TCP_SENDFILE item.
>=20
> Signed-off-by: Ting Liu <b28495@freescale.com>
> Tested-by: Jianhua Xie<jianhua.xie@freescale.com>
> ---
>  .../recipes-support/netperf/netperf_2.6.0.bb       |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/m=
eta-networking/recipes-support/netperf/netperf_2.6.0.bb
> index eda7859..1d9ba20 100644
> --- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> +++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> @@ -23,6 +23,10 @@ S =3D "${WORKDIR}/netperf-${PV}"
>  # cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_ ma=
cros
>  CFLAGS_append =3D " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
> =20
> +# set the "_FILE_OFFSET_BITS" preprocessor symbol to 64 to support files=
=20
> +# larger than 2GB
> +CFLAGS_append =3D " -D_FILE_OFFSET_BITS=3D64"
> +

http://patchwork.openembedded.org/patch/57331/
This patch is superseded, right?

Please update as Otavio requested.

>  # autotools.bbclass attends to include m4 files with path depth <=3D 2 by
>  # "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4.
>  do_configure_prepend() {
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qi3SIpffvxS/TM8d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJP95cACgkQN1Ujt2V2gBxkyQCdFUXeuuE94y/jzWlmugQlkNkJ
mRAAn0HfRgL/Ug3qLfIePQ2XncLMtr60
=6/Aa
-----END PGP SIGNATURE-----

--qi3SIpffvxS/TM8d--
