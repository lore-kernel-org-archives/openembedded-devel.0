Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ocjql-0001NS-E6
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 20:53:32 +0200
Received: by iwn34 with SMTP id 34so1452143iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 11:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=q39f8L9iQlAF282q/SsGzeoSoMC/aoHW0V2Fx7kIyuc=;
	b=Rwfs8RlaT/9SzGduH7pxLK72xZo9b2YHiiYZ9FGpcJ3kiVkhRP1R0cSS0Um3jjZ876
	PO5M7VkhlG9kB2W///32YyrXTBnnTY4vlyndW1wX2a7iAxFhLmZwnkFMr7KlvhZ+n89S
	oT8rw5y8jVY6pwvabqGPggAFYNUAxJL6H61WQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=btfgl2vCvHf39Su50thSIuedse7IooOKTFJJ/8ea6wzjKW1k2gM+XjJoimKQ3Vck6a
	0R4yQblqCHbZMVd/TlAG31TVxR+OnrJDHxS3/IlojqoOW/RZ5MlP3GY636jri3aZHlZD
	0aibnCVvVgBqBy3J0jR247efKa0cSg18lqz8k=
Received: by 10.231.149.3 with SMTP id r3mr5762991ibv.109.1279997598226; Sat, 
	24 Jul 2010 11:53:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Sat, 24 Jul 2010 11:52:58 -0700 (PDT)
In-Reply-To: <AANLkTinerH6EoKXHEcZa4As35XHbeVo8nk4BqkvDNnRV@mail.gmail.com>
References: <AANLkTim5aAnNi5VFs7=-gg1XaM=+KBeUs-G494SEbR+V@mail.gmail.com> 
	<4C4AE42C.5000306@welchs.me.uk>
	<AANLkTimG_U4Gsc9LuK6oKDJO2rE=xB7cDQzGf6dsh2GM@mail.gmail.com> 
	<4C4B0125.1040304@vollmann.ch>
	<AANLkTi=MJyW68ppn7YH-1LNp3rVwii9Gas+kUjQYAEEo@mail.gmail.com> 
	<AANLkTimfB5y2WDyrNr7EZD+gFDS4cE-F_LkquAtD+UZF@mail.gmail.com> 
	<AANLkTinerH6EoKXHEcZa4As35XHbeVo8nk4BqkvDNnRV@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Jul 2010 11:52:58 -0700
Message-ID: <AANLkTi=3tLxtsvO-ETEW90+Y-AH7=02kqeF8tzS1Cfhc@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] get rid of legacy staging
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
X-List-Received-Date: Sat, 24 Jul 2010 18:53:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 24, 2010 at 10:22 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/7/24 Chris Larson <clarson@kergoth.com>
>
>> On Sat, Jul 24, 2010 at 9:08 AM, Frans Meulenbroeks <
>> fransmeulenbroeks@gmail.com> wrote:
>>
>> > 2010/7/24 Detlef Vollmann <dv@vollmann.ch>
>> >
>> > > On 07/24/10 16:35, Frans Meulenbroeks wrote:
>> > >
>> > >> 2010/7/24 Martyn Welch <martyn@welchs.me.uk>
>> > >>
>> > >> =A0Can anyone point me to any documentation that describes what leg=
acy
>> > >>> staging
>> > >>> is and roughly what needs to be done to remove it?
>> > >>>
>> > >>
>> > >
>> > >> There was a post half a year or so ago from Koen, but I can't find =
it.
>> > >> Basically it boils down to removing do_stage from a recipe in which
>> case
>> > >> do_install is used to install things in staging
>> > >> in some cases do_install need to be modified to deal with
>> peculiarities
>> > >> that
>> > >> were done in do_stage
>> > >>
>> > >> For native recipes NATIVE_INSTALL_WORKS =3D "1" may need to be adde=
d.
>> > >>
>> > > That's not really much of an explanation.
>> > > Let's take an example. =A0I have two out of tree kernel modules A an=
d B.
>> > > B depends on A.
>> > > With "legacy" staging, in A_1.0.bb I have a do_install, that copies
>> > > the kernel object, and a do_stage, that copies the header file at
>> > > a place where B_1.0.bb can find it.
>> > >
>> > > How do I do that with non-"legacy" staging?
>> > >
>> >
>> > Apologies if my explanation was too brief. Didn't have too much time (=
and
>> > still haven't)
>> > I hope Koen's explanation below helps.
>> > The way I perceive it is that the non-legacy staging is performed by
>> doing
>> > a
>> > do_install with the staging dir as target directory.
>> > Guess someone will correct this if I am wrong.
>>
>>
>> You never touch a staging directory from do_install, ever. =A0You instal=
l
>> into
>> the usual paths, relative to ${D}, and the machinery in the classes will
>> automatically populate staging from that. =A0If you need to mangle a fil=
e
>>
>
> That is what actually what I wanted to say but apparently failed to expre=
ss
> properly
> It is indeed the machinery that does the work, not the user itself.
>
> Frans.
>
>> differently in staging from how you want it in your package, you can
>> install
>> a hook that will be called at staging population time.
>> --


when we are at it may be at the same time look into converting native recip=
es
to use BBCLASSEXTEND. In my experience whenever I went to remove legacy
staging I ended up converting the native recipes to use BBCLASSEXTEND along
with

I have a huge patch where I have removed inherit autotools_staging from
all recipes in OE. I havent tested it so far but should be done in few days

-Khem


