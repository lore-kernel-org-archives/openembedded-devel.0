Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1MZHRb-00057W-R5
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Aug 2009 06:52:44 +0200
Received: by qyk35 with SMTP id 35so1373121qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Aug 2009 21:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Qc0FaxGq2tHqCli5hnHLRl7SviHtnV4Zkb9Th6GyklI=;
	b=f4VaE0oOKI2vyMG5MfftxPeVkQWEENNuh8IEzfi9xP8NfKk9AMC4sMF0wXa4ve91PI
	3hP9rh/Uf82nqJ4q7nJpzlY5QjjfxsaT5nentAe3KtPLPxQzjuzvJO8Dk4AMvkuzCUuW
	hyM5f+vJPvjn4ZcOriDcCvKXoXAn9TupV1OQM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GgS+AnbzLwr17jV8rhkhLsKIs8kAEzywvMbpdAeRJZ0ZI3KTUzFjjo6L5A5UpcGbdi
	IpXt5RiDsi85swXlHxLpVfPelBif5WUA2a+MdWlTdj38jw626wGG7RfJu4KK2yVQISHr
	Pab6FF6F6wA5vSVjHZ66s68WK7B0ozcRZ9Xf4=
MIME-Version: 1.0
Received: by 10.229.70.141 with SMTP id d13mr476707qcj.70.1249619811858; Thu, 
	06 Aug 2009 21:36:51 -0700 (PDT)
In-Reply-To: <gup1vi$sjq$1@ger.gmane.org>
References: <gup1vi$sjq$1@ger.gmane.org>
Date: Thu, 6 Aug 2009 21:36:51 -0700
Message-ID: <5e088bd90908062136t20f3426xdce62e015dae987a@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: uim and scim recipes - request for help
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
X-List-Received-Date: Fri, 07 Aug 2009 04:52:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2009/5/17 Rolf Leggewie <no2spam@nospam.arcornews.de>:
> Hi,
>
> it seems like bitrot has crept in to the uim and scim recipes. =C2=A0uim
> 1.3.1 is in OE and used to compile fine. =C2=A0scim has never been a part=
 of
> OE thus far, but 1.4.6 used to compile fine when I tried about a year
> ago=E3=80=80(had some other trouble with it then, so I never pushed the b=
b). =C2=A0I
> have published the scim recipe in a private branch in the OE git server n=
ow.
>
> http://cgit.openembedded.net/cgit.cgi?url=3Dopenembedded/tree/recipes/sci=
m&h=3Dlaibsch/scim
>
> I asked in IRC for help (thanks RP and pb_) and it looks like this
> problem is related to libtool, which AFAIK has recently been updated.
>
> http://www.hentges.net/irclogs/%23oe/2009/May/20090517_oe.log#[20090517%2=
014:23:19]
>
> Build logs (the successful ones are usually do_clean only):
> uim: http://tinderbox.openembedded.net/packages/uim
> scim: http://tinderbox.openembedded.net/packages/scim
>
> Any help to get these compile again is greatly appreciated. =C2=A0Latest =
uim
> version is 1.5.5. =C2=A0While we're at it, I guess it makes sense to get =
that
> into OE. =C2=A0I'll push a WIP bb to the laibsch/scim branch.

I too have a need for uim/scim.

I noticed a couple of commits in June for the uim recipe. Did these
commits fix the known issues?

When I tried the current recipe, both uim-native and uim failed to
build, so I suspect not.

Just wanted to check in for the current status before spending any
time on debugging.

Steve


