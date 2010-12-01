Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PNiVO-0003jK-Oy
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 09:57:39 +0100
Received: by iwn8 with SMTP id 8so5580664iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 00:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TgluwtUmJV/dUOb9jtaI3HQ4eaIxg/RENkGsRgQkqAA=;
	b=FGw9ekoRUqEym4PjG9WkIUABvZKWOAYebiqV2Bhht0c/90pa8kTPApSY768TAPVl1P
	z4H29ltnzT+B1pCXQdXhuQeXAgq5pvQ9VII7LICEWDu4BpG8g5GTU09SV9LQUJgIjzpw
	RUpoYO0cBy9fxzrP1/fqAqvGWUZ7aRQFFVKrw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=g7q0yYmyFs6Nr+z1/NDQXl6YiNWYSeb95cjMtEjBRdTN/ibQrdgMjJGpsK5JRSnWht
	t+TsnE4fs7Y6DbW5AC5FM80vpQSrVK6SuV9J4fH8vCjGwMLzuYhZaDFXgx3tinigLdPq
	4JLLl+ySyqiYLXpO0++uYWdCkbgFyCCMq6ZRM=
MIME-Version: 1.0
Received: by 10.231.14.10 with SMTP id e10mr8681560iba.132.1291193778360; Wed,
	01 Dec 2010 00:56:18 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 1 Dec 2010 00:56:18 -0800 (PST)
In-Reply-To: <AANLkTik_w9__s=gBQ=YeseiEbVptaPgrjdbwv8c=jbLn@mail.gmail.com>
References: <AANLkTinyc8Pnpd3XMnTu=psPPHAmGKi4+DjvgWhSE1jt@mail.gmail.com>
	<20101130082314.GL10755@ibawizard.net>
	<AANLkTikmbUDpw04xqRYE+pwY1_mBUNNOdfL+LdnahUrC@mail.gmail.com>
	<20101201084510.GM10755@ibawizard.net>
	<AANLkTikCDnhP-SoKC+fx-N-Tst3O7-AE_dkNz_g=gCo5@mail.gmail.com>
	<AANLkTik_w9__s=gBQ=YeseiEbVptaPgrjdbwv8c=jbLn@mail.gmail.com>
Date: Wed, 1 Dec 2010 09:56:18 +0100
Message-ID: <AANLkTinNBZFTPqygsLJhaa+WvJuOVaFmMPYHYGmpORJ3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010 - last moment hot fixes
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
X-List-Received-Date: Wed, 01 Dec 2010 08:57:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/12/1 Graham Gower <graham.gower@gmail.com>:
> On 1 December 2010 19:21, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2010/12/1 Petr =C5=A0tetiar <ynezz@true.cz>:
>>> Khem Raj <raj.khem@gmail.com> [2010-11-30 10:12:08]:
>>>
>>>> Do we already have some resolutions to these issues ? are there
>>>> existing patches
>>>
>>> Yes, there are few patches around, but Koen didn't told us yet[1] what
>>> fix/workaround he would preffer for Angstrom 2008/2010.
>>>
>>> 1. http://www.mail-archive.com/openembedded-devel@lists.openembedded.or=
g/msg13494.html
>>>
>>> -- ynezz
>>
>> OE is more than angstrom, and no single distro should =C2=A0block progre=
ss
>> for the rest, even not if it is the primary distro.
>> My suggestion would be to upgrade uclibc + binutils. to fix things.
>> Angstrom then can (and probably already does) pin the current versions.
>>
>> My 2 cents, Frans.
>>
>
> The alternative is remove uclibc bits from the angstrom distro conf,
> removing all doubt about its current status as unsupported/nonworking.

Agree, but that is up to the angstrom maintainers to decide and implement.

Frans


