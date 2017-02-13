Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 89B05731AF;
	Mon, 13 Feb 2017 19:53:09 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id k90so157555865wrc.3;
	Mon, 13 Feb 2017 11:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=DVxnN6mpLacO+xf/2OTwzlBNc0WuumaSdMiPDw4OcCU=;
	b=GXrvfpujK/H7+Yxx+l0AUoe1VULMtOhxH4s7m13IFF+Mwdm9D/BULjQAyvjij6vdvs
	NAHDOERthWZQz3bMpUXlFIhj2j1Gxib2jhBYyQd48+fiMoJTKX2bhjPKAv2UfSb12x8n
	mlAPtI8uwNlRMwQkYswPvMGDGiEIvqqyg+B2sRrGXuzf0pNIXs+2gxgIPS/siBiA9sLL
	bZyZSrq3ouvYHYJ/FePXqaJj7of7skJ1uBGmsZkHUmTWYHcQVIe2+t2ix7GIj3m7Iy0a
	hQhGuvWfbmk/7iyLEzCR68IfRyN+57fO1eZp+c0xgTOZ8OuWw/tAfyLb9uNQbQsaFQqu
	XwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=DVxnN6mpLacO+xf/2OTwzlBNc0WuumaSdMiPDw4OcCU=;
	b=n6YWU3yTpbN40EUOqIg+Yxp8HuE7LQlJQedwPxIA4XaGxLdYXYXFGcP+jxU9HhxLW8
	G9IVAlR8dhQegUqMnATukxbAlx1ZYt4kmVDmKyD1eIZtyYPhz0IQ5JWvztsaVeW7yFZR
	zTlLP4oYlVYIfTb1hGbom7h1Mzn1paqOEAasWX6cSHNOD+DioR969dGlQQMhFSvCvJNq
	ONEcMFVHOL/Pinj2Fl8AlxISycqBAkqc5FwQcR0Vd59xQbRiFoA4rhpvNkU8xd7NuhRb
	rUD8Z/sqRY5wXR0w3ojrb/cG0+k4XhzdrAP8c9arUSZupqgAHcli9/e+bcQT/GLrEyF/
	Q1ig==
X-Gm-Message-State: AMke39nksavECvdJUStMIR2qwQTGrDSlxqyvuZB4qVhBEjWNQtTrS4OfAqw2fRPaTpxexY1q3ySCzp8GvWmK0Q==
X-Received: by 10.223.150.34 with SMTP id b31mr22031030wra.196.1487015587997; 
	Mon, 13 Feb 2017 11:53:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Mon, 13 Feb 2017 11:53:06 -0800 (PST)
In-Reply-To: <20170213193327.GB856@jama>
References: <20170213193327.GB856@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 20:53:06 +0100
Message-ID: <CA+chaQduZp3g1uDqhFfowFJtoxARdx4zJ2xsoAEjVYYXY2=7KA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: State of bitbake world, Failed tasks 2017-02-13
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
X-List-Received-Date: Mon, 13 Feb 2017 19:53:11 -0000
Content-Type: text/plain; charset=UTF-8

I found an issue in the report generation, that it didn't show failures for
BBCLASSEXTENDed recipes, I've fixed it in jenkins-job.sh and the updated
report would look like this:

INFO: jenkins-job.sh-1.8.17 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170213_094715.log

=== common (2) ===
    * virtual:klibc:meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb:do_configure
    * virtual:native:meta-openembedded/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb:do_compile

=== common-x86 (9) ===
    * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_compile
    * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb:do_compile
    * meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:do_prepare_recipe_sysroot
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/pimlico/contacts_git.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/geany/geany_1.29.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb:do_compile
    * meta-openembedded/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb:do_configure
    * virtual:native:meta-openembedded/meta-oe/recipes-extended/efivar/efivar_0.24.bb:do_compile

=== qemuarm (1) ===
    * meta-openembedded/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb:do_fetch

=== qemux86 (0) ===

=== qemux86_64 (0) ===


And qemuarm is showing less issues, because it was triggered later and has
even more PNBLACKLISTs.

I'll also stop sending the list of PNBLACKLISTs and QA issues and included
changes to the ML, because it's too long and sometimes I've noticed that
there are copy&paste issues when I'm pasting very long text (not sure if
it's mangled by vim in paste mode or already in chromium when doing
Ctrl+C). Interested people can still see it all in the "complete log" which
is lined above the report.

