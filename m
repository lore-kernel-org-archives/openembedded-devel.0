Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id EE30260119
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jul 2016 15:23:15 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 6B54F68A019; Wed,  6 Jul 2016 16:23:14 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 0159668A019;
	Wed,  6 Jul 2016 16:23:14 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id AC2D567402A2;
	Wed,  6 Jul 2016 17:23:13 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <1467360339-10236-1-git-send-email-ed.bartosh@linux.intel.com>
	<577D1D64.8080604@elfin.de>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <577D2261.1040400@mlbassoc.com>
Date: Wed, 6 Jul 2016 17:23:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <577D1D64.8080604@elfin.de>
Subject: Re: [OE-core] problem with blacklisted packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jul 2016 15:23:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-07-06 17:01, piotr.lewicki wrote:
> Hi,
> I'm having problem with some of the recipes which are blacklisted due to problems with compilation using GCC-6.
>
> I wonder if there is a way to "whitelist" those packages without changing content of original recipe?
>
> For now I have:
>
> GCCVERSION = "5.%"
>
> in my distro.conf so if a recipe is not building due to problems with gcc6 I simply edit the recipe and remove the line
> with PNBLACKLIST.
>
> Is there a better way to deal with those problems?
> Can this blacklisting depend on "GCCVERSION" ?
>
> Example of problematic recipe : crda (from crda_3.18.bb)
>

I asked this same question last week :-)  I agree that not everyone
is using the leading edge compilers and making those of us have to
take such pains is a bit unfair.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

