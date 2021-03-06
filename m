Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.6053.1615028804115834524
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Mar 2021 03:06:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uCKhvczX;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: h4nn35.work@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id d20so5552372oiw.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Mar 2021 03:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=DjzQVDceKpnhVN4RuynWLolTojnv+srlIFsrQNDIyVM=;
        b=uCKhvczXVK4IwxC/uVgcyOmH5ctKc8+Wx9uiAjRSLMH6JmmXQFaE57Y4mub+LRDWBV
         s/45t5+ZUBXxIFNlgAandoZL4gOPomdZWFcaxnWqjDDtMNf00RJm1vZUIj3uRWznU4BF
         onc9zWQZMatDhQLpEEGkR+drqKem+FFhb7fRqI1w9uLNne1JrW1g8N/Ke4/GsSkzDA24
         IQO7g91xHYR4+eW2GjWkW1aDwIM4+NiURGIv1uJr1gPLVOuypKSxN1/a2RWrrhuuRpC1
         jOZldiGULyXtRITSoVjvgEhmd4XzCvaKQMW5GwX+87eoA2Yyg7kXVdy76bAdXJz7pY95
         Hnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=DjzQVDceKpnhVN4RuynWLolTojnv+srlIFsrQNDIyVM=;
        b=KftsMvtFf1kAOUuW4VFwK5KGZjafSdUW+S3Y4fr6xh+BhBbU9uBH0tqKr6W7B1hJaD
         5r6cXOuLgUMk4yHuoKw/18Gmcv0D9mIaYagDxrlNoxsS2GprVnojxYAsk/14Qba/pnGe
         CO1EuKz3i8lgQ0C5a31vl1SLBS893lmGOsk2VxVQgBvQ1jaVXTMRtTBbpMMH6lUHaMoy
         zZmrEFyLxPEnSHPtkD4NBfxzhoUp7o0mXxqyUEHles7p+sEwEDoVM3F0PH3GBFlouD5N
         3diaFzVRJxK87tEK3SYsbSQtT4CccAechjswYLj0nMY7k1J9HYhla3T4ecBic2SJb+9K
         Rbhg==
X-Gm-Message-State: AOAM533fQ97k3o/ENbJuPFPpBEECAW5OYc2jBh9+m1VfXt0cizZOr3Qq
	usPE2UyQ27nFuHz4XD/0R3WSS7ztSPypI+kCBRqkvuY=
X-Google-Smtp-Source: ABdhPJxDm7j8cM1482KC26pwgC31+rrOu0J5ru9ERh5tHly+zf47ODdlDTojIpfhDIPkQDBLnO8VP5PdCE1hvfMl7lM=
X-Received: by 2002:aca:31d7:: with SMTP id x206mr6384812oix.178.1615028802899;
 Sat, 06 Mar 2021 03:06:42 -0800 (PST)
MIME-Version: 1.0
References: <20210303114130.2317817-1-crg7475@mailbox.org> <20210303114130.2317817-2-crg7475@mailbox.org>
 <CAHvQdo3=+geB3pheET1Oi5vtR_5v5bK0wW5MZW55Ju4AaMygzQ@mail.gmail.com> <da6aeef2-7bc1-3574-430e-b9cafcc440d2@mailbox.org>
In-Reply-To: <da6aeef2-7bc1-3574-430e-b9cafcc440d2@mailbox.org>
From: "Johannes Pointner" <h4nn35.work@gmail.com>
Date: Sat, 6 Mar 2021 12:06:31 +0100
Message-ID: <CAHvQdo3=HDEjMoeq6rjOzMpM5EPR0gMDu+u-5PhMip1-oBo=hQ@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 2/2] pipewire: Rework 0.3 recipe and upgrade to 0.3.22
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 4, 2021 at 5:51 PM Carlos Rafael Giani via
lists.openembedded.org <crg7475=mailbox.org@lists.openembedded.org>
wrote:
>
> Version 0.3.23 just came out. I'd rather upgrade the recipe to that one, and if others here are OK with it, migrate it to oe-core.

That's even better.
Cheers,
Hannes

