Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QzO4T-00015V-Cl
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Sep 2011 09:21:49 +0200
Received: by fxg11 with SMTP id 11so1520662fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Sep 2011 00:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xKgqT3JnD27BwWmRzTMLh4ZMx9EU4clYoQZEb/bSzbo=;
	b=SZRDEMu4zJY+TTfK0+ZkFcVDrRrC75qSEmucsWpzbKiahYvs42DQmTTxNku5Gk91JR
	IT+7cIRnEYPsbzr8k5uUkMaFhjZHCDRjO0Hxe9bbk5S5zOriH6wGdq5HCnEkgrxThnEv
	NstE01KvKIVGLv5UBi0KM/wX6sN3iW1sv+KcI=
Received: by 10.223.97.210 with SMTP id m18mr1220259fan.127.1314947813093;
	Fri, 02 Sep 2011 00:16:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i5sm394117fag.20.2011.09.02.00.16.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Sep 2011 00:16:51 -0700 (PDT)
Date: Fri, 2 Sep 2011 09:16:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110902071644.GJ3634@jama.jama.net>
References: <4d660e0531b72769b0bf04e0288cca6d52cb083f.1314892207.git.Martin.Jansa@gmail.com>
	<49f18160290338d81c35a56f12fb5edaababe78b.1314892207.git.Martin.Jansa@gmail.com>
	<4E5FD679.1000606@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4E5FD679.1000606@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 4/4] xf86-video-omapfb: add patch for fixing segfault on starting X when using VRFB
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
X-List-Received-Date: Fri, 02 Sep 2011 07:21:49 -0000
X-Groupsio-MsgNum: 34008
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QnBU6tTI9sljzm9u"
Content-Disposition: inline

--QnBU6tTI9sljzm9u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 01, 2011 at 09:01:13PM +0200, Eric B=E9nard wrote:
> Hi,
>=20
> Le 01/09/2011 17:50, Martin Jansa a =E9crit :
> > From: Sebastian Krzyszkowiak<dos@dosowisko.net>
> >
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > ---
> >   .../0004-Attempt-to-fix-VRFB.patch                 |  320 +++++++++++=
+++++++++
> >   .../xorg-driver/xf86-video-omapfb_git.bb           |    3 +-
> >   2 files changed, 322 insertions(+), 1 deletions(-)
> >   create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-om=
apfb/0004-Attempt-to-fix-VRFB.patch
> >
> why does this driver is inside meta-oe layer instead of the TI layer ?

mostly because N900 also using xf86-video-omapfb is not built by TI :)
=20
> btw, as we are starting porting our bsp against meta-oc, is there a docum=
ent=20
> describing how the layers are splitted ?
>=20
> Eric
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QnBU6tTI9sljzm9u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5ggtwACgkQN1Ujt2V2gBxwRgCgi4qCMUvEWC0ZACK2OnAyOjJx
txIAn3bCYWIf9yOKY+uBGKFEt241cO/W
=oM/u
-----END PGP SIGNATURE-----

--QnBU6tTI9sljzm9u--
