Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0D16E630
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 00:30:56 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id p25-v6so1618354pli.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2018 17:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=NjwEKLwsr7uYIof+HMrVi4siex+I6njxK1Irq2lDWp4=;
	b=vZWz4giTrQJzRORyf64L3aEidffdumg67rceLSCCCrJR0J8qZJV+zqiM5eo0NoDJnA
	uCHzSCeN5SDE8kucckeckyd8QVGQO6PPvhQfsM04upCMSVKqnyug+q/xV3NxgLgXo3RU
	ZnpWdKmhI+ktlAZJL4vvZEQjPgx5U6ESAhluC7QWHGJP2AUcV2UyLe+mpyPTVGE/p1aF
	iEz5bRRC1sE96yhC+Qozy/MCjMqSqGKgdJTZyKNn9+PLIOEJLx5/7K9vgpzylOHrAYcE
	YtvkAJf+5JX794g1vzHAMy9EwxKJ/hxbGBsnumA7sYVx43YJLiawmcMOfWzQRExF3VpW
	ZXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=NjwEKLwsr7uYIof+HMrVi4siex+I6njxK1Irq2lDWp4=;
	b=PeIJIe9aq/78U0bl3or3oA76Isns2ddTSCskdk1WEUDd3IeUc6+jR3S8D2g+sX9IsF
	x8DXw4E6UpqWxa7NXxfIVqUWe/BapYV8UjXlEIuMrttUKDvgKEn2xnjg2iAbjwk9yrH5
	4pogMqsUJN4Od1CElcG4pq+y+yvdfmqcDZDdlU0DDahIFJpJsL4RwMEMtNHyceV7/U02
	dFLehoNDAtoOp3BvgxHPZLXLG53ZOX7CCXfXjON/JRCNzC/Vp8ybtVUP26krcaUqw+8R
	H/dyVQLBQR6KcHD3sqjzrXTcngP7v3bgkobas/7/YbP54FuQxANoMz2WWBZF60YeT9tc
	eweA==
X-Gm-Message-State: ABuFfohTmC4f92kkc7Tk5Jo/wW2gYToiw5J215BkisQOmX+mWZ8UoKAx
	ugrTksaE+XEakcACSRAPLpEKMaDA
X-Google-Smtp-Source: ACcGV62DMBZliaG2Q7ysho2nOmz6odMx4Gz+NsoYqoOsTrak74zv269Vfiql+DkcKzm80ac/NAIISw==
X-Received: by 2002:a17:902:562:: with SMTP id
	89-v6mr23496326plf.315.1539131456382; 
	Tue, 09 Oct 2018 17:30:56 -0700 (PDT)
Received: from [10.43.100.234] (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	o131-v6sm7970764pgo.53.2018.10.09.17.30.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Oct 2018 17:30:53 -0700 (PDT)
To: Eddie James <eajames@linux.ibm.com>,
	openembedded-devel@lists.openembedded.org
References: <1539109670-43001-1-git-send-email-eajames@linux.ibm.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <79b03cc8-41cf-f27e-c4ea-45f57f4a7ac9@gmail.com>
Date: Tue, 9 Oct 2018 17:30:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1539109670-43001-1-git-send-email-eajames@linux.ibm.com>
Subject: Re: [meta-oe][PATCH] libvncserver: Update to latest version
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
X-List-Received-Date: Wed, 10 Oct 2018 00:30:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 10/09/2018 11:27 AM, Eddie James wrote:
> The latest release of libvncserver is almost two years old. A number of=

> security fixes and enhancements have recently been committed. Since the=
 repo
> is stable, point the recipe to the latest commit.
>
> libvncserver switched from autotools to cmake, so update the recipe as
> necessary, and add PACKAGECONFIG options to allow a more minimal build =
and
> install.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../libvncserver/libvncserver_0.9.11.bb            | 25 --------------=
--------
>  .../libvncserver/libvncserver_git.bb               | 23 ++++++++++++++=
++++++
>  2 files changed, 23 insertions(+), 25 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_=
0.9.11.bb
>  create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_=
git.bb
>
> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.=
bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
> deleted file mode 100644
> index 38dac06..0000000
> --- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -DESCRIPTION =3D "library for easy implementation of a RDP/VNC server"
> -HOMEPAGE =3D "https://libvnc.github.io"
> -SECTION =3D "libs"
> -PRIORITY =3D "optional"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D361b6b837cad26c6900a926b62a=
ada5f"
> -
> -DEPENDS +=3D "zlib libsdl jpeg libpng gtk+ libgcrypt nettle gnutls gmp=
"
> -
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES','systemd',=
'systemd','',d)}"
> -PACKAGECONFIG[systemd] =3D ",,systemd"
> -
> -RDEPENDS_${PN} +=3D "libpng gtk+ libgcrypt"
> -
> -inherit distro_features_check autotools binconfig pkgconfig
> -
> -REQUIRED_DISTRO_FEATURES =3D "x11"
> -
> -SRC_URI =3D "https://github.com/LibVNC/libvncserver/archive/LibVNCServ=
er-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "7f06104d5c009813e95142932c4ddb06"
> -SRC_URI[sha256sum] =3D "193d630372722a532136fd25c5326b2ca1a636cbb8bf9b=
b115ef869c804d2894"
> -
> -S =3D "${WORKDIR}/${BPN}-LibVNCServer-${PV}"
> -
> -TARGET_LDFLAGS +=3D "-lgcrypt"
> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb =
b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> new file mode 100644
> index 0000000..9fb2c09

This removes any notion of a version. I think that is not ideal.

Does the git hash equate to version ?
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION =3D "library for easy implementation of a RDP/VNC server"
> +HOMEPAGE =3D "https://libvnc.github.io"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D361b6b837cad26c6900a926b62a=
ada5f"
> +
> +PACKAGECONFIG ??=3D "gcrypt gnutls jpeg png ${@bb.utils.contains('DIST=
RO_FEATURES','systemd','systemd','',d)} sdl zlib"
> +PACKAGECONFIG[gcrypt] =3D ",,libgcrypt,libgcrypt"
> +PACKAGECONFIG[gnutls] =3D ",,gnutls"
> +PACKAGECONFIG[jpeg] =3D ",-DWITH_JPEG=3DOFF,jpeg"
> +PACKAGECONFIG[openssl] =3D ",,openssl"
> +PACKAGECONFIG[png] =3D ",-DWITH_PNG=3DOFF,libpng,libpng"
> +PACKAGECONFIG[systemd] =3D ",,systemd"
> +PACKAGECONFIG[sdl] =3D ",,libsdl2"
> +PACKAGECONFIG[zlib] =3D ",,zlib"
> +
> +inherit cmake
> +


Have you run " yocto-check-layer"=C2=A0 with this?

I had to add 'REQUIRED_DISTRO_FEATURES =3D "x11" ' to make it pass on the=

previous version.


> +SRC_URI =3D "git://github.com/LibVNC/libvncserver"
> +SRCREV =3D "7b1ef0ffc4815cab9a96c7278394152bdc89dc4d"
> +
> +S =3D "${WORKDIR}/git"
- Armin


