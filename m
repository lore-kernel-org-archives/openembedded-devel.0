Received: from carmex.station51.net ([109.74.206.142] helo=station51.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <butters@station51.net>) id 1OIiYU-00089I-AA
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 May 2010 15:27:56 +0200
Received: from [87.241.107.86] (account butters HELO [192.168.1.201])
	by station51.net (CommuniGate Pro SMTP 5.3.4)
	with ESMTPSA id 1432857 for openembedded-devel@lists.openembedded.org;
	Sun, 30 May 2010 15:23:35 +0200
Message-ID: <4C0266DA.6050709@station51.net>
Date: Sun, 30 May 2010 15:23:38 +0200
From: butters <butters@station51.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <htqn9k$gvu$1@dough.gmane.org>	<AANLkTinPePxmIwOptgdFv-4CkJWzixbLvB26pxBw1dec@mail.gmail.com>	<4C01BFA7.5040800@freyther.de>
	<4C025F4C.7010305@station51.net>
	<91EED1BF-B355-4D13-ACDC-4A6F8AA79897@vanille-media.de>
In-Reply-To: <91EED1BF-B355-4D13-ACDC-4A6F8AA79897@vanille-media.de>
X-SA-Exim-Connect-IP: 109.74.206.142
X-SA-Exim-Mail-From: butters@station51.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Broken recipes
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
X-List-Received-Date: Sun, 30 May 2010 13:27:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I think I just did mention some packages... Maemo is missing "outo" 
during the initial stages of checking for all available recipes and 
tasks and it's missing things. This is the same thing with the 
task-openmoko.bb ...

I'm compiling for the mini2440 board. It's an armv4t board. The majority 
of the things that I can see will and should compile for it. But when I 
say broken, I am talking about recipes that don't even make it to 
running the queue part... the recipes that stop before that because of 
missing components. I understand that certain packages might not compile 
for obscure hardware.

As I said in my previous post, I think that more people get confused and 
waste a lot of time trying to fix broken things. From what I understand 
of Maemo, not all of it is available as open source so it shouldnt be 
included at all, right???

I've not tried to build everything. So I don't have a list. I'm just 
mentioning two that I tried today, and that I've tried over the past few 
months with the same results.

Thanks for your reply :)

Bill

On 5/30/2010 3:14 PM, Dr. Michael Lauer wrote:
> Hi Bill,
>
>    
>> Can someone tell me the reason for keeping broken recipes in the tree?
>>      
> Define 'broken'; some packages only build for a certain combination of $MACHINE and $DISTRO,
> and sometimes perhaps even $OUT_OF_TREE_OVERLAY.
>
> If a package is definitely broken, we should move it to 'broken' (if there is still
> any interest in it), or remove it altogether. Most of the time it's maintainers disappearing
> and who knows when or if they will appear again, so why annoy them by removing the recipe?
>
> There's also lack of manpower to throw into the equation.
>
> Which concrete recipes do you mean? I'd agree with removing a dozen of openmoko ones
> for distributions that noone works on any longer (i.e. Openmoko 2007.2 and Openmoko 2008),
> but please tell me exactly which ones.
>
> Cheers,
>
> :M:
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>    



