Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.12880.1596516767326190197
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 21:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.178.230, mailfrom: robert.joslyn@redrectangle.org)
Received: from bucephalus (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6FFC224000B;
	Tue,  4 Aug 2020 04:52:43 +0000 (UTC)
Message-ID: <4aa6319a96ccac1e54d0fd1ef8ec65751b7c449b.camel@redrectangle.org>
Subject: Re: [oe] [PATCH][meta-networking] kronosnet: inherit manpages
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>, 
	openembedded-devel@lists.openembedded.org
Date: Mon, 03 Aug 2020 21:52:40 -0700
In-Reply-To: <20200803172452.2360101-1-open.source@oleksandr-kravchuk.com>
References: <20200803172452.2360101-1-open.source@oleksandr-kravchuk.com>
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-08-03 at 19:24 +0200, Oleksandr Kravchuk wrote:
> Let manpages bbclass handle man pages.
> 
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../recipes-extended/kronosnet/kronosnet_1.18.bb            | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-networking/recipes-
> extended/kronosnet/kronosnet_1.18.bb b/meta-networking/recipes-
> extended/kronosnet/kronosnet_1.18.bb
> index 7b1dfc241..3fd6298b5 100644
> --- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.18.bb
> +++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.18.bb
> @@ -16,7 +16,7 @@ SRC_URI =
> "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1"
>  
>  UPSTREAM_CHECK_URI = "https://github.com/kronosnet/kronosnet/releases"
>  
> -inherit autotools
> +inherit autotools manpages
>  
>  S = "${WORKDIR}/git"
>  
> @@ -26,5 +26,5 @@ S = "${WORKDIR}/git"
>  CFLAGS_append_toolchain-clang = " -Wno-sign-compare"
>  
>  PACKAGECONFIG[man] = "enable_man="yes", --disable-man, "

To use the manpages class, you'll want to change the PACKAGECONFIG option
to "manpages". Unless there is some reason to do otherwise, I also suggest
using --enable-man along with --disable-man to be consistent:

PACKAGECONFIG[manpages] = "--enable-man,--disable-man"

There are still some errors in do_install when enabling this that you'll
need to look into as well if you want to enable man pages. For example:

| /home/robert/yocto/poky/build/tmp/hosttools/install: cannot stat
'../../git/man/knet_addrtostr.3': No such file or directory

Thanks,
Robert

> -
> -PACKAGECONFIG_remove = "man"
> +#
> +#PACKAGECONFIG_remove = "man"
> 


