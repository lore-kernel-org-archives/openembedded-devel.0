Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1P76nJ-0002wk-AX
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 15:27:29 +0200
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 93148EB065
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 15:26:49 +0200 (CEST)
X-SENDER-IP: [83.227.56.243]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AhUYAANFuUxT4zjzPGdsb2JhbAAHh2qLSI4FAQEBATW+F4VJBIpKhQJq
X-IronPort-AV: E=Sophos;i="4.57,340,1283724000"; d="scan'208";a="140665484"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.56.243])
	by ipb2.telenor.se with ESMTP; 16 Oct 2010 15:26:49 +0200
Message-ID: <4CB9A818.90909@atmel.com>
Date: Sat, 16 Oct 2010 15:26:48 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C9950D0.7000907@gmail.com>
In-Reply-To: <4C9950D0.7000907@gmail.com>
X-Enigmail-Version: 0.95.7
X-SA-Exim-Connect-IP: 195.54.99.196
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] at91bootstrap.inc: Mark COMPATIBLE_MACHINEs.
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
X-List-Received-Date: Sat, 16 Oct 2010 13:27:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Graham Gower skrev:
> From b90a9fef712cc934863ee786b2d2dedc37d6902d Mon Sep 17 00:00:00 2001
> From: Graham Gower <graham.gower@gmail.com>
> Date: Wed, 22 Sep 2010 09:39:00 +0930
> Subject: [PATCH 1/5] at91bootstrap.inc: Mark COMPATIBLE_MACHINEs.
> 
> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
>  recipes/at91bootstrap/at91bootstrap.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/at91bootstrap/at91bootstrap.inc b/recipes/at91bootstrap/at91bootstrap.inc
> index 2160f64..dfe143a 100644
> --- a/recipes/at91bootstrap/at91bootstrap.inc
> +++ b/recipes/at91bootstrap/at91bootstrap.inc
> @@ -1,6 +1,7 @@
>  DESCRIPTION = "at91bootstrap: loaded into internal SRAM by AT91 BootROM"
>  SECTION = "bootloaders"
>  
> +COMPATIBLE_MACHINE = "(afeb9260|at91cap9adk|at91sam9g20ek|at91sam9rlek|at91sam9263ek|at91sam9260ek|at91sam9xeek|at91sam9261ek)"
>  SRC_URI = "ftp://www.at91.com/pub/buildroot/${PN}-${PV}.tar.bz2 \
>  	   file://defconfig \
>             "

Is it not better to move all machines to at91bootstrap-2.13 which does
not use this include file at all.


Best Regards
Ulf Samuelsson


