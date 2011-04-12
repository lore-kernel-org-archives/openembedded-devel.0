Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q9ZDE-0003tX-MH
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 10:44:40 +0200
Received: by fxm19 with SMTP id 19so4815998fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2011 01:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=XeJ8KH3nyy1qiK7WFiFoML76LbOfUTEJCbwWUYZnq4U=;
	b=le3K/SaIEQ522TMtpQuez+gDNkdyMqFo/XFJiJX8oPKkqPYqkUVlLZo/Jz2yXpNU5T
	6VYLgLtwd9Z5LLhmD5/m/R1VUEz0Vs/WC6NmuExtmN8AaTXDUb1e/vpOnFrThAVv0e4Y
	/CrTl7I0OKu3WRqfOXdMRCLD87viTJ+hSPBXM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=DlLDYCHhz9tDa8nH6mbPs8TFhxwo7oe72LIq8FoeEAz5xCnNhygPxXJYxYGfu80v8b
	/4T6mkeIh7LBl7xgFgIQhpAv1yJmktOXGi2gzuEQg6TpWeu8NaJRK4d8z2Xdz8HV0P4h
	HgxQXu9TZYRyGl2CHbt2Jdo3TYe2P/qe5qf4M=
Received: by 10.223.87.218 with SMTP id x26mr761540fal.133.1302597747403;
	Tue, 12 Apr 2011 01:42:27 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l4sm1914533fan.14.2011.04.12.01.42.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Apr 2011 01:42:25 -0700 (PDT)
Date: Tue, 12 Apr 2011 10:42:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110412084218.GA21027@jama.jama.net>
References: <1302596149.4323.18.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1302596149.4323.18.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: gstreamer*, starling: ERROR: Nothing RPROVIDES 'gst-plugin-ivorbis' (but /oe/openembedded/recipes/starling/starling_0.9.bb RDEPENDS on or otherwise requires it)
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
X-List-Received-Date: Tue, 12 Apr 2011 08:44:40 -0000
X-Groupsio-MsgNum: 31126
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2011 at 10:15:49AM +0200, Paul Menzel wrote:
> Dear OE folks,
>=20
>=20
> `e-image` depends on `starling` which has
>=20
>         RRECOMMENDS_${PN} =3D "\
>           gst-plugin-mad \
>           gst-plugin-modplug \
>           gst-plugin-ivorbis \
>           gst-plugin-tcp \
>         "
>=20
> in its recipe. I think commit e6d170ab [1]
>=20
>         commit e6d170abad28fcd0e3b8ba831705bed23e3309a4
>         Author: Martin Jansa <martin.jansa@gmail.com>
>         Date:   Thu Apr 7 00:12:22 2011 +0000
>        =20
>             gst-plugins: define disjunctive PACKAGES_DYNAMIC for each pac=
k base/good/bad/ugly
>            =20
>             * adds a bit more bits to keep in sync while changing gst-plu=
gins
>               version, but not that much (this patch was mostly prepared =
by script)
>             * overlap in PACKAGES_DYNAMIC namespace causes notes like thi=
s in every build
>               NOTE: multiple providers are available for runtime gst-plug=
in-autodetect (gst-plugins-bad, gst-plugins-good, gst-plugins-base, gst-plu=
gins-ugly)
>               NOTE: consider defining a PREFERRED_PROVIDER entry to match=
 gst-plugin-autodetect
>            =20
>             Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>             Acked-by: Mike Westerhof <mike@mwester.net>
>=20
> is responsible for this regression and has just
>=20
>         +PACKAGES_DYNAMIC =3D "\
>         [=E2=80=A6]
>         +gst-plugin-ivorbisdec* \
>         [=E2=80=A6]
>         "
>=20
> in the list. I do not know anything about this plugin and where the
> error is.

I have tried to regenerate PACKAGES_DYNAMIC with nokia900 (hard fp) for bas=
e and bad plugins and still cannot get
gst-plugin-ivorbis built (still only gst-plugin-ivorbisdec)

can you try to remove existing PACKAGES_DYNAMIC and call
contrib/gstreamer/generate-packages-dynamic-list.sh recipes/gstreamer/gst-p=
lugins-bad_*
contrib/gstreamer/generate-packages-dynamic-list.sh recipes/gstreamer/gst-p=
lugins-base_*

and check git diff if you have gst-plugin-ivorbis there?

if not, then imho starling should be fixed

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2kEGoACgkQN1Ujt2V2gBwrTwCeNP0cwkWdkOg+RO+YAKWodssT
eJ0AoI/4hZ21x7A/9CMqymMgae1D42wJ
=OtHk
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
