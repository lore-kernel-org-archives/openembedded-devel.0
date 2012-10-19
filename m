Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TP7wQ-0007Sh-Vd
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2012 10:28:27 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so96152wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2012 01:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZBeIZU2gBopqAymJ34pJZXgmZCeHVSOmHq3DNhfSKtY=;
	b=Z7KDkLdKOrNfu74tHw7zAxUcduYaI/rYR+hzghOwf809i2p55I/rqWjy6SVg4crpFk
	G9298ZbwN8/dROHHHGS8NReL2mF77kYEVQdrYXw9QKmBludAUu79wOnhbrLBoej80Mkz
	ERHImS2NyxrndnC0Ce+Pg6wHXttQlYFHB2nofC+SrBM5XVLCED7OmMcvqcEIDwTzn02D
	a8YTTABMBE7c6XcvpUBoH0vGSAqOd2CvJcxVnpmbH8c3Ng+75tC8KOw4Gu4EN0DCSFRn
	m/KF8Duo7Wk6WyoeIjfYoaF2q+Pnh7X8dIlBMod1lcKIZ/olOJXMAAWcO4XV2YEedsC5
	LMqQ==
Received: by 10.216.217.38 with SMTP id h38mr297646wep.82.1350634506409;
	Fri, 19 Oct 2012 01:15:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v3sm2079126wiy.5.2012.10.19.01.15.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 01:15:05 -0700 (PDT)
Date: Fri, 19 Oct 2012 10:15:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121019081515.GG3087@jama.jama.net>
References: <cover.1350589969.git.Martin.Jansa@gmail.com>
	<9610a228f0d8308baefe7457efebe7953bf02831.1350589969.git.Martin.Jansa@gmail.com>
	<CALbNGRTki15AnitLToVDzcx=xycPm9THEVy5snksc3Q8tzb+Xg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTki15AnitLToVDzcx=xycPm9THEVy5snksc3Q8tzb+Xg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/5] PACKAGES_DYNAMIC: use regexp not glob
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
X-List-Received-Date: Fri, 19 Oct 2012 08:28:27 -0000
X-Groupsio-MsgNum: 41158
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1XWsVB21DFCvn2e8"
Content-Disposition: inline

--1XWsVB21DFCvn2e8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 19, 2012 at 04:43:10AM +0200, Andreas M=FCller wrote:
> On Thu, Oct 18, 2012 at 9:54 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > * bitbake uses PACKAGES_DYNAMIC as regexp
> >   ^ could make matching faster (and it will be more clear that we're ex=
pecting regexp not glob)
> >   * made all those last '-' optional, use .* (or nothing)
> > * use +=3D instead of =3D in most cases to keep ${PN}-locale from
> >   bitbake.conf:PACKAGES_DYNAMIC =3D "^${PN}-locale-.*"
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-efl/recipes-efl/efl/evas-generic-loaders.inc         | 2 +-
> >  meta-efl/recipes-efl/efl/evas.inc                         | 2 +-
> >  meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb         | 2 +-
> >  meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    | 2 +-
> >  meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb              | 2 +-
> >  meta-gnome/recipes-support/goffice/goffice_0.8.17.bb      | 2 +-
> >  meta-initramfs/recipes-devtools/klibc/klibc-utils.inc     | 2 +-
> >  meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb  | 2 +-
> >  meta-oe/recipes-extended/lcdproc/lcdproc5.inc             | 2 +-
> >  meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb         | 2 +-
> >  meta-oe/recipes-multimedia/libav/libav.inc                | 2 +-
> >  meta-oe/recipes-support/freerdp/freerdp.inc               | 2 +-
> >  meta-oe/recipes-support/openldap/openldap_2.4.23.bb       | 2 +-
> >  meta-oe/recipes-support/pidgin/pidgin.inc                 | 2 +-
> >  meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb | 2 +-
> >  meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb  | 2 +-
> >  meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb              | 2 +-
> >  17 files changed, 17 insertions(+), 17 deletions(-)
> >
> Some buildhistory results for that?

PACKAGES_DYNAMIC does not really influence runtime packages IMHO, it
would fail to find some runtime dependency for my image or work as
before, but yes buildhistory results are the same as on oe-core patch
for PACKAGES_DYNAMIC:

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October/030952.=
html

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1XWsVB21DFCvn2e8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCBDBMACgkQN1Ujt2V2gBwVcQCfSJHdUVNZViIDzzWCQ7p/rHxl
OJ8AniMQsfC0IrFp2Eq4PKoyYdmt0cHs
=GmvY
-----END PGP SIGNATURE-----

--1XWsVB21DFCvn2e8--
