Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NmEiG-0007KV-UR
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 00:08:01 +0100
Received: by iwn10 with SMTP id 10so2721950iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 15:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IWAGrAQm50N3SDzX0kx2lQE4JAw2JrgLcPOAiVs8uYQ=;
	b=IrDo3/n3/y7nz/8yfFEONQ3DvcNc63f9nkhAeYxL836I4A9hXmMd0lp4Fq82D5b7xF
	Ta4dAA5MCeo9ptN0udWoXSFHkDk1qdFR8JIUm5heDhMnwMBfYC0wfSEvIGswpwamWAsP
	jKLPqGRohdDLFqcmBfjCrFWbUp0IMP1dFinso=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WvKjWg9+ec6OQ3gWB2pl2wS2RwdIBey4Q88mpbuQi4IeFmC3qauv6Z643EklrnEti7
	iYtkS29TBiHdJEmuimzEibrP9ghDzGu8xalq5lN1Wv8pmDwY/SN/+l2Lg9h52Fibu0hi
	FYjRgdJ+nYM2aufB9DGl4U9DcgCtquBCxGkmQ=
MIME-Version: 1.0
Received: by 10.231.159.198 with SMTP id k6mr296631ibx.92.1267484694428; Mon, 
	01 Mar 2010 15:04:54 -0800 (PST)
In-Reply-To: <b6ebd0a51003011451l7ae5cb04k772a760646765e6c@mail.gmail.com>
References: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
	<1267392928.13054.1.camel@andromeda>
	<19c1b8a91003011411p420a449dw3c03d03c6f5cec9a@mail.gmail.com>
	<20100301223055.GF15391@denix.org>
	<b6ebd0a51003011434j12eeb427u9dd959f23795b642@mail.gmail.com>
	<19c1b8a91003011449i33db116dud9d181e5bc78d5c5@mail.gmail.com>
	<b6ebd0a51003011451l7ae5cb04k772a760646765e6c@mail.gmail.com>
Date: Mon, 1 Mar 2010 15:04:54 -0800
Message-ID: <19c1b8a91003011504s51e2d0f8p7b691f92a64afc34@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} glib-2.0 cleanup
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
X-List-Received-Date: Mon, 01 Mar 2010 23:08:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 1, 2010 at 2:51 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Mon, Mar 1, 2010 at 3:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mon, Mar 1, 2010 at 2:34 PM, Chris Larson <clarson@kergoth.com> wrote=
:
>> > On Mon, Mar 1, 2010 at 3:30 PM, Denys Dmytriyenko <denis@denix.org>
>> wrote:
>> >
>> >> On Mon, Mar 01, 2010 at 02:11:54PM -0800, Khem Raj wrote:
>> >> > On Sun, Feb 28, 2010 at 1:35 PM, Michael 'Mickey' Lauer
>> >> > <mickey@vanille-media.de> wrote:
>> >> > > Am Sonntag, den 28.02.2010, 20:39 +0100 schrieb Frans Meulenbroek=
s:
>> >> > >> We have 26 glib-2.0 recipes (and 8 native ones). (see ls below)
>> >> > >> Only a few versions are used (see also the grep below)
>> >> > >>
>> >> > >> for glib-2.0:
>> >> > >> "2.12.12"
>> >> > >> "2.16.4"
>> >> > >> "2.18.3"
>> >> > >> "2.20.3"
>> >> > >> "2.22.1"
>> >> > >> "2.22.4"
>> >> > >> "2.6.4"
>> >> > >> "2.8.6"
>> >> > >>
>> >> > >> for glib-2.0-native:
>> >> > >> "2.16.1"
>> >> > >> "2.18.0"
>> >> > >> "2.22.1"
>> >> > >> "2.22.4"
>> >> > >>
>> >> > >> Both include the last two versions
>> >> > >> Proposal is to remove all versions that are not used.
>> >> > >>
>> >> > >> How do people feel about this?
>> >> > >
>> >> > > Sounds good to me, althoug I'd recommend not removing them but ju=
st
>> >> > > moving them out of sight, i.e. in an 'old' folder. That way we co=
uld
>> >> > > please both the lets-keep-everything-no-matter-how-rotten and als=
o
>> the
>> >> > > lets-strive-for-few-high-quality recipes.
>> >> > >
>> >> >
>> >> > FWIW I like the idea of having 'obsolete' recipes so moving them to
>> >> > recipes/obsolete may not be so bad.
>> >>
>> >> +1 on this one, since we already have recipes/obsolete in BBMASK by
>> default
>> >> and it will reduce parse time for obsoleted recipes. And git-mv does =
a
>> nice
>> >> enough job of preserving commit history...
>> >
>> >
>> > To clarify, git-mv is no different than a git rm + git add. =A0It's th=
e
>> > analysis tools like git diff-tree/log that know how to identify a
>> copy/move
>> > in a commit. =A0:)
>>
>>
>> so git mv will also increase our repo size then ?
>
>
> What?

because of git add I thought... alright you might have meant the
behavior but not operation
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


