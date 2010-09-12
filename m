Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OumF8-0006LL-Gu
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 15:05:20 +0200
Received: (qmail 3543 invoked by uid 1003); 12 Sep 2010 13:04:28 -0000
Received: from pool-96-240-180-126.ronkva.east.verizon.net (HELO
	?192.168.1.167?) (philip@opensdr.com@96.240.180.126)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	12 Sep 2010 13:04:28 -0000
Message-ID: <4C8CCFDB.5000103@balister.org>
Date: Sun, 12 Sep 2010 09:04:27 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.8) Gecko/20100806 Fedora/3.1.2-1.fc13 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>	<AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>	<i6629i$d5c$1@dough.gmane.org>
	<201009081609.32135.pieterg@gmx.com>	<4C879EC5.10402@balister.org>
	<4C8ADB7A.4000303@techsol.ca>	<i6f9uu$39o$1@dough.gmane.org>
	<i6fc40$90f$1@dough.gmane.org>	<AANLkTimZ1Vzyj0+wT1amdtrxjXkVy=fNbKzCWNG_LrOW@mail.gmail.com>	<i6i5g8$ums$1@dough.gmane.org>	<AANLkTinELVSoGrq1km6dFpXGF524h328t+TBM4p32inz@mail.gmail.com>	<4C8CC749.5070306@balister.org>
	<AANLkTikqWixYAegBhiVamN2GpG_jMZCpRH=a-9NunbF7@mail.gmail.com>
In-Reply-To: <AANLkTikqWixYAegBhiVamN2GpG_jMZCpRH=a-9NunbF7@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patch to fix libstdc++ problem, was Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Sun, 12 Sep 2010 13:05:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2010 08:49 AM, Frans Meulenbroeks wrote:
> 2010/9/12 Philip Balister<philip@balister.org>:
>
>> If the DISTRO is not maintained, maybe it should be cleaned up and left
>> around to confuse people who think it should work well.
>>
>
> Philip,
>
> I hope you wanted to say "...cleaned up and NOT left around..."
> Otherwise it does not really make sense to me.

I did. I am not functioning on a full load of coffee.

Seriously, some people may be attached to those distro's. However, if 
they are not using OISTRO_PR to force rebuilds may be due to their use 
case being different from say Angstrom. DISTRO_PR is useful for people 
maintained feeds for end users. Some of the DISTRO's without it, may 
just build images from clean builds as needed, so they don't really need 
it, and won't need the PR bump being discussed.

Philip

>
> BTW: I already tried to identify distro maintainers and unmaintained
> distros. See [1]
> I still feel it is a good plan to either remove unmaintaned distros,
> or move them (and the files that are specific to those distros) to an
> unmaintained directory.
> However it was even impossible to create consensus to remove files in
> distro/include that were not used by any distro (and most likely not
> maintained either) See [2]
>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/022698.html
> [2] http://thread.gmane.org/gmane.comp.handhelds.openembedded/35427/focus=35946
>
> Frans.
>
> PS: and if anyone would need it, it would still be availalble in git
> as well as in the stable/2009 branch. I can also imagine that we
> create a tag before actually cleaning up.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


