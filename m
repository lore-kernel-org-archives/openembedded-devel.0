Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web08.1556.1614876684660477298
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 08:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=gt5cyEQo;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171, mailfrom: crg7475@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Drxhp1lmGzQjbq
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Mar 2021 17:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-type:content-type:in-reply-to
	:mime-version:date:date:message-id:from:from:references:subject
	:subject:received; s=mail20150812; t=1614876674; bh=MwyLgQ+6Yt1V
	DbL+7zjEDKLNbue8J3/bmcOOk0S28Qw=; b=gt5cyEQow+GgrNN3/iRXu1DGagcK
	21MDtJJ46SmAsK4inkBMxFvKtKX5HDYrIDQ1L0irrHIM3r1StjmDMsY001CJ1pYo
	7mVo2xUy0/8vJ4ZKkRBlHIy0BEA0+kp0P/KKAItOdl2xLqPqSGPdn7yZeA3XIOhE
	XTMjE9rsZr84DY+P0oJljnz6UAhZYN/RlXtKjJcaPyZL+zY4tUAfsGb5H+9+r2TN
	5mHVba+1hbKHZ+dYa9Tkc/lSYOQDhZFCXeFYG1qT1xPieaEvOkX/DwfNBkLdXw82
	967J5TeDOduOh3NgFy0DcBSunFR3ZWmD2EEYSfEeWRwB13Pqd7R/LGwpHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1614876679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TEZsf0eeXxZKwik8xhuGlkfZquUvcR52aQFSMto9ejs=;
	b=p1sB1+hbf5RR4wcQ7IpiHCsuN8voHc4Io+KsYvBCS/S+zWfTdMvB4NgCuCiWcWAvUbk6cy
	NNyApEXcinE+s1vw6Jfv8H3qKV+/V6A29W9z6kCaeFMB/7i8+iqT8MpaoqKa+4g4E+CL38
	uKnkzk/rqKE5O9bVqmeP2iveLrwInFzrPrbbgSjLQvYYeby1XxeuPYW3QE7xpHsxlNQOEd
	jLsI0UCeXynwD3k3dnszYU/+4s5yshn4pX69NKc29ExMwM16XJmwoGG5De/14nh/pV0khg
	t5xBLl5krM6wmIKLiM8UnIqQ6XLWUZlB/+8b7nByN6hs5lbBNvnt9JlD1VFQQw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173]) (amavisd-new, port 10030)
	with ESMTP id HXAjEuUB7HFI
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Mar 2021 17:51:14 +0100 (CET)
Subject: Re: [oe] [meta-multimedia][PATCH 2/2] pipewire: Rework 0.3 recipe and upgrade to 0.3.22
To: openembedded-devel@lists.openembedded.org
References: <20210303114130.2317817-1-crg7475@mailbox.org>
 <20210303114130.2317817-2-crg7475@mailbox.org>
 <CAHvQdo3=+geB3pheET1Oi5vtR_5v5bK0wW5MZW55Ju4AaMygzQ@mail.gmail.com>
From: "Carlos Rafael Giani" <crg7475@mailbox.org>
Message-ID: <da6aeef2-7bc1-3574-430e-b9cafcc440d2@mailbox.org>
Date: Thu, 4 Mar 2021 17:51:13 +0100
MIME-Version: 1.0
In-Reply-To: <CAHvQdo3=+geB3pheET1Oi5vtR_5v5bK0wW5MZW55Ju4AaMygzQ@mail.gmail.com>
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 0.69 / 15.00 / 15.00
X-Rspamd-Queue-Id: 7076D17E5
X-Rspamd-UID: 9ade2d
Content-Type: multipart/alternative;
 boundary="------------50351ECE1FBB518045704A2C"
Content-Language: en-US

--------------50351ECE1FBB518045704A2C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Version 0.3.23 just came out. I'd rather upgrade the recipe to that one, 
and if others here are OK with it, migrate it to oe-core.

