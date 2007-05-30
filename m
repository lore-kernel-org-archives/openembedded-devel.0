Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1HtEtV-0006A2-9S
	for openembedded-devel@openembedded.org; Wed, 30 May 2007 05:30:43 +0200
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 19C7E4125E6
	for <openembedded-devel@openembedded.org>;
	Tue, 29 May 2007 22:29:08 -0500 (CDT)
Message-ID: <054801c7a26a$7aec5450$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@openembedded.org>
References: <038201c79f6a$f9859720$6e01a8c0@twilight>
	<432beae0705281317t3464bacfr833d7ed6b28f374@mail.gmail.com>
	<1180471592.5822.81.camel@localhost.localdomain>
Date: Tue, 29 May 2007 22:27:41 -0500
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: Re: PREFERRED_PROVIDER syntax is eluding me...
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2007 03:30:44 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

First, sorry for the late reply.

Richard Purdie writes:
> What you didn't say is that you did:
>
> PROVIDES_unslung = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc
libc6-unslung"

Yes, I committed that change/fix over the weekend (see below).  Previously
it read just:
PROVIDES_unslung = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
(without the final "libc6-unslung" on it).

> so this file no longer provides glibc and therefore anything involving
> glibc won't help. At a guess I'd try something like:
>
> PREFERRED_PROVIDER_libc6-unslung = "libc6-unslung"

I actually used:
PREFERRED_PROVIDER_libc6-unslung = "glibc"
My logic was that there were multiple providers for libc6-unslung (glibc's
bb file and glibc-initial's bb file), and that the value the variable was
set to referred to the bitbake recipe that should be preferred for building
of the object named "libc6-unslung".

I tested with so many combinations that my eyes crossed.  I don't recall if
that combination (the change to PROVIDES_unslung above was ever tested with
PREFERRED_PROVIDER_libc6-unslung="libc6-unslung", or not.  I can test that
if that's a more correct solution.

> Of course I have to ask why you're doing this at all? It looks a bit
> hatstand and I wonder why PREFERRED_VERSION_glibc = "2.2.5" wasn't
> enough? ;-) (not that it shouldn't work)

Hatstand, huh?  :-)  I haven't heard that expression, but I think I get it
:-).  I committed the fix I discovered, not because it was necesarily The
Right Fix(tm), but because it worked and the changes were guaranteed to be
localized to Unslung (i.e. I wouldn't risk messing up anyone else's distro's
with the fix I selected).

As for why it's this way, I can't say.  Unslung is itself a strange
creation - and its been in OE for a long time.  Together that seems to
result in some strange constructs.  I'm striving to keep it building in OE,
in the hopes that there might be a compelling feature or event that would
make a new Unslung release interesting at some point in the future.
However, the likelihood of such an event currently appears to be slim enough
that I'm not sure it's a good idea to do significant rework and retesting on
it, frankly.  So I'm in favor of a small simple fix, even a kludgy one, if
it'll work.

> Cheers,
>
> Richard

Thanks!  If you or anyone else has strong feelings about this, and how it's
been addressed, let me know (preferably with some guidance on what would be
acceptable).

Regards,
Mike (mwester)




