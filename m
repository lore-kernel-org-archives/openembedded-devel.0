Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id E4C057D5EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 06:29:17 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id g1so30930910qtj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 22:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=eIHDMJOcWI7uDX/BPEyzR672URiDtLrBG/bppx19VaI=;
	b=ZVE190YXbP5kNE8ibeWsoPUEQ1bnYmRjuyBbFB5tZzAwoFSswrVmOEmBrp00cBkAIK
	x383qVqLlUddr4kuCCcyff987toSbc20XfRN4NrXTHcWMTwfFhplcjhvuPTjQXCIb8mA
	UhZWcZdLBNJ7g6JEWpi3/Y2PHo1iiQRicPKWAXWE4mxsX0wupHZp2OnVFvgQEU1e3Wdc
	dECWTRmJS2Bld1DLe/lMsazAFGoWgKZY6ZE+hoidqFtsNpoTCw2NRCfGihjvCFClyMfW
	i3n+2gdYKiJFkqUJCIA1tJDbgOGDj1KuI1DFL1H9VetwsBumUm0Ca8LICZ8KaFk/SYWf
	vq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eIHDMJOcWI7uDX/BPEyzR672URiDtLrBG/bppx19VaI=;
	b=DiYCzRUMQZ9ucQsNRSJ8pbrKGC/IwZFBXeK6HuoVoYzw7/Dh0yrgEfUr/sM4xalC4T
	uHz4vk45aul5JTSWuzQ7ug7WwnMXOH+LwaU3GWSggNpMuUy872opqgWdfG3iajI6etWI
	QXCK6qKsv471yvr0hxOK6Nr+TChrsrNoua7+wdrR7hKkY+zmKAuw7ctihXFcIkW+ImgI
	/ZBB+hEAo2vVsgBp17noCPhE8cjq2CJ1GcJfz2m/gZJsii/NxpKcRWY3RMoicNnvWCJ2
	iUacv1Xka/3qFbDNVqDl74jj1tv8ipxkUiTUX4AUe0E+Uva2nFZjS82eR1pmqjXs1t0b
	U7kg==
X-Gm-Message-State: APjAAAW2avuCm1YvunY34U97a2lgJ/t282ZaqWSxhajekwLUO3LTZO3E
	gi2zM82jILF+HPbxeOoZZOlO2FZnytMUhNSZcZA=
X-Google-Smtp-Source: APXvYqxSFHvy5NsbyJ+RtYE9B7zcF863MOw1kBUX1S3gaD8dZB6fS9hBNkvWb0LkCXos3b1PUwGQyh3ReyCn8uyVtGc=
X-Received: by 2002:ac8:41c3:: with SMTP id o3mr49071819qtm.88.1575268158178; 
	Sun, 01 Dec 2019 22:29:18 -0800 (PST)
MIME-Version: 1.0
References: <20191201165123.12699-1-schnitzeltony@gmail.com>
	<20191201165123.12699-5-schnitzeltony@gmail.com>
In-Reply-To: <20191201165123.12699-5-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Dec 2019 22:28:51 -0800
Message-ID: <CAMKF1sqymGX0u394oE8gDtmN+KDGo9mqMiv88efQtWyz-cxeTg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 5/7] xserver-xorg-cvt-native: initial add 1.20.5
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
X-List-Received-Date: Mon, 02 Dec 2019 06:29:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails on a host  without x11 see
http://errors.yoctoproject.org/Errors/Details/289776/

On Sun, Dec 1, 2019 at 8:52 AM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> upcoming mutter requires cvt to calculate source code tables of default v=
ideo
> modes - wow
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../xserver-xorg-cvt-native_1.20.5.bb         | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg=
-cvt-native_1.20.5.bb
>
> diff --git a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-na=
tive_1.20.5.bb b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-=
native_1.20.5.bb
> new file mode 100644
> index 000000000..a144e8ba0
> --- /dev/null
> +++ b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.=
20.5.bb
> @@ -0,0 +1,41 @@
> +SUMMARY =3D "X.Org X cvt"
> +HOMEPAGE =3D "https://linux.die.net/man/1/cvt"
> +LICENSE =3D "MIT-X"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5df87950af51ac2c5822094553ea1=
880"
> +
> +DEPENDS +=3D "pixman-native"
> +
> +XORG_PN =3D "xorg-server"
> +
> +SRC_URI =3D "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
> +SRC_URI[md5sum] =3D "c9fc7e21e11286dbedd22c00df652130"
> +SRC_URI[sha256sum] =3D "a81d8243f37e75a03d4f8c55f96d0bc25802be6ec45c3bfa=
5cb614c6d01bac9d"
> +
> +S =3D "${WORKDIR}/${XORG_PN}-${PV}"
> +B =3D "${WORKDIR}/build"
> +
> +inherit native pkgconfig
> +
> +do_configure[noexec] =3D "1"
> +
> +do_compile() {
> +    cd ${S}
> +    for header in `find -name '*.h'`; do
> +        path=3D`dirname $header`
> +        if ! echo "$incpaths" | grep -q "$path" ; then
> +            incpaths=3D"$incpaths -I$path"
> +        fi
> +    done
> +    CFLAGS=3D"${CFLAGS} -DXORG_VERSION_CURRENT=3D1 $incpaths `pkg-config=
 --cflags pixman-1`"
> +    LDFLAGS=3D"${LDFLAGS} -lm `pkg-config --libs pixman-1`"
> +    ${CC} $CFLAGS -o ${B}/cvt \
> +        ${S}/hw/xfree86/utils/cvt/cvt.c \
> +        ${S}/hw/xfree86/modes/xf86cvt.c \
> +        ${S}/os/xprintf.c \
> +        $LDFLAGS
> +}
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 755 ${B}/cvt ${D}${bindir}
> +}
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

