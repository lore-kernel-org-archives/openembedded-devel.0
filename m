Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OcGqu-0006gX-M7
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 13:55:46 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OcGqf-0000nH-RC
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 12:55:29 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OcGqf-00050B-JA
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 12:55:29 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1279752241-21656-1-git-send-email-raj.khem@gmail.com>
References: <1279752241-21656-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 23 Jul 2010 12:55:29 +0100
Message-ID: <1279886129.2692.39.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] distro: Add new feature to indicate thumb-interworking.
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
X-List-Received-Date: Fri, 23 Jul 2010 11:55:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-07-21 at 15:44 -0700, Khem Raj wrote:
> +# Add thumb-interwork to feature list if selected machine supports it.
> +DISTRO_FEATURES += ' ${@["", "thumb-interwork"][bb.data.getVar('THUMB_INTERWORK', d, 1) == "yes"]}'

Would it not be better to put this in some generic place (maybe even
bitbake.conf) rather than adding it to every DISTRO individually?

> --- a/conf/distro/include/slugos.inc
> +++ b/conf/distro/include/slugos.inc
> @@ -23,9 +23,18 @@ DISTRO_VERSION ?= "${SLUGOS_VERSION}${DISTRO_REVISION}-${DISTRO_TYPE}"
>  # DISTRO_FEED ?= "${SLUGOS_VERSION}-${DISTRO_TYPE}"
>  DISTRO_FEED ?= "unstable"
>  
> +THUMB_INTERWORK = "yes"
> +# "yes" "no"
> +#    Whether to compile with code to allow interworking between the two
> +#    instruction sets.  This allows thumb code to be executed on a primarily
> +#    arm system and vice versa.  It is strongly recommended that DISTROs not
> +#    turn this off - the actual cost is very small.
>  # We want images supporting the following features (for task-base)
>  DISTRO_FEATURES = "nfs smbfs wifi ppp alsa bluetooth ext2 vfat irda pcmcia usbgadget usbhost pci"

Is this a policy change for slugos?  If so, are the SlugOS people happy
with it?

p.



