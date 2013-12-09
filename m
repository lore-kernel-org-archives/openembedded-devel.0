Return-Path: <joe@deserted.net>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0928F6DF3A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2013 21:18:47 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so1860683eaj.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2013 13:18:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=UpVTvLlj6Qg6VX4nHp94R8JKJxiozK9aZRdmqQqsKSw=;
	b=i014pEIZZLtotcPwlymtbaaGNaibXiCCJJOBUvxuzC7nfNnqQab2wKVFslzxq8z/CJ
	CfMzgGM6iYIuWPu5aATPzG3UaI/KpaaYtpsVRkKsLQFTvjYjidxKlp81UJWHWE8QpkJq
	FdSOdLX+M4EtZOR0vSA80SvqMY2xLd627iRHw1ESwb7FsC7JM+REZolg6f9K92YtmB9K
	J0NhstbgQsL7m4y9uqitUj2KXuSszHPB4VOxwxxxgTeSEqvOQJ540AgQYK1UudvH7C0x
	BC3gjoDagnFzbjbKmpAc/KDmDf1u599gW4WMSUib6M6KpCV86afKhkiRAyfOTl9C819A
	M0hg==
X-Gm-Message-State: ALoCoQmLCjKZtyzYu9tTDaAcm5iwuVWb+ercRESfSUlhopjjcR+bn/jiIfXKd4ifY1l9vm4bwOSr
X-Received: by 10.15.108.73 with SMTP id cc49mr4826862eeb.93.1386623927050;
	Mon, 09 Dec 2013 13:18:47 -0800 (PST)
Received: from deserted.net ([128.224.252.2]) by mx.google.com with ESMTPSA id
	o47sm33248968eem.21.2013.12.09.13.18.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 09 Dec 2013 13:18:45 -0800 (PST)
Date: Mon, 9 Dec 2013 16:18:41 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131209211839.GA4504@deserted.net>
References: <1386318856-1566-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1386318856-1566-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH meta-networking v2] proftpd: use /bin/false as the login shell and add home-dir
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
X-List-Received-Date: Mon, 09 Dec 2013 21:18:48 -0000
X-Groupsio-MsgNum: 47419
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [PATCH meta-networking v2] proftpd: use /bin/false as the login shell=
 and add home-dir] On 13.12.06 (Fri 16:34) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> Use /bin/false as the login shell, just like what Ubuntu does,
> otherwise there might be secure issue; add /var/lib/ftp as user
> ftp home-dir.
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../files/close-RequireValidShell-check.patch      |   27 ++++++++++++++=
++++++
>  .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |    4 ++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-daemons/proftpd/files/close-R=
equireValidShell-check.patch
>=20
> diff --git a/meta-networking/recipes-daemons/proftpd/files/close-RequireV=
alidShell-check.patch b/meta-networking/recipes-daemons/proftpd/files/close=
-RequireValidShell-check.patch
> new file mode 100644
> index 0000000..cb73c2d
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/proftpd/files/close-RequireValidShe=
ll-check.patch
> @@ -0,0 +1,27 @@
> +close RequireValidShell check
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +close RequireValidShell check since we like to make /bin/false as shell
> +for ftp user
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + sample-configurations/basic.conf |    1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/sample-configurations/basic.conf b/sample-configurations/ba=
sic.conf
> +index 314eb79..abcb284 100644
> +--- a/sample-configurations/basic.conf
> ++++ b/sample-configurations/basic.conf
> +@@ -53,6 +53,7 @@ AllowOverwrite		on
> +   # We want clients to be able to login with "anonymous" as well as "ft=
p"
> +   UserAlias			anonymous ftp
> +=20
> ++  RequireValidShell	 	off=09
> +   # Limit the maximum number of anonymous logins
> +   MaxClients			10
> +=20
> +--=20
> +1.7.10.4
> +
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/=
meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> index 6537b77..eb502d6 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D "ftp://ftp.proftpd.org/distrib/source/${BPN=
}-${PV}.tar.gz \
>             file://proftpd-basic.init \
>             file://default \
>             file://move-pidfile-to-var-run.patch \
> +           file://close-RequireValidShell-check.patch \
>  "
> =20
>  SRC_URI[md5sum] =3D "0871e0b93c9c3c88ca950b6d9a04aed2"
> @@ -62,6 +63,7 @@ INITSCRIPT_PARAM =3D "defaults 85 15"
> =20
>  USERADD_PACKAGES =3D "${PN}"
>  GROUPADD_PARAM_${PN} =3D "--system ${FTPGROUP}"
> -USERADD_PARAM_${PN} =3D "--system -g ${FTPGROUP} ${FTPUSER}"
> +USERADD_PARAM_${PN} =3D "--system -g ${FTPGROUP} --home-dir /var/lib/${F=
TPUSER} --no-create-home \
> +                       --shell /bin/false ${FTPUSER}"
> =20
>  FILES_${PN} +=3D "/home/${FTPUSER}"
--=20
-Joe MacDonald.
:wq

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKmM6MACgkQwFvcllog0Xx8kwCgjRoxh6wkJIKTHNgmCEDFS5rG
m6cAnRFs3nAPa6EdXK3CCI7XsX4LplGF
=1yif
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
