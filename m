Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1QC91D-0004Og-Ru
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 13:22:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 55FEA315044D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 13:20:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Rt9Ai+GpM+Nh
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 13:20:27 +0200 (CEST)
Received: from [172.22.22.61] (drms-590cf9dc.pool.mediaWays.net
	[89.12.249.220])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 55383315044B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 13:20:27 +0200 (CEST)
Message-ID: <4DAD6FF9.8040700@opendreambox.org>
Date: Tue, 19 Apr 2011 13:20:25 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110411 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1302996247.3122.32.camel@utx.lan>
In-Reply-To: <1302996247.3122.32.camel@utx.lan>
Subject: Re: [PATCH 2/5] pkgconfig.bbclass: search configs in D instead of S
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
X-List-Received-Date: Tue, 19 Apr 2011 11:22:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/17/2011 01:24 AM, Stanislav Brabec wrote:
> Searching for .pc files in S makes more problems than it
> brings benefits. Searching in the installed root seems to be more
> logical.
> 
> Fixes possible subtle breakages:
> - .pc files populated with a different name that upstream intended
> - populated .pc files files that were not intended to be populated

This has already been fixed with commit
c2c8fe4c5629add94bd0b922f5b3446624a9f4d8.

> Signed-off-by: Stanislav Brabec <utx@penguin.cz>
> 
> diff --git a/classes/pkgconfig.bbclass b/classes/pkgconfig.bbclass
> index d96b708..00298ca 100644
> --- a/classes/pkgconfig.bbclass
> +++ b/classes/pkgconfig.bbclass
> @@ -14,7 +14,7 @@ SYSROOT_PREPROCESS_FUNCS += "pkgconfig_sysroot_preprocess"
>  
>  pkgconfig_sysroot_preprocess () {
>  	install -d ${SYSROOT_DESTDIR}${PKG_CONFIG_DIR}
> -	for pc in `find ${S} -name '*.pc' -type f | grep -v -- '-uninstalled.pc$'`; do
> +	for pc in `find ${D} -name '*.pc' -type f`; do
>  		pcname=`basename $pc`
>  		if [ ! -f ${SYSROOT_DESTDIR}${PKG_CONFIG_DIR}/$pcname ]; then
>  			oenote "$pcname was not installed."
> 

This function just prints a warning, if it finds a .pc file that didn't
get installed. Using ${D} at this point makes this function a no-op.

It might be better to just remove it completely.

Regards,
Andreas



