Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIyOO-0007HO-GY
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 10:36:08 +0100
Received: by mail-pb0-f47.google.com with SMTP id rp2so2941525pbb.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 02:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=67NRjcdcJC6wx/ntL3lu51vR+9bFXaik0z0bMdBLLj8=;
	b=zN3oypgftDsXv4/3Hyg4dfkRbiGxSqTy9S0qtiSq5MxS/CL4/TuuIRx7STmVXzXfSZ
	XMj521iR0t1sS3jU0WSdKHYZZZ3ZiKPVn5g6vERXY8EwKrDSlG/bTgnERHxAdOAruwO5
	LmS6+FEn2p14QAlX9ZtwWejxetf2PuERND7xBFhM3umtca0SNzZatdK3Yjgij0EG7eq7
	AOPKY9hmPDXyuzD5xJc5HjpNqePsSVSvml68imm5N9pUF2HFi5bqz0Qx37wyZBJgn7n8
	bm/MKYTHgrfWNyw7bH8Ffjl/S+QSTGOSN+HxtI+YWaph8NoV1DYYdVot845DDXkLdb/d
	pTNw==
X-Received: by 10.66.6.42 with SMTP id x10mr2050235pax.218.1363943952459;
	Fri, 22 Mar 2013 02:19:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id vd4sm1701571pbc.35.2013.03.22.02.19.10
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 02:19:11 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:19:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130322091910.GG3219@jama>
References: <1363721551-8539-1-git-send-email-obi@opendreambox.org>
	<1363721551-8539-2-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1363721551-8539-2-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 2/2] layer.conf: add ca-certificates to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Fri, 22 Mar 2013 09:36:23 -0000
X-Groupsio-MsgNum: 43648
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KIzF6Cje4W/osXrF"
Content-Disposition: inline

--KIzF6Cje4W/osXrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2013 at 08:32:30PM +0100, Andreas Oberritter wrote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

Both applied, thanks!

> ---
>  meta-oe/conf/layer.conf |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index b8a53d2..68f7823 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -29,4 +29,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>    fbset-modes \
>    gpsd-machine-conf \
>    distro-feed-configs \
> +  ca-certificates \
>  "
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KIzF6Cje4W/osXrF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMIg4ACgkQN1Ujt2V2gBzyKACgkwaEMTuhbE8eg8t3Sam73asq
uJYAniOGsdOC1gYBVrqJRqMz5ezcY5Bz
=asVJ
-----END PGP SIGNATURE-----

--KIzF6Cje4W/osXrF--