On 03.03.21 20:22, Johannes Pointner wrote:
> Hello Carlos,
>
> On Wed, Mar 3, 2021 at 12:41 PM Carlos Rafael Giani via
> lists.openembedded.org <crg7475=mailbox.org@lists.openembedded.org>
> wrote:
>> * Use a versioned recipe instead of _git
>> * Add more packageconfigs: alsa, docs, sdl2, sndfile, v4l2,
>>    pipewire-alsa, pipewire-jack
>> * Split SPA and module packages dynamically to generate one package for
>>    each SPA plugin and for each module
>> * Split pipewire library, shim PulseAudio daemon, main tools & SPA tools,
>>    pipewire-alsa, pipewire-jack, ALSA card profiles, GStreamer plugin,
>>    and example session manager into separate packages
>> * Set up a "pipewire" user and group to run the PipeWire daemon with that
>>    user instead of root
> Could you please add the patch that fixes a crash of the pipewire-media-session:
> https://bugzilla.redhat.com/show_bug.cgi?id=1931043
> https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/3673265ae20d7b59e89cad6c5238c232796731b2
>
> Thx,
> Hannes
>
>> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
>> ---
>>   .../pipewire/pipewire_0.3.22.bb               | 273 ++++++++++++++++++
>>   .../pipewire/pipewire_git.bb                  |  77 -----
>>   2 files changed, 273 insertions(+), 77 deletions(-)
>>   create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.bb
>>   delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
>>
>> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.bb
>> new file mode 100644
>> index 000000000..b54be7f89
>> --- /dev/null
>> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.bb
>> @@ -0,0 +1,273 @@
>> +SUMMARY = "Multimedia processing server for Linux"
>> +DESCRIPTION = "Linux server for handling and routing audio and video streams between applications and multimedia I/O devices"
>> +HOMEPAGE = "https://pipewire.org/"
>> +BUGTRACKER  = "https://gitlab.freedesktop.org/pipewire/pipewire/issues"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = " \
>> +    file://LICENSE;md5=e2c0b7d86d04e716a3c4c9ab34260e69 \
>> +    file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a \
>> +"
>> +SECTION = "multimedia"
>> +
>> +DEPENDS = "dbus"
>> +
>> +SRCREV = "22d563720a7f6ba7bdf59950f8c14488d80dfa95"
>> +SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit meson pkgconfig systemd manpages gettext useradd
>> +
>> +USERADD_PACKAGES = "${PN}"
>> +
>> +GROUPADD_PARAM_${PN} = "--system pipewire"
>> +
>> +USERADD_PARAM_${PN} = "--system --home / --no-create-home \
>> +                       --comment 'PipeWire multimedia daemon' \
>> +                       --gid pipewire --groups audio,video \
>> +                       pipewire"
>> +
>> +# For "EVL", look up https://evlproject.org/ . It involves
>> +# a specially prepared kernel, and is currently unavailable
>> +# in Yocto.
>> +# FFmpeg and Vulkan aren't really supported - at the current
>> +# stage (version 0.3.22), these are just experiments, not
>> +# actual features.
>> +# libcamera support currently does not build successfully.
>> +# systemd user service files are disabled because per-user
>> +# PipeWire instances aren't really something that makes
>> +# much sense in an embedded environment. A system-wide
>> +# instance does.
>> +EXTRA_OEMESON += " \
>> +    -Daudiotestsrc=true \
>> +    -Devl=false \
>> +    -Dsystemd-user-service=false \
>> +    -Dtests=false \
>> +    -Dudevrulesdir=${nonarch_base_libdir}/udev/rules.d/ \
>> +    -Dvideotestsrc=true \
>> +    -Dffmpeg=false \
>> +    -Dvulkan=false \
>> +    -Dlibcamera=false \
>> +"
>> +
>> +PACKAGECONFIG ??= "\
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa systemd', d)} \
>> +    gstreamer jack v4l2 \
>> +"
>> +
>> +# "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
>> +# since "jack" imports libjack, and "pipewire-jack" generates
>> +# libjack.so* files, thus colliding with the libpack package. This
>> +# is why these two are marked in their respective packageconfigs
>> +# as being in conflict.
>> +
>> +PACKAGECONFIG[alsa] = "-Dalsa=true,-Dalsa=false,alsa-lib udev"
>> +PACKAGECONFIG[bluez] = "-Dbluez5=true,-Dbluez5=false,bluez5 sbc"
>> +PACKAGECONFIG[docs] = "-Ddocs=true,-Ddocs=false,doxygen"
>> +PACKAGECONFIG[gstreamer] = "-Dgstreamer=true,-Dgstreamer=false,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
>> +PACKAGECONFIG[jack] = "-Djack=true,-Djack=false,jack,,,pipewire-jack"
>> +PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxml-parser-perl-native"
>> +PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,virtual/libsdl2"
>> +PACKAGECONFIG[sndfile] = "-Dsndfile=enabled,-Dsndfile=disabled,libsndfile1"
>> +PACKAGECONFIG[systemd] = "-Dsystemd=true -Dsystemd-system-service=true ,-Dsystemd=false -Dsystemd-system-service=false,systemd"
>> +PACKAGECONFIG[v4l2] = "-Dv4l2=true,-Dv4l2=false,udev"
>> +PACKAGECONFIG[pipewire-alsa] = "-Dpipewire-alsa=true,-Dpipewire-alsa=false,alsa-lib"
>> +PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=true -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=false,jack,,,jack"
>> +
>> +PACKAGESPLITFUNCS_prepend = " split_dynamic_packages "
>> +PACKAGESPLITFUNCS_append = " set_dynamic_metapkg_rdepends "
>> +
>> +SPA_SUBDIR = "spa-0.2"
>> +PW_MODULE_SUBDIR = "pipewire-0.3"
>> +
>> +remove_unused_installed_files() {
>> +    # jack.conf is used by pipewire-jack (not the JACK SPA plugin).
>> +    # Remove it if pipewire-jack is not built to avoid creating the
>> +    # pipewire-jack package.
>> +    if ${@bb.utils.contains('PACKAGECONFIG', 'pipewire-jack', 'false', 'true', d)}; then
>> +        rm -f "${D}${sysconfdir}/pipewire/jack.conf"
>> +    fi
>> +}
>> +
>> +do_install[postfuncs] += "remove_unused_installed_files"
>> +
>> +python split_dynamic_packages () {
>> +    # Create packages for each SPA plugin. These plugins are located
>> +    # in individual subdirectories, so a recursive search is needed.
>> +    spa_libdir = d.expand('${libdir}/${SPA_SUBDIR}')
>> +    do_split_packages(d, spa_libdir, r'^libspa-(.*)\.so$', d.expand('${PN}-spa-plugins-%s'), 'PipeWire SPA plugin for %s', extra_depends='', recursive=True)
>> +
>> +    # Create packages for each PipeWire module.
>> +    pw_module_libdir = d.expand('${libdir}/${PW_MODULE_SUBDIR}')
>> +    do_split_packages(d, pw_module_libdir, r'^libpipewire-module-(.*)\.so$', d.expand('${PN}-modules-%s'), 'PipeWire %s module', extra_depends='', recursive=False)
>> +}
>> +
>> +python set_dynamic_metapkg_rdepends () {
>> +    import os
>> +    import oe.utils
>> +
>> +    # Go through all generated SPA plugin and PipeWire module packages
>> +    # (excluding the main package and the -meta package itself) and
>> +    # add them to the -meta package as RDEPENDS.
>> +
>> +    base_pn = d.getVar('PN')
>> +
>> +    spa_pn = base_pn + '-spa-plugins'
>> +    spa_metapkg =  spa_pn + '-meta'
>> +
>> +    pw_module_pn = base_pn + '-modules'
>> +    pw_module_metapkg =  pw_module_pn + '-meta'
>> +
>> +    d.setVar('ALLOW_EMPTY_' + spa_metapkg, "1")
>> +    d.setVar('FILES_' + spa_metapkg, "")
>> +
>> +    d.setVar('ALLOW_EMPTY_' + pw_module_metapkg, "1")
>> +    d.setVar('FILES_' + pw_module_metapkg, "")
>> +
>> +    blacklist = [ spa_pn, spa_metapkg, pw_module_pn, pw_module_metapkg ]
>> +    spa_metapkg_rdepends = []
>> +    pw_module_metapkg_rdepends = []
>> +    pkgdest = d.getVar('PKGDEST')
>> +
>> +    for pkg in oe.utils.packages_filter_out_system(d):
>> +        if pkg in blacklist:
>> +            continue
>> +
>> +        is_spa_pkg = pkg.startswith(spa_pn)
>> +        is_pw_module_pkg = pkg.startswith(pw_module_pn)
>> +        if not is_spa_pkg and not is_pw_module_pkg:
>> +            continue
>> +
>> +        if pkg in spa_metapkg_rdepends or pkg in pw_module_metapkg_rdepends:
>> +            continue
>> +
>> +        # See if the package is empty by looking at the contents of its
>> +        # PKGDEST subdirectory. If this subdirectory is empty, then then
>> +        # package is empty as well. Empty packages do not get added to
>> +        # the meta package's RDEPENDS.
>> +        pkgdir = os.path.join(pkgdest, pkg)
>> +        if os.path.exists(pkgdir):
>> +            dir_contents = os.listdir(pkgdir) or []
>> +        else:
>> +            dir_contents = []
>> +        is_empty = len(dir_contents) == 0
>> +        if not is_empty:
>> +            if is_spa_pkg:
>> +                spa_metapkg_rdepends.append(pkg)
>> +            if is_pw_module_pkg:
>> +                pw_module_metapkg_rdepends.append(pkg)
>> +
>> +    d.setVar('RDEPENDS_' + spa_metapkg, ' '.join(spa_metapkg_rdepends))
>> +    d.setVar('DESCRIPTION_' + spa_metapkg, spa_pn + ' meta package')
>> +
>> +    d.setVar('RDEPENDS_' + pw_module_metapkg, ' '.join(pw_module_metapkg_rdepends))
>> +    d.setVar('DESCRIPTION_' + pw_module_metapkg, pw_module_pn + ' meta package')
>> +}
>> +
>> +PACKAGES =+ "\
>> +    libpipewire \
>> +    ${PN}-tools \
>> +    ${PN}-pulse \
>> +    ${PN}-alsa \
>> +    ${PN}-jack \
>> +    ${PN}-media-session \
>> +    ${PN}-spa-plugins \
>> +    ${PN}-spa-plugins-meta \
>> +    ${PN}-spa-tools \
>> +    ${PN}-modules \
>> +    ${PN}-modules-meta \
>> +    ${PN}-alsa-card-profile \
>> +    gstreamer1.0-pipewire \
>> +"
>> +
>> +PACKAGES_DYNAMIC = "^${PN}-spa-plugins.* ^${PN}-modules.*"
>> +
>> +SYSTEMD_SERVICE_${PN} = "pipewire.service"
>> +CONFFILES_${PN} += "${sysconfdir}/pipewire/pipewire.conf"
>> +FILES_${PN} = " \
>> +    ${sysconfdir}/pipewire/pipewire.conf \
>> +    ${systemd_user_unitdir}/pipewire.* \
>> +    ${bindir}/pipewire \
>> +"
>> +
>> +FILES_${PN}-dev += " \
>> +    ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so \
>> +"
>> +
>> +CONFFILES_libpipewire += "${sysconfdir}/pipewire/client.conf"
>> +FILES_libpipewire = " \
>> +    ${sysconfdir}/pipewire/client.conf \
>> +    ${libdir}/libpipewire-*.so.* \
>> +"
>> +# Add the bare minimum modules and plugins required to be able
>> +# to use libpipewire. Without these, it is essentially unusable.
>> +RDEPENDS_libpipewire += " \
>> +    ${PN}-modules-client-node \
>> +    ${PN}-modules-protocol-native \
>> +    ${PN}-spa-plugins-support \
>> +"
>> +
>> +FILES_${PN}-tools = " \
>> +    ${bindir}/pw-* \
>> +"
>> +
>> +# This is a shim daemon that is intended to be used as a
>> +# drop-in PulseAudio replacement, providing a pulseaudio-compatible
>> +# socket that can be used by applications that use libpulse.
>> +CONFFILES_${PN}-pulse += "${sysconfdir}/pipewire/pipewire-pulse.conf"
>> +FILES_${PN}-pulse = " \
>> +    ${sysconfdir}/pipewire/pipewire-pulse.conf \
>> +    ${systemd_user_unitdir}/pipewire-pulse.* \
>> +    ${bindir}/pipewire-pulse \
>> +"
>> +RDEPENDS_${PN}-pulse += " \
>> +    ${PN}-modules-protocol-pulse \
>> +"
>> +
>> +# alsa plugin to redirect audio to pipewire
>> +FILES_${PN}-alsa = "\
>> +    ${libdir}/alsa-lib/* \
>> +    ${datadir}/alsa/alsa.conf.d/* \
>> +"
>> +
>> +# jack drop-in libraries to redirect audio to pipewire
>> +CONFFILES_${PN}-jack = "${sysconfdir}/pipewire/jack.conf"
>> +FILES_${PN}-jack = "\
>> +    ${sysconfdir}/pipewire/jack.conf \
>> +    ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \
>> +"
>> +
>> +# Example session manager. Not intended for use in production.
>> +CONFFILES_${PN}-media-session = "${sysconfdir}/pipewire/media-session.d/*"
>> +FILES_${PN}-media-session = " \
>> +    ${bindir}/pipewire-media-session \
>> +    ${sysconfdir}/pipewire/media-session.d/* \
>> +"
>> +RPROVIDES_${PN}-media-session = "virtual/pipewire-sessionmanager"
>> +
>> +# Dynamic packages (see set_dynamic_metapkg_rdepends).
>> +FILES_${PN}-spa-plugins = ""
>> +RRECOMMENDS_${PN}-spa-plugins += "${PN}-spa-plugins-meta"
>> +
>> +FILES_${PN}-spa-tools = " \
>> +    ${bindir}/spa-* \
>> +"
>> +
>> +# Dynamic packages (see set_dynamic_metapkg_rdepends).
>> +FILES_${PN}-modules = ""
>> +RRECOMMENDS_${PN}-modules += "${PN}-modules-meta"
>> +
>> +CONFFILES_${PN}-modules-rtkit = "${sysconfdir}/pipewire/client-rt.conf"
>> +FILES_${PN}-modules-rtkit += " \
>> +    ${sysconfdir}/pipewire/client-rt.conf \
>> +    "
>> +
>> +FILES_${PN}-alsa-card-profile = " \
>> +    ${datadir}/alsa-card-profile/* \
>> +    ${nonarch_base_libdir}/udev/rules.d/90-pipewire-alsa.rules \
>> +"
>> +
>> +FILES_gstreamer1.0-pipewire = " \
>> +    ${libdir}/gstreamer-1.0/* \
>> +"
>> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
>> deleted file mode 100644
>> index 173b695e1..000000000
>> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
>> +++ /dev/null
>> @@ -1,77 +0,0 @@
>> -SUMMARY = "Multimedia processing server for Linux"
>> -AUTHOR = "Wim Taymans <wtaymans@redhat.com>"
>> -HOMEPAGE = "https://pipewire.org"
>> -SECTION = "multimedia"
>> -LICENSE = "MIT"
>> -LIC_FILES_CHKSUM = " \
>> -    file://LICENSE;md5=e2c0b7d86d04e716a3c4c9ab34260e69 \
>> -    file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a \
>> -"
>> -DEPENDS = "alsa-lib dbus udev"
>> -SRCREV = "74a1632f0720886d5b3b6c23ee8fcd6c03ca7aac"
>> -PV = "0.3.1"
>> -
>> -SRC_URI = "git://github.com/PipeWire/pipewire"
>> -
>> -S = "${WORKDIR}/git"
>> -
>> -inherit meson pkgconfig systemd manpages
>> -
>> -PACKAGECONFIG ??= "\
>> -    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
>> -    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio systemd vulkan', d)} \
>> -    jack gstreamer \
>> -"
>> -
>> -PACKAGECONFIG[bluez] = "-Dbluez5=true,-Dbluez5=false,bluez5 sbc"
>> -PACKAGECONFIG[jack] = "-Djack=true,-Djack=false,jack"
>> -PACKAGECONFIG[gstreamer] = "-Dgstreamer=true,-Dgstreamer=false,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
>> -PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxml-parser-perl-native"
>> -PACKAGECONFIG[pulseaudio] = "-Dpipewire-pulseaudio=true,-Dpipewire-pulseaudio=false,pulseaudio"
>> -PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
>> -PACKAGECONFIG[vulkan] = "-Dvulkan=true,-Dvulkan=false,vulkan-loader"
>> -
>> -LDFLAGS_append_mipsarch = " -latomic"
>> -LDFLAGS_append_x86 = " -latomic"
>> -LDFLAGS_append_riscv32 = " -latomic"
>> -
>> -PACKAGES =+ "\
>> -    ${PN}-spa-plugins \
>> -    ${PN}-alsa \
>> -    ${PN}-config \
>> -    gstreamer1.0-${PN} \
>> -    lib${PN} \
>> -    lib${PN}-modules \
>> -    lib${PN}-jack \
>> -"
>> -
>> -RDEPENDS_lib${PN} += "lib${PN}-modules ${PN}-spa-plugins"
>> -
>> -FILES_${PN} = "\
>> -    ${sysconfdir}/pipewire/pipewire.conf \
>> -    ${bindir}/pw-* \
>> -    ${bindir}/pipewire* \
>> -    ${systemd_user_unitdir}/* \
>> -"
>> -FILES_lib${PN} = "\
>> -    ${libdir}/libpipewire-*.so.* \
>> -    ${libdir}/libjack-*.so.* \
>> -    ${libdir}/libpulse-*.so.* \
>> -"
>> -FILES_lib${PN}-modules = "\
>> -    ${libdir}/pipewire-*/* \
>> -"
>> -FILES_${PN}-spa-plugins = "\
>> -    ${bindir}/spa-* \
>> -    ${libdir}/spa-*/* \
>> -"
>> -FILES_${PN}-alsa = "\
>> -    ${libdir}/alsa-lib/* \
>> -"
>> -FILES_gstreamer1.0-${PN} = "\
>> -    ${libdir}/gstreamer-1.0/* \
>> -"
>> -
>> -CONFFILES_${PN} = "\
>> -    ${sysconfdir}/pipewire/pipewire.conf \
>> -"
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>> 
>>

