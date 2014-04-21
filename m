Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id BD6C965D10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 11:42:44 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so3571646eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 04:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=715PztAVbdEdBotlabDGszxnXheQcjHYW/7O3EOCi+c=;
	b=QNv1iORWGC/ilY4sz8EkxfubPNZVOVfNxbdFt81qfC/wV+KHTfzpczQEh8wPrBVFZf
	Vp0DOy3uqfQmCMwg4mjoXRXMqTbdp11KDhqc+Ur6tNtATCeBv/OsLyq8IuGD/B2tC3Pl
	UJCMgP+ArmqGB1m1xHcrwvbwcRG1kxPoeCETJXrMDeZcwZB8oGc07PwKF7DdYHpbBPpa
	NPSls9GOJQM7NKt+OwdBi5FfVxUXCN1Omi7yfGTt52BV/g7S/5++Qyo17ew6GRO3noFG
	TUcDglG76hTOa84RPiVqN2OUfgtNCXssK8uhsw6v6nfVtwZOMpcxD7Pz8vkMqu6W3YHJ
	H+JQ==
X-Received: by 10.14.95.8 with SMTP id o8mr46973581eef.15.1398080565725;
	Mon, 21 Apr 2014 04:42:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm102894631eee.2.2014.04.21.04.42.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Apr 2014 04:42:44 -0700 (PDT)
Date: Mon, 21 Apr 2014 13:42:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: krzysztof.m.sywula@intel.com
Message-ID: <20140421114249.GB2486@jama>
References: <1397135968-42902-1-git-send-email-krzysztof.m.sywula@intel.com>
MIME-Version: 1.0
In-Reply-To: <1397135968-42902-1-git-send-email-krzysztof.m.sywula@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: koen@dominion.thruhere.net, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] dejagnu: recipe taken from openembedded
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
X-List-Received-Date: Mon, 21 Apr 2014 11:42:49 -0000
X-Groupsio-MsgNum: 49394
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="moC1XDyencuJ/zDM"
Content-Disposition: inline

--moC1XDyencuJ/zDM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2014 at 02:19:28PM +0100, krzysztof.m.sywula@intel.com wrot=
e:
> From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
>=20
> Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>

Merged thanks!

> ---
>  meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
>=20
> diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb b/meta-oe/=
recipes-devtools/dejagnu/dejagnu_1.4.4.bb
> new file mode 100644
> index 0000000..f5fe9b9
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "GNU unit testing framework, written in Expect and Tcl"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd3173f4504b2cbd8991e=
50b"
> +SECTION =3D "devel"
> +
> +inherit autotools
> +
> +SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "053f18fd5d00873de365413cab17a666"
> +SRC_URI[sha256sum] =3D "d0fbedef20fb0843318d60551023631176b27ceb1e11de74=
68a971770d0e048d"
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 1.8.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--moC1XDyencuJ/zDM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNVBDkACgkQN1Ujt2V2gBxuggCeN9E82uzH1LZNqoxRr/y8gSVd
iCkAnRw/Af4KXxcnGSpqt6DXe1Coocmi
=SuD8
-----END PGP SIGNATURE-----

--moC1XDyencuJ/zDM--
