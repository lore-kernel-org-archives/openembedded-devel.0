Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id E34146B06C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Dec 2018 20:40:48 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id z9so5284525pfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2018 12:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=UBI2pvvoE58G8/Hv3nCZF2XOhdj6XY9edaeJLNMnGP0=;
	b=dASgWtWA/QHIrI4rRowIQ0zG1YcK7FHIADr4dMKtdDxneOjRj/P9E6TV61a0DCjr4l
	H/qzVthmrP++wAViV/Jk/h1bFoqy5kEoWC6+E76Qq3m9dsYGccezJrsAnoqW4y3VHcXF
	JmZYu3ORXxT4ahCXC6vgX2fXGMuL4cVx9XlE5pHdd06YQxLacmIpKQnIaDZZKaxn2DYV
	3usy28c1oNv+SiqmVK5MMk+ekNG2Jc+54O5PozkLBevTFSnWXna2TPdUG+/unfYGFypz
	T8gpjW3aiPYYth8gnVxAapoFaQoz3B5B1MmR9n6u2mNMD7ACpsvbeqq+4CK7mWQWiy+x
	t5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=UBI2pvvoE58G8/Hv3nCZF2XOhdj6XY9edaeJLNMnGP0=;
	b=ZUpl/2IjpZVBiVeOr/yltPh+ldsuqL9nwWb73T0sVbkm7FxAWV3MgwU0uZ3q+pDDH6
	ZHkuYvp6F9EaGyo/d1RgMbOkJqagmr3956H9qXf0iHu/2oDSZSH2cKpWJKInVgsKLmLC
	iM5HcR20UjO1IIT3nK73gjdBcTkKWnwX/zyAagXChQa8VwKdXmu1GFSyflshtJ5YoKel
	b+yi3g3Fi53SELwmTmGQRs1ca4dl4X7rOVuVHZ9vWi/SSbN1+J0WcGhKor57hzykBxAb
	wmSSeyvpSK3D/Jw39YpRfypuUiBDJzW5I0fUrDiVIL6HgqGozXrDxrgzqhLy6VXC/mq+
	LrtQ==
X-Gm-Message-State: AA+aEWaJAu2ETLPw2OWQKYchSp+4pDrs77ZommIqG6TB900V15y0vz8A
	QyJ0o5/4Lyxv9FWACT+6W15opVDN
X-Google-Smtp-Source: AFSGD/Wqy1/rGgXahLJ5BQSRIKTTwt+IgIcvzCSqhqciVxgMhV/dpkkUJNaoP8bRNBEUboQC0fkthA==
X-Received: by 2002:a65:4784:: with SMTP id e4mr10887808pgs.12.1543783249886; 
	Sun, 02 Dec 2018 12:40:49 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:8459:23c4:569c:71eb?
	([2601:202:4180:c33:8459:23c4:569c:71eb])
	by smtp.gmail.com with ESMTPSA id
	m198sm13539208pga.10.2018.12.02.12.40.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Dec 2018 12:40:49 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20181202191346.15104-1-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <eb3254e5-90c9-1bad-f187-0e95fe054e9e@gmail.com>
Date: Sun, 2 Dec 2018 12:40:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181202191346.15104-1-raj.khem@gmail.com>
Subject: Re: [meta-oe][PATCH 1/3] libvncserver: Update to latest version
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
X-List-Received-Date: Sun, 02 Dec 2018 20:40:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/2/18 11:13 AM, Khem Raj wrote:
> From: Eddie James <eajames@linux.ibm.com>
>
> The latest release of libvncserver is almost two years old. A number of
> security fixes and enhancements have recently been committed. Since the repo
> is stable, point the recipe to the latest commit.
>
> libvncserver switched from autotools to cmake, so update the recipe as
> necessary, and add PACKAGECONFIG options to allow a more minimal build and
> install.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../libvncserver/libvncserver_0.9.11.bb       | 25 -------------------
>  .../libvncserver/libvncserver_git.bb          | 23 +++++++++++++++++
>  2 files changed, 23 insertions(+), 25 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
>  create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
>
> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
> deleted file mode 100644
> index 38dac06e64..0000000000
> --- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -DESCRIPTION = "library for easy implementation of a RDP/VNC server"
> -HOMEPAGE = "https://libvnc.github.io"
> -SECTION = "libs"
> -PRIORITY = "optional"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
> -
> -DEPENDS += "zlib libsdl jpeg libpng gtk+ libgcrypt nettle gnutls gmp"
> -
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
> -PACKAGECONFIG[systemd] = ",,systemd"
> -
> -RDEPENDS_${PN} += "libpng gtk+ libgcrypt"
> -
> -inherit distro_features_check autotools binconfig pkgconfig
> -
> -REQUIRED_DISTRO_FEATURES = "x11"

X11 was dropped. is it handled in some on the fashion?

- armin


> -
> -SRC_URI = "https://github.com/LibVNC/libvncserver/archive/LibVNCServer-${PV}.tar.gz"
> -SRC_URI[md5sum] = "7f06104d5c009813e95142932c4ddb06"
> -SRC_URI[sha256sum] = "193d630372722a532136fd25c5326b2ca1a636cbb8bf9bb115ef869c804d2894"
> -
> -S = "${WORKDIR}/${BPN}-LibVNCServer-${PV}"
> -
> -TARGET_LDFLAGS += "-lgcrypt"
> diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> new file mode 100644
> index 0000000000..25917756fc
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "library for easy implementation of a RDP/VNC server"
> +HOMEPAGE = "https://libvnc.github.io"
> +SECTION = "libs"
> +PRIORITY = "optional"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
> +
> +PACKAGECONFIG ??= "gcrypt gnutls jpeg png ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} sdl zlib"
> +PACKAGECONFIG[gcrypt] = ",,libgcrypt,libgcrypt"
> +PACKAGECONFIG[gnutls] = ",,gnutls"
> +PACKAGECONFIG[jpeg] = ",-DWITH_JPEG=OFF,jpeg"
> +PACKAGECONFIG[openssl] = ",,openssl"
> +PACKAGECONFIG[png] = ",-DWITH_PNG=OFF,libpng,libpng"
> +PACKAGECONFIG[systemd] = ",,systemd"
> +PACKAGECONFIG[sdl] = ",,libsdl2"
> +PACKAGECONFIG[zlib] = ",,zlib"
> +
> +inherit cmake
> +
> +SRC_URI = "git://github.com/LibVNC/libvncserver"
> +SRCREV = "f997b5a75fa171d79c5e568b7157fba83c8d8355"
> +
> +S = "${WORKDIR}/git"


