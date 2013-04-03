Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UNUte-0006pv-S0
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 23:07:06 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 3AE641FF85
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2013 22:49:57 +0200 (CEST)
Message-ID: <515C95F5.3080705@pseudoterminal.org>
Date: Wed, 03 Apr 2013 22:49:57 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <515C5DE6.6040702@pseudoterminal.org> <kjhsve$nqm$1@ger.gmane.org>
	<515C8459.3080005@balister.org>
	<FF0E3122-75E0-47DF-978E-CF9982B94B64@dominion.thruhere.net>
	<515C8C04.3040904@balister.org>
	<4A3AFD82-E315-40D4-B21E-4E3005CBE86D@dominion.thruhere.net>
In-Reply-To: <4A3AFD82-E315-40D4-B21E-4E3005CBE86D@dominion.thruhere.net>
Subject: Re: New meta-cubox layer
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
X-List-Received-Date: Wed, 03 Apr 2013 21:07:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Okay, I think I see the problem now. DEFAULTTUNES should not be set by 
the machine config. So, removing it
and fixing the README accordingly takes care of that. People who for 
example want hardfp then
set DEFAULTTUNE ?= "marvellpj4hf" in their local.conf . Is this correct?

On 2013-04-03 22:19, Koen Kooi wrote:
>
>>> Local.conf
>> Fail. This means BSP providers are depending on users to do the right thing.
> "The right thing"? Is forcing RPM package management "the right thing"? Is moving DEPLOY_DIR "the right thing"?
>
>> The BSP should be able to say what it wants
> For MACHINE settings yes, for DISTRO settings, no
>
>> and a distro layer needs to
>> override the BSP choice for distributions providing binaries for
>> multiple machines.
> DISTRO settings in a BSP violates the Yocto Compatible rules as well as the established OE rules, I don't see why that should get changed.
>
> In this specific case, a BSP can set COMPATIBLE_HOST on the recipes that need to be hardfloat.
>
> In OE classic we had an ABI flag to set this globally, in OE-core the powers that be force us to set a tune per machine in the DISTRO config. The price of progress I guess.
>
>



