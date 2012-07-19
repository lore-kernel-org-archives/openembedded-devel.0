Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srnkv-0000tU-U0
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 12:14:49 +0200
Received: by bkcik5 with SMTP id ik5so1835331bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 03:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ooO7S+t4EU/4qj6Qq/UrLKCj8mOHzRJt1xorkzIrYcE=;
	b=ImjXpe6hU7ccJSIVXUAi1fBz7D3yoNf4by8eZPOWjfcxYakPXHBah0ONGlNW5cX/dB
	7T+DQ647ibxkFo0Kt8L1Qxe99PUN6t2gByofECHQHSF8tbxW/7FXQLqs7xYkMTI/8ZUm
	JCmUgyeA8uFbb+N/FPxuAq4ySaFwS6v+18qZNhD0CUX4BoBiunDgSU7GmF3Ebe0Lgois
	XT440gh1h6yMv2Ibrzpe7ZCSGDvlSrjMbQSRCR4CA1JIeE/nSfQTVSZklToSttYiFra+
	B4twlmPM6tdLfDpDqFpipwigb+cq4ymnByOB014TguSN5xXlpvzo7mZxI3dEROxquDsS
	jMSw==
Received: by 10.204.157.18 with SMTP id z18mr557417bkw.16.1342692208339;
	Thu, 19 Jul 2012 03:03:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t23sm746508bks.4.2012.07.19.03.03.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 03:03:27 -0700 (PDT)
Date: Thu, 19 Jul 2012 12:03:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120719100338.GG3331@jama.jama.net>
References: <1342691767-3992-1-git-send-email-mertsas@cisco.com>
MIME-Version: 1.0
In-Reply-To: <1342691767-3992-1-git-send-email-mertsas@cisco.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Martin Ertsaas <mertsas@cisco.com>
Subject: Re: [PATCH] Remove the - between ${TARGET_PREFIX} and ar/nm for the env script, as this will make autotools look for arm-none-linux-gnueabi--ar instead of arm-none-linux-gnueabi-ar.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2012 10:14:50 -0000
X-Groupsio-MsgNum: 39775
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L1c6L/cjZjI9d0Eq"
Content-Disposition: inline

--L1c6L/cjZjI9d0Eq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 19, 2012 at 11:56:07AM +0200, Martin Ertsaas wrote:
> Signed-off-by: Martin Ertsaas <mertsas@cisco.com>

This belongs to oe-core ML

> ---
>  meta/classes/toolchain-scripts.bbclass |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolch=
ain-scripts.bbclass
> index bf37ec9..8f7c644 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -68,8 +68,8 @@ toolchain_create_tree_env_script () {
>  	echo 'export RANLIB=3D${TARGET_PREFIX}ranlib' >> $script
>  	echo 'export OBJCOPY=3D${TARGET_PREFIX}objcopy' >> $script
>  	echo 'export OBJDUMP=3D${TARGET_PREFIX}objdump' >> $script
> -	echo 'export AR=3D${TARGET_PREFIX}-ar' >> $script
> -	echo 'export NM=3D${TARGET_PREFIX}-nm' >> $script
> +	echo 'export AR=3D${TARGET_PREFIX}ar' >> $script
> +	echo 'export NM=3D${TARGET_PREFIX}nm' >> $script
>  	echo 'export TARGET_PREFIX=3D${TARGET_PREFIX}' >> $script
>  	echo 'export CONFIGURE_FLAGS=3D"--target=3D${TARGET_SYS} --host=3D${TAR=
GET_SYS} --build=3D${BUILD_SYS} --with-libtool-sysroot=3D${STAGING_DIR_TARG=
ET}"' >> $script
>  	if [ "${TARGET_OS}" =3D "darwin8" ]; then
> --=20
> 1.7.8.6
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L1c6L/cjZjI9d0Eq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAH23oACgkQN1Ujt2V2gBxCEwCghQ2lIZCMEYJvJjoIgSdr+8bt
UbsAn2BCIl20wTz3sbSZQvbPrw88C5iq
=lcq/
-----END PGP SIGNATURE-----

--L1c6L/cjZjI9d0Eq--
