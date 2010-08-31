Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1OqNDI-0001ok-18
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 11:33:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 86A60A5F25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 10:32:19 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id fHTksSQgz94d
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 10:32:15 +0100 (BST)
Received: from [10.131.0.209] (188-220-38-49.zone11.bethere.co.uk
	[188.220.38.49])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 2172610C0AF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 10:32:15 +0100 (BST)
Message-ID: <4C7CCC1F.7090006@xora.org.uk>
Date: Tue, 31 Aug 2010 10:32:15 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.8) Gecko/20100820 Lightning/1.0b2 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikcbgZQ8EkyCh3a7mby5VbXZ4Hp8bXRORPpZKsY@mail.gmail.com>	<i5iej2$qi2$1@dough.gmane.org>
	<AANLkTikFZx7DQzBzTFfjQTxCK+zV6k7Mf29WFivEV8vW@mail.gmail.com>
In-Reply-To: <AANLkTikFZx7DQzBzTFfjQTxCK+zV6k7Mf29WFivEV8vW@mail.gmail.com>
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-omap-psp-2.6.32 breaks iscsi-target
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
X-List-Received-Date: Tue, 31 Aug 2010 09:33:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

 On 31/08/10 10:17, Frans Meulenbroeks wrote:
> 2010/8/31 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 30-08-10 19:47, Frans Meulenbroeks wrote:
>>> The current beagleboard angstrom and minimal distro's (and maybe
>>> others) use the linux-omap-psp_2.6.32.bb recipe to build the kernel.
>>>
>>> This one says:
>>> # This is the v2.6.32_OMAPPSP_03.00.01.06 branch
>>> SRCREV = "a6bad4464f985fdd3bed72e1b82dcbfc004d7869"
>>>
>>> # The main PR is now using MACHINE_KERNEL_PR, for omap3 see
>>> conf/machine/include/omap3.inc
>>> MACHINE_KERNEL_PR_append = "+gitr${SRCREV}"
>>>
>>> SRC_URI = "git://arago-project.org/git/people/sriram/ti-psp-omap.git;protocol=git;branch=master
>>> \
>>>
>>> Building it creates:
>>> linux-omap-psp-2.6.32-r88+gitra6bad4464f985fdd3bed72e1b82dcbfc004d7869
>>>
>>> However this is not a sound 2.6.32 tree. It contains this patch
>>> http://arago-project.org/git/people/?p=sriram/ti-psp-omap.git;a=commit;h=c720c7e8383aff1cb219bddf474ed89d850336e3
>>> which was not in the mainstream kernel in 2.6.32
>> What a surprise, a vendor kernel has patches that aren't in mainline linux.
> Well the surprise is not that a vendor kernel has patches that are not
> mainlined. Actually I expect vendor specific patches in such a kernel.
> The surprise is that this kernel advertises itself as 2.6.32, yet has
> 2.6.33 patches integrated that are non-vendor related at all.
>
> And surprise or no surprise, what happened is that I encountered a
> problem in a recipe I maintain in conjunction with a platform that
> used to support this.
> (actually both the iscsi-target package and the tgt package appear on
> the angstrom feed for armv7a)
>
> I've analysed the problem, figured that there is no good way to
> resolve this in the package and that the root cause is a kernel that
> advertises itself as 2.6.32 but is not compliant with it.
> Therefore I report the problem. I actually offered to work on a patch.
>
> However, instead of appreciating the fact that someone reports an
> incompatibility so that it is known, some people seem to prefer to
> shoot the messenger. :-(
> Great piece of teamwork!
>
>>> (compare
>>> http://arago-project.org/git/people/?p=sriram/ti-psp-omap.git;a=blob;f=include/net/inet_sock.h;hb=c720c7e8383aff1cb219bddf474ed89d850336e3
>>> with
>>> http://git.kernel.org/?p=linux/kernel/git/stable/linux-2.6.32.y.git;a=blob;f=include/net/inet_sock.h;h=47004f35cc7eaf6f2b3cac2779ea7b7ccd5d9c1f;hb=HEAD
>>> ).
>>>
>>> The patch mentioned above was integrated in a 2.6.33 rc version.
>>>
>>> iscsi-utils uses the inet_sock struct, and contains code to access the
>>> daddr field of this struct. For versions <= .32 daddr is used. for
>>> higher versions inet_daddr is used.
>>> However the omap-psp kernel from arago does contain this patch  but
>>> reports as a .32 kernel causing a compiler errir when compiling
>>> iscsi_target (as the name the recipe expects is not there).
>>>
>>> Not sure how to fix it. Changing the test in iscsi-target is not an
>>> option as then it does not work for official .32 kernels.
>>> Probably the best way to fix this is to use the above patch to revert
>>> the change.
>>>
>>> anyone a better solution?
>> I can tell you right now that patching the psp kernel will not be
>> accepted, so patching the iscsi recipe is the way to go.
> iscsi-target cannot fix this in a reasonable way. If I saw a decent
> fix (which does not break things for other .32 kernels), I would have
> done it.
> A patch for the psp kernel would be very simple. We're only talking
> about a patch (which could be in oe, not in arago) to give the struct
> fields the name that they should have according to 2.6.32).
> Functionally this is a zero-impact patch.
>
> Then again, the flexibility, open-minded-ness and customer
> friendliness of some of our developers is already known to me, so I
> kind-a expected this reaction (which is also why I posted this before
> spending time to develop a patch).
>
> Anyway, I already lost interest in resolving this. I can make it work
> locally for me, no problem with that, and I'll add DP of -1 for
> beagleboard to the iscsi-target recipe with an explanatory note.
>
There is no such thing as a stable kernel anymore, all 2.6.XX releases
are classed as unstable, it is upto vendors to stabalise and select API/ABI.

Graeme



