Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNHls-0000H4-UR
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 09:06:13 +0200
Received: by mail-da0-f47.google.com with SMTP id s35so534438dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Apr 2013 23:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Bx6GBJF2YU6o7Y+07Jjz5AAnz+ySJP6ZVVkelp/0ink=;
	b=Y0a0ULXCBdwNVyXTivmEzFx/vNAagXMAwQFlXHksFbp0+38jzxkDT05jQ5AV6bJfWz
	lSDJN/dKRKRBHqbLnF2mcudBOVk1UCIPzEF1MA8TDPfpSjJvnEUGHUDSal9e2tm15ghz
	VDQ47ZduLlm7KCvge8g7LbGVFVLE97Ga5lT1XNt/We8/gizWOitZre+V/Ccf3daiUMiP
	ANwLQ+e7IZ9pmlktoDO/jqduYPwPGIUBNeym7vJ6KvftJiuG84eAXEcRlzok/uycC0lp
	OX5y9pcqDAHMPNNd6lR0uPpoym2P+r4Xq0JBT5LC0VWQ71gYgFxBgxFEtQ8WRc8dmo2E
	i+zw==
X-Received: by 10.68.137.202 with SMTP id qk10mr645648pbb.189.1364971741054;
	Tue, 02 Apr 2013 23:49:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f4sm4821146pbc.6.2013.04.02.23.48.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 23:48:59 -0700 (PDT)
Date: Wed, 3 Apr 2013 08:49:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130403064900.GC10679@jama.dyndns-home.com>
References: <1364469742-37652-1-git-send-email-paul@paulbarker.me.uk>
	<06CB000D-6FFC-41A1-9808-E196E45E4F3A@gmail.com>
MIME-Version: 1.0
In-Reply-To: <06CB000D-6FFC-41A1-9808-E196E45E4F3A@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] live555: Update to latest version
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
X-List-Received-Date: Wed, 03 Apr 2013 07:06:13 -0000
X-Groupsio-MsgNum: 43861
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline

--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2013 at 08:59:21AM -0700, Khem Raj wrote:
>=20
> On Mar 28, 2013, at 4:22 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
>=20
> > The upstream source for live555 does not keep tarballs of old releases =
so the
> > live555 recipe in meta-oe no longer builds. The version number has been=
 updated
> > to 20130323 which is currently available.
> >=20
> > Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> > ---
> > meta-oe/recipes-multimedia/live555/live555_20110314.bb |   10 ----------
> > meta-oe/recipes-multimedia/live555/live555_20130323.bb |    8 ++++++++
> > 2 files changed, 8 insertions(+), 10 deletions(-)
>=20
>=20
> sometimes its best to use git format-patch -M so its recorded as move and=
 not delete/add

true

upstream released new version and removed old one from mirror again,
there is only live.2013.04.01.tar.gz now, I'll hold this patch until vlc
build is resolved....

> > delete mode 100644 meta-oe/recipes-multimedia/live555/live555_20110314.=
bb
> > create mode 100644 meta-oe/recipes-multimedia/live555/live555_20130323.=
bb
> >=20
> > diff --git a/meta-oe/recipes-multimedia/live555/live555_20110314.bb b/m=
eta-oe/recipes-multimedia/live555/live555_20110314.bb
> > deleted file mode 100644
> > index b1dbad2..0000000
> > --- a/meta-oe/recipes-multimedia/live555/live555_20110314.bb
> > +++ /dev/null
> > @@ -1,10 +0,0 @@
> > -require live555.inc
> > -
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D68ad62c64cc6c620126241fd429=
e68fe"
> > -
> > -PR =3D "${INC_PR}.0"
> > -
> > -SRC_URI[md5sum] =3D "ff65b2c598e970b4b6c8219a1811de00"
> > -SRC_URI[sha256sum] =3D "c6ce050a7f9f69901e6f7f81a6745c82d9419e3904a753=
b2d5db1139caaf6738"
> > -
> > -
> > diff --git a/meta-oe/recipes-multimedia/live555/live555_20130323.bb b/m=
eta-oe/recipes-multimedia/live555/live555_20130323.bb
> > new file mode 100644
> > index 0000000..abf7e14
> > --- /dev/null
> > +++ b/meta-oe/recipes-multimedia/live555/live555_20130323.bb
> > @@ -0,0 +1,8 @@
> > +require live555.inc
> > +
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D68ad62c64cc6c620126241fd429=
e68fe"
> > +
> > +PR =3D "${INC_PR}.0"
> > +
> > +SRC_URI[md5sum] =3D "e9a75e0cfbf4f25aedd4ee4a10a7c26f"
> > +SRC_URI[sha256sum] =3D "9aaa736ee3b11ac0aa33655d8c59eefa893ef7c84a8f87=
d8ac0176c33b8f4deb"
> > --=20
> > 1.7.10.4
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFb0NwACgkQN1Ujt2V2gBwJwgCeMk4yEnU+i4RFKqHZVV+jqiDg
/OEAoJAe0oyG98RLAQe6HAy3l6gG70Kh
=jEtp
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--
