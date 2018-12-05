Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E64BC6BCA4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 07:54:39 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r10so18543675wrs.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2018 23:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rxrrtbBz1EJ9Y9rX6KKciqwhX7M1BEQeOgiO3JgYKoE=;
	b=XUItswC5rLjzKDenZVRl/r8NVLdiIo+iE4AU8FZrkcQMo2hkbAD9n9yTHcEpIEKI2e
	zFsI8w++RTqhcNoxDDMelfisveH5Ut+aQeX92NP+MF4IvF5qHIMvyHzDPsPIFCdlhlsT
	pC+XUsEc95TdtISOB2HmXdnNCj1UpDatL+z5dJ85DDoc5gajzPZZgAj6ki02jOPao9E7
	mqT9ajqjK3p2oXkoYbVr3rBft1ia/N8hG/nkR2n6GKZiptK/7g3SGDr5Fv+5WjUDX8Qb
	mQk56ENnlH8drL+HzI+ZFA1ln/qPbTGmhtWqc9RWW6OpVAFMIkTdl+1CvKj1igQV0Rm7
	+YZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rxrrtbBz1EJ9Y9rX6KKciqwhX7M1BEQeOgiO3JgYKoE=;
	b=g/Ugm8wb6ZKJbEiZM+maESujWpQtG8RZ6Umq31+KgrelPWLhHfLMp6Mvp1cZ4VfcB8
	rsEht+kkWZ2p/nDHlUGQorlC57AimI2wo3DhKaJIzv2IdE2zWTNF3aGM/qm5i0AMdXJl
	85YsASSd80GcZhXHyTwzw+BaXtVnA3fKLZrj9TUeCw7wLO7V8QvRI7f7XYUWTFtsdl8C
	CPDfOVGcYtIqVHnoc4cHrMRP7/UfnuuexRmRqHX44vA8VhD+ltS7R0X+EgKVIZrGuzKL
	Xk9eU7wv5zZ5XFb3HcjXDGH5tZX9ghbKxpRPgLSq+Ydi1yXQdJN/BasEYrVAl/ZmR7FJ
	H6BA==
X-Gm-Message-State: AA+aEWaTuLe37vimYpfg6euVHO+ghRd/JdSjjvQ/m8X3oKxff0sJJlWm
	wGoVmoFn+fVR67HMeWxoGqUDhhmk0m0SMo0hbKI=
X-Google-Smtp-Source: AFSGD/XYjYcijHWk9YIQElqg+p0CiUMzgW+6o6T5KP697oPvNy4vE/H5ooo5hCbJI0C8rlHuvymdbRmdod9KzNkDTUE=
X-Received: by 2002:a5d:69c9:: with SMTP id s9mr21761018wrw.129.1543996479736; 
	Tue, 04 Dec 2018 23:54:39 -0800 (PST)
MIME-Version: 1.0
References: <1543976440-49415-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1543976440-49415-1-git-send-email-changqing.li@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 5 Dec 2018 08:54:26 +0100
Message-ID: <CA+chaQcipTLheevoTYK2=dBC6EBpR02k-5A2Nf+rdFpU=BhsGQ@mail.gmail.com>
To: changqing.li@windriver.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] geoip: update geolite database checksum
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
X-List-Received-Date: Wed, 05 Dec 2018 07:54:40 -0000
Content-Type: text/plain; charset="UTF-8"

What about using a variable for 20181205 as suggested before?

On Wed, Dec 5, 2018 at 3:21 AM <changqing.li@windriver.com> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> Geolite database checksum changed today, so update it
> to the lastest one.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../recipes-support/geoip/geoip_1.6.12.bb          | 24
> +++++++++++-----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> index 57f0b67..a63386c 100644
> --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> @@ -9,10 +9,10 @@ HOMEPAGE = "http://dev.maxmind.com/geoip/"
>  SECTION = "libdevel"
>
>  SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
> -
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.20181120.gz
> \
> -
> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.20181120.gz
> \
> -
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.20181120.gz
> \
> -
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.20181120.gz
> \
> +
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.20181205.gz
> \
> +
> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.20181205.gz
> \
> +
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.20181205.gz
> \
> +
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.20181205.gz
> \
>             file://run-ptest \
>  "
>  SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
> @@ -20,14 +20,14 @@ SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
>  SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
>  SRC_URI[GeoIP-dat.sha256sum] =
> "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
>
> -SRC_URI[GeoIPv6-dat.md5sum] = "a908d7a51c3883eb8f693ca197c7a142"
> -SRC_URI[GeoIPv6-dat.sha256sum] =
> "1b06e34eed2c539606a9ab4d97b2140ac80bf9f528d16ad2e3831c75014c2710"
> +SRC_URI[GeoIPv6-dat.md5sum] = "52d6aa0aac1adbfa5eb7fa4742197c11"
> +SRC_URI[GeoIPv6.sha256sum] =
> "416ac92fcc35a21d5efbb32e5c88e609c37aec1aa1af6247d088b8da1af6e9bf"
>
>  SRC_URI[GeoLiteCity-dat.md5sum] = "d700c137232f8e077ac8db8577f699d9"
>  SRC_URI[GeoLiteCity-dat.sha256sum] =
> "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
>
> -SRC_URI[GeoLiteCityv6-dat.md5sum] = "8ac3506ccabaae7e9f7d6301c2654313"
> -SRC_URI[GeoLiteCityv6-dat.sha256sum] =
> "1c5fced1657d09448b3ecc14b65c9536228a627d93ed4159d3438b2c6faa8506"
> +SRC_URI[GeoLiteCityv6-dat.md5sum] = "6734ccdc644fc0ba76eb276dce73d005"
> +SRC_URI[GeoLiteCityv6-dat.sha256sum] =
> "c95a9d2643b7f53d7abeed2114388870e13fbbad4653f450a49efa7e4b86aca4"
>
>  LICENSE = "LGPL-2.1"
>
> @@ -44,10 +44,10 @@ EXTRA_OECONF = "--disable-static               \
>  do_install() {
>      make DESTDIR=${D} install
>      install -d ${D}/${datadir}/GeoIP
> -    install ${WORKDIR}/GeoIP.dat.20181120 ${D}/${datadir}/GeoIP/GeoIP.dat
> -    install ${WORKDIR}/GeoIPv6.dat.20181120
> ${D}/${datadir}/GeoIP/GeoIPv6.dat
> -    install ${WORKDIR}/GeoLiteCity.dat.20181120
> ${D}/${datadir}/GeoIP/GeoLiteCity.dat
> -    install ${WORKDIR}/GeoLiteCityv6.dat.20181120
> ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
> +    install ${WORKDIR}/GeoIP.dat.20181205 ${D}/${datadir}/GeoIP/GeoIP.dat
> +    install ${WORKDIR}/GeoIPv6.dat.20181205
> ${D}/${datadir}/GeoIP/GeoIPv6.dat
> +    install ${WORKDIR}/GeoLiteCity.dat.20181205
> ${D}/${datadir}/GeoIP/GeoLiteCity.dat
> +    install ${WORKDIR}/GeoLiteCityv6.dat.20181205
> ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
>      ln -s GeoLiteCity.dat ${D}${datadir}/GeoIP/GeoIPCity.dat
>  }
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

