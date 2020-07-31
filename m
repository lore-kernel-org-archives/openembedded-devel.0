Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.3447.1596227027253226315
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 13:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rEfnjedb;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d1so17937419plr.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 13:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=hUj7Dico4ChcrYJIveRBakcD6tHhXUQfLgNvFPDnDNc=;
        b=rEfnjedbuqkiiF2bogPIqCFeWXbi3tJIImPOZUBJPSj8QjV9SN2ytVPEuGMjPKBLU2
         vrgwYlvnuNnJrZ6AWhM9jePyHZKkGVg+ElTxcKiPB3I+6+G7HNtx8tJ75L1uwjEUUt04
         2KnZ9FVlMB0JbOBhZnXbkxj+Zaf5lvDjKRjJF9g9JdUScRxf2KlkBz8rorHUJ47/34+2
         47cGmuQHSUXrSIoJym2qOP78gJGtdyMprFHYFmJp+iu+gwe7IcoBseow6ODRguK8EkD9
         DyQFPosN5P2+wt0uHU8sZxRuUu0otodukqa4pJKSZOj+zV+eacz42Khg7I8fHYQtFRPn
         Ofyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hUj7Dico4ChcrYJIveRBakcD6tHhXUQfLgNvFPDnDNc=;
        b=f44R2sk5+FW4hUr4m9y6/DtzjcCrugu3zuQ7UPmLZB1jkKToE5NwERlNyKYeaMYQ6H
         fc2AWafeeUQDLKl2OeYb+x6EfXBjFHFW9uY/Fsul9BtS3Is4Vsp61LnciWNOCvhW/I1e
         nDAq++leTVRL4GE+YvSjn0KGSIsnmZHw/YwqLoMKxfn9QJGBwxxkDXuW2ZCXZQ6Dz9G7
         vcwjvjApYScc7w5nQuzMgNmZdrwKVF4ZfssJkskaolw76F4NXWiqlixjhkHliarz4ped
         FVG+qnbBfrjGJaus5JPaJtGovVHAhGBcki1eU1xtXW38CIejr6ldplqZf8WOWwlFJkYI
         M5mw==
X-Gm-Message-State: AOAM531NCTyn/VkWRjIxPETnQcFlUul9Cm+eYF3cBZL5L5sh804nxDYZ
	Paf9u3J6oDWkN+LNpcDs5nkuBOOvRWI=
X-Google-Smtp-Source: ABdhPJx5AEKlWtYnx9rUugv9Ovd2V8o/I8LfCsKfKxkgdgUe6kcaIE9c499nEpdJQ65MVuLwwiXnKw==
X-Received: by 2002:a17:902:368:: with SMTP id 95mr5132131pld.279.1596227026386;
        Fri, 31 Jul 2020 13:23:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::e841? ([2601:646:9200:4e0::e841])
        by smtp.gmail.com with ESMTPSA id x7sm11015527pfc.209.2020.07.31.13.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2020 13:23:45 -0700 (PDT)
Subject: Re: [oe] [PATCH][meta-multimedia] mpd: update to 0.21.25
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20200729094903.3155985-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <0928d3ec-feeb-b090-56ae-6a13734526dc@gmail.com>
Date: Fri, 31 Jul 2020 13:23:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200729094903.3155985-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

seeing below error when systemd is in distro

http://errors.yoctoproject.org/Errors/Details/426697/

On 7/29/20 2:49 AM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   .../recipes-multimedia/musicpd/mpd_0.20.22.bb | 101 ------------------
>   .../recipes-multimedia/musicpd/mpd_0.21.25.bb |  96 +++++++++++++++++
>   2 files changed, 96 insertions(+), 101 deletions(-)
>   delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
>   create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.25.bb
> 
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
> deleted file mode 100644
> index 818b9271f..000000000
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
> +++ /dev/null
> @@ -1,101 +0,0 @@
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
> -    file://0001-StringBuffer-Include-cstddef-for-size_t.patch \
> -    file://0002-Include-stdexcept-for-runtime_error.patch \
> -"
> -SRCREV = "9274bc15bc41bbe490fde847f8422468cc20375d"
> -S = "${WORKDIR}/git"
> -
> -EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
> -
> -PACKAGECONFIG ??= "alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upnp openal opus oss recorder vorbis wavpack zlib"
> -PACKAGECONFIG_append = " ${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'aac', '', d)}"
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
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.25.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.25.bb
> new file mode 100644
> index 000000000..7c65303a5
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.21.25.bb
> @@ -0,0 +1,96 @@
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
> +    file://0001-StringBuffer-Include-cstddef-for-size_t.patch \
> +"
> +SRCREV = "c67372f8af0419da2012bae743d96e272594b7f4"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
> +
> +PACKAGECONFIG ??= "alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9660 jack libsamplerate httpd mms mpg123 modplug sndfile upnp openal opus oss recorder vorbis wavpack zlib"
> +PACKAGECONFIG_append = " ${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'aac', '', d)}"
> +
> +PACKAGECONFIG[aac] = "-Dfaad=enabled,-Dfaad=disabled,faad2"
> +PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib"
> +PACKAGECONFIG[ao] = "-Dao=enabled,-Dao=disabled,libao"
> +PACKAGECONFIG[audiofile] = "-Daudiofile=enabled,-Daudiofile=disabled,audiofile"
> +PACKAGECONFIG[bzip2] = "-Dbzip2=enabled,-Dbzip2=disabled,bzip2"
> +PACKAGECONFIG[cdioparanoia] = "-Dcdio_paranoia=enabled,-Dcdio_paranoia=disabled,libcdio-paranoia"
> +PACKAGECONFIG[daemon] = "-Ddaemon=true,-Ddaemon=false"
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
> +PACKAGECONFIG[mad] = "-Dmad=enabled,-Dmad=disabled,libmad"
> +PACKAGECONFIG[mms] = "-Dmms=enabled,-Dmms=disabled,libmms"
> +PACKAGECONFIG[modplug] = "-Dmodplug=enabled,-Dmodplug=disabled,libmodplug"
> +PACKAGECONFIG[mpg123] = "-Dmpg123=enabled,-Dmpg123=disabled,mpg123"
> +PACKAGECONFIG[openal] = "-Dopenal=enabled,-Dopenal=disabled,openal-soft"
> +PACKAGECONFIG[opus] = "-Dopus=enabled,-Dopus=disabled,libopus libogg"
> +PACKAGECONFIG[oss] = "-Doss=enabled,-Doss=disabled,"
> +PACKAGECONFIG[recorder] = "-Drecorder=true,-Drecorder=false"
> +PACKAGECONFIG[smb] = "-Dsmbclient=enabled,-Dsmbclient=disabled,samba"
> +PACKAGECONFIG[sndfile] = "-Dsndfile=enabled,-Dsndfile=disabled,libsndfile1"
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
> 
> 
> 
> 
