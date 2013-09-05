Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0188D615BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:07:15 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fa1so1891258pad.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 06:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=ATkcHwChJp6dLTGfy51OjaWFIzxloLKSNd6Zp6TNKnw=;
	b=cqHsXpehYJFUCVOS2MH/1EziaKpSUWylojI2HgZ8NA/7VUnqpcksntfCbADrm7dlcT
	P/L+NCpe26r7mm+cjnEvzg9bZBn7zPZkeAFx3qHcxwQ9QCqE7md0O6axEBzRZiP1QaIf
	gFXbnewYAogmQwkKi2uYvU71d+Z53ugYx/TVwLyEq/XVVsdraUY8EKvdcZgqJI+zi85S
	+yVfyQn5pwBR6XPbaTTJSbTzeZlTQ0v85dnznTSTzOuArV/7JL1emiXLSQmVzv54WQd0
	m3PF/9Wj7h1yj3oKlffsFbB63qT5kFZwaF5NqKyHE1nleh81kvC9x5fIqWk8kM8k42sy
	+aNQ==
X-Gm-Message-State: ALoCoQk7eisBH8PwSFmGyCmKfSrMcDqG940hOfl+rUicbbCNTskPTxOfi4lWPXVU6N3fTIueWPfC
MIME-Version: 1.0
X-Received: by 10.68.224.161 with SMTP id rd1mr9161431pbc.121.1378386438121;
	Thu, 05 Sep 2013 06:07:18 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Thu, 5 Sep 2013 06:07:18 -0700 (PDT)
In-Reply-To: <20130905130413.GF5086@deserted.net>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<20130904211411.GR3761@deserted.net>
	<CADkTA4PbVB2X9abGFMKsAt6NRaZxnZa1GK86e3L+=CGzNfswdA@mail.gmail.com>
	<CAJTo0LYA4pa_xSQe=PL9eYXfEr3rULSd7nJGSNLnoJKYEX_uMw@mail.gmail.com>
	<20130905130413.GF5086@deserted.net>
Date: Thu, 5 Sep 2013 14:07:18 +0100
X-Google-Sender-Auth: Dworgx0Yrq29QBv5Dzlnv3rh2G4
Message-ID: <CAOMwXhN=cQsScOTywW0bK+b0k_Ri8j6xjb6imCVAnfw3Xiappw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] openflow: Add latest from git
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2013 13:07:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

I still do not follow why you are not waiting patiently for an update. I
have already written that I would send one soon (this thread demoralized me
and "motivated" though for a bit of delay).

All the discussion would have been spared in here, as the issues were
addressed before I even sent the wrong version.

How about reviewing other pending changes for weeks like stunnel?


On Thu, Sep 5, 2013 at 2:04 PM, Joe MacDonald <joe@deserted.net> wrote:

> [Re: [oe] [meta-networking][PATCH] openflow: Add latest from git] On
> 13.09.05 (Thu 10:01) Burton, Ross wrote:
>
> > On 5 September 2013 05:39, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> > > The meta-virt recipe had the same _1.0.bb extension, and it's SRCREV
> lines up
> > > with the openflow-1.0.0 tag in the repository:
> > >
> > > --------
> > >
> > > commit 5ccca75a69f99791659bcfbcf35353ab1921320a
> > > Author: Glen Gibb <grg@stanford.edu>
> > > Date:   Thu Dec 31 16:00:53 2009 -0800
> > >
> > >     docs: Update ChangeLog to include 1.0.0 information
> > >
> > > :100644 100644 2f13dd7... aa0e92e... M  ChangeLog
> > >
> > > -------
> > >
> > > So it's definitely an option to keep that recipe around as the tagged
> 1.0, and
> > > create a _git that tracks newer changes (where "newer" is relative,
> 2011 is
> > > the latest commit in that repo).
> >
> > FWIW, I massively prefer "releases that are taken from git" like this
> > (where its a git fetch on a hash that is the tag of the releases) to
> > be versioned correctly like _1.0.bb instead of _git.bb for clarity and
> > future alternatives such as true git snapshot or multiple versions.
>
> Yeah, since the SRCREV in the _1.0.bb recipe actually corresponds to the
> 1.0 release tag, I'm in agreement.  The proposed update from Laszlo also
> now seems to justify having a _git.bb version, since it's pointing at a
> (relatively) newer version of the recipe.
>
> --
> -Joe MacDonald.
> :wq
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

