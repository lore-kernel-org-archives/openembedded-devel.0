Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Oq99Y-0007Wy-M4
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 20:32:25 +0200
Received: by wyg36 with SMTP id 36so6344716wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 11:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=g47O5jXGqNuuO+CNGjO3EE5gwUcV4kpNsPcN/yUzvfY=;
	b=uQ10TXF+aeFBDpcKrMSo2kzAreXwQb7sjHAHT+AJN19YhjO3IQNUmPgHVdaysxHM7a
	hORUwiDch1MGpTwId/0ude2z4Y2kq0BNEtPj0iFn1ivqx0GajAjEtL3kbJjxvgq+Jo8m
	QaV3+gr/Esme1uhum7iWrqB820phfr/PbvTC4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=bvtOhCvT9Mh/jUvRRMAaYB4uTLLyowhlJpjC3AakXOCmXUfNnpmch8j+CQ0UhCre0I
	npwU03cBDnwCXHiOaKjS3Iifwkvvpt/N5iybzi8oTyjvF3uZ+yztQTLbTHZ36VW57HY2
	3iSzteL/4Q1BOxdNRvYjunoVlKXZGOYKRFux4=
Received: by 10.216.187.143 with SMTP id y15mr5273132wem.74.1283193108256;
	Mon, 30 Aug 2010 11:31:48 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Mon, 30 Aug 2010 11:31:28 -0700 (PDT)
In-Reply-To: <AANLkTinr5r8Jtd+ZWznHaBBSK1cB=+XjzDRAPuet1+tr@mail.gmail.com>
References: <AANLkTik0bbo2=KrKw2+_Y4D-5Kc6O0OPynt8qd7cs6JH@mail.gmail.com>
	<AANLkTimBkaij-xQ2w+HEHgnZgss7dR4gJMXMtWU7qWX0@mail.gmail.com>
	<AANLkTikqFLr7yc-Q9ucNTaifi-Oup0hyhgSo7AmT1sJA@mail.gmail.com>
	<AANLkTinafU3d3yABuoieUrwLbhrw1qzkuLwdc2FNzFZj@mail.gmail.com>
	<AANLkTi=qX7ksv67Hj=7ocbfiSkM4mDU1w-fAUFWP9EJt@mail.gmail.com>
	<AANLkTimtj4nLzXBR5j=MJ6htymbtVQh93YK=F-Sa8bA0@mail.gmail.com>
	<AANLkTinr5r8Jtd+ZWznHaBBSK1cB=+XjzDRAPuet1+tr@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 30 Aug 2010 11:31:28 -0700
X-Google-Sender-Auth: 7e4zruaLWC1EISO5dPSDiDHP5l0
Message-ID: <AANLkTin+3XSMcnYqk4HNC4C2Mur4zsQw5Oc9nV2hbGOS@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
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
X-List-Received-Date: Mon, 30 Aug 2010 18:32:26 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 30, 2010 at 11:18 AM, Esben Haabendal
<esbenhaabendal@gmail.com>wrote:

> On Mon, Aug 30, 2010 at 7:07 PM, Chris Larson <clarson@kergoth.com> wrote:
> > On Mon, Aug 30, 2010 at 9:52 AM, Esben Haabendal
> > <esbenhaabendal@gmail.com>wrote:
> >
> >> On Thu, Aug 26, 2010 at 4:27 PM, Chris Larson <clarson@kergoth.com>
> wrote:
> >>
> >> > Okay, how about..
> >> >
> >> > OVERRIDES =. "${@['', 'target:']['${BPN}' == '${PN}']}"
> >>
> >> I can also think of at least one way to do this without using anonymous
> >> code.
> >>
> >> In base.bbclass:
> >> RECIPE_TYPE = "target"
> >> OVERRIDES =. "${RECIPE_TYPE}"
> >>
> >> In native.bbclass:
> >> RECIPE_TYPE = "native"
> >>
> >> In cross.bbclass:
> >> RECIPE_TYPE = "cross"
> >
> >
> > And nativesdk, and sdk, and crosssdk, and cross-canadian, and.. ;)
>
> Exactly.  But that is about it. The number of recipe types are really
> quite limited.
>
> This type of override is quite similar to the virtclass-* overrides,
> just that it can be used independent on what recipe type is the
> original one (not virtual).
>
> Anyway, I were merely illustrating that a more efficient solution is
> there, and could even be argued to be "cleaner" than the alternative.
> Of-course, the last part is quite subjective, so anyone is free to
> disagree.


The logic already exists.  SPECIAL_PKGSUFFIX has to have current information
about the suffixes in order for BPN to be correct.  It seems pretty silly to
duplicate it, but whatever works.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

