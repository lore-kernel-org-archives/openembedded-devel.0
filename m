Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id AE5CF7BD9A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 17:06:57 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d13so11349468qko.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 10:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AzjvBFoBkj7Ny5I2h5fOwP7HhW0lqaqoYr8DsYrw8Lg=;
	b=cljCdyf6SS4uRtxPuSuai33+yN0Vf7jiZJ5PjeLNNmSwIUeuEXFSRpn/uJ4wToIBvf
	qwKO+oT0uNG5+o2GvLMsJHHcr8JNvyVzV6lxuTcWRflrRmMmh61W+9VkUNhTJovtg6SX
	0FQu3xHdFd85MSSziqiB4/EC2JeWrqjc/FXIBVWWAFdGNBtk+uN7/tk/+je/sKkgwpnD
	t2UmPu1TSjJRDfRK2EHAlctkjvLkLFJh45CODfA2UmHDEfHe8vwhuv8K2C8ss31UuEYP
	1XkRFmg5F44SFwP8nLshKECw4huTcsQPypt49WajqOWpsfrNbMvx44tfPk9IhwxgaU8s
	6iKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AzjvBFoBkj7Ny5I2h5fOwP7HhW0lqaqoYr8DsYrw8Lg=;
	b=q+3oTetfbt0eY54xwpaIbwiLzYebebdvLgA0qPEPoft3VLVS0+aFeI5nPec7RSQjI9
	PEfQU2lpWva/mgdrbNM0kKlV+yKy9XW3g72oqGDJqlSEMl8qSNaJPti+SOYA+5W3dH1Q
	Kc937AvrCpwcrsJib/DxNgDhNV7vP3mJOFKffxsQH0U6vqemAWKJBsCDnamkv1BuC6gX
	jNXl2yF+c34b4U3ZoNQ0ixwsmWxsfAWQL2ps/y9+8HxvCyfuewPMf+AuATi0E20l1DRw
	EMtc7XlxlQyn4QFPjohDr2cXugKRly9Fohv8IeCvoGgDUG+EzaVESHmE2NZ34LgRyWyV
	CatQ==
X-Gm-Message-State: APjAAAV4polVwlZbjS3TwgrfdyqKtobQQkR5nlSXsj5gC6uEE4KQ7v67
	4OxY3CLaDZ0Jer/5mQxXxGLCvzzTAAJgDhVK9A0=
X-Google-Smtp-Source: APXvYqxBhBGWxpRVaKzspaQx+jRhLquqhTLvzn9rHQQDHmLI40tljBQq2gOUolLbexl7VsK9KzmoRvCNllFPFU1W9XA=
X-Received: by 2002:a05:620a:a9a:: with SMTP id
	v26mr6630111qkg.71.1572628018027; 
	Fri, 01 Nov 2019 10:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <1572600890-65720-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1572600890-65720-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Nov 2019 10:06:31 -0700
Message-ID: <CAMKF1sqM5e0sEJ8ycLye7xFe9U6+iWc_Mf8Q0jza0ttECwQ=yQ@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] ledmon: upgrade to 0.93
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
X-List-Received-Date: Fri, 01 Nov 2019 17:06:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 31, 2019 at 10:55 PM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> 1) inherit autotools as new version use autotools.
>
> 2) Add a patch to fix compile error.
>    0001-Don-t-build-with-Werror-to-fix-compile-error.patch
>
> 3) Modify do_install_append() function to fix do_package error as follows:
>    ledmon-git-r0 do_package: SYSTEMD_SERVICE_ledmon value ledmon.service does not exist
>
> 4) Add ${S}/config in CFLAGS.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  ...-t-build-with-Werror-to-fix-compile-error.patch | 29 ++++++++++++++++++++++
>  meta-oe/recipes-bsp/ledmon/ledmon_git.bb           | 17 +++++++++----
>  2 files changed, 41 insertions(+), 5 deletions(-)
>  create mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
>
> diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
> new file mode 100644
> index 0000000..b65f1a7
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Don-t-build-with-Werror-to-fix-compile-error.patch
> @@ -0,0 +1,29 @@
> +Subject: [PATCH] Don't build with -Werror to fix compile error.
> +
> +|   550 |  _dump_sgpio_amd(&amd_reg->amd);
> +|       |                  ^~~~~~~~~~~~~
> +| amd_sgpio.c: In function '_write_amd_register':
> +| amd_sgpio.c:558:18: error: taking address of packed member of 'struct amd_register' may result in an unaligned pointer value [-Werror=address-of-packed-member]
> +
> +Upstream-Status: Pending

this was submitted isnt it? if so then please put the right status
here. One line patches are easy to
be mistaken and carried forward even when upstreamed.

> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +---
> + configure.ac | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 7bc20f8..7e01bd5 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -22,7 +22,6 @@ AX_AM_CFLAGS_ADD([-Werror=format-truncation=1])
> + AX_AM_CFLAGS_ADD([-Werror=shift-negative-value])
> + AX_AM_CFLAGS_ADD([-Werror=alloca])
> + AX_AM_CFLAGS_ADD([-Werror=missing-field-initializers])
> +-AX_AM_CFLAGS_ADD([-Werror])
> + AX_AM_CFLAGS_ADD([-Werror=format-signedness])
> +
> + AC_SUBST([AM_CFLAGS])
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb b/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
> index 74ae56c..f9ae9aa 100644
> --- a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
> +++ b/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
> @@ -11,15 +11,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>
>  DEPENDS = "sg3-utils udev"
>
> -inherit systemd
> +inherit autotools systemd
>
>  SYSTEMD_SERVICE_${PN} = "ledmon.service"
>
> +# 0.93
>  SRC_URI = "git://github.com/intel/ledmon;branch=master \
>             file://0002-include-sys-select.h-and-sys-types.h.patch \
> +           file://0001-Don-t-build-with-Werror-to-fix-compile-error.patch \
>            "
>
> -SRCREV = "ad1304ca1363d727425a1f23703c523e21feae4f"
> +SRCREV = "1d72f9cb5c9163b2ecdf19709935720e65f5b90e"
>
>  COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
>  COMPATIBLE_HOST_libc-musl = "null"
> @@ -27,8 +29,13 @@ COMPATIBLE_HOST_libc-musl = "null"
>  S = "${WORKDIR}/git"
>  EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}' CFLAGS='${CFLAGS}'"
>
> +# The ledmon sources include headers in ${S}/config to build but not in CFLAGS.
> +# We need to add this include path in CFLAGS.
> +CFLAGS += "-I${S}/config"
> +
>  do_install_append() {
> -       install -d ${D}/${systemd_unitdir}/system
> -       oe_runmake  DESTDIR=${D}  install
> -       oe_runmake  DESTDIR=${D}${systemd_unitdir}/system  install-systemd
> +        if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +               install -d ${D}${systemd_unitdir}/system
> +               install -m 0755 ${S}/systemd/ledmon.service ${D}${systemd_unitdir}/system
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

