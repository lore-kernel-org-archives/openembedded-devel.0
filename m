Received: from outrightsolutions.nl ([194.145.201.26]
	helo=mail.outrightsolutions.nl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sander@outrightsolutions.nl>) id 1T9zqz-0000H6-Vt
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 16:48:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.outrightsolutions.nl (Postfix) with ESMTP id 7586F5BC3EA;
	Fri,  7 Sep 2012 16:35:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outrightsolutions.nl
Received: from mail.outrightsolutions.nl ([127.0.0.1])
	by localhost (hydrogen.outrightsolutions.nl [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id EtnLmyNNwBs0; Fri,  7 Sep 2012 16:35:53 +0200 (CEST)
Received: from [IPv6:2a02:2308::1ab:f800:2] (unknown
	[IPv6:2a02:2308::1ab:f800:2])
	by mail.outrightsolutions.nl (Postfix) with ESMTPSA id 36DB45BC3D7;
	Fri,  7 Sep 2012 16:35:53 +0200 (CEST)
Message-ID: <504A0641.7010403@outrightsolutions.nl>
Date: Fri, 07 Sep 2012 16:35:45 +0200
From: Sander van Grieken <sander@outrightsolutions.nl>
Organization: Outright Solutions
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <5049BEFD.9040003@outrightsolutions.nl>
	<20120907134455.GA21660@mi.fu-berlin.de>
	<504A00D7.3030305@outrightsolutions.nl> <1561903.1HycqArB5v@helios>
In-Reply-To: <1561903.1HycqArB5v@helios>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: linux-firmware
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
X-List-Received-Date: Fri, 07 Sep 2012 14:48:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/07/2012 04:20 PM, Paul Eggleton wrote:
> On Friday 07 September 2012 16:12:39 Sander van Grieken wrote:
>> On 09/07/2012 03:44 PM, Henning Heinold wrote:
>>> On Fri, Sep 07, 2012 at 11:31:41AM +0200, Sander van Grieken wrote:
>>>> Hi,
>>>>
>>>> Currently, linux-firmware produces one big package with all binary
>>>> firmware files installed. It would be benificial , especially for
>>>> devices with a very small rootfs, to install only a subset of the entire
>>>> collection. Some effort has been done to split off separate packages,
>>>> but it's not clear what the preferred naming should be.
>>>>
>>>> - Should it follow the kernel-module-* naming, e.g.
>>>> kernel-module-ath9k-htc would need linux-firmware-ath9k-htc?
>>>> - Or should it follow the firmware file naming, e.g.
>>>> linux-firmware-htc-7010 - Or maybe have a bit larger packages and simply
>>>> split by vendor, e.g. linux-firmware-atheros
>>>> - How and if to package the license file
>>>>
>>>> Thoughts?
>>> Because we even split all kernel modules into seperate packages we should
>>> do it for firmware files too. But that is a lot of monkey work, you need
>>> to check for all firmware files and make the right packages.
>> Yes, that's why I ask. It would be helpful if there's a comment in the
>> bb explaining this is wanted, and how to name the package. Then devs
>> working with certain hardware can define a specific package and test
>> with their hardware locally. This way it can be incrementally done.
>>
>>> The scheme of the package names seems fine to me.
>> What scheme?
>>
>> rtl8192cu follows kernel module naming, firmware is rtl8192cufw, and
>> includes license file
>> rtl8192ce follows kernel module naming, doesn't include license file
>> sd8686 follows firmware naming, includes license file
>> wl12xx follows 'firmware' naming (actually is vendor scope), doesn't
>> include license file
> Ignore my other message - I was confused by some seemingly old code we have in 
> kernel.bbclass, that is separate from the linux-firmware recipe.
>
> We should always be including the license file if present I believe.
>
> As for the package splitting I would advocate some kind of automated splitting 
> using do_split_packages rather than manually packaging everything if we can 
> avoid it. FYI I wrote something about the use of this here:
>
>   https://wiki.yoctoproject.org/wiki/Handling_optional_module_packaging
>
> Cheers,
> Paul
>
Ok thanks, that looks promising. Although the requirement 'Must
include %s' would mean that the naming follows firmware, and probably
serious regexp juggling is needed if you want to match a list of
firmware files for a single package.

grtz,
Sander





