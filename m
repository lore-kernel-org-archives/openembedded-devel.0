Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA4B6BC86
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 05:53:37 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id n21so24617801qtl.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 21:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ps4tf67U5PzKUEsTFPxD1y9lMmMjh4jpAND/pRIIBjw=;
	b=Za9cxCfjqWUsalfczRUldAaO9YhF6zQJPWLVS7ejuckHfUDZSdMdQzp50H9OqtybVD
	tlTGIXkXdJdhyiW14KLjn2A/ARBAdB1cwslr/SeG5giXHCGHnB8l6YJV+lkhQyrqXgfN
	nmSJ/45rslJ520wVfXpNZK6nShyOhgF22drv2+VKyxA0vR+PQofK7LfQWHix8dgWSFx1
	s4iwzyq+CLxMzUDTWb0uh5dFMWmrz6zmtyWf6I2EoEqorwBOifSuhuR5iQRVugs5tGNw
	BFIkasw/LLy8Ao8JNWX2qaek6kPy3a4dMvN9GZC9Gw9nrPV5oX/r7R4ErV5Ql6XgAcqG
	GArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ps4tf67U5PzKUEsTFPxD1y9lMmMjh4jpAND/pRIIBjw=;
	b=VX2A3H8qap78uXxu4Z+xG0+enA7PL16DbZUtTFsPhwu5se7zm71JQg0zrCMJ2KiAu3
	7gOB7wW01BIzQIbcAxtVmZCJtPGdGDHtoU5WC52SY9qlJxMAfNgIa7QGGBlxYQwqAR2S
	2X/trf8Uj/u8h9y/W3Z5SfKlFgrkveA7ebibo0c/n71Am6Z6pYBFSrNrfgP9BBcRoviT
	igLmUQQIAgc66Ua4DGac6vs3iMDu40KOPbBw4phdP/GYv/fFlFMBu2MG/3RUn3By30nQ
	7iy1DR75bypDr8V3/TW9BGL/uOQ+sl3dy1lkdgWuxLP8cKnk0SrRzhg2bjyQs+uZGxRP
	NxlA==
X-Gm-Message-State: AA+aEWaiJCLV2U23hsoS2ahxiweqz1lFga1md7oNGVbTs9/OjfuyfUNO
	zA0MW/8/OEmnOPcAb3gD9VL5JdymivUCFFPZfRM=
X-Google-Smtp-Source: AFSGD/WLJ2uMVJfWrs3hwBlWt8aKfDX1iQgaQotKh7hGfd8y+Cq7B9mbal0qrCxrO+I764QiA/S7QcgrXSn466ObZi4=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr33054335qtn.254.1543384418679;
	Tue, 27 Nov 2018 21:53:38 -0800 (PST)
MIME-Version: 1.0
References: <20181119172519.28377-1-max+openembedded@blarg.de>
In-Reply-To: <20181119172519.28377-1-max+openembedded@blarg.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Nov 2018 21:53:12 -0800
Message-ID: <CAMKF1srm_TiixkGadQhAk-dLTj2CmKoj47QmKOf=9OEtK+VjJQ@mail.gmail.com>
To: max+openembedded@blarg.de
Cc: Max Kellermann <max.kellermann@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] mpd: update to 0.21.3
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
X-List-Received-Date: Wed, 28 Nov 2018 05:53:38 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Max

it fails to build with systemd see
http://errors.yoctoproject.org/Errors/Details/202303/

It seems the new meson change is not installing the system unit files
and socket file during do_install properly, one way is that we explicitly
install/copy them during do_install, but I think its better to fix it in mpd
itself if possible

On Mon, Nov 19, 2018 at 9:25 AM Max Kellermann
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
>  .../recipes-multimedia/musicpd/mpd_0.21.3.bb  | 103 ++++++++++++++++++
>  2 files changed, 103 insertions(+), 99 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
>  create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.3.bb
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
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.3.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.3.bb
> new file mode 100644
> index 000000000..65ee0f58e
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.3.bb
> @@ -0,0 +1,103 @@
> +SUMMARY = "Music Player Daemon"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +HOMEPAGE ="http://www.musicpd.org"
> +
> +inherit meson useradd systemd pkgconfig
> +
> +DEPENDS += " \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
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
> +SRCREV = "43df4a7500daa50802b2e5fd0f33a798fa4aec36"
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_unitdir}/system -Dsystemd_user_unit_dir=${systemd_unitdir}/user', '-Dsystemd=disabled', d)}"
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
> +PACKAGECONFIG[pcre] = "-Dpcre=enabled,-Dpcre=disabled,libcpre"
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

