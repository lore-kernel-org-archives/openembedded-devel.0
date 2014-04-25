Return-Path: <joe@deserted.net>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0A37B65D05
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 01:03:32 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id to1so3179611ieb.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 18:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=++xEVgGAT1mv5KuGXonaKH8kJaddQzzOcaaRMypptPk=;
	b=hMIu152it9qKYVcn4qAJ3Rdha+cUwW41aWBSi1myODiRsecUd9flQ1sCB8VlbLI0Th
	P0bv/XzRrv3cvUcN9JPxdZUdvualAFIZ9LjjNC/RTRV+AY9QgrNOMl7wahO+0JVbckED
	DXCum7IhiX1HmPx++CchY3v+7xGqfEWI5xzHUTVvO4MoK3fJEuHCYjPObJF95L0I+bpr
	KYLzY0wpmIM5B0GzLVL9tzOZdTX6lW0Jft8lcPctegVXIRUbRVMk0s1zauwgkSP4KuEj
	Gyb2u4CBIXeXvE9JfsUzgTgy4eVSGQUR73XNSpbYqEbkaP1XkXCESSqfvxKO5fxV/sk3
	qJOQ==
X-Gm-Message-State: ALoCoQmbSYaFblis8lZ2yfprxAmlaYWnHZ+7Ls70ODQhXWzLUnemhdRTQick7/P14r0MvUzgIC86
X-Received: by 10.50.112.167 with SMTP id ir7mr2003493igb.27.1398387814119;
	Thu, 24 Apr 2014 18:03:34 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	lp5sm3699811igb.1.2014.04.24.18.03.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Apr 2014 18:03:32 -0700 (PDT)
Date: Thu, 24 Apr 2014 21:03:30 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425010328.GI10115@deserted.net>
References: <1397034884-36008-1-git-send-email-Christian.Ziethen@enea.com>
MIME-Version: 1.0
In-Reply-To: <1397034884-36008-1-git-send-email-Christian.Ziethen@enea.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH v4] dnsmasq: update to 2.68
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
X-List-Received-Date: Fri, 25 Apr 2014 01:03:39 -0000
X-Groupsio-MsgNum: 49473
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e5GLnnZ8mDMEwH4V"
Content-Disposition: inline

--e5GLnnZ8mDMEwH4V
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH v4] dnsmasq: update to 2.68] On 14.04.09 (Wed=
 11:14) Christian Zieth=E9n wrote:

> Fixes a bug with libvirt and DHCP, which is fixed in 2.66.
>=20
> "Handle the situation where libc headers define
> SO_REUSEPORT, but the kernel in use doesn't, to cope with
> the introduction of this option to Linux. Thanks to Rich
> Felker for the bug report."
>=20
> Signed-off-by: Christian Zieth=E9n <Christian.Ziethen@enea.com>
> ---
>  meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb |    4 ----
>  meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb |    4 ++++
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.=
bb
>  create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.=
bb
>=20
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb
> deleted file mode 100644
> index 2df3713..0000000
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require dnsmasq.inc
> -
> -SRC_URI[dnsmasq-2.63.md5sum] =3D "43e771997615ebcd8f6c6ffa60c3e40b"
> -SRC_URI[dnsmasq-2.63.sha256sum] =3D "fd86e3bcc6a63c76e35e4a20baa790e7bbb=
fc7b43845cae85ca8ffd024467710"
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
> new file mode 100644
> index 0000000..b1bef7a
> --- /dev/null
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
> @@ -0,0 +1,4 @@
> +require dnsmasq.inc
> +
> +SRC_URI[dnsmasq-2.68.md5sum] =3D "6f8351ca0901f248efdb81532778d2ef"
> +SRC_URI[dnsmasq-2.68.sha256sum] =3D "402019d61f53f1ccc04cc6218719fd3b158=
ea3fca9a83ab55471f981a2097c2f"
> --=20
> 1.7.10.4
>=20
--=20
-Joe MacDonald.
:wq

--e5GLnnZ8mDMEwH4V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlNZtGAACgkQwFvcllog0XxsHgCgjnoTESGeG+cuObsYm9c6MLb4
p18An2cf+WjdyOvhgS8SGQh9aFfZNgAi
=IJ/k
-----END PGP SIGNATURE-----

--e5GLnnZ8mDMEwH4V--
