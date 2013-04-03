Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UNTFg-0004WQ-0k
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 21:21:44 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 81A141FF85
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2013 21:04:34 +0200 (CEST)
Message-ID: <515C7D42.6070303@pseudoterminal.org>
Date: Wed, 03 Apr 2013 21:04:34 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <515C5DE6.6040702@pseudoterminal.org> <kjhsve$nqm$1@ger.gmane.org>
In-Reply-To: <kjhsve$nqm$1@ger.gmane.org>
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
X-List-Received-Date: Wed, 03 Apr 2013 19:21:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-04-03 20:38, Koen Kooi wrote:
> So how is this different from https://github.com/naguirre/meta-cubox ?

I am in contact with the author of that layer. My work started as a fork 
of that, since the layer did not work for me, but since I anyway was 
changing pretty much all of it from the ground up, I decided to start my 
own. Now, covers more features of the CuBox, and supports both soft- and 
hardfp in all recipes.

>
> Just like https://github.com/naguirre/meta-cubox you're mixing DISTRO 
> policy in the machine files by setting the tuning to hardfloat. Don't 
> do that. If you want hardfloat, set that in your distro config, not in 
> your machine config.

Do I understand it correctly that I should drop "marvellpj4hf" from 
https://github.com/dv1/meta-cubox/blob/master/conf/machine/include/tune-marvell-pj4.inc 
, or at least not set it as DEFAULTTUNE, not even with the ?= operation, 
and just use "marvellpj4" instead ? Because it is the distros decision 
to add the "callconvention-hard" feature?

The reason I ask that is because when I was writing the tune, I stumbled 
upon 
https://github.com/openembedded/oe-core/blob/master/meta/conf/machine/include/arm/arch-armv7a.inc 
, which includes armv7a, armv7ahf . This confuses me. Why is it OK there 
to mix in the callconvention?

Finally, is there a way to give a distro a "hint" about what is 
preferred for a machine (soft/hardfp)? One that the distro is free to 
ignore or respect?


