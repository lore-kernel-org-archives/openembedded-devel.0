Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Ol5b6-0004lf-Ho
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 21:43:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 64D151C144
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 20:43:36 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Drs+4kGR113n
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 20:43:35 +0100 (BST)
Received: from [192.168.1.119] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id AB35B1C13B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 20:43:35 +0100 (BST)
Message-ID: <4C6994F5.8080000@xora.org.uk>
Date: Mon, 16 Aug 2010 20:43:49 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.7) Gecko/20100720 Lightning/1.0b2 Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>	<i4auje$u5g$1@dough.gmane.org>	<AANLkTimpAxxt7GR=1VV9ZrAWubMp63sX771+PfhLjWTu@mail.gmail.com>	<AANLkTi=pVCajY==ZdehO_Bw33xsrYcvBnYHfN4s2Vne=@mail.gmail.com>	<i4b3dl$vbk$1@dough.gmane.org>	<AANLkTim8Et4FHon4o2dsTOyFe-8huxTmmFEYA5PNZirw@mail.gmail.com>	<i4b7r1$sf8$1@dough.gmane.org>	<AANLkTin_ABBeGBY_rQpfmvnjf+afe+5gJqb85EzYHq+L@mail.gmail.com>	<4C692F5F.9090208@xora.org.uk>
	<AANLkTi=e72yJ743qLvPi9NFgnYSG5ZukshLn7cZ0mOnd@mail.gmail.com>
In-Reply-To: <AANLkTi=e72yJ743qLvPi9NFgnYSG5ZukshLn7cZ0mOnd@mail.gmail.com>
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cleaning recipes
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
X-List-Received-Date: Mon, 16 Aug 2010 19:43:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

 On 16/08/10 20:38, Frans Meulenbroeks wrote:
> 2010/8/16 Graeme Gregory <dp@xora.org.uk>:
>>  On 16/08/10 13:14, Frans Meulenbroeks wrote:
>>> 2010/8/16 Koen Kooi <k.kooi@student.utwente.nl>:
>>> would be nice if oe would detect those cases and force a rebuild.
>>>> That doesn't help if you're using packagemanagement. Now you have
>>>> "foo_1.0-r0.ipk" in the feeds that statically linked to openssl 0.9.8
>>>> and "foo_1.0-r0.ipk" locally that statically links to 1.0.0. So users
>>>> still don't get the fixes that went into openssl.
>>> Agree.
>>> I vaguely recall an idea (I believe from RP) to have a hash or so
>>> derived from the whole dependency tree below it.
>>> This discussion probably ran somewhere last winter.
>>>
>>> Frans
>>>
>> A quick implementation would sum all PR in depends tree above us.
>>
>> Graeme
>>
> That would be an elegant and simple solution.
> There is a minor issue with it wrt lettering (but I guess these can be
> skipped) and maybe cvs/svn/git numbers (i seem to recall some of these
> are not monotonic).
> A more difficult issue is if a dependency is removed. Then suddenly
> the number will drop. The only solution I see right away is manually
> add an offset to the recipe to accomodate for this (but it is not
> really a nice solution).
>
I never was a fan of the git rev being in the PR and Phil Blundell
checked in a method we can use to avoid this but is not used by any
distro so far AFAIK.

Graeme



