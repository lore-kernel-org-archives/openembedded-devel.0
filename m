Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MBd2z-0003vZ-5u
	for openembedded-devel@openembedded.org; Wed, 03 Jun 2009 01:05:33 +0200
Received: (qmail 27461 invoked from network); 2 Jun 2009 22:56:39 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 2 Jun 2009 15:56:39 -0700
Date: Tue, 2 Jun 2009 15:56:38 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090602224552.GH26065@smtp.west.cox.net>
References: <1243981798-11167-1-git-send-email-GNUtoo@no-log.org>
	<1243981798-11167-2-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
In-Reply-To: <1243981798-11167-2-git-send-email-GNUtoo@no-log.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] uclibc.inc : also exclude mips and mipsel from	GNU hash.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Jun 2009 23:05:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 03, 2009 at 12:29:58AM +0200, Denis 'Gnutoo' Carikli wrote:

Acked-by: Tom Rini <trini@embeddedalley.com>

> diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
> index f2f3e9b..a967954 100644
> --- a/recipes/uclibc/uclibc.inc
> +++ b/recipes/uclibc/uclibc.inc
> @@ -95,7 +95,7 @@ configmangle = 's,^KERNEL_SOURCE=.*,KERNEL_SOURCE="${KERNEL_SOURCE}",g; \
>  		s,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX="/lib",; \
>  		s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g; \
>  		${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y,;"][bb.data.getVar("USE_NLS", d, 1) == "yes"]} \
> -		${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) == "avr32"]} \
> +		${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) in ['mips', 'mipsel', 'avr32']]} \
>                 '
>  
>  CFLAGS := "${@oe_filter_out('-I\S+', '${CFLAGS}', d)}"
> -- 
> 1.6.0.6
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Tom Rini


