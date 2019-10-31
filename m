Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	by mail.openembedded.org (Postfix) with ESMTP id AB82B7FAB6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 21:42:49 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id m4so8620136qke.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 14:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yUV1QtLuGbp0M1MtNs9HKKrJzIKaztE/+377SEkWjDk=;
	b=iDBFHqOYagYfhDIAJ7wQd58saOACMbHiP78p2HhrPWySs+jAqDeOGbj3nVeMHGL2Km
	1HX1XvgdVAFB0SnbQYW42glOqG7b38aG7wHBQCuElrEe7EGrt7seJX3BN8zkug+E474X
	pig2D8l6DAWqbVBwD6MMCtjRxPyH4111sU1E1dxxhx4YiO9kcOE5FaoewApOhp7Lyemo
	Br5Bax3yq+osGsRFUQV0wfpgpbKeqO0W6Cb9aeOP9sdp2qpgf5haFnDv4yRaiVCrGusi
	evBECpJ+NLFy621lG+oyWK6TBr5S6qhrx9C2F8cR0OFuYMUn57+VuRkiofv1NBK+NM4G
	m0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yUV1QtLuGbp0M1MtNs9HKKrJzIKaztE/+377SEkWjDk=;
	b=HP7cAl31DxpcIBlDSVjhqsO8+Yz8WRw80R6AqaXDsR/ipJZm5wi5BOqvs5UBulX7LD
	npmCuRKUCFFc55BgQDOYSbFXiUAdtMrwSw1ly4CZyQH2wTkqEEBwZhn4DwxJmZ7q/+4v
	1nrHZa1PM+nw1rWKJVUMJa+rm/702/WTAJX2fT+Yn66enKM4Q6abKZZGrdYgFj4/HPT7
	ygpeWG6KrIuTtPbNEr/nvRzf8tq6ZBBHwZxZtfB+sEMWXYhwvNnnRW+sDcmf72ymo5Zu
	So3MgCuUPvocPb+xLUNfX95giDRGHJ3ceW6e32s/JeAJ5HmCiLT2nvvoJkCWQTJkeuYZ
	6/Bw==
X-Gm-Message-State: APjAAAUf7L0AQZyUDQNqk+zgMWNlmQFJkW9BrE+q2zRomC5Fnikli//P
	dIWBHQ4xxXVQPKiF7ZHGzgkgEZdjpN7pwTYh1mHUT08aIM8=
X-Google-Smtp-Source: APXvYqzpVe0D/xa3J4ocCR3VAR2WXPKSV2lI2xtNw00mOMIEB3jHwoDfobL6DhPyeMJTA/ctRxuzuUG54/+n2dEk9Xk=
X-Received: by 2002:a05:620a:20d2:: with SMTP id
	f18mr2480qka.474.1572558170208; 
	Thu, 31 Oct 2019 14:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <1572541818-52903-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1572541818-52903-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Oct 2019 03:45:11 -0700
Message-ID: <CAMKF1soaNt24NMyQwc6hzwOD6RkMBqmW-GH+5NkDYHVY8F_oVw@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ledmon: upgrade to 0.93
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
X-List-Received-Date: Thu, 31 Oct 2019 21:42:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 31, 2019 at 9:16 AM Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> 1) inherit autotools-brokensep as new version use autotools.
>
> 2) Add a patch to fix compile error.
>    0001-Disable-Waddress-of-packed-member-to-fix-compi.patch
>
> 3) Modify do_install_append() function to fix do_package error as follows:
>    ledmon-git-r0 do_package: SYSTEMD_SERVICE_ledmon value ledmon.service
> does not exist
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  ...le-Waddress-of-packed-member-to-fix-compi.patch | 35
> ++++++++++++++++++++++
>  meta-oe/recipes-bsp/ledmon/ledmon_git.bb           | 13 ++++----
>  2 files changed, 43 insertions(+), 5 deletions(-)
>  create mode 100644
> meta-oe/recipes-bsp/ledmon/ledmon/0001-Disable-Waddress-of-packed-member-to-fix-compi.patch
>
> diff --git
> a/meta-oe/recipes-bsp/ledmon/ledmon/0001-Disable-Waddress-of-packed-member-to-fix-compi.patch
> b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Disable-Waddress-of-packed-member-to-fix-compi.patch
> new file mode 100644
> index 0000000..bd2b204
> --- /dev/null
> +++
> b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Disable-Waddress-of-packed-member-to-fix-compi.patch
> @@ -0,0 +1,35 @@
> +From 310540bbf853bc9bea384962d6acf66c7e99fd83 Mon Sep 17 00:00:00 2001
> +From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +Date: Thu, 31 Oct 2019 12:52:57 +0900
> +Subject: [PATCH] Disable -Waddress-of-packed-member to fix compile
> + error.
> +
> +"-Waddress-of-packed-member" is enabled by default with gcc-9, and raise
> the following waring.
> +
> +|   550 |  _dump_sgpio_amd(&amd_reg->amd);
> +|       |                  ^~~~~~~~~~~~~
> +| amd_sgpio.c: In function '_write_amd_register':
> +| amd_sgpio.c:558:18: error: taking address of packed member of 'struct
> amd_register' may result in an unaligned pointer value
> [-Werror=address-of-packed-member]
> +
> +So disable it.
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +---
> + configure.ac | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 7bc20f8..bf89a3c 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -24,6 +24,7 @@ AX_AM_CFLAGS_ADD([-Werror=alloca])
> + AX_AM_CFLAGS_ADD([-Werror=missing-field-initializers])
> + AX_AM_CFLAGS_ADD([-Werror])
> + AX_AM_CFLAGS_ADD([-Werror=format-signedness])
> ++AX_AM_CFLAGS_ADD([-Wno-address-of-packed-member])
> +


This warning knob may not be available always so
Either we fix the warning by altering the code and making it go away or we
disable werror completely
Of course first option is preferred

>
> + AC_SUBST([AM_CFLAGS])
> + AC_SUBST([AM_CPPFLAGS])
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
> b/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
> index 74ae56c..5825868 100644
> --- a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
> +++ b/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
> @@ -11,15 +11,17 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>
>  DEPENDS = "sg3-utils udev"
>
> -inherit systemd
> +inherit autotools-brokensep systemd
>

This is sad that we move to new version and out of tree build is broken can
we fix that rather than patching it out ?

It might be upstream worthy patch as well


>  SYSTEMD_SERVICE_${PN} = "ledmon.service"
>
> +# 0.93
>  SRC_URI = "git://github.com/intel/ledmon;branch=master \
>             file://0002-include-sys-select.h-and-sys-types.h.patch \
> +
>  file://0001-Disable-Waddress-of-packed-member-to-fix-compi.patch \
>            "
>
> -SRCREV = "ad1304ca1363d727425a1f23703c523e21feae4f"
> +SRCREV = "1d72f9cb5c9163b2ecdf19709935720e65f5b90e"
>
>  COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
>  COMPATIBLE_HOST_libc-musl = "null"
> @@ -28,7 +30,8 @@ S = "${WORKDIR}/git"
>  EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}' CFLAGS='${CFLAGS}'"
>
>  do_install_append() {
> -       install -d ${D}/${systemd_unitdir}/system
> -       oe_runmake  DESTDIR=${D}  install
> -       oe_runmake  DESTDIR=${D}${systemd_unitdir}/system  install-systemd
> +        if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false', d)}; then
> +               install -d ${D}${systemd_unitdir}/system
> +               install -m 0755 ${S}/systemd/ledmon.service
> ${D}${systemd_unitdir}/system
> +        fi
>  }
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

