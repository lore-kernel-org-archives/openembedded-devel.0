Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 58A9477E06
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:59:51 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id s15so2510624uag.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 12:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CNYnsMpBjlu3MUHGt4n8B+1M9UAjApCCqkthboAlLAQ=;
	b=LPjjGRSBAayoH1LrPfZqKgC/A81yjswSq/SBA4JK9LlUHzhOB4mobC2qnirR+TiYQ8
	6/HABJnscV8MUEbMzmp+6VN+wx9GQGflG2XKFNUhTy18AFPqMnvU/ugwX0XFZM5k16n6
	D/JJxPSkUifQ6xwYBwf4bHsN1hijTLylNmLBB/HnhZiAIa+O5wwERQXpaVf7MEwP/sYs
	5ZTjPIydNHf/H9dZKu151t1QQb7EeEaWCc6fvFJOJI4eSiTnnfQTOAnKIOyTkDQrxeC6
	y6TKy8K2loVqYDY9JnovPvd1fb9hUl55icCfMUHJwBcTAUP2XkfWRPlcFvFXOkff6jb2
	pcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CNYnsMpBjlu3MUHGt4n8B+1M9UAjApCCqkthboAlLAQ=;
	b=pXYR2fqhu4kxvqShMgL/5q+2L3ECCupV8SjUYQT1hAyqTT2yqvpf8W6Uo7gc1rpg+K
	Vvgd5nBR1om5C6BM07IeBnNRKoUdSSI0AKq/2gBTd3P8z7VFrqGWthYnMGr6VsuteD0B
	oFai28kMON+8ZOVVL1fEecFn9KGWef8ATmvhbLMPkWcvWoH0kuPifh6h9nQOUOkFA4df
	l2JwgTkkxo3+pEP3b7G+oYzVHs7Nfkl8zhFXO/vMWg2FjcLBccstn6DueUwNQ56hQzXd
	w40wAufXt8KROhx4CJBZlm26h6ZvltN7YmZ6ZDZ4OQtQGArb+xrcqGj/YViHcIbihXgE
	ypBw==
X-Gm-Message-State: AHPjjUgfdCZTUza4rV1VbYTTUiAA8ZyiJBJQDCiUTsxrDNivunVMqHIj
	aqT3MCSNUPp4UIdjuOMyBaQRgyc96w==
X-Google-Smtp-Source: ADKCNb6yr9SY5RL64UTk5ZzylpoiQp8CyN+id2KecWyimmg7QPBDSl/iQSOGeD8UcfUYlxHeJn9pB0LHaSHSoYyrxwI=
X-Received: by 10.176.72.129 with SMTP id x1mr168501uac.163.1504727992349;
	Wed, 06 Sep 2017 12:59:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Wed, 6 Sep 2017 12:59:51 -0700 (PDT)