--------------50351ECE1FBB518045704A2C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Version 0.3.23 just came out. I'd rather upgrade the recipe to
      that one, and if others here are OK with it, migrate it to
      oe-core.<br>
    </p>
    <div class="moz-cite-prefix">On 03.03.21 20:22, Johannes Pointner
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAHvQdo3=+geB3pheET1Oi5vtR_5v5bK0wW5MZW55Ju4AaMygzQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Hello Carlos,

On Wed, Mar 3, 2021 at 12:41 PM Carlos Rafael Giani via
lists.openembedded.org <a class="moz-txt-link-rfc2396E" href="mailto:crg7475=mailbox.org@lists.openembedded.org">&lt;crg7475=mailbox.org@lists.openembedded.org&gt;</a>
wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
* Use a versioned recipe instead of _git
* Add more packageconfigs: alsa, docs, sdl2, sndfile, v4l2,
  pipewire-alsa, pipewire-jack
* Split SPA and module packages dynamically to generate one package for
  each SPA plugin and for each module
* Split pipewire library, shim PulseAudio daemon, main tools &amp; SPA tools,
  pipewire-alsa, pipewire-jack, ALSA card profiles, GStreamer plugin,
  and example session manager into separate packages
* Set up a "pipewire" user and group to run the PipeWire daemon with that
  user instead of root
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Could you please add the patch that fixes a crash of the pipewire-media-session:
<a class="moz-txt-link-freetext" href="https://bugzilla.redhat.com/show_bug.cgi?id=1931043">https://bugzilla.redhat.com/show_bug.cgi?id=1931043</a>
<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/3673265ae20d7b59e89cad6c5238c232796731b2">https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/3673265ae20d7b59e89cad6c5238c232796731b2</a>

