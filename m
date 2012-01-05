Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RirpP-00059f-LI
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 19:14:17 +0100
Received: by lami14 with SMTP id i14so244772lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2012 10:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=P59YlH4QF0q9Oqd2EAynin4zDK4N7GWTz7bqw478JIU=;
	b=Vhzwso3o+VX6ROmjP2orqVOq2MejC9wf3zcZClS8t6HZSzl5wsO1cIZ7DABc1E+Nl/
	Y9iDXOxftF3gwyqML0xl9Vyi3bd/ll4qscnXIGrdTck1HLtyW35VXZ1lximLPrnstb3A
	jvINlvFPM9mxnYDKOI0KndZKbyytVCr3Qojxg=
Received: by 10.112.24.4 with SMTP id q4mr581037lbf.80.1325786812477; Thu, 05
	Jan 2012 10:06:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Thu, 5 Jan 2012 10:06:21 -0800 (PST)
In-Reply-To: <1325768156.22038.6.camel@localhost.localdomain>
References: <1325768156.22038.6.camel@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jan 2012 10:06:21 -0800
Message-ID: <CAMKF1spvw=d4nPRr52dxmpWGrOkow6dZ1gopRCiv2WA0bmfHow@mail.gmail.com>
To: philby john <pjohn@mvista.com>
Cc: koen@openembedded.org, mwester@dls.net,
	openembedded-devel@lists.openembedded.org, hrw@openembedded.org
Subject: Re: [PATCH] Fix ctorrent build failure by using --disable-maintainer-mode option
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
X-List-Received-Date: Thu, 05 Jan 2012 18:14:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 5, 2012 at 4:55 AM, philby john <pjohn@mvista.com> wrote:
> From: Philby John <pjohn@mvista.com>
> Date: Thu, 5 Jan 2012 18:08:00 +0530
> Subject: [PATCH] Fix ctorrent build failure by using --disable-maintainer=
-mode option
>
> ctorrent package fails with error "aclocal.m4:14: error: this file was
> generated for autoconf dnh3.3.1" as reported here
> lists.linuxtogo.org/pipermail/openembedded-devel/2008-October/006598.html
> Fix this by including --disable-maintainer-mode.
>
> Also since ctcs inherits ctorrent.inc add do_configure() there doing
> nothing.
>
> Signed-off-by: Philby John <pjohn@mvista.com>
> ---
> =C2=A0recipes/ctorrent/ctcs_1.4.1.bb =C2=A0 =C2=A0 | =C2=A0 =C2=A06 +++++=
-
> =C2=A0recipes/ctorrent/ctorrent.inc =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A06 =
++++++
> =C2=A0recipes/ctorrent/ctorrent_3.3.1.bb | =C2=A0 =C2=A02 +-
> =C2=A03 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/ctorrent/ctcs_1.4.1.bb b/recipes/ctorrent/ctcs_1.4.1=
.bb
> index 8680b0c..d1e084e 100644
> --- a/recipes/ctorrent/ctcs_1.4.1.bb
> +++ b/recipes/ctorrent/ctcs_1.4.1.bb
> @@ -5,7 +5,11 @@ RDEPENDS_${PN} =3D "perl perl-module-strict perl-module-=
socket perl-module-fcntl \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-module-errno perl-module-s=
ys-hostname"
>
> =C2=A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/dtorrent/ctcs-${PV}.tar.gz"
> -PR=3D"r1"
> +PR=3D"r2"
> +
> +do_configure () {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0:
> +}
>
> =C2=A0do_install () {
> =C2=A0 install -d ${D}/usr/bin
> diff --git a/recipes/ctorrent/ctorrent.inc b/recipes/ctorrent/ctorrent.in=
c
> index 8005fa9..e04c5d3 100644
> --- a/recipes/ctorrent/ctorrent.inc
> +++ b/recipes/ctorrent/ctorrent.inc
> @@ -8,3 +8,9 @@ DEPENDS =3D "openssl"
> =C2=A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/ctorrent/ctorrent-${PV}.tar.bz2"
>
> =C2=A0inherit autotools
> +
> +EXTRA_OECONF =3D "--disable-maintainer-mode"
> +
> +do_configure() {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runconf
> +}

why do you override do_configure ?
is it not able to reconfigure ?


