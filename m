Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OumXc-00018l-ED
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 15:24:22 +0200
Received: by iwn2 with SMTP id 2so4156949iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 06:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=/5J4Pe2/zxYMWFc2xwZYz55hJbqW9vHRaBYc3+hItJs=;
	b=i/XLVOcn33lcstB08/eS0rdW4ADZ6QO1UOMiKP2u4gYyvVFYWN3anXYodMTia//M6w
	zqh2UUSYWq3MoRzDNtaNWtgvHoHh7duJ4YBAl347LIXbc9MijULienMtYa54oEgW3Sc5
	QIjU3uOUAwKpeFUXk8HdLYpvqcH6HubNclvjM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=jVekaP6ufkNctDofMAHG70gJ/6sme9aiQ0KM6i70rKBCTntfHD304+dwG4aCQ8prId
	q1EeB3eFPfXinXb8ZmlcnRfN6WgSIfudd+lPbaOwJ4oqq3X4NOECAYDp8czdROqMAtvo
	i4WnZdDSkTxI/SjyoZ36SQFiYD65oG8rL9s+c=
MIME-Version: 1.0
Received: by 10.231.39.201 with SMTP id h9mr2273945ibe.27.1284297815884; Sun,
	12 Sep 2010 06:23:35 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Sun, 12 Sep 2010 06:23:35 -0700 (PDT)
In-Reply-To: <4C8CCFDB.5000103@balister.org>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
	<AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>
	<i6629i$d5c$1@dough.gmane.org> <201009081609.32135.pieterg@gmx.com>
	<4C879EC5.10402@balister.org> <4C8ADB7A.4000303@techsol.ca>
	<i6f9uu$39o$1@dough.gmane.org> <i6fc40$90f$1@dough.gmane.org>
	<AANLkTimZ1Vzyj0+wT1amdtrxjXkVy=fNbKzCWNG_LrOW@mail.gmail.com>
	<i6i5g8$ums$1@dough.gmane.org>
	<AANLkTinELVSoGrq1km6dFpXGF524h328t+TBM4p32inz@mail.gmail.com>
	<4C8CC749.5070306@balister.org>
	<AANLkTikqWixYAegBhiVamN2GpG_jMZCpRH=a-9NunbF7@mail.gmail.com>
	<4C8CCFDB.5000103@balister.org>
Date: Sun, 12 Sep 2010 15:23:35 +0200
Message-ID: <AANLkTimPpDhcx7ViR1ppba_azoevo3c2O5dUtFoaV_tU@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Sun, 12 Sep 2010 13:24:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/12 Philip Balister <philip@balister.org>:
> On 09/12/2010 08:49 AM, Frans Meulenbroeks wrote:
>>
>> 2010/9/12 Philip Balister<philip@balister.org>:
>>
>>> If the DISTRO is not maintained, maybe it should be cleaned up and left
>>> around to confuse people who think it should work well.
>>>
>>
>> Philip,
>>
>> I hope you wanted to say "...cleaned up and NOT left around..."
>> Otherwise it does not really make sense to me.
>
> I did. I am not functioning on a full load of coffee.
>
> Seriously, some people may be attached to those distro's. However, if they
> are not using OISTRO_PR to force rebuilds may be due to their use case being
> different from say Angstrom. DISTRO_PR is useful for people maintained feeds
> for end users. Some of the DISTRO's without it, may just build images from
> clean builds as needed, so they don't really need it, and won't need the PR
> bump being discussed.

I can understand that people are attached to some distros. I still
have a weak spot for slugos as that brought me to oe several years ago
(and the NSLU2 was a lot of fun!)

On the PR bump: even if you have a distro without DISTRO_PR, one may
locally still do a pull and do a partial rebuild (at least I do not do
a full rebuild every day)., so a PR bump would help.
Of course this fixes a fairly big problem, so it might be speeded up,
but in general I would say that a change which breaks a lot of things
(and requiring a full rebuild) should be announced clearly and timely
so people can be aware of it.
Thinking of it, we might also create/have/want something like OE_PR
which can be bumped if there are changes that require a complete
rebuild. This could be bumped for important, incompatible changes in
the toolchain or in key recipes.

Frans.


