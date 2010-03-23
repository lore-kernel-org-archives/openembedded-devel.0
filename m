Received: from mail-qy0-f195.google.com ([209.85.221.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Nu6gY-0002hy-DC
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 17:10:31 +0100
Received: by qyk33 with SMTP id 33so2651368qyk.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 09:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=e7gduJnkhaKHRBtw0MnQS/D5hinrV/KKRulRb8rb5f8=;
	b=KveiDqGbKxzzaEhgt7mHJ2UO4AdDy2Utt1rg0Cw1kelPjA7Hwj7pFDA94/AkzBcCZF
	UysvPyqLtwNTJ/gM1EjyGzyr/8SPOf+0mzTefTcg23mjFf79CtarzfDVjXlrNgNVDDOz
	nvJchTk4/jxxIbkOiDRwLmcS+MtUm4JXhFr+I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=KiMM09gvNv5csZTTe3LHMb7XL//ks01wL022GmedVmtvpRc7XcU4WDz2tUij6R1uyg
	VBosj74iCDgHNlr5mZTSDkm3dSxjNP6fea1JE/l9d5Tm3YuNW08LycIM8BmV31pGsK2c
	7x9J3qxG5PpACeTMgL6nZF7klh4V71DmrWcYI=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.213.81 with SMTP id gv17mr2854669qcb.14.1269360441102; 
	Tue, 23 Mar 2010 09:07:21 -0700 (PDT)
In-Reply-To: <20100323155700.GF21210@jama>
References: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com> 
	<20100323094757.GE21210@jama>
	<b6ebd0a51003230841g5fa61480t6330eda0d27596d2@mail.gmail.com> 
	<20100323155700.GF21210@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Mar 2010 09:07:01 -0700
X-Google-Sender-Auth: d1d68c35074318be
Message-ID: <b6ebd0a51003230907u767ef141icafb3dd88b381883@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.195
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: BBVERSIONS
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
X-List-Received-Date: Tue, 23 Mar 2010 16:10:31 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 23, 2010 at 8:57 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Tue, Mar 23, 2010 at 08:41:14AM -0700, Chris Larson wrote:
> > I also agreed that it's nicer to duplicate a tiny amount of metadata than
> to
> > have a giant file full of overrides, but with BBVERSIONS, you could keep
> > every minor version of a given major version around.  Keep one recipe per
> > major version, just keep all the minor versions around.  It really
> doesn't
> > take that long to fire off a loop that builds all variants, I have a
> script
> > for it - bitbake sets a variable that lists them all, but like I said in
> the
> > start of the thread, personally, I'd rather see the versions available,
> and
> > relatively easy to fix if they break, than either remove them entirely or
> > let their recipes bitrot.  That's my personal opinion, of course, I'm
> sure
> > others disagree.. but I do think this feature could be useful, even if we
> > don't keep every version around, since it makes it easier to share
> metadata
> > across multiple versions without having to create a pile of extra .inc's.
> >  foo.inc and foo_ver.bb is great, foo_1.x.inc, etc gets messy fast.
>
> Yeah loop is easy for build test, but it doesn't say anything about how
> it works on device.
>
> From my POV existance of foo_1.3.2.bb signs that at least someone used
> it in some point in time on some device and it was usefull for him, but
> existance of 1.3.2 in some version range doesn't show which minor was
> tested/used and which was added automagically because of BBVERSIONS
> existence.
>
> Again it's also my limited imagination and if it's used only for recipes
> which existed before in OE and were almost the same, it can save few files
> which is nice.
>
> Not sure how zecke's audit script and resulting cleanup/fix-up for whole
> tree will work when BBVERSIONS extends available versions with some
> vulnerable minor version and nobody will be willing to backport security
> patch from latest.
>
> Just my 2c.


Fair enough, there are valid concerns here, though I think some exist with
or without the bbversions mechanism to a certain extent.  If a minor version
is buildable that isn't patched with the security patch, remove it from the
BBVERSIONS variable.  Not that different from what you'd do today, just with
less individual recipes.  I'm not proposing that we sit down and turn every
recipe into something like what I'm playing with with nano, where you can
build any version that exists, this is just a proof of concept, to
experiment with the new possibilities for structuring of recipes.  I expect
in the real world we'd start by using it to consolidate some metadata, as
you mention, and add only versions which we already have, or have tested.
 Do you think the feature would be useful in this way?

Of course, ideally, we'd set up more testing of things on the target with an
automated testing system of some sort, to make it easier to confirm that we
haven't broken things in other versions and other architectures (and this is
a concern today too).

Are there any concerns about this feature existing actually being a problem,
in that it will encourage people to start using it, or should we get it into
master and see how it goes?  We won't be able to really utilize it in OE
until 1.10 releases and we bump our required bitbake to 1.10 anyway, which
is why I'm doing the testing and experimentation outside it for now.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

