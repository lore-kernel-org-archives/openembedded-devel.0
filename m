Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1774E7FA46
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 20:09:23 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id c21so16469126qtj.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 13:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=onn0NPamuaNWwt9oppg3gJ4mXwLFqe6gwWFrua5OwBQ=;
	b=ReLHYqPDSH2X18Gydc7LJES0+jwuE2VbG55fdZgN1Gq/Q7GhyDkgBCSNFXXY8q0dvS
	hsdWE7bSs/eSRgCoyb/AZtsjK14onnUpLBzkXsz3jFYL5r3/wpRWmPZ90RhBWV3wVLjM
	kByFd3P2C/WYwyJnc+8DHO3zirErpLYgXq6zUpmk24Tsqfm7U3G4CoUU9g9CwbrJAtXt
	hL7H2IKg7lXw25zF6SM97nyrmN567rPvtk9FzJYhhl2dLOHVb6QF0k0RH65eHaBxPjFD
	GAY1x0y+gJvrUyFcehKHJ9DJn2uSpcFnQqy+Da2WOwiGPP3Mq0aibZr/zH6i4P6U/v/l
	FVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=onn0NPamuaNWwt9oppg3gJ4mXwLFqe6gwWFrua5OwBQ=;
	b=jQ8P9AHdiLMDlrMgIAlI+1+300LpsnQKHpcSF7kcnCcX45fVJDSyC6+9v85EqWCj5S
	ywx+EIAO9vzxxq/bQq1kKiyBH5x9BrjYXWj+YHEMJrGEu5Ea4D+s3aox20b2YBTkJhmn
	1hGVNIKKITfdP2p2cSHUAtH1NfHTU3yD/8/Kc+jsycj46lZ1gfu/wKJVaDDe2tA6zpJ8
	MsrGTbHox1g7hXI1t9OQNePP9c4wktpcVu4fbZQdmOSj/nOn3p3+1yezfIpJ7UPGE4wd
	3wrNRpXudEGDeMUhuSgEWF+U6UhIqXfDXdCQ/ZFmWdLsuXS0RWLguaUAXsi3fW8ls5cP
	vnvg==
X-Gm-Message-State: APjAAAW6hrtEVlzQnQ2pOVViyy0ygRm2g2dlsBTF4wgTKJlZRxJwvabL
	yN+879NmQX4zCuK6ea9dy3arfQnd/mrU/EeUXhc=
X-Google-Smtp-Source: APXvYqxZTUlK8FxiSB+lTqRAQfygpxj73B5piIgSHex1gUMhyFrtxgOnXIpyIPNiUWo0x1O2/O4EyzDnV18s84PUlEM=
X-Received: by 2002:ac8:6054:: with SMTP id k20mr339537qtm.88.1572293363677;
	Mon, 28 Oct 2019 13:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
	<20191027233545.4146-16-schnitzeltony@gmail.com>
In-Reply-To: <20191027233545.4146-16-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2019 21:08:55 +0100
Message-ID: <CAMKF1sp17i93Od+zEiRP3d5dNG0B2E0iSYhWbBaK4-hdwT-bbQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 15/19] glade3: upgrade 3.8.5 -> 3.8.6
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
X-List-Received-Date: Mon, 28 Oct 2019 20:09:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://errors.yoctoproject.org/Errors/Details/274843/

On Mon, Oct 28, 2019 at 12:38 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> * online help support was added - ship it optionally
> * prettify recipe a bit
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../recipes-devtools/glade/glade3_3.8.5.bb    | 23 -------------------
>  .../recipes-devtools/glade/glade3_3.8.6.bb    | 18 +++++++++++++++
>  2 files changed, 18 insertions(+), 23 deletions(-)
>  delete mode 100644 meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
>  create mode 100644 meta-xfce/recipes-devtools/glade/glade3_3.8.6.bb
>
> diff --git a/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb b/meta-xfce=
/recipes-devtools/glade/glade3_3.8.5.bb
> deleted file mode 100644
> index c3da3e9b9..000000000
> --- a/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SUMMARY =3D "Glade - A User Interface Designer"
> -HOMEPAGE =3D "http://www.gnu.org/software/gnash"
> -LICENSE =3D "GPLv2 & LGPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Daabe87591cb8ae0f3c68be6977bb5=
522 \
> -                    file://COPYING.GPL;md5=3D9ac2e7cff1ddaf48b6eab6028f2=
3ef88 \
> -                    file://COPYING.LGPL;md5=3D252890d9eee26aab7b432e8b8a=
616475"
> -DEPENDS =3D "gtk+ gnome-doc-utils gnome-common libxml2 intltool-native"
> -
> -inherit distro_features_check autotools pkgconfig pythonnative gtk-icon-=
cache
> -
> -REQUIRED_DISTRO_FEATURES =3D "x11"
> -
> -SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-${=
PV}.tar.xz \
> -           file://0001-gnome-doc-utils.make-sysrooted-pkg-config.patch \
> -           file://0002-fix-gcc-6-build.patch \
> -           file://0001-Add-G_GNUC_PRINTF-on-functions-with-format-string=
s.patch \
> -           "
> -SRC_URI[md5sum] =3D "4e4b4f5ee34a03e017e4cef97d796c1f"
> -SRC_URI[sha256sum] =3D "58a5f6e4df4028230ddecc74c564808b7ec4471b1925058e=
29304f778b6b2735"
> -
> -EXTRA_OECONF +=3D "--disable-scrollkeeper"
> -
> -FILES_${PN} +=3D "${datadir}/icons"
> diff --git a/meta-xfce/recipes-devtools/glade/glade3_3.8.6.bb b/meta-xfce=
/recipes-devtools/glade/glade3_3.8.6.bb
> new file mode 100644
> index 000000000..8ed30944b
> --- /dev/null
> +++ b/meta-xfce/recipes-devtools/glade/glade3_3.8.6.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Glade - A User Interface Designer"
> +HOMEPAGE =3D "http://www.gnu.org/software/gnash"
> +LICENSE =3D "GPLv2 & LGPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Daabe87591cb8ae0f3c68be6977bb5=
522 \
> +                    file://COPYING.GPL;md5=3D9ac2e7cff1ddaf48b6eab6028f2=
3ef88 \
> +                    file://COPYING.LGPL;md5=3D252890d9eee26aab7b432e8b8a=
616475"
> +DEPENDS =3D "gtk+ gnome-doc-utils gnome-common libxml2 intltool-native y=
elp-tools-native"
> +
> +inherit gnomebase gnome-help distro_features_check pythonnative gtk-icon=
-cache
> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
> +SRC_URI +=3D " \
> +    file://0002-fix-gcc-6-build.patch \
> +    file://0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch=
 \
> +"
> +SRC_URI[archive.md5sum] =3D "c16756952967f7316d64593124761027"
> +SRC_URI[archive.sha256sum] =3D "aaeeebffaeb3068fb23757a2eede46adeb4c7cec=
c740feed7654e065491f5449"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

