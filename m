Received: from mail-qy0-f195.google.com ([209.85.221.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NuCUq-00014o-VO
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 23:22:49 +0100
Received: by qyk33 with SMTP id 33so2988749qyk.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 15:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=BbnYxTPq8Vu+6VLcavSvsaCMmuPuG2oxBDrto9VVOA0=;
	b=djv2tQ9pmXUb+f2Vd4oY5jidbmG7hT4HsmGeqLd4VTJ00fvumA6I1o+w1MelzZDkpY
	+UFIxyWM/dv1S+sHRCrNFYygp4gIHSTd1Bod+wonfxvZ0Fvm+9rTdJuiiv0/HYZ8Bf9C
	gDWvpqpLT2yeZn7IwhwIWac91DiCfYF7y/d3A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=ruRlM8LuU8hKbGHcklyfYT6v5M7VIoDzrilTxHFp+U6Rc3KgtCKjeAXHbtZU/QtHcA
	/YZy3LQgnTNclhR6la54rBiVVC+TXAZkpLRmyN5m0uAIE3BQ6of/fgtQ1fI60cq89tJ5
	NVdCjZXt9dQQKzJOUwCAeVvCWX1UztCF3DwAM=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.217.130 with SMTP id hm2mr2727718qcb.59.1269382779238; 
	Tue, 23 Mar 2010 15:19:39 -0700 (PDT)
In-Reply-To: <20100323204511.GA12446@gmail.com>
References: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com> 
	<20100323094757.GE21210@jama> <20100323204511.GA12446@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Mar 2010 15:19:19 -0700
X-Google-Sender-Auth: 2613675460047b7a
Message-ID: <b6ebd0a51003231519v7818d8bjdf749c712f58f0ae@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.195
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
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
X-List-Received-Date: Tue, 23 Mar 2010 22:22:50 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 23, 2010 at 1:45 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On (23/03/10 10:47), Martin Jansa wrote:
> > On Mon, Mar 22, 2010 at 03:26:53PM -0700, Chris Larson wrote:
> > > Greetings all,
> > >
> > > Thoughts? Questions? Concerns?  I've been wondering if this is really
> > > worthwhile, but I think it is.  I think there is value in keeping old
> > > versions around, but this allows us to avoid cluttering up the
> repository as
> > > much, and makes it so that one change to a recipe can affect all the
> > > versions in that range by default, or all versions, rather than just
> the one
> > > version you tested.  Of course, ideally you'd test all versions, but
> that's
> > > the case today too, its just that now our recipes get bitrotted
> instead.
> > >  Personally, I'd rather see the old version content continue to be
> brought
> > > forward by default, and if it fails to build with that, we fix it, but
> it's
> > > easier to fix a build than to unclutter the repository.
> > >
> > > I'm hoping to get some input on this :)
>
> I think it could be an useful experiment as an option for packages which
> dont change so much as the releases progress. However adding stuff to build
> for multiple version in same recipe can be error prone. I have seen this
> happening with changes made to .inc files when other recipes break
> silently.
>
> Currently we have per version recipes (roughly) which gives a playground
> for a given version one can do customization fairly easily and they are
> contained.
>
> If I make change to a given version the recipe will also affect other
> versions even if nothing of interest was done for those versions due to say
> PR bump isnt it ?
>
> I think moving bitrotted recipes to different location is probably also a
> good
> way to speed up parsing time for general users without changing the bb
> files too much.
>
> Recently asking new users about bitbake they were pretty much confused with
> syntax I think this will add to it.


Well, as I said previously in the thread, I personally think it's a better
idea to have the old recipes brought forward with current developments, even
if it breaks other versions, than let the other recipes rot and never pick
up those fixes.  This is the dev branch, shit breaks, it happens.  That
said, you can still constrain a change to a single version with this feature
used, by using the version override.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

