Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 81B8A6E630
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 02:24:04 +0000 (UTC)
Received: by iodd187 with SMTP id d187so68007178iod.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Aug 2015 19:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=0kKlKIKQW9ptwI4V2ZPw7+J7a7hecAkOp2HLRDb+An4=;
	b=VXid8dCDZpkhoN4eYMjLKTfezZRePa25AV719Rw0a7kCm5l4u0NdEUi08W22zgBTsS
	ex6q64MiAZW34DKGLZE9Od+0+Xs4wqvMA3v51Ck0BkJKOmuzr5b6bQYF2Jfe06Qt4Qwp
	DKkaa5XuJm9nsIUNaN/eZBAi53m4Rmjr0pyShOTkCWFUEhU9k820f21TBHJv0jBcgMow
	oFUSZ5AF/6v418VMrGcJQdaECJ+BZhxK0ElixAgUw41ejYT6eSjKNph0bm5FPCE+nxJK
	KK/gIp8kFV9ZwtlbG8/d6fGNLBb2vtGG25JprHIdsqLvxGmDdyQcCYwf1RgIW8Abcjxb
	k2SA==
X-Received: by 10.107.34.194 with SMTP id i185mr12942813ioi.49.1438827844844; 
	Wed, 05 Aug 2015 19:24:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Wed, 5 Aug 2015 19:23:35 -0700 (PDT)
In-Reply-To: <1438824615-4091-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <20150805123908.GB2452@jama>
	<1438824615-4091-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Aug 2015 19:23:35 -0700
Message-ID: <CAMKF1soyQMz7YFO9-u3YGAqAJZ8+DO62of++izujH7Ae9eo+Cw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] geoip: upgrade 1.6.0 -> 1.6.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Aug 2015 02:24:05 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 6:30 PM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> *Modify SRC_URI.

why do switch to git instead of tarball ?

> *Modify chksum of file COPYING and LICENSE,since the context changed.

why did checksums change? you need to explain that

> But the LICENSE has not been changed.

in what way ?

>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../recipes-support/geoip/{geoip_1.6.0.bb => geoip_1.6.6.bb} | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>  rename meta-networking/recipes-support/geoip/{geoip_1.6.0.bb => geoip_1.6.6.bb} (84%)
>
> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb b/meta-networking/recipes-support/geoip/geoip_1.6.6.bb
> similarity index 84%
> rename from meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> rename to meta-networking/recipes-support/geoip/geoip_1.6.6.bb
> index f1b2aac..5037ae3 100644
> --- a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.6.bb
> @@ -8,15 +8,13 @@ using reverse DNS lookups."
>  HOMEPAGE = "http://dev.maxmind.com/geoip/"
>  SECTION = "libdevel"
>
> -SRC_URI = "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.tar.gz;name=tarball \
> +SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
>             http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat \
>             http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat \
>             http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat \
>             http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat \
>  "
> -
> -SRC_URI[tarball.md5sum] = "89f4cdfdab43f1d67364cd7c85bbe8ca"
> -SRC_URI[tarball.sha256sum] = "075a0c2815cd099e9ec35c9569db716a3fefcdbb6a10dbfa1ce7c6cd48d4a635"
> +SRCREV = "ed3f3e2b87fba05a8f2a5b9b1328e7d55be8bf30"
>
>  SRC_URI[GeoIP-dat.md5sum] = "37c84ead332dda0362a5ac7b049b72d4"
>  SRC_URI[GeoIP-dat.sha256sum] = "79ff1099e96c2dc1c2539c9a18aaa13a9afd085cae477df60d95f1644d42bc07"
> @@ -32,10 +30,10 @@ SRC_URI[GeoLiteCityv6-dat.sha256sum] = "eda67f4204ba9fa5204a53cdb629167cca9394c7
>
>  LICENSE = "LGPL-2.1"
>
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d5d53d6b948c064f4070183180a4fa89 \
> -                    file://LICENSE;md5=f04db71812ba70aaba8b38da91984cd2 "
> +LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad \
> +                    file://LICENSE;md5=0388276749a542b0d611601fa7c1dcc8 "
>
> -S = "${WORKDIR}/GeoIP-1.6.0"
> +S = "${WORKDIR}/git"
>
>  inherit autotools
>
> --
> 1.8.4.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

