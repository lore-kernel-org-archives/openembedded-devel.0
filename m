Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RyWUw-0007dq-Po
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 23:41:50 +0100
Received: by eaal10 with SMTP id l10so1286789eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 14:33:36 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.119.194 as permitted sender) client-ip=10.14.119.194; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.119.194 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.119.194])
	by 10.14.119.194 with SMTP id n42mr3878594eeh.113.1329518016431
	(num_hops = 1); Fri, 17 Feb 2012 14:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AlRjYDdB9I1AWaUo1fY42uOpxdEhvi9e4ZgeIDfbCME=;
	b=R8sMJHjKLD0ixEockNFy8UGpKKTktoakgnVBjnOGY+DhXW+7OmxTyg9DkgcCaEqYVT
	FxIUbuRKhYxmVbG20R5qpizJwTPLsRFZ+Ee/qyvCky3gW2gA7aLIxRZSCi+cyVELIVv/
	CRiyafiqn9hmO3yCh8nHRU9RTyD3zCXgk0amQ=
Received: by 10.14.119.194 with SMTP id n42mr3115830eeh.113.1329518015964;
	Fri, 17 Feb 2012 14:33:35 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w60sm43659352eeb.4.2012.02.17.14.33.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 14:33:35 -0800 (PST)
Date: Fri, 17 Feb 2012 23:33:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120217223333.GL5822@jama.jama.net>
References: <cover.1329500479.git.otavio@ossystems.com.br>
	<ec40b0cf0436738ab76988ab5d41618a72c4d3c4.1329500480.git.otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <ec40b0cf0436738ab76988ab5d41618a72c4d3c4.1329500480.git.otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-oe 3/7] polkit: depends on systemd
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
X-List-Received-Date: Fri, 17 Feb 2012 22:41:50 -0000
X-Groupsio-MsgNum: 37220
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sMZCuqyhuhd4ycTi"
Content-Disposition: inline

--sMZCuqyhuhd4ycTi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2012 at 05:42:31PM +0000, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../recipes-extended/polkit/polkit_0.104.bbappend  |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/polkit/polkit_0.104.bbappend

This looks like that old version I had commented before, please update
it.

Cheers,

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

--sMZCuqyhuhd4ycTi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8+1b0ACgkQN1Ujt2V2gBymugCffQCtkxrhVwHYrPuPK0u/rnvu
TYYAn0nOHR3ZYSf2Z/1OZsTfYzt47OXG
=CroD
-----END PGP SIGNATURE-----

--sMZCuqyhuhd4ycTi--
