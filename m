Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PETB4-0007g1-EA
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 21:46:27 +0100
Received: by iwn42 with SMTP id 42so3277047iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 13:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=HZ16PBWAdKRZq/9ME5OHEFyvghuxOUqqeg9Q1WLVVyE=;
	b=pBNm83AzhxRbPyZ5l0/K5spnr0A8gzDmLIyTP2HpyJcHSygm1tREt6nhDNHXSude45
	fEufmWBEsWrK+wCgfiNkfG0QNYTxx5i3F/xCtNNTUaUqS5yUnrQ6LJDoHhm9/9gnUyOm
	yiZ7/ckCXgPA1eSyzOf0V11MLxT1YBxWkEA9A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NDrkqS7yknvSRjKue9HdkzP/7H/1sQkVmU3+u++VWp+r94+SyhRz/N6pbIekH6EVTP
	svDcefWlsYdrXpt0tXk0vtqNiJHrQ4hBHghx1zWrbjuk6w6Wcw8nGliNOKLqcKwM0/c5
	mBh+AFUlSEMe7F2FcF4OVLpgAySENgdTUwOU4=
MIME-Version: 1.0
Received: by 10.42.230.65 with SMTP id jl1mr2421033icb.134.1288989933266; Fri,
	05 Nov 2010 13:45:33 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Fri, 5 Nov 2010 13:45:33 -0700 (PDT)
In-Reply-To: <1288985057.28481.15994.camel@rex>
References: <1288973274.28481.15978.camel@rex>
	<1288975005.3826.56.camel@mattotaupa>
	<1288985057.28481.15994.camel@rex>
Date: Fri, 5 Nov 2010 21:45:33 +0100
Message-ID: <AANLkTim8e3HW3L5vTdRT-+nJyAWf5ZF395d2ceDby_en@mail.gmail.com>
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
Subject: Re: OpenEmbedded and the Yocto Project
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
X-List-Received-Date: Fri, 05 Nov 2010 20:46:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/5 Richard Purdie <rpurdie@rpsys.net>:
> On Fri, 2010-11-05 at 17:36 +0100, Paul Menzel wrote:
>> Am Freitag, den 05.11.2010, 16:07 +0000 schrieb Richard Purdie:
>> > Hopefully this email explains some of the reasons the project exists,
>> > what the differences are to OE and that is isn't something bad but
>> > actually a very positive thing. I have not dived into the topic of
>> > if/how Poky and OE can work together, that can be the subject of another
>> > email. If anyone has any questions I'm happy to answer them.
>>
>> Actually this is in my opinion the most important question. In the
>> beginning you talk about the one good build system.
>>
>> But in the end to get the one good build system, OpenEmbedded should
>> somehow be merged into or replaced by Poky(?) or be replaced, should not
>> it?
>>
>> I have only some small experience with and used only OpenEmbedded. So I
>> do not know about Poky and the other build systems. But I agree with you
>> to try to avoid duplicate work.
>>
>> So a message about your vision about the future of OE would be greatly
>> appreciated.
>
> The thing to keep in mind is that Poky and OE are very similar, sharing
> bitbake, the recipe format and pretty much the same class files.
>
> We therefore we didn't start a new build system project we took an
> existing one very similar to OpenEmbedded and we plan to keep the
> architecture the same. Even since Poky was created over five years ago
> I've been publicly discussing new features, how they're best implemented
> and so on with OE developers, bitbake maintainers and the OE TSC so the
> projects stay roughly in sync.
>
> I've stated what Yocto/Poky is doing differently and why, the question
> now is whether the OE developers agree/disagree with those things and if
> they are prepared to change OE at all to address some of the reasons
> Yocto is doing some things differently.
>
> There are ways the two projects can complement each other but there has
> to be a will there to do it. Traditionally, OE has trouble making
> decisions which I think it hurts the project in general. I'm hoping this
> topic isn't going to be one of those things it fails to reach a
> conclusion on.
>

Well, I for me I have some reservations, but I definitely also see
plenty of options as yocto does address several issues that
historically were not among the strong points of OE.
Let's work on combining the best of both worlds!

Frans


