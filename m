Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJ6mC-0000hv-9d
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 18:24:12 +0200
Received: by fxm19 with SMTP id 19so3577242fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 09:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=9ibUvxoMB4kO1rIQ0DDG0jCEpMrnFgbWQGFPHV+Z+kA=;
	b=nFfkoIws96AUM/TO5PUffRats9YlvCqUnKe+doLF9SErgD/qyI9T0nOwYcy/K9s9jr
	B6oYVuNKAtl2rmBv3Bf/ArP6q8rQIWMIiVfsh/NYpbKIMGthjrBolLO8J7VqVm0s6NMV
	DyVN8vO7BCLYa0dDKZNxznWqroE54P9bXStaM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=OrwJxtmAzo8Vjkeywi1U0eB9GA0Q3g6ZaNA2On/iIlTapfUzzNYES7pB4AosIQJx8P
	lCucXwsx3ptqW9F6zT4fNk6qr2CJLZpSbHdNQGt+yMsCo6sz33pKw52FGzrOf/a/RkAx
	CYQpdJv6hBo+tRHM+LZEm3xfW4SbZj25178Go=
Received: by 10.223.127.210 with SMTP id h18mr2554800fas.73.1304871685940;
	Sun, 08 May 2011 09:21:25 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 13sm1707437fau.40.2011.05.08.09.21.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 09:21:24 -0700 (PDT)
Date: Sun, 8 May 2011 18:21:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
Message-ID: <20110508162118.GH17773@jama.jama.net>
References: <1304851275.4124.48.camel@mattotaupa>
	<iq64jb$qli$1@dough.gmane.org>
	<1304861367.4124.63.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1304861367.4124.63.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] networkmanager_git: remove `DEFAULT_PREFERENCE = "-1"`
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
X-List-Received-Date: Sun, 08 May 2011 16:24:12 -0000
X-Groupsio-MsgNum: 31745
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wayzTnRSUXKNfBqd"
Content-Disposition: inline

--wayzTnRSUXKNfBqd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 08, 2011 at 03:29:27PM +0200, Paul Menzel wrote:
> Date: Sat, 7 May 2011 16:40:28 +0200
>=20
> Use `networkmanager_git` and `network-manager-applet_git` by default.
>=20
> Build tested using `minimal` for `MACHINE =3D "beagleboard"`. Using
> `minimal-uclibc` task compile fails because `execinfo.h` is not
> available [1].
>=20
> [1] http://mail.gnome.org/archives/networkmanager-list/2011-May/msg00069.=
html
>=20
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> =C8=A6ngstr=C3=B6m and SHR maintainers, please tell me, if you want me to=
 remove
> the distribution specific overrides too.

feel free to remove shr override..

>=20
> Am Sonntag, den 08.05.2011, 15:07 +0200 schrieb Koen Kooi:
>=20
> > On 08-05-11 12:41, Paul Menzel wrote:
> > > Date: Sat, 7 May 2011 16:40:28 +0200
> > >=20
> > > 1. Use `networkmanager_git` by default.
> >=20
> > IF you do that you need to double check that matching vpn and applet
> > versions are built
>=20
> Thank you for pointing that out. Looking through it nm-openvpn does not
> have any `DEFAULT_PREFERENCE` set.
> ---
>  .../networkmanager/network-manager-applet_git.bb   |    1 -
>  recipes/networkmanager/networkmanager_git.bb       |    1 -
>  2 files changed, 0 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/networkmanager/network-manager-applet_git.bb b/recip=
es/networkmanager/network-manager-applet_git.bb
> index 8493f6d..2f644d7 100644
> --- a/recipes/networkmanager/network-manager-applet_git.bb
> +++ b/recipes/networkmanager/network-manager-applet_git.bb
> @@ -3,7 +3,6 @@ LICENSE =3D "GPL"
>  DEPENDS =3D "libnotify networkmanager dbus-glib libglade gconf gnome-key=
ring"
>  RDEPENDS_${PN} =3D "networkmanager"
> =20
> -DEFAULT_PREFERENCE =3D "-1"
>  DEFAULT_PREFERENCE_angstrom =3D "1"
> =20
>  SRCREV =3D "0.8.3.999"
> diff --git a/recipes/networkmanager/networkmanager_git.bb b/recipes/netwo=
rkmanager/networkmanager_git.bb
> index 8187787..cb79e78 100644
> --- a/recipes/networkmanager/networkmanager_git.bb
> +++ b/recipes/networkmanager/networkmanager_git.bb
> @@ -1,6 +1,5 @@
>  require networkmanager-0.7.inc
> =20
> -DEFAULT_PREFERENCE =3D "-1"
>  DEFAULT_PREFERENCE_angstrom =3D "1"
>  DEFAULT_PREFERENCE_shr =3D "1"
> =20
> --=20
> 1.7.4.4



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wayzTnRSUXKNfBqd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3Gwv4ACgkQN1Ujt2V2gBxBGgCeLI+KU7eOFJjlJo+53ZNjoMrB
QMsAoKi4hl0IADTpFhI1rCCOV7vV1M7I
=mLjj
-----END PGP SIGNATURE-----

--wayzTnRSUXKNfBqd--
