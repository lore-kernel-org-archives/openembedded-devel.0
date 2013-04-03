Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNIAV-0000WX-2U
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 09:31:39 +0200
Received: by mail-da0-f42.google.com with SMTP id n15so545095dad.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 00:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=guOMoxxQ+YrVDZJqeH1arMnfWikPmmXhgwBE2FRxK9I=;
	b=if7PWvZ/sfByO1HAttnFB3MO2smJHvKrFixp06naGxcz5sL6s4cO4kgX7XwqRHPiGP
	yKVdMKaOSUjGqQX5eiNjo15jBHP7Fn8BD8jDkP5OCyZYmulV56y+pLeSVIlzb38LoFgS
	k8rMMBm0JS0FPWgj5O3W0E5kpeLxPOS5jFgstLnYoVjfU+xg+c/uA9qk9Z8K+XpZ3dGK
	v+JJUxgpxLoDn7f8/p0EYaY0nWAz5rNRsRKuBs+z5OSRzF1kCoIPm3vUH+ARFXnCkVmi
	jT6h0mkZzV0rQOrKSxr0v+uLHFQoJbvte11teh/MIDfBR2TYB7EeqKMzjSAOmZY+BcWm
	gFFw==
X-Received: by 10.68.137.202 with SMTP id qk10mr736242pbb.189.1364973266358;
	Wed, 03 Apr 2013 00:14:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t1sm5738497pab.12.2013.04.03.00.14.23
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 00:14:25 -0700 (PDT)
Date: Wed, 3 Apr 2013 09:14:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130403071425.GD10679@jama.dyndns-home.com>
References: <1364469742-37652-1-git-send-email-paul@paulbarker.me.uk>
	<06CB000D-6FFC-41A1-9808-E196E45E4F3A@gmail.com>
	<20130403064900.GC10679@jama.dyndns-home.com>
MIME-Version: 1.0
In-Reply-To: <20130403064900.GC10679@jama.dyndns-home.com>
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
X-List-Received-Date: Wed, 03 Apr 2013 07:31:39 -0000
X-Groupsio-MsgNum: 43862
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline

--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2013 at 08:49:00AM +0200, Martin Jansa wrote:
> On Thu, Mar 28, 2013 at 08:59:21AM -0700, Khem Raj wrote:
> >=20
> > On Mar 28, 2013, at 4:22 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
> >=20
> > > The upstream source for live555 does not keep tarballs of old release=
s so the
> > > live555 recipe in meta-oe no longer builds. The version number has be=
en updated
> > > to 20130323 which is currently available.
> > >=20
> > > Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> > > ---
> > > meta-oe/recipes-multimedia/live555/live555_20110314.bb |   10 -------=
---
> > > meta-oe/recipes-multimedia/live555/live555_20130323.bb |    8 ++++++++
> > > 2 files changed, 8 insertions(+), 10 deletions(-)
> >=20
> >=20
> > sometimes its best to use git format-patch -M so its recorded as move a=
nd not delete/add
>=20
> true
>=20
> upstream released new version and removed old one from mirror again,
> there is only live.2013.04.01.tar.gz now, I'll hold this patch until vlc
> build is resolved....

http://download.videolan.org/pub/videolan/testing/contrib/live555/

Seems like good MIRROR for older versions.

>=20
> > > delete mode 100644 meta-oe/recipes-multimedia/live555/live555_2011031=
4.bb
> > > create mode 100644 meta-oe/recipes-multimedia/live555/live555_2013032=
3.bb
> > >=20
> > > diff --git a/meta-oe/recipes-multimedia/live555/live555_20110314.bb b=
/meta-oe/recipes-multimedia/live555/live555_20110314.bb
> > > deleted file mode 100644
> > > index b1dbad2..0000000
> > > --- a/meta-oe/recipes-multimedia/live555/live555_20110314.bb
> > > +++ /dev/null
> > > @@ -1,10 +0,0 @@
> > > -require live555.inc
> > > -
> > > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D68ad62c64cc6c620126241fd4=
29e68fe"
> > > -
> > > -PR =3D "${INC_PR}.0"
> > > -
> > > -SRC_URI[md5sum] =3D "ff65b2c598e970b4b6c8219a1811de00"
> > > -SRC_URI[sha256sum] =3D "c6ce050a7f9f69901e6f7f81a6745c82d9419e3904a7=
53b2d5db1139caaf6738"
> > > -
> > > -
> > > diff --git a/meta-oe/recipes-multimedia/live555/live555_20130323.bb b=
/meta-oe/recipes-multimedia/live555/live555_20130323.bb
> > > new file mode 100644
> > > index 0000000..abf7e14
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-multimedia/live555/live555_20130323.bb
> > > @@ -0,0 +1,8 @@
> > > +require live555.inc
> > > +
> > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D68ad62c64cc6c620126241fd4=
29e68fe"
> > > +
> > > +PR =3D "${INC_PR}.0"
> > > +
> > > +SRC_URI[md5sum] =3D "e9a75e0cfbf4f25aedd4ee4a10a7c26f"
> > > +SRC_URI[sha256sum] =3D "9aaa736ee3b11ac0aa33655d8c59eefa893ef7c84a8f=
87d8ac0176c33b8f4deb"
> > > --=20
> > > 1.7.10.4
> > >=20
> > >=20
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFb1tEACgkQN1Ujt2V2gBxEeQCeNXg30o3Ner0Vj9N5szeXlW9u
bSIAn3Hx2gFm/Jaf33OtsWCw5akadxIf
=U4oQ
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--
