Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id C10CF60884
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Oct 2014 21:47:03 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id tp5so3600057ieb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Oct 2014 14:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=stvAT/1MPqRf1Bq5jSs8QQJg4NIUqXB/P0hy1vXk0dQ=;
	b=Pv5wrGg2rrEp96AQGBxOUr/HgkJp7qMUaVxpOCc6TD+lfUJbvJ6fhh5FefRIAzmEez
	EWq0ry77Q5dbGBgGDnMOOCgpYR0H4RIpApS7+f8kF8MAZ0Uu9JSupY+z8O3Aj4U9LNGr
	SSLzfLFBChSlSxCIE1yhvOfmRDj/O8s7gKmPdYRFaZFJYgOIU2Gv0JBmNqyLknQCI58d
	ec50af6XdkQAFXhRtZsupaVvOngJVlr0Dn4A/H2vvwgHWsvNwJhjXMiDD6Ge22FyF+to
	9p8wMXSrxGQ6o4Avwxc6St9o2WXzzeQgNrdxY+yMQ/0msU/BIwv4wuly4uc+eMWYgAU+
	P1xw==
MIME-Version: 1.0
X-Received: by 10.42.147.135 with SMTP id n7mr22387951icv.25.1413755222811;
	Sun, 19 Oct 2014 14:47:02 -0700 (PDT)
Received: by 10.50.169.2 with HTTP; Sun, 19 Oct 2014 14:47:02 -0700 (PDT)
In-Reply-To: <CANyK_8fqqURrOJ9F3dB-VyfENrnEFgE3kx5TRiApjE=CfFxLOw@mail.gmail.com>
References: <1413366811-1259-1-git-send-email-jackie.huang@windriver.com>
	<20141015103818.GP3000@jama>
	<CANyK_8e+OeoHRKN+nriKpQNRuekQBxH_7We9rtMrBQG=wqZ2=A@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AABD522EEC@ALA-MBB.corp.ad.wrs.com>
	<CANyK_8fqqURrOJ9F3dB-VyfENrnEFgE3kx5TRiApjE=CfFxLOw@mail.gmail.com>
Date: Sun, 19 Oct 2014 14:47:02 -0700
Message-ID: <CAMKF1soybjHLsfx-f6iK0UBANJgyWV=kq44Qz08-Jyr-NF0naw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] vim: add recipe for vim-tiny
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
X-List-Received-Date: Sun, 19 Oct 2014 21:47:05 -0000
Content-Type: text/plain; charset=UTF-8

On Thursday, October 16, 2014, Paul Barker <paul@paulbarker.me.uk> wrote:

> On 16 October 2014 04:27, Huang, Jie (Jackie)
> <Jackie.Huang@windriver.com <javascript:;>> wrote:
> >
> >
> >> -----Original Message-----
> >> From: openembedded-devel-bounces@lists.openembedded.org <javascript:;>
> [mailto:openembedded-devel- <javascript:;>
> >> bounces@lists.openembedded.org <javascript:;>] On Behalf Of Paul Barker
> >> Sent: Thursday, October 16, 2014 1:45 AM
> >> To: OE Devel
> >> Subject: Re: [oe] [meta-oe][PATCH] vim: add recipe for vim-tiny
> >>
> >> On 15 October 2014 11:38, Martin Jansa <martin.jansa@gmail.com
> <javascript:;>> wrote:
> >> > On Wed, Oct 15, 2014 at 05:53:31AM -0400, jackie.huang@windriver.com
> <javascript:;> wrote:
> >> >> From: Jackie Huang <jackie.huang@windriver.com <javascript:;>>
> >> >>
> >> >> Changes:
> >> >> - split the vim recipe to two files
> >> >> - add bb for vim-tiny based on PACKAGECONFIG defined in .inc file
> >> >> - use trim_version to get VIMDIR
> >> >
> >> > If you really want to revert following 2 patches, then you need to
> >
> > Sorry that I didn't notice the 2 patches in the commit history.
> >
> >> > provide more justifications for your patch and also confirm that the
> >> > recipes don't stage conflicting files in sysroot anymore (I don't see
> >> > any change in recipe preventing that).
> >
> > In vim-tiny, there are only two files installed: the binary and the rc
> file,
> > and they are renamed to avoid the confliction:
> > $ find . -type f
> > ./bin/vim-tiny (it's vim in vim package)
> > ./usr/share/vim/virc (it's vimrc in vim package)
> >
>
> With just vim-tiny installed, the user should still be able to run
> 'vim' to start the program. We could make that an update-alternatives
> link, but then we'd have to rename the executable for vim proper and
> use update-alternatives there as well.
>
> I'd rather see both packages use the 'vim' executable name and set
> CONFLICTS/RCONFLICTS appropriately, unless there is a good reason a
> user would want both 'vim' and 'vim-tiny' installed together.
>
> >> >
> >>
> >> Agreed. There may be a use for having both vim and vim-tiny in a
> package feed, but I think we need a
> >
> > We have been using like this for a long time and it works fine when both
> vim and vim-tiny are installed.
> >
> >> better way of handling it than this.
> >
> > I don't insist on this way and will be happy if there is a better way to
> handle this. We usually define what
> > need to be installed in different packagegroups and images, for smaller
> image, we need vim-tiny, some
> > others need vim, I know we can change PACKAGECONFIG to get different
> vims, but it doesn't work in
> > packagegroup or image. And it seems more clear to user/customer if we
> use name like vim-tiny,
> > gvim/vim-gui, or user may complain that vim is not fully featured when
> they see vim is installed but actually
> > it is the one with tiny feature.
>
> I think this is a wider issue that may affect packages other than vim.
> I seem to recall the question of whether PACKAGECONFIG values can be
> set per image recipe being asked previously.


This would need lot more plumbing if you want this to be per image then you
have to rebuild the package per image too

>
> Is it possible to write a vim-tiny recipe without splitting vim.inc
> from vim_*.bb? Can vim-tiny just 'require vim_7.4.373.bb' and change
> PACKAGECONFIG and the do_install function?
>
> >
> >>
> >> This patch is difficult to fully review as it mixes conceptually
> different changes together. If this or
> >> something similar does go in after further discussion, it needs to be
> split up.
> >
> > Yeah, sorry for that, I will split it up if needed after further
> discussion here.
> >
> > Thanks,
> > Jackie
> >
>
> Cheers,
>
> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk <javascript:;>
> http://www.paulbarker.me.uk
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

