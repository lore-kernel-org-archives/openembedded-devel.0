Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PY1F7-0002si-T2
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 19:59:26 +0100
Received: by mail-yx0-f175.google.com with SMTP id 5so4543851yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Dec 2010 10:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=HXFZ7wecZjOVCD61gVHnkV45gqnB6gVL8fy5jawZ4SY=;
	b=Xrhj6G9BXgY/mKOYGHN16Gowmuhad2Kxo6QR/1zOMOXdrI9BrMFhrxGNYvlaPREeJV
	Q0aMxB6HgwmKj2O53AA3ogiZnmEe3m8YQzLhfEJgs1uEPTI8dQx0ogSk64mN+b/iT8Dr
	xbcSisIH9fz85I1FwjIlYSSGkUwEXMdehqGZU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=gHv7J83xrx+2G5q2QGoSADQjMVWDA1rfDuCLTwetbYuuP6GNPWZG0PGNiTUIJqbJcl
	Zc8f2u1EevY16PXvYhQlyRE+vDm2U4rk+5t1y/DdX/Wfqj5loi8yBO7/VxIPE55b6Mbi
	+UEPSQfzhwWMb2+FgPeU47RJi780Vyml871sg=
Received: by 10.91.163.27 with SMTP id q27mr5955160ago.139.1293649146645; Wed,
	29 Dec 2010 10:59:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 29 Dec 2010 10:58:46 -0800 (PST)
In-Reply-To: <1293645497-22323-1-git-send-email-Martin.Jansa@gmail.com>
References: <1293644563.4238.7.camel@mattotaupa>
	<1293645497-22323-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Dec 2010 10:58:46 -0800
Message-ID: <AANLkTimF8brtuRiXYU-kNRQQdur8FpM9=Xo4cGdJxyAG@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] glib-2.0, dbus: drop dbus's dependency on glib and add dbus dependency to glib-2.0_2.26.1
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
X-List-Received-Date: Wed, 29 Dec 2010 18:59:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 29, 2010 at 9:58 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/dbus/dbus.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/glib-2.0/glib-2.0_2.26.1.bb | =C2=A0 =C2=A04 ++--
> =C2=A02 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/dbus/dbus.inc b/recipes/dbus/dbus.inc
> index 73fc426..c235f74 100644
> --- a/recipes/dbus/dbus.inc
> +++ b/recipes/dbus/dbus.inc
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "A message bus system for inter-process c=
ommunication"
> =C2=A0HOMEPAGE =3D "http://dbus.freedesktop.org"
> =C2=A0SECTION =3D "base"
> =C2=A0LICENSE =3D "GPLv2+ AFLv2.1"
> -DEPENDS =3D "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"
> +DEPENDS =3D "expat virtual/libintl libsm libice virtual/libx11"
>
> =C2=A0INC_PR =3D "r19"
>
> diff --git a/recipes/glib-2.0/glib-2.0_2.26.1.bb b/recipes/glib-2.0/glib-=
2.0_2.26.1.bb
> index d95f894..5f7dbce 100644
> --- a/recipes/glib-2.0/glib-2.0_2.26.1.bb
> +++ b/recipes/glib-2.0/glib-2.0_2.26.1.bb
> @@ -6,9 +6,9 @@ UNIX-like platforms, Windows, OS/2 and BeOS."
> =C2=A0LICENSE =3D "LGPLv2+"
> =C2=A0SECTION =3D "libs"
> =C2=A0PRIORITY =3D "optional"
> -DEPENDS =3D "glib-2.0-native gtk-doc zlib"
> +DEPENDS =3D "glib-2.0-native gtk-doc zlib dbus"
> =C2=A0DEPENDS_virtclass-native =3D "gettext-native gtk-doc-native \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0pkgconfig-native"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0pkgconfig-native dbus-native"
>
> =C2=A0PR =3D "r0"
>
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


