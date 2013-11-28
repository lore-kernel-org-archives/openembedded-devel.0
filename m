Return-Path: <joe@deserted.net>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5F6F86D3DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 15:56:00 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id i13so881160qae.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 07:55:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=2ndoHpt71etZ9rXWbicjBkb3SpnvAnAF/RvQReatDDg=;
	b=RbyyIBqmvjzzb3s99z+AcVVzr8ZmFGsoH3a9g3JjES3ZXRyMkl4bJy7qb1BSv34JHp
	sr3mKgIepFC38TD4wy9fELbxyHvZAwLoqhMqj5zHP4XWo5oPLaCCnanhiZcpfJyt2Qim
	bZyuzLfPmsK2NwrgzQ3fx4We0svWfaOErYC0CxvZi4HLEjegOMzCF0IhjOsihz3nDBXb
	AuHW7wJG66g3/HaXEEBi9uhlIRkR9k/7P3zmvPb/XpTwRakfKP/CNwa9aewIBBTxbwQy
	Dqde8n8woEpNx+Acp43lUixN7T9DifTaIwo9y27g/Mb22YQSTPHx6br2HeBbSTiR5QW+
	sM1A==
X-Gm-Message-State: ALoCoQn+V50fW2l+nmJD0zr4HYeYCwXupLMZ2TohJUCtI23Rd2eHsPwRF/DNffUCbZMKRsi6r4o4
X-Received: by 10.49.116.141 with SMTP id jw13mr77754802qeb.2.1385654159487;
	Thu, 28 Nov 2013 07:55:59 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id m7sm50123140qax.8.2013.11.28.07.55.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Nov 2013 07:55:58 -0800 (PST)
Date: Thu, 28 Nov 2013 10:55:55 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131128155553.GA3724@deserted.net>
References: <1385434452-4083-1-git-send-email-b40527@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1385434452-4083-1-git-send-email-b40527@freescale.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>, otavio.salvador@gmail.com
Subject: Re: [meta-oe][meta-networking][PATCH] tcpdump: move from meta-oe to meta-networking
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
X-List-Received-Date: Thu, 28 Nov 2013 15:56:01 -0000
X-Groupsio-MsgNum: 47301
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-oe][meta-networking][PATCH] tcpdump: move from meta-oe to meta-=
networking] On 13.11.26 (Tue 10:54) b40527@freescale.com wrote:

> From: Zongchun Yu <Zongchun.Yu@freescale.com>
>=20
> Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> ---
>  .../0001-minimal-IEEE802.15.4-allowed.patch        |    0
>  .../tcpdump/tcpdump-4.3.0/configure.patch          |    0
>  .../tcpdump/tcpdump-4.3.0/ipv6-cross.patch         |    0
>  .../tcpdump-4.3.0/tcpdump_configure_no_-O2.patch   |    0
>  .../recipes-support/tcpdump/tcpdump_4.3.0.bb       |    0
>  .../packagegroups/packagegroup-cli-tools.bb        |    1 -
>  6 files changed, 0 insertions(+), 1 deletions(-)
>  rename {meta-oe =3D> meta-networking}/recipes-support/tcpdump/tcpdump-4.=
3.0/0001-minimal-IEEE802.15.4-allowed.patch (100%)
>  rename {meta-oe =3D> meta-networking}/recipes-support/tcpdump/tcpdump-4.=
3.0/configure.patch (100%)
>  rename {meta-oe =3D> meta-networking}/recipes-support/tcpdump/tcpdump-4.=
3.0/ipv6-cross.patch (100%)
>  rename {meta-oe =3D> meta-networking}/recipes-support/tcpdump/tcpdump-4.=
3.0/tcpdump_configure_no_-O2.patch (100%)
>  rename {meta-oe =3D> meta-networking}/recipes-support/tcpdump/tcpdump_4.=
3.0.bb (100%)
>=20
> diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-I=
EEE802.15.4-allowed.patch b/meta-networking/recipes-support/tcpdump/tcpdump=
-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch
> similarity index 100%
> rename from meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IE=
EE802.15.4-allowed.patch
> rename to meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/0001-mini=
mal-IEEE802.15.4-allowed.patch
> diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/configure.patc=
h b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch
> similarity index 100%
> rename from meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch
> rename to meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/configure=
=2Epatch
> diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.pat=
ch b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch
> similarity index 100%
> rename from meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch
> rename to meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cros=
s.patch
> diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_config=
ure_no_-O2.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/tc=
pdump_configure_no_-O2.patch
> similarity index 100%
> rename from meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configu=
re_no_-O2.patch
> rename to meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_c=
onfigure_no_-O2.patch
> diff --git a/meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb b/meta-netw=
orking/recipes-support/tcpdump/tcpdump_4.3.0.bb
> similarity index 100%
> rename from meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb
> rename to meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb=
 b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
> index fa53a67..8807fd1 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
> @@ -45,7 +45,6 @@ RDEPENDS_${PN}-debug =3D "\
>      s3c64xx-gpio \
>      serial-forward \
>      strace \
> -    tcpdump \
>  "
> =20
>  RRECOMMENDS_${PN}-debug =3D "\
--=20
-Joe MacDonald.
:wq

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKXZ38ACgkQwFvcllog0Xza1ACdGRAIP8hS/4NLt7K8FVsvxhwB
+1sAmwe5ibYWrIRH22G29HvS9QihRhDZ
=440C
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
