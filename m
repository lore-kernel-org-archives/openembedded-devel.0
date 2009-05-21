Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M7GD8-0002ch-Mv
	for openembedded-devel@openembedded.org; Thu, 21 May 2009 23:53:58 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M7G5g-0007Pj-QB
	for openembedded-devel@openembedded.org; Thu, 21 May 2009 21:46:16 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 21:46:16 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 21:46:16 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 21 May 2009 23:46:05 +0200
Message-ID: <gv4i2t$90h$1@ger.gmane.org>
References: <gv4d2h$oft$1@ger.gmane.org> <gv4ea5$sbp$1@ger.gmane.org>
	<gv4g4j$2r4$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090515 Shredder/3.0b3pre
In-Reply-To: <gv4g4j$2r4$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] policy about nonworking recipes
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
X-List-Received-Date: Thu, 21 May 2009 21:53:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-05-09 23:12, Rolf Leggewie wrote:
>  The semantics of COMPATIBLE_MACHINE being "no compatible machines 
known to
> the last committer".

COMPATIBLE_MACHINE has a well defined meaning, which doesn't lend it for 
this kind of pendantry. COMPATIBLE_MACHINE is meant to prevent people 
building a recipe whose packages have no chance of *running* on a 
different machine (kernels being the most obvious examples, hardware 
daemons less so). It has no place in tagging build time brokenness.

> If it turns out to be a host-dependent issue,
> instead, then the next commit should replace the COMPATIBLE_MACHINE line
> with one listing only the COMPATIBLE_HOSTs.

So let's say you want to build pulseaudio, which requires a recent 
autoconf. And your distro locks that down to an ancient version. You get 
a weird error message that doesn't indicate the problem (most likely a 
broken makefile). So you try all machines present in OE and none works 
and then add COMPATIBLE_MACHINE = "", a while after that someone builds 
it for another distro, that does have the correct autoconf version 
(unbeknowst to the user) and replaces it with COMPATIBLE_HOST (which is 
really COMPATIBLE_ARCH, so not for 'host' issues, but target issues).
Anyone looking at the history of the recipe will draw the wrong 
conclusions, since you decided to make it a COMPATIBLE_MACHINE thing, 
instead of using EXCLUDE_FROM_WORLD (which has a meaning to bitbake/OE) 
or BROKEN = 1 (which has no meaning to bitbake/OE, only to OE devs).

But more importantly, a lot of people (and companies) are using OE in 
ways we don't know about, so deleting things, or preventing them being 
parsed is stabbing them in the eye.

If the recipes offend you, you can bbmask them out in local.conf or in 
your distro.conf, but stop making life harder for the rest of us, the 
time needed to undelete or un-COMPATIBLE_MACHINE recipes isn't free. 
Time spent hearing people bitch about deleted recipes isn't free either. 
OE isn't wikipedia were deleting a cool way to boost your streetcred.

And I think that ultimately it's a distro choice which targets should be 
buildable, if a distro says that 'world' isn't supported, so be it.



