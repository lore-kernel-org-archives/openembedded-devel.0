Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6Qsl-0007s8-Au
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 18:42:25 +0200
Received: by wyb40 with SMTP id 40so2733523wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=v5md/urBjj+1Tetel/nAWby4E2BR5/Xk/1lrH3oVXKo=;
	b=njadRoB+r38edEYyOQjA2EQW5+4H2LWHzNe49RxWmo5Va6FThX9uKUZiez4zJ4qD0Y
	3SCvkazyBQBsKzl0wr1OE6d4eCrBNeodMlxNYAB+vB5VXIV1rl2GUyfvYLTvdBGJ45Nz
	D3jW1q1rhdQWOjT7NFJCKt2QFA9kVZRyVFo3c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Ga3k+Ba6PVzcYlqc23OHh79amYW/6g5nJj4RXLLvYkvP3ZU6NiU2Z15B6/6YJJUDqU
	NfZxxvsb1hCylHCAXU64e/9VOzlaU4G4sFsZhIpA7c68LbMFClpjmxTWixZoRurGzEYV
	iY0/FjCBNmAeHHMUh59vZFxPogxHPLHJTAZ34=
Received: by 10.227.154.68 with SMTP id n4mr10543937wbw.114.1287074510519;
	Thu, 14 Oct 2010 09:41:50 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Thu, 14 Oct 2010 09:41:30 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310FFA9BE@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080310FFA839@dlee06.ent.ti.com>
	<AANLkTik1nA1jC9f-Vvep2=8U9+VXAWBwPFaRaZC0f4Op@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA874@dlee06.ent.ti.com>
	<AANLkTinfQjRpwjYYL-6+He_z3tB6wm3kcW0CSEAqFVuh@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA982@dlee06.ent.ti.com>
	<AANLkTimRwRDxmvDrPktrK=xjfrmRada_iWRuXH6tqa4o@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA9BE@dlee06.ent.ti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 14 Oct 2010 09:41:30 -0700
X-Google-Sender-Auth: Olp_ju9omPPyqWKmYHQevjj02fo
Message-ID: <AANLkTikbJgDWRpKbwtxD3nXfxay1BUgc=JWRZKGMaMWL@mail.gmail.com>
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
Subject: Re: Question about OVERRIDES precedence
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
X-List-Received-Date: Thu, 14 Oct 2010 16:42:28 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 14, 2010 at 9:37 AM, Maupin, Chase <chase.maupin@ti.com> wrote:

> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Chris Larson
> > Sent: Thursday, October 14, 2010 10:34 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] Question about OVERRIDES precedence
> >
> > On Thu, Oct 14, 2010 at 8:29 AM, Maupin, Chase <chase.maupin@ti.com>
> > wrote:
> >
> > > So are you saying that we are just going to change the order of how
> > > OVERRIDES is appended to in OE like Denys was suggesting?  That would
> > still
> > > lead to issues like local not being the highest priority unless we
> would
> > > also change bitbake.conf to define OVERRIDES as
> > > "${TARGET_ARCH}:${TARGET_OS}:${MACHINE}:local".  That way we could
> > prepend
> > > OVERRIDES in OE and still have local be the last one evaluated.
> > >
> >
> > No.  What I'm saying is, the definition of OVERRIDES in bitbake.conf will
> > be
> > reversed.  Not that difficult to understand.  I don't know how I could
> > possibly be any clearer here.
>
> Great.  I assume this will be on the 1.10 branch as well as the master
> branch?  Is there anything I can do to help here?
>

There is no 1.10 branch in OE, so no.  Again, we're changing it in OE, not
bitbake.

I guess with the reversal of the definition in bitbake.conf we can then
> change the appends to prepends in OE as well as reversing the definitions
> there.  That way the OVERRIDES list should be built up in the proper order.


Yes, indeed, though I suspect that the existing prepend/appends were done by
people not thinking about the order, so they may not be  correct the way
they are now anyway .. :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

