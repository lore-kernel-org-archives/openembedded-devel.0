Return-Path: <joe@deserted.net>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id B7ED36D1A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 19:49:48 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id ii20so40865qab.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 12:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=krQPHfH25LP8VS5YT7FcUswWpFsOzpUONzqVpmMI2+4=;
	b=dQ95fYJNUwieZldugA7aLXyIhDfKOsmeRb+6OAYsDakzHjxJ2OrDSZcZdRE4C1evkD
	EB8rfiHuwj4QSljM1NIFfQeCQNDHBBbl3Z//GTS+HBN0zUdhEkdZETgDxeCA6MdvoCCT
	3GsD7GbTyUX/u3gnJBFlABmRXtOFc0+oeqb+8SA9SKvQtQ6uEqYOZ8jqDGa8B5Rjkh8M
	jOeKev3j2OwhAXF7UK6qBe/rY9BYrbKjS0t8a3BLGmhaFrnigw++xV4pFgg4DfUmsl4D
	UZeNG6xmvovmeImicn+uaAVGPMFfdJOK4fkPTzA25zUoQcLkarF62p44bIWPzEk7tpdt
	mbSA==
X-Gm-Message-State: ALoCoQmfau1/fnERF2uoJ78eIfgaj3Zk1Otb9oec2h54b3oRS0UjCjqSQnG2vr7wsRcwsc19wcZS
X-Received: by 10.49.1.230 with SMTP id 6mr6005086qep.48.1382644190193;
	Thu, 24 Oct 2013 12:49:50 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id x1sm10944130qai.6.2013.10.24.12.49.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Oct 2013 12:49:49 -0700 (PDT)
Date: Thu, 24 Oct 2013 15:49:46 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131024194945.GD3984@deserted.net>
References: <1382625650-9266-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1382625650-9266-1-git-send-email-liezhi.yang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking] [PATCH] cifs-utils: add --ignore-fail-on-non-empty for rmdir
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
X-List-Received-Date: Thu, 24 Oct 2013 19:49:48 -0000
X-Groupsio-MsgNum: 46870
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Y7d0dPL928TPQbc"
Content-Disposition: inline

--1Y7d0dPL928TPQbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking] [PATCH] cifs-utils: add --ignore-fail-on-non-empty =
for rmdir] On 13.10.24 (Thu 10:40) Robert Yang wrote:

> Add --ignore-fail-on-non-empty for rmdir in case there are files in the
> directories.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta-networking/recipes-support/cifs/cifs-utils_git.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/met=
a-networking/recipes-support/cifs/cifs-utils_git.bb
> index fc7a4d3..d8de714 100644
> --- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
> +++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
> @@ -20,7 +20,7 @@ inherit autotools pkgconfig
>  do_install_append() {
>      # Remove empty /usr/bin and /usr/sbin directories since the mount he=
lper
>      # is installed to /sbin
> -    rmdir ${D}${bindir} ${D}${sbindir}
> +    rmdir --ignore-fail-on-non-empty ${D}${bindir} ${D}${sbindir}
>  }
> =20
>  RRECOMMENDS_${PN} =3D "kernel-module-cifs"
--=20
-Joe MacDonald.
:wq

--1Y7d0dPL928TPQbc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJpedkACgkQwFvcllog0XwclwCeNGyz6YrJdTZN29qxBePkc6Wx
OeAAoLexYJatw2gDkkDOkti2GHXOQqRh
=QXQP
-----END PGP SIGNATURE-----

--1Y7d0dPL928TPQbc--
