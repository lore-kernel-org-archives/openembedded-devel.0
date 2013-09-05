Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 97CA161604
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 09:13:08 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id r10so1553603pdi.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 02:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=1FpTzB2LmauUWzIi6iyq/7aMreGGHe4gI7DtzhtOURQ=;
	b=NE2oYcUbYRwHzQXrF5LZt1EMdQpb5XZqBYhtD8xmSoILohD1LKv83nMkSYsbnnFA+W
	JGzYIBJggQR901zK3DvlT+kHBGWRGKJj4mRLgee5AksN6xeFkXzx/uOrvIlFTiMl1938
	fXSh+hd/cjj2IOnk2wgswt+v3l6cNjPRTZTgUtvSSakZZRn/G7DL0ncTCDVKxyDxRBWN
	MMpQJmeWbeCW7gbzKif722y26Wtcz3edw3/i7lIZ52wOlpCWNfB0wau60HQ1Agr6vknO
	jCgsFrLuGQ4K/4KIdYJJEVSqyzS2xvJOGqpqv6kJc8/H9c/gPiLWCFxd/IPSnsAQmboJ
	kQIQ==
X-Gm-Message-State: ALoCoQksmrn2Vk1LdFoyGu/Q6FByAqR8tBVFO/iDnHcIPWaOvuIo+9IVwTjLunq02EXbH7AInHKI
MIME-Version: 1.0
X-Received: by 10.68.182.225 with SMTP id eh1mr7925104pbc.172.1378372390549;
	Thu, 05 Sep 2013 02:13:10 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Thu, 5 Sep 2013 02:13:10 -0700 (PDT)
In-Reply-To: <CAJTo0LYA4pa_xSQe=PL9eYXfEr3rULSd7nJGSNLnoJKYEX_uMw@mail.gmail.com>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<20130904211411.GR3761@deserted.net>
	<CADkTA4PbVB2X9abGFMKsAt6NRaZxnZa1GK86e3L+=CGzNfswdA@mail.gmail.com>
	<CAJTo0LYA4pa_xSQe=PL9eYXfEr3rULSd7nJGSNLnoJKYEX_uMw@mail.gmail.com>
Date: Thu, 5 Sep 2013 10:13:10 +0100
X-Google-Sender-Auth: hXXpYQbnZEZpIsteuVEwngXCkpM
Message-ID: <CAOMwXhNruxN=K=h0vrrZa6vFgFYufwLr9tF7gYsQNzXsOsnULA@mail.gmail.com>
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
X-List-Received-Date: Thu, 05 Sep 2013 09:13:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 5, 2013 at 10:01 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 5 September 2013 05:39, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> > The meta-virt recipe had the same _1.0.bb extension, and it's SRCREV
> lines up
> > with the openflow-1.0.0 tag in the repository:
> >
> > --------
> >
> > commit 5ccca75a69f99791659bcfbcf35353ab1921320a
> > Author: Glen Gibb <grg@stanford.edu>
> > Date:   Thu Dec 31 16:00:53 2009 -0800
> >
> >     docs: Update ChangeLog to include 1.0.0 information
> >
> > :100644 100644 2f13dd7... aa0e92e... M  ChangeLog
> >
> > -------
> >
> > So it's definitely an option to keep that recipe around as the tagged
> 1.0, and
> > create a _git that tracks newer changes (where "newer" is relative, 2011
> is
> > the latest commit in that repo).
>
> FWIW, I massively prefer "releases that are taken from git" like this
> (where its a git fetch on a hash that is the tag of the releases) to
> be versioned correctly like _1.0.bb instead of _git.bb for clarity and
> future alternatives such as true git snapshot or multiple versions.
>

... and I massively prefer "released not to be taken from git". So if 1.0
has to be *really* supported which I do not think so, it should get the
release tarball.

Moreover, there have not been new git commits for about two years now
because the standard was taken over by a different organization which seems
to work behind the scenes. Too bad, they have not released the latest
before that change. Hopefully, this will not mislead anyone that this
software is still actively developed in public.

That is another very reason IMHO which it would not fit the core layer at
all.

-- Laszlo


>
> Ross
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

