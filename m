Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lq91X-0004bN-LK
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 18:48:34 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lq8z0-00081S-9R
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 16:44:38 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 04 Apr 2009 16:44:38 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 04 Apr 2009 16:44:38 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 04 Apr 2009 18:44:23 +0200
Message-ID: <gr82p7$2vd$1@ger.gmane.org>
References: <gr7nfd$32a$1@ger.gmane.org>
	<ac9c93b10904040851q4d038367l7ac1d4e80a52dfc4@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <ac9c93b10904040851q4d038367l7ac1d4e80a52dfc4@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Rebuild external kernel modules on kernel change
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
X-List-Received-Date: Sat, 04 Apr 2009 16:49:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-04-09 17:51, Frans Meulenbroeks wrote:
> Hm,
>
> I don't like that one needs to touch conf/machine/beagleboard.conf
> each time the kernel is updated.
> This is likely to be forgotten at some time.
> Can't we use something in the linux-omap-*.bb file ?

You can't set global vars in recipes.

regards,

Koen


> Btw, I always bump PR if I change something in the config.
>
> Isn't it possible to add rebuilding those modules to e.g.. virtual/kernel?
>
> Frans
>
> 2009/4/4 Koen Kooi<k.kooi@student.utwente.nl>:
>> Hi,
>>
>> For beagleboard I have a few things I need to rebuild everytime the kernel
>> changes:
>>
>> * powervr kerneldrivers
>> * sdma kernel module
>> * dmai kernel module
>> * codec-engine
>>
>> And I have roughly two kinds of kernel changes:
>>
>> 1) version upgrade (e.g. 2.6.29 ->  2.6.29)
>> 2) config changes (e.g. enable ethernet bridging)
>>
>> The first type of change could be solved by putting KERNEL_VERSION in PV or
>> PR, but that needs a non-trivial amount of python since the information
>> isn't available at parsing time (exactly like debian.bbclass).
>> The second kind of change is a lot harder to detect, unless we start storing
>> md5sums for kernel defconfigs.
>>
>> I have a lowtech proposal for this:
>>
>> -----
>>
>> conf/bitbake.conf:
>> # Define a PR for kernels that machines can override so things like
>> # modules get rebuilt
>> MACHINE_KERNEL_PR ?= "r0"
>>
>> conf/machine/beagleboard.conf:
>> # Increase this everytime the kernel changes
>> MACHINE_KERNEL_PR = "r39"
>>
>> classes/kernel.bbclass:
>> # A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
>> # rebuilds for kernel and external modules
>> PR = "${MACHINE_KERNEL_PR}"
>>
>> class/module-base.bbclass:
>> # A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
>> # rebuilds for kernel and external modules
>> PR = "${MACHINE_KERNEL_PR}"
>>
>> -----
>>
>> I don't really like this method, but I'm having a hard time coming up with a
>> decent solution that:
>>
>> a) works
>> b) requires less or equal manual work
>> c) keeps PR in sync between different buildhosts
>>
>> regards,
>>
>> Koen
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>




