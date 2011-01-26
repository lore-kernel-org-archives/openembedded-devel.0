Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1PiEJN-0003Hg-S7
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 23:58:02 +0100
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 23EA1EB765
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 23:57:13 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmUWAE41QE1T4zjzPGdsb2JhbAAMiE+Nf44rAQEBATW9I4VPBIwp
X-IronPort-AV: E=Sophos;i="4.60,382,1291590000"; d="scan'208";a="1709442150"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.243])
	by ipb4.telenor.se with ESMTP; 26 Jan 2011 23:57:13 +0100
Message-ID: <4D40A6C8.8020705@atmel.com>
Date: Wed, 26 Jan 2011 23:57:12 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D4092E8.8040207@atmel.com>
In-Reply-To: <4D4092E8.8040207@atmel.com>
Subject: Re: Patching from a file containing a compressed directory	(<directory>.tar.bz2)
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
X-List-Received-Date: Wed, 26 Jan 2011 22:58:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-01-26 22:32, Ulf Samuelsson skrev:
>     Trying to change the at91 linux recipes.
>     The "experimental" patches to be added on top of the "maxim" patch
>     can be downloaded from ftp://ftp.at91.com/ and that file
>     is generated from a directory of patches, which should be applied
>     in alphabetical order.
>
>     When the "obvious" SRC_URI  is used:
>
>     ftp://ftp.at91.com/<directory>.tar.bz2;apply=yes \
>
>      the files do not get applied in alphabetical order.
>
>     It looks to me like they get applied in reverse order,  but I did 
> not check carefully.
>     I tried adding a "series" file, and recompress, but that failed as 
> well.
>
>     Any clue on how to get the patches applied in alphabetical order?
>
>     If the patches are in a subdirectory to the recipe, and applied 
> manually
>     everything is OK, but that seems to be a shame to have to resort 
> to that.
>
BTW: I figured out that I can avoid applying the file as a patch,
and just let the file be decompressed to ${WORKDIR}, and then
apply the patches manually in a "do_patch_prepend" function.

Drawback is that if there are working patches before this,
then they also need to be applied manually.

Seems strange that the patches are not applied in alphabetical order.

-- 
Best Regards
Ulf Samuelsson



