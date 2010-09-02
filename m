Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Or3JZ-0006c1-NM
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 08:30:28 +0200
Received: by iwn2 with SMTP id 2so183991iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 23:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=hax/dXeYRNZ/FN8UrTmy9NgQOpue68XNnJgRou8Lh6U=;
	b=FkCbQzBkfWMTaYAs4Ayeu9x/e4xwRPlFerdNC46rj5jaNOFvceDBSQ78aOq8wxgc10
	ZcVzvj5l9RyKQoULWa+3EURdvxZ5J6dZCGgj/MIA+iJ6OEDT7fP6xj6GieG52b3qqXF0
	cWJK+RB/NqcUkgvMb9RN1TBANeqPLgb6q6Jco=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=WgktgZl4wSRKpDYxE8Klxj+oF10uHG+Sffk5iH6sZUK4j12cKY7LbGnoCeDwUza1Yd
	OKFtPRRldA7DYBWI+9mV7FYhi76lJirVkEnE4E3nwFjruB0KBH2YExpicMCNOm1h6jwh
	U+InOF4e3mUD8Q8aDX1LDrX37OlXoOYcfSgXQ=
MIME-Version: 1.0
Received: by 10.231.33.131 with SMTP id h3mr9822240ibd.148.1283408991634; Wed,
	01 Sep 2010 23:29:51 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 1 Sep 2010 23:29:51 -0700 (PDT)
In-Reply-To: <4C7EC5B2.5090202@mentor.com>
References: <AANLkTimeV1FbwQCMYL7WH3tuo_zwcYX1o9cs1H66VPhu@mail.gmail.com>
	<AANLkTinqVEs+Uh6jNJJVzqjE2SXMbM1ni60nUx+qtXka@mail.gmail.com>
	<AANLkTimamK0_tQw32zWAuANT2fBTDgSHUdPZPWbe-E-3@mail.gmail.com>
	<AANLkTimEE4VSR3C6XSQUCYXTgbA1m=Zdw1f8w9vm76_X@mail.gmail.com>
	<AANLkTimwWFkDscFgDvQQzNbXm+t4SXKnCbWQobK2nu9U@mail.gmail.com>
	<4C7EC5B2.5090202@mentor.com>
Date: Thu, 2 Sep 2010 08:29:51 +0200
Message-ID: <AANLkTi=OQ5tAiPObaex4c2qUof_buQpB6PrOn=QGRxa0@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libxml-namespacesupport-perl stuck in do configure
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
X-List-Received-Date: Thu, 02 Sep 2010 06:30:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/1 Tom Rini <tom_rini@mentor.com>:
> Frans Meulenbroeks wrote:
>>
>> 2010/9/1 J. L. <vwyodapink@gmail.com>:
>>>
>>> Thanks Frans that fixed it by setting up CPAN on the build machine :)
>>
>> J.L, thanks for reporting this back.
>>
>> Actually we do need a real fix for this.
>> any perl wizards that can take this up?
>
> I'm confused since I thought I had done this already with
> 71a16be679041bb042c02f0f59c56141d963562c
>
> --
> Tom Rini
> Mentor Graphics Corporation

J.L. what version were you building?
Did you have this patch? (url:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=71a16be679041bb042c02f0f59c56141d963562c
)
I must say I haven't seen the problem recently but once you've
configured cpan the problem is away. Not sure on how to test/reproduce
this.

Frans


