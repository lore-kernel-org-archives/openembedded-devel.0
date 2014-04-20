Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8FC2665D94
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 14:13:43 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so3068233eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 07:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nsCxz1s5LLazAEfcY57FBRhSvcZMXYqkf4PXhIYobj0=;
	b=tZZ0ytuWsKQrpZarpUXc3KXkTQduVnq5sh7ouqoqnL91o4DkqHgeISYEhQjfflpQoB
	EijfadCwBnePkCGOb1OJDKLm0lWwiH1GmeOAANZLxuzsKbBtixE976z0h2JZHDG/c2iS
	J6vqLcLodkmd3Z/WiE8kgL7L2PKqSxsTcLY6Bo6cItrfiKQsMtopaA53jM2OvxzFcSfQ
	8GzLbAHV+QwWWspyz9RSckB+MRwwt5pIwsHcqOHabkkNTakDRhAdcJR3YNhh9iJh9AUB
	BM8gbobFERqzgJGmLXnu4jsYBPz/ztKg0N5GSpNitX6lMMsDu2IQDcsOI3YY3bP/h0Nj
	Ld7w==
X-Received: by 10.15.64.75 with SMTP id n51mr39343045eex.33.1398003224562;
	Sun, 20 Apr 2014 07:13:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm94937137eee.2.2014.04.20.07.13.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 07:13:43 -0700 (PDT)
Date: Sun, 20 Apr 2014 16:13:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420141348.GN2486@jama>
References: <1397029758-23231-1-git-send-email-koen.kooi@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1397029758-23231-1-git-send-email-koen.kooi@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-filesystems][PATCH] sshfs-fuse: update to 2.5
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
X-List-Received-Date: Sun, 20 Apr 2014 14:13:46 -0000
X-Groupsio-MsgNum: 49351
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rHXT7wjifYJhd5Y1"
Content-Disposition: inline

--rHXT7wjifYJhd5Y1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2014 at 09:49:18AM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>

Merged, thanks

> ---
>  .../sshfs-fuse/{sshfs-fuse_2.4.bb =3D> sshfs-fuse_2.5.bb}              |=
 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_2.4.b=
b =3D> sshfs-fuse_2.5.bb} (76%)
>=20
> diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2=
=2E4.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb
> similarity index 76%
> rename from meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.=
4.bb
> rename to meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.=
bb
> index 2a5546e..722d0ed 100644
> --- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.4.bb
> +++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.5.bb
> @@ -13,6 +13,5 @@ inherit autotools
> =20
>  FILES_${PN} +=3D "${libdir}/sshnodelay.so"
> =20
> -SRC_URI[md5sum] =3D "3c7c3647c52ce84d09486f1da3a3ce24"
> -SRC_URI[sha256sum] =3D "3c93ba8522568093c94ff9c5a3763929380dd229365d9057=
69ff82475d774dd1"
> -
> +SRC_URI[md5sum] =3D "17494910db8383a366b1301e5f5148a9"
> +SRC_URI[sha256sum] =3D "e9171452e5d0150b9c6a2158fd2e2dcefb5d5d03ba4d2089=
49e00a3a46c6e63e"
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rHXT7wjifYJhd5Y1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNT1hwACgkQN1Ujt2V2gBxYTgCgjh4dqc20k85pyWwTZwRp35gG
mFMAni8fs56SwEE3AC29vR3OTjXVBZO1
=am4I
-----END PGP SIGNATURE-----

--rHXT7wjifYJhd5Y1--
