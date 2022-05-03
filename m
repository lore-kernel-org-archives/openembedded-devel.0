Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CF3C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 14:57:05 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.110.1651589819142943316
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 May 2022 07:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LglfsQGK;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id f186so13806968qke.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 May 2022 07:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KUx0Kox4bVObxqAFef20PEftKkx9bkSyX1l3+hghCBQ=;
        b=LglfsQGKUI8+TlkWnNwn9QEd3RxFnPbQy6wmQlMzz7cJcqiOEgufPkDdkviguHCQEQ
         c0w+QoiKsqF1OOLcQZt3UVefFfjQGECeUHs+kpuWaimcJEQz3dHRGHnOW89Dc9W2zRah
         yp5DQoQjsC7H2nsNuijb9xi/KKJete1cvjac88+RG9YAuvo1jYJSpNFCNpOt2YrZ1hQ1
         1v55hYT11rIBhVLPXncizwPftktaRcjF+9NOGYXNFrmIU0jFT/w0hKuzJsJmyVLjmlZp
         ymHPIuBgbff+YPp51IMppb+QheQ9pKz9ZsiDx/tmhD5l7KdVj0E3l/ahij2KPxqkxscD
         S1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KUx0Kox4bVObxqAFef20PEftKkx9bkSyX1l3+hghCBQ=;
        b=MmKo3++FWWDhTB+WHI/VwiW8XP8h0o0FFGhpBUlxPKkrSprKBYF1VNrNdnXca3GcKm
         rLO4YNpHekXMHqjfhrR/2j84YERsYQz8c6NGNW1G7oEUGv+CYSZavIJAcUJz/5T2jmwv
         sl+DfB8upC2ESg8Imt4VOvqtISMhjn2hNmoJObvcM9aTS9xEsFDY3yDN9htJZYYTkAFI
         tZuPhxEAdiE06tK+OoElpF8VfOY/NEh0YCWozsrBJ8Q5R/tXxN+U0QqhsDKiiLzrg+Qv
         FCGBEI452iy0zeTKQX0kjGXxl4czX2xkqbh5diBSYdt/yFPBDXz8dzb247YQ7Gg7/HTH
         e1Vg==
X-Gm-Message-State: AOAM533kikdSm7j8UDoSEhifO3eV/fr0PyEh8Gcs4EEHFCN6KRJM36fG
	SScbD/x9qxOd7kFCeuSzFVVNcK7Fssx1/FKDnEyn01Jkpkc=
X-Google-Smtp-Source: 
 ABdhPJyfuTiul2rinYUp0pwRPnX/p7Sa/68tMyRhcGrOjzDSdQYWIHLv7RFjxPUOYX4Fb8Zt+aPcOupXVn3DRGoS9/Y=
X-Received: by 2002:a05:620a:170f:b0:69f:bfbe:9095 with SMTP id
 az15-20020a05620a170f00b0069fbfbe9095mr12717303qkb.149.1651589818011; Tue, 03
 May 2022 07:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <b4060e58-f622-4c43-474d-e3cc3a33da80@gmail.com>
In-Reply-To: <b4060e58-f622-4c43-474d-e3cc3a33da80@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 May 2022 07:56:31 -0700
Message-ID: 
 <CAMKF1sqzKjOxhy_i+uGAxz_XNd+bM8ZV58D67vbM3tsuSdww9g@mail.gmail.com>
Subject: Re: kirkstone merge request: May 3rd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 May 2022 14:57:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96952

merged, thanks

