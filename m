Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SI5qV-0003Gm-A4
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 00:16:59 +0200
Received: by wgbdr12 with SMTP id dr12so1134847wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 15:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1VPHingGEl0J1Fk3JZFjr1EAkv7x6rcKIE0voqJ+MAQ=;
	b=DyyrD50YzdYT3NP9iV9fK03fSFDxbcLQiUqsTE7WgOh1fvOGfd+5KZ813TkNLAljBN
	jm0qxNhDnn3N1dNPDx3/Mr16xdQ0U5iuwLrLBJ5j0UZqI4ni9KkHrc7eBwEP6U84+p/L
	iKF9IDnOnFONFRujw908A3+0NN9ASCTgzbFualo40rSC9z/CpmpR1eTrLWCFeBsfh3ss
	wteP4MQCC7a1uk1X2xpcvLlfmCbcsC00uCIESllaatFH3+u/ZEIE4W8mOyRx7gx+fXhT
	+oTfREPY+WMQ8jeRWk/IV1+H0+yXlzRRRxDrUVXqyaqKf1mizbZ5do4hIS6WJcwrdqNO
	NiwQ==
Received: by 10.216.133.9 with SMTP id p9mr66654wei.9.1334182059841;
	Wed, 11 Apr 2012 15:07:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n20sm14158684wiw.5.2012.04.11.15.07.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 15:07:38 -0700 (PDT)
Date: Wed, 11 Apr 2012 15:07:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120411130737.GC3637@jama.jama.net>
References: <cover.1334037469.git.Martin.Jansa@gmail.com>
	<447016b1ed3811830299ad0145a8e3216abd50c4.1334037469.git.Martin.Jansa@gmail.com>
	<CAP9ODKoOVXFWX074wkmy0pQ2-0KDO5AF-tM1E6U6qy+e5DNYtw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoOVXFWX074wkmy0pQ2-0KDO5AF-tM1E6U6qy+e5DNYtw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/2] xserver-nodm-init: use /etc/X11/Xserver from service file instead of Xorg directly
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
X-List-Received-Date: Wed, 11 Apr 2012 22:16:59 -0000
X-Groupsio-MsgNum: 38216
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S1BNGpv0yoYahz37"
Content-Disposition: inline

--S1BNGpv0yoYahz37
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 11, 2012 at 02:10:29PM -0300, Otavio Salvador wrote:
> On Tue, Apr 10, 2012 at 02:59, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> > * /etc/X11/Xserver is provided by xserver-common and sets correct DPI
> > =A0before starting Xorg (or other xserver)
>=20
> This breaks the images using systemd only as it depends on init.d/functio=
ns now.

Ah sorry I still had initscripts around in systemd image, please test
following patch. I'm sending all those changes also to florian to apply
them upstream so maybe we'll drop them from meta-oe and use 1.35 instead
later.

Cheers,

>=20
> --=20
> Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.oss=
ystems.com.br
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--S1BNGpv0yoYahz37
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+FghkACgkQN1Ujt2V2gByiGwCgn3A7w3jbiOIBJJpYAn7v4xOP
RCsAoK6Gu4HbrED6byvcLEi6ZRIcuyW6
=07lt
-----END PGP SIGNATURE-----

--S1BNGpv0yoYahz37--
