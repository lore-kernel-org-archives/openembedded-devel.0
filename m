Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1KMDap-0002Ns-Lo
	for openembedded-devel@openembedded.org; Fri, 25 Jul 2008 05:03:44 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20080725030223.GCKI6482.fed1rmmtao103.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 23:02:23 -0400
Received: from localhost ([68.230.56.208]) by fed1rmimpo03.cox.net with bizsmtp
	id u32N1Z00M4VZ64s0432N2S; Thu, 24 Jul 2008 23:02:23 -0400
Date: Thu, 24 Jul 2008 20:02:22 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080725030222.GC4715@smtp.west.cox.net>
References: <4889169C.7040108@gmx.de>
MIME-Version: 1.0
In-Reply-To: <4889169C.7040108@gmx.de>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: RFC: kernel.bbclass and collie changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 25 Jul 2008 03:03:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 25, 2008 at 01:56:12AM +0200, Thomas Kunze wrote:

[snip]
> ============================================================
>  	
> +		if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
> +        		size=`ls -l arch/${ARCH}/boot/${KERNEL_IMAGETYPE} | awk '{ print $5}'`

I've got a bug and patch (4450) to fix the other instance of this,
please use ${KERNEL_OUTPUT} instead.

-- 
Tom Rini


