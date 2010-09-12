Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OumC4-0005Td-90
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 15:02:05 +0200
Received: by iwn2 with SMTP id 2so4141359iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=yG92Jg31BvOFID8CGAsKADg7KrwlVWmUyoggebHM0EI=;
	b=tX18kzU65Kf4WoUVis2rmqqv1M8BDfDl/xPsK1DswqHKURSBFjfys2hJ0aVqwZI4Y5
	Qdb4ETYh63xKgkvsIxd6eXCJrR2tPnB4J9iP307+ay8bk9Jmt8bIIX7ItzfxrhXWTmaM
	s6ckASA+ovNOHGEtmj0qivu4u602a/8YY6MzU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kYHc+kM1vU8Vhl0T0RezJyTYBVQ1y+u3fGx7CTrfp5d/l7/EVSU16QHEd+94U4pJfH
	hDF0wdOicNwhZc4LYWaerzQCRcJkx9xi0qsSmxW5CCDCZ8Tronf8O5Q0WvrrelmqGsgt
	yu+pP+7UDpHszdRpVM0RwLxe5c1Jd9W2PdPnA=
MIME-Version: 1.0
Received: by 10.231.58.201 with SMTP id i9mr4294422ibh.98.1284296479509; Sun,
	12 Sep 2010 06:01:19 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Sun, 12 Sep 2010 06:01:19 -0700 (PDT)
In-Reply-To: <4C8CCCFC.1070409@balister.org>
References: <4C8C9C66.7030006@freyther.de>
	<1284288866.4698.81.camel@lenovo.internal.reciva.com>
	<1284287817.18010.7488.camel@rex> <4C8CCCFC.1070409@balister.org>
Date: Sun, 12 Sep 2010 15:01:19 +0200
Message-ID: <AANLkTi=wBGuafbp-PrZv1Xk+oUXumm7+ctoS9HHNJr7z@mail.gmail.com>
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
Subject: Re: [PATCH] sanity.bbclass: Check for the presennce of libc.a
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
X-List-Received-Date: Sun, 12 Sep 2010 13:02:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/12 Philip Balister <philip@balister.org>:
> On 09/12/2010 06:36 AM, Richard Purdie wrote:
>>
>> On Sun, 2010-09-12 at 11:54 +0100, Phil Blundell wrote:
>>>
>>> On Sun, 2010-09-12 at 17:24 +0800, Holger Freyther wrote:
>>>>
>>>> The insmod.static binary links statically and requires the libc.a
>>>> to be present. On Fedora glibc-static is not installed by default
>>>> when installing development headers. Warn the user that he needs
>>>> to have that installed.
>>>
>>> Why are we building insmod.static for native anyway? =A0That seems a bi=
t
>>> silly.
>>
>> It is. FWIW, Poky now patches the modutils-cross recipe so it only
>> builds the dynamically linked version to resolve exactly this issue.
>
> I'd rather just have insane check for glibc-static and not have an extra
> patch we need to carry around. I know everytime I install OE on a Fedora
> based machine, I spend a few minutes remembering why modutils-native does
> not build.

I guess you mean modutils-cross. There is no modutils-native recipe
and the modutils one does not have BBCLASSEXTEND =3D "native"
>
> Having a reminder to install glibc-static if needed would really help the
> new user experience for people using Fedora. I'd like to see Holger's cha=
nge
> go in.
>
> Philip

A patch does not seem to be needed

From modutils configure --help
  --disable-insmod-static      Do not create insmod.static binary (default)

Btw this is from modutils-cross-2.4.27-r9

(and ofc is the usage is not correct and the flag is not the default
behaviour it can easily be added in the conf flags)

Have fun! Frans


