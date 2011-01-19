Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PfTgO-0004PM-UN
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 09:46:25 +0100
Received: by iwn8 with SMTP id 8so594056iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 00:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=0pscqWXrWi73wXE6qzdFXUpyaAQzh3uYjjBfok9Hwns=;
	b=BwFOA76+eo8BCOnWe5tHPhveLmCr/aLKgIfOiUPOQyMaMjceAB11Kvhzs9MURkCyJg
	9MtqtIIRlwXpjEnD1mApeQS6NERpZYW5K/l1xHpl4fXpbZvXCZym36kEpVcuEONNsQsl
	qUgkkNP3b/FoK7YBM5owOeqn1sfOqc0Vk7Y60=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gvzVanGW4MLk/sEAogzMuiUFYTB4sh/QSICE7yLhcS1t2MI6Ij0nDEbXPIm2QHtxtc
	Zk8uBPs9UyBfWZif8d6AXAYHgGhFNnPAgmmoFXXydbwyxPozO5ItSB4+zwclbXod/p24
	zoVNRwRw0BgdS7RgLED6iYE5MDWYSo4+Yg/Fg=
MIME-Version: 1.0
Received: by 10.231.35.5 with SMTP id n5mr417631ibd.159.1295426744775; Wed, 19
	Jan 2011 00:45:44 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Wed, 19 Jan 2011 00:45:44 -0800 (PST)
In-Reply-To: <ih52qr$l1v$1@dough.gmane.org>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<4D35FC8B.1090404@mentor.com> <ih52qr$l1v$1@dough.gmane.org>
Date: Wed, 19 Jan 2011 09:45:44 +0100
Message-ID: <AANLkTi=A2kgqgkhfw4p_Og8k9y1MBMrZLDvgwuq5Mxfj@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Wed, 19 Jan 2011 08:46:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/18 Koen Kooi <k.kooi@student.utwente.nl>:
 if we make the delta between the 3 be just
>> the SRC_URI + checksums?
>
> Something like:
>
> * keep gplv2 around if upstream switched to gplv3 at some point

agree; as said before suggest to reflect the switch in the name of the recipe.

> * allow old stable, stable and dev (e.g. glib 2.24, 2.26 and 2.27+git)

I'd say retire old stable after a while (e.g. after stable is there
for half a year, unless of course there are compelling reasons to keep
it).
Wrt dev: if we want to go to a maintainers model similar to u-boot and
linux, I would expect this to live in a separate branch or layer.
Once proven stable the maintainers pulls it into the core archive.

> * allow active contributers some leeway to test multiple subreleases
> (e.g. busybox 1.18.[0-99]

Again here, I feel it is much better to put it into a different branch
or layer, and once stable it is pulled into the mainline.
Again similar to what Linus and Wolfgang do.

> * The maintainer can have as many versions as he wants to.

my preference: not in the main layer.

> * toolchain is exempt from all that since having 20 binutils versions is
> sometimes needed when building for 20 different archs[1].

Fully agree.
>
> But I seriously think we are overengineering this. We should have people
> actually working on oe-core and meta-oe reach a consensus when
> encountering problems.

I beg to disagree on this.
We have a unique opportunity at hand to improve, so it seems wise to
raise the bar quality wise.

E.g. wrt what Richard wrote in the start post

[quote]
* Creation of a subset of metadata that has a consistent high quality
 standard:
   - removal of legacy components (pkgconfig hacks, libtool hacks,
     legacy staging, unneeded compiler arguments)
   - consistent metadata layout, spacing, use of variables
   - migration away from outdated practises (e.g. use BBCLASSEXTEND)
[/quote]

I feel when migrating recipes we should also assure that they adhere
to a certain quality standard. That would need us to define a minimal
standard though.
Currently I feel we are just moving recipes, only fixing what is
really needed to get things running (like removing legacy staging)
whereas we could do much better.
There are currently some things in OE that could use some improvement
and we should take the opportunity to improve.l

And yes, I have no problem in spending time to improve things, but if
there is no consensus on where we should go this is not going to be
effective (and actually makes it harder to improve quality wise).
To take the bikeshed analogy up again. It does not really help if
everyone start to paint in his own favourite color (unless maybe if
you are still stuck in the flower power era).

Frans


