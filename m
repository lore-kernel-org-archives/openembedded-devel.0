Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1F2E07FA49
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 02:49:25 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id t8so11287190qtc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 19:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IgbIMZcohzldUCvPAdVTPJhEtramU1tBrqKhEG2OW04=;
	b=dmQkcaX0OAE1fOdRltDne5QrNyvYR/KJKMzWwf3hFzmFhZyTdT5TvrDx8Gkwh+pfRu
	8DBMcgeuZEcMPiYeXfrLEgBnl9j1UMSaOsMJ7+O+i55bivK7oIPNip4l4pWNS0CpIrRn
	+udKD2yBIBW6WjT2YI5pfh1Zdmg2yJkWLwOfeJpTVf3f+tcmH/VTFwzYYs7DijWrj+cl
	m0l2fAStflY0VdYjl6Mjt+06+pXWZOd3HJLr5kMERKl69/8j2uMFs1GG2udlDPlVcKg5
	TvVMqEB3LKUTIYJcuJaZu4IaTHwxtWHuqKXt9ESn5HX9xJMXok9YqkcSR2N6vi06Xc9/
	P0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IgbIMZcohzldUCvPAdVTPJhEtramU1tBrqKhEG2OW04=;
	b=uaX83L7BrYlyhhBVSx1VXZyreECIeQ1xpud306YGiFTqXc+6qKx7rdSThjJdxjiusc
	Q/4fs6ryMpcCBNZWvhlEyS6rinhwmRrAqFi2SwP96HSzLprsOSsMRZX00AEhtmUcFjvK
	/Cz9B0jxW2sYv+RqH5P+0Lf1+ikI2o7s5ida9Nu0umYjxhzEfJGNpDK4tgs7uHXW9ZNh
	yYqquBMFeNAlHAXfuJaOrUCKOaVDLmjcZzBUczJENKwW0/5IzPo0uC77XK2uF7SASrDt
	4bM3vYc/VQzbp7Cnm+P2ZK1jdSuqKS47nCgWJxWWJDyou61LhkAW9hbg8BFEEbI670ml
	oj3Q==
X-Gm-Message-State: APjAAAXSY8WG8uzEFjiwH0XsH20Rce0vgEpZc6mnvFmP5NSLaY+ppEYU
	lukijLO5POijUyNQ859OyPdtB4nwZmOKbWj0fr+t1bOK09k=
X-Google-Smtp-Source: APXvYqyYiM/MsIF31jLJB6gO3kSY8i8GN6HR+tVYDwc16xhmQm+/1i7rMswXScAv/xDkJCiHaTJa2lEZf2hL3VkA0rc=
X-Received: by 2002:aed:2724:: with SMTP id n33mr3752796qtd.194.1572576565418; 
	Thu, 31 Oct 2019 19:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B946E7@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B946E7@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Oct 2019 19:48:59 -0700
Message-ID: <CAMKF1so9OpJ36Nv8a8+CK5XA1+KmiWxLZdU+cE6PqtEwM4kz3A@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: reply: [meta-oe][PATCH] ledmon: upgrade to 0.93
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
X-List-Received-Date: Fri, 01 Nov 2019 02:49:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2019 at 7:40 PM Zheng, Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Hi Khem
>
> + AX_AM_CFLAGS_ADD([-Werror=3Dformat-signedness])
> ++AX_AM_CFLAGS_ADD([-Wno-address-of-packed-member])
> +
>
> >This warning knob may not be available always so
> >Either we fix the warning by altering the code and making it go away or =
we disable werror completely
> >Of course first option is preferred
>
> I found a new pull request to fix this problem. Can I backport it?

seems ok

> https://github.com/intel/ledmon/pull/48/commits
>
> -inherit systemd
> +inherit autotools-brokensep systemd
>
> >This is sad that we move to new version and out of tree build is broken =
can we fix that rather than patching it out ?
> >It might be upstream worthy patch as well
>
> For this problem, I found inherit autotools system also works well. So sh=
ould I inherit autotools?
>b


super


>   --
> Best Regards
>
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Khem Raj <raj.khem@gmail.com>
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2019=E5=B9=B410=E6=9C=8831=E6=97=A5=
 18:45
