Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N7wwS-00010V-ON
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 21:03:55 +0100
Received: by yxe5 with SMTP id 5so354813yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 12:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6HSfAa94GOYloT+gYSwVx+EvNhxZmq36EQ1JQUV91fY=;
	b=doTYFycMwy/jVD+XO1PpyK4SqevzZX4Frg+thvcZld3LXMR5+oNadq0M3/BGty+NTm
	cusZo6PVG+3fhBHhh++DBKKNfoQ0jbmdEjpTps05YCQN5KGLAYrJ8jc3s/9sNGZPfkuk
	CgGvAKHN2vEWyksOT+Zg5PB65mZs0c2Vgxo1E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=lcEJvmj525hiQIBGF8wZDCZq8ATAryjt9sch4ogBsAwwFdPjESHThMl4lxQNnJk0KF
	OwASDTK6CcTAvVgt9rkQUrPjWaPtfSlEIPSl7Pj12MQuq4Gtba4BDcx2jhTB0Cw2aZrs
	PSwP8kxXx8i13EmxxhzFyZAEsXw5akwUvleD4=
MIME-Version: 1.0
Received: by 10.101.2.31 with SMTP id e31mr886624ani.180.1257883354599; Tue, 
	10 Nov 2009 12:02:34 -0800 (PST)
In-Reply-To: <1257875848.29038.265.camel@dax.rpnet.com>
References: <ac9c93b10911071237p63d19210m619afcaa914189f3@mail.gmail.com>
	<ac9c93b10911100946i6da3eaect50b93beefeda4dbc@mail.gmail.com>
	<1257875848.29038.265.camel@dax.rpnet.com>
Date: Tue, 10 Nov 2009 21:02:34 +0100
Message-ID: <ac9c93b10911101202g2bc44db9qabcb6dbeeb82d05e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: perl/cpan issue (cpan.bbclass, perl/config.sh)
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
X-List-Received-Date: Tue, 10 Nov 2009 20:03:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/10 Richard Purdie <rpurdie@rpsys.net>:
> On Tue, 2009-11-10 at 18:46 +0100, Frans Meulenbroeks wrote:
>> I had a fresh stab on this.
>> perl/config.sh gives the install dir.
>>
>> config.sh is provided by the perl package but the perl recipe
>> substitutes the destination directory @DESTDIR@ with ${D}
>>
>> So basically we can either:
>> a) put all packages that require perl/config.sh within recipes/perl
>> b) use an environment var in perl/config.sh (something that can be
>> replaced with ${D} during package build
>> c) have a config.sh with @DATADIR@ in it and let cpan.class replace it
>> wtih ${D} and write to a temp.sh and execute that one (or have a sed
>> script that replaces the vars) Note sure if that is ok, others
>> probably also use =A0perl/config.sh
>
> I'd suggest c) is most in keeping with OE and likely to work with
> packaged-staging and so on.

I don't know if that breaks things because someone else uses perl/config.sh
And anyway I'm not too sure on how to implement this option.

BTW meanwhile I found that if I avoid cpan and just write my own
configure/build/install things also worked for me.

Frans


