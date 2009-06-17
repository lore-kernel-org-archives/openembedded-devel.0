Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1MH1e3-0003rX-Bg
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 22:22:07 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id CA23FDB016A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2009 22:11:39 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E9742DB013E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2009 22:11:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (g225074123.adsl.alicedsl.de
	[92.225.74.123]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2009 22:11:38 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 2448D3C222; Wed, 17 Jun 2009 22:11:38 +0200 (CEST)
Date: Wed, 17 Jun 2009 22:11:38 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090617201137.GB7801@mail.familie-heinold.de>
References: <1245268393-14247-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1245268393-14247-1-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.19 (2009-01-05)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH] kernel.bbclass: fix staging for x86 kernels
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
X-List-Received-Date: Wed, 17 Jun 2009 20:22:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 17, 2009 at 11:53:13PM +0400, Roman I Khimov wrote:
> ---
>  classes/kernel.bbclass |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index ef16669..e3bb890 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -103,6 +103,10 @@ kernel_do_stage() {
>  		cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
>  		install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}/include
>  		cp -fR arch/${ARCH}/* ${STAGING_KERNEL_DIR}/arch/${ARCH}/	
> +	elif [ -e arch/x86/include/asm/ ]; then
> +		cp -fR arch/x86/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
> +		install -d ${STAGING_KERNEL_DIR}/arch/x86/include
> +		cp -fR arch/x86/* ${STAGING_KERNEL_DIR}/arch/x86/
>  	fi
>  	rm -f $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
>  	ln -sf $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
> -- 
> 1.6.3.1

Could you please try this patch with the following setting:

MACHINE = "wrap"

Bye Henning


