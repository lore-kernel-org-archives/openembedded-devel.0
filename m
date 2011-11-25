Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RTqMY-0002GP-A7
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 08:38:22 +0100
Received: by vcbfo13 with SMTP id fo13so156584vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 23:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=WHJy1U+piDEr+NFzgr5UAmfMk27de815d0bzc1PnC3E=;
	b=FcEHJe5Z0exa28UUcINh84gqdxWGy5kCXw8go5RLOpoK5b4CD8qvUCkV0DKLcn3RPi
	29Yyn8/53LiRyfxnGqPlC6Jn+mTOvtb4Ombs7hut8fVk96LzPSxQbWdvUAlHjnidpJct
	qkCgZb2+dKCf2uA0/6mDZa3l6VA8o90tMyctk=
MIME-Version: 1.0
Received: by 10.52.33.140 with SMTP id r12mr33081764vdi.36.1322206307718; Thu,
	24 Nov 2011 23:31:47 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Thu, 24 Nov 2011 23:31:47 -0800 (PST)
In-Reply-To: <CAFU7RzM5-VAbs2-5qR-D6eo5+LsVQc+e3rGK6zZ5NvviSvUWig@mail.gmail.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
	<ED3E0BCACD909541BA94A34C4A164D4C401A0AC7@post.tritech.se>
	<0C757E680E33864AB113392C7E83F910BE5242@GSX300A.mxchg.m.corp>
	<CAP9ODKrviqf=GN12Y6OKE0ajsG7v+fFWnWDHp=K1-YFzvQi-pA@mail.gmail.com>
	<1322134409.3391.21.camel@mattotaupa>
	<CAP9ODKrKN3m_V09j6+C1dL9P8yHtuck4P5jcdKv4Ua=mrP1E=Q@mail.gmail.com>
	<jalvr1$3bl$1@dough.gmane.org>
	<CAFU7RzM5-VAbs2-5qR-D6eo5+LsVQc+e3rGK6zZ5NvviSvUWig@mail.gmail.com>
Date: Fri, 25 Nov 2011 08:31:47 +0100
Message-ID: <CACW_hTY9ybnax9xHb1KV4Y25J3nNRkQqCs=TqUivcBcYOT7BkA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Fri, 25 Nov 2011 07:38:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Some global comments.

First of all I think it is good that we have this discussion, and that this
is discussed with the community, not solely within the TSC.

Wrt keeping master alive:

I feel it is better to have a central spot to put patches to be cherry
picked, than everyone making e.g. his own github project (at least having a
central spot is less work and less cumbersome).
Cherry picking from oe-core/meta-oe is of course also possible, but also
has a higher chance to encounter problems. E.g. the patch may not apply or
the recipe may not be parseable by the bitbake used in maintenance (because
oe-core uses a newer bitbake or different class files).

Also switching from master to the maintenance branch may not be possible
for all projects. This may depend on phase of the project, internal
policies, time etc.
(actually I did a test to move one of my projects to the maintenance
branch, several of the recipes did not fetch any more (mostly due to the
kernel.org situation))

For me, and from reading the discussion master still serves a need for some
of us, so why close it down. Actually I have not really heard any
compelling (compelling to me that is) reason to close it down.
Yes, for new projects most likely oe-core is the best choice, but I feel
people are capable enough to make that choice themselves; and, over time,
both the classic master branch and maintenance branch will die. For now it
is still useful for some of us, so my preference would be to keep it
available and writable (if only as a sort of 'alpha/draft' version of
maintenance).

After all, isn't one of the purposes of OE to promote information sharing,
cooperation and the use of openembedded technology (and not make things
harder).

Best regards, Frans

'PS: Thinking of it, we might consider a README file; and/or some text in
the git description to suggest not to use classic for new developments.

