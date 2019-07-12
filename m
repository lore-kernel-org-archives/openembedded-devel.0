Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5267E7E5F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 06:13:30 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id r6so5640021qkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 23:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sxtJuLc/kwfGG/v/m7asCG18l2X+71xYGHnHlhYxzPU=;
	b=SmeHkzjlrhyXBjUS5ya4OU3Du4LCvBRrHgGG03wQ5xaVILCBk7R7xhgjE8t4qt65GX
	9K5VG7upugFMkgqbXNoAFexVL6wglYsBEIH8YVTwqz6vSBJCIFTeuh0pXQp07gzb8hB5
	WhZFfrj/TH9l7tJ8tf9lBeRBwoPAImZqjYyO9FdjCWbMvD++Zta8BiSAC1nEXBGt1uz+
	H6GR4ifLLnWG5zI/ALad0e4IrUSjXGH/LWjsbWqRuFPJknCzmRxnlLn0zoHO31Uq76Ro
	DspEtyJy01HbIvwKrDD5ypBvvHJVRiy8laHjaEnVN5uW5ntSmRslxGXjuBGjTv3pYEqF
	Z/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sxtJuLc/kwfGG/v/m7asCG18l2X+71xYGHnHlhYxzPU=;
	b=BP+0/jhQmMRPmX6l5BQOgGOv/N0CgPsmN4YfHE6IRBWrkUgnR3enTTG5HwUVX4jmZ9
	O4pTSzd76XKmyq8AKbtJlCRHfxgczXK2nNquOVE5bWvIv07zGaqMKSMrZqMhH48WX72H
	aihpYePzeD6sJhtEnQW8s3nCCXEve5WO7gal2MT9ywAjluk1jxuTNaHmw+E+2KVhR9yR
	T1/PrwhaGLKzKoAiKSRdrZGIV1I7UOxrGzcK0x7GP/Eaq9aEeOn1KX3CjbW+uvlRZ4rl
	lhuOzwnMAWhxncti7TjK5gnLdAYpqaNGVeh8urQ5VyoeWBo4ZOikZQBaGfw9sXZpVlbV
	1aPQ==
X-Gm-Message-State: APjAAAUHaSgK4ygU++SqrxT8Xo8ugINFiNqBi9ATO758lvKia5yTJ8ge
	1jjE5CmcNKbljOylM/LHnWIcnDrPwsc/U/TgrHo=
X-Google-Smtp-Source: APXvYqxeEV0dnX6IIDDZbjPkseq15o5eo2DVTInVbK7ifL7Rqf5tmnXUXwtuD6JFtiRNps3skzg7IzV4/6FtyhMnoks=
X-Received: by 2002:ae9:f101:: with SMTP id k1mr4949939qkg.337.1562912010848; 
	Thu, 11 Jul 2019 23:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190625205516.16072-1-open.source@oleksandr-kravchuk.com>
	<D55698ECEC159B488D62A508E18D7FEC124BEEAB@ATNETS9912WMSX.ww300.siemens.net>
In-Reply-To: <D55698ECEC159B488D62A508E18D7FEC124BEEAB@ATNETS9912WMSX.ww300.siemens.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Jul 2019 23:13:04 -0700
Message-ID: <CAMKF1sruh5+Uy1f8useibqbossecsftyG7Bk-Gf4B2SOCnJJqw@mail.gmail.com>
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH v2][meta-networking] dhcpcd: update to 7.2.2
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
X-List-Received-Date: Fri, 12 Jul 2019 06:13:30 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Oleksandr

It fails to build on mips see
https://errors.yoctoproject.org/Errors/Details/251424/

I wonder if udev has something to do here

On Tue, Jun 25, 2019 at 11:30 PM Valek, Andrej <andrej.valek@siemens.com> wrote:
>
> Hi Oleksandr!
>
> You have removed udev from default configuration. Because if udev is not in PACKAGECONFIG anymore, '--without-udev' will be passed as parameter in configure step.
>
> There are multiple options how to do that.
> 1. put 'udev' into DEPENDS, RDEPENDS and put '--with-udev' into EXTRA_OECONF
>  - missing option to disable it
> 2. keep 'udev' in PACKAGECONFIG
>  - will be enabled automatically while is not explicitly overridden by another PACKAGECONFIG
>
> I prefer an option 2. . Udev will be enabled by default with option to disable it.
>
> Regards,
> Andrej
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-devel-bounces@lists.openembedded.org> On Behalf Of Oleksandr Kravchuk
> Sent: Tuesday, June 25, 2019 10:55 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> Subject: [oe] [PATCH v2][meta-networking] dhcpcd: update to 7.2.2
>
> udev is now enabled by default and is always requested.
>
> License checksum changed due to modified copyright year.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../dhcpcd/{dhcpcd_7.0.8.bb => dhcpcd_7.2.2.bb}        | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)  rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_7.0.8.bb => dhcpcd_7.2.2.bb} (70%)
>
> diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
> similarity index 70%
> rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
> rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
> index 84c3db7a5..e2759f47a 100644
> --- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
> +++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
> @@ -5,18 +5,16 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your computer  HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
>
>  LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1e8f17e4edcccc38152ccf60374e0f89"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0531457992a97ecebc6975914a874a9d"
>
>  SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
> -
> -SRC_URI[md5sum] = "77bbb1d73b6f30d6ddcc8b0fd3eae266"
> -SRC_URI[sha256sum] = "96968e883369ab4afd11eba9dfd9bb109f5dfff65b2814ce6c432f36362dc9b5"
> -
>  SRC_URI += "file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
> +SRC_URI[md5sum] = "2f17034432ea10415ee84a97ef131128"
> +SRC_URI[sha256sum] = "3db7ff18cba9274da1d2176fb3c7cbe23926a8e58d5c8e244ad55c62d38ba09e"
>
>  inherit autotools-brokensep
>
> -PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>
>  PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
>  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

