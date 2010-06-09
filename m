Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OMQKw-00077F-2H
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 20:49:15 +0200
Received: from jost.swaffham-prior.co.uk ([217.154.114.20]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1OMQGi-0004L4-RG; Wed, 09 Jun 2010 19:44:52 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1276103437-2755-4-git-send-email-rep.dot.nop@gmail.com>
References: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
	<1276103437-2755-4-git-send-email-rep.dot.nop@gmail.com>
Date: Wed, 09 Jun 2010 19:44:58 +0100
Message-ID: <1276109098.4424.9.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] busybox: picking IPv6 per default is not up to the package
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
X-List-Received-Date: Wed, 09 Jun 2010 18:49:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-06-09 at 19:10 +0200, Bernhard Reutner-Fischer wrote:
> diff --git a/recipes/busybox/busybox-1.15.3/micro/defconfig b/recipes/busybox/busybox-1.15.3/micro/defconfig
> index 8431d19..f6eaa6d 100644
> --- a/recipes/busybox/busybox-1.15.3/micro/defconfig
> +++ b/recipes/busybox/busybox-1.15.3/micro/defconfig
> @@ -608,7 +608,7 @@ CONFIG_TIME=y
>  #
>  # Networking Utilities
>  #
> -CONFIG_FEATURE_IPV6=y
> +# CONFIG_FEATURE_IPV6 is not set
>  CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
>  # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
>  # CONFIG_ARP is not set

This change doesn't look very desirable to me.  What's the reason for
it?

p.




