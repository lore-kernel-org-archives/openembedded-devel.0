Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PZ5x3-0002de-T0
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 19:13:14 +0100
Received: by iyj18 with SMTP id 18so11721524iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Jan 2011 10:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Q/tmfhXLx96NEGtBpSD50ymvbM3BIsa5K6PVgG2xkOI=;
	b=BKMg5ROYS2S9TyoQ/Ff4j3v+s22JTXelUqlh/3Qm3owNfGHvO79wkhhadlaM8U3coI
	0pkT+ppDYQ+BW8A+1Y+P+gAPTkSLppHYSR0G8QK6CDaifFocDscW5UzUlFI6t5bqJdme
	2u6/6s6up/sY6tA27AC2JrBxTYhtUlkINkG+s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=nn3eHcyeMIev2Kbw+8hjWWK35r85BdqFXfDvO0GBlPFYuNROvCY4+gORfG639gZjA0
	q7R7TppdgeXD6+Fz2iRU25FuP0IhzIDYP+3TB6FPVNpDoNBpq9wjJPv3NeZ4MMNlQXwj
	6Yi/tB683wwH6i7BJvDfzlB4cPSAJTigeoXeQ=
MIME-Version: 1.0
Received: by 10.231.10.76 with SMTP id o12mr2730016ibo.144.1293905569002; Sat,
	01 Jan 2011 10:12:49 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Sat, 1 Jan 2011 10:12:48 -0800 (PST)
In-Reply-To: <iflbfm$rlm$1@dough.gmane.org>
References: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1293810428-31078-2-git-send-email-fransmeulenbroeks@gmail.com>
	<ifl85e$ets$1@dough.gmane.org>
	<AANLkTikBC4nhO1ZSkuYcyoEPNonS4YeXCP6vzKJ3d3Fr@mail.gmail.com>
	<iflbfm$rlm$1@dough.gmane.org>
Date: Sat, 1 Jan 2011 19:12:48 +0100
Message-ID: <AANLkTi=fQY0ovo=UU4+cJLSj4J68Nu2uiFne37zUBOQX@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] omap4430-panda: fix u-boot
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
X-List-Received-Date: Sat, 01 Jan 2011 18:13:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/31 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 31-12-10 20:06, Frans Meulenbroeks wrote:
>> 2010/12/31 Koen Kooi <k.kooi@student.utwente.nl>:
>> On 31-12-10 16:47, Frans Meulenbroeks wrote:
>>>>> The u-boot recipe for pandaboard is nonbuildable for a few
>>>>> months. Apparently this recipe is orphaned.
>>>>> I've made things buildable again by moving to the latest
>>>>> mainline u-boot (as suggested by Steve Sakoman a few monts
>>>>> ago). It builds fine, but is not tested on the actual
>>>>> hardware (as I do not have access to a board).
>>>>> Still I feel that a buildable recipe is better than using a
>>>>> recipe that does not even build.
>>
>> NAK, since it builds just fine and the result of the new recipe doesn't
>> work as good:
>>
>>> It does not build! See the log below.
>>> The recipe says:
>>
>>> SRCREV = "ccd0c67858c6e2807c695e2c8f545284cb871866"
>>
>>> PV = "2010.9+${PR}+git${SRCREV}"
>>
>>> SRC_URI = "git://www.sakoman.com/git/u-boot.git;branch=omap4-exp;protocol=git \
>>
>>> This SRCREV does not exist!
>>
>>> The only reason it works for you is because you use a mirror that has
>>> a snapshot of the recipe.
>
> It's the standard angstrom source mirror from angstrom-mirrors.bbclass,
> which anyone can use if they want to.
>
>>> If you are concerned about this recipe the least you can do is to make
>>> sure that people can build it even if they do not have your mirror
>>> present.
>
> The configurations I'm concerned about use angstrom-mirrors.bbclass, I
> don't care about others. I can send you my rate card if you want to pay
> me to support crap like minimal.

Oh my, what are we polite again.
I can perfectly support myself, thank you.

We have a broken recipe and I feel it should be fixed.
>
>>> (by either moving the recipe to a SRCREV that exists or by changing
>>> the SRC_URI to a location that *does* fetch).
>>> In its current form I consider this recipe as broken!
>
> I only support angstrom for the machines I maintain, if other distros
> want to support panda, they are free to mirror the snapshot if they want to.
> There is no guarantee that any other SRCREV will keep existing for the
> lengths of time, but the angstrom source mirror will keep the snapshot
> for at least 3 years.

Then as a machine maintainer you are doing a lousy job.
A key idea of OE is that we support multiple targets and multiple distro's.

Frans


