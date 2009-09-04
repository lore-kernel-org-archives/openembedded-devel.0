Received: from [209.85.221.185] (helo=mail-qy0-f185.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mjh8F-0006lm-GO
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Sep 2009 00:19:47 +0200
Received: by qyk15 with SMTP id 15so1002659qyk.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2009 15:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=e2tqKh7FH3udgGW8uCsn3/0CSQsFIOP0UxhtFCF6Xwg=;
	b=WbXH38g2E33ZG9lNMidU5b1nFIuK+WMz3Ka4xnwH00q6ogg3Euvq0soIHHqnBpQM0J
	c103WhmWG9c+BphppuI9AtOHvyCz7NM3/Jk3aTdbexiGsIxNxuFpUvo1qAmG0f0uFxf7
	ut6n1RwzaUv0+iDbo7O+AAc3i6FKZXRFiBaBE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ATogs1GKBSEemE27T31SSjqFtHtwQwlJcDl2MIwIxw9QFAyTTXKVATQJCUkhcZUFP1
	9gWK7B48p5vRbhLzvFz7sKq08/e14ipNMN5E0p5lwNKcc8jT5d4yh5ra73CizvNiaHB9
	pRnNaFsg+lVVb28XUfkEonxsl09pfHg0N4UMA=
MIME-Version: 1.0
Received: by 10.229.39.201 with SMTP id h9mr3403553qce.4.1252101155172; Fri, 
	04 Sep 2009 14:52:35 -0700 (PDT)
In-Reply-To: <1252090763.4490.22.camel@lenovo.internal.reciva.com>
References: <1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<19c1b8a90909021407k5610f615q41c7d13bc3b38ff0@mail.gmail.com>
	<20090903043630.GQ23034@smtp.west.cox.net>
	<1251970342.27780.192.camel@mill.internal.reciva.com>
	<19c1b8a90909030811k7f6932e0r93c94fccc43e9b1c@mail.gmail.com>
	<1252061507.27780.507.camel@mill.internal.reciva.com>
	<19c1b8a90909040827w70b4dd95mc700ca1ebb01b0f4@mail.gmail.com>
	<1252078620.27780.515.camel@mill.internal.reciva.com>
	<19c1b8a90909041034w2648fa24pbc0f5899ca229fa2@mail.gmail.com>
	<1252090763.4490.22.camel@lenovo.internal.reciva.com>
Date: Fri, 4 Sep 2009 14:52:35 -0700
Message-ID: <19c1b8a90909041452x306648c3i180194dcf0b2a369@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS?= linux-gnuspe for e500
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
X-List-Received-Date: Fri, 04 Sep 2009 22:19:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2009 at 11:59 AM, Phil Blundell<philb@gnu.org> wrote:
> On Fri, 2009-09-04 at 10:34 -0700, Khem Raj wrote:
>> On Fri, Sep 4, 2009 at 8:37 AM, Phil Blundell<philb@gnu.org> wrote:
>> > On Fri, 2009-09-04 at 08:27 -0700, Khem Raj wrote:
>> >> Other distros also need this change. IMO it will be better
>> >> that we enforce a rebuild otherwise users might have issues that
>> >> are hard to debug.
>> >
>> > Why do other DISTROs need this change? =C2=A0Surely if they aren't usi=
ng
>> > sane-toolchain.inc to set TARGET_OS then they oughtn't to be affected.
>>
>> because of the TARGET_OS OVERRIDES now depend upon the new target triple=
t.
>> Probably one way would be to leave the old overrides in there but that w=
ould
>> have been more confusing.
>
> Oh, I see. =C2=A0So anybody who sets TARGET_OS by hand is going to lose
> unless they change their settings to match? =C2=A0I guess there should at
> least be a diagnostic for that.

Hmm there never was one before. one could set it to anything but I
think it would be
an improvement to check for valid TARGET_OS

-Khem

>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


