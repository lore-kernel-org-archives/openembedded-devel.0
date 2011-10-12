Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDsGD-0001Qr-MJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 08:25:49 +0200
Received: by eyd9 with SMTP id 9so383415eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 23:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6rgVuBvyFDKvmyaqkjAlre1mTkNjbQTeVNf9jz3Zeco=;
	b=qCsOBq8YjZ9eBzhs4fhjc9csey358JQQeB1ghbddRTGnz8iEUVFkzjg5XeI6yoW87S
	erzoEZ69aDM+vvbneuq+XgDwAXZEvXrxAxfVuB99vvf9CG5yBrplsNn/rQs8Nexs1byc
	lX5O3RcgWCMuDLUJO4w8CVdkt7pFMWJu3T7XI=
Received: by 10.223.85.139 with SMTP id o11mr44749380fal.0.1318400407434;
	Tue, 11 Oct 2011 23:20:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b10sm1947148fam.1.2011.10.11.23.20.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 23:20:02 -0700 (PDT)
Date: Wed, 12 Oct 2011 08:19:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111012061955.GI27073@jama.jama.net>
References: <1318384722-17530-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1318384722-17530-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-openmoko][PATCH] mesa-dri: Move mesa-dri_7.11.bbappend -> mesa-dri_7.10.2.bbappend
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
X-List-Received-Date: Wed, 12 Oct 2011 06:25:49 -0000
X-Groupsio-MsgNum: 34659
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KrHCbChajFcK0yQE"
Content-Disposition: inline

--KrHCbChajFcK0yQE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2011 at 06:58:42PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

This also depends on:
http://patches.openembedded.org/patch/12933/
and removing won't work, because glamo.patch wont apply to 7.10.2 (at
least old patch from 7.10.2 didn't apply to 7.11 and also could not
build and I had to upgrade it first..).

Regards,

> ---
>  ...-dri_7.11.bbappend =3D> mesa-dri_7.10.2.bbappend} |    0
>  1 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openmoko/recipes-graphics/mesa/{mesa-dri_7.11.bbappend =3D> =
mesa-dri_7.10.2.bbappend} (100%)
>=20
> diff --git a/meta-openmoko/recipes-graphics/mesa/mesa-dri_7.11.bbappend b=
/meta-openmoko/recipes-graphics/mesa/mesa-dri_7.10.2.bbappend
> similarity index 100%
> rename from meta-openmoko/recipes-graphics/mesa/mesa-dri_7.11.bbappend
> rename to meta-openmoko/recipes-graphics/mesa/mesa-dri_7.10.2.bbappend
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KrHCbChajFcK0yQE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6VMYsACgkQN1Ujt2V2gBzUcACfQJI5dN+uSAWjfrw2/keX1Eoz
JdEAnik7onVAMtcyi8yPCqwCM3OjFdjQ
=GJv8
-----END PGP SIGNATURE-----

--KrHCbChajFcK0yQE--
