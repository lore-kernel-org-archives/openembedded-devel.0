Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Oq8y5-0002lX-MN
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 20:20:36 +0200
Received: (qmail 10350 invoked by uid 1003); 30 Aug 2010 18:19:56 -0000
Received: from pool-96-240-180-126.ronkva.east.verizon.net (HELO
	?192.168.1.167?) (philip@opensdr.com@96.240.180.126)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	30 Aug 2010 18:19:55 -0000
Message-ID: <4C7BF64A.6080408@balister.org>
Date: Mon, 30 Aug 2010 14:19:54 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.8) Gecko/20100806 Fedora/3.1.2-1.fc13 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikcbgZQ8EkyCh3a7mby5VbXZ4Hp8bXRORPpZKsY@mail.gmail.com>
In-Reply-To: <AANLkTikcbgZQ8EkyCh3a7mby5VbXZ4Hp8bXRORPpZKsY@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Mon, 30 Aug 2010 18:20:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/30/2010 01:47 PM, Frans Meulenbroeks wrote:
> The current beagleboard angstrom and minimal distro's (and maybe
> others) use the linux-omap-psp_2.6.32.bb recipe to build the kernel.

What is iscsi and why would I need it on the Beagleboard?

Philip

>
> This one says:
> # This is the v2.6.32_OMAPPSP_03.00.01.06 branch
> SRCREV = "a6bad4464f985fdd3bed72e1b82dcbfc004d7869"
>
> # The main PR is now using MACHINE_KERNEL_PR, for omap3 see
> conf/machine/include/omap3.inc
> MACHINE_KERNEL_PR_append = "+gitr${SRCREV}"
>
> SRC_URI = "git://arago-project.org/git/people/sriram/ti-psp-omap.git;protocol=git;branch=master
> \
>
> Building it creates:
> linux-omap-psp-2.6.32-r88+gitra6bad4464f985fdd3bed72e1b82dcbfc004d7869
>
> However this is not a sound 2.6.32 tree. It contains this patch
> http://arago-project.org/git/people/?p=sriram/ti-psp-omap.git;a=commit;h=c720c7e8383aff1cb219bddf474ed89d850336e3
> which was not in the mainstream kernel in 2.6.32
>
> (compare
> http://arago-project.org/git/people/?p=sriram/ti-psp-omap.git;a=blob;f=include/net/inet_sock.h;hb=c720c7e8383aff1cb219bddf474ed89d850336e3
> with
> http://git.kernel.org/?p=linux/kernel/git/stable/linux-2.6.32.y.git;a=blob;f=include/net/inet_sock.h;h=47004f35cc7eaf6f2b3cac2779ea7b7ccd5d9c1f;hb=HEAD
> ).
>
> The patch mentioned above was integrated in a 2.6.33 rc version.
>
> iscsi-utils uses the inet_sock struct, and contains code to access the
> daddr field of this struct. For versions<= .32 daddr is used. for
> higher versions inet_daddr is used.
> However the omap-psp kernel from arago does contain this patch  but
> reports as a .32 kernel causing a compiler errir when compiling
> iscsi_target (as the name the recipe expects is not there).
>
> Not sure how to fix it. Changing the test in iscsi-target is not an
> option as then it does not work for official .32 kernels.
> Probably the best way to fix this is to use the above patch to revert
> the change.
>
> anyone a better solution?
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


