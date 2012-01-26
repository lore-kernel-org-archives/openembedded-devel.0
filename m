Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RqRkW-0001iU-Ho
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 17:00:33 +0100
Received: by mail-vx0-f175.google.com with SMTP id fk26so487830vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2012 07:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=bdx0dzD6FE87thugkwcERQDGkl9xgZu1ORhXXIds4o0=;
	b=k7gnTfoMGuEKGWUYj/009N+XNSvCVQAZXsq4x68FZ9S06YeamrP+2wLss5cTiDxdQd
	18FUODYTK57MFvvElsiyXZgY/CWMn1RHdXsVzqgrgKUFU4g0rkN4LJ/AlsPawdC+k1Er
	qEKfBIu9YZcQDTJUfdDEH5//hYwSwZDGqp7p4=
MIME-Version: 1.0
Received: by 10.220.156.201 with SMTP id y9mr1452050vcw.22.1327589152718; Thu,
	26 Jan 2012 06:45:52 -0800 (PST)
Received: by 10.52.67.171 with HTTP; Thu, 26 Jan 2012 06:45:52 -0800 (PST)
In-Reply-To: <20120126090245.GB3747@jama.jama.net>
References: <1592899.mTy93uB97i@helios> <4F20130D.2010208@balister.org>
	<1908796.glHMrEiIxU@helios> <4F202735.8040405@balister.org>
	<CACW_hTYpQHcHT3YoN=-G1FFu2-KiUu_FOfkdEPk4P7wMNQEZZw@mail.gmail.com>
	<20120126090245.GB3747@jama.jama.net>
Date: Thu, 26 Jan 2012 15:45:52 +0100
Message-ID: <CACW_hTaYzG9zF+SSWpBFWxQyNMciQqk2zSQ9KJpo+4xc8_H5KQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Splitting meta-oe
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
X-List-Received-Date: Thu, 26 Jan 2012 16:00:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

2012/1/26 Martin Jansa <martin.jansa@gmail.com>

> On Wed, Jan 25, 2012 at 06:33:13PM +0100, Frans Meulenbroeks wrote:
> > I like the idea of putting toolchains in a layer.
> >
> > Wrt DP = -1:
> > I feel if a recipe needs DP = -1 it is not good enough to be added to
> > meta-oe. Probably it is more something for an unstable layer.
> > (and DP = -1 encourages the growth of deadwood; I still recall in OE that
> > there were some recipes that had the last 3 or 4 versions all with DP =
> -1;
> > let's try to avoid this in oe-core/meta-oe)
>
> I'm not proposing to stash multiple versions of same recipe with D_P in
> same layer.
>
> What I'm missing is use-case when for example with libsoup-2.4 I'm
> adding unstable version, because actually webkit-efl has random runtime
> crashes with stable version, but works better with unstable one.
>
> So I want to be able to add recipe with D_P = -1 which would say, that
> this recipe is not used unless someone really wants and adds P_V to his
> layer to get it (I guess people using browsers based on webkit-efl).
>
> But right now it will pick this unstable version from meta-oe by default
> and you have to add P_V for that stable version in oe-core (and keep it
> up2date as long as stable version in oe-core is updated).
>
> And I guess the same use-case D_P should be used for all "not so well
> tested" or "deprecated" recipes in meta-oe or any other layer.
>
> Even if there is meta-deprecated layer.. I guess nobody would prefer all
> deprecated recipes, but just some of them (ideally by pinning them with
> P_V).
>
>
> HI Martin,

I understand your reasoning.
My main concerns are:
- you might end up with lots of versions and no one knows that is actually
used (so it is difficult to clean it). We saw this in oe classic
- generally the reasons why a recipe has DP -1 are unclear. How would Joe
Average know that if he is using webkit-efl he is better off using this new
libsoup recipe?
- and if a recipe is not well enough tested it should probably not end up
in meta-oe anyway (but better e.g. in meta-oe-next or meta-oe-new or
whatever you want to call the super bleeding edge version)

Best regards, Frans.

