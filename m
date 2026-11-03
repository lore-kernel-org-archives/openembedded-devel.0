Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch [79.135.106.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6679.1793695741853511956
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 00:49:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail header.b=UsWbpgCs;
 spf=pass (domain: geanix.com, ip: 79.135.106.27, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1793695736; x=1793954936;
	bh=Ge3BXQAccEVw/LsGRESlehJ4rDDPU8X1YWVaoURd8aw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UsWbpgCsphvYdLemRz0a1U8VAve+Gg7/v+Y8B1XMdpDecNk9ZCvtNkBrgU6Y5Bqh9
	 sUfxEGk/QewXUqJkYJK4EB7RQzNIxujZG6zsKeri7dcGxs3yeaCdX8I4RS+n6yvHHJ
	 fWiyK17CM8Qhr+ubpm9pEPmbStZ6YNyvzLiqk2X05Z5gOqObPeB1Ax7YtuiWJ0jqtU
	 5wIQSub+8nLmnqSXUEFvlRKTI3PNODuJaDZS/ogIZmtoQbfbUY6xuv22EoWbbvyK1e
	 MPIHcYNIZRflF9UZMBYS5L/aZQz/4rvCKSBjOfknOZMn0m0aP9KxIEY7qQRaLovuKm
	 zkGWlzGH+1RJw==
Date: Tue, 03 Nov 2026 08:48:54 +0000
To: Khem Raj <raj.khem@gmail.com>
From: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH 2/2] zsh: make libpcre2 a PACKAGECONFIG
Message-ID: <182CA24C-CD67-4BB5-AE5D-286CB77A3604@geanix.com>
In-Reply-To: <CAMKF1soDR+KvfX7YFqfoMG7y6EHxRmk7Aap7E=iTV2Jr8x4z=g@mail.gmail.com>
References: <20261102103459.3625067-1-sean@geanix.com> <20261102103459.3625067-2-sean@geanix.com> <CAMKF1soDR+KvfX7YFqfoMG7y6EHxRmk7Aap7E=iTV2Jr8x4z=g@mail.gmail.com>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: a3047a14ab9fe314d457f0da6626181d9b01bff9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 08:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131762



> On 3 Nov 2026, at 04.15, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>=20
>=20
> On Mon, Nov 2, 2026 at 2:35=E2=80=AFAM Sean Nyekjaer via openembedded-dev=
el <sean=3Dgeanix.com@lists.openembedded.org> wrote:
> libpcre2 was always in DEPENDS. Move it to a PACKAGECONFIG, enabled
> by default, so it can be dropped.
>=20
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  meta-oe/recipes-shells/zsh/zsh_5.9.2.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb b/meta-oe/recipes-sh=
ells/zsh/zsh_5.9.2.bb
> index 47b9bfc18f..16a769612c 100644
> --- a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
> +++ b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
> @@ -8,7 +8,7 @@ SECTION =3D "base/shell"
>  LICENSE =3D "LicenseRef-zsh"
>  LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D1a4c4cda3e8096d2fd483ff2f4514=
fec"
>=20
> -DEPENDS =3D "ncurses bison-native libcap libpcre2 groff-native"
> +DEPENDS =3D "ncurses bison-native libcap groff-native"
>=20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar=
.xz"
>  SRC_URI[sha256sum] =3D "36fa734374b44783582cec09bcd67822e2f992c779ec1624=
ab5596df078d2f81"
> @@ -44,7 +44,9 @@ ALTERNATIVE_LINK_NAME[sh] =3D "${base_bindir}/sh"
>  ALTERNATIVE_TARGET[sh] =3D "${base_bindir}/${BPN}"
>  ALTERNATIVE_PRIORITY =3D "90"
>=20
> +PACKAGECONFIG ??=3D "pcre"
>  PACKAGECONFIG[gdbm] =3D "--enable-gdbm,--disable-gdbm,gdbm"
> +PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre2"
>=20
> zsh/pcre module is link=3Ddynamic only and the recipe uses --disable-dyna=
mic,
> so the module is not built as such.=20
>=20
> Making pcre a PACKAGECONFIG enabled by default, started passing
> --enable-pcre, which zsh never got before (its default is off). configure
> then runs pcre2-config, but libpcre2 inherits binconfig-disabled, so
> `pcre2-config --cflags` returns bogus stuff. One can fix that by using pk=
gconfig
> or writing a small wrapper for pcre2-config using pkgconfig but servees n=
o
> point if dynamic modules are disabled.
>=20
> Other patch to turn gdbm into a packageconfig also has same problem.

What would be your solution here? Would you prefer the pkgconfig solution?
Should we remove is "=E2=80=94disable-dynamic=E2=80=9D if one is enabling p=
cre2?

gdbm is off by default. So should we remove it from DEPENDS and remove =
=E2=80=9C=E2=80=94disable-gdbm=E2=80=9D ?

/Sean

>    # Needed for manpages.bbclass, but they're always installed
>  PACKAGECONFIG[manpages] =3D ""
>=20
> --=20
> 2.55.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131748): https://lists.openembedded.org/g/openembedde=
d-devel/message/131748
> Mute This Topic: https://lists.openembedded.org/mt/122055384/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20



