Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PjHLK-0007ls-Bu
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 21:24:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 6DCCC314D4C0;
	Sat, 29 Jan 2011 21:23:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id j18K-8KSEoVZ; Sat, 29 Jan 2011 21:23:26 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 116E2314D4C9;
	Sat, 29 Jan 2011 21:23:26 +0100 (CET)
Message-ID: <4D44773D.5010103@opendreambox.org>
Date: Sat, 29 Jan 2011 21:23:25 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110128 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Paul Menzel <paulepanter@users.sourceforge.net>
References: <1296316693.5925.10.camel@mattotaupa>
In-Reply-To: <1296316693.5925.10.camel@mattotaupa>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [REGRESSION] omap3-sgx-modules: `NOTE: Runtime target 'kernel-' is unbuildable, removing...`
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
X-List-Received-Date: Sat, 29 Jan 2011 20:24:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/29/2011 04:58 PM, Paul Menzel wrote:
> Dear Andreas and OE folks,
> 
> 
>         commit 2dac84b9a7b820466ed626420fec120093b56e16
>         Author: Andreas Oberritter <obi@opendreambox.org>
>         Date:   Sat Jan 29 00:51:25 2011 +0000
>         
>             module.bbclass: depend on kernel-${KERNEL_VERSION} instead of kernel (= ${KERNEL_VERSION})
>             
>             * As a special case, kernel modules must depend on
>               kernel-${KERNEL_VERSION}, which gets runtime provided by the kernel
>               package. The reason is, that the package version can be different
>               from ${KERNEL_VERSION}, because the latter depends on the kernel
>               configuration, e.g. CONFIG_LOCALVERSION.
>             
>             Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> 
> [1] seems to have broken `omap3-sgx-modules`.

Hello Paul,

thanks! It's a known bug. Can you please test this patch, while I'm
waiting for an ack or nack for it?

http://patches.openembedded.org/patch/402/

Is there a maintainer for kernel.bbclass?

If there's no feedback, and if nobody's faster, I'll revert the commits
tomorrow.

Regards,
Andreas


