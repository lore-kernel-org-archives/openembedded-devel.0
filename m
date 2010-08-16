Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ol5WB-0004U2-JR
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 21:38:48 +0200
Received: by yws5 with SMTP id 5so1030233yws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 12:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iun0ApIklN8e689X9mIWjD0IR/rapRN5lfEyBDX2wF0=;
	b=HjTKhQX7Aq3s8c/kPlBI+dqbCFRBNYpg8P1R5/PTIHqQwpcUt1GxSQFyIShjlYEuJh
	nETz+8EbwK0PG2fDmGAo+y/xXG4JORI2EJK9Ze6l+XucX7kHbK5UixD/iDrZqdSYJSIg
	O4lOCWFJCexF5CYsGM4GGJYVP4IeSNfILxrm4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=bf3946gI4mstwRAO/8r+sWf0esWZoe8XuLhWV/6oE+IQi5YXucqsh9N9RyZZKbf1OX
	vTUHIGXzwAnNemrI3N0E4Pe/os8jZwOjBIQ4+5tKowuxBnUEMY+oo4/YWVwEsPW6EiGs
	e8s76285TLQUqHhM8/VXRk8CACgvvSJFaUB1E=
MIME-Version: 1.0
Received: by 10.150.52.2 with SMTP id z2mr6066708ybz.444.1281987509847; Mon,
	16 Aug 2010 12:38:29 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 12:38:29 -0700 (PDT)
In-Reply-To: <4C692F5F.9090208@xora.org.uk>
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
	<i4auje$u5g$1@dough.gmane.org>
	<AANLkTimpAxxt7GR=1VV9ZrAWubMp63sX771+PfhLjWTu@mail.gmail.com>
	<AANLkTi=pVCajY==ZdehO_Bw33xsrYcvBnYHfN4s2Vne=@mail.gmail.com>
	<i4b3dl$vbk$1@dough.gmane.org>
	<AANLkTim8Et4FHon4o2dsTOyFe-8huxTmmFEYA5PNZirw@mail.gmail.com>
	<i4b7r1$sf8$1@dough.gmane.org>
	<AANLkTin_ABBeGBY_rQpfmvnjf+afe+5gJqb85EzYHq+L@mail.gmail.com>
	<4C692F5F.9090208@xora.org.uk>
Date: Mon, 16 Aug 2010 21:38:29 +0200
Message-ID: <AANLkTi=e72yJ743qLvPi9NFgnYSG5ZukshLn7cZ0mOnd@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Mon, 16 Aug 2010 19:38:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/16 Graeme Gregory <dp@xora.org.uk>:
> =A0On 16/08/10 13:14, Frans Meulenbroeks wrote:
>> 2010/8/16 Koen Kooi <k.kooi@student.utwente.nl>:
>> would be nice if oe would detect those cases and force a rebuild.
>>> That doesn't help if you're using packagemanagement. Now you have
>>> "foo_1.0-r0.ipk" in the feeds that statically linked to openssl 0.9.8
>>> and "foo_1.0-r0.ipk" locally that statically links to 1.0.0. So users
>>> still don't get the fixes that went into openssl.
>> Agree.
>> I vaguely recall an idea (I believe from RP) to have a hash or so
>> derived from the whole dependency tree below it.
>> This discussion probably ran somewhere last winter.
>>
>> Frans
>>
> A quick implementation would sum all PR in depends tree above us.
>
> Graeme
>

That would be an elegant and simple solution.
There is a minor issue with it wrt lettering (but I guess these can be
skipped) and maybe cvs/svn/git numbers (i seem to recall some of these
are not monotonic).
A more difficult issue is if a dependency is removed. Then suddenly
the number will drop. The only solution I see right away is manually
add an offset to the recipe to accomodate for this (but it is not
really a nice solution).

Frans


