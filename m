Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1Ht8c8-00013w-FT
	for openembedded-devel@openembedded.org; Tue, 29 May 2007 22:48:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l4TKkdqW011264;
	Tue, 29 May 2007 21:46:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11157-02; Tue, 29 May 2007 21:46:36 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l4TKkVeX011257
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 29 May 2007 21:46:31 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <432beae0705281317t3464bacfr833d7ed6b28f374@mail.gmail.com>
References: <038201c79f6a$f9859720$6e01a8c0@twilight>
	<432beae0705281317t3464bacfr833d7ed6b28f374@mail.gmail.com>
Date: Tue, 29 May 2007 21:46:32 +0100
Message-Id: <1180471592.5822.81.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Tue, 29 May 2007 20:48:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-05-28 at 13:17 -0700, Justin Patrin wrote:
> On 5/26/07, Mike (mwester) <mwester@dls.net> wrote:
> > I'm missing something simple, I expect.  But try as I might, I cannot figure
> > this out.
> >
> > Bitbake 1.8.3, building unslung-image (worked fine on 1.6): Bitbake says:
> > [snip]
> > NOTE: multiple providers are available for runtime libc6-unslung (glibc,
> > glibc-initial);
> > NOTE: consider defining a PREFERRED_PROVIDER entry to match runtime
> > libc6-unslung
> > [snip]
> >
> > This is a problem, because with bitbake 1.8, without a preferred provider
> > specified, it seems to try to build both.  But only glibc builds;
> > glibc-initial fails (and the build loops forever).   This is easily fixed by
> > adding the following line to the local.conf file:
> >
> > PREFERRED_PROVIDER_libc6-unslung = "glibc"
> >
> > Except that it doesn't do a blasted thing.  Neither does this line:
> >
> > PREFERRED_PROVIDERS += " libc6-unslung:glibc"
> >
> > Thinking that perhaps the "-unslung" was implied since the machine is
> > "unslung", I tried:
> >
> > PREFERRED_PROVIDERS += " libc6:glibc"
> >
> > Still no change.  Being persistent, I tried every variant of the above that
> > I could think of, to no avail.  It seems that bitbake is not understanding
> > or processing the info provided.  The -D flag offers no further hints,
> > either.
> >
> > For background, back in the glibc bitbake recipes, glibc-initial.bb does a
> > "require" of glibc.bb (hence the multiple providers).  Near the tail-end of
> > glibc.bb we find:
> >
> > PACKAGES_unslung = "libc6-unslung"
> > RDEPENDS_libc6-unslung = "nslu2-linksys-libs"
> > RPROVIDES_libc6-unslung = "libc6"
> > FILES_libc6-unslung = "/lib/librt*"
> >
> > Figuring that perhaps the problem is that nothing actually "PROVIDES" libc6,
> > and that maybe bitbake needs to see the build-time dependency in order to
> > handle the run-time dependency PREFERRED_PROVIDER stuff, I even added
> > PROVIDES_libc6-unslung = "libc6"
> > to the glibc.bb recipe, and went back through the list of
> > PREFERRED_PROVIDERS in the local.conf file.  No luck.  No difference.
> >
> > I finally hacked the glibc bitbake recipes so that glibc-initial doesn't
> > "RPROVIDE" libc6 anymore.  Success - bitbake is happy.  But I'm not.  That
> > doesn't seem like the correct way to resolve the multiple providers issue,
> > and I expect that commiting such a change would (rightfully) anger many
> > folks.
> >
> > If some kind soul could point me to the document or another recipe that
> > provides the correct syntax for handling this, or provide a pointer to
> > whatever it is that I'm missing, I'd be most grateful.
> >
> 
> So it's RPROVIDES and not PROVIDES? Sounds like the problem may be
> that PREFERRED_PROVIDERS is for non-R.... Is there an
> RPREFERRED_PROVIDERS perhaps?
> 
> It's been a while since you posted, sid you get this resolved in the
> meantime? Richard Purdie should have more insight into this.

Er, hmm, right. The providers code is still a bit of a mystery to me
too ;-)

What you didn't say is that you did:

PROVIDES_unslung = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc libc6-unslung"

so this file no longer provides glibc and therefore anything involving
glibc won't help. At a guess I'd try something like:

PREFERRED_PROVIDER_libc6-unslung = "libc6-unslung"

Of course I have to ask why you're doing this at all? It looks a bit
hatstand and I wonder why PREFERRED_VERSION_glibc = "2.2.5" wasn't
enough? ;-) (not that it shouldn't work)

Cheers,

Richard




