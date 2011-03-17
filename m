Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0Cpl-0004Qu-PP
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 14:01:45 +0100
Received: by fxm19 with SMTP id 19so2596778fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 06:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=MbW9v32fIwtSC2ZC+N9eP8ltKhdDrIn4bOeLNsyS+b0=;
	b=rWnhyBuprZPkH0jLhAcedOXlioSVTudp12Xex2Ri8DFVvS42bfcgcirqQb8MNBvbNe
	Qva6xrfHtjsl4xoBzs4NjmZi/cd1HJgUnqvXHKhNZwLSv3Q4jxdKqA05HUEw3BWSp3ID
	FmwiDXTS18Ie3El2qLJiG+PxA/jEFrukJzblo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=C/pZMaYaS9kJR470Q5O8Y3/C1FyaGyqFI+D0iavhtBc0aV8QKF0ctfcw2O3dxF49Ok
	ugdta52Q/yspzpYZ3lHLb1umiYRHrlJw4YkSaSppcT48fBfatac4+0CY9hqtyclXyzMD
	bdTy+XBtQTo0qpvOGDBINsTLcNYl4eqvnAIy4=
Received: by 10.223.81.197 with SMTP id y5mr1465919fak.25.1300366688036;
	Thu, 17 Mar 2011 05:58:08 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n7sm905964fam.35.2011.03.17.05.58.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 05:58:06 -0700 (PDT)
Date: Thu, 17 Mar 2011 13:57:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110317125759.GA3585@jama.jama.net>
References: <1300363716-32402-1-git-send-email-Martin.Jansa@gmail.com>
	<1300364979.9054.2.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1300364979.9054.2.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gtk+: define empty PACKAGES_DYNAMIC_virtclass-native
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
X-List-Received-Date: Thu, 17 Mar 2011 13:01:45 -0000
X-Groupsio-MsgNum: 30341
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline

--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2011 at 12:29:39PM +0000, Phil Blundell wrote:
> On Thu, 2011-03-17 at 13:08 +0100, Martin Jansa wrote:
> > --- a/recipes/gtk+/gtk+_2.18.6.bb
> > +++ b/recipes/gtk+/gtk+_2.18.6.bb
> > @@ -19,6 +19,7 @@ EXTRA_OECONF =3D "--with-libtiff ${XKBTOGGLE} --disab=
le-glibtest gio_can_sniff=3Dyes
> >  EXTRA_OECONF_append_virtclass-native =3D " --without-libtiff --without=
-libjpeg --disable-cups"
> > =20
> >  PACKAGES_DYNAMIC =3D "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* =
gtk-printbackend-*"
> > +PACKAGES_DYNAMIC_virtclass-native =3D ""
>=20
> Can you not put this in gtk+.inc?

Not all 13 versions we have are including gtk+.inc. But after rechecking
I could put it only to 4 recipes (I'll resend smaller patch).

bitbake@jama ~/dev/recipes/gtk+ $ git grep BBCLASSEXTEND
gtk+_2.14.2.bb:BBCLASSEXTEND =3D "native"
gtk+_2.18.6.bb:BBCLASSEXTEND =3D "native"
gtk+_2.20.0.bb:BBCLASSEXTEND =3D "native"
gtk+_2.20.1.bb:BBCLASSEXTEND =3D "native"

and let the older versions die with migration to meta-oe or let
someone who cares about gtk to remove them completely.

Regards,=20
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2CBVcACgkQN1Ujt2V2gByILgCfbhjbLBrxhO+zVIXsfbElvApT
BdEAoKprSlkI+8A0i6uiQ+RsVnlX+yEQ
=Ll7J
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
