Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OawpV-00089B-IS
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 22:21:35 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OawpN-0001kV-TG
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 21:20:41 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1279527857-12295-1-git-send-email-raj.khem@gmail.com>
References: <1279527857-12295-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 19 Jul 2010 21:20:52 +0100
Message-ID: <1279570852.21888.123.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sane-toolchain.inc: THUMB_INTERWORK should not be defined for armv4 and add armv4 to ARM EABI supporting architectures.
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
X-List-Received-Date: Mon, 19 Jul 2010 20:21:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-07-19 at 01:24 -0700, Khem Raj wrote:
>  	import bb
>  	arm_eabi_supporting_arches = "armv6 armv6-novfp \
> -	armv5te iwmmxt armv7a armv7 armv5teb armv4t"
> +	armv5te iwmmxt armv7a armv7 armv5teb armv4t armv4"
>  	ppc_spe_supporting_arches = "ppce500v2 ppce500"

I guess it would make more sense to enumerate here the ARM arches which
don't support eabi.  All future ones will, presumably, so it's only
ARMv3 and older which don't.  That way we won't have to keep adjusting
this list for every new architecture variant that someone thinks up.

p.




