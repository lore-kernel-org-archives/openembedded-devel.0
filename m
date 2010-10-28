Received: from smtp-out21.han.skanova.net ([195.67.226.208])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1PBXmt-0000xh-Pj
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 21:05:24 +0200
Received: from [10.3.3.12] (62.237.32.34) by smtp-out21.han.skanova.net
	(8.5.124.10) (authenticated as u82406562)
	id 4C7E106501714CB9 for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 21:04:36 +0200
Message-ID: <4CC9C943.4040704@atmel.com>
Date: Thu, 28 Oct 2010 21:04:35 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.24 (Windows/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>	<201010181520.30454.marcin@juszkiewicz.com.pl>	<4CBC4DD4.3010908@atmel.com>
	<i9hpii$gf2$1@dough.gmane.org>	<4CBC7F6A.9040000@atmel.com>	<AANLkTi=xBMvDEKjiaNKy7zijs4DCZwhrSDr=gHVkMh_T@mail.gmail.com>	<4CBCD3FC.5090305@atmel.com>	<AANLkTin6jOdo56fCEaMLNgiKDThBV0yg7x_OvOntwQEM@mail.gmail.com>	<4CBF81FC.3040803@atmel.com>	<AANLkTim3ucg9ue8OoLDvZP=J-jdt2Dd1g_+Wnf_CZ6jO@mail.gmail.com>	<4CC5A48B.40404@atmel.com>	<AANLkTi=WLnbdQiOC4B_v5hk+ehR_hUE8hgiGoCgDkEAx@mail.gmail.com>	<4CC5DB5F.6060002@atmel.com>
	<AANLkTikWWtc3p_OAF3n0CT=p4Nebna6H4iw759GnX04=@mail.gmail.com>
In-Reply-To: <AANLkTikWWtc3p_OAF3n0CT=p4Nebna6H4iw759GnX04=@mail.gmail.com>
X-SA-Exim-Connect-IP: 195.67.226.208
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/5] Use common files for AT91SAM9 configuration
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
X-List-Received-Date: Thu, 28 Oct 2010 19:05:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks skrev:
> 2010/10/25 Ulf Samuelsson <ulf.samuelsson@atmel.com>:
> 
>> Except it is not obvious.
>> How does anyone know which kernel version is the stable
>> and which is the experimental.
>> Indeed, how does anyone know that there is an experimental kernel version at
>> all.
>>
> Make two recipes (e.g. in an overlay)
> linux-stable and linux-experimental
> they can have their own defconfigs etc
> and you can just include the base bb file.
> if you want to you can even get both kernels in a single rfs so you
> can boot from either.


Well the plan *is* to use two recipes,
"linux-2.6.30.bb" and "linux-2.6.32.bb" as an example.

I am not sure what you mean by overlay.
Also not sure what you mean by includeing the base bb file.
Which file would be the base?
Which file would include the base?



> 
> Have fun! Frans
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



