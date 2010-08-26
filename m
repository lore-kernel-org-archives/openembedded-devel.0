Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OodRF-0000ZL-8C
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 16:28:21 +0200
Received: by eyb7 with SMTP id 7so1339179eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 07:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=XFhmNaMHYY4CmiEpzT4dwwDBKXIpcsyD1eR5WTHD3v0=;
	b=nofDUFdXFxLt6O7y5TNro19mhH1YgjSKav/KIN+EiOEN7fpaASC4NwBQxCIRozPe0H
	gNI6//5FyLY8Z9Ds13NaQkuvq+9nV4Am9wrxVNk1AYculAeHLsTvaJqFCW2+z+J6Ra4H
	055ozFPW9pECn5sGAYEufvEXhCJm0m1QBDdPY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=BSyPJ6ECMPdpXfFcop7dGgDTaGea3TOb5eekHxjkJ6An0TnUTIlfoIrKJIuJ2SKR3E
	20/5yGHawARM2Sf/zvcQX+tnn/NsiKUlEFQDDvUlWBgEE7wibtsCHGXMqt5La/PeeZtI
	PAot+LzQa4ezByTMeA6C/YRZURC/tZnxbpcso=
Received: by 10.216.187.143 with SMTP id y15mr9054459wem.74.1282832875340;
	Thu, 26 Aug 2010 07:27:55 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Thu, 26 Aug 2010 07:27:35 -0700 (PDT)
In-Reply-To: <AANLkTikqFLr7yc-Q9ucNTaifi-Oup0hyhgSo7AmT1sJA@mail.gmail.com>
References: <AANLkTik0bbo2=KrKw2+_Y4D-5Kc6O0OPynt8qd7cs6JH@mail.gmail.com>
	<AANLkTimBkaij-xQ2w+HEHgnZgss7dR4gJMXMtWU7qWX0@mail.gmail.com>
	<AANLkTikqFLr7yc-Q9ucNTaifi-Oup0hyhgSo7AmT1sJA@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 26 Aug 2010 07:27:35 -0700
X-Google-Sender-Auth: bWofjFUaIekfl2HY_aoHqDhn1AA
Message-ID: <AANLkTinafU3d3yABuoieUrwLbhrw1qzkuLwdc2FNzFZj@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: how to add file to SRC_URI for target only
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
X-List-Received-Date: Thu, 26 Aug 2010 14:28:22 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 25, 2010 at 11:14 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/8/25 Chris Larson <clarson@kergoth.com>:
> > On Wed, Aug 25, 2010 at 2:04 PM, Frans Meulenbroeks <
> > fransmeulenbroeks@gmail.com> wrote:
> >
> >> Is it possible to add a file to SRC_URI for target only in a combined
> >> native/target recipe?
> >>
> >> Of course I know I can fully redefine SRC_URI, but I feel that is less
> >> desirable.
> >> The issue is that the target recipe needs an additional patch that the
> >> native recipe cannot use.
> >>
> >> Or do we need to introduce an _target suffix?
> >>
> >> Guess an intermediate variable also could do the trick.
> >> E.g.
> >>
> >> PATCH = "xx.patch"
> >> PATCH_virtclass-native = ""
> >> SRC_URI = "source and files and patches ${PATCH}"
> >>
> >> not really ideal either.
> >>
> >> I saw some other places where we need to tweak similarly with DEPENDS
> >> e.g.
> >> DEPENDS = "x"
> >> DEPENDS_virtclass-natvie = ""
> >>
> >> guess here _target could help too.
> >>
> >> Any ideas/comments/patches/... ?
> >
> >
> > Something like this should work:
> > DEPENDS += "${@['', 'foo']['${BPN}' == '${PN}']}"
>
> Wow.
> I think it indeed does, but my knowledge of the language is not that
> good that I can say for sure.
> The construct above also is not too understandable for beginners. I
> think in this case I prefer an overrriding _virtclass-native
> assignment (or a new-to-be-introduced _target suffix).


Okay, how about..

OVERRIDES =. "${@['', 'target:']['${BPN}' == '${PN}']}"

:)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

