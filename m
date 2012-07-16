Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SqpYP-0003ny-3w
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 19:57:53 +0200
Received: by wibhq4 with SMTP id hq4so2620735wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 10:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Pvn9s8E8DlVoEGbu29ZiuWIJ9Db9zDJPp/Hdh/+etMc=;
	b=UGGflQXLMxLj0lbb9jKKIWT6NsgaW2BUZA7+1NA2/4JsdzLYbhjzFVqUYi8Uz0myB4
	hJuPEfnEJ0/lStLatW9J3d4Y6XrmZDVLwI1xmZe5p4p9B4q1iWIgTQ5CD50HYHUyUNPK
	7kW2LXgP/poQLHHOnMEUWN3JHFdh1s596g/8bN5MHJEstbwgrX5/xVe3bzjRvY4Fu4uO
	OX35aYXto8/PEfmt9tbbzjRiKPHOEUHwRdhCquuG88PRoMV7b+tX/meTFj57cBjDl3Oy
	oft8phjO7w6J7hgUBUd16IJ/FpZhG8o3V9qMq1OX22t34daa8CzrYmk4d5qPwBvVfuNu
	oifg==
Received: by 10.180.92.129 with SMTP id cm1mr19942566wib.10.1342460794732;
	Mon, 16 Jul 2012 10:46:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm33265051wix.6.2012.07.16.10.46.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 10:46:33 -0700 (PDT)
Date: Mon, 16 Jul 2012 19:46:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120716174642.GK3729@jama.jama.net>
References: <1342460316-5489-1-git-send-email-raj.khem@gmail.com>
	<1342460316-5489-3-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1342460316-5489-3-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC][meta-oe][PATCH 3/3] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Mon, 16 Jul 2012 17:57:53 -0000
X-Groupsio-MsgNum: 39690
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="enGqbSaueFq5omEL"
Content-Disposition: inline

--enGqbSaueFq5omEL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 16, 2012 at 10:38:36AM -0700, Khem Raj wrote:
> This class is angstrom specific so lets move it to more
> appropriate layer

This is also used by SHR, that's why I've asked Koen to move blacklist
=66rom meta-angstrom to meta-oe before
http://git.openembedded.org/meta-openembedded/commit/?id=3D68c15845d087df0a=
6f66c58a9fd80548a9bb3a59

Cheers,

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/classes/blacklist.bbclass |   20 --------------------
>  1 file changed, 20 deletions(-)
>  delete mode 100644 meta-oe/classes/blacklist.bbclass
>=20
> diff --git a/meta-oe/classes/blacklist.bbclass b/meta-oe/classes/blacklis=
t.bbclass
> deleted file mode 100644
> index 7bf4a73..0000000
> --- a/meta-oe/classes/blacklist.bbclass
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -# anonymous support class from angstrom
> -#=20
> -# Features:
> -#
> -# * blacklist handling, set ANGSTROM_BLACKLIST_pn-blah =3D "message"
> -#
> -
> -python () {
> -    import bb
> -
> -    blacklist =3D bb.data.getVar("ANGSTROM_BLACKLIST", d, 1)
> -    pkgnm =3D bb.data.getVar("PN", d, 1)
> -    distro =3D bb.data.getVar("DISTRO", d, 1)
> -
> -    if blacklist:
> -	bb.note("%s DOES NOT support %s because %s" % (distro,pkgnm, blacklist))
> -        raise bb.parse.SkipPackage("%s DOES NOT support %s because %s" %=
 (distro,pkgnm, blacklist))
> -
> -}
> -
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--enGqbSaueFq5omEL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAEU4IACgkQN1Ujt2V2gBxQagCcCUQILLISJTnlaEdTxTgrdIGo
RBUAn1PTBCF1IkXrt+69N7eRdF7KGdAQ
=r/g7
-----END PGP SIGNATURE-----

--enGqbSaueFq5omEL--
