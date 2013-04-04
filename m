Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UNmyo-0004HL-0i
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 18:25:42 +0200
Received: from [10.1.14.186] (83-64-248-68.inzersdorf.xdsl-line.inode.at
	[83.64.248.68]) by ptmx.org (Postfix) with ESMTPSA id 238F21FF7E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2013 18:08:27 +0200 (CEST)
Message-ID: <515DA57E.1060704@pseudoterminal.org>
Date: Thu, 04 Apr 2013 18:08:30 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <515C5DE6.6040702@pseudoterminal.org>
	<20130404073259.GA8722@mi.fu-berlin.de>
In-Reply-To: <20130404073259.GA8722@mi.fu-berlin.de>
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
X-List-Received-Date: Thu, 04 Apr 2013 16:25:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2013 09:32 AM, Henning Heinold wrote:
> Hi,
>
> nice work, but I wonder why the u-boot needs a boot.scr. Is it that old or can you switch it over to uEnv.txt so it is easier for people
> to change kernel cmdline and other u-boot config stuff.
>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

I agree this would be very useful. But with the CuBox, U-Boot is stored 
in internal flash, and is not read from the SD/MMC card, or hard drive, 
etc. To use an updated version, one has to flash it manually. This is 
also why U-Boot is not mentioned in the machine config.


