Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OmhXW-0001QB-7U
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 08:27:05 +0200
Received: by iwn2 with SMTP id 2so1081362iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 23:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=n9pE3xHWafvKNnf3WoWgpMZR5rUTPsbObbBOVHcTI8A=;
	b=vXiwzQt1wjJ3I/DbVSPwzp9Te9sHKPmOb8IZ814Y4om13oJoqOw0yTbL2MUljQpx+z
	5pPl5cGdRLMoyhHQOETb5lEOAWjkIrB7wrNKN98oPrOiujXGosqpR4hx6anVJwxRyZHb
	s586hq2fZIdGwdPP/t/33Tr7WIH2nikCBer9g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=iSgHb3k2OaFrVPmP6nXgCiQboiP4Tb6wxeYjkcthtRWC5w2tjGJCOFMbck3PFpZJqy
	06Qxczz32a6p3QifvlDJeONNiAU6cGaI4Rrb+RWdDI9BcDuGqamkInCKr8vffW4abuDC
	lN4VDn2ILk04/qVIlfxofegzIgLKEDAtSQSos=
MIME-Version: 1.0
Received: by 10.231.166.139 with SMTP id m11mr2739689iby.136.1282371984391;
	Fri, 20 Aug 2010 23:26:24 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Fri, 20 Aug 2010 23:26:24 -0700 (PDT)
In-Reply-To: <AANLkTiknntyGcs6gdHDx84J8m7QufqZ8CPVs4nF5urD7@mail.gmail.com>
References: <AANLkTiknntyGcs6gdHDx84J8m7QufqZ8CPVs4nF5urD7@mail.gmail.com>
Date: Sat, 21 Aug 2010 08:26:24 +0200
Message-ID: <AANLkTinzw_8N9fu5bpuT17zcjffqWJ3ZH9rLK1cA-yG9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE stable, testing, dev (was Re: What to do about the poor bitbake Quality Control?)
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
X-List-Received-Date: Sat, 21 Aug 2010 06:27:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/18 Cliff Brake <cliff.brake@gmail.com>:
> On Wed, Aug 18, 2010 at 4:30 AM, Martyn Welch <martyn.welch@ge.com> wrote=
:
>> On 17/08/10 16:02, Cliff Brake wrote:
>>>
>>> I think it would be very useful to have a "stable" branch that is only
>>> synchronised with dev when X number of targets build from a clean
>>> build. =A0It seems like this would be high value, with little effort.
>>> Of course there will be corner things that break, but at least a new
>>> beagleboard user can check out something and have reasonable
>>> confidence that it will build images.
>>>
>>> Does anyone have suggestions for the branch name and a reasonable
>>> subset of machines and build targets? =A0Perhaps someone is already
>>> running these clean builds? =A0At one point we had a machine at OSUOSL
>>> dedicated to this purpose, but no one ever set it up.
>>>
>>
>> So something like Debian's stable, testing and unstable[1]?
>
> That sounds good to me -- so how about org.openembedded.dev and
> org.openembedded.testing branches?

Good plan!

>
> I'll plan to start doing a clean build of dev every Monday for the
> Beagleboard, and then merge to testing once it builds. =A0Initial
> targets:

Cool!
>
> Angstrom Distro
> beagleboard/beagleboard-linuxtag2010-demo-image
> x86/minimal-image

It would be nice to have some additional distro's (e.g. minimal, shr)
and machines (what would be a good coverage here) tested before it is
pushed
>
> My workstation runs a 64-bit OS, so that is probably worst case
> (compared to i686).
>
What OS? If you want to make things really nasty go to RHEL4 (but I
think most people would be fine with e.g. ubuntu 10.04)
Ideally you'd do this in a clean vm to make sure that there is no
dependency on whatever happens to be installed on your workstation for
other purposes.

Frans