Thx,
Hannes

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Carlos Rafael Giani <a class="moz-txt-link-rfc2396E" href="mailto:crg7475@mailbox.org">&lt;crg7475@mailbox.org&gt;</a>
---
 .../pipewire/pipewire_0.3.22.bb               | 273 ++++++++++++++++++
 .../pipewire/pipewire_git.bb                  |  77 -----
 2 files changed, 273 insertions(+), 77 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.bb
new file mode 100644
index 000000000..b54be7f89
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.22.bb
@@ -0,0 +1,273 @@
+SUMMARY = "Multimedia processing server for Linux"
+DESCRIPTION = "Linux server for handling and routing audio and video streams between applications and multimedia I/O devices"
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pipewire.org/">"https://pipewire.org/"</a>
+BUGTRACKER  = <a class="moz-txt-link-rfc2396E" href="https://gitlab.freedesktop.org/pipewire/pipewire/issues">"https://gitlab.freedesktop.org/pipewire/pipewire/issues"</a>
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = " \
+    <a class="moz-txt-link-freetext" href="file://LICENSE;md5=e2c0b7d86d04e716a3c4c9ab34260e69">file://LICENSE;md5=e2c0b7d86d04e716a3c4c9ab34260e69</a> \
+    <a class="moz-txt-link-freetext" href="file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a">file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a</a> \
+"
+SECTION = "multimedia"
+
+DEPENDS = "dbus"
+
+SRCREV = "22d563720a7f6ba7bdf59950f8c14488d80dfa95"
+SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig systemd manpages gettext useradd
+
+USERADD_PACKAGES = "${PN}"
+
+GROUPADD_PARAM_${PN} = "--system pipewire"
+
+USERADD_PARAM_${PN} = "--system --home / --no-create-home \
+                       --comment 'PipeWire multimedia daemon' \
+                       --gid pipewire --groups audio,video \
+                       pipewire"
+
+# For "EVL", look up <a class="moz-txt-link-freetext" href="https://evlproject.org/">https://evlproject.org/</a> . It involves
+# a specially prepared kernel, and is currently unavailable
+# in Yocto.
+# FFmpeg and Vulkan aren't really supported - at the current
+# stage (version 0.3.22), these are just experiments, not
+# actual features.
+# libcamera support currently does not build successfully.
+# systemd user service files are disabled because per-user
+# PipeWire instances aren't really something that makes
+# much sense in an embedded environment. A system-wide
+# instance does.
+EXTRA_OEMESON += " \
+    -Daudiotestsrc=true \
+    -Devl=false \
+    -Dsystemd-user-service=false \
+    -Dtests=false \
+    -Dudevrulesdir=${nonarch_base_libdir}/udev/rules.d/ \
+    -Dvideotestsrc=true \
+    -Dffmpeg=false \
+    -Dvulkan=false \
+    -Dlibcamera=false \
+"
+
+PACKAGECONFIG ??= "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa systemd', d)} \
+    gstreamer jack v4l2 \
+"
+
+# "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
+# since "jack" imports libjack, and "pipewire-jack" generates
+# libjack.so* files, thus colliding with the libpack package. This
+# is why these two are marked in their respective packageconfigs
+# as being in conflict.
+
+PACKAGECONFIG[alsa] = "-Dalsa=true,-Dalsa=false,alsa-lib udev"
+PACKAGECONFIG[bluez] = "-Dbluez5=true,-Dbluez5=false,bluez5 sbc"
+PACKAGECONFIG[docs] = "-Ddocs=true,-Ddocs=false,doxygen"
+PACKAGECONFIG[gstreamer] = "-Dgstreamer=true,-Dgstreamer=false,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[jack] = "-Djack=true,-Djack=false,jack,,,pipewire-jack"
+PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxml-parser-perl-native"
+PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,virtual/libsdl2"
+PACKAGECONFIG[sndfile] = "-Dsndfile=enabled,-Dsndfile=disabled,libsndfile1"
+PACKAGECONFIG[systemd] = "-Dsystemd=true -Dsystemd-system-service=true ,-Dsystemd=false -Dsystemd-system-service=false,systemd"
+PACKAGECONFIG[v4l2] = "-Dv4l2=true,-Dv4l2=false,udev"
+PACKAGECONFIG[pipewire-alsa] = "-Dpipewire-alsa=true,-Dpipewire-alsa=false,alsa-lib"
+PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=true -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=false,jack,,,jack"
+
+PACKAGESPLITFUNCS_prepend = " split_dynamic_packages "
+PACKAGESPLITFUNCS_append = " set_dynamic_metapkg_rdepends "
+
+SPA_SUBDIR = "spa-0.2"
+PW_MODULE_SUBDIR = "pipewire-0.3"
+
+remove_unused_installed_files() {
+    # jack.conf is used by pipewire-jack (not the JACK SPA plugin).
+    # Remove it if pipewire-jack is not built to avoid creating the
+    # pipewire-jack package.
+    if ${@bb.utils.contains('PACKAGECONFIG', 'pipewire-jack', 'false', 'true', d)}; then
+        rm -f "${D}${sysconfdir}/pipewire/jack.conf"
+    fi
+}
+
+do_install[postfuncs] += "remove_unused_installed_files"
+
+python split_dynamic_packages () {
+    # Create packages for each SPA plugin. These plugins are located
+    # in individual subdirectories, so a recursive search is needed.
+    spa_libdir = d.expand('${libdir}/${SPA_SUBDIR}')
+    do_split_packages(d, spa_libdir, r'^libspa-(.*)\.so$', d.expand('${PN}-spa-plugins-%s'), 'PipeWire SPA plugin for %s', extra_depends='', recursive=True)
+
+    # Create packages for each PipeWire module.
+    pw_module_libdir = d.expand('${libdir}/${PW_MODULE_SUBDIR}')
+    do_split_packages(d, pw_module_libdir, r'^libpipewire-module-(.*)\.so$', d.expand('${PN}-modules-%s'), 'PipeWire %s module', extra_depends='', recursive=False)
+}
+
+python set_dynamic_metapkg_rdepends () {
+    import os
+    import oe.utils
+
+    # Go through all generated SPA plugin and PipeWire module packages
+    # (excluding the main package and the -meta package itself) and
+    # add them to the -meta package as RDEPENDS.
+
+    base_pn = d.getVar('PN')
+
+    spa_pn = base_pn + '-spa-plugins'
+    spa_metapkg =  spa_pn + '-meta'
+
+    pw_module_pn = base_pn + '-modules'
+    pw_module_metapkg =  pw_module_pn + '-meta'
+
+    d.setVar('ALLOW_EMPTY_' + spa_metapkg, "1")
+    d.setVar('FILES_' + spa_metapkg, "")
+
+    d.setVar('ALLOW_EMPTY_' + pw_module_metapkg, "1")
+    d.setVar('FILES_' + pw_module_metapkg, "")
+
+    blacklist = [ spa_pn, spa_metapkg, pw_module_pn, pw_module_metapkg ]
+    spa_metapkg_rdepends = []
+    pw_module_metapkg_rdepends = []
+    pkgdest = d.getVar('PKGDEST')
+
+    for pkg in oe.utils.packages_filter_out_system(d):
+        if pkg in blacklist:
+            continue
+
+        is_spa_pkg = pkg.startswith(spa_pn)
+        is_pw_module_pkg = pkg.startswith(pw_module_pn)
+        if not is_spa_pkg and not is_pw_module_pkg:
+            continue
+
+        if pkg in spa_metapkg_rdepends or pkg in pw_module_metapkg_rdepends:
+            continue
+
+        # See if the package is empty by looking at the contents of its
+        # PKGDEST subdirectory. If this subdirectory is empty, then then
+        # package is empty as well. Empty packages do not get added to
+        # the meta package's RDEPENDS.
+        pkgdir = os.path.join(pkgdest, pkg)
+        if os.path.exists(pkgdir):
+            dir_contents = os.listdir(pkgdir) or []
+        else:
+            dir_contents = []
+        is_empty = len(dir_contents) == 0
+        if not is_empty:
+            if is_spa_pkg:
+                spa_metapkg_rdepends.append(pkg)
+            if is_pw_module_pkg:
+                pw_module_metapkg_rdepends.append(pkg)
+
+    d.setVar('RDEPENDS_' + spa_metapkg, ' '.join(spa_metapkg_rdepends))
+    d.setVar('DESCRIPTION_' + spa_metapkg, spa_pn + ' meta package')
+
+    d.setVar('RDEPENDS_' + pw_module_metapkg, ' '.join(pw_module_metapkg_rdepends))
+    d.setVar('DESCRIPTION_' + pw_module_metapkg, pw_module_pn + ' meta package')
+}
+
+PACKAGES =+ "\
+    libpipewire \
+    ${PN}-tools \
+    ${PN}-pulse \
+    ${PN}-alsa \
+    ${PN}-jack \
+    ${PN}-media-session \
+    ${PN}-spa-plugins \
+    ${PN}-spa-plugins-meta \
+    ${PN}-spa-tools \
+    ${PN}-modules \
+    ${PN}-modules-meta \
+    ${PN}-alsa-card-profile \
+    gstreamer1.0-pipewire \
+"
+
+PACKAGES_DYNAMIC = "^${PN}-spa-plugins.* ^${PN}-modules.*"
+
+SYSTEMD_SERVICE_${PN} = "pipewire.service"
+CONFFILES_${PN} += "${sysconfdir}/pipewire/pipewire.conf"
+FILES_${PN} = " \
+    ${sysconfdir}/pipewire/pipewire.conf \
+    ${systemd_user_unitdir}/pipewire.* \
+    ${bindir}/pipewire \
+"
+
+FILES_${PN}-dev += " \
+    ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so \
+"
+
+CONFFILES_libpipewire += "${sysconfdir}/pipewire/client.conf"
+FILES_libpipewire = " \
+    ${sysconfdir}/pipewire/client.conf \
+    ${libdir}/libpipewire-*.so.* \
+"
+# Add the bare minimum modules and plugins required to be able
+# to use libpipewire. Without these, it is essentially unusable.
+RDEPENDS_libpipewire += " \
+    ${PN}-modules-client-node \
+    ${PN}-modules-protocol-native \
+    ${PN}-spa-plugins-support \
+"
+
+FILES_${PN}-tools = " \
+    ${bindir}/pw-* \
+"
+
+# This is a shim daemon that is intended to be used as a
+# drop-in PulseAudio replacement, providing a pulseaudio-compatible
+# socket that can be used by applications that use libpulse.
+CONFFILES_${PN}-pulse += "${sysconfdir}/pipewire/pipewire-pulse.conf"
+FILES_${PN}-pulse = " \
+    ${sysconfdir}/pipewire/pipewire-pulse.conf \
+    ${systemd_user_unitdir}/pipewire-pulse.* \
+    ${bindir}/pipewire-pulse \
+"
+RDEPENDS_${PN}-pulse += " \
+    ${PN}-modules-protocol-pulse \
+"
+
+# alsa plugin to redirect audio to pipewire
+FILES_${PN}-alsa = "\
+    ${libdir}/alsa-lib/* \
+    ${datadir}/alsa/alsa.conf.d/* \
+"
+
+# jack drop-in libraries to redirect audio to pipewire
+CONFFILES_${PN}-jack = "${sysconfdir}/pipewire/jack.conf"
+FILES_${PN}-jack = "\
+    ${sysconfdir}/pipewire/jack.conf \
+    ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \
+"
+
+# Example session manager. Not intended for use in production.
+CONFFILES_${PN}-media-session = "${sysconfdir}/pipewire/media-session.d/*"
+FILES_${PN}-media-session = " \
+    ${bindir}/pipewire-media-session \
+    ${sysconfdir}/pipewire/media-session.d/* \
+"
+RPROVIDES_${PN}-media-session = "virtual/pipewire-sessionmanager"
+
+# Dynamic packages (see set_dynamic_metapkg_rdepends).
+FILES_${PN}-spa-plugins = ""
+RRECOMMENDS_${PN}-spa-plugins += "${PN}-spa-plugins-meta"
+
+FILES_${PN}-spa-tools = " \
+    ${bindir}/spa-* \
+"
+
+# Dynamic packages (see set_dynamic_metapkg_rdepends).
+FILES_${PN}-modules = ""
+RRECOMMENDS_${PN}-modules += "${PN}-modules-meta"
+
+CONFFILES_${PN}-modules-rtkit = "${sysconfdir}/pipewire/client-rt.conf"
+FILES_${PN}-modules-rtkit += " \
+    ${sysconfdir}/pipewire/client-rt.conf \
+    "
+
+FILES_${PN}-alsa-card-profile = " \
+    ${datadir}/alsa-card-profile/* \
+    ${nonarch_base_libdir}/udev/rules.d/90-pipewire-alsa.rules \
+"
+
+FILES_gstreamer1.0-pipewire = " \
+    ${libdir}/gstreamer-1.0/* \
+"
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
deleted file mode 100644
index 173b695e1..000000000
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
+++ /dev/null
@@ -1,77 +0,0 @@
-SUMMARY = "Multimedia processing server for Linux"
-AUTHOR = "Wim Taymans <a class="moz-txt-link-rfc2396E" href="mailto:wtaymans@redhat.com">&lt;wtaymans@redhat.com&gt;</a>"
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pipewire.org">"https://pipewire.org"</a>
-SECTION = "multimedia"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = " \
-    <a class="moz-txt-link-freetext" href="file://LICENSE;md5=e2c0b7d86d04e716a3c4c9ab34260e69">file://LICENSE;md5=e2c0b7d86d04e716a3c4c9ab34260e69</a> \
-    <a class="moz-txt-link-freetext" href="file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a">file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a</a> \
-"
-DEPENDS = "alsa-lib dbus udev"
-SRCREV = "74a1632f0720886d5b3b6c23ee8fcd6c03ca7aac"
-PV = "0.3.1"
-
-SRC_URI = "git://github.com/PipeWire/pipewire"
-
-S = "${WORKDIR}/git"
-
-inherit meson pkgconfig systemd manpages
-
-PACKAGECONFIG ??= "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio systemd vulkan', d)} \
-    jack gstreamer \
-"
-
-PACKAGECONFIG[bluez] = "-Dbluez5=true,-Dbluez5=false,bluez5 sbc"
-PACKAGECONFIG[jack] = "-Djack=true,-Djack=false,jack"
-PACKAGECONFIG[gstreamer] = "-Dgstreamer=true,-Dgstreamer=false,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
-PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxml-parser-perl-native"
-PACKAGECONFIG[pulseaudio] = "-Dpipewire-pulseaudio=true,-Dpipewire-pulseaudio=false,pulseaudio"
-PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
-PACKAGECONFIG[vulkan] = "-Dvulkan=true,-Dvulkan=false,vulkan-loader"
-
-LDFLAGS_append_mipsarch = " -latomic"
-LDFLAGS_append_x86 = " -latomic"
-LDFLAGS_append_riscv32 = " -latomic"
-
-PACKAGES =+ "\
-    ${PN}-spa-plugins \
-    ${PN}-alsa \
-    ${PN}-config \
-    gstreamer1.0-${PN} \
-    lib${PN} \
-    lib${PN}-modules \
-    lib${PN}-jack \
-"
-
-RDEPENDS_lib${PN} += "lib${PN}-modules ${PN}-spa-plugins"
-
-FILES_${PN} = "\
-    ${sysconfdir}/pipewire/pipewire.conf \
-    ${bindir}/pw-* \
-    ${bindir}/pipewire* \
-    ${systemd_user_unitdir}/* \
-"
-FILES_lib${PN} = "\
-    ${libdir}/libpipewire-*.so.* \
-    ${libdir}/libjack-*.so.* \
-    ${libdir}/libpulse-*.so.* \
-"
-FILES_lib${PN}-modules = "\
-    ${libdir}/pipewire-*/* \
-"
-FILES_${PN}-spa-plugins = "\
-    ${bindir}/spa-* \
-    ${libdir}/spa-*/* \
-"
-FILES_${PN}-alsa = "\
-    ${libdir}/alsa-lib/* \
-"
-FILES_gstreamer1.0-${PN} = "\
-    ${libdir}/gstreamer-1.0/* \
-"
-
-CONFFILES_${PN} = "\
-    ${sysconfdir}/pipewire/pipewire.conf \
-"
--
2.25.1




</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">


</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------50351ECE1FBB518045704A2C--
