Return-Path: <joe@deserted.net>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 152DC6BA14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 16:31:09 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id y10so4103214wgg.32
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=yiIxcXZabkCDfeJmfeVFozxXZslFDx7WFlhBBV/tvi8=;
	b=gpaSrJFcRyxWfK42YMhFx3BX+NmRWdOj82ytWKF0aPnMsXazcioOTvEPaD2WNyOYz5
	9hZgTgWIShr+XaCq1wGQ7rsdT/vAipQ+B1Oo56DORNXIkWTBnNDCzh/ydYo7I8J+t6Ia
	bytTxZrW4Dk0Kq/tFt8vw0dfU8rqiYJdtY/gK+j9KR6voe3++V8SlibwK79LNUKT5hzH
	t/d9RCCi9IFvBWZrCPU716DJvumabmanxSWSIxqMkl0mYWaJuSwXPV15BLuFnUBBsaNB
	xBYFnbxPCDp0FXnCNJ/z5itSFAisAT/yqtGa4m1v06XgPbJPcgvfRC2FMIecJv97TUMk
	8LMQ==
X-Gm-Message-State: ALoCoQl666TbyLK6He8MhUMDlwf6bBGDe2fLoQJs3YZManh8RHaXBFsWh9ByZt4JRVrAFa6/eEJA
X-Received: by 10.180.105.36 with SMTP id gj4mr191125wib.14.1382113871632;
	Fri, 18 Oct 2013 09:31:11 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id e1sm28514536wij.6.2013.10.18.09.31.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Oct 2013 09:31:10 -0700 (PDT)
Date: Fri, 18 Oct 2013 12:31:06 -0400
From: Joe MacDonald <joe@deserted.net>
To: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <20131018163105.GC2456@deserted.net>
References: <1382009891-6444-1-git-send-email-obi@opendreambox.org>
	<1382010314-6720-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1382010314-6720-1-git-send-email-obi@opendreambox.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2 1/2] autofs: pass systemd directory to configure
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
X-List-Received-Date: Fri, 18 Oct 2013 16:31:11 -0000
X-Groupsio-MsgNum: 46810
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Content-Disposition: inline

--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH v2 1/2] autofs: pass systemd directory to con=
figure] On 13.10.17 (Thu 13:45) Andreas Oberritter wrote:

> Otherwise, configure will try to auto-detect using host paths.
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/met=
a-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> index 0c66ebc..905be40 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> @@ -85,6 +85,7 @@ EXTRA_OECONF +=3D "--disable-mount-locking \
>  "
>  CACHED_CONFIGUREVARS =3D "ac_cv_path_RANLIB=3D${RANLIB} \
>                          ac_cv_path_RPCGEN=3Drpcgen \
> +                        systemddir=3D${systemd_unitdir}/system \
>  "
> =20
>  do_configure_prepend () {
--=20
-Joe MacDonald.
:wq

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJhYkkACgkQwFvcllog0XyAOACePA/bZQOajWMyM8Wb11MQP7ZR
IZIAn3Q38jT6/KvNaTWACAmCSx9LLO0a
=TX7c
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--
