Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id E5C506B8D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 07:28:54 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id u9-v6so808554wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2018 23:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LJGNreAEseOKR0U+3mhtB4pgJrqaFYZy31ZhYwYzPKE=;
	b=JVa9sm5wVZ7S+lHNSjOasUprmiomE/adtKyTtO8+l1vs0kigyorwAscGVppqS6l5bs
	ffQhH3+dWhGWpYOZkKisy96BALI6dMXjgnA3PToyAkBW09l5UF5dI/oo4p+brC4tjZoM
	DcDN7uhFqFUtlDleFESQtU2lbrBpNILWQLR98xSnLX+F1nLnE8Bl78MhQvikCgWjMrku
	oYjcDrvwefGjKQQWQZZL4qBLQ/yqa97oMlPXflRLvN5BxkPlpaFpBxx1DDKo2GfTdGW/
	+DmRNvSdSxiHLdpCi2A4JkjgXAkphaguul3y1jlGjJ7U/SKXvfWQ2YBVp0TdNHZ+k18g
	9P5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LJGNreAEseOKR0U+3mhtB4pgJrqaFYZy31ZhYwYzPKE=;
	b=KyKeXz7791Wje2fqas3ptwQFsLF9TIE4p9Dc9tghw1BetAM9wzA7MHY+1xYSy9Zx/D
	htsFUsaTxTo0lwQPV8zFZ8pp4rqMw9tqgYPnsDKLXeQlGOqRCaFGxQ4cg6FXAkBNd+Vz
	V5Qj2N1ynFhfmncDILkjMIOMnXjRlLs9IqDRdyUyOWde6XBLFk4/bHRAkhzvmfqSn7Va
	rmrQMJIZ0lYj+HSTZvBgY8ZFz1mvEhGPCLSIV6se62zfokOc/BAiER2MVHuww5nnkANd
	x/vZzkhWEaSBCaOEIpLQao4pMmO9tb6DrTUahRofJEaz1Ex+4hRslsx/WH+n+IWHGC1s
	yNWQ==
X-Gm-Message-State: AA+aEWarwSJEreHbW/lkZrLKeMVJOnVRKbvNwOjGg643ZqOCrfTYtbzE
	oE2gvjNb+dy9TMEX1HMCiUYHXfCZPwjUtukTb1AFkfKp
X-Google-Smtp-Source: AFSGD/UrLHfhjah2cXKV3FLVu2xc+C3tIQuwG1OGXskkQy11me7X67OPevOvTz8bkXjtghbwXsgjajTiZhWV5tvKcSs=
X-Received: by 2002:adf:da41:: with SMTP id r1-v6mr860839wrl.129.1542698935431;
	Mon, 19 Nov 2018 23:28:55 -0800 (PST)
MIME-Version: 1.0
References: <1542696483-278773-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1542696483-278773-1-git-send-email-changqing.li@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 20 Nov 2018 08:28:43 +0100
Message-ID: <CA+chaQfK8BxE=7yh9CtbeOk5rO-Tg1siLePbfZ8C3Vh+_fk42Q@mail.gmail.com>
To: changqing.li@windriver.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] geoip: add downloadfilename for geoip database files
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
X-List-Received-Date: Tue, 20 Nov 2018 07:28:55 -0000
Content-Type: text/plain; charset="UTF-8"

Looks, good.

Adding variable for 20181120 might help with maintenance (if we need to
change just checksums in future). And with good variable name (or a
comment) it would also document in the recipe why we're using this in
downloadfilename.

On Tue, Nov 20, 2018 at 7:48 AM <changqing.li@windriver.com> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> previous change of checksum don't trigger archive to re-downloaded,
> , which will cause checksum mismatch. add downloadfilename to
> trigger re-download.
>
> 1. for user with PREMIRROR, another benefit is it can still compile
> success event upstream checksum change frequently.
> 2. but for user don't use PREMIRROR, if upstream checksum changed,
> still might have checksum mismatch problem.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../recipes-support/geoip/geoip_1.6.12.bb          | 24
> +++++++++++-----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> index 1e1a7ff..57f0b67 100644
> --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> @@ -9,10 +9,10 @@ HOMEPAGE = "http://dev.maxmind.com/geoip/"
>  SECTION = "libdevel"
>
>  SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
> -
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat
> \
> -
> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat
> \
> -
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat
> \
> -
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat
> \
> +
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.20181120.gz
> \
> +
> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.20181120.gz
> \
> +
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.20181120.gz
> \
> +
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.20181120.gz
> \
>             file://run-ptest \
>  "
>  SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
> @@ -20,14 +20,14 @@ SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
>  SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
>  SRC_URI[GeoIP-dat.sha256sum] =
> "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
>
> -SRC_URI[GeoIPv6-dat.md5sum] = "00dc3b3f53eb5f7bf6915f939998f12c"
> -SRC_URI[GeoIPv6-dat.sha256sum] =
> "e72221fc630094d7256521b307e9142fb77d2167a27de2c11da536a2ba1d1480"
> +SRC_URI[GeoIPv6-dat.md5sum] = "a908d7a51c3883eb8f693ca197c7a142"
> +SRC_URI[GeoIPv6-dat.sha256sum] =
> "1b06e34eed2c539606a9ab4d97b2140ac80bf9f528d16ad2e3831c75014c2710"
>
>  SRC_URI[GeoLiteCity-dat.md5sum] = "d700c137232f8e077ac8db8577f699d9"
>  SRC_URI[GeoLiteCity-dat.sha256sum] =
> "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
>
> -SRC_URI[GeoLiteCityv6-dat.md5sum] = "7f6333d433d8127181ea3c5828287c98"
> -SRC_URI[GeoLiteCityv6-dat.sha256sum] =
> "c339e20cdf326c18aa3571bcd27845e6daf41ca5bfe9401bc472908aaeb42ac7"
> +SRC_URI[GeoLiteCityv6-dat.md5sum] = "8ac3506ccabaae7e9f7d6301c2654313"
> +SRC_URI[GeoLiteCityv6-dat.sha256sum] =
> "1c5fced1657d09448b3ecc14b65c9536228a627d93ed4159d3438b2c6faa8506"
>
>  LICENSE = "LGPL-2.1"
>
> @@ -44,10 +44,10 @@ EXTRA_OECONF = "--disable-static               \
>  do_install() {
>      make DESTDIR=${D} install
>      install -d ${D}/${datadir}/GeoIP
> -    install ${WORKDIR}/GeoIP.dat ${D}/${datadir}/GeoIP/
> -    install ${WORKDIR}/GeoIPv6.dat ${D}/${datadir}/GeoIP/
> -    install ${WORKDIR}/GeoLiteCity.dat ${D}/${datadir}/GeoIP/
> -    install ${WORKDIR}/GeoLiteCityv6.dat ${D}/${datadir}/GeoIP/
> +    install ${WORKDIR}/GeoIP.dat.20181120 ${D}/${datadir}/GeoIP/GeoIP.dat
> +    install ${WORKDIR}/GeoIPv6.dat.20181120
> ${D}/${datadir}/GeoIP/GeoIPv6.dat
> +    install ${WORKDIR}/GeoLiteCity.dat.20181120
> ${D}/${datadir}/GeoIP/GeoLiteCity.dat
> +    install ${WORKDIR}/GeoLiteCityv6.dat.20181120
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

