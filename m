Return-Path: <joe@deserted.net>
Received: from mail-qe0-f46.google.com (mail-qe0-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2B5126DD48
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 16:24:34 +0000 (UTC)
Received: by mail-qe0-f46.google.com with SMTP id a11so5774223qen.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2013 08:24:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=vwgWxMdDtBufGWB80XRlxn9Yh5Q2W+F1bbgENLWntdI=;
	b=cfsFAhrQLX0Hg9gH73j3Lzeb0nDx/d6JuyQCH48XIH6D69RiCDdAVio9w/2pfS2Vrg
	pR8w2RyKd6VLxSeJWaCGwzydsov6nelyc0JIPdJ3x7Eb1XYj7WD1kQM4vpbu8e8LCIkk
	XCyUyii4yslvIHVx6Wlb6yqTIGe6RjN8w/5iUn3e643aSIMpeqcPO05i+w+Cx1gY1eIu
	TrMaV4i4JhsqD1+aq7ItHmfjkWv359QxE5JVNm18dN1n5cxaeszxwg2pnHw3zCy9Ztex
	Wqm2TWRu7bN1kJOj20oxGaRQ7XhqeSFwEJbsAZFxG/7llMgQjIWW2Y1d3FOJOqpl6kW6
	qZ8w==
X-Gm-Message-State: ALoCoQnTASKpByqQEDpWhuMDcI1YkjnkHZWjDcPVqqm/FPLk/4ojhRCLBYjgFfpBj0YR/2V7Z9I+
X-Received: by 10.224.136.10 with SMTP id p10mr57638618qat.37.1385483073849;
	Tue, 26 Nov 2013 08:24:33 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id b10sm44004891qeg.7.2013.11.26.08.24.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Nov 2013 08:24:32 -0800 (PST)
Date: Tue, 26 Nov 2013 11:24:30 -0500
From: Joe MacDonald <joe@deserted.net>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20131126162429.GE3939@deserted.net>
References: <1384897838-11066-1-git-send-email-mark.hatle@windriver.com>
	<1384897838-11066-2-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1384897838-11066-2-git-send-email-mark.hatle@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/3] quagga: Fix watchquagga initscript problem.
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
X-List-Received-Date: Tue, 26 Nov 2013 16:24:34 -0000
X-Groupsio-MsgNum: 47271
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Content-Disposition: inline

--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[meta-networking][PATCH 1/3] quagga: Fix watchquagga initscript problem.] =
On 13.11.19 (Tue 15:50) Mark Hatle wrote:

> From: Bopeng Liu <bopeng.liu@windriver.com>
>=20
> Change the default config file for making watchquagga can startup success=
ful
>=20
> Signed-off-by: Bopeng Liu <Bopeng.Liu@windriver.com>
> ---
>  .../recipes-protocols/quagga/files/watchquagga.default           | 9 +++=
++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-protocols/quagga/files/watchquagga.d=
efault b/meta-networking/recipes-protocols/quagga/files/watchquagga.default
> index 53f6a8c..2d601ec 100644
> --- a/meta-networking/recipes-protocols/quagga/files/watchquagga.default
> +++ b/meta-networking/recipes-protocols/quagga/files/watchquagga.default
> @@ -2,6 +2,11 @@
>  #watch_daemons=3D"zebra bgpd ospfd ospf6d ripd ripngd"
>  watch_daemons=3D"zebra"
> =20
> -# To enable restarts, uncomment this line (but first be sure to edit
> +# To enable restarts when multiple daemons are being used, uncomment thi=
s line (but first be sure to edit
>  # the WATCH_DAEMONS line to reflect the daemons you are actually using):
> -watch_options=3D"-z -b_ -r/etc/init.d/quagga_restart_%s -s/etc/init.d/qu=
agga_start_%s -k/etc/init.d/quagga_stop_%s"
> +#watch_options=3D"-Az -b_ -r/etc/init.d/quagga_restart_%s -s/etc/init.d/=
quagga_start_%s -k/etc/init.d/quagga_stop_%s"
> +
> +# Since we are using one quagga daemon for now, use the following line. =
If using
> +# multiple daemons, comment the line below and uncoment the line mention=
ed
> +# above.
> +watch_options=3D"-z -b_ -r/etc/init.d/quagga_restart_%s"
--=20
-Joe MacDonald.
:wq

--5oH/S/bF6lOfqCQb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKUyz0ACgkQwFvcllog0XzOJQCffncFwxx3dVkRk5YrPwJuMmAq
IugAoLBpIhFITTvpxm53WQ1Tr+Q/iFsS
=w4Ib
-----END PGP SIGNATURE-----

--5oH/S/bF6lOfqCQb--
