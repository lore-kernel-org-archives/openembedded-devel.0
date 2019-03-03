Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 56C377C8A2
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Mar 2019 22:05:50 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id x6so1816543qki.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Mar 2019 14:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oXYSnEPL61FUNcB4Dit/RX3oAenKpneyiGOmHT0hUNQ=;
	b=srxOu8hoYNHpIh3THTHCbCOF4KXH6NlI360sECwOO5lpn5MMuJEJhjnhc956U2mqH+
	GksZWKIQEf+n3/ZXvL6lovEZoq06mlSzhIvkqv8wOp8Xk8IqXBUNtpBU7VirjaLBga4W
	WOV2zNtjlwSaw9NFICg7XoZ5pw0ol9JCgoGYcyAuJjwL9ms5KotPE4We4qjgQFr3eViM
	u7mePV57yFPMlf7/c4qIhhF4oiGLZkc67CPkXkAzsKcxu2QGexwJof0wjHjYu21T8O3B
	igNk/WHTgCNzrS2iq8jY+C+kDPuLu1LkxrjQxltOzAcWuQ76hc+EXLZi11C7IDX82qEN
	SJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oXYSnEPL61FUNcB4Dit/RX3oAenKpneyiGOmHT0hUNQ=;
	b=oVIwl/x2UwlPA0tf8EkCgoIY58LSDHtGOTSBCQhd5E+03nSXmb6pr4t+hkU2DsEK/z
	/PvsbehXr6e+DI8OVB8Nej8gVB6McgmDn4dScLOoW4q9Na8KWH2ezVh1xwViNfUtK/E5
	Nj50IZxf+Mtof0NonGz2Kaqz7RRnVB9YP/Ei0gkBmA4cQuWRZEjX/Hk6GCYznHWe39yT
	SneurtlmTdOhCDsiZm7uyFFoVsunIZRWU0jjTo1aWLgyAf1H0KDyFG3aSPfWeJV2elsg
	LDj2jNe+BIc04C+5lZzv+CqnU1CdroV5vxH0L1H9meVROOTUJSpwty5OwJmy0OLfeTwO
	RMrg==
X-Gm-Message-State: APjAAAVruXvX0Gs30zi4fzLGbgDBTZoJzHxH3FwfKMb2GhYCbhC9a577
	B0gjw5uQwaTQ1pYe2BpnE6/p/ZU6YLPDhIGrowbGJ9+4
X-Google-Smtp-Source: APXvYqzTosPoDhUV8bPCdRgpvK3bPQfUMdNVDQYKjui76S2npogWLpwxsYBkDY25PT/nsbQFvvF0l58JlUOqLLFi+/A=
X-Received: by 2002:a37:e10c:: with SMTP id c12mr11556974qkm.315.1551650750873;
	Sun, 03 Mar 2019 14:05:50 -0800 (PST)
MIME-Version: 1.0
References: <20190220043740.27952-1-zboszor@pr.hu>
	<20190226095502.5499-1-zboszor@pr.hu>
	<20190226095502.5499-4-zboszor@pr.hu>
In-Reply-To: <20190226095502.5499-4-zboszor@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 3 Mar 2019 14:05:25 -0800
Message-ID: <CAMKF1sqkihWR1Ye=idgGM3m6fq59KtY1_BpAJPK3oKmUwbddrQ@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 3/7 v2] dracut: Add execute_dracut opkg intercept script
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
X-List-Received-Date: Sun, 03 Mar 2019 22:05:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 26, 2019 at 1:55 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbo=
szor@pr.hu> wrote:
>
> Signed-off-by: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@pr.hu>
> ---
> v2: The script name is execute_dracut, not execute-dracut
>     so it is identical to the postinst-intercepts variant.
>
>  .../dracut/dracut/execute_dracut              | 21 +++++++++++++++++++
>  .../recipes-devtools/dracut/dracut_git.bb     |  5 +++++
>  2 files changed, 26 insertions(+)
>  create mode 100755 meta-initramfs/recipes-devtools/dracut/dracut/execute=
_dracut
>
> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/execute_dracut=
 b/meta-initramfs/recipes-devtools/dracut/dracut/execute_dracut
