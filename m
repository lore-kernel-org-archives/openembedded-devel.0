Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OMQr7-0003Rw-1r
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 21:22:29 +0200
Received: from jost.swaffham-prior.co.uk ([217.154.114.20]
	helo=[192.168.114.10])
	by crown.reciva.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OMQmu-0004cp-AF
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 20:18:08 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100609185240.GP14941@mx.loc>
References: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
	<1276103437-2755-4-git-send-email-rep.dot.nop@gmail.com>
	<1276109098.4424.9.camel@lenovo.internal.reciva.com>
	<20100609185240.GP14941@mx.loc>
Date: Wed, 09 Jun 2010 20:18:13 +0100
Message-ID: <1276111093.4424.21.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Wed, 09 Jun 2010 19:22:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-06-09 at 20:52 +0200, Bernhard Reutner-Fischer wrote:
> On Wed, Jun 09, 2010 at 07:44:58PM +0100, Phil Blundell wrote:
> >On Wed, 2010-06-09 at 19:10 +0200, Bernhard Reutner-Fischer wrote:
> >> diff --git a/recipes/busybox/busybox-1.15.3/micro/defconfig b/recipes/busybox/busybox-1.15.3/micro/defconfig
> >> index 8431d19..f6eaa6d 100644
> >> --- a/recipes/busybox/busybox-1.15.3/micro/defconfig
> >> +++ b/recipes/busybox/busybox-1.15.3/micro/defconfig
> >> @@ -608,7 +608,7 @@ CONFIG_TIME=y
> >>  #
> >>  # Networking Utilities
> >>  #
> >> -CONFIG_FEATURE_IPV6=y
> >> +# CONFIG_FEATURE_IPV6 is not set
> >>  CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
> >>  # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
> >>  # CONFIG_ARP is not set
> >
> >This change doesn't look very desirable to me.  What's the reason for
> >it?
> 
> As long as you don't have ipv6 in distro features somehow, ipv6 will
> not be available. See introductory message of this series.

Ah, so you're saying that ipv6 is missing from micro's DISTRO_FEATURES?
If that's the case then it's just a bug: presumably it's been harmless
in the past because very few packages care about it.  Irrespective of
that, the intended behaviour is that micro should be IPv6-enabled and
turning it off in busybox does not seem like a good idea.

Actually, a quick "grep -ri ipv6" in conf/distro didn't turn up any
matches at all, so enabling IPv6 by DISTRO_FEATURES doesn't seem to be
terribly well entrenched at the moment.  If it were to be introduced
then I suspect it would need to be a negative property (i.e. the feature
would be "no ipv6") in order to not break all the existing distros.

p.





