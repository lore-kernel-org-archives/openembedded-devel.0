Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA4A7473A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Sep 2018 05:18:50 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id q20-v6so3209750qkc.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Sep 2018 22:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dLQH/b2lyoofZGcdH6vgp9wl5YQKwyqTDgiXdvT02zk=;
	b=Td1r11YaDSBNn2Z2nhG47nWLEDYj4mgMchcPRK4P1/mLh1m9bKkaX3RzRQFZi/xvF5
	LwKXljmqkOrOXu8luZklOyM6z+jyOMdH8tMRA+AE82xs2qSKoh7vEYeuzOJEI7XOE3X7
	M4TeKspBgOpO4q43QeFZVMAGg9aZ5H2cz1wxCUW8SMa60uqvyarY4aJdneSUOTq4DqrM
	ZZ6EsXhUXC9I9kSVPtBjF4aQcfGeYC6FPwnC0nKdvz/l1qOiFnaOFwumB+YUAcr5IZRE
	i+pyusZdrtAjwaxpHbsbpB6gth19bZcytBD3XFpAkfbG8w4X4AYAKXgWoZik+5zMc7UZ
	T3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dLQH/b2lyoofZGcdH6vgp9wl5YQKwyqTDgiXdvT02zk=;
	b=Zwha3/3qxP81Xit7xTlWBo5XoJr4jeFFG/C/3RFylYuKubKWyrfHtV9i6nJnifoSvZ
	n9sEdW9xcj/fIuuAJGSVrQ6u2v8cAREsJybSULsCToFqNicHxIDZvl+Z7ZU/fQJvkPzo
	OmAeuZv8P6MtxwhDrzDT0TozUDMxMk99uoeZ82BNWm6VxfEibhDbb0bnNzdkdeBIwkAU
	vVHDmOoeuUebNTuYgurw38NrV8J5iJ3/2MA9hU0Tra9q1+8g6LJv8pJUzjFKOLsBb+MR
	R7sf1DnPXQkpLJeLHEj515pAvKa1HJ06lqxT6h59h4T0umrbFuj4Csq2jQ6tjvHi1u1r
	eAMw==
X-Gm-Message-State: APzg51AukFW0q+LF89qegT5al5Y8s0I3mBXUn3tEnwB9QXDi5E/tVO8y
	hz7Pr1RMCltjNcIDprfhRJQLfW3WH59sI1A223Q=
X-Google-Smtp-Source: ANB0VdZFRZFzwooCnTlU3o62317Ywq42URwRFsj83RcpjeAdF7RCsJIDKSpZ9h/9xUC93rqgRrVEdM/QonEYCLaI1OQ=
X-Received: by 2002:a37:ac02:: with SMTP id e2-v6mr7540908qkm.2.1537507131086; 
	Thu, 20 Sep 2018 22:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20180918082608.1088-1-max+openembedded@blarg.de>
	<20180918082608.1088-6-max+openembedded@blarg.de>
In-Reply-To: <20180918082608.1088-6-max+openembedded@blarg.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Sep 2018 22:18:25 -0700
Message-ID: <CAMKF1spppZzWp1A2cuUSKPmiY8MOVmYt8=NfMvP1OiWoSfNpxg@mail.gmail.com>
To: max+openembedded@blarg.de
Cc: Max Kellermann <max.kellermann@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 6/8] [meta-oe] mpd: make lots of plugins optional
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
X-List-Received-Date: Fri, 21 Sep 2018 05:18:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 18, 2018 at 1:37 AM Max Kellermann
<max+openembedded@blarg.de> wrote:
>
> From: Max Kellermann <max.kellermann@gmail.com>
>
> The new options are enabled by default to avoid breaking existing
> configurations.
>
> Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
> ---
>  .../recipes-multimedia/musicpd/mpd_0.20.21.bb | 44 +++++++++----------
>  1 file changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> index 67a0c9ff8..b9c6d62d6 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> @@ -6,37 +6,15 @@ HOMEPAGE ="http://www.musicpd.org"
>  inherit autotools useradd systemd pkgconfig
>
>  DEPENDS += " \
> -    alsa-lib \
> -    libsamplerate0 \
> -    libsndfile1 \
> -    libvorbis \
> -    libogg \
> -    faad2 \
> -    ffmpeg \
>      curl \
>      sqlite \
> -    bzip2 \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} \
>      tcp-wrappers \
> -    openal-soft \
>      yajl \
> -    jack \
> -    faad2 \
> -    flac \
> -    libao \
> -    fluidsynth \
> -    libcdio \
> -    wavpack \
> -    libopus \
> -    mpg123 \
> -    libmms \
> -    libmodplug \
>      boost \
>      icu \
>      dbus \
>      expat \
> -    zlib \
> -    libupnp \
>  "
>
>  # While this item does not require it, it depends on mpg123 which does
> @@ -52,12 +30,34 @@ SRC_URI[sha256sum] = "8322764dc265c20f05c8c8fdfdd578b0722e74626bef56fcd8eebfb01a
>  EXTRA_OECONF = "enable_bzip2=yes"
>  EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
>
> +PACKAGECONFIG ??= "aac alsa ao bzip2 ffmpeg flac fluidsynth iso9660 jack libsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack zlib"
> +
> +PACKAGECONFIG[aad] = "--enable-aac,--disable-aac,faad2"
                                      ^^^
should this be aac ?

> +PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
> +PACKAGECONFIG[ao] = "--enable-ao,--disable-ao,libao"
>  PACKAGECONFIG[audiofile] = "--enable-audiofile,--disable-audiofile,audiofile"
> +PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
>  PACKAGECONFIG[cdioparanoia] = "--enable-cdio-paranoia,--disable-cdio-paranoia,libcdio-paranoia"
> +PACKAGECONFIG[ffmpeg] = "--enable-ffmpeg,--disable-ffmpeg,ffmpeg"
> +PACKAGECONFIG[flac] = "--enable-flac,--disable-flac,flac"
> +PACKAGECONFIG[fluidsynth] = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
>  PACKAGECONFIG[id3tag] = "--enable-id3,--disable-id3,libid3tag"
> +PACKAGECONFIG[iso9660] = "--enable-iso9660,--disable-iso9660,libcdio"
> +PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
>  PACKAGECONFIG[lame] = "--enable-lame-encoder,--disable-lame-encoder,lame"
> +PACKAGECONFIG[libsamplerate] = "--enable-lsr,--disable-lsr,libsamplerate0"
>  PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
> +PACKAGECONFIG[mms] = "--enable-mms,--disable-mms,libmms"
> +PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
> +PACKAGECONFIG[modplug] = "--enable-modplug,--disable-modplug,libmodplug"
>  PACKAGECONFIG[smb] = "--enable-smbclient,--disable-smbclient,samba"
> +PACKAGECONFIG[sndfile] = "--enable-sndfile,--disable-sndfile,libsndfile1"
> +PACKAGECONFIG[upnp] = "--enable-upnp,--disable-upnp,libupnp"
> +PACKAGECONFIG[openal] = "--enable-openal,--disable-openal,openal-soft"
> +PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus libogg"
> +PACKAGECONFIG[vorbis] = "--enable-vorbis,--disable-vorbis,libvorbis libogg"
> +PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
> +PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
>
>  do_configure_prepend() {
>      sed -i -e 's|libsystemd-daemon|libsystemd|' ${S}/configure.ac
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

