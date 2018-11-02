Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 580A179F9F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Nov 2018 17:04:41 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id o125so4162992qkf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Nov 2018 10:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8MKB2kumnk++AWHOo33+g+RnH/RnUTD7deuKTPLm5Zc=;
	b=M/1DfgTVQwo+oCwWPhrxeiK/bS7WeHowK0QSTaYa/ccK2PBj8lSPIN/kFt0t0wbUpL
	aZJ8gdBE4hPiOrRL6hTLu1ry1NOs6iSJX/3onsoqtHfqG3URJnSRbzDBpeNOXVkSszNM
	wjaMZRIgBiyAEvUYbIb/QWOkOANcTrspMXUAdz+z/wMWpDQR+e6bFAxqIwhwjOQrlSkM
	tYK1GRb1Y7oF+JGERXZhHGi7r49jlOE5tKRv7P/easVsey9amZg8rz0kaLmjsGS/Oa7G
	KYQx9dMhXtl4d8DwDcEpnDp/Fh7DXZEAUzQYyloeBuKL6u4dUYNxD4lSByo1SOxrPAgW
	Fm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8MKB2kumnk++AWHOo33+g+RnH/RnUTD7deuKTPLm5Zc=;
	b=BQFosNLJPe3IaLqOifWejQOl/khlWnYtzdq05EzU9nUVjOJWhNB8tSA1lF/MZH608D
	GgUtXdcJM/0Ajum2YbdryM9kwacagrdRB0arwvbdxvvzrIFhYU1nurR4hqZh963N+SY3
	/A6Y1UC3kySWYyqoTYGNXqF401dARRxkaFunOWgLJpOPqhCtWGhmOaKxZbg4Wp4n8fGZ
	hGlNWdLWxl6TqND8HUDnZ2FeDU+cR5vfXnG8rUq1pUz96Smk9lKdeb5tWOHhZ3oTjJyL
	AL6z4E3axE5bkBJ9kEmoyEyKcrl/6vkB0GhrnRsirAbd1iphQSTIdJ5P2m5+fqXgxwkW
	Ip/w==
X-Gm-Message-State: AGRZ1gJVxSNoaD6ZIWsnoDUPsW2rMPjlqFjVjYqDvwX4FtxwPM9ZCF1I
	p574tx+YCIhs1Gi1ek+2apYfv+y2DkKU4tfIDc0=
X-Google-Smtp-Source: AJdET5dWboJ2A0wPejyujlaKCPQykihW9HcB4Lk/2iXonlDCPAknlaNIxqLV2q0SMSZUp0yb3wXZJo9if2X2C/IeO2M=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr7089437qtk.253.1541178281894; 
	Fri, 02 Nov 2018 10:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20181031191737.24419-1-max+openembedded@blarg.de>
In-Reply-To: <20181031191737.24419-1-max+openembedded@blarg.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Nov 2018 10:04:16 -0700
Message-ID: <CAMKF1sozGtLw_CDPm6Ku9Fctbu-MJb_pfuAhSAV0ayigPHh5_Q@mail.gmail.com>
To: max+openembedded@blarg.de
Cc: Max Kellermann <max.kellermann@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] mpd: update to 0.21
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
X-List-Received-Date: Fri, 02 Nov 2018 17:04:41 -0000
Content-Type: text/plain; charset="UTF-8"

fails to package when systemd is used see

http://errors.yoctoproject.org/Errors/Details/198188/

