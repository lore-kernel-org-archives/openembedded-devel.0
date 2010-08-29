Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Opf5c-0002uk-SP
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 12:26:17 +0200
Received: by iwn2 with SMTP id 2so3899732iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 03:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lRTrzzG0pn9857qeZpTWVTKT/pCNud01HG9rVbIR4aE=;
	b=fp9mJMengvCLnygfx8kTB3yATcVVDRjvUcl+1U877XXmcEmFNm9S5GsJQXH9ee6sk/
	6TFTAkfD11zYHik0H+AJosbQz8GfR+hOhaqyoJDyoLMMALks1RTihg9kNZGNVYM4s9wB
	dPbHDxBHgB1DDzVBg+ncCNPyAWE1NpvvwYPt8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gwOK7ZSKg4wrqIM+Da7mchTdUxOaOk9sBhiYF223cnlRlqN5j7dtD2raDtXBN9H3VD
	7LKYmwu3ESoUoBNROo11EcuqXvq0dsuETRtW8GmzV0IbmOlf+kZm9/IYGIarwVx7jwbn
	QtaCrsX+sKt/wqSQp+X9uEmBa+e9DXbjdAZvI=
MIME-Version: 1.0
Received: by 10.231.19.197 with SMTP id c5mr3633443ibb.91.1283077547354; Sun,
	29 Aug 2010 03:25:47 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 03:25:47 -0700 (PDT)
In-Reply-To: <AANLkTi=qHjTPQ6rqFAP8OpTHnYHS+K0R9vjkBCs0SW5=@mail.gmail.com>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
	<AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>
	<i5aoas$sja$2@dough.gmane.org>
	<AANLkTi=stV1ahzagn-7Fzq73pL3xYDDBZpAsfRUbA86v@mail.gmail.com>
	<4C790CCD.9060403@balister.org>
	<AANLkTinMWegmS0vGvqXnkrPPqHXnDh+YkB-sxJ95KcTp@mail.gmail.com>
	<4C79253F.7010504@balister.org>
	<AANLkTi=qHjTPQ6rqFAP8OpTHnYHS+K0R9vjkBCs0SW5=@mail.gmail.com>
Date: Sun, 29 Aug 2010 12:25:47 +0200
Message-ID: <AANLkTimQuYo3vrwXy_HOdbTsEK=s5pQnKTFCi7HMg=8k@mail.gmail.com>
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
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Sun, 29 Aug 2010 10:26:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/28 Chris Larson <clarson@kergoth.com>:
> On Sat, Aug 28, 2010 at 8:03 AM, Philip Balister <philip@balister.org>wro=
te:

>>
>> I'd also question the wisdom of doing changes with broad impact during
>> July/August. It seems like a large number of people are on extended
>> vacations during this time period.
>
>
> Are we going to block off every other part of the year where people take
> vacations too? =A0Please. =A0We'd better never do any real development du=
ring
> Christmas or New Years either.

To be politically correct I'd propose to add to that list also :
- Eid ul-Fitr (the end of the Ramadan) and the days around it
- Diwali
- Chinese new year
- Pesach
and probably quite a few more.

In that sense it may also be an idea to put sunday morning on the list
(irc and the list are very quiet at that time).

Of course that is not going to work.

Actually it might even be better do do big changes in quiet times, as
there is less interference with other changes.
(I seem to recall Koen mentioned that he already had to fix some
fallout for non applying patches when pushing my autotools_stage
removal patch, and that was only a day or maybe two after the patch
was posted).
And of course that patch could have been posted as individual patches,
but I doubt anyone was going to review 500 or so (forgot the number)
of patches.

THere are pr's and con's to both.

Frans


