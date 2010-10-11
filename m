Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5NVf-000711-0a
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 20:54:09 +0200
Received: by iwn2 with SMTP id 2so25240iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 11:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/+GKOK113x8LlefnTa0CRuRkrX18fpB9dRtwtR58jR8=;
	b=V2zPBAnoYb8jIruBO1WBSkJXSS5XWeQCC6Rpv7nzea9G44TIUONc4oFOBWN6kGr7H4
	FjNBsDa8YvUOqEmzJF78p774guoeYPl2LY0Rqk/s+4TuON0M8WP12JzbsQ/JZd68xy5F
	COOQkA5MVsGIdjw9dhYG+CH/n3oXEPnzaRQ00=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BR6MoSWOwASzTxtSqvBHLqzsBQxtLeIIVNJ66gxX5LC3qCvPNEXBNjIbIoiplYFVeU
	BkGuu3Nu1nT+RpRdOS6g9Cmyfvy6pyk+qllFyD+fgI20NZWXo5+5MIO1UgfIi3XJtxID
	ptkFygkdqWu6bwPprzCJUkmBL2Qszup8MkuL0=
MIME-Version: 1.0
Received: by 10.231.17.10 with SMTP id q10mr4880475iba.153.1286823222155; Mon,
	11 Oct 2010 11:53:42 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 11 Oct 2010 11:53:41 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310FFA2BC@dlee06.ent.ti.com>
References: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>
	<AANLkTinR7QSaFb1FTzETX9=k9=JZh58iZgyD=7=So1uF@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA2BC@dlee06.ent.ti.com>
Date: Mon, 11 Oct 2010 20:53:41 +0200
Message-ID: <AANLkTi=uKwjKYq5W4VwKXcNHdSJkxZnu_w4M9kkvVWoX@mail.gmail.com>
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
Subject: Re: [PATCHv2] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Mon, 11 Oct 2010 18:54:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/11 Maupin, Chase <chase.maupin@ti.com>:
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Frans Meulenbroeks
>> Sent: Monday, October 11, 2010 12:41 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [PATCHv2] recipe licenses: update recipe LICENSE field=
s
>>
>> 2010/10/11 Chase Maupin <chasemaupin03@gmail.com>:
>> > * While verifying the licensing for the packages I am building
>> > =A0into my file system I found that for some packages the
>> > =A0LICENSE value set in the recipe was either incorrect or
>> > =A0generic and not detailed enough. =A0This patch is my attempt
>> > =A0to update the LICENSE fields for these packages to match
>> > =A0the actual versions of the licenses in the sources.
>> >
>>
>> [...]
>>
>> > -LICENSE =3D "GPLv2"
>> > +LICENSE =3D "GPLv2+"
>>
>> Doe we want this?
>> I think most GPLv2 code carries the clause:
>>
>> "This program is free software; you can redistribute it and/or
>> modify it under the terms of the GNU General Public License
>> as published by the Free Software Foundation; either version 2
>> of the License, or (at your option) any later version."
>>
>> Yet currently virtually all of these have GPL or GPLv2 as LICENSE
>
> Frans,
>
> My original version of this patch was just changing GPL to GPLv2 for exam=
ple. =A0But I was asked about whether it should be GPLv2+ which I guess is =
more indicative of the "or later" clause. =A0Does anyone have good guidance=
 here on how to denote things that are GPLv2 only for now (like git which L=
inux has a note in the COPYING file about it being GPLv2) and things that a=
re GPLv2 or later version? =A0I'm trying for consistency here but I guess t=
here doesn't seem to be a set policy for how the LICENSE field should be se=
t.
>

I have no personal preference, but was just noting the difference. How
do others feel about thi?

BTW: please don't take this personal. I really appreciate you doing
this, but I also am very aware that it is a boring and non-rewarrding
job, so we should better aim at getting it right te first time.

Frans


