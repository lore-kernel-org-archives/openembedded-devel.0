Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RvWYD-0007IG-HR
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 17:08:49 +0100
Received: by eaal10 with SMTP id l10so507334eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 08:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zs2YrfOruRQDTT9vU0ulM+iqNpISlyEphxjXa1W2u8k=;
	b=B5E4YdsrtpEaw8CE+hFknwCPUDlL6egVDQ1HSnUhVrP/wKSaV9aMTUEawhj4k7Wq3Q
	Lw4ZfmduxBItC8vtm/Dl2Pzr4IOXJs3rIx2SSoCLqJt1cYoK8hJRBn8erAJyBMoXlprE
	atfVYqeZTChYU8ZBCCCdAIgF0ofKGOHHKO8k0=
Received: by 10.213.33.142 with SMTP id h14mr486736ebd.43.1328803244763;
	Thu, 09 Feb 2012 08:00:44 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm11006489eeb.8.2012.02.09.08.00.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 08:00:43 -0800 (PST)
Date: Thu, 9 Feb 2012 17:00:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120209160041.GC10322@jama.jama.net>
References: <cover.1328648257.git.otavio@ossystems.com.br>
	<1cd08c798a7b335ba66ed186d6fbd3b4002d2f8a.1328648257.git.otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1cd08c798a7b335ba66ed186d6fbd3b4002d2f8a.1328648257.git.otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-oe 3/3] polkit: depends on systemd
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
X-List-Received-Date: Thu, 09 Feb 2012 16:08:49 -0000
X-Groupsio-MsgNum: 37049
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Content-Disposition: inline

--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2012 at 08:58:24PM +0000, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Can you please change it to something like:

SESSION_EXTRA_DEPENDS =3D "systemd"
SESSION_EXTRA_OECONF =3D "--enable-systemd"

DEPENDS +=3D "${SESSION_EXTRA_DEPENDS}"
EXTRA_OECONF +=3D "${SESSION_EXTRA_OECONF}"

PRINC :=3D "${@int(PRINC) + 1}"

So it's clear that systemd will always be enabled and still easy to override
both with .bbappend?

With library split from:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-February/03782=
8.html
it won't be so big problem as described here:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-January/037597=
=2Ehtml
but still better to make it easy to change this in some upper layer

Cheers,

> ---
>  .../recipes-extended/polkit/polkit_0.104.bbappend  |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
>=20
> diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend b/meta=
-oe/recipes-extended/polkit/polkit_0.104.bbappend
> new file mode 100644
> index 0000000..3c43970
> --- /dev/null
> +++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> @@ -0,0 +1,3 @@
> +DEPENDS +=3D "systemd"
> +
> +PRINC =3D "1"
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8z7akACgkQN1Ujt2V2gByHSgCgocZFqsK3JLLbn2DNQYsKi8pd
pVoAnAscsBv7fKz9bDdlJgfTzazpubZP
=Elm5
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
