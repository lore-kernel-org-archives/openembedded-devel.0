Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE959C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 20:59:31 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.26771.1651352362808122855
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 13:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kYRoAZvz;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id iy15so7857135qvb.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 13:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kToQQ/sL3bs1nCPHl6ckP+qmNQUOjNIFlhTzclGCV2s=;
        b=kYRoAZvzq9wZafe20yraSGeiTlsKEgnwEQR7UBlyLvdxrLq/9hkm9VuhqZXvtvE6l9
         nu2F+iEZpDjxxn7bkPes7W61G9em8G7Nlu4d122QDt/yx0VGBv3GFD9yCFdL0ZEaDSQp
         v1OJUT9XTgIc1zYYsfYNnkcLiuaA0nn8vWm6uU3oLYr0X49DVpeIJq4woqVmLMW1E/3S
         /v4tkOe8TsXS49Tsy++50UL2PrKnLQpPeKz0HvnH6jgIXfLLojTkiu7L2tWl6bwTxvKS
         ZwL14Li9e6vMHbFAP0kFMpqF2ad2f05/erj4AL+UOIFYf7AaVdjRTnZjNsi4621z/6gr
         uxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kToQQ/sL3bs1nCPHl6ckP+qmNQUOjNIFlhTzclGCV2s=;
        b=CdqXCRx/pYefPai2hlOpSl/W418Uk2/imAuQjUS1r5MU9zvYhTc7svgutpYfJr/5aR
         t5e82SNYQ8nesI5J95/heJmPBQPKqf3sb47VQ91xknKVOusbWS6YRJ00y2gYgQ3sD+Ta
         45eBoaHsKm1C9p5jBbvj9yO8TRYZvwY6V22xNwSQmb7p0WCTsBh2CfMnG6VLfDvVpsC3
         JJixVJXdEfHb3+e69C02Jra9T8Gk2C6gYtcixx7B/wf1OK0PEIj0draRbdSjRo4Nh/o4
         jNvC+fNZJyQWapoLWfJqcX0Fipjm40CfTFgEImraa4LtmeWrGvnM9O/FlmzfBE0dy/rC
         GuLg==
X-Gm-Message-State: AOAM532uUV4MWE5W/r6ZFTSPJa0a01HFpUkn/uN8MamGyreNE445jsq9
	vUueZScuh0QsDp2WrYiQpiojYT0cBoAbEGt2K68=
X-Google-Smtp-Source: 
 ABdhPJyei2wkXJR3tfFP45Lue7G9+Dk4EcB0reqJYxSEpJJyNwqDQDvnefOy12bitmJtkrPVvF2cmbdUxaUvWqcJstg=
X-Received: by 2002:a0c:b2d3:0:b0:45a:8430:1735 with SMTP id
 d19-20020a0cb2d3000000b0045a84301735mr1258121qvf.110.1651352361776; Sat, 30
 Apr 2022 13:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651346200.git.akuster808@gmail.com>
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Apr 2022 13:58:55 -0700
Message-ID: 
 <CAMKF1sot=47n6c5JX5901kzynEMGGq-wbtjMsEgJ80eXqo-hMw@mail.gmail.com>
Subject: Re: [oe] [kirkstone 00/39] Patch review
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 20:59:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96907

lgtm

