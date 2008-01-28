Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JJI0R-0006gV-S6
	for openembedded-devel@openembedded.org; Mon, 28 Jan 2008 01:37:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0S0bsqS011498
	for <openembedded-devel@openembedded.org>; Mon, 28 Jan 2008 00:37:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11456-01 for <openembedded-devel@openembedded.org>;
	Mon, 28 Jan 2008 00:37:50 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0S0bmTF011490
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 28 Jan 2008 00:37:48 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <fnj683$oaa$5@ger.gmane.org>
References: <fnj683$oaa$5@ger.gmane.org>
Date: Mon, 28 Jan 2008 00:37:47 +0000
Message-Id: <1201480667.4670.16.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Tosa patches for 2.6.24
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2008 00:37:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 2008-01-28 at 00:05 +0000, Dmitry Baryshkov wrote:
> As some of you know, currently I work on improving the Sharp SL-6000 (tosa)
> kernel support. Some parts are going to be merged RSN, some parts are still
> in preparation to submission. A pile of patches can't be submitted because
> of backwards dependencies. Currently my patchset contains 54 patches.
> 
> Now back to support of tosa in OE. I think I have several options:
> 
> 0) linux-rp-2.6.23 contains support for the device. It has problems, but it's
>    mostly working. So leave it just for now, don't touch 2.6.24 and wait for
>    2.6.25.
>    I would prefer not to follow this path as I want to enlarge testing base
>    for patchset and to let tosa-owners use decent kernel features.
> 1) Add all my patches on the top of linux-rp-2.6.24 as the tosa-specific part.
>    This can be hard, as I touch various bits of kernel, this can require
>    major efforts.
> 2) Just start linux-tosa recipe branch, importing few patches from linux-rp,
>    and merge them later.
>    No major pros et contras.

I also prefer 1 or 2. I would like to explain some of the history or
tosa support in linux-rp just so you know why its as it is and how we
could change it.

Currently most of the tosa patches are applied as machine specific. This
was because they contained functionality which broke the other zaurus
machines and the patches were the process of being redesigned so they
didn't do this.

If the patches don't break the other machines, then we're free to apply
them for all machines and they can be applied much earlier in the stack
if they're imminent for upstream.

The advantage of 1 is that the changes get tested on the other zaurus
models and it makes sure there are no adverse affects there. It also has
the advantage you get the benefit of the debugging done on the other
zaurus models, invariably something breaks upstream affecting PXA and
gets fixed in that tree, if you share it, you get that benefit. The
disadvantage as you say is the work can be slightly harder but we can
reorder patches to help with that if appropriate. 

So I have a slight preference for 1 but don't object to 2 if you feel
thats the best way to go.

Regards,

Richard



