Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 218107C83F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Feb 2019 20:40:35 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id w4so17155928qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Feb 2019 12:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iZFt38fc80Tzb2j6TP7eyEV61X8cZUtT4cPOVgrJ0eg=;
	b=inn5xMAVhTZsJP5cA7o9a3zXNWlsvalOrS8SK4chOT6w5l191BFsKb7kQMuQxbiFVU
	itNF+GA2cX8tu/9o9Ymb7fVvKj3edPjBMc1yPVqU5uHIeo/6Mrt0gqemFJAdEoyaMQVT
	OS6dR8v2Xq3hdGmHCal9d9R7G42VdfxhZqZGYkaLibRIXnOnYof2J2zR18ZgPx6AMkds
	PdB6Y0RYnyVg6JpXN5ccUyW5x2hacohnmRmlydPBmXHkVNsqbVQRfsmoH/SMUul1cCO2
	prZ4FQXW1LZSJQxOZ2hxu0r+UWMjoOhgpwrD6q85QrPrzVpGTHaJrBm/yW1viXimtdbq
	ZEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iZFt38fc80Tzb2j6TP7eyEV61X8cZUtT4cPOVgrJ0eg=;
	b=avuMbwuSSn/dHwQQWjus+Ckknn9ACGfaYxCZhXSFjgHaRUjfG0WskrH8z8o3EXn1VF
	2JX5oPMt5kaf7p1DR2ajotHbtr3PrNeC/3s1/Qn2sVokwXoLhUP/dLEESpMoGS0J8zcP
	SH4qYcG9/BHihO8H1g9dbwnqf5bn1CuqC+2GZz7FDYvcOE+QdS5EPIQn1QAyGCTfwHrL
	sqiXzPI5wqQMgKSuH2JCUeGAnQcaEnABrvJ4M3vPdSnyvr2bs5Zgma8t30F4jGWdVmqb
	2YOT901/RSNWsyDV45nnEwBG3JQi+K/T8JC88Gimo70qebg+Vjw0U6I33dJsNvDakhAW
	T2mg==
X-Gm-Message-State: AHQUAuaLnYhN9ngVPtJB28DR9Vdh9P0IfxwiKEQnrmv+0R2H/jET6v06
	aLSnPbuSCzj21YMVk7dNi8hu44VUqsYDQf7AWH4=
X-Google-Smtp-Source: AHgI3Ia9bUtGK8olzR+hZE2oO4DwdWwBJERmlvCP7PBHoGmgGHvmI9pdTCrP678WpAAn+NVFSuZUWeUOJV1qRKIKiGg=
X-Received: by 2002:ac8:67d3:: with SMTP id r19mr15470867qtp.196.1550436035839;
	Sun, 17 Feb 2019 12:40:35 -0800 (PST)
MIME-Version: 1.0
References: <20190216170354.10645-1-zboszor@pr.hu>
	<20190216170354.10645-3-zboszor@pr.hu>
In-Reply-To: <20190216170354.10645-3-zboszor@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Feb 2019 12:40:09 -0800
Message-ID: <CAMKF1srU-Pjfq_U5aSZ+_oDO9FYdHE3F27fMZd0SpiDh7RWtZg@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 2/6] dracut: Allow native build
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
X-List-Received-Date: Sun, 17 Feb 2019 20:40:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 16, 2019 at 9:04 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbo=
szor@pr.hu> wrote:
>
> For useful modules to be successfully included into the initramfs,
> the dependencies must be extended.
>
> Signed-off-by: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@pr.hu>
> ---
>  meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-=
initramfs/recipes-devtools/dracut/dracut_git.bb
> index dd2e8bbb3..71926c3b8 100644
> --- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> +++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
> @@ -59,11 +59,19 @@ FILES_${PN}-dbg +=3D "${prefix}/lib/dracut/.debug"
>
>  CONFFILES_${PN} +=3D "${sysconfdir}/dracut.conf"
>
> -RDEPENDS_${PN} =3D "findutils cpio util-linux-blkid util-linux-getopt ut=
il-linux bash ldd"
> +RDEPENDS_${PN}_class-target =3D " \
> +                     findutils cpio util-linux-blkid util-linux-getopt u=
til-linux-losetup util-linux-umount util-linux \
> +                     bash ldd xz plymouth-initrd kbd-consolefonts kbd-co=
nsoletrans kbd-keymaps kbd-unimaps gzip tar sed \
> +                     openssh-scp openssh-ssh systemd udev linux-firmware=
 \
> +                    "
> +RDEPENDS_${PN}_class-native =3D "coreutils-native findutils-native cpio-=
native util-linux-native bash-native cross-compiler-ldd"
>

this adds unconditional dependency on systemd, if this is the case
then we need to make it such that it does not get pulled
into non systemd builds e.g. when using sysvinit

ERROR: Nothing RPROVIDES 'systemd' (but
/mnt/a/yoe/sources/meta-openembedded/meta-initramfs/recipes-devtools/dracut=
/dracut_git.bb
RDEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'systemd' (not in
DISTRO_FEATURES)



>  # This could be optimized a bit, but let's avoid non-booting systems :)
> -RRECOMMENDS_${PN} =3D " \
> +RRECOMMENDS_${PN}_class-target =3D " \
>                       kernel-modules \
>                       busybox \
>                       coreutils \
> +                     intel-microcode \
>                      "
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.20.1
>

