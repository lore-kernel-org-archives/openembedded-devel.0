Return-Path: <joe@deserted.net>
Received: from mail-qe0-f45.google.com (mail-qe0-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1417E6CC68
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 19:50:03 +0000 (UTC)
Received: by mail-qe0-f45.google.com with SMTP id 8so1773795qea.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 12:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=GNc93Ry14aOz+ZKsDxmgzGvQI1dWynJc0jxxTiZZJSs=;
	b=HkAVhs3D0i7hiPaI5F+Xkqp6ECiXcIcucVstcrJQuq7GkglMQd5YbT2tc1lQtxoRSA
	0DsN3Kf8Ro7MFZQTJINCJzNrIVYLLRz0iIx+dPmfewXaWLQq/e6IG9UF2jZR2qEn3tTa
	apdaSBxAdsZnstpAXabrTJrFNr1EevLfN36NgcrVwU4omw1wfMK6Kzr4z9TcSEUNyMad
	87cCcLLSDiyroxdSJrjHF7ifWVAFMEeYwMPkps6Vwja8D71+4lWdHWNAkAbBPD3xqFyP
	v57wkbFwrkNe41ks8zg7HIW+Nbfo9T0eSLYEatyJQ0Tyutc/BvvFf1iZ+vK6W6DdZ7HB
	fIXA==
X-Gm-Message-State: ALoCoQkluOMD8IvkferKjvMGPgEb485kh+XjFYuMBCOdMrE4bMaCA9VfbSOVsrFnlKawGuV4kYi5
X-Received: by 10.224.4.133 with SMTP id 5mr6367591qar.73.1382644205851;
	Thu, 24 Oct 2013 12:50:05 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id jw9sm5829805qeb.2.2013.10.24.12.50.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Oct 2013 12:50:05 -0700 (PDT)
Date: Thu, 24 Oct 2013 15:50:03 -0400
From: Joe MacDonald <joe@deserted.net>
To: Qi.Chen@windriver.com
Message-ID: <20131024195001.GE3984@deserted.net>
References: <1382590059-20109-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1382590059-20109-1-git-send-email-Qi.Chen@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] autofs: fix do_install failure and remove unused /var/run directory
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
X-List-Received-Date: Thu, 24 Oct 2013 19:50:04 -0000
X-Groupsio-MsgNum: 46871
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VACxsDaSTfeluoxK"
Content-Disposition: inline

--VACxsDaSTfeluoxK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe][meta-networking][PATCH] autofs: fix do_install failure and remove unu=
sed /var/run directory] On 13.10.24 (Thu 12:47) Qi.Chen@windriver.com wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> If ${D}/run doesn't exist, the following statement will have non-zero
> exit code, which leads to do_install failure.
>      test -d ${D}/run && rmdir ${D}/run
>=20
> Modify it to use the if statement to make the do_install task succeed
> no matter ${D}/run exists or not.
>=20
> Also, this patch removes the unused /var/run directory. Leaving that
> directory there will result in /run directory created before splitting
> package, which in turn lead to 'installed-vs-shipped' QA error or QA
> warning.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../recipes-daemons/autofs/autofs_5.0.7.bb         |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/met=
a-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> index f8df0ef..c4eea31 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> @@ -96,7 +96,12 @@ do_configure_prepend () {
>  }
> =20
>  do_install_append () {
> -    test -d ${D}/run && rmdir ${D}/run
> +    if [ -d ${D}/run ]; then
> +	rmdir ${D}/run
> +    fi
> +    if [ -d ${D}${localstatedir}/run ]; then
> +	rmdir ${D}${localstatedir}/run
> +    fi
>  }
> =20
>  INSANE_SKIP_${PN} =3D "dev-so"
--=20
-Joe MacDonald.
:wq

--VACxsDaSTfeluoxK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJpeekACgkQwFvcllog0Xz9OACfatqgZRbqPwCnSGdM2vVF/8Y/
FGwAnRoZqZeclpuxxRXSAWr9wZqkCyN6
=KxVe
-----END PGP SIGNATURE-----

--VACxsDaSTfeluoxK--
