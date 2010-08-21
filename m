Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Omhxc-0001zI-6w
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 08:53:49 +0200
Received: by iwn2 with SMTP id 2so1097274iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 23:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ODUu6SknVb0tOWPow6yLJ67mRblbPvcBkpxScQe9yz8=;
	b=NZBiyRwXtiUhKDCHh7Ns8x7tDW0RaqP8NwQKugx6id61EbR1j+/Ib8bTKqFfgh2BWd
	PZBelezQ/5dndLjtZLa0a7rJJYxxufSswpxR+GIi9LJVEDVR5rv6ArwEnpuwDTe4+41C
	NBRUZ1YgIa8yNSBnU/h0ySdvlGElH89EO7zz8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Fj1Yf83tOs6d8SJ7Ro2z0tW60IFfewD5/YHQI9UNiJELR5/vDVyHz8tGnvboCfjuFA
	a4HH+sX5mv+Gj84gkwC2wgvzyFQ6EZ+uTTjlSxBKOVet5c6OsnM6ttZbiZ5wfazjwrsP
	1QqQEz123DvFoouDmUqrzbultRLpwt1Z1+7x0=
MIME-Version: 1.0
Received: by 10.231.39.195 with SMTP id h3mr2935046ibe.88.1282373607463; Fri,
	20 Aug 2010 23:53:27 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Fri, 20 Aug 2010 23:53:27 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1008201656030.5745@asterix.crazy-teaparty.dyndns.org>
References: <AANLkTinr4-xEo+Urc_9P+uLmLk6qPJSRzCJNYVsKAxD6@mail.gmail.com>
	<alpine.LNX.2.00.1008191432360.5745@asterix.crazy-teaparty.dyndns.org>
	<AANLkTinMr1=Bj8eK2D+mg_J-P6jzvSAQAhXNtgkK=u1n@mail.gmail.com>
	<alpine.LNX.2.00.1008201656030.5745@asterix.crazy-teaparty.dyndns.org>
Date: Sat, 21 Aug 2010 08:53:27 +0200
Message-ID: <AANLkTime=tuSZNkBnM6XacjEC2Nucix0UtWTJ1VehOsr@mail.gmail.com>
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
Subject: Re: orphaned files
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
X-List-Received-Date: Sat, 21 Aug 2010 06:53:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/20 Vitus Jensen <vjensen@gmx.de>:

>
>> I thought I made a mistake in the script, but after verification I have
>> not.
>> The recipes you mention have been removed a few days ago
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3De5287904=
a9dddc8ddc0f486d8526bc8cfda427b7
>
> But I made a mistake when I used git fetch and forgot the merge :-( Sorry=
 to
> have caused noice.
>
>
>> It there any particular reason why you want to have both the 1.8 and
>> 1.9 versions in the archive?
>> If so, we should revert the commit above (and then of course the patch
>> file itself should not be removed either.
>
> Well, htmldoc_1.9.x-r1571.bb fetches an older "developer snapshot" as
> www.htmldoc.org/ calls it. =A0The download link on that page offers 1.8.2=
7 as
> the official version. =A01.8.28 is in the work. =A0In my opinion one shou=
ld
> always offer to build the official version, not some revision from an
> arbitrary point of time.
>
> Having said this 1.9.x-r1571 was added because it contains a feature whic=
h
> one customer required and wasn't in the official release from that time. =
I
> don't know whether someone at all is using that recipe now. =A0So it's on=
ly
> the official vs. developer version thingy.

Vitus as the owner/maintainer of the recipe do you want me to reinstate 1.8=
.28 ?

Frans


