Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1ObwgS-0004hA-21
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 16:23:37 +0200
Received: by fxm12 with SMTP id 12so4370756fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 07:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=9ErSO0qLWdB1GraQSqe08ALfFCJ6/YWNgk3Ky0oZYeg=;
	b=rr46Ec89UvX5i2ze9gQ80H5cfUPCq1oR5tGh8CMoq1vkuTUdj75TzdgQFi+aPkjbvB
	1hVhIK/8VGd51b1mM/A28MKO6b3NMX6jICQonbPyqgm/c23PZGjcysjGQ5ZSqoZIflxX
	0L6ELrqme/JQ2LPlTiKtRM4eEQpKOzV2ENboA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=qPuhTUQPCGs5jR0gFzi7BLTYb4LWSrDvuQw2gcz41W/3qjKqNY9ocGQQrgdL1Vgeo+
	k2kKC0IQ643994qKaPK5pyVfzBBuDxjtpIhuel7CjICMdi+GW7E1Ou7vRU5yxQcH0bPL
	nQ+SLgFBLu5B7KWEZDu0QMjttKQikn2cVUEJs=
Received: by 10.86.52.2 with SMTP id z2mr865629fgz.27.1279808599191;
	Thu, 22 Jul 2010 07:23:19 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b36sm3338389faq.35.2010.07.22.07.23.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 22 Jul 2010 07:23:17 -0700 (PDT)
Date: Thu, 22 Jul 2010 16:24:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100722142412.GM2189@jama>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
	<1279787277.22581.1723.camel@rex>
	<AANLkTint4kG2YG64KWLiVvgikkoE0jw1U0BmNsz36txU@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTint4kG2YG64KWLiVvgikkoE0jw1U0BmNsz36txU@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/4][RFC] Remove CROSS_DIR, install cross-packages into native sysroot
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
X-List-Received-Date: Thu, 22 Jul 2010 14:23:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 22, 2010 at 07:02:26AM -0700, Chris Larson wrote:
> On Thu, Jul 22, 2010 at 1:27 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> 
> > On Wed, 2010-07-21 at 11:04 -0700, Khem Raj wrote:
> > > The following 4 patches are based on  Jushua's work in poky to get rid of
> > > cross dir and install the toolchain in  native sysroot.
> > >
> > > I have done native-sdk-builds for uclibc and eglibc. It could build the
> > images
> > > and the images booted fine in qemu on mips and arm.
> > >
> > > I would  appreciate if someone could lend a hand in testing these patches
> > >
> > > And as we have changed tmpdir layout with this patch I have also bumped
> > ABI
> > > which means tmp has to be nuked before you try these patches.
> > >
> > > Please review/ack/nack
> >
> > Thanks for looking at this, its something I've wanted to get to for a
> > while but haven't managed so far. Consider this an ack from me!
> 
> 
> Ack from me too, test builds work fine, this is a lovely change we've been
> wanting to see for a while now, nicely done pulling it over from the poky
> bits.

SHR/om-gta02
Angstrom/spitz

also built ok here, thanks!

I guess that it would be difficult/dangerous to try to keep backward
compatiblity and move it without abi_version change (as
staging->sysroots was), right? But I'm OK with rebuilding.

For whole patchset:
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