On Sat, Apr 30, 2022 at 12:18 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> Please have comments back my Tuesday
>
> The following changes since commit 7e05822fe85a77ea7e9fdfa61f300334ed76e294:
>
>   meta-openemnedded: Add myself as kirkstone maintainer (2022-04-23 06:50:42 -0700)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib stable/kirkstone-nut
>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/kirkstone-nut
>
> Carlos Rafael Giani (1):
>   pipewire: Upgrade to version 0.3.50
>
> Khem Raj (23):
>   crash: Fix build for mips target
>   tcsh: Do not install symlinks into /bin with usrmerge
>   arno-iptables-firewall: Do not use bitbake variable inside S
>   fluentbit: Fix build with usrmerge distro feature
>   tomoyo-tools: Define SBINDIR
>   tomoyo-tools: Drop md5sum
>   dietsplash: specify install rootdir
>   linux-atm: Add knob to root prefix
>   ufw: Fix build with usrmerge distro feature
>   klibc: Recognise --dyld-prefix clang option
>   mozjs: Use vendored icu on ppc/clang
>   boinc-client: Do not overwrite same file when using usrmerge
>   pam-ssh-agent-auth: Use specific versions of BSD licenses
>   fwupd: Enable build with musl
>   lirc: install systemd units only when using systemd distro feature
>   fluentbit: Disable systemd support when systemd distro feature is
>     disabled
>   gtksourceview5: Allow wayland or x11
>   gtkmm3: Allow wayland or x11 in distro features
>   gparted: Allow wayland or x11 distro features
>   lirc: Delete systemd unit files on non systemd distros
>   atkmm: Allow build with wayland
>   pangomm: Allow building with wayland
>   boinc-client: Make script install not depend on host install paths
>
> Mingli Yu (2):
>   crash: Upgrade to 8.0.0
>   makedumpfile: Upgrade to 1.7.1
>
> Robert Yang (1):
>   libldb: Fix installed-vs-shipped and rebuild error
>
> Willy Tu (1):
>   absil-cpp: Update SRC_URI to to the latest google internal sync
>
> wangmy (11):
>   evince: upgrade 42.1 -> 42.2
>   gspell: upgrade 1.9.1 -> 1.10.0
>   gtksourceview5: upgrade 5.4.0 -> 5.4.1
>   libadwaita: upgrade 1.1.0 -> 1.1.1
>   nautilus: upgrade 42.0 -> 42.1.1
>   htpdate: upgrade 1.3.3 -> 1.3.4
>   hexedit: upgrade 1.5 -> 1.6
>   lsscsi: upgrade 0.31 -> 0.32
>   libencode-perl: upgrade 3.16 -> 3.17
>   libextutils-cppguess-perl: upgrade 0.23 -> 0.26
>   libtest-harness-perl: upgrade 3.42 -> 3.44
>
>  .../recipes-extended/gparted/gparted_1.4.0.bb |  3 +-
>  .../evince/{evince_42.1.bb => evince_42.2.bb} |  2 +-
>  .../{gspell_1.9.1.bb => gspell_1.10.0.bb}     |  2 +-
>  ...view5_5.4.0.bb => gtksourceview5_5.4.1.bb} |  4 +-
>  ...ibadwaita_1.1.0.bb => libadwaita_1.1.1.bb} |  2 +-
>  .../{nautilus_42.0.bb => nautilus_42.1.1.bb}  |  2 +-
>  .../klcc-cross-accept-clang-options.patch     |  5 +-
>  ...-to-enable-disable-legacy-RTKit-modu.patch | 44 -----------
>  ...{pipewire_0.3.49.bb => pipewire_0.3.50.bb} |  6 +-
>  .../recipes-connectivity/ufw/ufw_0.36.1.bb    |  7 ++
>  .../arno-iptables-firewall_2.1.1.bb           |  2 +-
>  .../{htpdate_1.3.3.bb => htpdate_1.3.4.bb}    |  2 +-
>  .../recipes-support/libldb/libldb_2.3.3.bb    | 11 +++
>  .../linux-atm/0001-make-Add-PREFIX-knob.patch | 31 ++++++++
>  .../linux-atm/linux-atm_2.5.2.bb              |  7 +-
>  .../recipes-connectivity/lirc/lirc_0.10.1.bb  | 13 +--
>  meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb      |  2 -
>  .../lsscsi/{lsscsi_0.31.bb => lsscsi_0.32.bb} |  3 +-
>  .../abseil-cpp/abseil-ppc-fixes.patch         | 20 ++---
>  .../abseil-cpp/abseil-cpp_git.bb              |  4 +-
>  ...Do-not-check-for-files-on-build-host.patch | 52 ++++++++++++
>  .../boinc/boinc-client_7.18.1.bb              | 17 ++--
>  ...nit-install-location-with-SYSTEM_DIR.patch | 28 +++++++
>  .../cross-build-init-system-detection.patch   |  4 +-
>  .../fluentbit/fluentbit_1.3.5.bb              |  4 +-
>  .../{hexedit_1.5.bb => hexedit_1.6.bb}        |  2 +-
>  .../recipes-extended/mozjs/mozjs-91_91.8.0.bb |  2 +
>  .../pam/pam-ssh-agent-auth_0.10.3.bb          |  2 +-
>  .../recipes-gnome/atk/atkmm-2.36_2.36.1.bb    |  2 +-
>  meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb     |  2 +-
>  meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb   |  2 +-
>  .../dietsplash/dietsplash_git.bb              |  2 +-
>  .../recipes-graphics/pango/pangomm_2.46.2.bb  |  3 +-
>  ...error-unknown-type-name-gdb_fpregset.patch | 36 ---------
>  ...tect-the-sysroot-s-glibc-header-file.patch | 33 --------
>  ...unrecognized-gcc-option-m32-for-mips.patch | 33 --------
>  ...im-arange-fix-extern-inline-handling.patch | 79 -------------------
>  ...m-ppc-drop-LIBS-from-psim-dependency.patch | 37 ---------
>  .../crash/{crash_7.3.0.bb => crash_8.0.0.bb}  | 13 +--
>  ...makedumpfile-replace-hardcode-CFLAGS.patch | 53 ++++++-------
>  ...umpfile_1.7.0.bb => makedumpfile_1.7.1.bb} |  8 +-
>  .../tomoyo-tools/tomoyo-tools_2.5.0.bb        |  3 +-
>  meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb   |  6 +-
>  ...de-perl_3.16.bb => libencode-perl_3.17.bb} |  2 +-
>  ...3.bb => libextutils-cppguess-perl_0.26.bb} |  2 +-
>  ...l_3.42.bb => libtest-harness-perl_3.44.bb} |  5 +-
>  46 files changed, 231 insertions(+), 373 deletions(-)
>  rename meta-gnome/recipes-gnome/evince/{evince_42.1.bb => evince_42.2.bb} (92%)
>  rename meta-gnome/recipes-gnome/gspell/{gspell_1.9.1.bb => gspell_1.10.0.bb} (76%)
>  rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.4.0.bb => gtksourceview5_5.4.1.bb} (85%)
>  rename meta-gnome/recipes-gnome/libadwaita/{libadwaita_1.1.0.bb => libadwaita_1.1.1.bb} (86%)
>  rename meta-gnome/recipes-gnome/nautilus/{nautilus_42.0.bb => nautilus_42.1.1.bb} (92%)
>  delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/files/0001-meson-Add-option-to-enable-disable-legacy-RTKit-modu.patch
>  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.49.bb => pipewire_0.3.50.bb} (98%)
>  rename meta-networking/recipes-support/htpdate/{htpdate_1.3.3.bb => htpdate_1.3.4.bb} (92%)
>  create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-make-Add-PREFIX-knob.patch
>  rename meta-oe/recipes-bsp/lsscsi/{lsscsi_0.31.bb => lsscsi_0.32.bb} (70%)
>  create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/0001-scripts-Do-not-check-for-files-on-build-host.patch
>  create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch
>  rename meta-oe/recipes-extended/hexedit/{hexedit_1.5.bb => hexedit_1.6.bb} (90%)
>  delete mode 100644 meta-oe/recipes-kernel/crash/crash/0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch
>  delete mode 100644 meta-oe/recipes-kernel/crash/crash/0003-crash-detect-the-sysroot-s-glibc-header-file.patch
>  delete mode 100644 meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch
>  delete mode 100644 meta-oe/recipes-kernel/crash/crash/sim-common-sim-arange-fix-extern-inline-handling.patch
>  delete mode 100644 meta-oe/recipes-kernel/crash/crash/sim-ppc-drop-LIBS-from-psim-dependency.patch
>  rename meta-oe/recipes-kernel/crash/{crash_7.3.0.bb => crash_8.0.0.bb} (87%)
>  rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.7.0.bb => makedumpfile_1.7.1.bb} (85%)
>  rename meta-perl/recipes-perl/libencode/{libencode-perl_3.16.bb => libencode-perl_3.17.bb} (97%)
>  rename meta-perl/recipes-perl/libextutils/{libextutils-cppguess-perl_0.23.bb => libextutils-cppguess-perl_0.26.bb} (92%)
>  rename meta-perl/recipes-perl/libtest/{libtest-harness-perl_3.42.bb => libtest-harness-perl_3.44.bb} (95%)
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96867): https://lists.openembedded.org/g/openembedded-devel/message/96867
> Mute This Topic: https://lists.openembedded.org/mt/90801826/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

