Return-Path: <joe@deserted.net>
Received: from mail-qe0-f49.google.com (mail-qe0-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1675E6CE6D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 17:25:29 +0000 (UTC)
Received: by mail-qe0-f49.google.com with SMTP id ff1so683519qeb.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Oct 2013 10:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=K82tPoyqfEhRp8pBPGjEkbxmrfQJ+U8dksre1z2rvaM=;
	b=MSi6tjy2fi0MLC750YNWxEyNgF8NJ6Cel8w0SdXwBabe9gDj2k5ro8sY03FaCtOYXL
	7eSmOXUNS7fhOkLs8ciSaYw1qKxV5Q56QXasEXXVZQ6Ilvz7sseB1xHsZdgG1I+luOOp
	5TPW1bXn5GL0dVzeBfl9y2dRS0Gqf91pdiIoAu2sUULDmI6ovIBxT/O48lmPlWvXCLeA
	DlmQXE/7X+mUEnRM1YlcOZGYBorjzEIY+otTHstUpfMDkxWRvF8paib58qZJBQMn5Mj6
	52tWKXspo/8rwRPVoLLTAJWZAXD6FIfwvetxeHFdUsFGpQLjlj3zl/YY8/uEBKErwYYq
	b98Q==
X-Gm-Message-State: ALoCoQm3PVzgMzba2yZQibqhjv9hL6D4rMCKf0fquUZ7zZ4539hKfya6badRgMyu7OqhD6OoDc68
X-Received: by 10.49.51.167 with SMTP id l7mr11084988qeo.52.1381339529748;
	Wed, 09 Oct 2013 10:25:29 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id r5sm88416207qaj.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 10:25:28 -0700 (PDT)
Date: Wed, 9 Oct 2013 13:25:26 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131009172523.GD5541@deserted.net>
References: <1381307549-12711-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1381307549-12711-1-git-send-email-b28495@freescale.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v2] netperf: set _FILE_OFFSET_BITS to 64 to support large files
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
X-List-Received-Date: Wed, 09 Oct 2013 17:25:30 -0000
X-Groupsio-MsgNum: 46587
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HWvPVVuAAfuRc6SZ"
Content-Disposition: inline

--HWvPVVuAAfuRc6SZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.

-J.

[[oe] [meta-oe][PATCH v2] netperf: set _FILE_OFFSET_BITS to 64 to support l=
arge files] On 13.10.09 (Wed 16:32) b28495@freescale.com wrote:

> From: Ting Liu <b28495@freescale.com>
>=20
> Without this patch, netperf2.6 can only
> support files smaller than 2GB with TCP_SENDFILE item.
>=20
> Signed-off-by: Ting Liu <b28495@freescale.com>
> Tested-by: Jianhua Xie<jianhua.xie@freescale.com>
> Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> v2: update with Otavio's comment (add base_contains item)
>=20
>  .../recipes-support/netperf/netperf_2.6.0.bb       |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/m=
eta-networking/recipes-support/netperf/netperf_2.6.0.bb
> index eda7859..c206d56 100644
> --- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> +++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
> @@ -23,6 +23,11 @@ S =3D "${WORKDIR}/netperf-${PV}"
>  # cpu_set.patch plus _GNU_SOURCE makes src/netlib.c compile with CPU_ ma=
cros
>  CFLAGS_append =3D " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
> =20
> +# set the "_FILE_OFFSET_BITS" preprocessor symbol to 64 to support files
> +# larger than 2GB
> +CFLAGS_append =3D "${@base_contains('DISTRO_FEATURES', 'largefile', \
> +    ' -D_FILE_OFFSET_BITS=3D64', '', d)}"
> +
>  # autotools.bbclass attends to include m4 files with path depth <=3D 2 by
>  # "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4.
>  do_configure_prepend() {
--=20
-Joe MacDonald.
:wq

--HWvPVVuAAfuRc6SZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJVkYMACgkQwFvcllog0XxsQQCgqqTXY4JX9Q7iJ05ybfbZSQDS
fcUAn28hl5vau0LwepmNS5UQaJvFsf8o
=XdQg
-----END PGP SIGNATURE-----

--HWvPVVuAAfuRc6SZ--