> new file mode 100755
> index 000000000..96bcc92ed
> --- /dev/null
> +++ b/meta-initramfs/recipes-devtools/dracut/dracut/execute_dracut
> @@ -0,0 +1,21 @@
> +#!/bin/sh
> +
> +if [ ! -f $OPKG_INTERCEPT_DIR/execute-dracut ]; then
> +       KERNEL_VERSION=3D$1
> +       shift
> +       MY_KERNEL_VERSION=3D$(readlink /boot/bzimage | sed 's,^.*bzImage-=
,,')

this assumption breaks all image builds for qemux86 and qemux86_64
unless that is fixed, it will be hard to accept this series. bzImage
is not the kernel name always and may not be present in rootfs all the
time.

ERROR: yoe-simple-image-1.0-r0 do_rootfs: The postinstall intercept
hook 'execute_dracut' failed, details in
/mnt/a/yoe/build/tmp/work/qemux86-yoe-linux/yoe-s
imple-image/1.0-r0/temp/log.do_rootfs
ERROR: yoe-simple-image-1.0-r0 do_rootfs:
ERROR: yoe-simple-image-1.0-r0 do_rootfs: Function failed: do_rootfs



> +       if [[ -z "$MY_KERNEL_VERSION" ]]; then
> +               if [[ -d /lib/modules/$KERNEL_VERSION ]]; then
> +                       MY_KERNEL_VERSION=3D"${KERNEL_VERSION}"
> +               fi
> +       fi
> +       [[ -z "$MY_KERNEL_VERSION" ]] && echo COULD NOT DETERMINE KERNEL =
VERSION TO RUN DEPMOD AND DRACUT && echo PLEASE DO IT MANUALLY && exit 0
> +       cat <<EOF > $OPKG_INTERCEPT_DIR/execute-dracut
> +echo RUNNING: depmod -a $MY_KERNEL_VERSION
> +depmod -a $MY_KERNEL_VERSION
> +echo RUNNING: dracut -f $@ /boot/initramfs.img $MY_KERNEL_VERSION
> +echo "dracut: $(dracut --help | grep 'Version:')"
> +dracut -f $@ /boot/initramfs.img $MY_KERNEL_VERSION
> +EOF
> +       chmod +x $OPKG_INTERCEPT_DIR/execute-dracut
> +fi
> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-=
initramfs/recipes-devtools/dracut/dracut_git.bb
> index a1d7cb119..cb49d9539 100644
> --- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> +++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> @@ -12,6 +12,7 @@ PV =3D "049"
>  SRCREV =3D "225e4b94cbdb702cf512490dcd2ad9ca5f5b22c1"
>  SRC_URI =3D "git://git.kernel.org/pub/scm/boot/dracut/dracut.git;protoco=
l=3Dhttp \
>             file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
> +           file://execute_dracut \
>             "
>
>  DEPENDS +=3D "kmod"
> @@ -49,11 +50,15 @@ do_install() {
>      # Its Makefile uses cp -arx to install modules.d, so fix the owner
>      # to root:root
>      chown -R root:root ${D}/${prefix}/lib/dracut/modules.d
> +
> +    install -d -m0755 ${D}${datadir}/opkg/intercept
> +    install -m0755 ${WORKDIR}/execute_dracut ${D}${datadir}/opkg/interce=
pt
>  }
>
>  FILES_${PN} +=3D "${prefix}/lib/kernel \
>                  ${prefix}/lib/dracut \
>                  ${systemd_unitdir} \
> +                ${datadir}/opkg/intercept \
>                 "
>  FILES_${PN}-dbg +=3D "${prefix}/lib/dracut/.debug"
>
> --
> 2.20.1
>

