Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LXolN-0005n0-LD
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 04:30:50 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090213032920.VAFU2342.fed1rmmtao102.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 22:29:20 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id FFVJ1b0051E665w04FVJ6Z; Thu, 12 Feb 2009 22:29:20 -0500
X-Authority-Analysis: v=1.0 c=1 a=m4GsJ0U7kpoA:10 a=BmWhzjBSfEMA:10
	a=AGq-N2MS-SJLQWUhUZgA:9 a=bB9CwRv8ez-x73_XitgRg_EI5WQA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Thu, 12 Feb 2009 20:29:18 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090213032918.GS11815@smtp.west.cox.net>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
	<1234460865.3592.2.camel@mill.internal.reciva.com>
	<49946CA4.6060303@dls.net> <gn28a2$8if$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gn28a2$8if$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 3/6] package.bbclass, package_ipk.bbclass: add	dynamic depends on locale packages (ipk specific)
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
X-List-Received-Date: Fri, 13 Feb 2009 03:30:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 12, 2009 at 11:36:50PM +0100, Koen Kooi wrote:
> On 12-02-09 19:38, Mike (mwester) wrote:
>> Phil Blundell wrote:
>>> On Thu, 2009-02-12 at 14:38 -0200, Otavio Salvador wrote:
>>>> +
>>>> +		if pkgname.find('-locale-') == -1:
>>>> +			rdepends.append('%s-locale*' % pkgname)
>>>> +
>>> This looks like it will add locale dependencies to all the subpackages
>>> (e.g. foo-doc, foo-dev and the like) as well as the main "foo" package,
>>> which is a bit different to how the old code used to work.  But I guess
>>> that's harmless enough: the worst effect will be to bloat the Packages
>>> file a bit, and I doubt anybody will care too much.  So, thumbs up from
>>> me.
>>
>> How much bloat?  Opkg already trips the OOM killer on the NSLU2 (32MB of
>> RAM) when it loads the current Packages file and then tries to do
>> something; we can work around it for now, but if this doubles the size
>> in-memory, we may simply not have enough RAM to do whatever it is that
>> opkg does with all that in-memory.
>>
>> I have grave concerns over anything that adds unnecessary entries that
>> cannot be turned off.
>
> You can make them approx 50% smaller by doing:
>
> echo -n "Stripping source lines from Package files"
> for i in `find .. -name Packages` ; do grep -v ^Source: $i|gzip  
> -c9>$i.gz ;gunzip -c $i.gz>$i ; touch $i.sig ; done

How hard would it be to make that happen more easily, with the normal
tools?  Perhaps some flag to generate just the minimum information?

-- 
Tom Rini