On Wed, Oct 31, 2018 at 12:17 PM Max Kellermann
<max+openembedded@blarg.de> wrote:
>
> From: Max Kellermann <max.kellermann@gmail.com>
>
> Most of the changes are because of MPD's switch from autotools to
> Meson.
>
> Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
> ---
>  .../recipes-multimedia/musicpd/mpd_0.20.22.bb |  99 -----------------
>  .../recipes-multimedia/musicpd/mpd_0.21.bb    | 101 ++++++++++++++++++
>  2 files changed, 101 insertions(+), 99 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
>  create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
> deleted file mode 100644
> index 6c6ad4237..000000000
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -SUMMARY = "Music Player Daemon"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> -HOMEPAGE ="http://www.musicpd.org"
> -
> -inherit autotools useradd systemd pkgconfig
> -
> -DEPENDS += " \
> -    curl \
> -    sqlite3 \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} \
> -    yajl \
> -    boost \
> -    icu \
> -    dbus \
> -    expat \
> -"
> -
> -SRC_URI = " \
> -    git://github.com/MusicPlayerDaemon/MPD;branch=v0.20.x \
> -    file://mpd.conf.in \
> -"
> -SRCREV = "9274bc15bc41bbe490fde847f8422468cc20375d"
> -S = "${WORKDIR}/git"
> -
> -EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
> -
> -PACKAGECONFIG ??= "alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upnp openal opus oss recorder vorbis wavpack zlib"
> -PACKAGECONFIG += "${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'aac', '', d)}"
> -
> -PACKAGECONFIG[aac] = "--enable-aac,--disable-aac,faad2"
> -PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
> -PACKAGECONFIG[ao] = "--enable-ao,--disable-ao,libao"
> -PACKAGECONFIG[audiofile] = "--enable-audiofile,--disable-audiofile,audiofile"
> -PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
> -PACKAGECONFIG[cdioparanoia] = "--enable-cdio-paranoia,--disable-cdio-paranoia,libcdio-paranoia"
> -PACKAGECONFIG[daemon] = "--enable-daemon,--disable-daemon"
> -PACKAGECONFIG[ffmpeg] = "--enable-ffmpeg,--disable-ffmpeg,ffmpeg"
> -PACKAGECONFIG[fifo] = "--enable-fifo,--disable-fifo"
> -PACKAGECONFIG[flac] = "--enable-flac,--disable-flac,flac"
> -PACKAGECONFIG[fluidsynth] = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
> -PACKAGECONFIG[httpd] = "--enable-httpd-output,--disable-httpd-output"
> -PACKAGECONFIG[id3tag] = "--enable-id3,--disable-id3,libid3tag"
> -PACKAGECONFIG[iso9660] = "--enable-iso9660,--disable-iso9660,libcdio"
> -PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
> -PACKAGECONFIG[lame] = "--enable-lame-encoder,--disable-lame-encoder,lame"
> -PACKAGECONFIG[libsamplerate] = "--enable-lsr,--disable-lsr,libsamplerate0"
> -PACKAGECONFIG[libwrap] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
> -PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
> -PACKAGECONFIG[mms] = "--enable-mms,--disable-mms,libmms"
> -PACKAGECONFIG[modplug] = "--enable-modplug,--disable-modplug,libmodplug"
> -PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
> -PACKAGECONFIG[openal] = "--enable-openal,--disable-openal,openal-soft"
> -PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus libogg"
> -PACKAGECONFIG[oss] = "--enable-oss,--disable-oss,"
> -PACKAGECONFIG[recorder] = "--enable-recorder-output,--disable-recorder-output"
> -PACKAGECONFIG[smb] = "--enable-smbclient,--disable-smbclient,samba"
> -PACKAGECONFIG[sndfile] = "--enable-sndfile,--disable-sndfile,libsndfile1"
> -PACKAGECONFIG[upnp] = "--enable-upnp,--disable-upnp,libupnp"
> -PACKAGECONFIG[vorbis] = "--enable-vorbis,--disable-vorbis,libvorbis libogg"
> -PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
> -PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
> -
> -do_configure_prepend() {
> -    sed -i -e 's|libsystemd-daemon|libsystemd|' ${S}/configure.ac
> -}
> -
> -do_install_append() {
> -    install -o mpd -d \
> -        ${D}/${localstatedir}/lib/mpd \
> -        ${D}/${localstatedir}/lib/mpd/playlists
> -    install -m775 -o mpd -g mpd -d \
> -        ${D}/${localstatedir}/lib/mpd/music
> -
> -    install -d ${D}/${sysconfdir}
> -    install -m 644 ${WORKDIR}/mpd.conf.in ${D}/${sysconfdir}/mpd.conf
> -    sed -i \
> -        -e 's|%music_directory%|${localstatedir}/lib/mpd/music|' \
> -        -e 's|%playlist_directory%|${localstatedir}/lib/mpd/playlists|' \
> -        -e 's|%db_file%|${localstatedir}/lib/mpd/mpd.db|' \
> -        -e 's|%log_file%|${localstatedir}/log/mpd.log|' \
> -        -e 's|%state_file%|${localstatedir}/lib/mpd/state|' \
> -        ${D}/${sysconfdir}/mpd.conf
> -
> -    # we don't need the icon
> -    rm -rf ${D}${datadir}/icons
> -}
> -
> -RPROVIDES_${PN} += "${PN}-systemd"
> -RREPLACES_${PN} += "${PN}-systemd"
> -RCONFLICTS_${PN} += "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} = "mpd.socket"
> -
> -USERADD_PACKAGES = "${PN}"
> -USERADD_PARAM_${PN} = " \
> -    --system --no-create-home \
> -    --home ${localstatedir}/lib/mpd \
> -    --groups audio \
> -    --user-group mpd"
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.bb
> new file mode 100644
> index 000000000..c18b0ea28
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.bb
> @@ -0,0 +1,101 @@
> +SUMMARY = "Music Player Daemon"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +HOMEPAGE ="http://www.musicpd.org"
> +
> +inherit meson useradd systemd pkgconfig
> +
> +DEPENDS += " \
> +    curl \
> +    sqlite3 \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} \
> +    yajl \
> +    boost \
> +    icu \
> +    dbus \
> +    expat \
> +"
> +
> +SRC_URI = " \
> +    git://github.com/MusicPlayerDaemon/MPD;branch=v0.21.x \
> +    file://mpd.conf.in \
> +"
> +SRCREV = "795789e79d4ea1cc6555323ff6f8e33abc676278"
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd_system_unit_dir=${systemd_unitdir}/system -Dsystemd_user_unit_dir=${systemd_unitdir}/user', '', d)}"
> +
> +PACKAGECONFIG ??= "alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upnp openal opus oss recorder vorbis wavpack zlib"
> +PACKAGECONFIG += "${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'aac', '', d)}"
> +
> +PACKAGECONFIG[aac] = "-Dfaad=enabled,-Dfaad=disabled,faad2"
> +PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib"
> +PACKAGECONFIG[ao] = "-Dao=enabled,-Dao=disabled,libao"
> +PACKAGECONFIG[audiofile] = "-Daudiofile=enabled,-Daudiofile=disabled,audiofile"
> +PACKAGECONFIG[bzip2] = "-Dbzip2=enabled,-Dbzip2=disabled,bzip2"
> +PACKAGECONFIG[cdioparanoia] = "-Dcdio=enabled-paranoia,-Dcdio=disabled-paranoia,libcdio-paranoia"
> +PACKAGECONFIG[daemon] = "-Ddaemon=enabled,-Ddaemon=false"
> +PACKAGECONFIG[ffmpeg] = "-Dffmpeg=enabled,-Dffmpeg=disabled,ffmpeg"
> +PACKAGECONFIG[fifo] = "-Dfifo=true,-Dfifo=false"
> +PACKAGECONFIG[flac] = "-Dflac=enabled,-Dflac=disabled,flac"
> +PACKAGECONFIG[fluidsynth] = "-Dfluidsynth=enabled,-Dfluidsynth=disabled,fluidsynth"
> +PACKAGECONFIG[httpd] = "-Dhttpd=true,-Dhttpd=false"
> +PACKAGECONFIG[id3tag] = "-Did3tag=enabled,-Did3tag=disabled,libid3tag"
> +PACKAGECONFIG[iso9660] = "-Diso9660=enabled,-Diso9660=disabled,libcdio"
> +PACKAGECONFIG[jack] = "-Djack=enabled,-Djack=disabled,jack"
> +PACKAGECONFIG[lame] = "-Dlame=enabled,-Dlame=disabled,lame"
> +PACKAGECONFIG[libsamplerate] = "-Dlibsamplerate=enabled,-Dlibsamplerate=disabled,libsamplerate0"
> +PACKAGECONFIG[libwrap] = "-Dlibwrap=enabled,-Dlibwrap=disabled,tcp-wrappers"
> +PACKAGECONFIG[mad] = "-Dmad=enabled,-Dmad=disabled,libmad"
> +PACKAGECONFIG[mms] = "-Dmms=enabled,-Dmms=disabled,libmms"
> +PACKAGECONFIG[modplug] = "-Dmodplug=enabled,-Dmodplug=disabled,libmodplug"
> +PACKAGECONFIG[mpg123] = "-Dmpg123=enabled,-Dmpg123=disabled,mpg123"
> +PACKAGECONFIG[openal] = "-Dopenal=enabled,-Dopenal=disabled,openal-soft"
> +PACKAGECONFIG[opus] = "-Dopus=enabled,-Dopus=disabled,libopus libogg"
> +PACKAGECONFIG[oss] = "-Doss=enabled,-Doss=disabled,"
> +PACKAGECONFIG[qobuz] = "-Dqobuz=enabled,-Dqobuz=disabled,curl yajl libgcrypt"
> +PACKAGECONFIG[recorder] = "-Drecorder=true,-Drecorder=false"
> +PACKAGECONFIG[smb] = "-Dsmbclient=enabled,-Dsmbclient=disabled,samba"
> +PACKAGECONFIG[sndfile] = "-Dsndfile=enabled,-Dsndfile=disabled,libsndfile1"
> +PACKAGECONFIG[tidal] = "-Dtidal=enabled,-Dtidal=disabled,curl yajl"
> +PACKAGECONFIG[udisks] = "-Dudisks=enabled,-Dudisks=disabled,dbus,udisks2"
> +PACKAGECONFIG[upnp] = "-Dupnp=enabled,-Dupnp=disabled,libupnp"
> +PACKAGECONFIG[vorbis] = "-Dvorbis=enabled,-Dvorbis=disabled,libvorbis libogg"
> +PACKAGECONFIG[wavpack] = "-Dwavpack=enabled,-Dwavpack=disabled,wavpack"
> +PACKAGECONFIG[zlib] = "-Dzlib=enabled,-Dzlib=disabled,zlib"
> +
> +do_install_append() {
> +    install -o mpd -d \
> +        ${D}/${localstatedir}/lib/mpd \
> +        ${D}/${localstatedir}/lib/mpd/playlists
> +    install -m775 -o mpd -g mpd -d \
> +        ${D}/${localstatedir}/lib/mpd/music
> +
> +    install -d ${D}/${sysconfdir}
> +    install -m 644 ${WORKDIR}/mpd.conf.in ${D}/${sysconfdir}/mpd.conf
> +    sed -i \
> +        -e 's|%music_directory%|${localstatedir}/lib/mpd/music|' \
> +        -e 's|%playlist_directory%|${localstatedir}/lib/mpd/playlists|' \
> +        -e 's|%db_file%|${localstatedir}/lib/mpd/mpd.db|' \
> +        -e 's|%log_file%|${localstatedir}/log/mpd.log|' \
> +        -e 's|%state_file%|${localstatedir}/lib/mpd/state|' \
> +        ${D}/${sysconfdir}/mpd.conf
> +
> +    # we don't need the icon
> +    rm -rf ${D}${datadir}/icons
> +
> +    # we don't need the systemd user unit
> +    rm -rf ${D}${systemd_unitdir}/user
> +}
> +
> +RPROVIDES_${PN} += "${PN}-systemd"
> +RREPLACES_${PN} += "${PN}-systemd"
> +RCONFLICTS_${PN} += "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} = "mpd.socket"
> +
> +USERADD_PACKAGES = "${PN}"
> +USERADD_PARAM_${PN} = " \
> +    --system --no-create-home \
> +    --home ${localstatedir}/lib/mpd \
> +    --groups audio \
> +    --user-group mpd"
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