> =E6=94=B6=E4=BB=B6=E4=BA=BA: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <=
zhengrq.fnst@cn.fujitsu.com>
> =E6=8A=84=E9=80=81: openembedded-devel@lists.openembedded.org
> =E4=B8=BB=E9=A2=98: Re: [oe] [meta-oe][PATCH] ledmon: upgrade to 0.93
>
>
>
> On Thu, Oct 31, 2019 at 9:16 AM Zheng Ruoqin <mailto:zhengrq.fnst@cn.fuji=
tsu.com> wrote:
> 1) inherit autotools-brokensep as new version use autotools.
>
> 2) Add a patch to fix compile error.
>    0001-Disable-Waddress-of-packed-member-to-fix-compi.patch
>
> 3) Modify do_install_append() function to fix do_package error as follows=
:
>    ledmon-git-r0 do_package: SYSTEMD_SERVICE_ledmon value ledmon.service =
does not exist
>
> Signed-off-by: Zheng Ruoqin <mailto:zhengrq.fnst@cn.fujitsu.com>
> ---
>  ...le-Waddress-of-packed-member-to-fix-compi.patch | 35 ++++++++++++++++=
++++++
>  meta-oe/recipes-bsp/ledmon/http://ledmon_git.bb           | 13 ++++----
>  2 files changed, 43 insertions(+), 5 deletions(-)
>  create mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-Disable-Waddre=
ss-of-packed-member-to-fix-compi.patch
>
> diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0001-Disable-Waddress-of-p=
acked-member-to-fix-compi.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Di=
sable-Waddress-of-packed-member-to-fix-compi.patch
> new file mode 100644
> index 0000000..bd2b204
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/ledmon/ledmon/0001-Disable-Waddress-of-packed-m=
ember-to-fix-compi.patch
> @@ -0,0 +1,35 @@
> +From 310540bbf853bc9bea384962d6acf66c7e99fd83 Mon Sep 17 00:00:00 2001
> +From: Zheng Ruoqin <mailto:zhengrq.fnst@cn.fujitsu.com>
> +Date: Thu, 31 Oct 2019 12:52:57 +0900
> +Subject: [PATCH] Disable -Waddress-of-packed-member to fix compile
> + error.
> +
> +"-Waddress-of-packed-member" is enabled by default with gcc-9, and raise=
 the following waring.
> +
> +|   550 |  _dump_sgpio_amd(&amd_reg->amd);
> +|       |                  ^~~~~~~~~~~~~
> +| amd_sgpio.c: In function '_write_amd_register':
> +| amd_sgpio.c:558:18: error: taking address of packed member of 'struct =
amd_register' may result in an unaligned pointer value [-Werror=3Daddress-o=
f-packed-member]
> +
> +So disable it.
> +
> +Signed-off-by: Zheng Ruoqin <mailto:zhengrq.fnst@cn.fujitsu.com>
> +---
> + http://configure.ac | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/http://configure.ac b/http://configure.ac
> +index 7bc20f8..bf89a3c 100644
> +--- a/http://configure.ac
> ++++ b/http://configure.ac
> +@@ -24,6 +24,7 @@ AX_AM_CFLAGS_ADD([-Werror=3Dalloca])
> + AX_AM_CFLAGS_ADD([-Werror=3Dmissing-field-initializers])
> + AX_AM_CFLAGS_ADD([-Werror])
> + AX_AM_CFLAGS_ADD([-Werror=3Dformat-signedness])
> ++AX_AM_CFLAGS_ADD([-Wno-address-of-packed-member])
> +
>
> This warning knob may not be available always so
> Either we fix the warning by altering the code and making it go away or w=
e disable werror completely
> Of course first option is preferred
>
> + AC_SUBST([AM_CFLAGS])
> + AC_SUBST([AM_CPPFLAGS])
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-bsp/ledmon/http://ledmon_git.bb b/meta-oe/re=
cipes-bsp/ledmon/http://ledmon_git.bb
> index 74ae56c..5825868 100644
> --- a/meta-oe/recipes-bsp/ledmon/http://ledmon_git.bb
> +++ b/meta-oe/recipes-bsp/ledmon/http://ledmon_git.bb
> @@ -11,15 +11,17 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0=
215e8d672dc4c32c317bb3 \
>
>  DEPENDS =3D "sg3-utils udev"
>
> -inherit systemd
> +inherit autotools-brokensep systemd
>
> This is sad that we move to new version and out of tree build is broken c=
an we fix that rather than patching it out ?
>
> It might be upstream worthy patch as well
>
>
>  SYSTEMD_SERVICE_${PN} =3D "ledmon.service"
>
> +# 0.93
>  SRC_URI =3D "git://http://github.com/intel/ledmon;branch=3Dmaster \
>             file://0002-include-sys-select.h-and-sys-types.h.patch \
> +           file://0001-Disable-Waddress-of-packed-member-to-fix-compi.pa=
tch \
>            "
>
> -SRCREV =3D "ad1304ca1363d727425a1f23703c523e21feae4f"
> +SRCREV =3D "1d72f9cb5c9163b2ecdf19709935720e65f5b90e"
>
>  COMPATIBLE_HOST =3D "(i.86|x86_64).*-linux"
>  COMPATIBLE_HOST_libc-musl =3D "null"
> @@ -28,7 +30,8 @@ S =3D "${WORKDIR}/git"
>  EXTRA_OEMAKE =3D "CC=3D'${CC}' LDFLAGS=3D'${LDFLAGS}' CFLAGS=3D'${CFLAGS=
}'"
>
>  do_install_append() {
> -       install -d ${D}/${systemd_unitdir}/system
> -       oe_runmake  DESTDIR=3D${D}  install
> -       oe_runmake  DESTDIR=3D${D}${systemd_unitdir}/system  install-syst=
emd
> +        if mailto:${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'tr=
ue', 'false', d)}; then
> +               install -d ${D}${systemd_unitdir}/system
> +               install -m 0755 ${S}/systemd/ledmon.service ${D}${systemd=
_unitdir}/system
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
> mailto:Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

