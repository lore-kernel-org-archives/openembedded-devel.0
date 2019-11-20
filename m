Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 981F57F587
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 04:35:05 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id t8so27544606qtc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 20:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TsINgXVB5F3m6uuNdcyjEAzUgbMrpiNshQcplv92LDY=;
	b=T84RDthicgtKjOqu+UJfzFLa+NisnoIbm3ohp8vLaJ1pHZf279v73WQX+FEpK9gfEw
	buA5kBHoX9AIt3cn18agiN566YSg6KS5YzXCvKUWRQnBfn+UQJ+s8NLgRsLCeC+ecwKe
	Sql0jNiBVSezM26QQfePLYucD7/OQMQ3lnsTiStnC/ByiVbmsYPj61g4/BFOxUgjR73j
	t4BhmQv5QhV/dm+qe9KdXb804AMFFxh8JoFwnlGGz1AXqEdDRRhHwjKjymRmeB7Y8ih0
	gwNNXFlA382VbxBKNAUvh5DwLY2gjeCQsyGvu/jtzFjBdI64BTaiYSLxhO86NCu5TzEC
	/o0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TsINgXVB5F3m6uuNdcyjEAzUgbMrpiNshQcplv92LDY=;
	b=Fr/4qO+QmrlDcVpj84JkBPlied4v83oOtGML5e13ksbtUqWi0ww0LdVIPjlez5FEm3
	jy+gcrG15FlVQsJz9Ze30vNA6pUCWdieQLYQ4rnjECVOQVIuxMSR4brGX1hC9KnRq2qP
	qw7MV1WP7WmXAE/WlVK3BYAlseOexDK/+yD0HkSuT67uTUeAaA6pq9UJCd1zb+qGIWN8
	UWDtKi4QN78YvGHaimJfi4nyL2zrYTrJFDCHIrBXdEL3nHW92ThvvJMfHdu3k/34cbpF
	5fi2rLAAMYMAi0BAP8qm2zmHvA7nSwS8DoyX/bEHPomFtLEqWiIbPr2EsM13mnL+Q5Y8
	71GA==
X-Gm-Message-State: APjAAAVCmtMvfKrsghLVDZZ7I7BI1Q2zU4v+vcadWO+ALt0wHWzpiZoj
	i5r4w+ys6a9a6TUb9+s/3MpBp6Bahpx262DOa6w=
X-Google-Smtp-Source: APXvYqxAl+AHVUXYtyCshzwwm4Sw/KSw/u46yXdPt6SBdXBmPBdl5W1ws1tlhjPzolD3y8WrDMHi4RfKMuSJDhYPOdA=
X-Received: by 2002:ac8:2ddc:: with SMTP id q28mr825922qta.88.1574224506081;
	Tue, 19 Nov 2019 20:35:06 -0800 (PST)
MIME-Version: 1.0
References: <20191119071730.2682-1-schnitzeltony@gmail.com>
	<20191119071730.2682-4-schnitzeltony@gmail.com>
In-Reply-To: <20191119071730.2682-4-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Nov 2019 20:34:39 -0800
Message-ID: <CAMKF1sp-CsNE6A0MPBYCgbD0cXXHU89zQyeCTSjP83UtTh6krA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/9] tracker-miners: initial add 2.3.1
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
X-List-Received-Date: Wed, 20 Nov 2019 04:35:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:18 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> tracker-miners is a mandatory runtime-dependency for nautilus
>

fails to build on x86

https://errors.yoctoproject.org/Errors/Details/277884/

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../tracker/tracker-miners_2.3.1.bb           | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.1=
.bb
>
> diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.1.bb b/m=
eta-gnome/recipes-gnome/tracker/tracker-miners_2.3.1.bb
> new file mode 100644
> index 000000000..465145a15
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.1.bb
> @@ -0,0 +1,66 @@
> +SUMMARY =3D "Tracker miners and metadata extractors"
> +LICENSE =3D "GPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM =3D " \
> +    file://COPYING.GPL;md5=3Dee31012bf90e7b8c108c69f197f3e3a4 \
> +    file://COPYING.LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> +"
> +
> +DEPENDS =3D " \
> +    intltool-native \
> +    tracker \
> +    zlib \
> +"
> +
> +GNOMEBASEBUILDCLASS =3D "meson"
> +
> +inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages =
bash-completion distro_features_check
> +
> +SRC_URI[archive.md5sum] =3D "0321d8f4ad27e3fccdbc8384e5b3cb83"
> +SRC_URI[archive.sha256sum] =3D "7b1de06a7a79ea1c7813c8a21f8cd1c55f2b95f7=
99cf9f47f0204f3be8a590e0"
> +
> +# gobject-introspection is mandatory and cannot be configured
> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> +UNKNOWN_CONFIGURE_WHITELIST_append =3D " introspection"
> +
> +PACKAGECONFIG ??=3D " \
> +    ffmpeg \
> +    flac \
> +    gexiv2 \
> +    gstreamer \
> +    icu \
> +    libexif \
> +    libgsf \
> +    jpeg \
> +    png \
> +    tiff \
> +    xml \
> +    pdf \
> +"
> +
> +PACKAGECONFIG[ffmpeg]     =3D ",,ffmpeg"
> +PACKAGECONFIG[flac]       =3D "-Dflac=3Denabled,-Dflac=3Ddisabled,flac"
> +PACKAGECONFIG[gexiv2]     =3D ",,gexiv2"
> +PACKAGECONFIG[gstreamer]  =3D ",,gstreamer1.0 gstreamer1.0-plugins-base"
> +PACKAGECONFIG[gupnp]      =3D ",,gupnp-dlna"
> +PACKAGECONFIG[icu]        =3D ",,icu"
> +PACKAGECONFIG[libexif]    =3D "-Dexif=3Denabled,-Dexif=3Ddisabled,libexi=
f"
> +PACKAGECONFIG[libgsf]     =3D "-Dgsf=3Denabled,-Dgsf=3Ddisabled,libgsf"
> +PACKAGECONFIG[jpeg]       =3D "-Djpeg=3Denabled,-Djpeg=3Ddisabled,jpeg"
> +PACKAGECONFIG[png]        =3D "-Dpng=3Denabled,-Dpng=3Ddisabled,libpng"
> +PACKAGECONFIG[tiff]       =3D "-Dtiff=3Denabled,-Dtiff=3Ddisabled,tiff"
> +PACKAGECONFIG[xml]        =3D "-Dxml=3Denabled,-Dxml=3Ddisabled,libxml2"
> +PACKAGECONFIG[vorbis]     =3D "-Dvorbis=3Denabled,-Dvorbis=3Ddisabled,li=
bvorbis"
> +PACKAGECONFIG[pdf]        =3D "-Dpdf=3Denabled,-Dpdf=3Ddisabled,poppler"
> +PACKAGECONFIG[upower]     =3D ",,upower"
> +
> +# meta-selinux
> +PACKAGECONFIG[libseccomp] =3D ",,libseccomp"
> +# not yet in meta-gnome
> +PACKAGECONFIG[rss]        =3D "-Dminer_rss=3Dtrue,-Dminer_rss=3Dfalse,li=
bgrss"
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/tracker \
> +    ${libdir}/tracker-miners-2.0 \
> +    ${systemd_user_unitdir} \
> +"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

