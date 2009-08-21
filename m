Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MeJTY-0003XO-NG
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Aug 2009 04:03:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id D6129543A2A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 21:46:11 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12975-08 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 20 Aug 2009 21:46:11 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id A92F43BE448
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 21:46:11 -0400 (EDT)
Date: Thu, 20 Aug 2009 21:46:11 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1241617115-21929-1-git-send-email-msmith@cbnco.com>
Message-ID: <Pine.LNX.4.64.0908202146030.3621@juice.ott.cti.com>
References: <1241617115-21929-1-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] kernel.bbclass: stage more include files for x86 in	2.6.27+
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
X-List-Received-Date: Fri, 21 Aug 2009 02:03:32 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

OK to commit?

On Wed, 6 May 2009, Michael Smith wrote:

> Some packages include <linux/types.h>, which requires <asm/types.h>.
> Supplement b6220af33a70d96345dea130005ce842eeadfdf5 to copy files
> from arch/x86/include/asm to include/asm-x86.
> 
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>  classes/kernel.bbclass |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 954c407..2153424 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -102,8 +102,15 @@ kernel_do_stage() {
>  		cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
>  		install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}/include
>  		cp -fR arch/${ARCH}/* ${STAGING_KERNEL_DIR}/arch/${ARCH}/	
> +
> +	# Check for arch/x86 on i386
> +	elif [ -d arch/x86/include/asm/ ]; then
> +		cp -fR arch/x86/include/asm/* ${STAGING_KERNEL_DIR}/include/asm-x86/
> +		install -d ${STAGING_KERNEL_DIR}/arch/x86/include
> +		cp -fR arch/x86/* ${STAGING_KERNEL_DIR}/arch/x86/
>  	fi
> -	rm -f $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
> +
> +	rm -f ${STAGING_KERNEL_DIR}/include/asm
>  	ln -sf $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
>  
>  	mkdir -p ${STAGING_KERNEL_DIR}/include/asm-generic
> -- 
> 1.5.6.5
> 


