Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OtOj2-0000pH-L6
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 19:46:25 +0200
Received: by iwn2 with SMTP id 2so197632iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 10:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=pizHC16E1Sef9eaQ8vVVmV0JABbCXgVluAnLr9A/91U=;
	b=BnLe1HbuOlUIu7tFM0x83s4P3Xr/shAhYZxJgKsuDkH7qpa7WU1Bz6kUllnChnKce5
	znrz5YjhBOTZsktdCJE83Yy3QYIFbRYLVYjOCt/Jt0qTAqJ2652KSgXuJ2uvVaQMRTpM
	k8q5zA6XJWFR63UAvpu5Cxalx+D/WN/9vhWOo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=R4NgWKve0ZrnYcJz9DGce2EB2opKfopt2rxSQYMMMkOD6NiQX4TIMOS4wchX4f4heK
	zjct4tFLzrBnwxOERK/WJG2DoEM/npDtJti2lXebAPhh1x8ZkawEYkJVwgxDDifiaxQW
	sDNHP88Rn11yLdeqfHNHuODlkY6nrUZ/JvS9s=
Received: by 10.231.15.9 with SMTP id i9mr62588iba.58.1283967940257; Wed, 08
	Sep 2010 10:45:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Wed, 8 Sep 2010 10:45:20 -0700 (PDT)
In-Reply-To: <1283947246-30457-1-git-send-email-sledz@dresearch.de>
References: <4C86151D.50801@dresearch.de>
	<1283947246-30457-1-git-send-email-sledz@dresearch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Sep 2010 10:45:20 -0700
Message-ID: <AANLkTingMoUOwMbGaWOYAJuX_je9v-EWrq2TFZwW-jTM@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gtk+: fix configure problem for native build
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
X-List-Received-Date: Wed, 08 Sep 2010 17:46:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 8, 2010 at 5:00 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
> =A0recipes/gtk+/gtk+_2.18.6.bb | =A0 =A02 +-
> =A0recipes/gtk+/gtk+_2.20.0.bb | =A0 =A02 +-
> =A0recipes/gtk+/gtk+_2.20.1.bb | =A0 =A02 +-
> =A03 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/gtk+/gtk+_2.18.6.bb b/recipes/gtk+/gtk+_2.18.6.bb
> index 237689d..864f4ba 100644
> --- a/recipes/gtk+/gtk+_2.18.6.bb
> +++ b/recipes/gtk+/gtk+_2.18.6.bb
> @@ -16,7 +16,7 @@ XKBTOGGLE =3D " --disable-xkb"
> =A0XKBTOGGLE_angstrom =3D ""
>
> =A0EXTRA_OECONF =3D "--with-libtiff ${XKBTOGGLE} --disable-glibtest gio_c=
an_sniff=3Dyes"
> -EXTRA_OECONF_append_virtclass-native =3D " --without-libtiff --without-l=
ibjpeg"
> +EXTRA_OECONF_append_virtclass-native =3D " --without-libtiff --without-l=
ibjpeg --disable-cups"
>
> =A0PACKAGES_DYNAMIC =3D "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* =
gtk-printbackend-*"
>
> diff --git a/recipes/gtk+/gtk+_2.20.0.bb b/recipes/gtk+/gtk+_2.20.0.bb
> index 2c061b7..1e07e83 100644
> --- a/recipes/gtk+/gtk+_2.20.0.bb
> +++ b/recipes/gtk+/gtk+_2.20.0.bb
> @@ -20,7 +20,7 @@ XKBTOGGLE =3D " --disable-xkb"
> =A0XKBTOGGLE_angstrom =3D ""
>
> =A0EXTRA_OECONF =3D "--with-libtiff ${XKBTOGGLE} --disable-glibtest gio_c=
an_sniff=3Dyes"
> -EXTRA_OECONF_append_virtclass-native =3D " --without-libtiff --without-l=
ibjpeg"
> +EXTRA_OECONF_append_virtclass-native =3D " --without-libtiff --without-l=
ibjpeg --disable-cups"
>
> =A0PACKAGES_DYNAMIC =3D "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* =
gtk-printbackend-*"
>
> diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.bb
> index 1568e61..ca5e197 100644
> --- a/recipes/gtk+/gtk+_2.20.1.bb
> +++ b/recipes/gtk+/gtk+_2.20.1.bb
> @@ -24,7 +24,7 @@ XKBTOGGLE =3D " --disable-xkb"
> =A0XKBTOGGLE_angstrom =3D ""
>
> =A0EXTRA_OECONF =3D "--with-libtiff ${XKBTOGGLE} --disable-glibtest gio_c=
an_sniff=3Dyes"
> -EXTRA_OECONF_append_virtclass-native =3D " --without-libtiff --without-l=
ibjpeg"
> +EXTRA_OECONF_append_virtclass-native =3D " --without-libtiff --without-l=
ibjpeg --disable-cups"
>
> =A0PACKAGES_DYNAMIC =3D "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* =
gtk-printbackend-*"
>

Why are we disabling cups ? you could have added dependency on
cups-native instead if your build machine does not
have full installation of cups. you would also need to BBCLASSEXTEND
cups recipes.

> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


