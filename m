Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kyutl-0001OK-HD
	for openembedded-devel@openembedded.org; Sat, 08 Nov 2008 21:59:13 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kyus7-0006Al-Mg
	for openembedded-devel@openembedded.org; Sat, 08 Nov 2008 20:57:31 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 08 Nov 2008 20:57:31 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 08 Nov 2008 20:57:31 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 08 Nov 2008 21:57:24 +0100
Message-ID: <gf4ufl$8sj$1@ger.gmane.org>
References: <1226099101.6034.5.camel@utx.utx.cz>
	<c384c5ea0811081204j6edb237aw69afe7163277a84e@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081025 Shredder/3.0b1pre
In-Reply-To: <c384c5ea0811081204j6edb237aw69afe7163277a84e@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [patch review] bitbake.conf: Introduce STAGING_BINDIR_CROSS_BASEPKG
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
X-List-Received-Date: Sat, 08 Nov 2008 20:59:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08-11-2008 21:04, Leon Woestenberg wrote:
> Hello,
>
> On Sat, Nov 8, 2008 at 12:05 AM, Stanislav Brabec<utx@penguin.cz>  wrote:
>> It introduces STAGING_BINDIR_CROSS_BASEPKG pointing to
>> STAGING_BINDIR_CROSS of base packages and adds it to PATH (after
>> STAGING_BINDIR_CROSS).
>>
>> It fixes highly base package cross bindir lookup while compiling highly
>> optimized packages. Actually it's mplayer and sdl-config lookup.
>>
> I do not understand what exactly you fix.
>
> Could you explain more elaborately?

For pxa270 CPUs mplayer will enable iwmmxt extensions and do 
PACKAGE_ARCH = "iwmmxt", while other packages in the same build retain 
their default PACKAGE_ARCH (armv5te). So the sdl-config script wouldn't 
be in staging/iwmmxt-foo-linux, but in staging/armv5te-foo-linux. Since 
STAGING_BINDIR_CROSS is composed using PACKAGE_ARCH we need to point it 
'manually' to the armv5te one.

regards,

Koen