In-Reply-To: <1504725809-12825-31-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-31-git-send-email-mark.hatle@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 6 Sep 2017 21:59:51 +0200
Message-ID: <CALbNGRTmfx=4wMisDjkpkLmudikRdtf21YFtPjCK1FJJw7JMFQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 30/31] florence: update 0.6.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Sep 2017 19:59:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 6, 2017 at 9:23 PM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> From: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>
> * patches were either leftovers or do not match the code
> * DESCRIPTION -> shortened SUMMARY
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>
> Added gtk+3 dependency and resolved conflicts
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  .../florence/files/fix-no-atspi-compile.patch      | 30 ----------------=
------
>  .../recipes-support/florence/florence_0.5.4.bb     | 20 ---------------
>  .../recipes-support/florence/florence_0.6.3.bb     | 19 ++++++++++++++
>  3 files changed, 19 insertions(+), 50 deletions(-)
>  delete mode 100644 meta-gnome/recipes-support/florence/files/fix-no-atsp=
i-compile.patch
>  delete mode 100644 meta-gnome/recipes-support/florence/florence_0.5.4.bb
>  create mode 100644 meta-gnome/recipes-support/florence/florence_0.6.3.bb
>
> diff --git a/meta-gnome/recipes-support/florence/files/fix-no-atspi-compi=
le.patch b/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.p=
atch
> deleted file mode 100644
> index 0bb5dee..0000000
> --- a/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patc=
h
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -diff --git a/src/florence.c b/src/florence.c
> -index b27c31b..feadefe 100644
> ---- a/src/florence.c
> -+++ b/src/florence.c
> -@@ -44,12 +44,6 @@
> - /* exit signal */
> - static int flo_exit=3DFALSE;
> -
> --#ifdef ENABLE_AT_SPI2
> --void flo_check_show (struct florence *florence, AtspiAccessible *obj);
> --#else
> --void flo_check_show (struct florence *florence, Accessible *obj);
> --#endif
> --
> - /* Called on destroy event (systray quit or close window) */
> - void flo_destroy (void)
> - {
> -@@ -61,6 +55,12 @@ void flo_destroy (void)
> - }
> -
> - #ifdef AT_SPI
> -+#ifdef ENABLE_AT_SPI2
> -+void flo_check_show (struct florence *florence, AtspiAccessible *obj);
> -+#else
> -+void flo_check_show (struct florence *florence, Accessible *obj);
> -+#endif
> -+
> - /* Called to destroy the icon */
> - void flo_icon_destroy (GtkWidget *widget, gpointer user_data)
> - {
> diff --git a/meta-gnome/recipes-support/florence/florence_0.5.4.bb b/meta=
-gnome/recipes-support/florence/florence_0.5.4.bb
> deleted file mode 100644
> index 8ce85c9..0000000
> --- a/meta-gnome/recipes-support/florence/florence_0.5.4.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION =3D "Florence is a virtual keyboard (also called on-screen-k=
eyboard), which allows the user to input text through a touchscreen."
> -HOMEPAGE =3D "http://florence.sourceforge.net/english.html"
> -
> -#NOTICE: If florence can't find its gconf settings, you need to start fl=
orence with --config for one time and save the configuration once.
> -
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> -
> -PR =3D "r1"
> -
> -DEPENDS =3D "gtk+ libxml2 libglade librsvg libxtst gconf gconf-native ca=
iro intltool-native gnome-doc-utils libnotify gstreamer"
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/florence/florence/${PV}-gtk2/florence=
-${PV}.tar.bz2 \
> -           file://fix-no-atspi-compile.patch"
> -SRC_URI[md5sum] =3D "8d5c2367a28485bfcf577650b0badab7"
> -SRC_URI[sha256sum] =3D "26d33aa20d5fbf34ceeded4c41cb922d2988b6082e33d9ac=
c46dd7bfe56d31a1"
> -
> -inherit gettext autotools gconf pkgconfig
> -
> -EXTRA_OECONF =3D "--disable-scrollkeeper --without-docs --without-at-spi=
 --without-panelapplet --without-xrecord"
> diff --git a/meta-gnome/recipes-support/florence/florence_0.6.3.bb b/meta=
-gnome/recipes-support/florence/florence_0.6.3.bb
> new file mode 100644
> index 0000000..b9b7d0c
> --- /dev/null
> +++ b/meta-gnome/recipes-support/florence/florence_0.6.3.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "Florence is a virtual keyboard for touch screens"
> +HOMEPAGE =3D "http://florence.sourceforge.net/english.html"
> +
> +#NOTICE: If florence can't find its gconf settings, you need to start fl=
orence with --config for one time and save the configuration once.
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> +
> +DEPENDS =3D "gtk+3 libxml2 libglade librsvg libxtst gconf gconf-native c=
airo intltool-native gnome-doc-utils libnotify gstreamer1.0"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${PN}/${PN}/${PV}/${PN}-${PV}=
.tar.bz2"
> +SRC_URI[md5sum] =3D "8775051d7352f75dec5a86dc9964e8e0"
> +SRC_URI[sha256sum] =3D "422992fd07d285be73cce721a203e22cee21320d69b0fda1=
579ce62944c5091e"
> +
> +inherit gettext autotools gconf pkgconfig
> +
> +EXTRA_OECONF =3D "--disable-scrollkeeper --without-docs --without-at-spi=
 --without-panelapplet --without-xrecord"
> +
> +FILES_${PN} +=3D "${datadir}/glib-2.0/schemas"
> --
> 1.8.3.1
>
> --
There were certain reasons this was not accepted. Are these obsolete these =
days?

Andreas

