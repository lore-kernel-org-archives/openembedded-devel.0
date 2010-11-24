Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1PLC31-0000Vu-8I
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 10:53:55 +0100
Received: by gwb11 with SMTP id 11so163975gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 01:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=75oPDSIWZRFol0pTJGK0aqvvQS5vyk9Q9ES66kPlvk4=;
	b=nREJRo39RIeMsl8bfpS0XSWeGhU5uyPCd6wRks5WzovPP1eqVzacJVsGOF8XBWnu6L
	X1U8VWk4rCnO2YEB5BIzq1lLgApYzGZMm7qFx5ENiCbQiwFJB0ZxfQ11sVO2r2SdTiWe
	deM3dsCVFw6JLt3aC2LUmTFqGY/GnEpixjimg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qQagqOuZGw5BHgVHj+zDISC5yNvTdqSl8PFeatfpfLKq9wUSbhUh3XsQbCbZJ8r6Ox
	DMSbLSir+TbyYHUWmTcXBS1cfjxwcg9+ZRUbU7l0dIvCRSbVEB/NzwhO8gzHSsct5UzY
	zaDwu4ZKKjgyvJ+LND+vedc3DhE4Jcx0arFcM=
MIME-Version: 1.0
Received: by 10.100.195.4 with SMTP id s4mr6064312anf.7.1290592360080; Wed, 24
	Nov 2010 01:52:40 -0800 (PST)
Received: by 10.100.47.6 with HTTP; Wed, 24 Nov 2010 01:52:40 -0800 (PST)
In-Reply-To: <AANLkTik022J6+49_rQZ5mk2o3x79t6vc5Z6yEiRY8izM@mail.gmail.com>
References: <AANLkTimVOOQ28E1NfJm5Rim4X+WmvXAtOSJ9W34KH7X-@mail.gmail.com>
	<AANLkTik022J6+49_rQZ5mk2o3x79t6vc5Z6yEiRY8izM@mail.gmail.com>
Date: Wed, 24 Nov 2010 10:52:40 +0100
Message-ID: <AANLkTineOx1jewpHS_tC=5tBxgqt+z2Mq8EfceZ0zUuD@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: openembedded / dpkg-buildpackage hybrid
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
X-List-Received-Date: Wed, 24 Nov 2010 09:53:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Chris Larson <clarson@kergoth.com> writes:

> ...  Right now the OE sysroot (where files are shared
> between dependencies) is global, rather than per-recipe, and if
> multiple versions of something get yanked into a build, they'll step
> all over one another in that sysroot.  We've discussed possibly moving
> to per-recipe sysroots in the past, constructing them on demand based
> upon what that recipe requires, but we're not there yet, ...

If I may be so bold, why is OE not going in that direction full speed?
We seem to (at best) to be on a very long detour...

It "just" requires rethinking that way DEPENDS is handled, which will
end up being much more like RDEPENDS is done now.  A recipe depends on a
number of "items".  Items are provided by packages, and packages can
(recursively) depend on other items.  When constructing the runqueue,
the task that sets the stage depends on the task that packages stage
packages on all recipes that provides any of the (recursively) needed
packages.

Looking at build dependencies just makes so much more sense IMHO, and a
lot of issues that OE has/is fighting goes away.  No more race
situations with a common stage dir, and no more problems with -initial,
-intermediate recipes.  It even opens up for more flexible build
dependency handling, but that is another side of it.

For anyone interested, I have something like the above (based on OE) at
http://www.gitorious.org/~esben/oe-lite/esbens-core
The entire runqueue code is rewritten from scratch, using an in-memory
sqlite database, but the concept could just as well be done based on a
truckload of Python dicts and lists, if this is more to ones liking ;-)
The interesting code with regards to this subject is in lib/oelite

It uses standard bitbake, but OE classes are heavily modified, and a
number of basic OE features are completely missing (but this is not
related to the per-receipe style staging).

So have a look if you like, or just skip it as it cannot easily be merged into
OpenEmbedded as it is now.

/Esben