On Mon, Feb 13, 2017 at 8:33 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> == Number of issues - stats ==
> {| class='wikitable'
> !|Date               !!colspan='3'|Failed tasks
>  !!colspan='6'|Failed depencencies                    !!|Signatures
>     !!colspan='12'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64
> ||qemuarm||max||min     ||qemux86||max||min     ||all   ||already-stripped
>     ||libdir        ||textrel       ||build-deps    ||file-rdeps
> ||version-going-backwards       ||host-user-contaminated
> ||installed-vs-shipped  ||unknown-configure-option
> ||symlink-to-sysroot    ||invalid-pkgconfig     ||pkgname       ||
> |-
> ||2017-02-13    ||1     ||8     ||8     ||N/A   ||N/A   ||N/A   ||N/A
>  ||N/A   ||N/A   ||0     ||0             ||0             ||0
>  ||0             ||0             ||680           ||0             ||0
>      ||0             ||0             ||0             ||0             ||
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2017-02-13 ==
>
> INFO: jenkins-job.sh-1.8.16 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> report.20170213_093040.log
>
> === common () ===
>
> === common-x86 (8) ===
>     * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:
> do_compile
>     * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143
> .bb:do_compile
>     * meta-openembedded/meta-filesystems/recipes-
> filesystems/smbnetfs/smbnetfs_git.bb:do_prepare_recipe_sysroot
>     * meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-
> utility/gnome-disk-utility_2.32.0.bb:do_compile
>     * meta-openembedded/meta-gnome/recipes-gnome/pimlico/contacts_git.bb:
> do_configure
>     * meta-openembedded/meta-oe/recipes-devtools/geany/geany_1.29.bb:
> do_configure
>     * meta-openembedded/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb:
> do_compile
>     * meta-openembedded/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb:
> do_configure
>
> === qemuarm (1) ===
>     * meta-openembedded/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb:
> do_fetch
>
> === qemux86 (0) ===
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (17) ===
> {| class=wikitable
> |-
> || qemuarm      || 1     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemuarm.20170213_081827.log/ ||
> http://errors.yoctoproject.org/Errors/Build/32344/
> |-
> || qemux86      || 8     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemux86.20170213_054153.log/ ||
> http://errors.yoctoproject.org/Errors/Build/32332/
> |-
> || qemux86_64   || 8     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemux86-64.20170213_072647.log/ ||
> http://errors.yoctoproject.org/Errors/Build/32343/
> |}
> === PNBLACKLISTs (460) ===
>
> === QA issues (680) ===
> {| class=wikitable
> !| Count                ||Issue
> |-
> ||0     ||already-stripped
> |-
> ||0     ||build-deps
> |-
> ||0     ||file-rdeps
> |-
> ||0     ||host-user-contaminated
> |-
> ||0     ||installed-vs-shipped
> |-
> ||0     ||invalid-pkgconfig
> |-
> ||0     ||libdir
> |-
> ||0     ||pkgname
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||0     ||textrel
> |-
> ||0     ||unknown-configure-option
> |-
> ||680   ||version-going-backwards
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> signatures.20170213_071600.log/
>
>     * ERROR: Nothing RPROVIDES 'fsoaudiod' (but /home/jenkins/oe/world/shr-
> core/openembedded-core/meta/recipes-core/packagegroups/pac
> kagegroup-base.bb RDEPENDS on or otherwise requires it)
>     * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depends on
> blacklisted libfso-glib
>     * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depends on
> blacklisted libfso-glib
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86copy in
> /home/jenkins/oe/world/shr-core/tmp-glibc/stamps
>     * ERROR: Nothing RPROVIDES 'fsoaudiod' (but /home/jenkins/oe/world/shr-
> core/openembedded-core/meta/recipes-core/packagegroups/pac
> kagegroup-base.bb RDEPENDS on or otherwise requires it)
>     * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depends on
> blacklisted libfso-glib
>     * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depends on
> blacklisted libfso-glib
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86 in
> /home/jenkins/oe/world/shr-core/tmp-glibc/stamps
>     * ERROR: Nothing RPROVIDES 'fsoaudiod' (but /home/jenkins/oe/world/shr-
> core/openembedded-core/meta/recipes-core/packagegroups/pac
> kagegroup-base.bb RDEPENDS on or otherwise requires it)
>     * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depends on
> blacklisted libfso-glib
>     * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depends on
> blacklisted libfso-glib
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
>     * ERROR: no sigdata files were generated for MACHINE qemuarm in
> /home/jenkins/oe/world/shr-core/tmp-glibc/stamps
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?= "BROKEN:
> fails to build with gcc-6"
> recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb:PNBLACKLIST[chromium-wayland]
> ?= "Fails to build http://errors.yoctoproject.org/Errors/Details/132830/"
> recipes-browser/chromium/chromium_52.0.2743.76.bb:PNBLACKLIST[chromium]
> ?= "Fails to build http://errors.yoctoproject.org/Errors/Details/132831/"
> meta-openembedded:
> meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb:PNBLACKLIST[python-edbus]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130600/"
> meta-efl/recipes-devtools/python/python-efl_1.15.0.bb:PNBLACKLIST[python-efl]
> ?= "Depends on blacklisted elementary"
> meta-efl/recipes-devtools/python/python-efl_git.bb:PNBLACKLIST[python-efl]
> ?= "Depends on blacklisted elementary"
> meta-efl/recipes-efl/e17/cpu_svn.bb:PNBLACKLIST[cpu] ?= "Depends on
> blacklisted e-wm"
> meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?= "broken:
> switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/
> and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58.
> invalid state name: 'off'. "default" state must always be first."
> meta-efl/recipes-efl/e17/e-tasks_git.bb:PNBLACKLIST[e-tasks] ?= "Depends
> on blacklisted elementary"
> meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b-and-w]
> ?= "Runtime depends on blacklisted e-wm"
> meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b-and-w]
> ?= "Runtime depends on blacklisted e-wm-theme-b-and-w"
> meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b-and-w]
> ?= "Runtime depends on blacklisted e-wm-theme-b-and-w-dev"
> meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb:P
> NBLACKLIST[e-wm-theme-illume-efenniht] ?= "Runtime depends on blacklisted
> e-wm"
> meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb:P
> NBLACKLIST[e-wm-theme-illume-efenniht] ?= "Runtime depends on blacklisted
> e-wm-theme-illume-efenniht"
> meta-efl/recipes-efl/e17/e-wm_0.18.8.bb:PNBLACKLIST[e-wm] ?= "Depends on
> blacklisted elementary"
> meta-efl/recipes-efl/e17/e-wm_0.19.10.bb:PNBLACKLIST[e-wm] ?= "Depends on
> blacklisted elementary"
> meta-efl/recipes-efl/e17/e-wm_git.bb:PNBLACKLIST[e-wm] ?= "Depends on
> blacklisted elementary"
> meta-efl/recipes-efl/e17/edje-viewer_svn.bb:PNBLACKLIST[edje-viewer] ?=
> "Depends on blacklisted elementary"
> meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?= "Depends on
> blacklisted webkit-efl"
> meta-efl/recipes-efl/e17/elfe_git.bb:PNBLACKLIST[elfe] ?= "Depends on
> blacklisted elementary"
> meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=
> "OLD and depends on broken azy"
> meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?= "if you
> want to use these modules with E18, then you need to update it to git
> recipe fetching newer sources from http://git.enlightenment.org/
> apps/emprint.git/"
> meta-efl/recipes-efl/e17/enjoy_git.bb:PNBLACKLIST[enjoy] ?= "Depends on
> blacklisted elementary"
> meta-efl/recipes-efl/e17/ephoto_svn.bb:PNBLACKLIST[ephoto] ?= "Depends on
> blacklisted elementary"
> meta-efl/recipes-efl/e17/exalt-client_svn.bb:PNBLACKLIST[exalt-client] ?=
> "Depends on blacklisted elementary"
> meta-efl/recipes-efl/e17/exalt_svn.bb:PNBLACKLIST[exalt] ?= "Depends on
> blacklisted elementary"
> meta-efl/recipes-efl/e17/exquisite_svn.bb:PNBLACKLIST[exquisite] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130619/"
> meta-efl/recipes-efl/e17/flame_svn.bb:PNBLACKLIST[flame] ?= "Depends on
> blacklisted e-wm"
> meta-efl/recipes-efl/e17/forecasts_svn.bb:PNBLACKLIST[forecasts] ?=
> "Depends on blacklisted e-wm"
> meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?= "if you want to
> use these modules with E18, then you need to update it to git recipe
> fetching newer sources from http://git.enlightenment.org/
> enlightenment/modules/news.git/"
> meta-efl/recipes-efl/e17/places_svn.bb:PNBLACKLIST[places] ?= "Depends on
> blacklisted e-wm"
> meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?= "if you want to
> use these modules with E18, then you need to update it to git recipe
> fetching newer sources from  http://git.enlightenment.org/apps/rage.git/"
> meta-efl/recipes-efl/e17/rain_svn.bb:PNBLACKLIST[rain] ?= "Depends on
> blacklisted e-wm"
> meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=
> "depends on blacklisted emprint"
> meta-efl/recipes-efl/e17/terminology_0.9.1.bb:PNBLACKLIST[terminology] ?=
> "Depends on blacklisted elementary"
> meta-efl/recipes-efl/e17/uptime_svn.bb:PNBLACKLIST[uptime] ?= "Depends on
> blacklisted e-wm"
> meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?= "OLD and doesn't
> build with gcc-5"
> meta-efl/recipes-efl/efl/elementary_1.15.1.bb:PNBLACKLIST[elementary] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130584/"
> meta-efl/recipes-efl/efl/engrave_svn.bb:PNBLACKLIST[engrave] ?= "BROKEN:
> fails to build with latest oe-core"
> meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=
> "broken: switch to https://git.enlightenment.org/misc/entrance.git and
> fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid
> state name: 'defaault'. "default" state must always be first."
> meta-efl/recipes-efl/efl/libeflvala_svn.bb:PNBLACKLIST[libeflvala] ?=
> "Depends on blacklisted elementary"
> meta-efl/recipes-efl/efl/libeweather_svn.bb:PNBLACKLIST[libeweather] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130649/"
> meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb:PNBLACKLIST[packagegroup-efl-sdk]
> ?= "Runtime depends on blacklisted elementary-dev"
> meta-efl/recipes-efl/packagegroups/packagegroup-
> efl-standalone-sdk-target.bb:PNBLACKLIST[packagegroup-efl-standalone-sdk-target]
> ?= "Runtime depends on blacklisted elementary-dev"
> meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[packagegroup-x11-illume]
> ?= "Runtime depends on blacklisted e-wm"
> meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[packagegroup-x11-illume]
> ?= "Runtime depends on blacklisted e-wm-config-mobile"
> meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[packagegroup-x11-illume]
> ?= "Runtime depends on blacklisted e-wm-theme-default"
> meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?=
> "Old and unmaintaned fork with many security issues"
> meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=
> "BROKEN: latest version 0.3.4 is 3 years old and now broken with more
> strict ejde_cc from efl-1.13"
> meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:PNBLACKLIST[smbnetfs]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/132827/"
> meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb:
> PNBLACKLIST[unionfs-fuse] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130648/"
> meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb:PNBLACKLIST[dmapi]
> ?= "Depends on broken xfsprogs"
> meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb:PNBLACKLIST[xfsdump]
> ?= "Depends on broken xfsprogs"
> meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb:PNBLACKLIST[xfsprogs]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130663/"
> meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb:PNBLACKLIST[cheese] ?=
> "Depends on blacklisted gstreamer"
> meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb:PNBLACKLIST[cheese] ?=
> "Depends on blacklisted gnome-desktop"
> meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview]
> ?= "BROKEN: images are not displayed anymore"
> meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb:PNBLACKLIST[gmtk] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130661/"
> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gnome-mplayer]
> ?= "rdepends on blacklisted mplayer"
> meta-gnome/recipes-extended/gparted/gparted_0.27.0.bb:PNBLACKLIST[gparted]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/131634/"
> meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:
> PNBLACKLIST[gtk-theme-torturer] ?= "BROKEN: gmacros.h:182:53: error: size
> of array '_GStaticAssertCompileTimeAssertion_2' is negative"
> meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb:PNBLACKLIST[abiword] ?=
> "Depends on blacklisted gtkmathview"
> meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb:PNBLACKLIST[libbonobo]
> ?= "Depends on blacklisted orbit2"
> meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb:PNBLACKLIST[libbonoboui]
> ?= "Depends on blacklisted libgnome"
> meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb:PNBLACKLIST[libbonoboui]
> ?= "Depends on blacklisted libbonobo"
> meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb:PNBLACKLIST[devilspie2]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130666/"
> meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctool]
> ?= "broken at least since April 2013 http://permalink.gmane.org/
> gmane.comp.handhelds.openembedded/57920 and nobody complained, it's also
> replaced by gnome calculator"
> meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?= "Depends
> on broken gnome-panel"
> meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb:PNBLACKLIST[gedit] ?=
> "Depends on blacklisted gtksourceview2"
> meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb:
> PNBLACKLIST[gnome-backgrounds] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130647/"
> meta-gnome/recipes-gnome/gnome-control-center/gnome-
> control-center_2.32.1.bb:PNBLACKLIST[gnome-control-center] ?= "Depends on
> broken gnome-menus"
> meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb:
> PNBLACKLIST[gnome-desktop] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130595/"
> meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb:
> PNBLACKLIST[gnome-disk-utility] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/132824/"
> meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:
> PNBLACKLIST[gnome-keyring] ?= "This version conflicts with gcr from
> oe-core"
> meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb:PNBLACKLIST[gnome-menus]
> ?= "BROKEN: fails to build because of python + conflicts with gnome-menu3"
> meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb:
> PNBLACKLIST[gnome-mime-data] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130589/"
> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3]
> ?= "CONFLICT: depends on libgweather3 which conflicts with libgweather"
> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3]
> ?= "Depends on broken gnome-menus"
> meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb:PNBLACKLIST[gnome-panel]
> ?= "Depends on broken libgweather"
> meta-gnome/recipes-gnome/gnome-power-manager/gnome-
> power-manager_2.32.0.bb:PNBLACKLIST[gnome-power-manager] ?= "BROKEN: not
> compatible with current libnotify"
> meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb:
> PNBLACKLIST[gnome-session] ?= "BROKEN: fails to build with gcc-6"
> meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-
> settings-daemon_2.32.1.bb:PNBLACKLIST[gnome-settings-daemon] ?= "Depends
> on blacklisted libgnomekbd"
> meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-
> settings-daemon_2.32.1.bb:PNBLACKLIST[gnome-settings-daemon] ?= "Depends
> on blacklisted gnome-desktop"
> meta-gnome/recipes-gnome/gnome-system-monitor/gnome-
> system-monitor_2.28.2.bb:PNBLACKLIST[gnome-system-monitor] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/131635/"
> meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb:PNBLACKLIST[gnome-vfs]
> ?= "Depends on blacklisted gnome-mime-data"
> meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb:PNBLACKLIST[gnome-terminal]
> ?= "BROKEN: fails to build with gcc-6"
> meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb:PNBLACKLIST[libgnomecups]
> ?= "Depends on blacklisted libgnomeui"
> meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb:PNBLACKLIST[libgnomeprint]
> ?= "Depends on broken libgnomecups"
> meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb:PNBLACKLIST[gnumeric]
> ?= "Depends on broken libgnomeprint"
> meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb:PNBLACKLIST[gthumb] ?=
> "Depends on blacklisted gstreamer"
> meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb:PNBLACKLIST[gtk-engines]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130602/"
> meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb:
> PNBLACKLIST[gtksourceview2] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130597/"
> meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgweather3]
> ?= "CONFLICT: 876 files are conflicting with libgweather"
> meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb:PNBLACKLIST[libgweather]
> ?= "BROKEN: fails to build with gcc-6"
> meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb:PNBLACKLIST[libgnome]
> ?= "Depends on blacklisted gnome-vfs"
> meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb:PNBLACKLIST[libgnomekbd]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130608/"
> meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb:PNBLACKLIST[libgnomeui]
> ?= "Depends on blacklisted libgnome"
> meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb:PNBLACKLIST[libidl-native]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130582/"
> meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb:PNBLACKLIST[libidl] ?=
> "Depends on blacklisted libidl-native"
> meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]
> ?= "BROKEN: fails to build, maybe missing dependency on
> gnome-desktop-utils.h provider"
> meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb:PNBLACKLIST[nautilus]
> ?= "Depends on blacklisted gnome-desktop"
> meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb:PNBLACKLIST[orbit2] ?=
> "Depends on blacklisted libidl-native"
> meta-gnome/recipes-gnome/pimlico/contacts_git.bb:PNBLACKLIST[contacts] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/132826/"
> meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb:PNBLACKLIST[tasks] ?=
> "Fails to build with gcc-6"
> meta-gnome/recipes-gnome/pimlico/tasks_git.bb:PNBLACKLIST[tasks] ?=
> "Fails to build with gcc-6"
> meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:
> PNBLACKLIST[system-tools-backends] ?= "does not build with distroless
> qemuarm as reported in 'State of bitbake world' thread, nobody volunteered
> to fix them"
> meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb:PNBLACKLIST[gnome-themes]
> ?= "Depends on blacklisted gtk-engines"
> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=
> "BROKEN: doesn't build with B!=S"
> meta-gnome/recipes-support/florence/florence_0.5.4.bb:PNBLACKLIST[florence]
> ?= "Depends on blacklisted gstreamer"
> meta-gnome/recipes-support/goffice/goffice_0.10.1.bb:PNBLACKLIST[goffice]
> ?= "BROKEN: fails to build with gcc-6"
> meta-gnome/recipes-support/onboard/onboard_1.3.0.bb:PNBLACKLIST[onboard]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130637/"
> meta-gnome/recipes-support/tracker/tracker_0.14.2.bb:PNBLACKLIST[tracker]
> ?= "BROKEN: fails to build with new binutils-2.27"
> meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb:PNBLACKLIST[gpe-scap]
> ?= "Depends on blacklisted libgpewidget"
> meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb:PNBLACKLIST[libgpewidget]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130594/"
> meta-gpe/recipes-graphics/minilite/minilite_0.50.bb:PNBLACKLIST[minilite]
> ?= "Depends on blacklisted libgpewidget"
> meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb:PNBLACKLIST[fbreader]
> ?= "Depends on blacklisted libgpewidget"
> meta-gpe/recipes-support/fbreader/fbreader_git.bb:PNBLACKLIST[fbreader]
> ?= "BROKEN: fails to build with gcc-6"
> meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb:PNBLACKLIST[kexecboot]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/132823/"
> meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb:
> PNBLACKLIST[klibc-utils] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130679/"
> meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb:
> PNBLACKLIST[ubi-utils-klibc] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130665/"
> meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.
> bb:PNBLACKLIST[kexec-tools-klibc] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130674/"
> meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb:
> PNBLACKLIST[gupnp-igd] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130645/"
> meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb:
> PNBLACKLIST[gupnp-tools] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130670/"
> meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb:PNBLACKLIST[dvb-apps]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130603/"
> meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb:PNBLACKLIST[tvheadend]
> ?= "Depends on blacklisted dvb-apps"
> meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb:
> PNBLACKLIST[kodi-addon-pvr-hts] ?= "Depends on blacklisted kodi"
> meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb:PNBLACKLIST[kodi-platform]
> ?= "Depends on blacklisted kodi"
> meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb:PNBLACKLIST[kodi-startup]
> ?= "Runtime depends on blacklisted kodi"
> meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb:PNBLACKLIST[kodi-startup]
> ?= "Runtime depends on blacklisted kodi-startup-dev"
> meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb:PNBLACKLIST[kodi] ?=
> "Depends on blacklisted libsdl-mixer"
> meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoolnix]
> ?= "BROKEN: Failx to build with gcc-5"
> meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:
> PNBLACKLIST[coriander] ?= "BROKEN: fails to use SDL probably because
> libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
> meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:
> PNBLACKLIST[renderer-service-upnp] ?= "BROKEN: doesn't build with B!=S
> (trying to install rendererconsole.py from ${B} instead of ${S})"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb:
> PNBLACKLIST[gst-ffmpeg] ?= "Not compatible with currently used ffmpeg 3"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> fluendo-mp3_0.10.31.bb:PNBLACKLIST[gst-fluendo-mp3] ?= "Depends on
> blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> fluendo-mpegdemux_0.10.85.bb:PNBLACKLIST[gst-fluendo-mpegdemux] ?=
> "Depends on blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb:
> PNBLACKLIST[gst-meta-base] ?= "Depends on blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb:
> PNBLACKLIST[gst-openmax] ?= "Depends on blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-bad_0.10.23.bb:PNBLACKLIST[gst-plugins-bad] ?= "Depends on
> blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-base_0.10.36.bb:PNBLACKLIST[gst-plugins-base] ?= "Depends on
> blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-gl_0.10.3.bb:PNBLACKLIST[gst-plugins-gl] ?= "Depends on
> blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-good_0.10.31.bb:PNBLACKLIST[gst-plugins-good] ?= "Depends on
> blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-ugly_0.10.19.bb:PNBLACKLIST[gst-plugins-ugly] ?= "Depends on
> blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb:
> PNBLACKLIST[gst-rtsp] ?= "Depends on blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb:
> PNBLACKLIST[gstreamer] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130583/"
> meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gst123]
> ?= "gst123 is still "sometimes" using wrong sysroot"
> meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb:PNBLACKLIST[mpd]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130612/"
> meta-networking/recipes-connectivity/crda/crda_3.18.bb:PNBLACKLIST[crda]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130675/"
> meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=
> "BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were
> installed but not shipped in any package:"
> meta-networking/recipes-kernel/netmap/netmap-modules_git.bb:
> PNBLACKLIST[netmap-modules] ?= "BROKEN: not compatible with default
> kernel version 4.8"
> meta-networking/recipes-kernel/netmap/netmap_git.bb:PNBLACKLIST[netmap]
> ?= "BROKEN: Tries to build kernel module and fails, either it should be
> disabled or there should be dependency on kernel like in netmap-modules"
> meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb:PNBLACKLIST[accel-ppp]
> ?= "BROKEN: fails to build with new binutils-2.27"
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:
> PNBLACKLIST[lksctp-tools] ?= "${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb:
> PNBLACKLIST[netcat-openbsd] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130673/"
> meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]
> ?= "BROKEN: Depends on broken yp-tools"
> meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb:PNBLACKLIST[wireshark]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130671/"
> meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-
> test-suite_6.6.1.bb:PNBLACKLIST[phoronix-test-suite] ?= "Runtime depends
> on blacklisted php-cli"
> meta-oe/recipes-benchmark/pmbw/pmbw_git.bb:PNBLACKLIST[pmbw] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/130568/"
> meta-oe/)}"
> meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:
> PNBLACKLIST[gst-plugin-bluetooth] ?= "${@bb.utils.contains('DISTRO_FEATURES',
> 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in
> DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb:PNBLACKLIST[gnokii]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130662/"
> meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb:PNBLACKLIST[libmbim]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130590/"
> meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb:PNBLACKLIST[libqmi]
> ?= "Depends on blacklisted libmbim"
> meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb:PNBLACKLIST[modemmanager]
> ?= "Depends on blacklisted libmbim"
> meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb:PNBLACKLIST[mosh] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130653/"
> meta-oe/recipes-connectivity/networkmanager/networkmanager-
> openvpn_1.2.6.bb:PNBLACKLIST[networkmanager-openvpn] ?= "Fails to build
> with RSS http://errors.yoctoproject.org/Errors/Details/130667/"
> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=
> "BROKEN: depends on broken libftdi"
> meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb:PNBLACKLIST[libtelepathy]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130609/"
> meta-oe/recipes-connectivity/telepathy/telepathy-mission-
> control_5.16.1.bb:PNBLACKLIST[telepathy-mission-control] ?= "Depends on
> blacklisted libtelepathy"
> meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:PNBLACKLIST[wvdial] ?=
> "Depends on broken wvstreams"
> meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:PNBLACKLIST[wvstreams]
> ?= "BROKEN: fails to build with gcc-6"
> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice]
> ?= "BROKEN: not compatible with default db version"
> meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb:PNBLACKLIST[dbus-daemon-proxy]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130613/"
> meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb:PNBLACKLIST[libdbus-c++]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130644/"
> meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] ?=
> "BROKEN: QA Issue: -dev package contains non-symlink .so"
> meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb:PNBLACKLIST[packagegroup-cli-tools]
> ?= "Runtime depends on blacklisted dbus-daemon-proxy"
> meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb:PNBLACKLIST[packagegroup-cli-tools]
> ?= "Runtime depends on blacklisted packagegroup-cli-tools"
> meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?= "Not
> comatible with current nodejs 0.12, but upstream is working on it for v3"
> meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb:PNBLACKLIST[geany-plugins]
> ?= "Depends on blacklisted geany"
> meta-oe/recipes-devtools/geany/geany_1.29.bb:PNBLACKLIST[geany] ?= "Fails
> to build with RSS http://errors.yoctoproject.org/Errors/Details/132822/"
> meta-oe/recipes-devtools/glade/glade3_3.8.5.bb:PNBLACKLIST[glade3] ?=
> "Depends on blacklisted libbonoboui"
> meta-oe/recipes-devtools/glade/glade3_3.8.5.bb:PNBLACKLIST[glade3] ?=
> "Depends on blacklisted libgnomeui"
> meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt]
> ?=ls/php/php_5.6.26.bb:PNBLACKLIST[php] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/131630/"
> meta-oe/recipes-devtools/php/php_7.1.0.bb:PNBLACKLIST[php] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/130601/"
> meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-
> binding-tool_0.4.0.bb:PNBLACKLIST[vala-dbus-binding-tool] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/131628/"
> meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-
> binding-tool_git.bb:PNBLACKLIST[vala-dbus-binding-tool] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/130581/"
> meta-oe/recipes-extended/collectd/collectd_5.5.0.bb:PNBLACKLIST[collectd]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130654/"
> meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb:PNBLACKLIST[efibootmgr]
> ?= "Depends on blacklisted efivar"
> meta-oe/recipes-extended/efivar/efivar_0.24.bb:PNBLACKLIST[efivar] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/132821/"
> meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb:PNBLACKLIST[libgxim] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130604/"
> meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb:PNBLACKLIST[gtkmathview]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/131636/"
> meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb:
> PNBLACKLIST[openlmi-networking] ?= "Depends on blacklisted
> openlmi-providers"
> meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb:
> PNBLACKLIST[openlmi-providers] ?= "Depends on blacklisted lmsensors"
> meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.
> bb:PNBLACKLIST[openlmi-storage] ?= "Depends on blacklisted pywbem"
> meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb:PNBLACKLIST[openlmi-tools]
> ?= "Depends on blacklisted pywbem"
> meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb:PNBLACKLIST[pywbem] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130596/"
> meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb:PNBLACKLIST[pywbem] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130681/"
> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface]
> ?= "Needs to be upgraded for compatibility with new libdivecomputer"
> meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=
> "BROKEN: Fails to build with gcc-5"
> meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb:PNBLACKLIST[gtkhtml2] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130633/"
> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d]
> ?= "BROKEN: doesn't build with B!=S"
> meta-oe/recipes-graphics/fbida/fbida_2.10.bb:PNBLACKLIST[fbida] ?= "Fails
> to build with RSS http://errors.yoctoproject.org/Errors/Details/130677/"
> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?= "BROKEN:
> doesn't build with B!=S (flex: can't open lex.lex)"
> meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb:PNBLACKLIST[fontforge]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130639/"
> meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb:PNBLACKLIST[gimp] ?= "Fails
> to build with RSS http://errors.yoctoproject.org/Errors/Details/132825/"
> meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130607/"
> meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?= "does
> not build with distroless qemuarm as repetails/130632/"
> meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb:PNBLACKLIST[xstdcmap]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130660/"
> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev]
> ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:
> PNBLACKLIST[xf86-video-geode] ?= "BROKEN, fails to build"
> meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.
> bb:PNBLACKLIST[xf86-video-glamo] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130629/"
> meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb:
> PNBLACKLIST[xf86-video-nouveau] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130657/"
> meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.
> bb:PNBLACKLIST[font-adobe-100dpi] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130621/"
> meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb:
> PNBLACKLIST[font-adobe-utopia-100dpi] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130623/"
> meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb:PNBLACKLIST[font-bh-100dpi]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130624/"
> meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-
> 100dpi_1.0.3.bb:PNBLACKLIST[font-bh-lucidatypewriter-100dpi] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/130625/"
> meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb:PNBLACKLIST[font-misc-misc]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130628/"
> meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fonts-100dpi]
> ?= "Runtime depends on blacklisted font-adobe-100dpi"
> meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fonts-100dpi]
> ?= "Runtime depends on blacklisted xorg-fonts-100dpi"
> meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fonts-100dpi]
> ?= "Runtime depends on blacklisted font-bh-100dpi"
> meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fonts-100dpi]
> ?= "Runtime depends on blacklisted font-adobe-utopia-100dpi"
> meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fonts-100dpi]
> ?= "Runtime depends on blacklisted font-bh-lucidatypewriter-100dpi"
> meta-oe/recipes-kernel/crash/crash_7.1.5.bb:PNBLACKLIST[crash] ?= "Fails
> to build with RSS http://errors.yoctoproject.org/Errors/Details/130678/"
> meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module]
> ?= "Not compatible with 3.19 kernel"
> meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?= "Depends on
> blacklisted kernel-module-ktapvm"
> meta-oe/recipes-multimedia/jack/a2jmidid_8.bb:PNBLACKLIST[a2jmidid] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130646/"
> meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb:
> PNBLACKLIST[libsdl-mixer] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130592/"
> meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb:
> PNBLACKLIST[libsdl2-mixer] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130659/"
> meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb:PNBLACKLIST[minidlna]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130630/"
> meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2]
> ?= "Not compatible with currently used ffmpeg 3"pends on blacklisted
> modemmanager"
> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail]
> ?= "depends on blacklisted libetpan"
> meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:
> PNBLACKLIST[claws-plugin-gtkhtml2-viewer] ?= "depends on blacklisted
> claws-mail"
> meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:
> PNBLACKLIST[claws-plugin-mailmbox] ?= "depends on blacklisted claws-mail"
> meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.
> bb:PNBLACKLIST[claws-plugin-rssyl] ?= "depends on blacklisted claws-mail"
> meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130651/"
> meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd]
> ?= "BROKEN: doesn't build with B!=S"
> meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?= "qemu:
> uncaught target signal 11 (Segmentation fault) - core dumped"
> meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]
> ?= "Depends on blacklisted gstreamer"
> meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]
> ?= "Depends on blacklisted libnice"
> meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]
> ?= "Depends on blacklisted gst-plugins-base"
> meta-oe/recipes-support/farsight/libnice_0.0.13.bb:PNBLACKLIST[libnice]
> ?= "Depends on blacklisted gstreamer"
> meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=
> "does not build with distroless qemuarm as reported in 'State of bitbake
> world' thread, nobody volunteered to fix them"
> meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=
> "Not compatible with gnutls version 3.4 currently in oe-core"
> meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb:PNBLACKLIST[ipmiutil]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130641/"
> meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi-drivers]
> ?= "BROKEN: fails to build with gcc-5"
> meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan]
> ?= "Not compatible with gnutls version 3.4 currently in oe-core"
> meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb:PNBLACKLIST[libsdl-ttf]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130598/"
> meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb:PNBLACKLIST[libsdl2-ttf]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130656/"
> meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb:PNBLACKLIST[lmsensors]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/131629/"
> meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb:
> PNBLACKLIST[multipath-tools] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130529/"
> meta-oe/recipes-support/ode/ode_0.13.bb:PNBLACKLIST[ode] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/130599/"
> meta-oe/recipes-support/ode/ode_0.13.bb:PNBLACKLIST[ode] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/130620/"
> meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb:PNBLACKLIST[open-vcdiff]
> ?gin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] ?= "depends on
> blacklisted pidgin"
> meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb:PNBLACKLIST[pidgin] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130634/"
> meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb:PNBLACKLIST[postgresql]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/131632/"
> meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb:PNBLACKLIST[psqlodbc]
> ?= "Depends on blacklisted postgresql"
> meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb:PNBLACKLIST[syslog-ng]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130631/"
> meta-oe/recipes-support/system-config-keyboard/system-
> config-keyboard_1.4.0.bb:PNBLACKLIST[system-config-keyboard] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/132829/"
> meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb:
> PNBLACKLIST[usb-modeswitch-data] ?= "Runtime depends on blacklisted
> usb-modeswitch"
> meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb:
> PNBLACKLIST[usb-modeswitch-data] ?= "Runtime depends on blacklisted
> usb-modeswitch-data"
> meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb:
> PNBLACKLIST[usb-modeswitch] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130620/"
> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal]
> ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No
> such file or directory"
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb:PNBLACKLIST[vboxguestdrivers]
> ?= "BROKEN: not compatible with default kernel version 4.8"
> meta-oe/recipes-support/xchat/xchat_2.8.8.bb:PNBLACKLIST[xchat] ?=
> "Depends on blacklisted libsexy"
> meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb:PNBLACKLIST[xdg-user-dirs]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130635/"
> meta-python/recipes-connectivity/gateone/gateone_git.bb:PNBLACKLIST[gateone]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130642/"
> meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb:
> PNBLACKLIST[python-cryptography-vectors] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130664/"
> meta-python/recipes-devtools/python/python-pbr_1.10.0.bb:PNBLACKLIST[python-pbr]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130650/"
> meta-python/recipes-devtools/python/python3-cryptography-vectors_1.6.bb:
> PNBLACKLIST[python3-cryptography-vectors] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130626/"
> meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb:
> PNBLACKLIST[python3-ndg-httpsclient] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130615/"
> meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb:PNBLACKLIST[python3-pymisp]
> ?= "Runtime depends on blacklisted python3-pymisp"
> meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb:PNBLACKLIST[python3-pymisp]
> ?= "Runtime depends on blacklisted python3-pymisp-dev"
> meta-python/recipes-devtools/python/python3-requests_2.13.0.bb:
> PNBLACKLIST[python3-requests] ?= "Runtime depends on blacklisted
> python3-ndg-httpsclient"
> meta-python/recipes-devtools/python/python3-requests_2.13.0.bb:
> PNBLACKLIST[python3-requests] ?= "Runtime depends on blacklisted
> python3-requests-dev"
> meta-ruby/recipes-devtools/ruby/bundler_git.bb:PNBLACKLIST[bundler] ?=
> "Fails to build with RSS http://errors.yoctoprojecds on blacklisted
> tumbler"
> meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb:PNBLACKLIST[ristretto]
> ?= "Runtime depends on blacklisted ristretto-dev"
> meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb:PNBLACKLIST[ristretto]
> ?= "Runtime depends on blacklisted ristretto"
> meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb:PNBLACKLIST[xfce4-mixer]
> ?= "Depends on blacklisted gst-plugins-base"
> meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb:PNBLACKLIST[openzone]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130682/"
> meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb:PNBLACKLIST[imsettings]
> ?= "Depends on blacklisted libgxim"
> meta-xfce/recipes-multimedia/packagegroups/packagegroup-
> xfce-multimedia.bb:PNBLACKLIST[packagegroup-xfce-multimedia] ?= "Runtime
> depends on blacklisted xfce4-mpc-plugin"
> meta-xfce/recipes-multimedia/packagegroups/packagegroup-
> xfce-multimedia.bb:PNBLACKLIST[packagegroup-xfce-multimedia] ?= "Runtime
> depends on blacklisted packagegroup-xfce-multimedia"
> meta-xfce/recipes-multimedia/packagegroups/packagegroup-
> xfce-multimedia.bb:PNBLACKLIST[packagegroup-xfce-multimedia] ?= "Runtime
> depends on blacklisted xfmpc"
> meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb:
> PNBLACKLIST[xfce4-mpc-plugin] ?= "Runtime depends on blacklisted mpd"
> meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb:
> PNBLACKLIST[xfce4-mpc-plugin] ?= "Runtime depends on blacklisted
> xfce4-mpc-plugin"
> meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb:
> PNBLACKLIST[xfce4-mpc-plugin] ?= "Runtime depends on blacklisted
> xfce4-mpc-plugin-dev"
> meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb:PNBLACKLIST[xfmpc] ?=
> "Runtime depends on blacklisted mpd"
> meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb:PNBLACKLIST[xfmpc] ?=
> "Runtime depends on blacklisted xfmpc-dev"
> meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb:PNBLACKLIST[xfmpc] ?=
> "Runtime depends on blacklisted xfmpc"
> meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.6.bb:
> PNBLACKLIST[xfce4-sensors-plugin] ?= "Depends on blacklisted lmsensors"
> meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb:
> PNBLACKLIST[xfce4-verve-plugin] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130622/"
> meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-
> whiskermenu-plugin_2.0.3.bb:PNBLACKLIST[xfce4-whiskermenu-plugin] ?=
> "Runtime depends on blacklisted menulibre"
> meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb:
> PNBLACKLIST[packagegroup-xfce-extended] ?= "Runtime depends on
> blacklisted xfce4-mixer"
> meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb:
> PNBLACKLIST[packagegroup-xfce-extended] ?= "Runtime depends on
> blacklisted xfce4-verve-plugin"
> meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb:
> PNBLACKLIST[packagegroup-xfce-extended] ?= "Runtime depends on
> blacklisted ristretto"
> meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb:PNBLACKLIST[tumbler] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/132828/"
> meta-qt5:
> meta-smartphone:
> meta-fso/recipes-freesmartphone/cornucopia/fso-apm_git.bb:PNBLACKLIST[fso-apm]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsoaudiod_0.12.0.bb:PNBLACKLIST[fsoaudiod]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsoaudiod_git.bb:PNBLACKLIST[fsoaudiod]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsodatad_0.12.0.bb:PNBLACKLIST[fsodatad]
> ?= "Depends on blands on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsonetworkd_0.12.0.bb:PNBLACKLIST[fsonetworkd]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsonetworkd_git.bb:PNBLACKLIST[fsonetworkd]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsoraw_git.bb:PNBLACKLIST[fsoraw]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsotdld_0.12.0.bb:PNBLACKLIST[fsotdld]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsotdld_git.bb:PNBLACKLIST[fsotdld]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsousaged_0.12.0.bb:PNBLACKLIST[fsousaged]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsousaged_git.bb:PNBLACKLIST[fsousaged]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/libfsoframework_0.12.0.bb:PNBLACKLIST[libfsoframework]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/libfsoframework_git.bb:PNBLACKLIST[libfsoframework]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/mkdump_git.bb:PNBLACKLIST[mkdump]
> ?= "Depends on blacklisted libfsoframework"
> meta-fso/recipes-freesmartphone/cornucopia/mterm2_git.bb:PNBLACKLIST[mterm2]
> ?= "Depends on blacklisted libfsoframework"
> meta-fso/recipes-freesmartphone/freesmartphone/frameworkd_0.10.1.bb:
> PNBLACKLIST[frameworkd] ?= "Runtime depends on blacklisted fsousaged"
> meta-fso/recipes-freesmartphone/freesmartphone/frameworkd_git.bb:
> PNBLACKLIST[frameworkd] ?= "Runtime depends on blacklisted fsousaged"
> meta-fso/recipes-freesmartphone/freesmartphone/frameworkd_git.bb:
> PNBLACKLIST[frameworkd] ?= "Runtime depends on blacklisted frameworkd-dev"
> meta-fso/recipes-freesmartphone/freesmartphone/fso-gpsd_git.bb:
> PNBLACKLIST[fso-gpsd] ?= "Runtime depends on blacklisted fso-gpsd-dev"
> meta-fso/recipes-freesmartphone/freesmartphone/fso-gsm0710muxd_git.bb:
> PNBLACKLIST[fso-gsm0710muxd] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130517/"
> meta-fso/recipes-freesmartphone/freesmartphone/libframeworkd-glib_git.bb:
> PNBLACKLIST[libframeworkd-glib] ?= "BROKEN: many errors when building
> with gcc-6"
> meta-fso/recipes-freesmartphone/freesmartphone/
> libfso-glib_2012.07.27.2.bb:PNBLACKLIST[libfso-glib] ?= "Depends on
> blacklisted vala-dbus-binding-tool"
> meta-fso/recipes-freesmartphone/freesmartphone/libfso-glib_git.bb:
> PNBLACKLIST[libfso-glib] ?= "Depends on blacklisted
> vala-dbus-binding-tool"
> meta-fso/recipes-freesmartphone/freesmartphone/mickeyterm_git.bb:
> PNBLACKLIST[mickeyterm] ?= "Runtime depends on blacklisted
> fso-gsm0710muxd"
> meta-fso/recipes-freesmartphone/freesmartphone/opimd-utils_git.bb:
> PNBLACKLIST[opimd-utils] ?= "Runtime depends on blacklisted ffphonelog"
> meta-fso/recipes-freesmartphone/freesmartphone/zhone_git.bb:PNBLACKLIST[zhone]
> ?= "rdepends on python-pycairo which was removed"
> meta-fso/recipes-freesmartphone/packagegroups/
> packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
> ?= "Runtime depends on blacklisted fsoaudiod-config"
> meta-fso/recipes-freesmartphone/packagegroups/
> packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
> ?= "Runtime depends on blacklisted mkdump"
> meta-fso/recipes-freesmartphone/packagegroups/
> packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
> ?= "Runtime depends on blacklisted fsonetworkd"
> meta-fso/recipes-freesmartphone/packagegroups/
> packagegroup-fso2-compliance.bb:PNBLACs on blacklisted fsogsmd"
> meta-fso/recipes-freesmartphone/packagegroups/
> packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
> ?= "Runtime depends on blacklisted mterm2"
> meta-fso/recipes-freesmartphone/packagegroups/
> packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
> ?= "Runtime depends on blacklisted fsodeviced"
> meta-fso/recipes-freesmartphone/packagegroups/
> packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
> ?= "Runtime depends on blacklisted fsotdld"
> meta-fso/recipes-freesmartphone/packagegroups/
> packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
> ?= "Runtime depends on blacklisted fsousaged"
> meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advancedcaching]
> ?= "RDEPENDS on python-pygtk was removed from oe-core"
> meta-shr/recipes-shr/3rdparty/atd-over-fso_0.70.bb:PNBLACKLIST[atd-over-fso]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130540/"
> meta-shr/recipes-shr/3rdparty/atrack_svn.bb:PNBLACKLIST[atrack] ?=
> "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/babiloo-efl_2.0.9-10.bb:PNBLACKLIST[babiloo-efl]
> ?= "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/babiloo-efl_bzr.bb:PNBLACKLIST[babiloo-efl]
> ?= "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/babiloo-efl_bzr.bb:PNBLACKLIST[babiloo-efl]
> ?= "Runtime depends on blacklisted babiloo-efl"
> meta-shr/recipes-shr/3rdparty/babiloo-efl_bzr.bb:PNBLACKLIST[babiloo-efl]
> ?= "Runtime depends on blacklisted babiloo-efl-dev"
> meta-shr/recipes-shr/3rdparty/chroneo_svn.bb:PNBLACKLIST[chroneo] ?=
> "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/ecalc_git.bb:PNBLACKLIST[ecalc] ?= "Runtime
> depends on blacklisted python-edbus"
> meta-shr/recipes-shr/3rdparty/ecalc_git.bb:PNBLACKLIST[ecalc] ?= "Runtime
> depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/estardict_0.7.bb:PNBLACKLIST[estardict] ?=
> "Depends on blacklisted elementary"
> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =
> "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/ffphonelog_git.bb:PNBLACKLIST[ffphonelog]
> ?= "Depends on blacklisted libeflvala"
> meta-shr/recipes-shr/3rdparty/guitartune_svn.bb:PNBLACKLIST[guitartune]
> ?= "Depends on blacklisted libglade"
> meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=
> "broken: depends on blacklisted fltk"
> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] = "Doesn't
> build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =
> "rdepends on blacklisted mplayer2"
> meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=
> "depends on blacklisted iksemel"
> meta-shr/recipes-shr/3rdparty/minneo_svn.bb:PNBLACKLIST[minneo] ?=
> "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/mokojeweled_git.bb:PNBLACKLIST[mokojeweled]
> ?= "Depends on blacklisted elementary"
> meta-shr/recipes-shr/3rdparty/neolight_svn.bb:PNBLACKLIST[neolight] ?=
> "Runtime depends on blacklisted python-edbus"
> meta-shr/recipes-shr/3rdparty/neolight_svn.bb:PNBLACKLIST[neolight] ?=
> "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/neomis_svn.bb:PNBLACKLIST[neomi depends on
> blacklisted om-neon"
> meta-shr/recipes-shr/3rdparty/omext_0.2.bb:PNBLACKLIST[omext] ?= "Fails
> to build with RSS http://errors.yoctoproject.org/Errors/Details/130539/"
> meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb:PNBLACKLIST[openmoko-gps]
> ?= "RDEPENDS on python-pygtk which was removed from oe-core"
> meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=
> "RDEPENDS on python-pygtk which was removed from oe-core"
> meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/rtmom_0.1.3.bb:PNBLACKLIST[rtmom] ?=
> "Depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =
> "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/spojegui_svn.bb:PNBLACKLIST[spojegui] ?=
> "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/vagalume_0.8.5.bb:PNBLACKLIST[vagalume] ?=
> "Depends on blacklisted gstreamer"
> meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass]
> = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/games/aceofpenguins_1.4.bb:PNBLACKLIST[aceofpenguins]
> ?= "BROKEN: fails to build with new binutils-2.27"
> meta-shr/recipes-shr/games/mokomaze_0.5.5.bb:PNBLACKLIST[mokomaze] ?=
> "Depends on blacklisted libsdl-ttf"
> meta-shr/recipes-shr/games/mokomaze_0.5.5.bb:PNBLACKLIST[mokomaze] ?=
> "Depends on blacklisted ode"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted mokomaze"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted dates"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted dbus-daemon-proxy"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted guitartune"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted illume-keyboard-default-numeric"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted e-tasks"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted enjoy"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted mokojeweled"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted estardict"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted gpe-scap"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted ffphonelog"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted om-neon"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted elfe"
> meta-shr/recipes-shpends on blacklisted libphone-ui-shr"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-minimal.bb:
> PNBLACKLIST[packagegroup-shr-minimal] ?= "Runtime depends on blacklisted
> ffphonelog"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packagegroup-shr]
> ?= "Runtime depends on blacklisted packagegroup-cli-tools-debug"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packagegroup-shr]
> ?= "Runtime depends on blacklisted packagegroup-shr-minimal-cli"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packagegroup-shr]
> ?= "Runtime depends on blacklisted packagegroup-cli-tools"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packagegroup-shr]
> ?= "Runtime depends on blacklisted packagegroup-shr-minimal-apps"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packagegroup-shr]
> ?= "Runtime depends on blacklisted vagalume"
> meta-shr/recipes-shr/shr/e-wm-config-illume2-shr_git.bb:PNBL
> ACKLIST[e-wm-config-illume2-shr] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130520/"
> meta-shr/recipes-shr/shr/libphone-ui-shr_git.bb:PNBLACKLIST[libphone-ui-shr]
> ?= "Depends on blacklisted elementary"
> meta-shr/recipes-shr/shr/libphone-ui_git.bb:PNBLACKLIST[libphone-ui] ?=
> "Depends on blacklisted libfso-glib"
> meta-shr/recipes-shr/shr/phonefsod_git.bb:PNBLACKLIST[phonefsod] ?=
> "Depends on blacklisted libfso-glib"
> meta-shr/recipes-shr/shr/phoneuid_git.bb:PNBLACKLIST[phoneuid] ?=
> "Depends on blacklisted libfso-glib"
> meta-shr/recipes-shr/shr/shr-e-gadgets_git.bb:PNBLACKLIST[shr-e-gadgets]
> ?= "Depends on blacklisted elementary"
> meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer]
> ?= "Depends on blacklisted packagekit"
> meta-shr/recipes-shr/shr/shr-settings_git.bb:PNBLACKLIST[shr-settings] ?=
> "Runtime depends on blacklisted python-edbus"
> meta-shr/recipes-shr/shr/shr-settings_git.bb:PNBLACKLIST[shr-settings] ?=
> "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/shr/shr-wizard_git.bb:PNBLACKLIST[shr-wizard] ?=
> "Depends on blacklisted e-wm"
> meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git.bb:PNB
> LACKLIST[e-wm-theme-illume-neo] ?= "Runtime depends on blacklisted e-wm"
> meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git.bb:PNB
> LACKLIST[e-wm-theme-illume-neo] ?= "Runtime depends on blacklisted
> e-wm-theme-illume-neo-dev"
> meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git.bb:PNB
> LACKLIST[e-wm-theme-illume-neo] ?= "Runtime depends on blacklisted
> e-wm-theme-illume-neo"
> meta-shr/recipes-shr/themes/gtk-theme-clearlooks-gtkrc.bb:
> PNBLACKLIST[gtk-theme-clearlooks-gtkrc] ?= "Runtime depends on
> blacklisted gtk-theme-clearlooks"
> meta-shr/recipes-shr/themes/gtk-theme-clearlooks-gtkrc.bb:
> PNBLACKLIST[gtk-theme-clearlooks-gtkrc] ?= "Runtime depends on
> blacklisted gtk-theme-clearlooks-gtkrc-dev"
> meta-shr/recipes-shr/themes/icon-theme-neo_git.bb:PNBLACKLIST[icon-theme-neo]
> ?= "Runtime depends on blacklisted e-wm"
> meta-shr/recipes-shr/themes/icon-theme-neo_git.bb:PNBLACKLIST[icon-theme-neo]
> ?= "Runtime depends on blacklisted icon-theme-neo-dev"
> meta-shr/recipes-shr/themes/phoneui-shr-theme-neo_git.bb:P
> NBLACKLIST[phoneui-shr-theme-neo] ?= "Runtime depends on blacklisted
> libphone-ui-shr"
> meta-shr/recipes-shr/themes/phoneui-shr-theme-neo_git.bb:P
> NBLACKLIST[phoneui-shr-theme-neo] ?= "Runtime depends on blacklisted
> phoneui-shr-theme-neo-dev"
> meta-shr/recipes-shr/themes/phoneui-shr-theme-niebiee_git.
> bb:PNBLACKLIST[phoneui-shr-theme-niebiee] ?= "Runtime depends on
> blacklisted libphone-ui-shr"
> meta-shr/recipes-shr/themes/phoneui-LIST[shr-theme-niebiee] ?= "Runtime
> depends on blacklisted phoneui-shr-theme-niebiee"
> meta-shr/recipes-shr/themes/shr-theme-niebiee.bb:PNBLACKLIST[shr-theme-niebiee]
> ?= "Runtime depends on blacklisted shr-theme-niebiee"
> meta-shr/recipes-shr/themes/shr-theme-niebiee.bb:PNBLACKLIST[shr-theme-niebiee]
> ?= "Runtime depends on blacklisted shr-theme-niebiee-dev"
> meta-shr/recipes-shr/themes/shr-theme-o2.bb:PNBLACKLIST[shr-theme-o2] ?=
> "Runtime depends on blacklisted phoneui-shr-theme-o2"
> meta-shr/recipes-shr/themes/shr-theme-o2.bb:PNBLACKLIST[shr-theme-o2] ?=
> "Runtime depends on blacklisted shr-theme-o2"
> meta-shr/recipes-shr/themes/shr-theme-o2.bb:PNBLACKLIST[shr-theme-o2] ?=
> "Runtime depends on blacklisted shr-theme-o2-dev"
> meta-webos-ports:
> meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:
> PNBLACKLIST[luna-webappmanager] ?= "BROKEN: needs to be adapted to new
> qt-5.7"
> meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next]
> ?= "BROKEN: needs to be adapted to new qtwayland-5.7"
> PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation
> which isn't included in my world builds"
> PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
> directory in /home/builder/poky :/"
> PNBLACKLIST[linux-yocto-tiny-kexecboot] = "does weird sh!t breaking other
> kernels and modules - broken for years"
> PNBLACKLIST[linux-yocto-tiny] = "does weird sh!t breaking other kernels
> and modules - broken for years"
>
>
> QA issues by type:
> count: 0        issue: already-stripped
>
>
> count: 0        issue: libdir
>
>
> count: 0        issue: textrel
>
>
> count: 0        issue: build-deps
>
>
> count: 0        issue: file-rdeps
>
> count: 680      issue: version-going-backwards
> audiofile-0.3.6: Package version for package audiofile-bin went backwards
> which would break package feeds from (0:0.3.6-r0.4 to 0:0.3.6-r0.0)
> [version-going-backwards]
> audiofile-0.3.6: Package version for package audiofile-bin went backwards
> which would break package feeds from (0:0.3.6-r0.5 to 0:0.3.6-r0.0)
> [version-going-backwards]
> audiofile-0.3.6: Package version for package audiofile-dbg went backwards
> which would break package feeds from (0:0.3.6-r0.4 to 0:0.3.6-r0.0)
> [version-going-backwards]
> audiofile-0.3.6: Package version for package audiofile-dbg went backwards
> which would break package feeds from (0:0.3.6-r0.5 to 0:0.3.6-r0.0)
> [version-going-backwards]
> audiofile-0.3.6: Package version for package audiofile-dev went backwards
> which would break package feeds from (0:0.3.6-r0.4 to 0:0.3.6-r0.0)
> [version-going-backwards]
> audiofile-0.3.6: Package version for package audiofile-dev went backwards
> which would break package feeds from (0:0.3.6-r0.5 to 0:0.3.6-r0.0)
> [version-going-backwards]
> audiofile-0.3.6: Package version for package audiofile-doc went backwards
> which would break package feeds from (0:0.3.6-r0.4 to 0:0.3.6-r0.0)
> [version-going-backwards]
> audiofile-0.3.6: Package version for package audiofile-doc went backwards
> which would break package feeds from (0:0.3.6-r0.5 to 0:0.3.6-r0.0)
> [version-going-backwards]
> audiofile-0.3.6: Package version for package audiofile-locale went
> backwards which would break package feeds from (0:0.3.6-r0.4 to
> 0:0.3.6-r0.0) [version-g0:0.3.6-r0.5 to 0:0.3.6-r0.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package dates-dbg
> went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package dates-dbg
> went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package dates-dev
> went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package dates-dev
> went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package dates-doc
> went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package dates-doc
> went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-ca went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-ca went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-cs went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-cs went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-da went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-da went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-de went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-de went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-en-gb went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-en-gb went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0) )
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-eu went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-eu went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-fi went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-fi went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-fr went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-fr went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-gl went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-gl went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-hu went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-hu went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-id went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-id went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-it went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-it went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-ja went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-ja went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0kage
> version for package dates-locale-nl went backwards which would break
> package feeds from (0:0.4.11+git0+514185dc1f-r9.55 to
> 0:0.4.11+git0+514185dc1f-r9.0) [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-nl went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-pa went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-pa went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-pl went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-pl went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-pt-br went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-pt-br went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-ru went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-ru went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-sl went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-sl went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-sv went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-sv went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-th went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-th went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1reak package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-staticdev went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-staticdev went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package dates
> went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package dates
> went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-dbg went backwards
> which would break package feeds from (2:0.1.0+svnr82070-r0.47 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-dbg went backwards
> which would break package feeds from (2:0.1.0+svnr82070-r0.57 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-dev went backwards
> which would break package feeds from (2:0.1.0+svnr82070-r0.47 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-dev went backwards
> which would break package feeds from (2:0.1.0+svnr82070-r0.57 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-doc went backwards
> which would break package feeds from (2:0.1.0+svnr82070-r0.47 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-doc went backwards
> which would break package feeds from (2:0.1.0+svnr82070-r0.57 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-eolian went
> backwards which would break package feeds from (2:0.1.0+svnr82070-r0.47 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-eolian went
> backwards which would break package feeds from (2:0.1.0+svnr82070-r0.57 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-locale went
> backwards which would break package feeds from (2:0.1.0+svnr82070-r0.47 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-locale went
> backwards which would break package feeds from (2:0.1.0+svnr82070-r0.57 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-staticdev went
> backwards which would break package feeds from (2:0.1.0+svnr82070-r0.47 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-staticdev went
> backwards which would break package feeds from (2:0.1.0+svnr82070-r0.57 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-tests went
> backwards which would break package feeds from (2:0.1.0+svnr82070-r0.47 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-tests went
> backwards which would break package feeds fh would break package feeds from
> (0:0.2.36-r1.58 to 0:0.2.36-r1.0) [version-going-backwards]
> esound-0.2.36: Package version for package esd-utils went backwards which
> would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esd-utils went backwards which
> would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esd went backwards which would
> break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esd went backwards which would
> break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-dbg went backwards which
> would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-dbg went backwards which
> would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-dev went backwards which
> would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-dev went backwards which
> would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-doc went backwards which
> would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-doc went backwards which
> would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-locale went backwards
> which would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-locale went backwards
> which would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-staticdev went backwards
> which would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-staticdev went backwards
> which would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound went backwards which
> would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound went backwards which
> would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-browser-plugin went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-browser-plugin went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-dbg went backwards which
> would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-dbg went backwards which
> would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-dev went backwards which
> would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-ds]
> evince-3.18.2: Package version for package evince-locale-an went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-an went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ar went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ar went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ast went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ast went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-as went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-as went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-be+latin went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-be+latin went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-be went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-be went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-bg went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-bg went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-bn-in went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-bn-in went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-bn went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-bn went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-br went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-br went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-bs went backwards
> which would break package feeds from (0:3.18. would break package feeds
> from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-cs went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-cy went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-cy went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-da went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-da went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-de went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-de went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-dz went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-dz went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-el went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-el went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-en-ca went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-en-ca went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-en-gb went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-en-gb went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-en+shaw went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-en+shaw went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-eo went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-eo went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-es went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package versionckage evince-locale-fa went backwards which
> would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-fi went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-fi went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-fr went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-fr went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-fur went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-fur went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ga went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ga went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-gd went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-gd went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-gl went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-gl went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-gu went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-gu went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-he went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-he went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-hi went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-hi went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-hu went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-hu went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-ckwards]
> evince-3.18.2: Package version for package evince-locale-it went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ja went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ja went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ka went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ka went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-kk went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-kk went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-km went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-km went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-kn went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-kn went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ko went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ko went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ks went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ks went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ku went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ku went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-lt went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-lt went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-lv went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-lv went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ml went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ml went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-mn went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-mn went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-mr went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-mr went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ms went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ms went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-my went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-my went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-nb went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-nb went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-nds went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-nds went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ne went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ne went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-nl went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-nl went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-nn went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-nn went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-oc went backwards
> which would break pa18.2-r5.65 to 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-pl went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-pl went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ps went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ps went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-pt-br went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-pt-br went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-pt went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-pt went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ro went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ro went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ru went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ru went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-rw went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-rw went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-si went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-si went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-sk went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-sk went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-sl went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-sl went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-sq went backwards
> which wokwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-sv went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ta went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ta went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-te went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-te went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-tg went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-tg went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-th went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-th went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-tr went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-tr went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ug went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ug went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-uk went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-uk went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-vi went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-vi went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-wa went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-wa went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-zh-cn went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for pauld break package feeds from
> (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-zu went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-nautilus-extension went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-nautilus-extension went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-staticdev went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-staticdev went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince went backwards which
> would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince went backwards which
> would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-dbg went backwards which would break package
> feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-dbg went backwards which would break package
> feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-dev went backwards which would break package
> feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-dev went backwards which would break package
> feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-doc went backwards which would break package
> feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-doc went backwards which would break package
> feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-am went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-am went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ar went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: POINC+a9e4e74ec4:
> Package version for package evolution-data-server-locale-as went
> backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-as went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-az went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-az went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-be went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-be went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-bg went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-bg went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-bn-in went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-bn-in went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-bn went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-bn went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-bs went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-bs went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version
> for.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ca went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-cs went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-cs went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-cy went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-cy went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-da went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-da went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-de went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-de went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-dz went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-dz went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-el went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-el went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-en-au went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-goingversion-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-en-gb went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-en-gb went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-en+shaw went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-en+shaw went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-eo went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-eo went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-es went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-es went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-et went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-et went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-eu went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-eu went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-fa went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-fa went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> ec4: Package version for package evolution-data-server-locale-fr went
> backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ga went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ga went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-gl went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-gl went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-gu went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-gu went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-he went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-he went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-hi went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-hi went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-hr went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-hr went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-hu went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-le-is went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-is went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-it went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-it went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ja went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ja went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ka went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ka went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-kn went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-kn went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ko went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ko went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ku went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ku went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-lt went backwards which would break
> pac for package evolution-data-server-locale-lv went backwards which
> would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-mai went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-mai went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-mk went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-mk went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ml went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ml went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-mn went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-mn went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-mr went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-mr went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ms went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ms went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-nb went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-local4ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-nl went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-nn went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-nn went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-oc went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-oc went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-or went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-or went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-pa went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-pa went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-pl went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-pl went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-pt-br went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-pt-br went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-pt went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ecata-server-locale-ro went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ru went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ru went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-rw went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-rw went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-si went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-si went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sk went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sk went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sl went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sl went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sq went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sq went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sr+latin went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sr+latin went back74ec4: Package
> version for package evolution-data-server-locale-sv went backwards which
> would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sv went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ta went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ta went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-te went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-te went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-th went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-th went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-tr went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-tr went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ug went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ug went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-uk went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-uk went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolutiage version for package evolution-data-server-locale-wa
> went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-xh went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-xh went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-zh-cn went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-zh-cn went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-zh-hk went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-zh-hk went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-zh-tw went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-zh-tw went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-staticdev went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-staticdev went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server went backwards which would break package
> feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server went backwards which would break package
> feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libcamel-dev went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libcamel-dev went backwards which woulda9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libebook-dev went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libebook went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libebook went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libecal-dev went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libecal-dev went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libecal went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libecal went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedata-book-dev went backwards which would break package feeds
> from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedata-book-dev went backwards which would break package feeds
> from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedata-book went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedata-book went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedata-cal-dev went backwards which would break package feeds
> from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedata-cal-dev went backwards which would break package feeds
> from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedata-cal went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedata-cal went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+git-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedataserverui-dev went backwards which would break package feeds
> from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedataserverui went backwards which would break package feeds
> from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedataserverui went backwards which would break package feeds
> from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedataserver went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedataserver went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-dbg went backwards
> which would break package feeds from (0:1.9.6-r0.26 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-dbg went backwards
> which would break package feeds from (0:1.9.6-r0.29 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-dev went backwards
> which would break package feeds from (0:1.9.6-r0.26 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-dev went backwards
> which would break package feeds from (0:1.9.6-r0.29 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-doc went backwards
> which would break package feeds from (0:1.9.6-r0.26 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-doc went backwards
> which would break package feeds from (0:1.9.6-r0.29 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-locale went backwards
> which would break package feeds from (0:1.9.6-r0.26 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-locale went backwards
> which would break package feeds from (0:1.9.6-r0.29 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-staticdev went
> backwards which would break package feeds from (0:1.9.6-r0.26 to
> 0:1.9.6-r0.0) [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-staticdev went
> backwards which would break package feeds from (0:1.9.6-r0.29 to
> 0:1.9.6-r0.0) [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo went backwards which
> would break package feeds from (0:1.9.6-r0.26 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo went backwards which
> would break package feeds from (0:1.9.6-r0.29 to 0:1.9.6-r0.0)
> [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-dbg went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-dbg went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> opencon0.57 to 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-bs went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-bs went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-cs went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-cs went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-de went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-de went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-el went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-el went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-en-gb
> went backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-en-gb
> went backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-en-us
> went backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-en-us
> went backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-es went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-es went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-eu went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-eu went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-fi went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-fi went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-fr went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-fr went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> opencld break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0)
> [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-id went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-lt went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-lt went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-nl went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-nl went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-pa went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-pa went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-pl went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-pl went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-pt-br
> went backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-pt-br
> went backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-pt went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-pt went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-sk went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-sk went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-sl went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-sl went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-sr+latin
> went backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-sr+latin
> went backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-sr went
> backwards which would break package feeds from (0:7.06-r0.50 to 0feeds from
> (0:7.06-r0.57 to 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-uk went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-uk went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-zh-cn
> went backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-zh-cn
> went backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-zh-tw
> went backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-zh-tw
> went backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-staticdev went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-staticdev went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect went backwards
> which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0)
> [version-going-backwards]
> openconnect-7.06: Package version for package openconnect went backwards
> which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Package version for package
> openflow-dbg went backwards which would break package feeds from
> (0:1.0+git0+c84f33f09d-r0.48 to 0:1.0+git0+c84f33f09d-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Package version for package
> openflow-dbg went backwards which would break package feeds from
> (0:1.0+git0+c84f33f09d-r0.54 to 0:1.0+git0+c84f33f09d-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Package version for package
> openflow-dev went backwards which would break package feeds from
> (0:1.0+git0+c84f33f09d-r0.48 to 0:1.0+git0+c84f33f09d-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Package version for package
> openflow-dev went backwards which would break package feeds from
> (0:1.0+git0+c84f33f09d-r0.54 to 0:1.0+git0+c84f33f09d-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Package version for package
> openflow-doc went backwards which would break package feeds from
> (0:1.0+git0+c84f33f09d-r0.48 to 0:1.0+git0+c84f33f09d-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Package version for package
> openflow-doc went backwards which would break package feeds from
> (0:1.0+git0+c84f33f09d-r0.54 to 0:1.0+git0+c84f33f09d-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Package version for package
> openflow-locale went backwards which would break package feeds from
> (0:1.0+git0+c84f33f09d-r0.48 to 0:1.0+git0+c84f33f09d-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Package version for package
> openflow-locale went backwards which would break package feeds from
> (0:1.0+git0+c84f33f09d-r0.54 to 0:1.0+git0+c84f33f09d-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Pacpd-2.27.0: Package version for
> package sthttpd-dbg went backwards which would break package feeds from
> (0:2.27.0-r0.35 to 0:2.27.0-r0.0) [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-dbg went backwards
> which would break package feeds from (0:2.27.0-r0.40 to 0:2.27.0-r0.0)
> [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-dev went backwards
> which would break package feeds from (0:2.27.0-r0.35 to 0:2.27.0-r0.0)
> [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-dev went backwards
> which would break package feeds from (0:2.27.0-r0.40 to 0:2.27.0-r0.0)
> [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-doc went backwards
> which would break package feeds from (0:2.27.0-r0.35 to 0:2.27.0-r0.0)
> [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-doc went backwards
> which would break package feeds from (0:2.27.0-r0.40 to 0:2.27.0-r0.0)
> [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-locale went backwards
> which would break package feeds from (0:2.27.0-r0.35 to 0:2.27.0-r0.0)
> [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-locale went backwards
> which would break package feeds from (0:2.27.0-r0.40 to 0:2.27.0-r0.0)
> [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-staticdev went
> backwards which would break package feeds from (0:2.27.0-r0.35 to
> 0:2.27.0-r0.0) [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-staticdev went
> backwards which would break package feeds from (0:2.27.0-r0.40 to
> 0:2.27.0-r0.0) [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd went backwards which
> would break package feeds from (0:2.27.0-r0.35 to 0:2.27.0-r0.0)
> [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd went backwards which
> would break package feeds from (0:2.27.0-r0.40 to 0:2.27.0-r0.0)
> [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-dbg went
> backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-dev went
> backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-doc went
> backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ar
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ast
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-bg
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ca
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-cs
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-da
> went backwards which would break package feeds from version for package
> xfce4-notifyd-locale-es went backwards which would break package feeds from
> (0:0.3.4-r0.7 to 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-eu
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-fi
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-fr
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-gl
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-he
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-hr
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-hu
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-id
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-is
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-it
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ja
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-kk
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ko
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-lt
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-lv
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ms
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-nb
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-nl
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-oc
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0-0.3.4: Package version for package xfce4-notifyd-locale-ru
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-si
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-sk
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-sl
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-sq
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-sr
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-sv
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-th
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-tr
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ug
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-uk
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-vi
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package
> xfce4-notifyd-locale-zh-cn went backwards which would break package feeds
> from (0:0.3.4-r0.7 to 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package
> xfce4-notifyd-locale-zh-tw went backwards which would break package feeds
> from (0:0.3.4-r0.7 to 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-staticdev
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd went
> backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
>
> count: 0        issue: host-user-contaminated
>
>
> count: 0        issue: installed-vs-shipped
>
>
> count: 0        issue: unknown-configure-option
>
>
> count: 0        issue: symlink-to-sysroot
>
>
> count: 0        issue: invalid-pkgconfig
>
>
> count: 0        issue: pkgname
>
>
>
> == Tested changes (not included in master yet) - bitbake ==
> latest upstream commit:
> 95deeca bitbake: Update version to 1.33.1
> not included in master yet:
> 092fbe1 world-image: add extra target
>
> == Tested changes (not included in master yet) - openembedded-core ==
> latest upstream commit:
> d110937 nss: Fix nss-native so the checksum doesn't change with BUILD_ARCH
> not included in master yet:
> 9ba4e6b qemux86: Add identical qemux86copy variant for tests
> 8133fcb sstate-sysroot-cruft.sh: Extend the whitelist
> 000825b recipes: Replace "cp -a" with "cp -R --no-dereference
> --preserve=mode,links"
> 439c821 buildhistory.bbclass: metadata-revs show repo parent
> fbae6ba metadata-revs: provide more information
> 2a382e6 report-error: Allow to upload reports automatically
> 6484b5c flex: upgrade to 2.6.3
> f2f4b7a Revert "flex: upgrade to 2.6.3"
> 8594575 Revert "flex: upgrade to 2.6.2"
> 74a17cc core-image-tiny-initramfs: drop wic from IMAGE_FSTYPES
> 6154e0d libxslt: Add build fix (with ld-is-gold)
>
> == Tested changes (not included in master yet) - meta-openembedded ==
> latest upstream commit:
> 5ecbf9b poppler: update to 0.51.0
> not included in master yet:
> ab4369c kodi: Add krypton/17.0 recipe
> 99fce36 kodi: Fix build with pic on x86_64
> eb45dac kodi-17: Add packageconfig for lcms support
> 610e094 kodi-17: Fix build with musl
> bd28b29 kodi-17: Upgrade 17.0 release
> 54edcc5 kodi-17: Recommend python-ctpes for addons to work
> e5d5867 kodi-17: Fix build for qemuarm and update to latest
> 300d230 rsyslog: use atomic builtins to avoid race issue
> b9c6c88 fwts: upgrade to 17.01.00 release
> d77049f picocom: Fix build
> 370553b onboard: initial add 1.3.0
> 4a7fe83 nginx: update to version 1.11.8
> a239276 python-ipaddress: update to version 1.0.18
> b74c656 python-flask-bootstrap: update to version 3.3.7.1
> 585dd41 python-netaddr: update to version 0.7.19
> fcc4940 tremor: add (from oe-core)
> 5601936 xfce: add dbus-glib-native to DEPENDS to fix do_configure
> 18771a9 luajit: mips and mipsel are 32bit targets too
> 9fb591a libgphoto2: remove bash runtime dependency.
> 8241ef0 python-selectors34: add new recipe for version 1.1
> ebe26af python-serpent: add new recipe for version 1.16
> b7eb68c python-pyro4: update to version 4.53
> 7cada0a python-psutil: upgrade to version 5.0.1
> f091501 python-click: update to version 6.7
> 396efbc python-cffi: Fix build for per-recipe sysroot.
> 7e7fd56 python-ndg-httpsclient: Fix build for per recipe sysroot.
> 0db057d python-pyopenssl: Fix build for per recipe sysroot.
> d307c4f jack: add ARM NEON support for sample conversions
> e79566f nano: upgrade to 2.7.4
> ebef449 remove some more True options to getVar calls
> 960acf8 multipath-tools: fix building of shared objects
> bc34c97 multipath-tools: update to 0.6.4
> dc1d8fa opencv: Configure freetype via PACKAGECONFIG
> a0f5552 libnet-ssleay-perl: fix build error
> 47d1e27 python-cffi: Don't overwrite inherited dependencies
> b4acda8 python-pyopenssl: Don't overwrite inherited dependencies
> 63bdd4f python3-multidict: make repeated builds work even without sphinx
> e8d5a1b python-pyyaml: add dependency on python
> 91d4dd4 python-pytz: update to 2016.10
> f4559c4 gst-instruments: add recipe
> 0d80e47 vboxguestdrivers: upgrade to 5.1.14 to fix compatibility with 4.9
> kernel
> a975cd8 geoclue: add missing dependency on gobject-introspection-native
> 83b9dc3 typing: add version 3.5.3.0
> f7aaa34 m2crypto: depend on typing
> bab0cf6 udisks2: add libxslt-native to DEPENDS for xsltproc to be in
> sysroot
> db9b1ea python-idna: update to version 2.2
> fbda6b5 python-pybind11: Update to version 2.0.1
> 1c376ec python-pyudev: update to version 0.21.0
> cc255f9 python-cryptography-vectors: add to the DEPENDS rather than replace
> a8a0efe python-ndg-httpsclient: add to the DEPENDS rather than replace
> bda2d65 python-requests: update to version 2.13.0
> 131008e python-lxml: update to version 3.7.2
> 2c21e3b python-pytest: update version to 3.0.6
> 1d1a43b nginx: handle systemd service file
> 2ede2eb postgresgl: update to 9.4.10 and build fix
> 3527257 libatasmart: unify the complier and CFLAGS for host build
> 8a0667b ipmiutil: fix build issue
> 2b6cad9 iperf: remove depricated package
> a625494 python-pycrypto: add app to meta-python
> 7c0c45c lm_sensors: update SRC_URI
> 8731b65 udisks: add missing hard dependency
> 547c047 initramfs-kexecboot-image: disable runtime dependency on
> run-postinsts
> 8c03a06 linux-yocto-tiny-kexecboot: remove obsoleted recipe
> 2def6f6 lvm2: remove unbuildable 2.02.138
> f732d17 fuse: support native compilation
> 4071e6b lvm2: enable native compilation
> 2ef3979 cryptsetup: enable native compilation
> 338980d procmail: avoid bashism in do_install
> 85fac0e python-pbr: change the dependency to be a RDEPENDS and fix build
> issues
> 927657d gateone: correct the inherit to use setuptools
> 09d3d56 python-pyalsaaudio: update to version 0.8.2
> c0416d4 python-thrift: update to version 0.10.0
> 4d5e97e python-werkzeug: update to version 0.11.15
> 773200a python-sqlalchemy: update to version 1.1.5
> 3b1ea98 python-py: update to version 1.4.32
> dfbe6cf apache: use the APACHE_MIRROR variable in the SRC_URI
> 79c03f5 nginx: update to version 1.10.3
> 663f827 nginx: update to version 1.11.9
> 26e52a2 udisks: Make use of bitbake variables for sbin, lib locations.
> d614f8c dconf: depends on dbus
> f2b6681 dconf: fix bash completion in wrong package
> f93ea40 dconf: make gtk+3 dependency optional
> 63d64b8 libev: Add recipe for version 4.24
> 28528c4 libuv: Add recipe for version 1.10.2
> 7013979 libwebsockets: Add recipe for version 2.1.0
> f87a2b0 glibmm: add dependency on glib-2.0-native
> 93a44df exfat-utils: update SRC_URI
> 765ac51 audiofile: add alsa-lib to DEPENDS
> f35f4fb esound: fix build
> 928849a libglade: fix build and cleanup
> ca8ddbe poppler: add qttools-native to qt5 dependency to fix build
> 6f9b762 evolution-data-server: fix build
> 786d11d libgnomeui: fix build
> d34a32c gegl: fix build
> 6bb7f37 gedit: fix build
> ffd750f abiword: fix build
> f501f7a geany: fix build
> 7b62fe8 xfce4-notifyd: add dbus-glib-native to DEPENDS
> 38813ff sthttpd: add base-passwd to DEPENDS
> cfad4ba nostromo: add base-passwd to DEPENDS
> 92a1d82 gnome-disk-utility: add dbus-glib-native to DEPENDS
> b7f480c python-edbus exquisite elementary libeweather unionfs-fuse
> xfsprogs gmtk devilspie2 gnome-backgrounds gnome-desktop gnome-mime-data
> gtk-engines gtksourceview2 libgnomekbd libidl-native onboard libgpewidget
> ubi-utils-klibc kexec-tools-klibc gupnp-igd gupnp-tools dvb-apps gstreamer
> mpd crda netcat-openbsd wireshark gnokii libmbim mosh
> networkmanager-openvpn libtelepathy dbus-daemon-proxy libdbus-c++ php
> vala-dbus-binding-tool collectd libgxim pywbem gtkhtml2 fbida fontforge
> libsexy wayland-fits xstdcmap xf86-video-glamo font-adobe-100dpi
> font-adobe-utopia-100dpi font-bh-100dpi font-bh-lucidatypewriter-100dpi
> font-misc-misc crash a2jmidid libsdl2-mixer libsdl-mixer minidlna sylpheed
> libsdl2-ttf libsdl-ttf ode pidgin postgresql syslog-ng usb-modeswitch
> xdg-user-dirs gateone python3-cryptography-vectors python3-ndg-httpsclient
> python-cryptography-vectors python-pbr bundler netdata menulibre openzone
> xfce4-verve-plugin iperf terminus-font xf86-video-nouveau ipmiutil
> klibc-utils pmbw multipath-tools gparted, gnome-system-monitor, php,
> vala-dbus-binding-tool, gtkmathview, lmsensors, postgresql: Blacklist
> 00ba7da recipes: blacklist recipes depending on blacklisted recipes
> 7f3176f recipes: blacklist recipes runtime depending on blacklisted recipes
> af69342 opensaf: 5.0.0 -> 5.1.0
> 30667c6 lftp: update to 4.7.5 and change SRC_URI source
> ac3d39c tcpdump: upgrade to 4.8.1
> fcd51a9 iscsitarget: Fix call trace of ahash API calling
> 64ccdf5 relayd: derive PV from SRCPV
> a559daa dibbler: fix SRC_URI from ${P} to ${BP}
> c7cff14 iscsitarget: fix inconsistent crash while login to iscsi target
> from initiator
> f9dce8d iscsitarget: use upstream to build with linux kernel >= 4.3
> 67c4b8c iscsitarget: update patch to contain changes required to build
> with only linux v4.8 and above
> 94f3f50 wireshark: update package to 2.2.4
> e13378a inetutils: register hostname.1 man page as an alternate
> 5e9a6d6 lldpd: Update to version 0.9.6
> 698f000 wireshark: fix build issue
> dddbb4d libtdb: fix SRC_URI - http has gone
> 99ff1b5 libtevent: fix SRC_URI - http has gone
> 0a68a21 netkit-ruser: update SRC_URI
> 78a8125 ipsec-tools: change SRC_URI fetcher.
> d7b2bd1 tcpdump: update to 4.9.0 for security fixes
> 038f127 Samba: use built-in libtevent
> 3dbbd50 fetchmail: update SRC_URI
> 5a2ced7 libtalloc: fix SRC_URI to use https instead of http
> dc42430 openflow: inherit pkgconfig
> 78b4921 openconnect: add gettext-native to DEPENDS
> 304cd77 smbnetfs gnome-disk-utility contacts kexecboot geany geany-plugins
> efivar efibootmgr gimp system-config-keyboard tumbler: Blacklist
>
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> 8ba2814 qtwebkit: depends on gperf-native
> not included in master yet:
> efa8aaf qmake5_base.bbclass: set qt.conf by environment variable again
> 5acf4e1 populate_sdk_qt5: use _append operator
>
> == Tested changes (not included in master yet) - meta-browser ==
> latest upstream commit:
> dac70ab chromium: split patch 'Remove hard coded values for CC and CXX'
> not included in master yet:
> 7e31067 firefox*: add missing dependencies on zip-native and unzip-native
> 9808dd1 firefox-addon-webconverger: add also unzip-native dependency
> 2747754 chromium-wayland: fix compilation problem on non-X11 builds
> 15b61fd chromium, chromium-wayland: blacklist
>
> == Tested changes (not included in master yet) - meta-webos-ports ==
> latest upstream commit:
> b848230 luneos-package: inhibit default deps and limit do_deploy deps
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-smartphone ==
> latest upstream commit:
> a04ef72 android-system: restore mount for hal-droid
> not included in master yet:
> 4203314 libhybris: add dependency on wayland-native
> a95e27a fso-gsm0710muxd, atd-over-fso, omext, e-wm-config-illume2-shr:
> Blacklist
> f2dc1e1 recipes: blacklist recipes depending on blacklisted recipes
> 914596e recipes: blacklist recipes runtime depending on blacklisted recipes
>