On Tue, May 3, 2022 at 6:55 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit bb2b5b31a80eb164e47649036878773614e4dbdf:
>
>    meta-openemnedded: Add myself as kirkstone maintainer (2022-04-23
> 17:14:31 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 5357c7a40eaf8d1bcf7ff58edbba8e9527e40c7d:
>
>    boinc-client: Make script install not depend on host install paths
> (2022-05-03 06:49:08 -0700)
>
> ----------------------------------------------------------------
> Carlos Rafael Giani (1):
>        pipewire: Upgrade to version 0.3.50
>
> Khem Raj (23):
>        crash: Fix build for mips target
>        tcsh: Do not install symlinks into /bin with usrmerge
>        arno-iptables-firewall: Do not use bitbake variable inside S
>        fluentbit: Fix build with usrmerge distro feature
>        tomoyo-tools: Define SBINDIR
>        tomoyo-tools: Drop md5sum
>        dietsplash: specify install rootdir
>        linux-atm: Add knob to root prefix
>        ufw: Fix build with usrmerge distro feature
>        klibc: Recognise --dyld-prefix clang option
>        mozjs: Use vendored icu on ppc/clang
>        boinc-client: Do not overwrite same file when using usrmerge
>        pam-ssh-agent-auth: Use specific versions of BSD licenses
>        fwupd: Enable build with musl
>        lirc: install systemd units only when using systemd distro feature
>        fluentbit: Disable systemd support when systemd distro feature is
> disabled
>        gtksourceview5: Allow wayland or x11
>        gtkmm3: Allow wayland or x11 in distro features
>        gparted: Allow wayland or x11 distro features
>        lirc: Delete systemd unit files on non systemd distros
>        atkmm: Allow build with wayland
>        pangomm: Allow building with wayland
>        boinc-client: Make script install not depend on host install paths
>
> Mingli Yu (2):
>        crash: Upgrade to 8.0.0
>        makedumpfile: Upgrade to 1.7.1
>
> Robert Yang (1):
>        libldb: Fix installed-vs-shipped and rebuild error
>
> Willy Tu (1):
>        absil-cpp: Update SRC_URI to to the latest google internal sync
>
> wangmy (11):
>        evince: upgrade 42.1 -> 42.2
>        gspell: upgrade 1.9.1 -> 1.10.0
>        gtksourceview5: upgrade 5.4.0 -> 5.4.1
>        libadwaita: upgrade 1.1.0 -> 1.1.1
>        nautilus: upgrade 42.0 -> 42.1.1
>        htpdate: upgrade 1.3.3 -> 1.3.4
>        hexedit: upgrade 1.5 -> 1.6
>        lsscsi: upgrade 0.31 -> 0.32
>        libencode-perl: upgrade 3.16 -> 3.17
>        libextutils-cppguess-perl: upgrade 0.23 -> 0.26
>        libtest-harness-perl: upgrade 3.42 -> 3.44
>
>   meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb            | 3 +-
>   .../recipes-gnome/evince/{evince_42.1.bb => evince_42.2.bb} |  2 +-
>   .../recipes-gnome/gspell/{gspell_1.9.1.bb => gspell_1.10.0.bb} |  2 +-
>   .../{gtksourceview5_5.4.0.bb => gtksourceview5_5.4.1.bb} |  4 +-
>   .../libadwaita/{libadwaita_1.1.0.bb => libadwaita_1.1.1.bb} |  2 +-
>   .../nautilus/{nautilus_42.0.bb => nautilus_42.1.1.bb} |  2 +-
>   .../klibc/files/klcc-cross-accept-clang-options.patch           | 5 +-
>   ...1-meson-Add-option-to-enable-disable-legacy-RTKit-modu.patch | 44
> ----------------
>   .../pipewire/{pipewire_0.3.49.bb => pipewire_0.3.50.bb} |  6 +--
>   meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb          | 7 +++
>   .../arno-iptables-firewall/arno-iptables-firewall_2.1.1.bb      | 2 +-
>   .../htpdate/{htpdate_1.3.3.bb => htpdate_1.3.4.bb} |  2 +-
>   meta-networking/recipes-support/libldb/libldb_2.3.3.bb          | 11 ++++
>   .../linux-atm/linux-atm/0001-make-Add-PREFIX-knob.patch         | 31
> +++++++++++
>   meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb    | 7 ++-
>   .../meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb        | 13 +++--
>   meta-oe/recipes-bsp/fwupd/fwupd_1.7.6.bb                        | 2 -
>   meta-oe/recipes-bsp/lsscsi/{lsscsi_0.31.bb => lsscsi_0.32.bb} |  3 +-
>   .../abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch                | 20
> ++++----
>   meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb           | 4 +-
>   .../0001-scripts-Do-not-check-for-files-on-build-host.patch     | 52
> +++++++++++++++++++
>   meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb           | 17
> +++----
>   ...1-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch | 28
> ++++++++++
>   .../fluentbit/fluentbit/cross-build-init-system-detection.patch | 4 +-
>   meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb           | 4 +-
>   .../recipes-extended/hexedit/{hexedit_1.5.bb => hexedit_1.6.bb} |  2 +-
>   meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb               | 2 +
>   meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb       | 2 +-
>   meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.1.bb                  | 2 +-
>   meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb                       | 2 +-
>   meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.5.bb                     | 2 +-
>   meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb           | 2 +-
>   meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb                | 3 +-
>   ...2-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch | 36
> -------------
>   .../0003-crash-detect-the-sysroot-s-glibc-header-file.patch     | 33
> ------------
>   .../crash/remove-unrecognized-gcc-option-m32-for-mips.patch     | 33
> ------------
>   .../sim-common-sim-arange-fix-extern-inline-handling.patch      | 79
> -----------------------------
>   .../crash/crash/sim-ppc-drop-LIBS-from-psim-dependency.patch    | 37
> --------------
>   meta-oe/recipes-kernel/crash/{crash_7.3.0.bb => crash_8.0.0.bb} | 13 ++---
>   .../0001-makedumpfile-replace-hardcode-CFLAGS.patch             | 53
> +++++++++----------
>   .../{makedumpfile_1.7.0.bb => makedumpfile_1.7.1.bb} |  8 +--
>   meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb     | 3 +-
>   meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb                     | 6 ++-
>   .../{libencode-perl_3.16.bb => libencode-perl_3.17.bb} |  2 +-
>   ...-cppguess-perl_0.23.bb => libextutils-cppguess-perl_0.26.bb} |  2 +-
>   ...ibtest-harness-perl_3.42.bb => libtest-harness-perl_3.44.bb} |  5 +-
>   46 files changed, 231 insertions(+), 373 deletions(-)
>   rename meta-gnome/recipes-gnome/evince/{evince_42.1.bb =>
> evince_42.2.bb} (92%)
>   rename meta-gnome/recipes-gnome/gspell/{gspell_1.9.1.bb =>
> gspell_1.10.0.bb} (76%)
>   rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.4.0.bb
> => gtksourceview5_5.4.1.bb} (85%)
>   rename meta-gnome/recipes-gnome/libadwaita/{libadwaita_1.1.0.bb =>
> libadwaita_1.1.1.bb} (86%)
>   rename meta-gnome/recipes-gnome/nautilus/{nautilus_42.0.bb =>
> nautilus_42.1.1.bb} (92%)
>   delete mode 100644
> meta-multimedia/recipes-multimedia/pipewire/files/0001-meson-Add-option-to-enable-disable-legacy-RTKit-modu.patch
>   rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.49.bb
> => pipewire_0.3.50.bb} (98%)
>   rename meta-networking/recipes-support/htpdate/{htpdate_1.3.3.bb =>
> htpdate_1.3.4.bb} (92%)
>   create mode 100644
> meta-networking/recipes-support/linux-atm/linux-atm/0001-make-Add-PREFIX-knob.patch
>   rename meta-oe/recipes-bsp/lsscsi/{lsscsi_0.31.bb => lsscsi_0.32.bb} (70%)
>   create mode 100644
> meta-oe/recipes-extended/boinc/boinc-client/0001-scripts-Do-not-check-for-files-on-build-host.patch
>   create mode 100644
> meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch
>   rename meta-oe/recipes-extended/hexedit/{hexedit_1.5.bb =>
> hexedit_1.6.bb} (90%)
>   delete mode 100644
> meta-oe/recipes-kernel/crash/crash/0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch
>   delete mode 100644
> meta-oe/recipes-kernel/crash/crash/0003-crash-detect-the-sysroot-s-glibc-header-file.patch
>   delete mode 100644
> meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch
>   delete mode 100644
> meta-oe/recipes-kernel/crash/crash/sim-common-sim-arange-fix-extern-inline-handling.patch
>   delete mode 100644
> meta-oe/recipes-kernel/crash/crash/sim-ppc-drop-LIBS-from-psim-dependency.patch
>   rename meta-oe/recipes-kernel/crash/{crash_7.3.0.bb => crash_8.0.0.bb}
> (87%)
>   rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.7.0.bb =>
> makedumpfile_1.7.1.bb} (85%)
>   rename meta-perl/recipes-perl/libencode/{libencode-perl_3.16.bb =>
> libencode-perl_3.17.bb} (97%)
>   rename
> meta-perl/recipes-perl/libextutils/{libextutils-cppguess-perl_0.23.bb =>
> libextutils-cppguess-perl_0.26.bb} (92%)
>   rename meta-perl/recipes-perl/libtest/{libtest-harness-perl_3.42.bb =>
> libtest-harness-perl_3.44.bb} (95%)
>

