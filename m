Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1TeVSC-0003Wq-D9
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 19:36:51 +0100
Received: by mail-we0-f175.google.com with SMTP id z53so231406wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 10:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=jK3gqb3+AcpC68qKpcaL0vwX5WFU/FT69ZwbQQoXC/c=;
	b=k6gdFLRq34IaQ3AUECTjlXX6nJToAJzMjTRuTuEvmn52Rfcxbcvz0DbeyaBHQG2MKU
	UZmx0v82VaiApJhTEePWrbxRZxwFLFkQCLu5/n6tNmLqXBR3Yist7f7Wulttf3gZnDv3
	TZh7XjEl844ExtCiB1SGJa4VtQNdiBteHgmQhdfwuw6u0CTiI0Z7porQ8bKz3lw9kIWw
	hE5jxldcqK4frAPt65D1cwDAM0VyME9c9niw22DUQ4y4YI5OU836HxJgcfCiKjiwiKfW
	4XST7YNPvZgA0Udbv0tltuzFrZ+sHGkUY4V0LqSFu/ebt3KKe9vALxZhfzwysPaGQKy7
	ghmw==
MIME-Version: 1.0
Received: by 10.216.197.66 with SMTP id s44mr819771wen.3.1354299751149; Fri,
	30 Nov 2012 10:22:31 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.24.140 with HTTP; Fri, 30 Nov 2012 10:22:31 -0800 (PST)
In-Reply-To: <CALbNGRRdcaOXoXJcswP6PO7ivsmdCL0f6hEE86GDMnyx7+r=wA@mail.gmail.com>
References: <CAPOJ94OVOe=fP-8cgCdDFGFEJskce4G=DMcTR6a-JDM9QHJg0w@mail.gmail.com>
	<CALbNGRRqj6NvBxqB+EGcLcFd9CcNKKnSNZmJHM8f=BA-biF3dg@mail.gmail.com>
	<CAPOJ94NZvsiBoMemWPFdBUQtqQzH2rrkq9eP5hQGpB8amY4U2g@mail.gmail.com>
	<CALbNGRSXeE0UvpsZqijRRg1nRW4XFe+52Zoz6kX6wX_QSuDM+Q@mail.gmail.com>
	<CALbNGRRBstvSuMr3jPaNvnggN+TdigApJ=EyxCWeHEdg4tdgbw@mail.gmail.com>
	<CALbNGRRdcaOXoXJcswP6PO7ivsmdCL0f6hEE86GDMnyx7+r=wA@mail.gmail.com>
Date: Fri, 30 Nov 2012 12:22:31 -0600
X-Google-Sender-Auth: wVykb9L3FMK_BXqCYxtrQ2uCA2Q
Message-ID: <CAPOJ94MSTcpaoTQBSqJNAs2T=oKm6WYqPFKMC=DrO7rgPO3Kxg@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gphoto2: fix gettext build error
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
X-List-Received-Date: Fri, 30 Nov 2012 18:36:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 30, 2012 at 11:50 AM, Andreas M=FCller <
schnitzeltony@googlemail.com> wrote:

> On Fri, Nov 30, 2012 at 6:45 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > On Fri, Nov 30, 2012 at 6:17 PM, Andreas M=FCller
> > <schnitzeltony@googlemail.com> wrote:
> >>> gettext 0.18.1 is installed both on the build machine, and as a nativ=
e
> >>> package used when building under bitbake.  If it's at all relevant, I
> have
> >>> LANG=3Den_US.UTF-8 in the environment in which bitbake is executed.
> >>>
> >>> Did you try a full reversion of 5febf70?  Can you tell why, in your
> >>> environment, autotools.bbclass replaces the Makefile.in.in for
> libgphoto2?
> >>> It does not do this for me (otherwise I think Koen's patch that only
> reverts
> >>> part of 5febf70 would not work).
> >>>
> >>> Peter
> >>>
> >> It should copy see autotools.bbclass line 195
> >>
> >> Andreas
> > Peter
> >
> > One stupid question: Are you working with oe-core master - because
> >
> > commit 841ea3c1c18e50e77fccbd5f44d6a79a50913b67
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Thu Oct 11 08:43:01 2012 +0000
> >
> > which started my gphoto2 trouble is not found in danny
>

Yes, seems to be a danny/master inconsistency, resulting from oe-core
branching danny six weeks before meta-openembedded did, with my checkouts
happening between the two points.

So from what I can see now is that meta-oe's
>
> commit 92e3f684d14fd287194e78bc5e65f80504758b7d
> Author: Koen Kooi <koen@dominion.thruhere.net>
> Date:   Wed Nov 21 14:42:02 2012 +0000
>
>     gphoto2: fix gettext build error
>
>     Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>
> should be merged to danny and reverted (with PRbump) in master.
>

I think 5febf70 should be reverted (with PR bump) in danny, which is where
I'd started before I noticed 92e3f68 in patchwork.  In any case 92e3f68
should be discarded since it leaves the removal of AM_PO_SUBDIRS() from
configure.ac in place with no motivation once the Makefile.in.in is no
longer overwritten.

If that seems plausible I'll prepare a patch.

Peter