>
> On 03.03.21 20:22, Johannes Pointner wrote:
>
> Hello Carlos,
>
> On Wed, Mar 3, 2021 at 12:41 PM Carlos Rafael Giani via
> lists.openembedded.org <crg7475=mailbox.org@lists.openembedded.org>
> wrote:
>
> * Use a versioned recipe instead of _git
> * Add more packageconfigs: alsa, docs, sdl2, sndfile, v4l2,
>   pipewire-alsa, pipewire-jack
> * Split SPA and module packages dynamically to generate one package for
>   each SPA plugin and for each module
> * Split pipewire library, shim PulseAudio daemon, main tools & SPA tools,
>   pipewire-alsa, pipewire-jack, ALSA card profiles, GStreamer plugin,
>   and example session manager into separate packages
> * Set up a "pipewire" user and group to run the PipeWire daemon with that
>   user instead of root
>
> Could you please add the patch that fixes a crash of the pipewire-media-session:
> https://bugzilla.redhat.com/show_bug.cgi?id=1931043
> https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/3673265ae20d7b59e89cad6c5238c232796731b2
>
> Thx,
> Hannes
>
> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ---
>  .../pipewire/pipewire_0.3.22.bb               | 273 ++++++++++++++++++
>  .../pipewire/pipewire_git.bb                  |  77 -----
>  2 files changed, 273 insertions(+), 77 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.bb
>  delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.bb
> new file mode 100644
> index 000000000..b54be7f89
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.bb
> @@ -0,0 +1,273 @@
> +SUMMARY = "Multimedia processing server for Linux"
> +DESCRIPTION = "Linux server for handling and routing audio and video streams between applications and multimedia I/O devices"
> +HOMEPAGE = "https://pipewire.org/"
> +BUGTRACKER  = "https://gitlab.freedesktop.org/pipewire/pipewire/issues"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = " \
> +    file://LICENSE;md5=e2c0b7d86d04e716a3c4c9ab34260e69 \
> +    file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a \
> +"
> +SECTION = "multimedia"
> +
> +DEPENDS = "dbus"
> +
> +SRCREV = "22d563720a7f6ba7bdf59950f8c14488d80dfa95"
> +SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit meson pkgconfig systemd manpages gettext useradd
> +
> +USERADD_PACKAGES = "${PN}"
> +
> +GROUPADD_PARAM_${PN} = "--system pipewire"
> +
> +USERADD_PARAM_${PN} = "--system --home / --no-create-home \
> +                       --comment 'PipeWire multimedia daemon' \
> +                       --gid pipewire --groups audio,video \
> +                       pipewire"
> +
> +# For "EVL", look up https://evlproject.org/ . It involves
> +# a specially prepared kernel, and is currently unavailable
> +# in Yocto.
> +# FFmpeg and Vulkan aren't really supported - at the current
> +# stage (version 0.3.22), these are just experiments, not
> +# actual features.
> +# libcamera support currently does not build successfully.
> +# systemd user service files are disabled because per-user
> +# PipeWire instances aren't really something that makes
> +# much sense in an embedded environment. A system-wide
> +# instance does.
> +EXTRA_OEMESON += " \
> +    -Daudiotestsrc=true \
> +    -Devl=false \
> +    -Dsystemd-user-service=false \
> +    -Dtests=false \
> +    -Dudevrulesdir=${nonarch_base_libdir}/udev/rules.d/ \
> +    -Dvideotestsrc=true \
> +    -Dffmpeg=false \
> +    -Dvulkan=false \
> +    -Dlibcamera=false \
> +"
> +
> +PACKAGECONFIG ??= "\
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa systemd', d)} \
> +    gstreamer jack v4l2 \
> +"
> +
> +# "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
> +# since "jack" imports libjack, and "pipewire-jack" generates
> +# libjack.so* files, thus colliding with the libpack package. This
> +# is why these two are marked in their respective packageconfigs
> +# as being in conflict.
> +
> +PACKAGECONFIG[alsa] = "-Dalsa=true,-Dalsa=false,alsa-lib udev"
> +PACKAGECONFIG[bluez] = "-Dbluez5=true,-Dbluez5=false,bluez5 sbc"
> +PACKAGECONFIG[docs] = "-Ddocs=true,-Ddocs=false,doxygen"
> +PACKAGECONFIG[gstreamer] = "-Dgstreamer=true,-Dgstreamer=false,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
> +PACKAGECONFIG[jack] = "-Djack=true,-Djack=false,jack,,,pipewire-jack"
> +PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxml-parser-perl-native"
> +PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,virtual/libsdl2"
> +PACKAGECONFIG[sndfile] = "-Dsndfile=enabled,-Dsndfile=disabled,libsndfile1"
> +PACKAGECONFIG[systemd] = "-Dsystemd=true -Dsystemd-system-service=true ,-Dsystemd=false -Dsystemd-system-service=false,systemd"
> +PACKAGECONFIG[v4l2] = "-Dv4l2=true,-Dv4l2=false,udev"
> +PACKAGECONFIG[pipewire-alsa] = "-Dpipewire-alsa=true,-Dpipewire-alsa=false,alsa-lib"
> +PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=true -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=false,jack,,,jack"
> +
> +PACKAGESPLITFUNCS_prepend = " split_dynamic_packages "
> +PACKAGESPLITFUNCS_append = " set_dynamic_metapkg_rdepends "
> +
> +SPA_SUBDIR = "spa-0.2"
> +PW_MODULE_SUBDIR = "pipewire-0.3"
> +
> +remove_unused_installed_files() {
> +    # jack.conf is used by pipewire-jack (not the JACK SPA plugin).
> +    # Remove it if pipewire-jack is not built to avoid creating the
> +    # pipewire-jack package.
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'pipewire-jack', 'false', 'true', d)}; then
> +        rm -f "${D}${sysconfdir}/pipewire/jack.conf"
> +    fi
> +}
> +
> +do_install[postfuncs] += "remove_unused_installed_files"
> +
> +python split_dynamic_packages () {
> +    # Create packages for each SPA plugin. These plugins are located
> +    # in individual subdirectories, so a recursive search is needed.
> +    spa_libdir = d.expand('${libdir}/${SPA_SUBDIR}')
> +    do_split_packages(d, spa_libdir, r'^libspa-(.*)\.so$', d.expand('${PN}-spa-plugins-%s'), 'PipeWire SPA plugin for %s', extra_depends='', recursive=True)
> +
> +    # Create packages for each PipeWire module.
> +    pw_module_libdir = d.expand('${libdir}/${PW_MODULE_SUBDIR}')
> +    do_split_packages(d, pw_module_libdir, r'^libpipewire-module-(.*)\.so$', d.expand('${PN}-modules-%s'), 'PipeWire %s module', extra_depends='', recursive=False)
> +}
> +
> +python set_dynamic_metapkg_rdepends () {
> +    import os
> +    import oe.utils
> +
> +    # Go through all generated SPA plugin and PipeWire module packages
> +    # (excluding the main package and the -meta package itself) and
> +    # add them to the -meta package as RDEPENDS.
> +
> +    base_pn = d.getVar('PN')
> +
> +    spa_pn = base_pn + '-spa-plugins'
> +    spa_metapkg =  spa_pn + '-meta'
> +
> +    pw_module_pn = base_pn + '-modules'
> +    pw_module_metapkg =  pw_module_pn + '-meta'
> +
> +    d.setVar('ALLOW_EMPTY_' + spa_metapkg, "1")
> +    d.setVar('FILES_' + spa_metapkg, "")
> +
> +    d.setVar('ALLOW_EMPTY_' + pw_module_metapkg, "1")
> +    d.setVar('FILES_' + pw_module_metapkg, "")
> +
> +    blacklist = [ spa_pn, spa_metapkg, pw_module_pn, pw_module_metapkg ]
> +    spa_metapkg_rdepends = []
> +    pw_module_metapkg_rdepends = []
> +    pkgdest = d.getVar('PKGDEST')
> +
> +    for pkg in oe.utils.packages_filter_out_system(d):
> +        if pkg in blacklist:
> +            continue
> +
> +        is_spa_pkg = pkg.startswith(spa_pn)
> +        is_pw_module_pkg = pkg.startswith(pw_module_pn)
> +        if not is_spa_pkg and not is_pw_module_pkg:
> +            continue
> +
> +        if pkg in spa_metapkg_rdepends or pkg in pw_module_metapkg_rdepends:
> +            continue
> +
> +        # See if the package is empty by looking at the contents of its
> +        # PKGDEST subdirectory. If this subdirectory is empty, then then
> +        # package is empty as well. Empty packages do not get added to
> +        # the meta package's RDEPENDS.
> +        pkgdir = os.path.join(pkgdest, pkg)
> +        if os.path.exists(pkgdir):
> +            dir_contents = os.listdir(pkgdir) or []
> +        else:
> +            dir_contents = []
> +        is_empty = len(dir_contents) == 0
> +        if not is_empty:
> +            if is_spa_pkg:
> +                spa_metapkg_rdepends.append(pkg)
> +            if is_pw_module_pkg:
> +                pw_module_metapkg_rdepends.append(pkg)
> +
> +    d.setVar('RDEPENDS_' + spa_metapkg, ' '.join(spa_metapkg_rdepends))
> +    d.setVar('DESCRIPTION_' + spa_metapkg, spa_pn + ' meta package')
> +
> +    d.setVar('RDEPENDS_' + pw_module_metapkg, ' '.join(pw_module_metapkg_rdepends))
> +    d.setVar('DESCRIPTION_' + pw_module_metapkg, pw_module_pn + ' meta package')
> +}
> +
> +PACKAGES =+ "\
> +    libpipewire \
> +    ${PN}-tools \
> +    ${PN}-pulse \
> +    ${PN}-alsa \
> +    ${PN}-jack \
> +    ${PN}-media-session \
> +    ${PN}-spa-plugins \
> +    ${PN}-spa-plugins-meta \
> +    ${PN}-spa-tools \
> +    ${PN}-modules \
> +    ${PN}-modules-meta \
> +    ${PN}-alsa-card-profile \
> +    gstreamer1.0-pipewire \
> +"
> +
> +PACKAGES_DYNAMIC = "^${PN}-spa-plugins.* ^${PN}-modules.*"
> +
> +SYSTEMD_SERVICE_${PN} = "pipewire.service"
> +CONFFILES_${PN} += "${sysconfdir}/pipewire/pipewire.conf"
> +FILES_${PN} = " \
> +    ${sysconfdir}/pipewire/pipewire.conf \
> +    ${systemd_user_unitdir}/pipewire.* \
> +    ${bindir}/pipewire \
> +"
> +
> +FILES_${PN}-dev += " \
> +    ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so \
> +"
> +
> +CONFFILES_libpipewire += "${sysconfdir}/pipewire/client.conf"
> +FILES_libpipewire = " \
> +    ${sysconfdir}/pipewire/client.conf \
> +    ${libdir}/libpipewire-*.so.* \
> +"
> +# Add the bare minimum modules and plugins required to be able
> +# to use libpipewire. Without these, it is essentially unusable.
> +RDEPENDS_libpipewire += " \
> +    ${PN}-modules-client-node \
> +    ${PN}-modules-protocol-native \
> +    ${PN}-spa-plugins-support \
> +"
> +
> +FILES_${PN}-tools = " \
> +    ${bindir}/pw-* \
> +"
> +
> +# This is a shim daemon that is intended to be used as a
> +# drop-in PulseAudio replacement, providing a pulseaudio-compatible
> +# socket that can be used by applications that use libpulse.
> +CONFFILES_${PN}-pulse += "${sysconfdir}/pipewire/pipewire-pulse.conf"
> +FILES_${PN}-pulse = " \
> +    ${sysconfdir}/pipewire/pipewire-pulse.conf \
> +    ${systemd_user_unitdir}/pipewire-pulse.* \
> +    ${bindir}/pipewire-pulse \
> +"
> +RDEPENDS_${PN}-pulse += " \
> +    ${PN}-modules-protocol-pulse \
> +"
> +
> +# alsa plugin to redirect audio to pipewire
> +FILES_${PN}-alsa = "\
> +    ${libdir}/alsa-lib/* \
> +    ${datadir}/alsa/alsa.conf.d/* \
> +"
> +
> +# jack drop-in libraries to redirect audio to pipewire
> +CONFFILES_${PN}-jack = "${sysconfdir}/pipewire/jack.conf"
> +FILES_${PN}-jack = "\
> +    ${sysconfdir}/pipewire/jack.conf \
> +    ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \
> +"
> +
> +# Example session manager. Not intended for use in production.
> +CONFFILES_${PN}-media-session = "${sysconfdir}/pipewire/media-session.d/*"
> +FILES_${PN}-media-session = " \
> +    ${bindir}/pipewire-media-session \
> +    ${sysconfdir}/pipewire/media-session.d/* \
> +"
> +RPROVIDES_${PN}-media-session = "virtual/pipewire-sessionmanager"
> +
> +# Dynamic packages (see set_dynamic_metapkg_rdepends).
> +FILES_${PN}-spa-plugins = ""
> +RRECOMMENDS_${PN}-spa-plugins += "${PN}-spa-plugins-meta"
> +
> +FILES_${PN}-spa-tools = " \
> +    ${bindir}/spa-* \
> +"
> +
> +# Dynamic packages (see set_dynamic_metapkg_rdepends).
> +FILES_${PN}-modules = ""
> +RRECOMMENDS_${PN}-modules += "${PN}-modules-meta"
> +
> +CONFFILES_${PN}-modules-rtkit = "${sysconfdir}/pipewire/client-rt.conf"
> +FILES_${PN}-modules-rtkit += " \
> +    ${sysconfdir}/pipewire/client-rt.conf \
> +    "
> +
> +FILES_${PN}-alsa-card-profile = " \
> +    ${datadir}/alsa-card-profile/* \
> +    ${nonarch_base_libdir}/udev/rules.d/90-pipewire-alsa.rules \
> +"
> +
> +FILES_gstreamer1.0-pipewire = " \
> +    ${libdir}/gstreamer-1.0/* \
> +"
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
> deleted file mode 100644
> index 173b695e1..000000000
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -SUMMARY = "Multimedia processing server for Linux"
> -AUTHOR = "Wim Taymans <wtaymans@redhat.com>"
> -HOMEPAGE = "https://pipewire.org"
> -SECTION = "multimedia"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = " \
> -    file://LICENSE;md5=e2c0b7d86d04e716a3c4c9ab34260e69 \
> -    file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a \
> -"
> -DEPENDS = "alsa-lib dbus udev"
> -SRCREV = "74a1632f0720886d5b3b6c23ee8fcd6c03ca7aac"
> -PV = "0.3.1"
> -
> -SRC_URI = "git://github.com/PipeWire/pipewire"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit meson pkgconfig systemd manpages
> -
> -PACKAGECONFIG ??= "\
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio systemd vulkan', d)} \
> -    jack gstreamer \
> -"
> -
> -PACKAGECONFIG[bluez] = "-Dbluez5=true,-Dbluez5=false,bluez5 sbc"
> -PACKAGECONFIG[jack] = "-Djack=true,-Djack=false,jack"
> -PACKAGECONFIG[gstreamer] = "-Dgstreamer=true,-Dgstreamer=false,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
> -PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxml-parser-perl-native"
> -PACKAGECONFIG[pulseaudio] = "-Dpipewire-pulseaudio=true,-Dpipewire-pulseaudio=false,pulseaudio"
> -PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
> -PACKAGECONFIG[vulkan] = "-Dvulkan=true,-Dvulkan=false,vulkan-loader"
> -
> -LDFLAGS_append_mipsarch = " -latomic"
> -LDFLAGS_append_x86 = " -latomic"
> -LDFLAGS_append_riscv32 = " -latomic"
> -
> -PACKAGES =+ "\
> -    ${PN}-spa-plugins \
> -    ${PN}-alsa \
> -    ${PN}-config \
> -    gstreamer1.0-${PN} \
> -    lib${PN} \
> -    lib${PN}-modules \
> -    lib${PN}-jack \
> -"
> -
> -RDEPENDS_lib${PN} += "lib${PN}-modules ${PN}-spa-plugins"
> -
> -FILES_${PN} = "\
> -    ${sysconfdir}/pipewire/pipewire.conf \
> -    ${bindir}/pw-* \
> -    ${bindir}/pipewire* \
> -    ${systemd_user_unitdir}/* \
> -"
> -FILES_lib${PN} = "\
> -    ${libdir}/libpipewire-*.so.* \
> -    ${libdir}/libjack-*.so.* \
> -    ${libdir}/libpulse-*.so.* \
> -"
> -FILES_lib${PN}-modules = "\
> -    ${libdir}/pipewire-*/* \
> -"
> -FILES_${PN}-spa-plugins = "\
> -    ${bindir}/spa-* \
> -    ${libdir}/spa-*/* \
> -"
> -FILES_${PN}-alsa = "\
> -    ${libdir}/alsa-lib/* \
> -"
> -FILES_gstreamer1.0-${PN} = "\
> -    ${libdir}/gstreamer-1.0/* \
> -"
> -
> -CONFFILES_${PN} = "\
> -    ${sysconfdir}/pipewire/pipewire.conf \
> -"
> --
> 2.25.1
>
>
>
>
>
>
>
>
> 
>
