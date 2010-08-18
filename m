Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Olc8x-0002Hm-NM
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 08:29:32 +0200
Received: by gxk2 with SMTP id 2so70740gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 23:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=vMJMoNcoQVqHrXmbwGv6uqt4PZTd6WhvdkZ48niTPyk=;
	b=n7SUPVjqe1lmDjjj8eQPOBHE9MKmYDImK+BdpOa++Zk+awaQ+7aAjGwwpggzHiNTr+
	mk2qseCWvgl4VdRrNCLWFi9qSw7KrRU/fxk425pzi5v4Q2esj3rHe0VjFLqAnM4i7Ht7
	3M1D/FM1NTY99vJgRmj+G/NrlLKbWVvEhSc5I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=u0159IRch9E33u0qH+rmfgDZw6Qw9SO6eBoDc2kCA1vyFq3xgVjBHrRMLs+aF8a8I7
	fRAs1U8m6dG8ap+YbgvvoFK+2tDkU0c8HeVwayPkCx/AsK7oRfzo50MMPirETX/4v7wR
	FC0Z0ck4mZauPJLMJggUerqISEfOB4VonizHc=
MIME-Version: 1.0
Received: by 10.150.58.20 with SMTP id g20mr8167412yba.84.1282112920418; Tue,
	17 Aug 2010 23:28:40 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Tue, 17 Aug 2010 23:28:40 -0700 (PDT)
In-Reply-To: <1282055732.2692.1197.camel@mill.internal.reciva.com>
References: <1281993972-8643-1-git-send-email-jkridner@beagleboard.org>
	<1282053425.2692.1179.camel@mill.internal.reciva.com>
	<AANLkTim1LTg=RyVBxZftu8bTC7D1Sac0Hs0Dsgo5tLSX@mail.gmail.com>
	<1282055732.2692.1197.camel@mill.internal.reciva.com>
Date: Wed, 18 Aug 2010 08:28:40 +0200
Message-ID: <AANLkTinvFZ4wCOheK23g1QgFLzPBxJsOjxgTqe67kOSL@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bison: add flex dependency
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
X-List-Received-Date: Wed, 18 Aug 2010 06:29:51 -0000
X-List-Received-Date: Wed, 18 Aug 2010 06:29:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/17 Phil Blundell <philb@gnu.org>:
> On Tue, 2010-08-17 at 16:14 +0200, Frans Meulenbroeks wrote:
>> 2010/8/17 Phil Blundell <philb@gnu.org>:
>> > On Mon, 2010-08-16 at 16:26 -0500, Jason Kridner wrote:
>> >> -DEPENDS =3D "virtual/libintl"
>> >> +DEPENDS =3D "virtual/libintl virtual/flex"
>> >
>> > Does this actually work? =A0I couldn't immediately spot any obvious
>> > package which PROVIDES virtual/flex, and that sounds like a strange ki=
nd
>> > of virtual to have since I don't think there are any alternative
>> > implementations of flex. =A0(But if bison actually depends on lex
>> > generically, rather than flex specifically, it might make some sense t=
o
>> > introduce a virtual/lex and have flex PROVIDE it.)
>> >
>>
>> is there another popular lexer apart from flex?
>> And will bison build with it?
>
> Well, there's lex itself obviously. =A0I'm not sure whether bison will
> actually work with it, and I guess the majority of lex afficionados will
> probably be using yacc rather than bison in any case, so it probably
> isn't all that big a deal. =A0But if bison does indeed support non-flex
> implementations of lex then it would be nice to expose that in the
> metadata.
>
>
Guess other packages then also start to depend on a
new-to-be-introduced virtual/lex
As I think it is pretty pointless to have this, and as it requires
some time to introduce it elsewhere (time that I do not have now), I
added a dependency on flex-native and pushed that one

Frans.


