Return-Path: <joe@deserted.net>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 905A56BA14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 16:34:51 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id y10so4035280wgg.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=nEqjNGV1hSVeGyp//YPqEr/caRZGKGXaBt7jvt9mrlA=;
	b=XPKsBlAWEG7vS8N0EG1/lb+jrQ8U/Cty3Bh4gUsjNe/eeTlcMisuo0A3wt0RziA92M
	5dk1G8/fp/keOs/wzRxFWjy5uafnILJj2mplRjujWbbQU3RZjMGE2MmdODsjx4SZ2ARm
	PNkQaKT+hiqIqTUOiOcM5tB1cnw8PuLJFalYCHkSHSFlxvALI2b5HTIDwOh+x5Ix8+CU
	5uyA2w2187krtnWWl+mJ63mBh2G949bxW1adq6yDkmpAZsXxt6Nwy7cZ87+dh6r0/Lsf
	K9XSrvWliFQGmRNaN1GplJ1YXQhJBPRChHT/cEQc9V9ZjfvxgFDxR11n09x3Hk7q86gS
	+YJw==
X-Gm-Message-State: ALoCoQmmRSFYv4lIch545E63iRhE7GWKMNigSLfmW5iCMFhbkWVfZBBeD8RXF4fWN+SpeezlcKbk
X-Received: by 10.180.187.236 with SMTP id fv12mr192287wic.20.1382114093178;
	Fri, 18 Oct 2013 09:34:53 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id gp9sm28544006wib.8.2013.10.18.09.34.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Oct 2013 09:34:52 -0700 (PDT)
Date: Fri, 18 Oct 2013 12:34:47 -0400
From: Joe MacDonald <joe@deserted.net>
To: David Turgeon <david.turgeon@gmail.com>
Message-ID: <20131018163445.GE2456@deserted.net>
References: <1381586640-32671-1-git-send-email-david.turgeon@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1381586640-32671-1-git-send-email-david.turgeon@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] tftpd-hpa: fix premature exit
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
X-List-Received-Date: Fri, 18 Oct 2013 16:34:52 -0000
X-Groupsio-MsgNum: 46812
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9crTWz/Z+Zyzu20v"
Content-Disposition: inline

--9crTWz/Z+Zyzu20v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.

-J.

[[oe] [meta-oe][PATCH] tftpd-hpa: fix premature exit] On 13.10.12 (Sat 10:0=
4) David Turgeon wrote:

> standalone daemon exits as recipe installs file as tftpd-hpa
>=20
> * Changed script so it can consult /etc/default, as daemon name may be
>  subject to change.
> * Changed the default name to match the recipe
>=20
> Signed-off-by: David Turgeon <david.turgeon@gmail.com>
> ---
>  .../recipes-daemons/tftp-hpa/files/init            |   13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/init b/meta-n=
etworking/recipes-daemons/tftp-hpa/files/init
> index 5ad8c52..9e18436 100644
> --- a/meta-networking/recipes-daemons/tftp-hpa/files/init
> +++ b/meta-networking/recipes-daemons/tftp-hpa/files/init
> @@ -18,20 +18,21 @@ set -e
> =20
>  PATH=3D/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
>  DESC=3D"HPA's tftpd"
> -NAME=3Din.tftpd
> -DAEMON=3D/usr/sbin/$NAME
> -PIDFILE=3D/var/run/$NAME.pid
> +NAME=3Din.tftpd-hpa
>  SCRIPTNAME=3D/etc/init.d/tftpd-hpa
> =20
> -# Gracefully exit if the package has been removed.
> -test -x $DAEMON || exit 0
> -
>  # Read config file if it is present.
>  if [ -r /etc/default/tftpd-hpa ]
>  then
>  	. /etc/default/tftpd-hpa
>  fi
> =20
> +DAEMON=3D/usr/sbin/$NAME
> +PIDFILE=3D/var/run/$NAME.pid
> +
> +# Gracefully exit if the package has been removed.
> +test -x $DAEMON || exit 0
> +
>  if [ "$RUN_DAEMON" !=3D "yes" ] ; then
>           echo "tftpd-hpa disabled in /etc/default/tftpd-hpa"
>  	 exit 0
--=20
-Joe MacDonald.
:wq

--9crTWz/Z+Zyzu20v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJhYyUACgkQwFvcllog0XxR9wCeNfbzht9yg9iqsCcdi2GdcBEC
iYgAnjZ5kBJgcQHESP5tZEiGEm3Zi25Y
=m6mN
-----END PGP SIGNATURE-----

--9crTWz/Z+Zyzu20v--
