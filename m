Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUWnM-0001Lg-6k
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 05:20:05 +0200
Received: by iwn34 with SMTP id 34so2803396iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 20:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=pZVidp4TwqMiIMAxedXcrDYWvAx8pUwg5of7ZHJySKs=;
	b=AN/i0B+mBGlMBwU4ZnkInRdcKoCQkPGDHdeUJKAsMad0JtoCkhaavyAGda9/ijiN7S
	oFEAmBq5Y9ORZ/rwVT7lz3NUQVncbTWxJ8dsfrRSDjWR0l0zN8IL8YXRbynWEi02ELOG
	7idG1BEfT1Y20ZBwUdiWs7XQ0BUCfagXYb7m0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=XvRGSNgxzu3ks1oW1BbeOKRQ6fl0pjww3iEHpvTmbsXulhaaoW9exgzQbCPBly3F4w
	09Zjdi7XSrNOWsJFYRg69ae6nMWk8JTb5f2pRFu1SNwlzuKx9IvrsYyZM6Dmx0giGoTg
	2USIhrDw9rtUUi5N0e6d5BnE/CBJD4+1XoTlk=
Received: by 10.231.170.3 with SMTP id b3mr76932ibz.122.1278040520198; Thu, 01 
	Jul 2010 20:15:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 1 Jul 2010 20:15:00 -0700 (PDT)
In-Reply-To: <4C2D3557.1040005@gmail.com>
References: <4C2AC6F3.3090603@gmail.com> <4C2AE659.7040201@gmail.com> 
	<4C2D3557.1040005@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Jul 2010 20:15:00 -0700
Message-ID: <AANLkTinafp-D2P80kjuRpjGjUfsZddkEJl9C0mei68GX@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] dbus: fix building on mipsel and clean up PIE/pie fix to work again.
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
X-List-Received-Date: Fri, 02 Jul 2010 03:20:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 1, 2010 at 5:39 PM, Graham Gower <graham.gower@gmail.com> wrote=
:
> Subject: [PATCH v3] dbus: fix building on mipsel and clean up PIE/pie fix=
 to work again.
>
> D-Bus fails to link with --gc-sections on mipsel.
>
> | =A0 CCLD =A0 dbus-daemon
> | collect2: ld returned 1 exit status
> | make[2]: *** [dbus-daemon] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | /home/grg/oe2/tmp/cross/mipsel/lib/gcc/mipsel-oe-linux/4.4.4/../../../.=
./mipsel-oe-linux/bin/ld: can not make stub section: File format not recogn=
ized
> | /home/grg/oe2/tmp/cross/mipsel/lib/gcc/mipsel-oe-linux/4.4.4/../../../.=
./mipsel-oe-linux/bin/ld: failed to set dynamic section sizes: File format =
not recognized
>
> Also, the previous fPIE/pie fix no longer works.
> While here, clean up INC_PR.
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

looks good.

Acked-by: Khem Raj <raj.khem@gmail.com>


> ---
> =A0recipes/dbus/dbus.inc =A0 =A0 =A0 | =A0 11 ++++++++---
> =A0recipes/dbus/dbus_1.2.20.bb | =A0 =A02 ++
> =A0recipes/dbus/dbus_1.2.22.bb | =A0 =A02 ++
> =A0recipes/dbus/dbus_1.2.24.bb | =A0 =A02 ++
> =A0recipes/dbus/dbus_1.3.0.bb =A0| =A0 =A04 ++--
> =A05 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/recipes/dbus/dbus.inc b/recipes/dbus/dbus.inc
> index ec66960..55a156d 100644
> --- a/recipes/dbus/dbus.inc
> +++ b/recipes/dbus/dbus.inc
> @@ -4,7 +4,7 @@ SECTION =3D "base"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "expat glib-2.0 virtual/libintl libsm libice virtual/libx1=
1"
>
> -INC_PR =3D "r18"
> +INC_PR =3D "r19"
>
> =A0SRC_URI =3D "\
> =A0 http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz;name=3Ddb=
us \
> @@ -35,8 +35,13 @@ EXTRA_OECONF =3D "\
> =A0 ${EXTRA_OECONF_X} \
> =A0"
>
> -do_compile_prepend_mipsel() {
> - =A0 =A0 =A0 sed -i -e 's/\-fPIE//' -e 's/\-pie\ \-Wl\,\-z\,relro//' bus=
/Makefile
> +# On mipsel, D-Bus fails to link with --gc-sections and segfaults before=
 main()
> +# when built with -fPIE/-pie.
> +do_configure_prepend_mipsel() {
> + =A0 =A0 =A0 sed -i -e 's/\-fPIE//' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e 's/\-pie\ \-Wl\,\-z\,relro//' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e 's/-Wl,--gc-sections//' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${S}/configure.in
> =A0}
>
> =A0do_install_append() {
> diff --git a/recipes/dbus/dbus_1.2.20.bb b/recipes/dbus/dbus_1.2.20.bb
> index 43805a5..25cc5ac 100644
> --- a/recipes/dbus/dbus_1.2.20.bb
> +++ b/recipes/dbus/dbus_1.2.20.bb
> @@ -1,5 +1,7 @@
> =A0include dbus.inc
>
> +PR =3D "${INC_PR}.0"
> +
> =A0SRC_URI =3D "\
> =A0 http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz;name=3Ddb=
us \
> =A0 file://tmpdir.patch \
> diff --git a/recipes/dbus/dbus_1.2.22.bb b/recipes/dbus/dbus_1.2.22.bb
> index 35a5267..74386ed 100644
> --- a/recipes/dbus/dbus_1.2.22.bb
> +++ b/recipes/dbus/dbus_1.2.22.bb
> @@ -1,5 +1,7 @@
> =A0include dbus.inc
>
> +PR =3D "${INC_PR}.0"
> +
> =A0SRC_URI =3D "\
> =A0 http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz;name=3Ddb=
us \
> =A0 file://tmpdir.patch \
> diff --git a/recipes/dbus/dbus_1.2.24.bb b/recipes/dbus/dbus_1.2.24.bb
> index 4e408e7..a2b7eea 100644
> --- a/recipes/dbus/dbus_1.2.24.bb
> +++ b/recipes/dbus/dbus_1.2.24.bb
> @@ -1,5 +1,7 @@
> =A0include dbus.inc
>
> +PR =3D "${INC_PR}.0"
> +
> =A0SRC_URI =3D "\
> =A0 http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz;name=3Ddb=
us \
> =A0 file://tmpdir.patch \
> diff --git a/recipes/dbus/dbus_1.3.0.bb b/recipes/dbus/dbus_1.3.0.bb
> index 830816f..a923166 100644
> --- a/recipes/dbus/dbus_1.3.0.bb
> +++ b/recipes/dbus/dbus_1.3.0.bb
> @@ -1,5 +1,7 @@
> =A0include dbus.inc
>
> +PR =3D "${INC_PR}.0"
> +
> =A0SRC_URI =3D "\
> =A0 http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
> =A0 \
> @@ -20,7 +22,5 @@ SRC_URI =3D "\
> =A0# This is the development version of dbus that will lead to 1.4.x
> =A0DEFAULT_PREFERENCE =3D "-1"
>
> -PR =3D "r2"
> -
> =A0SRC_URI[md5sum] =3D "b3298d5ce0e4ad4731b1e4e1787d56bb"
> =A0SRC_URI[sha256sum] =3D "fe32b49667894cf91b0a97503163be5c4814ecf67259e8=
feb26d1ba57cb03dae"
> --
> 1.7.1
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


