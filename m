Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 785B2782C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 12:03:56 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id k7so1400219wre.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 05:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JFqUNjxMjZNTP5oiyrDSUPYJ2yDsiPsDf03ySJc5G/w=;
	b=uSQc0P7tUPU5jk9RVKURxUB22RYqL7+Hly9vqeAYNrHLxk1xyrv5naV2KY2v2yOWZJ
	GFTsk/j+NMvzFek+ucy+Ui6D+acrVms+2k46SXH7BK/7hqVouWOkNjWrXJVKH4fywqKg
	WOQ5P+ZUk3c6MuZxXLDFJsgdOIbwTcmOVImsgoaWrD5VDFlKMqXLgq6iTTLEOp76hwtM
	EnZ0iElM/Lah5O6qgk+oo4l4393UFsE+H4ujHl1Yda7noqkvZ589UI7u1ooxCaZqy6ib
	OJOSFF1ER8yh6OSlRViERFZpvNLk1lqtKlURA+S2O08/Yc53SP4jLO65/+BrkKEUdeH7
	d6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JFqUNjxMjZNTP5oiyrDSUPYJ2yDsiPsDf03ySJc5G/w=;
	b=aq5MKsAd3/y7jWnI93FZbiIEPCBsq3bZdG4XevCUwQF1w215sHKRjcJy7CxsugYKES
	q/yZls2cg/n1MmI94jdPgXlYkog9xKrQPXzc/8ltAcSFqxjumyRBfWmkI+Vm5nVeuCkh
	BAB3P+s/u+YafNytCHiXJgKaq6MIsxJo14/z/LbcGygCrZxRWzIK35HtofxlkllE2Cqu
	/l+CFDc3QxwaR/hQgxsZyJpVEKXele0thvCG9Rglmj3hRES8KnR4yhARNveYm4LsCB0n
	jr9Y39ud8PodQWWl6+BLyCIwy7LGIs0KRELnsyBtk8FknvWkrWRte/90cr+Iq5W+xf2j
	oS7g==
X-Gm-Message-State: AMCzsaXKTSjZMXSDa2WQDhiqi151jXJZNZXYSHNegdNAFrMlxHVUlKNa
	AlzT4agdQBusc49j4E3Ixn7iyg==
X-Google-Smtp-Source: ABhQp+R2pfh/vAbHGusXvgdX+bTuMPfNQ/6dX8/TcNdNbaGZyjit9J9Tynw/SokRmE4J8DaQ0Y6SZw==
X-Received: by 10.223.166.65 with SMTP id k59mr3378371wrc.125.1508241837115;
	Tue, 17 Oct 2017 05:03:57 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p78sm12762038wma.11.2017.10.17.05.03.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 17 Oct 2017 05:03:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 17 Oct 2017 14:07:05 +0200
To: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Message-ID: <20171017120705.GC4387@jama>
References: <20171017105132.GB4387@jama>
	<20171017115539.13778-1-mikko.ylinen@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20171017115539.13778-1-mikko.ylinen@linux.intel.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] mraa/upm: enable nodejs bindings by default
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Oct 2017 12:03:56 -0000
X-Groupsio-MsgNum: 69236
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline

--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 02:55:39PM +0300, Mikko Ylinen wrote:
> HAVE_NODEJS is a leftover from meta-refkit-core where the
> layer had to adapt to different BBLAYER combinations (some
> where nodejs wasn't available but mraa/upm were).
>=20
> Since that check is no longer needed and nodejs is in fact
> part of meta-oe, nodejs bindings can be enabled by default
> (with exceptions for armv4 and armv5 where nodejs isn't
> available).
>=20
> Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
> ---
>  meta-oe/recipes-extended/mraa/mraa_git.bb | 6 +++++-
>  meta-oe/recipes-extended/upm/upm_git.bb   | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-=
extended/mraa/mraa_git.bb
> index 616048fac..b93fd72c8 100644
> --- a/meta-oe/recipes-extended/mraa/mraa_git.bb
> +++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
> @@ -31,7 +31,11 @@ FILES_${PN}-utils =3D "${bindir}/"
>  # override this in local.conf to get needed bindings.
>  # BINDINGS_pn-mraa=3D"python"
>  # will result in only the python bindings being built/packaged.
> -BINDINGS ??=3D "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_N=
ODEJS') or '0') else '' }"
> +BINDINGS ??=3D "python nodejs"
> +
> +# nodejs isn't available for armv4/armv5 architectures
> +BINDINGS_armv4 ??=3D "python"
> +BINDINGS_armv5 ??=3D "python"

Still missing one, aren't you?

>  PACKAGECONFIG ??=3D "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nod=
ejs', '', d)} \
>   ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '', d)=
}"
> diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-ex=
tended/upm/upm_git.bb
> index 38065ce53..da1e4add5 100644
> --- a/meta-oe/recipes-extended/upm/upm_git.bb
> +++ b/meta-oe/recipes-extended/upm/upm_git.bb
> @@ -26,7 +26,11 @@ inherit distutils3-base cmake
>  # override this in local.conf to get needed bindings.
>  # BINDINGS_pn-upm=3D"python"
>  # will result in only the python bindings being built/packaged.
> -BINDINGS ??=3D "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_N=
ODEJS') or '0') else '' }"
> +BINDINGS ??=3D "python nodejs"
> +
> +# nodejs isn't available for armv4/armv5 architectures
> +BINDINGS_armv4 ??=3D "python"
> +BINDINGS_armv5 ??=3D "python"
> =20
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nod=
ejs', '', d)} \
>   ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '', d)=
}"
> --=20
> 2.11.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWeXyaAAKCRA3VSO3ZXaA
HBt7AKCUZylsu/3edIfMKY1tTOUOqQKMcQCgifAfXW/aHpkDNuj8Mktn4Z+3FRg=
=L0W8
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--
