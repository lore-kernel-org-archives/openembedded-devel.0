Received: from mail.bubus.at (mail.bubus.at [81.19.156.191])
 by mx.groups.io with SMTP id smtpd.web11.6804.1589015615583340990
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 May 2020 02:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: g0hl1n.net, ip: 81.19.156.191, mailfrom: dev+oe@g0hl1n.net)
Received: from brokenbit (83-215-125-121.lhau.dyn.salzburg-online.at [83.215.125.121])
	by mail.bubus.at (Postfix) with ESMTPSA id E0CF66C20001;
	Sat,  9 May 2020 11:13:31 +0200 (CEST)
Date: Sat, 9 May 2020 11:13:25 +0200
From: ml+oe@g0hl1n.net
To: Robert Berger <oecore.mailinglist@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, richard.leitner@skidata.com,
	Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
Subject: Re: [oe] [meta-java][PATCH v2] icedtea7-native: host gcc-9, extra CFLAGS needed
Message-ID: <20200509091325.GA10958@brokenbit>
References: <20200508180832.8903-1-robert.berger@ReliableEmbeddedSystems.com>
MIME-Version: 1.0
In-Reply-To: <20200508180832.8903-1-robert.berger@ReliableEmbeddedSystems.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
thanks for the patch!

I've rebased it on current master and pushed it to master-next for
further testing!

regards;rl

On Fri, May 08, 2020 at 09:08:32PM +0300, Robert Berger wrote:
> From: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
> 
> Signed-off-by: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>
> ---
>  recipes-core/icedtea/icedtea7-native.inc | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
> index 8d0dc71..b9ad2bd 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -28,6 +28,11 @@ CXX_append = " -std=gnu++98"
>  # WORKAROUND: ignore errors from new compilers
>  CFLAGS_append = " -Wno-error=stringop-overflow -Wno-error=return-type"
>  
> +# oe.utils.get_host_compiler_version returns "gcc, 9.2" and we want -> "9"
> +HOST_COMPILER_MAJOR="${@oe.utils.get_host_compiler_version(d)[1].split(".", 2)[0]}"
> +# if compiler version 9 detected, add more CFLAGS
> +CFLAGS_append = " ${@oe.utils.conditional('HOST_COMPILER_MAJOR', '9', '-Wno-error=format-overflow', '', d)}"
> +
>  inherit native java autotools pkgconfig
>  inherit openjdk-build-helper
>  inherit python3native
> -- 
> 2.17.1
> 

> 

