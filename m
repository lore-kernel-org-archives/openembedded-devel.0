Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Q2UkE-0003q3-4j
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 21:33:30 +0100
Received: by iyb26 with SMTP id 26so9343517iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 13:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=YEC72Ii0wyuvxVejdqX9NplwBlJM8UQxt1KfqQgcCTk=;
	b=f//Iz+i66mUQnNdK2abSQ9pGW28DRcpqK2vG5rku50FgulVEx1Ppjp0lnucQcRubmm
	B/brgnoWv7quQJ1xJIHbMHBOR96bGH1CVFb1C+2iAAGAwn/uw8YsGK+zsAibdwKkJARw
	rJ4fbxB5To1fWaVGsS2mJ9h+rFSyMW72PU9VI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=RuID0f2IWdmo1T4uYGejei2Bxgli64ms3j5OrEd9Awk5WDABPlJzQkejY9UVZZ/JGu
	5IIliBF3MCp5BWP9JLQxfDHJuSlCktje9mmxvbcLKcVfwEAonMNjRZaaw418Xq49/gAs
	R/4FcmxOIOwKZz6WKTUMDSHojcTyP8HZ3252E=
MIME-Version: 1.0
Received: by 10.43.61.138 with SMTP id ww10mr1648713icb.390.1300912297001;
	Wed, 23 Mar 2011 13:31:37 -0700 (PDT)
Received: by 10.231.13.69 with HTTP; Wed, 23 Mar 2011 13:31:36 -0700 (PDT)
In-Reply-To: <87wrjrv894.fsf@eha.doredevelopment.dk>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
	<1300360696.2132.14681.camel@phil-desktop>
	<1300373028.2468.8.camel@eha>
	<1300374439.9054.21.camel@phil-desktop>
	<1300384355.2175.13.camel@eha>
	<1300385153.9054.44.camel@phil-desktop>
	<1300391907.2175.23.camel@eha>
	<1300395614.3026.2.camel@lenovo.internal.reciva.com>
	<1300426143.8862.0.camel@eha>
	<1300443987.9054.64.camel@phil-desktop>
	<87ei6439rz.fsf@eha.doredevelopment.dk>
	<1300494744.30423.2239.camel@rex>
	<87wrjrv894.fsf@eha.doredevelopment.dk>
Date: Wed, 23 Mar 2011 21:31:36 +0100
Message-ID: <AANLkTimDBFxBXyXnxX3wm_D=aE5CsPuLEP2N1FUws2aW@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Eliminating dependency race-conditions
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
X-List-Received-Date: Wed, 23 Mar 2011 20:33:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

pb and I had a discussion about this on irc earlier today.

Actually we feel there are three different issues in the proposal:
1. only stage those recipes that are in DEPENDS.
2. stage based on packages instead of recipes (so e.g. you can stage
only a lib package)
3. use tar (or a different tool) to stage things; or in other words,
decouple the storage format and the package format.

I think each of these has its merits. I also understand that
incremental introduction is desired above a big bang approach.

Let us look at the issues in detail:

1. only stage those recipes that are in DEPENDS.

This seems pretty useful as it gives consistent builds not depending
on whatever you have build before (and so making things deterministic)
This is especially useful when doing incremental builds. It can also
solve races.
Introducing it would mean changes in staging; incremental introduction
is possible if e.g. we add a flag PACKAGE_BASED_STAGING or so to the
recipes we want this to have (or add a special class or so).
Once all recipes are moved, the flag can be removed again.

Question is how efficient this can be. It mostly depends on how we
want to achieve the staging.
I'm definitely no expert, but we could e.g.
- create the staging area from earlier package images each time we
build it. Does not seem overly efficient
- stage each package in its own dir and create symlinks in the
required staging area.
- stage each pacakge in its own dir and add to -I and -L to only stage
the packages that are needed.

The staging area for a package to be build should probably be within
the work dir of the recipe otherwise we'll loose the capability to
build things in parallel

2. stage based on packages instead of recipes (so e.g. you can stage
only a lib package)

This gives more fine grained control. Not sure how much it brings and
what it will cost.
It might be possible to do it incrementally by e.g. having a keyword
PACKAGE_DEPENDS.
Question is if it is worth the effort

3. use tar (or a different tool) to stage things; or in other words,
decouple the storage format and the package format.

To me that is a completely different question only loosely related to
the above.
If staging is from packaged images, it would help though to have a
format that is fast to unpack.

Another, perhaps more interesting reason, would be to use a package
manager agnostic format and use that to build packages from (for the
package manager you want to have it).
I don't oversee the impact of this one though.


Your opinion on this proposal, improvement suggestions, discussion on
the best way forward etc is appreciated.

Frans


