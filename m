Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PY3RB-0005zx-K1
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 22:20:01 +0100
Received: by gwaa12 with SMTP id a12so2034891gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Dec 2010 13:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=MalU6d+TCMCUtGO/c6UPBM0JP9+zo/lqNNBnZiHdvbc=;
	b=SC04PNtRX7HJFEVbEiN+52CGCMgl/KiIerBE/CNmJLLrbyFMt0vMAEu52q5UJajOLx
	Dh16C1g1SoXDIcQRb99wE7VH3mPs1ZFKR6SVwZ2eNVO5bxKX/wuADmely5Ci+rB0mbVk
	xkDIx0uACsAKYLEl9hwubntuouZ1iZixoEC58=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Pql6AogZQtI1Es4COcsBl2JUxWWlcu4qa71NZDNOzRYh+OkLrddldEDVDdmeDcbEw8
	axh3xfc6ZJfUxxzrNJ4TSDHA8/AhnXyw/9iNFFb4OmGAox5RRPB0Obv/v/LLpMDnTw1e
	J1LFswjaHofMOZOkOZ/mO9BuymtInkP33MOfM=
Received: by 10.90.120.17 with SMTP id s17mr6056338agc.193.1293657581602; Wed,
	29 Dec 2010 13:19:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 29 Dec 2010 13:19:21 -0800 (PST)
In-Reply-To: <1293651953-2998-1-git-send-email-eric@eukrea.com>
References: <1293644563.4238.7.camel@mattotaupa>
	<1293651953-2998-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Dec 2010 13:19:21 -0800
Message-ID: <AANLkTimdAyrfzSq1zvFf1Nyg2xfrXZO2N-3a04=EKYpD@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] glib 2.26.1: fix compilation failure
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
X-List-Received-Date: Wed, 29 Dec 2010 21:20:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 29, 2010 at 11:45 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> during configure, pkgconfig detects dbus-1.pc which was installed
> by dbus-native and thus the compilation fails because it can't
> find dbus/dbus.h which is not yet installed for in the target's
> sysroot.
>
> This patch workaround this problem by not compiling the test program
> which depends on dbus's headers.
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/glib-2.0/glib-2.0_2.26.1.bb | =C2=A0 =C2=A03 ++-
> =C2=A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/glib-2.0/glib-2.0_2.26.1.bb b/recipes/glib-2.0/glib-=
2.0_2.26.1.bb
> index d95f894..e19fb9f 100644
> --- a/recipes/glib-2.0/glib-2.0_2.26.1.bb
> +++ b/recipes/glib-2.0/glib-2.0_2.26.1.bb
> @@ -10,7 +10,7 @@ DEPENDS =3D "glib-2.0-native gtk-doc zlib"
> =C2=A0DEPENDS_virtclass-native =3D "gettext-native gtk-doc-native \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 pkgconfig-native"
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =C2=A0SRC_URI =3D "\
> =C2=A0 http://ftp.gnome.org/pub/GNOME/sources/glib/2.26/glib-${PV}.tar.bz=
2;name=3Darchive \
> @@ -38,6 +38,7 @@ EXTRA_OECONF_append_glibc_arm =3D " =C2=A0--enable-incl=
uded-printf=3Dno "
>
> =C2=A0do_configure_prepend () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/glibconfig-sysdefs.=
h .
> + =C2=A0 =C2=A0 =C2=A0 sed -i -e "s:TEST_PROGS +=3D gdbus-serialization::=
g" =C2=A0${S}/gio/tests/Makefile.am
> =C2=A0}
>
> =C2=A0do_install_append() {
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


