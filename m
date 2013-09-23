Return-Path: <joe@deserted.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4B011610DB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 14:00:23 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so1748810eei.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 07:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=ChAKWMozetoRtzzlGPWsh7D2mAwep7GHl1dpeL5sv6U=;
	b=FicqI3mshqF1ul+cRmr84PZ3MvbMTD3p8jBImBhVo4suHwpGRnyPESoAKjsjbZzMcU
	ubtM6mBxxCPPEStURBpH1crS4b9FZ4LbvFIUXvAPQjYOnLA+352KjzUeMOd0KMuBVpfH
	EXvrNB1Yqd8DAPangur9npaDij+xbFP+oxvHMw0wc9UQjh5JvUmAF22cz45gIyjXsm43
	DhdtQM/B6HMYzdxbbgzH51r34wUDQg8nUiXKvffAzyM4m0ytcHZDuuswvDlF1mOUUPzL
	3tVYDu1wyQcD9UJef3DXBH7REaSlX/ijh5Z0G9Z812iwM5nBooKqZ9Bls+Ld9w5NoTlO
	DU3Q==
X-Gm-Message-State: ALoCoQk7p6RC0YdSwJKWnqBmhPotkG3C9DcZqJdVuG1XJ4JNdQlaKPkSIUYQpe/22b4o4Zcpeqqw
X-Received: by 10.15.54.199 with SMTP id t47mr4684490eew.46.1379944821842;
	Mon, 23 Sep 2013 07:00:21 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id d8sm42358846eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 23 Sep 2013 07:00:21 -0700 (PDT)
Date: Mon, 23 Sep 2013 10:00:15 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130923135948.GD4025@deserted.net>
References: <1379928661-9188-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1379928661-9188-1-git-send-email-Qi.Chen@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] quagga: fix babeld_option
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
X-List-Received-Date: Mon, 23 Sep 2013 14:00:24 -0000
X-Groupsio-MsgNum: 46299
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IMjqdzrDRly81ofr"
Content-Disposition: inline

--IMjqdzrDRly81ofr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged.  Please ensure these are tagged with [meta-networking] in the
subject.

Thanks,
-J.

[[oe] [PATCH] quagga: fix babeld_option] On 13.09.23 (Mon 17:31) Qi.Chen@wi=
ndriver.com wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> Fix babeld_option to make babeld start correctly.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../recipes-protocols/quagga/files/quagga.default  |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-protocols/quagga/files/quagga.defaul=
t b/meta-networking/recipes-protocols/quagga/files/quagga.default
> index 438c3b6..0c1ce6c 100644
> --- a/meta-networking/recipes-protocols/quagga/files/quagga.default
> +++ b/meta-networking/recipes-protocols/quagga/files/quagga.default
> @@ -4,7 +4,7 @@ vtysh_enable=3Dyes
> =20
>  # Bind all daemons to loopback only by default
>  zebra_options=3D" --daemon -A 127.0.0.1"
> -babeld_options=3D"-D 127.0.0.1"
> +babeld_options=3D"--daemon -A 127.0.0.1"
>  bgpd_options=3D"  --daemon -A 127.0.0.1"
>  ospfd_options=3D" --daemon -A 127.0.0.1"
>  ospf6d_options=3D"--daemon -A ::1"
--=20
-Joe MacDonald.
:wq

--IMjqdzrDRly81ofr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJASUsACgkQwFvcllog0XyW8gCfRjWLAgdAVUzxV2dpcZUhzEIq
Sx4AoKgIv2AchMu2UouMlo0RosLNmeJj
=oy4d
-----END PGP SIGNATURE-----

--IMjqdzrDRly81ofr--
