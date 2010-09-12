Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Oulfl-0007Cv-MH
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 14:28:42 +0200
Received: (qmail 13725 invoked by uid 1003); 12 Sep 2010 12:27:54 -0000
Received: from pool-96-240-180-126.ronkva.east.verizon.net (HELO
	?192.168.1.167?) (philip@opensdr.com@96.240.180.126)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	12 Sep 2010 12:27:54 -0000
Message-ID: <4C8CC749.5070306@balister.org>
Date: Sun, 12 Sep 2010 08:27:53 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.8) Gecko/20100806 Fedora/3.1.2-1.fc13 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>	<AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>	<i6629i$d5c$1@dough.gmane.org>
	<201009081609.32135.pieterg@gmx.com>	<4C879EC5.10402@balister.org>
	<4C8ADB7A.4000303@techsol.ca>	<i6f9uu$39o$1@dough.gmane.org>
	<i6fc40$90f$1@dough.gmane.org>	<AANLkTimZ1Vzyj0+wT1amdtrxjXkVy=fNbKzCWNG_LrOW@mail.gmail.com>	<i6i5g8$ums$1@dough.gmane.org>
	<AANLkTinELVSoGrq1km6dFpXGF524h328t+TBM4p32inz@mail.gmail.com>
In-Reply-To: <AANLkTinELVSoGrq1km6dFpXGF524h328t+TBM4p32inz@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
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
X-List-Received-Date: Sun, 12 Sep 2010 12:28:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2010 07:27 AM, Frans Meulenbroeks wrote:
> 2010/9/12 Koen Kooi<k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 12-09-10 10:34, Frans Meulenbroeks wrote:
>
>>> Haven't had time to test this yet, but I feel at least a PR bump is
>>> missing (or perhaps a set of PR bumps)
>>
>> Since it would require a PR bump for everything that is built with gcc,
>> I'm going to say:
>>
>> That's what DISTRO_PR is for, which is up to distro maintainers to bump.
>
> Still I feel PR or INC_PR bumps of the affected gcc recipes is
> appropriate, if only to fix it for distro's that do not immediately
> bump DISTRO_PR.
> We have quite some distro's and not all are maintained equally well,
> so I can imagine it'll take some time for them to bump
> Actually some distro's seem orphaned, so for those it might never
> happen and bumping the GCC PR's at least will give them the fix too.

If the DISTRO is not maintained, maybe it should be cleaned up and left 
around to confuse people who think it should work well.

Philip


>
> Thinking of it let's see how many distro's actually use DISTRO_PR:
> ../../conf/distro/angstrom-2008.1.conf:DISTRO_PR = ".6"
> ../../conf/distro/kaeilos-2010.conf:DISTRO_PR = ".1"
> ../../conf/distro/kaeilos.conf:DISTRO_PR = ".5"
> ../../conf/distro/angstrom-2010.x.conf:DISTRO_PR = ".7"
> ../../conf/distro/shr.conf:DISTRO_PR = ".5"
>
> So that is 5 out of the 32 recipes.
> Even one of your own (angstrom-2008.1-legacy.conf) does ot use DISTRO_PR
>
> Very nice to keep the users of those 27 distro's in the cold!
> Not.
>
> Frans.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


